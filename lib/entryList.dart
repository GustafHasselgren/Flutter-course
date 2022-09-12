import 'package:flutter/material.dart';
//import 'package:template/map_parser.dart';
import 'package:provider/provider.dart';
import './filter_change_notifier.dart';

/*List<Map> apiFetch = [
  {'id': '0', 'text': 'Rensa garderoben', 'done': false},
  {'id': '1', 'text': 'Hänga tvätten', 'done': false},
  {'id': '2', 'text': 'Klättra', 'done': true},
  {'id': '3', 'text': 'Springa', 'done': true},
  {'id': '4', 'text': 'Slänga soporna', 'done': false},
  {'id': '5', 'text': 'Laga mat', 'done': false},
];*/

class EntryList extends StatelessWidget {
  //final List<Map> entries = apiFetch;

  @override
  Widget build(BuildContext context) {
    //var data = DataParser(widget.entries);
    //List parsedEntries = data.toList();

    return Column(
      children: [
        Expanded(
          child: Consumer<FilterChangeNotifier>(
            builder: (context, filterChangeNotifier, child) {
              return ListView(
                children: filterChangeNotifier.filteredList(),
              );
            },
          ),
        ),
        const SizedBox(height: 90)
      ],
    );
  }
}
