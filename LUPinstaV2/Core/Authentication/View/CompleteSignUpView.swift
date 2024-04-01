//
//  CompleteSignUpView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI
import SpriteKit

struct CompleteSignUpView: View {
    @State var isPuchased = false
    
    @State private var isLoading = false
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        ZStack{
            
            if isPuchased {
                GeometryReader { geo in
                    SpriteView(scene: ParticleScene(size: geo.size), options: [.allowsTransparency])
                }
            }
            
            VStack(spacing:12){
                
                Spacer()
                
                Text("Welcome to LevelUP, \(viewModel.username)")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top,24)
                    .multilineTextAlignment(.center)
                
                Text("Click below to complete registration and start using LevelUP")
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.bottom,24)
                
                Button {
                    Task {
                        isLoading.toggle()
                        isPuchased.toggle()
                        try await viewModel.createUser()
                        isPuchased.toggle()
                        isLoading.toggle()
                        
                    }
                } label:{
                    Text("Complete Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 345,height: 44)
                        .background(Color(.systemGreen))
                        .cornerRadius(10)
                }
                
                
              
                Spacer()
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
            
            if isLoading {
                Color.black.opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                
                LottieLoader(fileName: "gym11") // or any other loading indicator
            }
            
            
        }
    }
}

class ParticleScene: SKScene {

    override init(size: CGSize) {
        super.init(size: size)

        backgroundColor = .clear

        if let emitter1 = SKEmitterNode(fileNamed: "MyParticle") {
            emitter1.position.x = size.width / 2
            emitter1.position.y = size.height
            emitter1.particleColorSequence = nil
            emitter1.particleColorBlendFactor = 1
            emitter1.particleColorBlueRange = 1
            emitter1.particleColorGreenRange = 1
            emitter1.particleColorRedRange = 1
//            emitter1.position.x = size.width
            addChild(emitter1)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

#Preview {
    CompleteSignUpView()
}
