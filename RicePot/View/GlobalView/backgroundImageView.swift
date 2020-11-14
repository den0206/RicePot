//
//  backgroundImageView.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/14.
//

import SwiftUI

struct backgroundImageView: View {
    
    var iIndex : Int 

    var body: some View {
        
        Image("rice-\(iIndex)")
            .resizable()
            .scaledToFill()
            .overlay(Color.white.opacity(0.5))
//            .blur(radius: 0.5)
            .edgesIgnoringSafeArea(.all)

        
    }
}

