import 'dart:math';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:rma_lv2/models/person_data.dart';
import 'package:rma_lv2/models/inspiring_person.dart';
import 'package:rma_lv2/screens/add_person_screen.dart';

class PersonTile extends StatelessWidget {
  final InspiringPerson person;

  PersonTile({this.person});

  String formatDateTime() {
    String birthDate = DateFormat('dd.MM.yyyy.').format(person.birthDate);
    String deathDate = person.deathDate != null
        ? DateFormat('dd.MM.yyyy.').format(person.deathDate)
        : 'present';

    return birthDate + ' - ' + deathDate;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPersonScreen(person: person),
            ),
          );
        },
        isThreeLine: true,
        leading: GestureDetector(
          onTap: () {
            Fluttertoast.showToast(
              msg: person.quotes[Random().nextInt(person.quotes.length)],
            );
          },
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: person.image,
          ),
        ),
        title: Text(person.name),
        subtitle: Text(formatDateTime() + '\n' + person.description),
        trailing: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Provider.of<PersonData>(context, listen: false)
                .deletePerson(person);
          },
        ),
      ),
    );
  }
}
