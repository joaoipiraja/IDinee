//
//  itemRow.swift
//  IDinee
//
//  Created by João Victor Ipirajá de Alencar on 07/01/21.
//

import SwiftUI

struct itemRow: View {
    
    @EnvironmentObject var order:Order
    
    static let colors: [String:Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green ]
    var item: MenuItem
    
    var body: some View {
        
        NavigationLink(destination: itemDetailed(item: item)){
            
        HStack{
            
            ZStack(alignment: .bottom){
                
                if(item.isFavorited){
                    Image(systemName: "star.fill")
                }else{
                    Image(systemName: "star")
                }
                
                Button("    "){
                    order.addfavorite(item: item)
                }.buttonStyle(PlainButtonStyle())
            }.padding()
           
            
            Image(item.thumbnailImage).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(Color.gray, lineWidth: 2))
            
            VStack(alignment: .leading){
                Text(item.name).font(.headline)
                Text("$\(item.price)")
            }.layoutPriority(1)
            
            Spacer()
            
            //passa a string como identiifier
            ForEach(item.restrictions, id: \.self){ restriction in
                Text(restriction).font(.caption).fontWeight(.black).padding(5).background(Self.colors[restriction, default: .black]).clipShape(Circle()).foregroundColor(.white)
            }
           
        }
        
    }
}
}

struct itemRow_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        itemRow(item: MenuItem.example).environmentObject(order)
    }
}
