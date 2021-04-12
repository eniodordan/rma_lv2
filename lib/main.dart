import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rma_lv2/models/person_data.dart';
import 'package:rma_lv2/screens/persons_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PersonData(),
      child: MaterialApp(
        home: PersonsScreen(),
      ),
    );
  }
}
