//
//  WashView.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/06.
//

import SwiftUI

struct WashView: View {
    
    @EnvironmentObject var model : RiceModel
    
    
    var body: some View {
        
        VStack(spacing : 5) {
            
            Spacer()
            Text("お米を洗います")
                .font(.system(size: 35))
                .font(.headline)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
                        
            Text("※無洗米を除く")
                .font(.system(size: 25))
                .font(.caption2)
                .foregroundColor(.red)
            
            CustomButton(action: {
                model.nextPage(Optional<Never>.none)
            })
            .padding()
            
            Spacer()
            
            
        }
        .background(model.showImage ? AnyView(backgroundImageView(iIndex: 1)) : AnyView(Color.white))
        
    }
}



struct WashView_Previews: PreviewProvider {
    static var previews: some View {
        WashView()
    }
}
