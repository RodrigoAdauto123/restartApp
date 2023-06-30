//
//  HomeView.swift
//  restart
//
//  Created by Rodrigo Adauto Ortiz on 29/06/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingActive: Bool = true
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            // MARK: HEADER
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .secondary, ShapeOpacity: 0.2)
                    
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .offset(y: isAnimating ? 40 : -40)
                    .animation(
                    Animation
                        .easeOut(duration: 4)
                        .repeatForever()
                    , value: isAnimating
                    )
                    .padding()
            }
            
                
            // MARK: BODY
            Text("The time that leads to mastery is dependent on the intensity of our focus")
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .font(.system(.title3))
                .multilineTextAlignment(.center)
                .padding()
            // MARK: FOOTER
            Spacer()
            
            Button {
                withAnimation {
                    isOnboardingActive = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonBorderShape(.capsule)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating.toggle()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
