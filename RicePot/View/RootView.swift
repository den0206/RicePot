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
    case StrongHeat
    case WeakHeat
    case Boil

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
            IntervalView(type: .Puton)
        case .WaterAmount :
            WaterAmountView()
        case .StrongHeat:
            StrongHeatView()
        case .WeakHeat :
            WeakHeatView()
        case .Boil :
            IntervalView(type: .Boil)
        }
    }
}
