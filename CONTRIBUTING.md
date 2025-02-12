# Contributing to MajesticUI

This document outlines how to contribute code to MajesticUI.

There are many ways to contribute.

- You can [publish](majesticui.com/publish) a widget for the community.
- You can [report bugs](https://github.com/Ronak99/majestic-ui-flutter/issues/new?template=bug_report.md) or [make feature requests](https://github.com/Ronak99/majestic-ui-flutter/issues/new?template=feature_request.md) for the existing widgets.
- You can enhance the existing documentation.

---

## Conventions

- Avoid [double negatives](https://en.wikipedia.org/wiki/Double_negative) when naming things, i.e. a boolean field should
  be named `enabled` instead of `disabled`.

- Avoid past tense when naming callbacks, prefer present tense instead.

  ✅ Prefer this:

  ```dart
  final VoidCallback onPress;
  ```

  ❌ Instead of:

  ```dart
  final VoidCallback onPressed;
  ```

- Format all Dart code with 120 characters line limit, i.e. `dart format . --line-length=120`.

## Design Guidelines

### State management

The goal is to be agnostic about state management, however the project primarily uses provider, you can choose whichever state management solution you wish while contributing a new widget. Once an agnostic state management solution is decided upon, contributed components will be updated to support that.

### What goes where

**/src**

Clone the repository and locate the src/ folder.

src/ folder is where your own UI or functionality package will reside, you can either create an entire plugin (with native support) or just a dart/flutter package.

```dart
// Creates package
flutter create -t package my_package_name

// Creates plugin
flutter create -t plugin my_plugin_name
```

**/app**

Include your package as a flutter dependency within the flutter project hosted in the /app folder.

Make sure that your changes are functional on Flutter web and are mobile-first. (Large screen responsive UIs are not the priority at the moment.)

---

Once the request is approved, changes will be hosted on the website and demo code will be taken from whatever you have written under the /app folder.

You can even contribute by improving this **CONTRIBUTING** guide, I believe criticisms are the quickest way to improve, analyse this project criticially and how can we adopt best practices to improve the code written so far.
