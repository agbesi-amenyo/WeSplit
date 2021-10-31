//
//  ContentView.swift
//  WeSplit
//
//  Created by Agbesi Amenyo on 19/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    
    let tipPercentages = [10,15,20,25,0]
    
     
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
                }
                
                Section {
                    if #available(iOS 15.0, *) {
                        Text(checkAmount, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
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
                        ForEach(tipPercentages, id:\.self){
                            if #available(iOS 15.0, *) {
                                Text($0, format: .percent)
                            } else {
                                // Fallback on earlier versions
                            }
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave? ")
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
