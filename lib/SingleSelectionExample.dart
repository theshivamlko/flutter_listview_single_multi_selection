import 'package:flutter/material.dart';

class SingleSelectionExample extends StatefulWidget {
  List<String> sortFilter;

  SingleSelectionExample(this.sortFilter);

  @override
  _SingleSelectionExampleState createState() => _SingleSelectionExampleState();
}

class _SingleSelectionExampleState extends State<SingleSelectionExample> {
  String selectedValue;

  @override
  void initState() {
    super.initState();

    selectedValue = widget.sortFilter.first;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            selectedValue = widget.sortFilter[index];
            setState(() {});
          },
          child: Container(
            color: selectedValue == widget.sortFilter[index]
                ? Colors.green[100]
                : null,
            child: Row(
              children: <Widget>[
                Radio(
                    value: widget.sortFilter[index],
                    groupValue: selectedValue,
                    onChanged: (s) {
                      selectedValue = s;
                      setState(() {});
                    }),
                Text(widget.sortFilter[index])
              ],
            ),
          ),
        );
      },
      itemCount: widget.sortFilter.length,
    );
  }
}
