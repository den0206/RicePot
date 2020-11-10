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
    var predicateTime : String?
    
    
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
            
            VStack(spacing : 10) {
                
                if predicateTime != nil {
                    Text("終了時間").font(.caption2)
                    Text(predicateTime!)
                    .font(.system(size: 24))
                        .foregroundColor(.gray)
                }
              
                
                Text(timeString)
                    .font(.system(size: 32))
                    .fontWeight(.black)
            }
         
        }
        
       
            
        
    }
}

struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView(circleColor: Color.green, maxValue: UIScreen.main.bounds.width - 100, progress: .constant(100), timeString: "00:00", predicateTime: "00:00")
    }
}

