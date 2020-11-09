//
//  PredicateVIew.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/10.
//

import SwiftUI

struct PredicateView: View {
    
    @EnvironmentObject var model : RiceModel

    var body: some View {
        
        VStack {
            CustomButton(action: {
                model.nextPage(Optional<Never>.none)
            })
            .padding()
        }
    }
}

struct PredicateVIew_Previews: PreviewProvider {
    static var previews: some View {
        PredicateView()
    }
}
