//
//  ContentView.swift
//  restart
//
//  Created by Rodrigo Adauto Ortiz on 29/06/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingActive: Bool = true
    var body: some View {
        if isOnboardingActive {
            OnboardingView()
        } else {
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
