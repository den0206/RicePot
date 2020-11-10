//
//  PredicateViewModel.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/10.
//

import Foundation
import SwiftUI

class PredicateViewModel : ObservableObject {
    
    @Published var dateStrings : [String] = []
    let actions = ["水置き","強火","弱火", "蒸らし"]
    
    func caluculateDate(model : RiceModel) {
        
        let currentDate = Date()
        let formatter = DateFormatter()
        let modelDates = [model.rice.interval, model.rice.highHeatTime,model.rice.lowHeatTime, model.rice.interval]
        
        var sum : CGFloat = 0
        
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.locale = Locale.current
        
        
        modelDates.forEach { (date) in
           
            
            sum += date
            
            guard let modifiedDate = Calendar.current.date(byAdding: .second, value: Int(sum), to: currentDate) else {return}
            
            dateStrings.append(formatter.string(from: modifiedDate))
            
        }
        
    }
    
    
}
