import 'dart:io';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'package:rma_lv2/models/inspiring_person.dart';
import 'package:rma_lv2/models/person_data.dart';

class AddPersonScreen extends StatelessWidget {
  final InspiringPerson person;
  final _formKey = GlobalKey<FormState>();
  final _deathFormKey = GlobalKey<FormState>();

  AddPersonScreen({Key key, this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    String newPersonName;
    String newPersonDescription;
    DateTime newPersonBirthDate;
    DateTime newPersonDeathDate;
    String newPersonQuote;
    Image newPersonImage = person != null ? person.image : null;

    Future<void> getImage() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        newPersonImage = Image.file(File(pickedFile.path), fit: BoxFit.cover);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('rma_lv2'),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.fromLTRB(20, 20, 20, bottom),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        initialValue: person != null ? person.name : null,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Name',
                        ),
                        onSaved: (newName) {
                          newPersonName = newName;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        initialValue:
                            person != null ? person.description : null,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Description',
                        ),
                        onSaved: (newDescription) {
                          newPersonDescription = newDescription;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        initialValue: person != null ? person.quotes[0] : null,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Quote',
                        ),
                        onSaved: (newQuote) {
                          newPersonQuote = newQuote;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      InputDatePickerFormField(
                        initialDate: person != null ? person.birthDate : null,
                        fieldLabelText: 'Birth Date',
                        firstDate: DateTime(1899),
                        lastDate: DateTime.now(),
                        onDateSaved: (newBirthDate) {
                          newPersonBirthDate = newBirthDate;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Form(
                  key: _deathFormKey,
                  child: InputDatePickerFormField(
                    initialDate: person != null ? person.deathDate : null,
                    fieldLabelText: 'Death Date',
                    firstDate: DateTime(1899),
                    lastDate: DateTime.now(),
                    onDateSaved: (newDeathDate) {
                      newPersonDeathDate = newDeathDate;
                    },
                  ),
                ),
                SizedBox(height: 25.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("Select image"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                      ),
                      onPressed: () {
                        getImage();
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text(person != null ? 'Update' : 'Add'),
                      onPressed: () {
                        _formKey.currentState.save();
                        _deathFormKey.currentState.save();

                        if (newPersonImage == null) {
                          Fluttertoast.showToast(msg: 'Please add image.');
                        } else if (_formKey.currentState.validate()) {
                          InspiringPerson newPerson = new InspiringPerson(
                            name: newPersonName,
                            description: newPersonDescription,
                            birthDate: newPersonBirthDate,
                            deathDate: newPersonDeathDate,
                            quotes: [newPersonQuote],
                            image: newPersonImage,
                          );

                          if (person == null) {
                            Provider.of<PersonData>(context, listen: false)
                                .addPerson(newPerson);
                          } else {
                            Provider.of<PersonData>(context, listen: false)
                                .updatePerson(person, newPerson);
                          }

                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
