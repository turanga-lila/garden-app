#!/bin/bash

mkdir -p lib/{screens,services,models,widgets}
mkdir -p assets/images
mkdir -p test
mkdir -p android/app/src/main/res
mkdir -p ios/Runner
mkdir -p build
mkdir -p web

touch ios/Runner
touch android/app/src/main/AndroidManifest.xml
touch lib/screens/home_screen.dart
touch lib/screens/ble_scanner_screen.dart
touch lib/screens/sensor_list_screen.dart

touch lib/services/ble_service.dart

touch lib/models/sensor_config.dart
touch lib/models/sensor_reading.dart

touch lib/widgets/sensor_card.dart

echo "✅ Flutter app structure initialized."

