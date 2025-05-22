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
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();

    _listener = AppLifecycleListener(
      onShow: () => debugPrint('🔵 App is visible (onShow)'),
      onResume: () => debugPrint('🟢 App resumed (onResume)'),
      onPause: () => debugPrint('⏸️ App paused (onPause)'),
      onInactive: () => debugPrint('⚪ App inactive (onInactive)'),
      onHide: () => debugPrint('🙈 App hidden (onHide)'),
      onDetach: () => debugPrint('🔌 App detached (onDetach)'),
      onRestart: () => debugPrint('🔄 App restarted (onRestart)'),
      onStateChange:
          (AppLifecycleState state) =>
              debugPrint('📣 App state changed to: $state'),
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'AppLifecycleListener Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppLifecycleListener Demo')),
      body: const Center(
        child: Text(
          'Switch apps, lock the screen,\n'
          'or minimize to see lifecycle logs in the console.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
