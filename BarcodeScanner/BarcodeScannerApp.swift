//
//  BarcodeScannerApp.swift
//  BarcodeScanner
//
//  Created by Suman Kumar on 4/5/25.
//

import SwiftUI

@main
struct BarcodeScannerApp: App {
    var body: some Scene {
        WindowGroup {
            ScannerHomeView(viewModel: ScannerViewModel())
        }
    }
}
