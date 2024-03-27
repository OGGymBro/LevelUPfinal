//
//  UserStatView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI

struct UserStatView: View {
    
    let Weight:Double
    let Exercise:String
    
    var body: some View {
        let roundWeight = String(format: "%.1f", Weight)
        
        VStack{
            Text("\(roundWeight)")
                .font(.subheadline)
                
            
            Text(Exercise)
                .font(.footnote)
            
        }
        .frame(width: 72)
    }
}

#Preview {
    UserStatView(Weight: 140, Exercise: "Squat")
}
