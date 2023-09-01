import 'package:flutter/material.dart';
import 'package:newfigma/core/constant/color.dart';

class AddressEntryPage extends StatefulWidget {
  @override
  State<AddressEntryPage> createState() => _AddressEntryPageState();
}

class _AddressEntryPageState extends State<AddressEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 2,
        leading: BackButton(color: ColorConstant.black),
        backgroundColor: Colors.white,
        title: Text('Enter Address Details',style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter your address details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
             SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Postal Code',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Mobile No.',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Alternate Mobile No.',
                border: OutlineInputBorder(),
              ),
            ),
            
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Process the entered address data here
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

