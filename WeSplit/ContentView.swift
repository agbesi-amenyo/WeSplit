//
//  ContentView.swift
//  WeSplit
//
//  Created by Agbesi Amenyo on 20/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    @FocusState private var amountIsFocused : Bool
    
   // let tipPercentages = [0,10,15,20,25]
    
    //Total check amount
    
    var totalCheckAmount : Double {
        let tipSelection = Double (tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
        
    }
    
    var totalPerPerson : Double {
        //calculate the total per person here
        let peopleCount = Double (numberOfPeople + 2)
        let tipSelection = Double (tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
        
    }
    
    // ccurrency property
    
    
    
    
    
    var body: some View {
        
        NavigationView{
            Form {
                Section{
                    TextField("Amount", value : $checkAmount,
                              format:
                            .currency(code:Locale.current.currencyCode ?? "EUR"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    
                    Picker("Number of people ", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                    
                }
                
                Section{
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0..<101){
                            Text($0, format: .percent)
                            
                        }
                    }
                
                }
                header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section{
                    Text(totalCheckAmount, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                } header: {
                    Text("Grand total")
                }
                
                
                Section{
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                } header: {
                    Text("Amount per person")
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        amountIsFocused = false
                    }
                    .foregroundColor(.red)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

