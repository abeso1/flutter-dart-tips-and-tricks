import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: FutureBuilderDemo()));
}

class FutureBuilderDemo extends StatefulWidget {
  const FutureBuilderDemo({super.key});

  @override
  State<FutureBuilderDemo> createState() => _FutureBuilderDemoState();
}

class _FutureBuilderDemoState extends State<FutureBuilderDemo> {
  int fetchCount = 0;

  // Uncomment this line to fix repeated calls
  // late final Future<String> _future;

  @override
  void initState() {
    super.initState();
    // _future = fetchData(); // ✅ uncomment to fix repeated calls
  }

  Future<String> fetchData() async {
    fetchCount++;
    print('fetchData called: $fetchCount times');
    await Future.delayed(const Duration(seconds: 1));
    return 'Data loaded';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FutureBuilder Demo')),
      body: Center(
        child: FutureBuilder<String>(
          future: fetchData(), // ❌ called every build!
          // future: _future, // ✅ use this instead
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!),
                  Text('fetchData called: $fetchCount times'),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {}); // trigger rebuild
                    },
                    child: const Text('Rebuild Widget'),
                  ),
                ],
              );
            } else {
              return const Text('Error');
            }
          },
        ),
      ),
    );
  }
}
