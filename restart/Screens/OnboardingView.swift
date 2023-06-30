//
//  OnboardingView.swift
//  restart
//
//  Created by Rodrigo Adauto Ortiz on 29/06/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                // MARK: HEADER
                Spacer()
                VStack (spacing: 0){
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("""
    If not how much we give but
    how much love we put into giving
    """)
                    .foregroundColor(.white)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .padding(.horizontal, 10)
                } //: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1) , value: isAnimating)
                
                // MARK: BODY
                ZStack {
                    ZStack {
                        CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    }
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -30)
                        .animation(.easeOut(duration: 0.5 ), value: isAnimating)
                }//: BODY
                
                // MARK: FOOTER
                ZStack {
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    HStack {
                        Capsule()
                            .foregroundColor(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        
                        Spacer()
                    }
                    HStack {
                        ZStack {
                            Circle()
                                .foregroundColor(Color("ColorRed"))
                            Circle()
                                .foregroundColor(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                if gesture.translation.width > 0 &&
                                    buttonOffset <= buttonWidth - 80 {
                                    buttonOffset = gesture.translation.width
                                }
                            })
                            .onEnded({ _ in
                                withAnimation(Animation.easeOut(duration: 1)) {
                                    if buttonOffset > buttonWidth/2 {
                                        buttonOffset = buttonWidth - 80
                                        isOnboardingActive = false
                                    } else {
                                        buttonOffset = 0
                                    }
                                }
                            })
                        )
                        
                        Spacer()
                    }
                }
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .offset(y: isAnimating ? 0 : 40)
                .opacity(isAnimating ? 1 : 0)
                .animation(.easeOut(duration: 1), value: isAnimating)
                .padding()
            }
        } //: ZSTACK
        .onAppear {
            isAnimating.toggle()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
