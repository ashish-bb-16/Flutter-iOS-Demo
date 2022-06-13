# Flutter-iOS-Demo
Demo iOS project that integrates flutter Views in a UITableView


# Running the project:

## Pre-requisite
1) Flutter and Dart is installed and added to your source files.
Installation link: https://docs.flutter.dev/get-started/install?gclid=Cj0KCQjwwJuVBhCAARIsAOPwGASKLOQTQW9ik5llSxC0iIXpY3G_bXLyL1LhN9d21TNSmEP78f-zq7kaAtYdEALw_wcB&gclsrc=aw.ds

2) xcode and cocoapods setup is done.

# Get the flutter module.
Clone the flutter module from here: https://github.com/ashish-bb-16/FlutterTest/tree/master/bb_flutter

# Install Flutter dependencies:

1) Navigate to the flutter module(bb_flutter) from terminal and run the below command:
   `flutter pub get`
   
2) Open this project in Xcode. Open the Podfile and change the flutter path from: 
   ```
   flutter_application_path = '../../Flutter/FlutterTest/bb_flutter'
   ```
   to the path where your bb_flutter module resides. Relative or absolute path, both would work.
   
3) In your Xcode project directory from terminal, run `pod install`
4) Clean build and run the project from xcode.

