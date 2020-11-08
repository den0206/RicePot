//
//  IntervalView.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/07.
//

import SwiftUI

struct ProgressCircleView: View {
    
    var size : CGFloat = UIScreen.main.bounds.width - 100
    var circleColor : Color
    var maxValue : CGFloat
    @Binding var progress : CGFloat
    
    var timeString : String
    
    
    
    var body: some View {
        
        ZStack {
            Circle().stroke(Color.gray, style: StrokeStyle(lineWidth: 35, lineCap: .round, lineJoin: .round))
                .frame(width: size, height: size)
            
            Circle()
                .trim(from: 0.0, to: progress / maxValue)
                .stroke(circleColor, style: StrokeStyle(lineWidth: 35, lineCap: .round, lineJoin: .round))
                .frame(width: size, height: size)
                .rotationEffect(.init(degrees: -90))
                .animation(.spring())
            
            Text(timeString)
                .font(.system(size: 32))
                .fontWeight(.black)
        }
        
       
            
        
    }
}

