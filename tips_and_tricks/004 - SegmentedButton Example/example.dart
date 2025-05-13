import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Segmented Button Demo',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const SegmentedButtonPage(),
    );
  }
}

class SegmentedButtonPage extends StatefulWidget {
  const SegmentedButtonPage({super.key});

  @override
  State<SegmentedButtonPage> createState() => _SegmentedButtonPageState();
}

class _SegmentedButtonPageState extends State<SegmentedButtonPage> {
  String selectedView = 'day';
  Set<String> selectedSizes = {'l', 'xl'};

  final Map<String, (IconData?, String)> views = {
    'day': (Icons.calendar_today, 'Day'),
    'week': (Icons.view_week, 'Week'),
    'month': (Icons.calendar_month, 'Month'),
    'year': (Icons.calendar_today, 'Year'),
  };

  final Map<String, String> sizes = {
    'xs': 'XS',
    's': 'S',
    'm': 'M',
    'l': 'L',
    'xl': 'XL',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5FF),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Single choice', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 12),
            SegmentedButton<String>(
              segments:
                  views.entries.map((entry) {
                    final (icon, label) = entry.value;
                    return ButtonSegment(
                      value: entry.key,
                      label: Row(
                        children: [
                          Icon(icon, size: 18),
                          const SizedBox(width: 4),
                          Text(label),
                        ],
                      ),
                    );
                  }).toList(),
              selected: {selectedView},
              onSelectionChanged: (newSelection) {
                setState(() {
                  selectedView = newSelection.first;
                });
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return const Color(0xFFEADDFF);
                  }
                  return Colors.transparent;
                }),
                foregroundColor: WidgetStateProperty.all(Colors.black),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text('Multiple choice', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 12),
            SegmentedButton<String>(
              segments:
                  sizes.entries.map((entry) {
                    return ButtonSegment(
                      value: entry.key,
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(entry.value),
                        ],
                      ),
                    );
                  }).toList(),
              multiSelectionEnabled: true,
              selected: selectedSizes,
              onSelectionChanged: (newSelection) {
                setState(() {
                  selectedSizes
                    ..clear()
                    ..addAll(newSelection);
                });
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return const Color(0xFFEADDFF);
                  }
                  return Colors.transparent;
                }),
                foregroundColor: WidgetStateProperty.all(Colors.black),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
