//
//  ContentView.swift
//  TipCalculator
//
//  Created by Uday Kumar Kotla on 24/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var total: String = ""
    @State private var tipPercentage: Double = 0.2
    @State private var tip: String?
    @State private var message: String = ""
    let tipCalculator = TipCalculator()
    var body: some View {
        NavigationView {
            
            VStack {
                
                TextField("Enter total", text: $total)
                    .textFieldStyle(.roundedBorder)
                    .accessibilityIdentifier("total_text_field")
                
                Picker(selection: $tipPercentage) {
                    Text("10%").tag(0.1)
                    Text("20%").tag(0.2)
                    Text("30%").tag(0.3)
                } label: {
                    EmptyView()
                }.pickerStyle(.segmented)
                    .accessibilityIdentifier("tipPercentageSegmented")
                
                Button("Calculate Tip") {
                    message = ""
                    tip = ""
                    guard let tot = Double(total)else{
                        message = "Invalid Input"
                        return
                    }
                    do{
                        
                       let result = try tipCalculator.calculate(total: tot, tipPercentage: tipPercentage)
                        let formatter = NumberFormatter()
                        formatter.numberStyle = .currency
                        tip = formatter.string(from: NSNumber(value: result))
                        
                    }
                    catch(TipCalculatorErrors.invalidInput){
                        message = "Invalid Input"
                    }
                    catch{
                        message = error.localizedDescription
                    }
                    
                }.padding(.top, 20)
                    .accessibilityIdentifier("calculate_Tip_button")
                
                Text(message)
                    .padding(.top, 50)
                    .accessibilityIdentifier("Message_Text")
                
                Spacer()
                
                Text(tip ?? "")
                    .font(.system(size: 54))
                    .accessibilityIdentifier("tip_value")
                
                Spacer()
                .navigationTitle("Tip Calculator")
            }.padding()
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
