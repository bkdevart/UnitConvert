//
//  ContentView.swift
//  UnitConvert
//
//  Created by Brandon Knox on 2/23/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = ""
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    
    let volumeUnits = ["milliliters", "liters", "cups", "pints", "gallons"]
    
    var convertedValue: Double {
        // TODO calculations
        let inputDouble = Double(inputNumber) ?? 0
        // TODO figure out how to factor correct unit
        let inputMeasure = Measurement(value: inputDouble, unit: UnitVolume.bushels)
        let value = inputMeasure.converted(to: .imperialTeaspoons).value
        return value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input Value")) {
                    TextField("Value", text: $inputNumber)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Input Unit")) {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0 ..< volumeUnits.count) {
                            Text("\(self.volumeUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output Unit")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(0 ..< volumeUnits.count) {
                            Text("\(self.volumeUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converted Value")) {
                    Text("\(convertedValue, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("UnitConvert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
