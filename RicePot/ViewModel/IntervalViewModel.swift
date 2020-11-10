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
    
    var predicateTimeString = String()
    

    var timeFormatter : String {
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = [.pad]
        
        return formatter.string(from: TimeInterval(counter)) ?? "00:00:00"
    }
    
    let calender = Calendar(identifier: .japanese)
    @Published var startDate : Date? = nil
    @Published var returnDate : Date? = nil
    
    
    func setInterval(rice : Rice) {
        self.rice = rice
        self.counter = rice.interval
        
        setPredicate(rice: rice)
   
    }
    
    func setPredicate(rice : Rice) {
        let currentDate = Date()
        let formatter = DateFormatter()
        
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.locale = Locale.current
       
        guard let modifiedDate = Calendar.current.date(byAdding: .second, value: Int(rice.interval), to: currentDate) else {return}
        
        predicateTimeString = formatter.string(from: modifiedDate)
        
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
            
            
            /// next-page
            envModel.nextPage(Optional<Never>.none)
            
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
        
        envModel.state = .Home
    }
    
    func skipTimer(envModel : RiceModel) {
        timer.upstream.connect().cancel()
        isActive = false
        
        envModel.nextPage(Optional<Never>.none)
        
    }
    
    func caluculateBackground() {
        
        guard startDate != nil && returnDate != nil else {return}
        
        let diff = calender.dateComponents([.second], from: startDate!, to: returnDate!)
        
        counter -= CGFloat(diff.second!)
    }
}
