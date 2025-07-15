# Garden Monitor App - Developer Guide

This document provides guidance for contributors and maintainers of the Garden Monitor Flutter app.

---

## 📁 Project Structure

```plaintext
lib/
├── main.dart                 # App entry point
├── models/                  # Sensor config and readings
│   ├── sensor_config.dart
│   └── sensor_reading.dart
├── screens/                 # UI screens
│   ├── home_screen.dart
│   ├── ble_scanner_screen.dart
├── services/                # Business logic and BLE wrappers
│   └── permission_service.dart
├── widgets/                 # Reusable UI components
│   └── sensor_card.dart
assets/
└── images/                  # App images
```

---

## 📡 BLE Integration

- **Library used:** [`flutter_reactive_ble`](https://pub.dev/packages/flutter_reactive_ble)
- **Permissions:**
  - Android: declared in `AndroidManifest.xml`
  - iOS: declared in `Info.plist`
  - Requested dynamically using `permission_handler`

```dart
await PermissionService.requestBlePermissions();
```

This should be called in the `initState` of screens that need BLE access.

---

## 🔒 Permissions

All BLE and location permissions are requested via `PermissionService`:

```dart
class PermissionService {
  static Future<bool> requestBlePermissions() async { ... }
}
```

See `lib/services/permission_service.dart`.

---

## 📱 UI Conventions

- Use `Material 3` components (via `ThemeData.useMaterial3: true`)
- Structure widgets hierarchically and cleanly
- Prefer `StatefulWidget` for dynamic behavior (e.g., BLE scan)

---

## 📋 Code Documentation Guidelines

- Document all `classes` and `functions`.
- Example:

```dart
/// Scans for BLE devices and displays them in a list.
class BleScannerScreen extends StatefulWidget { ... }

/// Starts BLE scanning after permission check.
Future<void> _startBleScan() async { ... }
```

---

## 🧪 Testing

Add widget tests under:

```
test/
  ble_scanner_screen_test.dart
```

To run:

```bash
flutter test
```

---

## 🚀 Roadmap

See the GitHub Projects tab for:

- Development steps
- Bugs/issues
- Feature requests

---

For questions, open an issue or contact the maintainer.

---

Happy gardening! 🌱

