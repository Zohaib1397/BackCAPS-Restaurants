//
//  PracticeFile.swift
//  BackCAPS Restaurants
//
//  Created by Zohaib Ahmed on 30/07/2024.
//

import SwiftUI

struct PracticeFile: View {
    
    @State var isLoading = false
    @State var isProcessing = false
    @State var processing = 0.5
    @State var loadingComplete = false
    
    var body: some View {
        Button{
            if !isProcessing {
                isLoading = false
                isProcessing.toggle()
                
                var clockWise = true
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){timer in
                    if clockWise {
                        withAnimation(.linear){
                            processing += 0.1
                        }
                        
                    } else {
                        withAnimation(.linear){
                            processing -= 0.1
                        }
                    }
                    if processing >= 0.8 || processing <= 0.2 {
                            clockWise.toggle()
                        }
                }
            }
        } label: {
            if isProcessing && !loadingComplete {
                Circle()
                    .trim(from: 0.0, to: processing)
                    .stroke(.white, lineWidth: 5)
                    .frame(width: 40)
                    .padding(.horizontal, 3)
                    .rotationEffect(.degrees(isLoading ? 360 : 0))
                    .animation(.linear(duration: 0.3).repeatForever(autoreverses: false), value: isLoading)
                    .onAppear{
                        isLoading = true
                    }
            }
            if isProcessing {
                if !loadingComplete {
                    Text("Processing")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .transition(.identity)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                                withAnimation{
                                    isLoading = false
                                    loadingComplete = true
                                }
                                
                            }
                        }
                } else {
                    Text("Done")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .transition(.identity)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                withAnimation{
                                    loadingComplete = false
                                    isProcessing = false
                                }
                            }
                        }
                }
                
            } else {
                Text("Submit")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .transition(.asymmetric(insertion: .offset(x:0 ,y: -20).combined(with: .opacity), removal: .identity))
            }
            
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.extraLarge)
        .transition(.opacity)
        .tint(loadingComplete ? .red : .green)
    }
}

#Preview {
    PracticeFile()
}

