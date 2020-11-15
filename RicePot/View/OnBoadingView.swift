//
//  OnBoading.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/15.
//

import SwiftUI

struct OnBoadingView: View {
    
    @EnvironmentObject var model : RiceModel
    @State private var maxWidth = UIScreen.main.bounds.width - 65
    @State private var offset : CGFloat = 0
    
    let capColor  : Color = Color.black
    
    var body: some View {
        
        ZStack {
            
            Color.black.opacity(0.1)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack {
                
                Spacer()
                
                Text("Rice the The Pot")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                /// Slidser
                
                ZStack {
                    
                    Capsule()
                        .fill(Color.white.opacity(0.1))
                    
                    Text("Swipe To Start")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.leading, 30)
                    
                    HStack {
                        
                        Capsule()
                            .fill(capColor)
                            .frame(width: calculateWidth() + 65)
                        
                        Spacer()

                    }
                    
                    HStack {
                        
                        ZStack {
                            Image(systemName: "chevron.right")
                            
                            Image(systemName: "chevron.right")
                                .offset(x: -10)
                        }
                        .foregroundColor(.white)
                        .offset(x: 5)
                        .frame(width: 65, height: 65)
                        .background(capColor)
                        .clipShape(Circle())
                        .offset(x: offset)
                        .gesture(DragGesture().onChanged(onChanged(valued:)).onEnded(onEnded(value:)))
                        
                        Spacer()
                    }
                    
                }
                .frame(width: maxWidth, height: 65)
                .padding(.bottom)
            }
            .padding()
        }
    }
    
    func onChanged(valued : DragGesture.Value) {
        
        if valued.translation.width > 0 && offset <= maxWidth - 65 {
            
            offset = valued.translation.width

        }
    }
    
    func onEnded(value : DragGesture.Value) {
        
        withAnimation(Animation.easeOut(duration: 0.3)) {
            
            if offset > 180 {
                
                offset = maxWidth - 65
                
                model.showOnboadind = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    offset = 0
                }
                
            } else {
                offset = 0
            }
        }
    }
    
    func calculateWidth() -> CGFloat {
        let percent = offset / maxWidth
        
        return percent * maxWidth
    }
    
}

struct OnBoading_Previews: PreviewProvider {
    static var previews: some View {
        OnBoadingView()
    }
}
