import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TextPage extends StatefulWidget{
  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              itemBuilder: (context) =>[
                PopupMenuItem(
                    child: Row(
                        children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                            "Edit",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ]

                    ))
              ]),
        ],

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'demo',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}