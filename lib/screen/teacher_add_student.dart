import 'package:flutter/material.dart';
import 'package:untitled2/database_helper/database_helper.dart';
import 'package:untitled2/model/student.dart';

class TeacherStudentScreen extends StatefulWidget {
  const TeacherStudentScreen({super.key});

  @override
  State<TeacherStudentScreen> createState() => _TeacherStudentScreenState();
}

class _TeacherStudentScreenState extends State<TeacherStudentScreen> {
  //call Form State
  GlobalKey<FormState> _key = GlobalKey();
  //set the new variable
  String? name,address,email,phone ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student"),
      ),
      body: Form(
        //set the form key
        key: _key,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const Text("Name"),
            const SizedBox(
              height: 20,
            ),
             TextFormField(
               //check empty state
               validator: (str){
                 if( str == null || str.isEmpty){
                   return "Please Enter Name";
                 }
                 return null;
               },
               //for work in save
               onSaved: (str){
                 name = str;
               },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Enter Name",
                  border: OutlineInputBorder()),
            ),
            const Text("Address:"),

            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (str){
                if( str == null || str.isEmpty){
                  return "Please Enter Address";
                }
                return null;
              },
              onSaved: (str){
                address = str;
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_city),
                  hintText: "Enter Address",
                  border: OutlineInputBorder()),
            ),
            const Text("Phone:"),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (str){
                if( str == null || str.isEmpty){
                  return "Please Enter Phone";
                }
                return null;
              },
              onSaved: (str){
                phone = str;
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  hintText: "Enter Phone Number",
                  border: OutlineInputBorder()),
            ),
            const Text("Email"),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (str){
                if( str == null || str.isEmpty){
                  return "Please Enter Email";
                }
                return null;
              },
              onSaved: (str){
                email = str;
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Enter Email",
                  border: OutlineInputBorder()),
            ),
            // submit button
            ElevatedButton.icon(

                onPressed: () async {
                  //check form data
                  if(_key.currentState != null && _key.currentState!.validate()){
                    // save form data
                    _key.currentState!.save();
                    //to add data
                    int res = await DatabaseHelper().insertStudent(Student.insertStudent(name: name ?? '', address: address ?? '', phone: phone ?? '', email: email ?? ''));
                    print(res);
                    //give success to main
                    Navigator.pop(context,"success");

                  }
                }, icon: const Icon(Icons.save), label: const Text("Save")),
          ],
        ),
      ),
    );
  }
}
