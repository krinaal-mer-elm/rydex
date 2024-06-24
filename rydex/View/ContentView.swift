//
//  ContentView.swift
//  rydex
//
//  Created by elluminati on 24/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    VStack (alignment: .leading){
                        iconViewWithContextMenu(iconName: "person.fill", title: "For me")
                        Text("Rajkot")
                            .fontWeight(.light)
                            .font(.footnote)
                            .foregroundColor(Color.rgb(red: 239, green: 19, blue: 0))
                            .padding(.vertical , 6)
                        Text("Let's get started")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                            .padding(.bottom , 15)
                    }
                    
                    VStack(alignment: .leading, spacing: 10.0){
                        Text("Where did you want to go today?")
                            .font(.caption)
                            .fontWeight(.light)
                        Button(action: {}, label: {
                            Circle()
                                .foregroundColor(Color.rgb(red: 241, green: 95, blue: 92))
                                .overlay {
                                    Image(systemName: "arrow.right")
                                        .resizable()
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.white)
                                        .frame(width: 10, height: 10)
                                }
                                .frame(width: 20, height: 20)
                            Text("Set Your Destination")
                                .font(.caption)
                                .foregroundColor(Color.gray)
                        })
                    }
                    .padding(.horizontal , 20.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 80)
                    .background(Color.rgb(red: 245, green: 245, blue: 245))
                    .cornerRadius(10)
                    
                    HStack{
                        iconView(iconName: "house.fill", title: "Home")
                        iconView(iconName: "bag.fill", title: "office")
                        iconView(iconName: "heart.fill", title: "See all favorites")
                    }
                    HStack{
                        VStack{
                            Text("Hit the Road and Save Big")
                            Text("Use code for $5 Off Your Taxi Ride Today!")
                                .font(.caption2)
                        }
                        Image("Image12")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 140)
                    .background(Color.rgb(red: 253, green: 239, blue: 239))
                    .cornerRadius(15)
                    
                    
                }
                .padding(.horizontal)
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        menuButton
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        notificationButton
                    }
                }
            }
            .padding(.vertical , 10)
        }
        .navigationTitle("")
        .padding(.horizontal , 7)
        .padding(.top , 5)
    }
    private var menuButton: some View {
        Button(action: {
            // Action for back button
        }) {
            Image(systemName: "line.3.horizontal.decrease")
                .resizable()
                .foregroundColor(.black)
                .offset(x: -7.5)
                .frame(width: 25)
                .clipped()
        }
    }
    private var notificationButton: some View {
        ZStack {
            Button(action: {
                // Action for notification button
            }) {
                Image(systemName: "bell.fill")
                    .resizable()
                    .foregroundColor(.black)
            }
            
            // Notification badge
            Circle()
                .foregroundColor(.red)
                .frame(width: 10, height: 10)
                .overlay(
                    Text("")
                        .font(.caption)
                        .foregroundColor(.white)
                )
                .offset(x: 10, y: -2)
        }
    }
    
    private var settingsButton: some View {
        Button(action: {
            // Action for settings button
        }) {
            Image(systemName: "slider.horizontal.3")
                .rotationEffect(Angle(degrees: 180))
                .foregroundColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Font {
    static func googleFont(_ name: String, size: CGFloat) -> Font {
        return Font.custom(name, size: size)
    }
}
