# 🗂️ Repository Structure for Garden Monitor

```
monitor-folder/             ← This is a folder, not a Git repository
├── garden-esp32/           ← Git repo A: ESP32 firmware using PlatformIO or ESP-IDF
│   └── .git/               ← Independent Git repo for firmware
│
└── garden-flutter/         ← Git repo B: Flutter mobile app
    └── .git/               ← Independent Git repo for mobile application
```

## 🔧 Best Practice: Two Independent Repositories

- ✅ **Different toolchains**: C++ for ESP32, Dart for Flutter
- ✅ **Isolated development**: Push firmware or app updates independently
- ✅ **Separate CI/CD**: Each can define its own GitHub Actions and release flow
- ✅ **Easier collaboration**: Contributors can focus on one side of the system

## 📦 Platform Requirements for Flutter Development

### Android-only Development
- ✅ Xcode **is not required**
- ✅ You can build and test BLE features fully on Android
- ✅ Recommended: real Android device for BLE support

### iOS Development (Optional Later)
- ❗ Requires full **Xcode installation** (not just gcc)
- ❗ Needed for:
  - Compiling for iOS
  - Running on iPhone/iPad
  - Publishing to App Store
- Flutter relies on **Apple's Clang toolchain** and SDKs, which `gcc` does **not** provide

### Summary Table
| Use Case                      | Needs Xcode? |
|------------------------------|--------------|
| BLE app on Android           | ❌ No         |
| BLE app on iOS               | ✅ Yes        |
| iOS app distribution         | ✅ Yes        |
| You already have `gcc`       | ❌ Still not enough |

💡 **Start with Android-only** for simplicity. Add iOS support once the Android app is functional.

---

💡 If you ever need shared documentation or integration scripts, add a third repo or documentation folder.

