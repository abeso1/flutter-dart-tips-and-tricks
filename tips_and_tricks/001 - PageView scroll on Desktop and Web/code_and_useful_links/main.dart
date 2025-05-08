import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PageViewDemo()));
}

class PageViewDemo extends StatelessWidget {
  const PageViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // ❌ This doesn't allow mouse/trackpad swipes on web/desktop
    return Scaffold(
      appBar: AppBar(title: const Text('PageView Scroll Demo')),
      body: Center(
        // Uncomment this block to apply the fix 👇
        // child: ScrollConfiguration(
        //   behavior: MyCustomScrollBehavior(),
        //   child: _buildPageView(),
        // ),

        // Default behavior (mouse/trackpad won't work)
        child: _buildPageView(),
      ),
    );
  }

  Widget _buildPageView() {
    return SizedBox(
      height: 200,
      child: PageView(
        children: const [
          Center(child: Text('Page 1')),
          Center(child: Text('Page 2')),
          Center(child: Text('Page 3')),
        ],
      ),
    );
  }
}

// ✅ Custom ScrollBehavior to fix the issue
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}
