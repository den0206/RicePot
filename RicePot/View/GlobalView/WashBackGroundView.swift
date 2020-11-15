//
//  WashBackGroundView.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/15.
//

import SwiftUI


struct WashBackGroundView: View {
    var body: some View {
       
        Image("wash-rice")
            .resizable()
            .scaledToFill()
            .overlay(Color.white.opacity(0.5))
            .edgesIgnoringSafeArea(.all)
    }
}

struct WashBackGroundView_Previews: PreviewProvider {
    static var previews: some View {
        WashBackGroundView()
    }
}
