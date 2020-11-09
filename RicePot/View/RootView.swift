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
    case Predicate
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
        case .Predicate :
            PredicateView()
        case .Intarval :
            IntervalView(type: .Puton)
        case .WaterAmount :
            WaterAmountView()
        case .StrongHeat:
            HeatView(type: .Strong)
        case .WeakHeat :
            HeatView(type: .Weak)
        case .Boil :
            IntervalView(type: .Boil)
        }
    }
}
