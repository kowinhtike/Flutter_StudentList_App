import 'package:flutter/material.dart';
import 'package:untitled2/database_helper/database_helper.dart';

//coding by winhtike

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController forName = TextEditingController();
  TextEditingController forAddress = TextEditingController();
  TextEditingController forPhone = TextEditingController();
  TextEditingController forEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //call scaffold as a new page
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD Form"),
      ),
      //this is body
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextField(
              controller: forName,
              decoration: InputDecoration(
                  labelText: "Input Your Name", prefixIcon: Icon(Icons.add)),
            ),
            TextField(
              controller: forAddress,
              decoration: InputDecoration(
                  labelText: "Input Your Address",
                  prefixIcon: Icon(Icons.location_city)),
            ),
            TextField(
              controller: forPhone,
              decoration: InputDecoration(
                  labelText: "Input Your Phone", prefixIcon: Icon(Icons.call)),
            ),
            TextField(
              controller: forEmail,
              decoration: InputDecoration(
                  labelText: "Input Your Email", prefixIcon: Icon(Icons.email)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () async {
                DatabaseHelper dbHelp = DatabaseHelper();
                var result = await dbHelp.insertStudent({
                  'name': forName.text,
                  'address': forAddress.text,
                  'phone': forPhone.text,
                  'email': forEmail.text
                });
                print(result);
                Navigator.pop(context,"scuuess");
                
              },
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
