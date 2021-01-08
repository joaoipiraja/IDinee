//
//  itemDetailed.swift
//  IDinee
//
//  Created by João Victor Ipirajá de Alencar on 07/01/21.
//

import SwiftUI

struct itemDetailed: View {
    
    @EnvironmentObject var order:Order
    var item:MenuItem
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)").padding(4).background(Color.black).font(.caption).foregroundColor(.white).offset(x:-5, y: -5)
                
            }
            
            Text(item.description).padding()
            Spacer()
            
            Button(" Order This "){
                self.order.add(item: self.item)
                
            }.font(.title3).background(Color.red).foregroundColor(.white).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/).padding()
            
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct itemDetailed_Previews: PreviewProvider {
    
    static let order = Order()
    static var previews: some View {
        
        NavigationView{
            itemDetailed(item: MenuItem.example).environmentObject(order)
        }
       
    }
}
