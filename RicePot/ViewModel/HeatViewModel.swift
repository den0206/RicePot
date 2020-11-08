//
//  HeatViewModel.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/08.
//

import Foundation
import SwiftUI

enum HeatType {
    
    case Strong
    case Weak
    
}

class HeatViewModel : ObservableObject {
    
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var counter : CGFloat = 0.0
    @Published var isActive : Bool = false
    
    @Published var heatType : HeatType = .Strong
    
    var rice = Rice(amount: 1)
    
    var heatTimer : CGFloat {
        switch heatType {
        case .Strong :
            return rice.highHeatTime
        case  .Weak :
            return rice.lowHeatTime
        }
    }
    
    func setRiceObj(rice : Rice , heatType : HeatType) {
        
        self.rice = rice
        
        switch heatType {
        case .Strong:
            self.heatType = .Strong
            self.counter = rice.highHeatTime
        case .Weak:
            self.heatType = .Weak
            self.counter = rice.lowHeatTime
        }
        
    }
    
    func onComplete(envModel : RiceModel) {
        
        
        if !isActive {
            isActive = true
        }
        
        if counter > 0 {
            counter -= 1
        }
        
        switch counter {
       
        case 0 :
        
            timer.upstream.connect().cancel()
            isActive = false
            print("finish")
            //MARK: - Finish
            envModel.nextPage(Optional<Never>.none)
     
        default:
            break
        }
        
        
    }
    
    
    var timeFormatter : String {
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = [.pad]
        
        return formatter.string(from: TimeInterval(counter)) ?? "00:00:00"
    }
    
    func stopTimer() {
        
        switch isActive {
        
        case true :
            timer.upstream.connect().cancel()
             
        case false :
            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            
        }
        isActive.toggle()
        
    }
    
    
    func finishTimer(envModel : RiceModel) {
        timer.upstream.connect().cancel()
        isActive = false
        
        envModel.state = .Home
    }
    
    func skipTimer(envModel : RiceModel) {
        timer.upstream.connect().cancel()
        isActive = false
        
        envModel.nextPage(Optional<Never>.none)
        
    }
    
    
    
    
    
    
    
}
