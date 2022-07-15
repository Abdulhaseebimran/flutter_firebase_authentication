import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Post extends StatelessWidget {
  const Post({Key? key, required Map<String, dynamic> data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
        ),
        width: 250,
        height: 250,
        child: Column(
          children: [
            Image.network("https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y2Fyc3xlbnwwfHwwfHw%3D&w=1000&q=80", width: 100, height: 100,),
            Text("This is a title"),
            Text("This is a description"),
          ],
        ),
      )
    );
  }
}