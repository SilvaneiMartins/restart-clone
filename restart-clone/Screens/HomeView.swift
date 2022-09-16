//
//  HomeView.swift
//  restart-clone
//  www.silvaneimartins.com.br
//  Created by Silvanei  Martins on 15/09/22.
//  silvaneimartins_rcc@hotmail.com

import SwiftUI

struct HomeView: View {
    // MARK: - Propriedade
    @AppStorage("onboarding") var isOnboardingViewActive = false
    @State private var isAnimating: Bool = false
    
    // MARK: - Conteudo
    var body: some View {
        VStack(spacing: 20) {
            //MARK: - HEADER
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.2)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(Animation
                        .easeOut(duration: 4).repeatForever() ,value: isAnimating)
            }//: ZSTACK
            //MARK: - CENTER
            Text("O tempo que leva à maestria depende da intensidade do seu foco.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            //MARK: - FOOTER
            Button(action: {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Reiniciar")
                    .font(.system(size: 25, design: .rounded))
                    .fontWeight(.bold)
            }//: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }//: VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                isAnimating = true
            })
        })
    }
}

// MARK: - Visualização
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
