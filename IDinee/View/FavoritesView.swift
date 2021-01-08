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
        NavigationView{
            List{
                ForEach(order.getFavorited()) { section in
                    

                    Section(header: Text(section.name)){
                        ForEach(section.items){ item  in
                            itemRow(item: item)
                        }
                    }
                    
                }
              
                
            } .navigationTitle("Favorites")
            .listStyle(GroupedListStyle())
            
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        FavoritesView().environmentObject(order)
    }
}
