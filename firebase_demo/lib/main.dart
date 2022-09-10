import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const form(),
    );
  }
}
class form extends StatefulWidget {
  const form({Key? key}) : super(key: key);
  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  final myController = TextEditingController();
  // TextEditingController _name=TextEditingController()
  @override
  void dispose(){
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  CollectionReference users=FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: myController,
              ),
            ),
            ElevatedButton(onPressed: (){
              printConsole();
            }, child: const Text("Upload value"))
          ],
        ),
      ),
    );
  }

  Future<void> printConsole() async {
    await users.add({'name':myController.text}).then((value) => print("Inputa data is"+myController.text));
  }

}

