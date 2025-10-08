import 'package:flutter/material.dart';

void main() {
  runApp(mainApp());
}
class mainApp extends StatefulWidget {

  @override
  State<mainApp> createState() => _mainAppState();
}

class _mainAppState extends State<mainApp> {
  String DisplayText = "No Text Data";
  List<String>taskList = [];
  TextEditingController textController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo List App"),
          backgroundColor: Colors.blue,
          centerTitle: false,
        ),
        body: Column(
          children: [
            Row(
              children: [
            Expanded(child: Container(
              padding: EdgeInsets.all(10),
              child: 
                  TextField(
                    controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Enter a Task")
              ),
            ) 
            ),),
            MaterialButton(
              color: Colors.white,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
                setState(() {
                 

                  taskList.add(textController.text);
                  textController.clear();
                });
              }, child: Text("Add"),),
              ],
            ),
             
            Flexible(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index){
                return Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child:Text(taskList[index]) ,
                    ),
                  ),
                
                  MaterialButton(
                  
                    child: Icon(Icons.delete, color: Colors.red, ),
                    onPressed: () {
                      setState(() {
                        taskList.removeAt(index);
                      });
                    }
                    )
                ],
              );
              }),
            ),
              
          ],
        ),
      ),
    );
  }
}