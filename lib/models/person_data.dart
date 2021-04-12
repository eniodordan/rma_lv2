import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:rma_lv2/models/inspiring_person.dart';

class PersonData extends ChangeNotifier {
  List<InspiringPerson> _persons = [
    InspiringPerson(
      name: 'Mark Zuckerberg',
      description:
          'He is an American media magnate, internet entrepreneur, and philanthropist.',
      birthDate: DateTime(1984, 5, 14),
      quotes: [
        'Move fast with stable infrastructure.',
        'I don’t have an alarm clock. If someone needs to wake me up, then I have my BlackBerry next to me.',
        'I always tell people that you should only hire people to be on your team if you would work for them.',
      ],
      image: Image.asset('images/mark_zuckerberg.jpg', fit: BoxFit.cover),
    ),
    InspiringPerson(
      name: 'Steve Jobs',
      description:
          'He was an American business magnate, industrial designer, investor, and media proprietor.',
      birthDate: DateTime(1955, 2, 24),
      deathDate: DateTime(2011, 10, 5),
      quotes: [
        'Your time is limited, so don’t waste it living someone else’s life.',
        'Don’t let the noise of others’ opinions drown out your own inner voice.',
        'I think the things you regret most in life are the things you didn’t do.',
      ],
      image: Image.asset('images/steve_jobs.jpg', fit: BoxFit.cover),
    ),
    InspiringPerson(
      name: 'Bill Gates',
      description:
          'He is an American business magnate, software developer, investor, author, and landowner.',
      birthDate: DateTime(1955, 10, 25),
      quotes: [
        'Don’t compare yourself with anyone in this world…if you do so, you are insulting yourself.',
        'If you are born poor it’s not your mistake, but if you die poor it’s your mistake.',
        'It’s fine to celebrate success but it is more important to heed the lessons of failure.',
      ],
      image: Image.asset('images/bill_gates.jpg', fit: BoxFit.cover),
    ),
  ];

  UnmodifiableListView<InspiringPerson> get persons {
    return UnmodifiableListView(_persons);
  }

  int get personCount {
    return _persons.length;
  }

  void addPerson(InspiringPerson person) {
    _persons.add(person);
    notifyListeners();
  }

  void updatePerson(InspiringPerson oldPerson, InspiringPerson newPerson) {
    int index = _persons.indexWhere((person) => person == oldPerson);
    _persons[index] = newPerson;
    notifyListeners();
  }

  void deletePerson(InspiringPerson person) {
    _persons.remove(person);
    notifyListeners();
  }
}
