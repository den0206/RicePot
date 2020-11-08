//
//  RicePotApp.swift
//  RicePot
//
//  Created by 酒井ゆうき on 2020/11/06.
//

import SwiftUI

@main
struct RicePotApp: App {
    
    @StateObject var model = RiceModel()
    
    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(model)
        }
    }
}
