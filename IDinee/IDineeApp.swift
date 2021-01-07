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
    var body: some Scene {
        WindowGroup {
            AppView().environmentObject(order)
        }
    }
}
