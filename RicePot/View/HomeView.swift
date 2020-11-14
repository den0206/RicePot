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
    @AppStorage("ShowImage") var showImage : Bool = true

    
    var body: some View {
        
        ZStack {
            
            /// Z1
            
            VStack(alignment: .trailing) {
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Toggle("", isOn: $showImage)
                            .labelsHidden()
                        
                        Text(showImage ? "背景画像無し" : "背景画像あり")
                            .font(.caption2)
                    }
                }
                .padding()
                Spacer()
            }
            .padding()
            
            
            /// Z2
            VStack(spacing : 25) {
                
                Spacer()
                
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
                .onAppear {
                    selectAmount = model.amount
                }
            
                Text("\(selectAmount) 合炊く")
                    .font(.system(size: 35))
                    .font(.headline)
                    .fontWeight(.bold)
                
                CustomButton {
                    model.nextPage(selectAmount)

                }.padding()
                
                Spacer()
            }
        }
        .background(showImage ? AnyView(backgroundImageView(iIndex: 1)) : AnyView(Color.white))
           
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

