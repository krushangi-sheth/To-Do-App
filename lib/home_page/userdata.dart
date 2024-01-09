import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DataFromAPI extends StatefulWidget{
  @override
  State<DataFromAPI> createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {

  Future getUserData() async {
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    var jsonData =jsonDecode(response.body);

    List<User> users = [];

    for(int i=0;i<jsonData.length;i++) {
      print(jsonData[i]);
      User user = User(jsonData[i]["title"].toString(), jsonData[i]["completed"].toString(), jsonData[i]["userId"].toString());
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Card(
          child: FutureBuilder(
          future: getUserData(),
          builder: (context, snapshot) {
            if(snapshot.data==null) {
              return Container(
                child: Center(
                  child: Text('Loading....'),
                ),
              );
            }else return ListView.builder(
                itemCount: snapshot.data.length , itemBuilder: (context , index){
              return ListTile(
                title: Text(snapshot.data[index].name),
                subtitle: Text(snapshot.data[index].username),
                trailing: Text(snapshot.data[index].email),
              );
            });
          },
          ),
        ),
      ),
      );
  }
}

class User {
  final String name, email, username;

  User(this.name, this.email, this.username);
}