import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
   List toDoList = [];

     //refrence our box
    final _myBox =Hive.box('mybox');

    //run this method if this is the first time ever opening this app
    void createInitialData() {
      toDoList =[
        ["New Task", false],
        ["New Task", false],
      ];
    }

    //load the data from the database
    void loadData(){
      toDoList = _myBox.get("TODOLIST");
    }

   //update the data
   void updateDataBase() {
     _myBox.put("TODOLIST",toDoList);
   }

}
