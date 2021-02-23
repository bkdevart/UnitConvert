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
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input Unit")) {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0 ..< volumeUnits.count) {
                            Text("\(self.volumeUnits[$0])")
                        }
                    }
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
