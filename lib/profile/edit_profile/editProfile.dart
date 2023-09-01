import 'package:flutter/material.dart';
import 'package:newfigma/core/constant/color.dart';

class ChangeDetailsPage extends StatefulWidget {
  @override
  _ChangeDetailsPageState createState() => _ChangeDetailsPageState();
}

class _ChangeDetailsPageState extends State<ChangeDetailsPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    
    _nameController.text = ""; 
    _emailController.text = ""; 
    _numberController.text = ""; 
    _usernameController.text = ""; 
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    
    String newName = _nameController.text;
    String newEmail = _emailController.text;
    String newNumber = _numberController.text;
    String newUsername = _usernameController.text;

   
    Future.delayed(Duration(seconds: 2), () {
      print("Updated user details: Name: $newName, Email: $newEmail, Number: $newNumber, Username: $newUsername");
      Navigator.pop(context); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorConstant.white,
       leading: BackButton(color: Colors.black),
       elevation:3,
        title: Text("Change Details",style: TextStyle(color: ColorConstant.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Name",labelStyle: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email",labelStyle: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _numberController,
              decoration: InputDecoration(labelText: "Number",labelStyle: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: "Username",labelStyle: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: _saveChanges,
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
