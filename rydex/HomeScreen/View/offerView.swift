//
//  offerView.swift
//  rydex
//
//  Created by elluminati on 24/06/24.
//

import SwiftUI

struct OfferView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 6.0){
                Text("Hit the Road and Save Big")
                    .fontWeight(.regular)
                Text("Use code for $5 Off Your Taxi Ride Today!")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 9))
                Text("TAXIFUN5")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .font(.caption2)
                    .padding(5)
                    .background(Color.rgb(red: 241, green: 95, blue: 92))
                    .cornerRadius(15)
            }
            .padding(.vertical)
            .overlay(alignment: .bottomLeading){
                Text("*Terms & Conditions Applied")
                    .font(.system(size: 6))
                    .foregroundColor(Color.gray)
            }
            
            Image("Image12")
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 120)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: 160)
        .background(Color.rgb(red: 253, green: 239, blue: 239))
        .cornerRadius(25)
       
    }
}

struct offerView_Previews: PreviewProvider {
    static var previews: some View {
        OfferView()
    }
}
