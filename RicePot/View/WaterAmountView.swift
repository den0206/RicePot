//
//  FillWaterView.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/08.
//

import SwiftUI

struct WaterAmountView: View {
    
    @EnvironmentObject var model : RiceModel
    
    @State private var showAlert = false
    
    var body: some View {
        
        VStack(spacing : 10) {
            
            // TODO: - Eater image

            Text("\(Int(model.rice.waterAmount)) ml")
                .foregroundColor(.black)
                .font(.headline)
                .fontWeight(.black)
            
            HStack(spacing : 10) {
                
                CustomButton(action: {
                    showAlert = true
                }, color: Color.red, text: "終了する")
                .alert(isPresented: $showAlert) { () -> Alert in
                    
                    Alert(title: Text("終了しますか?"), primaryButton: .cancel(Text("キャンセル")), secondaryButton: .destructive(Text("終了する"), action: {
                        
                        model.rice = .init(amount: 1)
                        model.state = .Home
                        
                    }))
                }
                
                
                CustomButton(action: {
                    model.nextPage(Optional<Never>.none)
                })
            }
        }
    
    }
}

struct FillWaterView_Previews: PreviewProvider {
    static var previews: some View {
        WaterAmountView()
    }
}
