import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  /// Requests Bluetooth and location permissions needed for BLE functionality.
  /// Returns true if all required permissions are granted.
  static Future<bool> requestBlePermissions() async {
    final permissions = [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.locationWhenInUse,
    ];

    final statuses = await permissions.request();

    // Log the result for debugging (optional)
    statuses.forEach((permission, status) {
      print('Permission $permission: $status');
    });

    return statuses.values.every((status) => status.isGranted);
  }
}
