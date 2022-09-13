import 'package:flutter/material.dart';
import './addEntryView.dart';
import './filterButton.dart';
import './entryList.dart';
import './filter_change_notifier.dart';
import 'package:provider/provider.dart';
import './error_notifier.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: EntryList(),
      floatingActionButton: addEntryViewButton(context),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('To-do'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        actions: [FilterButton()]);
  }

  Widget addEntryViewButton(context) {
    return Consumer<FilterChangeNotifier>(
      builder: (context, filterChangeNotifier, child) {
        return FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          child: const Icon(Icons.add_rounded, size: 50.0),
          onPressed: () async {
            Provider.of<ErrorNotifier>(context, listen: false)
                .addEmptyEntryError = null;
            var newEntryText = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddEntryView()));
            filterChangeNotifier.addEntry(newEntryText);
          },
        );
      },
    );
  }
}
