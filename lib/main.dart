// main.dart
import 'package:flutter/material.dart';
import 'package:untitled2/database_helper/database_helper.dart';
import 'screen/listshow.dart';
import 'screen/add_student.dart';
import 'screen/teacher_add_student.dart';

// sqflite: ^2.0.0
// path: ^1.8.0

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //call myapp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      title: 'Kindacode.com',
      // retun home claa
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //build Home Screen App Bar
      appBar: AppBar(
        actions: [
          IconButton(
            //call the add student screen
            onPressed: () async {
              var result = await Navigator.push(context,MaterialPageRoute(builder: (context) => TeacherStudentScreen(),fullscreenDialog: true));
              if(result == "success"){
                setState(() {

                });
              }
              },
              icon: Icon(Icons.add))
        ],
        title: const Text('Student Lists'),
      ),
      // sql data show in listview call Home Screen
      body: HomeScreen(),
      //Write Home Screen to delete all data
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () async {
          var res = await DatabaseHelper().delete();
          print("All Deleted");
          setState(() {

          });
        },
      ),
    );
  }
}
