//
//  OrderView.swift
//  IDinee
//
//  Created by João Victor Ipirajá de Alencar on 07/01/21.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order:Order
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items){ item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
                
                Section{
                    NavigationLink(destination:
                                    CheckOutView()){
                        Text("Place Order")
                    }
                }.disabled(order.items.isEmpty)
            }
            .navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
        
    }
    
    func deleteItems(at offsets: IndexSet){
        order.items.remove(at: offsets.first!)
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
