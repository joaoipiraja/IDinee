//
//  ContentView.swift
//  IDinee
//
//  Created by João Victor Ipirajá de Alencar on 07/01/21.
//

import SwiftUI

struct ContentView: View {
  
    @EnvironmentObject var order:Order


    var body: some View {
        NavigationView{
            List{
                ForEach(order.items_all) { section in
                    
                    Section(header: Text(section.name)){
                        ForEach(section.items){ item  in
                            itemRow(item: item)
                        }
                    }
                    
                }
              
                
            } .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        ContentView().environmentObject(order)
    }
}
