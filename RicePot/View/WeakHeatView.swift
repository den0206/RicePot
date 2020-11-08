//
//  WeakHeatView.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/08.
//

import SwiftUI

struct WeakHeatView: View {
    
    @EnvironmentObject var model : RiceModel
    @StateObject var vm = HeatViewModel()
    
    var body: some View {
        
        VStack(spacing : 20) {
            
            Text("Weak")
            
            ProgressCircleView(circleColor: Color.red, maxValue: vm.heatTimer, progress: $vm.counter, timeString: vm.timeFormatter)
                .onReceive(vm.timer) { (_) in
                    vm.onComplete(envModel: model)
                }
            
            Spacer()
            
            HStack(spacing : 10) {
                
                CustomButton(action: {
                    vm.finishTimer(envModel: model)
                }, color: Color.blue, text: "終了する")
               
                CustomButton(action: {
                    vm.stopTimer()
                }, color: vm.isActive ? Color.red : Color.green ,text: vm.isActive ? "一時停止" : "再開")
                
            }

        }
        .onAppear {
            vm.setRiceObj(rice: vm.rice, heatType: .Weak)
        }
    }
}
