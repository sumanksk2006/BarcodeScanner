# BarcodeScanner

Client Sample Application to integrate ios-wmscanner for Scanning Barcodes.
ios-wmscanner SDK implements two types of native scan for Barcodes
  - AVFoundation Scanner to read metaData objects
  - VisionKit DataScannerViewController

On click of Start Scan, actionsheet would be presented to choose scanner type for initiation of scan.
Sample App is created with SwiftUI and app shares scannerType and window's rootViewController to present scanner

Once the scan is done, All the scanned barcodes in the session would be presented on home screen.

https://github.com/user-attachments/assets/12047708-ba69-4b5b-a92d-f6de7b7d585e

Please check SDK documentation for more details



