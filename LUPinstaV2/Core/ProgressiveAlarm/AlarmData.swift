//
//  AlarmData.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 24/04/24.
//

import SwiftUI

struct AlarmData: Identifiable, Hashable {
    let id = UUID()
    let date: Date
    let sleepTime: Date
    let wakeTime: Date
}
