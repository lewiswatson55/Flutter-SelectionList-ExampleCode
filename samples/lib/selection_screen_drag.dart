import 'package:flutter/gestures.dart';
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
  ScrollController _scrollController = ScrollController();
  double _dragStartY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection Screen'),
      ),
      body: Listener(
        onPointerDown: (PointerDownEvent event) {
          _dragStartY = event.position.dy;
        },
        onPointerMove: (PointerMoveEvent event) {
          double dragEndY = event.position.dy;
          double dragDistance = dragEndY - _dragStartY;
          _scrollController.jumpTo(_scrollController.offset - dragDistance);
          _dragStartY = dragEndY;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
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
                            } else {
                              selectedItems.add(item);
                            }
                          } else {
                            selectedItems = [item];
                          }
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: selectedItems.contains(item) ? Colors.green : Colors.white,
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
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
      ),
    );
  }
}