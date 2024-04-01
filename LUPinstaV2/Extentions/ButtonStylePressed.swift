//
//  ButtonStylePressed.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 01/04/24.
//

import Foundation
import SwiftUI

struct ScaleButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(x: configuration.isPressed ? 0.98 : 1, y: configuration.isPressed ? 0.98 : 1)
    }

}
