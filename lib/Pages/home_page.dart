import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required bool taskCompleted});

  @override
  State<HomePage> createState() => _HomePageState();
}

final _controller = TextEditingController();


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

  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteFunction(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        title: Text('To do'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                    bottom: 0,
                  ),
                  child: Slidable(
                    endActionPane: ActionPane(motion: StretchMotion(), children: [
                      SlidableAction(onPressed: (context) => deleteFunction(index),
                      icon: Icons.delete,
                      borderRadius: BorderRadius.circular(15),
                        
                      ),
                    ]),
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
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
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Add a new task',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveNewTask,
        child: Icon(Icons.add),
      ),
    );
  }
}