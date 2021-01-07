//
//  IDineeApp.swift
//  IDinee
//
//  Created by João Victor Ipirajá de Alencar on 07/01/21.
//

import SwiftUI

@main
struct IDineeApp: App {
    var order = Order()

    init(){
        let menu = Bundle.main.decode([MenuSection].self, from:"menu.json")
        self.order.items_all = menu
    }
   
    var body: some Scene {
       
        WindowGroup {
            
            AppView().environmentObject(order)
            
        }
    }
}
