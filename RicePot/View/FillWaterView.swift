//
//  FillWaterView.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/08.
//

import SwiftUI

struct WaterAmountView: View {
    
    @EnvironmentObject var model : RiceModel
    
    var body: some View {
        
        VStack {
            
            Text("\(model.rice.waterAmount) ml")
                .foregroundColor(.black)
                .font(.headline)
                .fontWeight(.black)
        }
    }
}

struct FillWaterView_Previews: PreviewProvider {
    static var previews: some View {
        WaterAmountView()
    }
}
