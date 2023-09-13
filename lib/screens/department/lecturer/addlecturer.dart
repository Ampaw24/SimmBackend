import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lecturer Details',
      home: LecturerForm(),
    );
  }
}

class LecturerForm extends StatefulWidget {
  @override
  _LecturerFormState createState() => _LecturerFormState();
}

class _LecturerFormState extends State<LecturerForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  String _name = '';
  String _gender = 'Male';
  String _educationSpecialization = '';

  // Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform some action (e.g., save data)
      print('Name: $_name');
      print('Gender: $_gender');
      print('Education Specialization: $_educationSpecialization');
      print('Date of Birth: ${_dateController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lecturer Details Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Text('Gender: '),
                  Radio<String>(
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  Text('Male'),
                  Radio<String>(
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  Text('Female'),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Education Specialization'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your education specialization';
                  }
                  return null;
                },
                onSaved: (value) {
                  _educationSpecialization = value!;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (selectedDate != null) {
                        _dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                      }
                    },
                  ),
                ),
                controller: _dateController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please select your date of birth';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
