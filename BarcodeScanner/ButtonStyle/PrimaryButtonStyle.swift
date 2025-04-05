//
//  PrimaryButtonStyle.swift
//  BarcodeScanner
//
//  Created by Suman Kumar on 4/5/25.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, 12)
            .padding(.horizontal, 40)
            .foregroundStyle(.white)
            .background(configuration.isPressed ? Color.blue.opacity(0.6) : Color.blue)
            .contentShape(RoundedRectangle(cornerRadius: 8.0))
            .cornerRadius(8.0)
    }
}

#Preview {
    VStack {
        Button("Start Scan") {
            
        }.buttonStyle(PrimaryButtonStyle())
    }
}
