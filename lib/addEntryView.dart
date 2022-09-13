import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './error_notifier.dart';

class EntryViewState extends ChangeNotifier {}

class AddEntryView extends StatelessWidget {
  AddEntryView({super.key});

  String newEntryText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('To-do'),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        centerTitle: true);
  }

  Widget body(context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Spacer(),
          addEntryTextField(),
          spacing(),
          addEntryButton(context),
          const Spacer()
        ],
      ),
    );
  }

  Widget addEntryTextField() {
    return Consumer<ErrorNotifier>(builder: (context, errorNotifier, child) {
      return TextField(
        maxLength: 31,
        onChanged: (text) {
          newEntryText = text;
        },
        style: TextStyle(color: Colors.blueGrey[100]),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.blueGrey[800],
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange.shade600)),
          contentPadding: const EdgeInsets.all(10.0),
          hintText: 'What are you going to do?',
          hintStyle: TextStyle(color: Colors.blueGrey[200]),
          helperStyle: TextStyle(color: Colors.blueGrey[100]),
          errorText: errorNotifier.addEmptyEntry,
        ),
      );
    });
  }

  Widget addEntryButton(context) {
    return TextButton.icon(
      onPressed: () {
        if (newEntryText != '') {
          Navigator.pop(context, newEntryText);
        } else {
          Provider.of<ErrorNotifier>(context, listen: false)
              .addEmptyEntryError = 'Please add something to do.';
        }
      },
      icon: const Icon(Icons.add),
      label: const Text('Add'),
      style: TextButton.styleFrom(primary: Colors.orange[600]),
    );
  }

  Widget spacing() {
    return const SizedBox(
      height: 10.0,
    );
  }
}
