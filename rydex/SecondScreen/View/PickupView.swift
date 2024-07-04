//
//  PickupView.swift
//  rydex
//
//  Created by elluminati on 26/06/24.
//

import SwiftUI

struct PickupView: View {
    var address: String
    
    var body: some View {
        HStack (spacing: 15){
            
            VStack(spacing: 0) {
                DottedVerticalLineShape()
                    .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round))
                    .padding(.top, 20)
                    .frame(width: 1, height: 60)
                    .foregroundColor(Color.gray)
                    .overlay {
                        Circle()
                            .frame(width: 28, height: 28)
                            .foregroundColor(Color.rgb(red: 225, green: 225, blue: 225))
                            .overlay {
                                Circle()
                                    .fill(Color.rgb(red: 11, green: 29, blue: 27))
                                    .frame(width: 22, height: 22)
                                    .overlay(Image(systemName: "arrow.down")
                                        .foregroundColor(.white)
                                        .frame(width: 20, height: 20)
                                    )
                            }
                    }
            }
            .padding(.horizontal)
            VStack(alignment: .leading , spacing: 4) {
                
                Text("Pickup")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(address)
                    .font(.footnote)
                    .lineLimit(1)
                
            }
            Spacer()
        }
       
        .padding(.horizontal , 15)
    }
}

struct PickupView_Previews: PreviewProvider {
    static var previews: some View {
        PickupView(address: "No Location")
    }
}
