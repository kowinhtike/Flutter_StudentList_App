// main.dart
import 'package:flutter/material.dart';
import 'package:untitled2/database_helper/database_helper.dart';
import 'package:untitled2/screen/update_student.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //return sql list data
    return FutureBuilder<List<Map>>(
      //connect Future function in DataHelper Class
      future: DatabaseHelper().getAllStudents(),
      //build list data
      builder: (context, snapsshot) {
        //check the snapshot data
        if (snapsshot.hasData) {
          print(snapsshot.data?.length);
          return ListView.builder(
              //get the item according to the length of the data
              itemCount: snapsshot.data?.length ?? 0,
              //build list item
              itemBuilder: (context, index) {
                //create the student map data object
                Map? student = snapsshot.data?[index];
                //return as card
                return Card(
                  child: Column(
                    children: [
                      //for show the indes position
                      CircleAvatar(
                        radius: 10,
                        child: Text(index.toString(),style: TextStyle(color: Colors.white),),
                        backgroundColor: Colors.grey,
                      ),
                      // first list title to show name
                      ListTile(
                          leading: Icon(Icons.person),
                          title: Text("Name"),
                          subtitle: Text(student?['name']),
                          trailing: IconButton(
                            onPressed: () async {
                              var result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdateStudent(
                                          id: student?['id'],
                                          name: student?['name'],
                                          address: student?['address'],
                                          phone: student?['phone'],
                                          email: student?['email'])));
                              if (result == "success") {
                                setState(() {});
                              }
                            },
                            icon: Icon(Icons.edit,color: Colors.blue),
                          )),
                      //second list title to show address
                      ListTile(
                          leading: Icon(Icons.location_city),
                          title: Text("Address"),
                          subtitle: Text(student?['address']),
                          trailing: IconButton(
                            onPressed: () async {
                              var res = await DatabaseHelper()
                                  .deleteStudent(student?["id"]);
                              print(res);
                              setState(() {});
                            },
                            icon: Icon(Icons.delete,color: Colors.red,),
                          )),
                      //third list title to show phone
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text("Phone"),
                        subtitle: Text(student?['phone']),
                      ),
                      //four list title to show email
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text("Email"),
                        subtitle: Text(student?['email']),
                      )
                    ],
                  ),
                );
              });
        } else if (snapsshot.hasError) {
          //return error state
          return Text(snapsshot.error.toString());
        } else {
          // start to show circular progress bar before reach data
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
