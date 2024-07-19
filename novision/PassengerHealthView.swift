//
//  PassengerHealthView.swift
//  novision
//
//  Created by Thabhelo Duve on 7/18/24.

import SwiftUI
import CoreData

struct PassengerHealthView: View {
    var passenger: Passenger

    var body: some View {
        VStack(alignment: .leading) {
            Text(passenger.name)
                .font(.largeTitle)
                .padding()

            HStack {
                Text("Heart Rate:")
                Spacer()
                Text("\(passenger.heartRate) BPM")
            }
            .padding()

            HStack {
                Text("Oxygen Saturation:")
                Spacer()
                Text("\(passenger.oxygenSaturation)%")
            }
            .padding()

            HStack {
                Text("Blood Pressure:")
                Spacer()
                Text("\(passenger.bloodPressureSystolic)/\(passenger.bloodPressureDiastolic) mmHg")
            }
            .padding()

            HStack {
                Text("Temperature:")
                Spacer()
                Text("\(passenger.temperature)°C")
            }
            .padding()

            HStack {
                Text("Condition:")
                Spacer()
                Text(passenger.condition)
            }
            .padding()
        }
        .navigationTitle("Passenger Health")
    }
}
