import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'entry_view_data.dart';

class EntryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Consumer<EntryViewData>(
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
