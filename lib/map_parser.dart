import './entry.dart';

class DataParser {
  final List<Map> entries;

  DataParser(this.entries);

  List<Entry> toList() {
    List<Entry> outputList = [];
    for (var entry in entries) {
      outputList.add(Entry(entry['id'], entry['text'], entry['done']));
    }
    return outputList;
  }
}
