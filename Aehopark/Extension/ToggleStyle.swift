//
//  ToggleStyle.swift
//  Aehopark
//
//  Created by 문창재 on 7/22/24.
//

import Foundation
import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: "checkmark")
                    .foregroundColor(configuration.isOn ? ._377_D_00 : .gray)
                configuration.label
            }
        }
    }
}

struct AllAgreeToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(configuration.isOn ? ._377_D_00 : .gray)
                configuration.label
            }
        }
    }
}
