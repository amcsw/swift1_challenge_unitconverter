//
//  ContentView.swift
//  swift1-challenge-unitconversion
//
//  Created by AMC Software on 19/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var temperatureFrom = "Celsius"
    @State private var temperatureTo = "Farenheit"
    @State private var temperatureValue: Double = 0
    
    var finalResult: Double {
        
        if temperatureFrom == "Celsius" && temperatureTo == "Farenheit" {
            return temperatureValue * 9/5 + 32.0
        } else
        if temperatureFrom == "Farenheit" && temperatureTo == "Celsius" {
            return (temperatureValue - 32.0) * 5/9
        } else
        if temperatureFrom == "Celsius" && temperatureTo == "Kelvin" {
            return (temperatureValue + 273.15)
        } else
        if temperatureFrom == "Kelvin" && temperatureTo == "Celsius" {
            return (temperatureValue - 273.15)
        } else
        if temperatureFrom == "Farenheit" && temperatureTo == "Kelvin" {
            return (temperatureValue + 459.67) * 5/9
        } else
        if temperatureFrom == "Kelvin" && temperatureTo == "Farenheit" {
            return (temperatureValue * 9/5) - 459.67
        }
        
        return temperatureValue
    }
    
    let tempertatureOptions = ["Celsius", "Farenheit","Kelvin"]
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Section {
                    
                    Picker("From", selection: $temperatureFrom) {
                        ForEach(tempertatureOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("From")
                }
                
                Section {
                    Picker("From", selection: $temperatureTo) {
                        ForEach(tempertatureOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("To")
                }
                
                Section {
                    TextField("Value",
                              value: $temperatureValue,
                              format: .number
                    )
                    .keyboardType(.decimalPad)
                } header: {
                    Text("Enter value")
                }
                
                Section {
                    Text(finalResult, format: .number)
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Temperature converter")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
