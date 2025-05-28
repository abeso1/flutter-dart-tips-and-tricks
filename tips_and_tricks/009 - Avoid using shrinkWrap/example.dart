import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<String> listOfItems = List.generate(
    1000,
    (index) => 'Item $index',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avoid ShrinkWrap with Slivers',
      home: Scaffold(
        appBar: AppBar(title: Text('Avoid ShrinkWrap')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Avoid using shrinkWrap: true when rendering long lists.\n'
                'It builds all widgets upfront and hurts performance.\n'
                'Use slivers instead.',
                style: TextStyle(fontSize: 16),
              ),
            ),

            // ❌ BAD PRACTICE: Using shrinkWrap: true
            Expanded(
              child: ListView.builder(
                shrinkWrap: true, // Leads to a bad performance
                itemCount: listOfItems.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(listOfItems[index]));
                },
              ),
            ),

            // ✅ GOOD PRACTICE: Use CustomScrollView with SliverList for better performance
            Expanded(
              child: CustomScrollView(
                slivers: [
                  // SliverList doesn't lead to a bad performance
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return ListTile(title: Text(listOfItems[index]));
                    }, childCount: listOfItems.length),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
