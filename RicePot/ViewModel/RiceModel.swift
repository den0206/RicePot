//
//  RiceModel.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/06.
//

import Foundation
import SwiftUI


class RiceModel : ObservableObject {
    
    @Published var state : ViewState = .Home
    @Published var rice : Rice = .init(amount : 1)
 
    func setRiceAmount(amount : Int) {
      
        switch amount {
        default:
            rice = Rice(amount: amount)
        }
        
    }
    
    func nextPage<T>(_ value : T? = nil) {
        
        switch state {
        
        case .Home :
            setRiceAmount(amount: value as! Int)
            state = .Wash
        case .Wash :
            state = .Intarval
        case .Intarval :
            state = .WaterAmount
        case .WaterAmount :
            print("waterAmount")
       
        }
    }
    
    
    
    
}