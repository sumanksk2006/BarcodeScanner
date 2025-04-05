//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Suman Kumar on 4/5/25.
//

import SwiftUI

struct ScannerHomeView: View {
    @ObservedObject var viewModel: ScannerViewModel
    @State var confirmScannerType: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.title)
                .font(Font.system(.title, weight: .bold))
           
            if $viewModel.scannedBarcodes.count > 0 {
                VStack {
                    HStack() {
                        Text("Scanned Barcodes :")
                            .frame(alignment: .leading)
                        Spacer()
                    }
                    .padding(.horizontal, 40)
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(viewModel.scannedBarcodes, id:\.self) { result in
                                HStack(spacing: 8.0) {
                                    Text(result.scannedBarcode)
                                    if result.barcodeType != "" {
                                        Text("-")
                                        Text(result.barcodeType)
                                    }
                                    Spacer()
                                }
                                Divider()
                            }
                        }
                        .padding(.leading, 50)
                    }
                }

            }
            
            Spacer()
            Button("Start Scan", action: {
                confirmScannerType.toggle()
            })
            .buttonStyle(PrimaryButtonStyle())
            .padding(.horizontal, 40)
            .padding(.bottom, 60)
        }
        .padding(.vertical, 60)
        .actionSheet(isPresented: $confirmScannerType) {
            ActionSheet(
                title: Text("Choose Barcode Scanner"),
                buttons: [
                    .default(Text("AVFoundation Scanner")) {
                        viewModel.presentScanner(.avScan)
                    },
                    .default(Text("Visionkit Scanner")) {
                        viewModel.presentScanner(.visionKitScan)
                    },
                    .cancel()
                ]
            )
        }
    }
}

#Preview {
    ScannerHomeView(viewModel: ScannerViewModel())
}
