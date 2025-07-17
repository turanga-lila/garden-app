import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLE Test',
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: const BleScannerPage(),
    );
  }
}

class BleScannerPage extends StatefulWidget {
  const BleScannerPage({super.key});
  @override
  State<BleScannerPage> createState() => _BleScannerPageState();
}

class _BleScannerPageState extends State<BleScannerPage> {
  final flutterReactiveBle = FlutterReactiveBle();
  final List<DiscoveredDevice> _devices = [];

  @override
  void initState() {
  //  await PermissionService.requestBlePermissions();
    super.initState();
    flutterReactiveBle.scanForDevices(withServices: [], scanMode: ScanMode.lowLatency).listen((device) {
      if (_devices.every((d) => d.id != device.id)) {
        setState(() {
          _devices.add(device);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nearby BLE Devices')),
      body: ListView.builder(
        itemCount: _devices.length,
        itemBuilder: (context, index) {
          final device = _devices[index];
          return ListTile(
            title: Text(device.name.isNotEmpty ? device.name : 'Unnamed Device'),
            subtitle: Text(device.id),
            trailing: Text('RSSI: ${device.rssi}'),
          );
        },
      ),
    );
  }
}

