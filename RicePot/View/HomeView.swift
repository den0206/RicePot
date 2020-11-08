//
//  HomeView.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/06.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model : RiceModel
    @State private var selectAmount : Int = 1
    
    var body: some View {
        
        VStack(spacing : 35) {
            
            Picker("", selection: $selectAmount) {
                
                ForEach(1 ..< 10, id : \.self) { i in
                    Text("\(i)")
                }
            }
            .labelsHidden()
            .padding()
            
           
            
            
            Text("\(selectAmount) 合炊く")
                .font(.system(size: 35))
                .font(.headline)
                .fontWeight(.bold)
            
            CustomButton {
                model.nextPage(selectAmount)

            }
        
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

