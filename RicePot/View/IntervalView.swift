//
//  IntervalView.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/07.
//

import SwiftUI

enum IntervalType {
    case Puton
    case Boil
}

struct IntervalView: View {
    
    @Environment(\.scenePhase) private var scenePhase

    @EnvironmentObject var model : RiceModel
    @StateObject  var vm = IntervalViewModel()
    
    var type : IntervalType
    
    var body: some View {
        
        VStack(spacing : 20){
            
            
            HStack {
                Spacer()
                
                Button(action: {
                    vm.configureAlert(alerType: .Skip, envModel: model)
                }) {
                    Image(systemName: "arrowshape.turn.up.right")
                        .font(.system(size: 24))
                        .foregroundColor(.gray)
                }
            }
            .padding()
            
            Spacer()
            
            switch type {
            
            case .Puton :
                Text("Puton")
            case .Boil :
                Text("Boil")
            }
       
            ProgressCircleView(circleColor: Color.green, maxValue: vm.intervalTimer, progress: $vm.counter, timeString: vm.timeFormatter, predicateTime: vm.predicateTimeString)
                .onReceive(vm.timer) { (_) in
                    vm.onComplete(envModel: model)
                }
            
            Spacer()
            
            
            HStack(spacing :  10) {
                
                CustomButton(action: {
                    vm.configureAlert(alerType: .Finish, envModel: model)
                }, color: Color.blue, text: "終了する")
               
                CustomButton(action: {
                    vm.stopTimer()
                }, color: vm.isActive ? Color.red : Color.green ,text: vm.isActive ? "一時停止" : "再開")
               
            }
            .padding()
            
            Spacer()

            
        }
        .background(model.showImage ? AnyView(backgroundImageView(iIndex: 1)) : AnyView(Color.white))
        .alert(isPresented: $vm.showAlert, content: { () -> Alert in
            vm.alert
        })
        .onAppear {
            vm.setInterval(rice: model.rice)
        }
        .onChange(of: scenePhase) { (phase) in
            
            if phase == .background {
                vm.startDate = Date()
               
                
            } else if phase == .active {
                vm.returnDate = Date()
                vm.caluculateBackground()
                
            }
        }
        
    }
}

