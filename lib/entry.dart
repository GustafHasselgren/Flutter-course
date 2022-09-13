import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './filter_change_notifier.dart';

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
    return Consumer<FilterChangeNotifier>(
        builder: (context, filterChangeNotifier, child) {
      return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blueGrey[800]),
          child: Row(
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
      //fillColor: MaterialStateProperty.resolveWith(getColor),

      checkColor: Colors.orange[600],
      activeColor: Colors.blueGrey[800],
      value: isChecked,
      onChanged: (bool? newValue) {
        Provider.of<FilterChangeNotifier>(context, listen: false)
            .changeDone(id, newValue!);
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
        Provider.of<FilterChangeNotifier>(context, listen: false)
            .deleteEntry(id);
      },
    );
  }

  Color getColor(Set<MaterialState> states) {
    return Colors.blueGrey;
  }
}
