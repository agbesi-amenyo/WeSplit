//
//  ContentView.swift
//  WeSplit
//
//  Created by Agbesi Amenyo on 19/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson : Double {
        let peopleCount = Double (numberOfPeople + 2)
        
        let tipSelection = Double (tipPercentage )
        let tipValue = checkAmount/100 * tipSelection
        
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal/peopleCount
        
        return amountPerPerson
        
    }
    
    var totalAmout : Double {
        let tipSelection = Double (tipPercentage )
        let tipValue = checkAmount/100 * tipSelection
        
        let grandTotal = checkAmount + tipValue
        return grandTotal
        
    }
    
     
    var body: some View {
        
        NavigationView {
            
            Form {
                Section {
                    if #available(iOS 15.0, *) {
                        TextField("Amount", value : $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                            .keyboardType(.decimalPad)
                    } else {
                        // Fallback on earlier versions
                    }
                    
                    Picker("Number of people", selection:$numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                
             
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0..<101){
                            if #available(iOS 15.0, *) {
                                Text($0, format: .percent)
                            } else {
                                // Fallback on earlier versions
                            }
                        }
                    }
//                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave? ")
                }
                
                
                Section {
                    if #available(iOS 15.0, *) {
                        Text(totalAmout, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                    } else {
                        // Fallback on earlier versions
                    }
                  
                    
                }header: {
                    Text("Total Amount for the Check")
                }
                
                
                Section {
                    if #available(iOS 15.0, *) {
                        Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                    } else {
                        // Fallback on earlier versions
                    }
                  
                    
                }header: {
                    Text("Amount Per Person")
                }
                
            }
            .navigationTitle("WeSplit")
            
        }
    
            
        }
       

    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
