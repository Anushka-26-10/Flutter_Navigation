import 'package:assignment1/Assignment.dart';
import 'package:assignment1/Counter_app.dart';
import 'package:assignment1/grid_view_example.dart';
import 'package:assignment1/homepage.dart';
import 'package:assignment1/input_widgets.dart';
import 'package:assignment1/list_view_example.dart';
import 'package:assignment1/main.dart';
import 'package:flutter/material.dart';
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu'),backgroundColor: Colors.blue,),
      body: Center(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           // ElevatedButton(onPressed: (){
             // Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
           // }, child: Text('Go Home'),
            //),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ListViewExample(),),);
            }, child: Text('ListViewExample Page'),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>GridViewExample(),));
            }, child: Text('GridViewExample Page'),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CounterApp(),));
            }, child: Text('CounterApp Page'),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => InputWidgetsExample(),));
            }, child: Text('Input Widgets Page'),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => TodoPage(),));
            }, child: Text('Assignment Page'),
            ),
          ],
        ),
      ),
    );
  }
}
