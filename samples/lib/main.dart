import 'package:flutter/material.dart';
import 'package:samples/selection_screen_drag.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selection Screen Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection Screen Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectionScreen(
                      items: const ['Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5' ,'Option 6', 'Option 7','Option 8', 'Option 9', 'Option 10', 'Option 11', 'Other blah blah'],
                    ),
                  ),
                );
              },
              child: Text('Single Selection'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectionScreen(
                      items: const ['Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5' ,'Option 6', 'Option 7','Option 8', 'Option 9', 'Option 10', 'Option 11', 'Other blah blah'],
                      allowMultipleSelection: true,
                    ),
                  ),
                );
              },
              child: const Text('Multiple Selection'),
            ),
          ],
        ),
      ),
    );
  }
}