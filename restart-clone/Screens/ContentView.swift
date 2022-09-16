//
//  ContentView.swift
//  restart-clone
//
//  Created by Silvanei  Martins on 15/09/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Propriedade
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    // MARK: - Conteudo
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

// MARK: - Visualização
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
