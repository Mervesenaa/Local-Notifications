//
//  ContentView.swift
//  NotificationApp
//
//  Created by Merve Sena on 16.08.2024.
//

import SwiftUI

struct ContentView: View {
    private let notificationTitle = "🔖 Reminder"
    private let notificationBody = "Don't forget to check the notification!"
    @State private var notificationTime = Date()
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Text("Schedule Your Notification")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                        .padding(.top, 50)
                    
                    VStack(spacing: 20) {
                        VStack(spacing: 10) {
                            Text(notificationTitle)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            Text(notificationBody)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        .padding(.horizontal)
                        
                        DatePicker("Select Time", selection: $notificationTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .datePickerStyle(WheelDatePickerStyle())
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .padding(.horizontal)
                    }
                    .padding(.horizontal, 20)
                    
                    Button(action: {
                        NotificationManager.shared.scheduleNotification(at: notificationTime, title: notificationTitle, body: notificationBody)
                    }) {
                        Text("Schedule Notification")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(15)
                            .shadow(radius: 10)
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
            }
            .navigationTitle("Notification Scheduler")
            .onAppear {
                NotificationManager.shared.requestAuthorization()
            }
        }
    }
}

#Preview {
    ContentView()
}
