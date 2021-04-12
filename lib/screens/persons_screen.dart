import 'package:flutter/material.dart';

import 'package:rma_lv2/widgets/persons_list.dart';
import 'package:rma_lv2/screens/add_person_screen.dart';

class PersonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rma_lv2'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: PersonsList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPersonScreen(),
            ),
          );
        },
      ),
    );
  }
}
