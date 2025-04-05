//
//  ScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Suman Kumar on 4/5/25.
//

import Foundation
import UIKit
import WMScanner

class ScannerViewModel: ObservableObject {
    @Published var scannedBarcodes: [ScanResult] = []
    
    var title: String {
        "Barcode Scanner"
    }
    
    lazy var scanManager: ScanManaging =  {
        ScanManager()
    }()
    
    func presentScanner(_ type: ScannerType) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                     let window = windowScene.windows.first,
                     let rootVC = window.rootViewController else {
                   return
               }
        Task { @MainActor in
            do {
                self.scannedBarcodes.removeAll()
                let result = try await scanManager.scanForBarcodes(rootVC, type: type)
                self.scannedBarcodes.append(contentsOf: result)
            }
        }
    }
}

