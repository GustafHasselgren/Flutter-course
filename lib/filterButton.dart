import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './filter_change_notifier.dart';

class FilterButton extends StatelessWidget {
  FilterButton({super.key});

  String? filterBy = 'All';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 18.0, top: 5.0),
      child: Consumer<FilterChangeNotifier>(
          builder: (context, filterChangeNotifier, child) {
        return DropdownButtonHideUnderline(
          child: DropdownButton(
            value: filterChangeNotifier.filter,
            borderRadius: BorderRadius.circular(30),
            icon: const Icon(Icons.filter_alt_rounded),
            iconSize: 30.0,
            iconEnabledColor: Colors.blueGrey[50],
            style: TextStyle(color: Colors.blueGrey[50]),
            dropdownColor: Colors.blueGrey[700],
            alignment: AlignmentDirectional.centerEnd,
            items: [filterVal('All'), filterVal('Done'), filterVal('Not done')],
            onChanged: (String? value) {
              filterChangeNotifier.filter = value;
            },
          ),
        );
      }),
    );
  }

  DropdownMenuItem<String> filterVal(String value) {
    return DropdownMenuItem<String>(value: value, child: Text(value));
  }
}
