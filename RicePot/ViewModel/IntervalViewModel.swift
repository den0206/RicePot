//
//  IntervalViewModel.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/07.
//

import Foundation
import SwiftUI

class IntervalViewModel : ObservableObject {
    
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var counter : CGFloat = 0.0
    
    @Published var isActive : Bool = false
    
    var rice : Rice = .init(amount: 1)
    
    var intervalTimer : CGFloat {
        rice.interval
    }
    
    
    func setInterval(rice : Rice) {
        self.rice = rice
        self.counter = rice.interval
    }
    
    var timeFormatter : String {
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = [.pad]
        
        return formatter.string(from: TimeInterval(counter)) ?? "00:00:00"
    }
    
    func onComplete() {
        
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
            
        default :
            break
        }
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
        
        envModel.nextPage(Optional<Never>.none)
    }
    
    func skipTimer(envModel : RiceModel) {
        timer.upstream.connect().cancel()
        isActive = false
        
        envModel.nextPage(Optional<Never>.none)
        
    }
}
