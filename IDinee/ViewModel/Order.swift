//
//  Order.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

class Order: ObservableObject{
    @Published var items_sell = [MenuItem]()
    @Published var items_all = [MenuSection]()
    
    
    
    
    
    var total: Int {
        if items_sell.count > 0 {
            return items_sell.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }
    

    
    func getFavorited() -> [MenuSection] {
        
        var aux = [MenuSection]()
        aux = items_all
        
        for ms in items_all{
            
            if let i = items_all.firstIndex(where: {$0.id == ms.id}){
                let mi = ms.items.filter{$0.isFavorited}
                aux[i].items = mi
            }
            
        }
        
        return aux
    }
   
    func add(item: MenuItem) {
        items_sell.append(item)
    }
    
    func addfavorite(item: MenuItem){
        
        if let index_outside = items_all.firstIndex(where: {$0.items.firstIndex(where: {$0 == item}) != nil}){
            print(index_outside )
            if let index_inside = items_all[index_outside].items.firstIndex(where: {$0 == item}){
                self.items_all[index_outside].items[index_inside].isFavorited.toggle()
                print(index_inside )
            }
        }
    }
    

    func remove(item: MenuItem) {
        if let index = items_sell.firstIndex(of: item) {
            items_sell.remove(at: index)
        }
    }
    
    func removeAll(){
        self.items_sell.removeAll()
    }
}
