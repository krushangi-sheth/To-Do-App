import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/database/database.dart';
import 'package:todolist/text_page.dart';
import 'dialog_box.dart';
import 'todo_tile.dart';


class HomePage extends StatefulWidget{

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //refernce the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();


  @override
  void initState() {

    if(_myBox.get("TODOLIST")== null) {
       db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }


//text controller
  final _controller =TextEditingController();


//checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
      setState(() {
        db.toDoList[index][1] = !db.toDoList[index][1];
      });
      db.updateDataBase();
    }


  //save new task
  void SaveNewTask() {

      setState(() {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateDataBase();
    }



//create new task
  void createNewTask(context) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogueBox(
          controller:
          _controller
        ,
        onSave: SaveNewTask,
        onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
   void _openTextPage() {
     Navigator.push(context, MaterialPageRoute(builder: (context){
       return TextPage();
     }));
   }

   
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],

        appBar: AppBar(
         actions: <Widget>[
           PopupMenuButton(
               itemBuilder: (context) =>[
                 PopupMenuItem(
                     child: Row(
                       children: [
                         SizedBox(
                           width: 10,
                         ),
                         Text(
                             "Select all",
                           style: TextStyle(
                             color: Colors.grey,
                           ),
                         ),
                       ],
                     ))
               ]),
         ],
          title: Text('To-dos'),
          elevation: 0,
          centerTitle: true,
        ),


        floatingActionButton: FloatingActionButton(
          onPressed: () => createNewTask(context),
          child: Icon(Icons.add),
        ),


        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: ListView.builder(
              itemCount:db.toDoList.length,
              itemBuilder: (context, index) {
                onPressed: () => _openTextPage();
                return ToDoTile(
                  taskName: db.toDoList[index][0],
                  taskCompleted: db.toDoList[index][1],
                  onChange: (value) => checkBoxChanged(value, index),
                  deleteFunction: (context) => deleteTask(index),
                );
              },
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TextPage(),
                  )
              );
            },
          ),
        ),
    );
  }
}


