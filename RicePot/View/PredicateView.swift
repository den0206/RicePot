//
//  PredicateVIew.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/10.
//

import SwiftUI

struct PredicateView: View {
    
    @EnvironmentObject var model : RiceModel
    @StateObject var vm  = PredicateViewModel()
    
    var body: some View {
        
        VStack(spacing : 10) {
            
            Text("予測時間")
                .padding()
            
            Spacer()
            
            ForEach(Array(zip(vm.actions, vm.dateStrings)), id : \.0) { item in
                
                PredicateCell(action: item.0, dateString: item.1)
                
            }
            
            Spacer()
            
            CustomButton(action: {
                model.nextPage(Optional<Never>.none)
            })
            .padding()
        }
        .background(model.showImage ? AnyView(backgroundImageView(iIndex: 1)) : AnyView(Color.white))
        .onAppear {
            vm.caluculateDate(model: model)
        }
    }

}


struct PredicateCell : View {
    
    var action : String
    var dateString : String
    
    var body: some View {
        
        
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.blue.opacity(0.2))
            .frame(width: 150, height: 100)
            .overlay(
                
                VStack {
                    Text(action)
                    Text(dateString)
                }
               
            )
                
            
        
    }
}

struct PredicateVIew_Previews: PreviewProvider {
    static var previews: some View {
        PredicateView()
    }
}
