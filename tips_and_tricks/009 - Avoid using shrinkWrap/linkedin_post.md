Flutter tip: Avoid using `shrinkWrap` with `ListViews` in Flutter

Sometimes, while we use `ListView` inside a `Column`, we hit layout errors.


We often set `shrinkWrap` to `true` to fix errors quickly.

However, this shortcut come at a cost.


When you enable `shrinkWrap`, your app has to calculate the height of all items upfront.

This method eliminates the lazy loading advantages. It's similar to wrapping a `Column` in a `SingleChildScrollView`.

For better performance and the same UI output, use slivers inside `CustomScrollView`.


Do you use `shrinkWrap` in your Flutter apps?