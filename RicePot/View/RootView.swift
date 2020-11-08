//
//  RootView.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/06.
//

import SwiftUI

enum ViewState {
    
    case Home
    case Wash
    case Intarval
    case WaterAmount
}


struct RootView: View {
    
    @EnvironmentObject var model : RiceModel
    
    var body: some View {
        
        switch  model.state {
        
        case .Home :
            HomeView()
        case .Wash :
            WashView()
        case .Intarval :
            IntervalView()
        case .WaterAmount :
            WaterAmountView()
            
        }
    }
}
