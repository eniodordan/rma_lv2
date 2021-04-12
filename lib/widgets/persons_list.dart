import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rma_lv2/models/person_data.dart';
import 'package:rma_lv2/widgets/person_tile.dart';

class PersonsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PersonData>(
      builder: (context, personData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final person = personData.persons[index];
            return PersonTile(person: person);
          },
          itemCount: personData.personCount,
        );
      },
    );
  }
}
