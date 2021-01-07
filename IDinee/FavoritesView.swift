//
//  FavoritesView.swift
//  IDinee
//
//  Created by João Victor Ipirajá de Alencar on 07/01/21.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var order:Order

    var body: some View {
        Text("Available soon")
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        FavoritesView().environmentObject(order)
    }
}
