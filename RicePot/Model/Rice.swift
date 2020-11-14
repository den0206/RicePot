//
//  Rice.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/06.
//

import Foundation
import SwiftUI

struct Rice {
    
    let ammount : Int
    let highHeat : Int
    let lowHeat : Int
   
    let interval : CGFloat = 1800
    
    var waterAmount : CGFloat
    let highHeatTime : CGFloat
    let lowHeatTime : CGFloat
    
    init(amount : Int) {
        
        self.ammount = amount
        self.waterAmount = CGFloat(amount * 200)
        
        switch amount {
        
        case 1,2,3:
            self.highHeat = 8
            self.lowHeat = 7
            
        case 4,5,6 :
            self.highHeat = 9
            self.lowHeat = 7
            
        case 7,8,9 :
            self.highHeat = 9
            self.lowHeat = 8
        default:
            self.highHeat = amount + 5
            self.lowHeat = amount + 6
        }
        
        
        self.highHeatTime = CGFloat(highHeat * 60)
        self.lowHeatTime = CGFloat(lowHeat * 60)
        
    }
    
 
   
    
}
