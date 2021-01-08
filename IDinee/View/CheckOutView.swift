//
//  CheckOutView.swift
//  IDinee
//
//  Created by João Victor Ipirajá de Alencar on 07/01/21.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order:Order
    
    static let paymentTypes = ["Cash", "Credit Cards","IDinee Points"]
    static let tipAmounts = [10,15,20,25,0]
    
    @State private var paymentType = 0
    @State private var addLayaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    
    
    var totalPrice:Double{
        let total = Double(order.total)
        let tipValue = total/100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    //Binding change State
    
    
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay?", selection: $paymentType){
                    ForEach(0..<Self.paymentTypes.count){
                        Text(Self.paymentTypes[$0])
                    }
                }
            
            
            Toggle(isOn: $addLayaltyDetails.animation()){
                Text("Add iDinee loyalty card")
            }
            
            if addLayaltyDetails{
                TextField("Enter your iDine ID", text: $loyaltyNumber)
            }
            }
            
            Section(header: Text("Add a tip?")){
                Picker("Percentage:", selection: $tipAmount){
                    ForEach(0..<Self.tipAmounts.count){
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Total $\(totalPrice, specifier: "%.2f")").font(.largeTitle) ){
                Button("Confirm your order"){
                    self.showingPaymentAlert.toggle()
                   
                }
            }
            
            
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert){
            Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f")\nThank you!"),dismissButton: Alert.Button.cancel(Text("OK"), action: {
                self.order.removeAll()
            }))
            
        }
        
    }
    
}

struct CheckOutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckOutView().environmentObject(order)
    }
}
