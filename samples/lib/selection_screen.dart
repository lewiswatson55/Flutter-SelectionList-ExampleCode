import 'package:flutter/material.dart';

class SelectionScreen extends StatefulWidget {
  final List<String> items;
  final bool allowMultipleSelection;

  SelectionScreen({required this.items, this.allowMultipleSelection = false});

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0), // Maybe need removed if calling in a widget, code is example only.
          child: Center(
            child: Column(
              children: widget.items.map((item) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (widget.allowMultipleSelection) {
                          if (selectedItems.contains(item)) {
                            selectedItems.remove(item);
                            print(selectedItems); // For debug console
                          } else {
                            selectedItems.add(item);
                            print(selectedItems); // For debug console
                          }
                        } else {
                          selectedItems = [item];
                          print(selectedItems); // For debug console
                        }
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5, // Also probably not for end use as you want mobile to look good also
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: selectedItems.contains(item) ? Colors.green : Colors.white,
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: Center(
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}