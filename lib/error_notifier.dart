import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ErrorNotifier extends ChangeNotifier {
  String? _addEmptyEntry = null;

  String? get addEmptyEntry => _addEmptyEntry;

  set addEmptyEntryError(String? msg) {
    _addEmptyEntry = msg;
    notifyListeners();
  }
}
