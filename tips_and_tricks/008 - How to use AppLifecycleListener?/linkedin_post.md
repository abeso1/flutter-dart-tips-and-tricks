With Flutter 3.13, there is cleaner way to track app lifecycle states

Instead of using WidgetsBindingObserver, you can now use AppLifecycleListener


No need to mixin WidgetsBindingObserver into State, add and remove observers manually, or handle switch cases in didChangeAppLifecycleState method.


Now, you can just create AppLifecycleListener and listen only to the lifecycle events that you need.

It's less boilerplate code, faster to implement and easier to maintain.


Do you still use WidgetsBindingObserver or did you move on to AppLifecycleListener?


#flutter #flutterdevelopment