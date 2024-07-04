//
//  Items.swift
//  rydex
//
//  Created by elluminati on 03/07/24.
//
import SwiftUI

class itemsIcons{
    var menuButton: some View {
        
        Image(systemName: "line.3.horizontal.decrease")
            .resizable()
            .foregroundColor(.black)
            .offset(x: -7.5)
            .frame(width: 25)
            .clipped()
            .fontWeight(.bold)
    }
    
    var backButton: some View {
        Image(systemName: "chevron.left")
            .resizable()
            .foregroundColor(.black)
            .clipped()
            .fontWeight(.medium)
    }
    
    var notificationButton: some View {
        ZStack {
            Image(systemName: "bell.fill")
                .resizable()
                .foregroundColor(.black)
            
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
    
    var settingsButton: some View {
        Image(systemName: "slider.horizontal.3")
            .rotationEffect(Angle(degrees: 180))
            .foregroundColor(.black)
    }
    
    var sliderButton: some View {
        Image(systemName: "slider.horizontal.3")
            .resizable()
            .foregroundColor(.black)
            .clipped()
            .fontWeight(.medium)
            .foregroundColor(Color.black)
            .rotationEffect(Angle(degrees: 180))
    }
    
}
