//
//  LottieLoader.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI
import Lottie

struct LottieLoader: View {
    var fileName:String = "gym11"
    var contentMode: UIView.ContentMode = .scaleAspectFill
    var playLoopMode: LottieLoopMode = .autoReverse
    var onAnimationDidFinish: (() -> Void)? = nil
    
    var body: some View {
        LottieView(animation: .named(fileName))
            .configure({lottieAnimationView in
                lottieAnimationView.contentMode = contentMode
                    
            })
            .animationDidFinish({completed in
                onAnimationDidFinish?()
            })
            .playbackMode(.playing(.toProgress(1, loopMode: playLoopMode)))
            .animationSpeed(3.0)
            .frame(width: 300, height: 300)
        
            
    }
}

#Preview {
    LottieLoader()
}
