# weather_apps

A weather forecaster app that would allow users to see the weather forecasts in the next few days

# Install Application on your local device

1. Clone this repository using the 'git clone https://github.com/abiyyu19/weather-apps.git' command in the terminal.
2. Install all project dependencies by running the 'flutter pub get' command.
3. If you wish to Sign In or Sign Up using a Google account on an Android device, please request to add your local machine's SHA1 and SHA256 to my Firebase account. You can find the SHA1 and SHA256 credentials on Windows using the following terminal command: 'keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore'. Insert the default password 'android' if you haven't changed it.
4. For Sign In or Sign Up using a Google account on an iOS device, add 'com.googleusercontent.apps.527895033367-p6jhd4ga7qv1ekussggkhkgvi063kinf' to your Runner workspace using Xcode. Please note that I haven't tested the Google Sign-In feature on iOS as I don't have access to a Mac device.
5. To run the project locally, use the 'flutter run' command in the terminal.
6. For Email and Password login, use 'test@gmail.com' with the password 'test123'. Alternatively, you can use the dummy phone number '+62 112 2334 4556' and OTP '123456' to test login using a phone number.
7. To generate APK files for the project, you can use the following commands:
   - `flutter build apk --split-per-abi` => to build a release APK for each target ABI (Application Binary Interface).
   - `flutter build apk --release` => to build a single release APK.
8. To install an APK from the project folder, use the 'flutter install' command in the root project folder, then connect your Android device via a USB cable.

# Note

- While this app has the capability to detect the user's location using the Geolocator library, it currently uses Jakarta as a static location. This choice is made because the location obtained from Geolocator contains Indonesian pronunciations, and the OpenWeatherMap API may not accurately identify the weather location.
- This app does not implement any state management. Feel free to use this project as a starting point and explore implementing state management for improved functionality.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
