//
//  WeakHeatView.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/08.
//

import SwiftUI

enum HeatType {
    
    case Strong
    case Weak
    
}

struct HeatView: View {
    
    @Environment(\.scenePhase) private var scenePhase
    @EnvironmentObject var model : RiceModel
    @StateObject var vm = HeatViewModel()
    
    var type : HeatType
    
    var body: some View {
        
        VStack(spacing : 20) {
            
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
            
            case .Strong :
                
                VStack(spacing : 10) {
                    
                    Text("強火")
                        .fontWeight(.semibold)
                    
                    HStack(spacing : 5) {
                        
                        ForEach(0..<3) { i in
                            Image(systemName: "flame.fill")
                                .font(.system(size: 48))
                                .foregroundColor(.red)
                        }
                    }
                }
                .padding()
                
              

                ProgressCircleView(circleColor: Color.red, maxValue: vm.heatTimer, progress: $vm.counter, timeString: vm.timeFormatter, predicateTime: vm.predicateTimeString)
                    .onReceive(vm.timer) { (_) in
                        vm.onComplete(envModel: model)
                    }
            case .Weak :
                
                VStack(spacing : 10) {
                    
                    Text("弱火")
                        .fontWeight(.semibold)
                    
                    HStack(spacing : 5) {
                        
                        ForEach(0..<3) { i in
                            Image(systemName: "flame.fill")
                                .font(.system(size: 32))
                                .foregroundColor(.blue)
                        }
                    }
                }
                .padding()
                
                
                ProgressCircleView(circleColor: Color.blue, maxValue: vm.heatTimer, progress: $vm.counter, timeString: vm.timeFormatter, predicateTime: vm.predicateTimeString)
                    .onReceive(vm.timer) { (_) in
                        vm.onComplete(envModel: model)
                    }
                
            }
            
            
            Spacer()
                        
            HStack(spacing : 10) {
                
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
            vm.setRiceObj(rice: model.rice, heatType: type)
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

