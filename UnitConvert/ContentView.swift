//
//  ContentView.swift
//  UnitConvert
//
//  Created by Brandon Knox on 2/23/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let volumeUnits = ["milliliters", "liters", "cups", "pints", "gallons"]
    
    var convertedValue: Double {
        // TODO calculations
        let inputDouble = Double(inputNumber) ?? 0
        let inputSelection = volumeUnits[inputUnit]
        let outputSelection = volumeUnits[outputUnit]
        var inputMeasure = Measurement(value: inputDouble, unit: UnitVolume.milliliters)
        var value: Double

        // doing a case statement until more elegant solution found
        switch inputSelection {
        case "milliliters":
            inputMeasure = Measurement(value: inputDouble, unit: UnitVolume.milliliters)
        case "liters":
            inputMeasure = Measurement(value: inputDouble, unit: UnitVolume.liters)
        case "cups":
            inputMeasure = Measurement(value: inputDouble, unit: UnitVolume.cups)
        case "pints":
            inputMeasure = Measurement(value: inputDouble, unit: UnitVolume.pints)
        case "gallons":
            inputMeasure = Measurement(value: inputDouble, unit: UnitVolume.gallons)
            print("Gallons")
        default:
            inputMeasure = Measurement(value: inputDouble, unit: UnitVolume.milliliters)
        }

        switch outputSelection {
        case "milliliters":
            value = inputMeasure.converted(to: .milliliters).value
        case "liters":
            value = inputMeasure.converted(to: .liters).value
        case "cups":
            value = inputMeasure.converted(to: .cups).value
        case "pints":
            value = inputMeasure.converted(to: .pints).value
        case "gallons":
            value = inputMeasure.converted(to: .gallons).value
        default:
            value = inputMeasure.converted(to: .milliliters).value
        }

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
