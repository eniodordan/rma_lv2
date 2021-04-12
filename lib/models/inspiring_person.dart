import 'package:flutter/material.dart';

class InspiringPerson {
  String name;
  String description;
  DateTime birthDate;
  DateTime deathDate;
  List<String> quotes;
  Image image;

  InspiringPerson({
    this.name,
    this.description,
    this.birthDate,
    this.deathDate,
    this.quotes,
    this.image,
  });
}
