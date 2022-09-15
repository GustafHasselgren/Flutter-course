import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './entry.dart';
import 'http_connection.dart';

class EntryViewData extends ChangeNotifier {
  String? _filterBy = 'All';

  // ignore: prefer_final_fields
  List<Entry> _entryList = [];

  String? get filter => _filterBy;
  List get entryList => _entryList;

  EntryViewData() {
    fetchEntries();
  }

  addEntry(String newEntryText) async {
    List jsonList = await HttpConnection.postEntry(newEntryText);
    _entryList = jsonToEntryList(jsonList);
    notifyListeners();
  }

  fetchEntries() async {
    List jsonList = await HttpConnection.fetchData();
    _entryList = jsonToEntryList(jsonList);
    notifyListeners();
  }

  changeDone(String id, String entryText, bool? done) async {
    List jsonList = await HttpConnection.updateEntry(id, entryText, done);
    _entryList = jsonToEntryList(jsonList);
    notifyListeners();
  }

  deleteEntry(String id) async {
    List jsonList = await HttpConnection.deleteEntry(id);
    _entryList = jsonToEntryList(jsonList);
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

  List<Entry> jsonToEntryList(List jsonList) {
    List<Entry> entryList = [];
    for (Map<String, dynamic> jsonEntry in jsonList) {
      entryList.add(Entry.fromJson(jsonEntry));
    }
    return entryList;
  }
}
