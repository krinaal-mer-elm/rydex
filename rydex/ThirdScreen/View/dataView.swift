//
//  dataView.swift
//  rydex
//
//  Created by elluminati on 02/07/24.
//

import SwiftUI

struct dataView: View {
  
    var image : String
    var type : String
    var capacity : Int
    var driver : Bool
    var price : String
    
    var body: some View {
        HStack{
            Image(image)
                .resizable()
                .frame(width: 70, height: 40)

            VStack(alignment: .leading) {
                HStack(spacing: 11.0) {
                    Text(type)
                        .fontWeight(.medium)
                        .font(.system(size: 16))
                    Rectangle()
                        .frame(width: 20, height: 20)
                        .cornerRadius(6)
                        .overlay {
                            HStack(spacing: 1){
                                Image(systemName: "person.fill")
                                    .font(.system(size: 8))
                                Text("\(capacity)")
                                    .font(.system(size: 10))
                            }
                            .font(.caption2)
                            .foregroundColor(Color.white)
                        }
                }
                Text( driver ? "Driver available":"No Driver Available")
                    .font(.caption)
                    .foregroundColor(Color.rgb(red: 175, green: 175, blue: 175))
            }
            .padding(.leading , 10)
            Spacer()
            Text(price)
                .padding(.bottom)
        }
    }
}

struct dataView_Previews: PreviewProvider {
    static var previews: some View {
        dataView(image: "car.2", type: "SUV", capacity: 5, driver: false, price: "555")
    }
}
