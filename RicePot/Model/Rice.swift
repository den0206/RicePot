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
    
    let waterAmount : CGFloat
    let highHeatTime : CGFloat
    let lowHeatTime : CGFloat
    
    init(amount : Int) {
        
        self.ammount = amount
        self.waterAmount = CGFloat(amount * 200)
        self.highHeat = amount + 5
        self.lowHeat = amount + 6
        
        self.highHeatTime = CGFloat(highHeat * 60)
        self.lowHeatTime = CGFloat(lowHeat * 60)
        
    }
    
 
   
    
}
