//
//  ContentView.swift
//  novision
//
//  Created by Thabhelo Duve on 6/16/24.
//

import SwiftUI
import SwiftData
import CoreData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var passengers: [Passenger] = []
    @State private var selectedPassenger: Passenger? = nil

    @State private var showAddPassengerAlert: Bool = false
    @State private var newPassengerName: String = ""
    @State private var newPassengerHeartRate: Double = 0.0
    @State private var newPassengerOxygenSaturation: Double = 0.0
    @State private var newPassengerBloodPressureSystolic: Double = 0.0
    @State private var newPassengerBloodPressureDiastolic: Double = 0.0
    @State private var newPassengerTemperature: Double = 0.0
    @State private var newPassengerCondition: String = ""

    var body: some View {
        NavigationSplitView {
            List(passengers) { passenger in
                Button(action: {
                    selectedPassenger = passenger
                }) {
                    Text(passenger.name)
                }
            }
            .navigationTitle("Passengers")
            .toolbar {
                Button("Add") {
                    showAddPassengerAlert.toggle()
                }
            }
            .alert("Add Passenger", isPresented: $showAddPassengerAlert) {
                VStack {
                    TextField("Passenger Name", text: $newPassengerName)
                    TextField("Heart Rate", value: $newPassengerHeartRate, formatter: NumberFormatter())
                    TextField("Oxygen Saturation", value: $newPassengerOxygenSaturation, formatter: NumberFormatter())
                    TextField("Blood Pressure Systolic", value: $newPassengerBloodPressureSystolic, formatter: NumberFormatter())
                    TextField("Blood Pressure Diastolic", value: $newPassengerBloodPressureDiastolic, formatter: NumberFormatter())
                    TextField("Temperature", value: $newPassengerTemperature, formatter: NumberFormatter())
                    TextField("Condition", text: $newPassengerCondition)
                    Button("Cancel", role: .cancel, action: {})
                    Button("Create") {
                        let passenger = Passenger(
                            name: newPassengerName,
                            age: 0, // Add an age field if needed
                            heartRate: newPassengerHeartRate,
                            oxygenSaturation: newPassengerOxygenSaturation,
                            bloodPressureSystolic: newPassengerBloodPressureSystolic,
                            bloodPressureDiastolic: newPassengerBloodPressureDiastolic,
                            temperature: newPassengerTemperature,
                            condition: newPassengerCondition
                        )
                        modelContext.insert(passenger)
                        passengers.append(passenger)
                        newPassengerName = ""
                        newPassengerHeartRate = 0.0
                        newPassengerOxygenSaturation = 0.0
                        newPassengerBloodPressureSystolic = 0.0
                        newPassengerBloodPressureDiastolic = 0.0
                        newPassengerTemperature = 0.0
                        newPassengerCondition = ""
                    }
                }
            }
        } detail: {
            if let selectedPassenger {
                PassengerHealthView(passenger: selectedPassenger)
            } else {
                VStack {
                    Text("Select a passenger")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                    
                    if let dashboardURL = URL(string: "http://127.0.0.1:8050/dashboard/") {
                                            NavigationLink(destination: DashboardView(url: dashboardURL)) {
                                                Text("Go to Health Dashboard")
                                                    .font(.title)
                                                    .padding()
                                                    .background(Color.blue)
                                                    .foregroundColor(.white)
                                                    .cornerRadius(10)
                                            }
                                        } else {
                                            Text("Invalid URL for the Health Dashboard")
                                                .foregroundColor(.red)
                                        }
                }
            }
        }
        .onAppear {
            passengers = fetchPassengers()
        }
    }
    
    private func fetchPassengers() -> [Passenger] {
        let fetchRequest: NSFetchRequest<PassengerEntity> = PassengerEntity.fetchRequest()

        do {
            let fetchedPassengers = try viewContext.fetch(fetchRequest)
            return fetchedPassengers.map { passengerEntity in
                Passenger(
                    name: passengerEntity.name ?? "",
                    age: Int(passengerEntity.age), // Convert Int16 to Int
                    heartRate: passengerEntity.heartRate,
                    oxygenSaturation: passengerEntity.oxygenSaturation,
                    bloodPressureSystolic: passengerEntity.bloodPressureSystolic,
                    bloodPressureDiastolic: passengerEntity.bloodPressureDiastolic,
                    temperature: passengerEntity.temperature,
                    condition: passengerEntity.condition ?? ""
                )
            }
        } catch {
            print("Failed to fetch passengers: \(error.localizedDescription)")
            return []
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
