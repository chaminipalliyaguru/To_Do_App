import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required bool taskCompleted});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    ['Do the assignment', false],
    ['Learn Flutter', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: Text('Simple Todo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 0,
            ),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: toDoList[index][1],
                    onChanged: (value) => checkBoxChanged(index),
                  ),
                  Text(
                    toDoList[index][0],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
