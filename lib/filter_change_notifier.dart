import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './entry.dart';

class FilterChangeNotifier extends ChangeNotifier {
  String? _filterBy = 'All';

  String _id = '1000';
  // ignore: prefer_final_fields
  List<Entry> _entryList = [
    Entry('0', 'Rensa garderoben', false),
    Entry('1', 'Springa', false),
    Entry('2', 'Packa', true),
    Entry('3', 'Göra läxorna', false),
    Entry('4', 'Gå till gymmet', true),
  ];

  String? get filter => _filterBy;
  List get entryList => _entryList;

  addEntry(String newEntryText) {
    Entry newEntry = Entry(_id, newEntryText, false);
    entryList.add(newEntry);
    var newId = int.parse(_id);
    newId += 1;
    _id = newId.toString();
    notifyListeners();
  }

  changeDone(String id, bool? checked) {
    Entry entryToUpdate = _entryList.firstWhere((entry) => entry.id == id);
    entryToUpdate.isChecked = checked;
    notifyListeners();
  }

  deleteEntry(String id) {
    _entryList.removeWhere((entry) => entry.id == id);
    notifyListeners();
  }

  set filter(String? newFilter) {
    _filterBy = newFilter;
    notifyListeners();
  }

  List<Entry> filteredList() {
    if (_filterBy == 'Done') {
      return _entryList.where((entry) => entry.isChecked == true).toList();
    } else if (_filterBy == 'Not done') {
      return _entryList.where((entry) => entry.isChecked == false).toList();
    } else {
      return _entryList.toList();
    }
  }
}
