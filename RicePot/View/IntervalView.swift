//
//  IntervalView.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/07.
//

import SwiftUI

struct IntervalView: View {
    
    @EnvironmentObject var model : RiceModel
    @StateObject  var vm = IntervalViewModel()
    
    var body: some View {
        
        VStack(spacing : 20){
            
            HStack {
                Spacer()
                
                Button(action: {
                    vm.skipTimer(envModel: model)
                }) {
                    Image(systemName: "arrowshape.turn.up.right")
                        .font(.system(size: 24))
                        .foregroundColor(.gray)
                }
            }
            .padding()
            
            Spacer()
       
            ProgressCircleView(circleColor: Color.green, maxValue: vm.intervalTimer, progress: $vm.counter, timeString: vm.timeFormatter)
                .onReceive(vm.timer) { (_) in
                    vm.onComplete()
                }
            
            Spacer()
            
            
            HStack(spacing :  10) {
                
                CustomButton(action: {
                    vm.finishTimer(envModel: model)
                }, color: Color.blue, text: "終了する")
               
                CustomButton(action: {
                    vm.stopTimer()
                }, color: vm.isActive ? Color.red : Color.green ,text: vm.isActive ? "一時停止" : "再開")
               
            }
            .padding()
            
        
            
        }
        .onAppear {
            vm.setInterval(rice: model.rice)
        }
        
    }
}

