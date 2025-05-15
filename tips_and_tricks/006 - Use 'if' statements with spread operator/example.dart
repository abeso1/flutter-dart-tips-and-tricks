import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showExtraWidgets = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Spread Operator Tip')),
        body: Column(
          children: [
            const Text('Always visible'),

            // 👇 This is the magic
            if (showExtraWidgets) ...[
              const SizedBox(height: 20),
              const Text(
                'Conditionally visible using spread operator',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text('I only appear if showExtraWidgets is true'),
              ),
            ],

            // This is the same as the above with more code
            // if (showExtraWidgets) const SizedBox(height: 20),
            // if (showExtraWidgets)
            //   const Text(
            //     'Conditionally visible using spread operator',
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            // if (showExtraWidgets) const SizedBox(height: 20),
            // if (showExtraWidgets)
            //   ElevatedButton(
            //     onPressed: () {},
            //     child: const Text('I only appear if showExtraWidgets is true'),
            //   ),

            // This is button to change the condition
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showExtraWidgets = !showExtraWidgets;
                });
              },
              child: const Text('Change condition'),
            ),
          ],
        ),
      ),
    );
  }
}
