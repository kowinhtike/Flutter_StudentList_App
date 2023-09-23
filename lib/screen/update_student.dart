import 'package:flutter/material.dart';
import 'package:untitled2/database_helper/database_helper.dart';
import 'package:untitled2/model/student.dart';

class UpdateStudent extends StatefulWidget {
  final int id;
  final String name;
  final String address;
  final String phone;
  final String email;

  UpdateStudent(
      {required this.id,
      required this.name,
      required this.address,
      required this.phone,
      required this.email}) {}

  @override
  State<UpdateStudent> createState() => _UpdateStudentState(
      id: id, name: name, address: address, phone: phone, email: email);
}

class _UpdateStudentState extends State<UpdateStudent> {
  GlobalKey<FormState> _key = GlobalKey();

  int? id;
  String? name, address, email, phone;

  _UpdateStudentState(
      {required this.id,
      required this.name,
      required this.address,
      required this.phone,
      required this.email}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Data"),
      ),
      body: Form(
        key: _key,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const Text("Name"),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (str) {
                if (str == null || str.isEmpty) {
                  return "Please Enter Name";
                }
                return null;
              },
              onSaved: (str) {
                name = str;
              },
              initialValue: name,
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
              validator: (str) {
                if (str == null || str.isEmpty) {
                  return "Please Enter Address";
                }
                return null;
              },
              onSaved: (str) {
                address = str;
              },
              initialValue: address,
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
              validator: (str) {
                if (str == null || str.isEmpty) {
                  return "Please Enter Phone";
                }
                return null;
              },
              onSaved: (str) {
                phone = str;
              },
              initialValue: phone,
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
              validator: (str) {
                if (str == null || str.isEmpty) {
                  return "Please Enter Email";
                }
                return null;
              },
              onSaved: (str) {
                email = str;
              },
              initialValue: email,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Enter Email",
                  border: OutlineInputBorder()),
            ),
            ElevatedButton.icon(
                onPressed: () async {
                  if (_key.currentState != null &&
                      _key.currentState!.validate()) {
                    _key.currentState!.save();
                    int res = await DatabaseHelper().updateStudent(
                        Student.insertStudent(
                            name: name ?? '',
                            address: address ?? '',
                            phone: phone ?? '',
                            email: email ?? ''),
                        id ?? 0);
                    print(res);
                    Navigator.pop(context, "success");
                  }
                },
                icon: const Icon(Icons.edit),
                label: const Text("Confrim")),
          ],
        ),
      ),
    );
  }
}
