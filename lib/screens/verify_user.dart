import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  String _idType = '';
  String _idNumber = '';
  XFile? _idImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DropdownButtonFormField(
              items: [
                DropdownMenuItem(
                  child: Text('UMID'),
                  value: 'UMID',
                ),
                DropdownMenuItem(
                  child: Text('Employee’s ID'),
                  value: 'Employee',
                ),
                DropdownMenuItem(
                  child: Text('Driver’s License'),
                  value: 'Drivers',
                ),
                DropdownMenuItem(
                  child: Text('Professional Regulation Commission (PRC) ID'),
                  value: 'PRC',
                ),
                DropdownMenuItem(
                  child: Text('Passport'),
                  value: 'Passport',
                ),
                DropdownMenuItem(
                  child: Text('Senior Citizen ID'),
                  value: 'Senior',
                ),
                DropdownMenuItem(
                  child: Text('SSS ID'),
                  value: 'SSS',
                ),
                DropdownMenuItem(
                  child: Text('Voter’s ID'),
                  value: 'Voters',
                ),
                DropdownMenuItem(
                  child: Text('Philippine Identification (PhilID / ePhilID)'),
                  value: 'PhilID',
                ),
                DropdownMenuItem(
                  child: Text('NBI Clearance'),
                  value: 'NBI',
                ),
                DropdownMenuItem(
                  child: Text('Integrated Bar of the Philippines (IBP) ID'),
                  value: 'IBP',
                ),
                DropdownMenuItem(
                  child: Text('Person’s With Disability (PWD) ID'),
                  value: 'PWD',
                ),
                DropdownMenuItem(
                  child: Text('Barangay ID'),
                  value: 'Barangay',
                ),
                DropdownMenuItem(
                  child: Text('Philippine Postal ID'),
                  value: 'Postal',
                ),
                DropdownMenuItem(
                  child: Text('Phil-health ID'),
                  value: 'Phil-health',
                ),
                DropdownMenuItem(
                  child: Text('School ID'),
                  value: 'School',
                ),
              ],
              onChanged: (value) => _idType = value!,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'ID Number',
              ),
              onChanged: (value) => _idNumber = value,
            ),
            Container(
              width: 200.0,
              height: 200.0,
              child: _idImage != null
                  ? Image.file(_idImage as File)
                  : IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        _chooseImage();
                      },
                    ),
              color: Colors.grey,
            ),
            Text(
              'Only photos 4mb and below are allowed.',
              style: TextStyle(color: Colors.red),
            ),
            MaterialButton(
              child: Text('Submit'),
              onPressed: () {
                // TODO: Submit the verification form.
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                    color: Color.fromARGB(255, 196, 94, 250), width: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _chooseImage();
  }

  void _chooseImage() async {
    ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _idImage = image as XFile?;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No image selected'),
        ),
      );
    }
  }
}
