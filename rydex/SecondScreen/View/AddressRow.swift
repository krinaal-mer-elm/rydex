//
//  AddressRow.swift
//  rydex
//
//  Created by elluminati on 26/06/24.
//

import SwiftUI

struct AddressRow: View {
    let icon: String
    let title: String
    let subtitle: String
    let iconz : String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color.rgb(red: 12, green: 29, blue: 67))
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
               
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.footnote)
                if !subtitle.isEmpty {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(.leading, 8)
            
            Spacer()
            
            Image(systemName: iconz)
                .rotationEffect(Angle(degrees: 90))
                .foregroundColor(Color.rgb(red: 12, green: 29, blue: 67))
                
            
        }
       
        .padding(.horizontal)
    }
}

struct AddressRow_Previews: PreviewProvider {
    static var previews: some View {
        AddressRow(icon: "house.fill", title: "Home", subtitle: "Rajkot, Gujarat, India", iconz: "ellipsis")
    }
}

