import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Early Eyes',
            style: TextStyle(
              color: Color.fromRGBO(18, 122, 196, 1),
            ),
          ),
          backgroundColor: Color.fromRGBO(185, 247, 77, 1),
        ),
        backgroundColor: Color.fromRGBO(185, 247, 77, 1),
        body: Center(
          child: Image(
            image: NetworkImage('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
            ),
        ),
        ),
      ),
  );
}
