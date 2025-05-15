Your PageView won’t scroll on Flutter Web or Desktop by default

If you ever added a PageView in Flutter, you would notice that it works on mobile, but not on web or desktop.


That happens because PageView listens only to touch gestures.

It means that mouse and trackpad scrolls are ignored on desktop and web.


To fix this issue, you need to extend Flutter’s ScrollBehavior to enable mouse and trackpad drags.

Then wrap your PageView with ScrollConfiguration or apply it globally in your MaterialApp.


Have you ever run into this or a similar issue in your Flutter app?


#flutter #flutterdevelopment #tipsandtricks