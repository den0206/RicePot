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
    @Published var showOnboadind : Bool = true
    
    
    @AppStorage("amountRice") var amount: Int = 1
    @AppStorage("lastDate") var lastDate: String = ""
    @AppStorage("ShowImage") var showImage : Bool = true


    func setRiceAmount(amount : Int) {
      
        switch amount {
        default:
            rice = Rice(amount: amount)
            self.amount = amount
        }
        
    }
    
    func nextPage<T>(_ value : T? = nil) {
        
        switch state {
        
        case .Home :
            setRiceAmount(amount: value as! Int)
            state = .Wash
        case .Wash :
            state = .Predicate
        case .Predicate :
            state = .Intarval
        case .Intarval :
            state = .WaterAmount
        case .WaterAmount :
            state = .StrongHeat
        case .StrongHeat :
            state = .WeakHeat
        case .WeakHeat:
            state = .Boil
        case .Boil:
            state = .Home
            setLastDate()
        }
    }
    
    func setLastDate() {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ydMMM", options: 0, locale: Locale(identifier: "ja_JP"))
        
        lastDate = dateFormatter.string(from: Date())
    }
    
    
    
    
}
