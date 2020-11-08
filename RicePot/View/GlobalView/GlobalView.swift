//
//  GlobalView.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/06.
//

import SwiftUI

struct CustomButton: View {
    var action : () -> Void
    var color : Color = Color.green
    var text : String = "つぎへ"
    
    var body: some View {
        
        Button(action: {action()}, label: {
            Text(text)
                .frame(width: 100, height: 50)
                .background(color)
                .foregroundColor(.white)
                .clipShape(Capsule())
        })
        
    }
}

