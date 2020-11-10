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
    
    @AppStorage("lastDate") var lastDate: String = ""

    
    var body: some View {
        
        VStack(spacing : 25) {
            
            if lastDate != "" {
                Group {
                    Text("前回炊いた日")
                        .foregroundColor(.gray)
                    Text(lastDate)
                        .fontWeight(.bold)

                }
                .font(.system(size: 24))
                
                
            }
            
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

            }.padding()
        
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

