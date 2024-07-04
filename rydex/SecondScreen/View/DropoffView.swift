//
//  DropoffView.swift
//  rydex
//
//  Created by elluminati on 26/06/24.
//

import SwiftUI
struct DropoffView: View {
    var address: String
    
    var body: some View {
        HStack ( spacing: 15 ){
            
            VStack(spacing: 0.0) {
                DottedVerticalLineShape()
                    .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round))
                    .frame(width: 1, height: 40)
                    .foregroundColor(Color.gray)
                    .padding(.bottom , 20)
                    .overlay {
                        Circle()
                            .frame(width: 28, height: 28)
                            .foregroundColor(Color.rgb(red: 225, green: 225, blue: 225))
                            .overlay {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 22, height: 22)
                                    .overlay(Image(systemName: "pin.fill")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .frame(width: 20, height: 20)
                                    )
                            }
                    }
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading ,spacing: 7) {
                Text("Drop Off")
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

struct DropoffView_Previews: PreviewProvider {
    static var previews: some View {
        DropoffView(address: "NO Location")
    }
}
