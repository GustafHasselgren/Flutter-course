import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'entry_view_data.dart';

class Entry extends StatelessWidget {
  String id;
  String entryText;
  bool? isChecked;

  Entry(
    this.id,
    this.entryText,
    this.isChecked,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<EntryViewData>(
        builder: (context, filterChangeNotifier, child) {
      return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blueGrey[800]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              entryCheckbox(context),
              entryTextWidget(),
              deleteEntryButton(context),
            ],
          ),
        ),
      );
    });
  }

  Widget entryCheckbox(context) {
    return Checkbox(
      checkColor: Colors.orange[600],
      activeColor: Colors.blueGrey[800],
      value: isChecked,
      onChanged: (bool? newValue) {
        Provider.of<EntryViewData>(context, listen: false)
            .changeDone(id, entryText, newValue!);
      },
    );
  }

  Widget entryTextWidget() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(
          entryText,
          style: isChecked!
              ? const TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.white24)
              : const TextStyle(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget deleteEntryButton(context) {
    return IconButton(
      icon: Icon(
        Icons.delete_outline,
        color: Colors.orange[600],
        size: 30,
      ),
      onPressed: () {
        Provider.of<EntryViewData>(context, listen: false).deleteEntry(id);
      },
    );
  }

  Color getColor(Set<MaterialState> states) {
    return Colors.blueGrey;
  }

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(json['id'], json['title'], json['done']);
  }
}
