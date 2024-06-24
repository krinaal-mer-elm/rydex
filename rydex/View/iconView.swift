//
//  iconView.swift
//  rydex
//
//  Created by elluminati on 24/06/24.
//

import SwiftUI

struct iconView: View {
  let iconName: String
  let title: String

  var body: some View {
    HStack {
      Image(systemName: iconName)
        .foregroundColor(.black)
        .font(.caption2)
      Text(title)
            .font(.caption2)
        .foregroundColor(.black)
        .fontWeight(.light)
    }
    .frame(height: 8)
    .padding(8)
    .background(Color.rgb(red: 235, green: 235, blue: 235))
    .cornerRadius(6)
  }
    
}


struct iconView_Previews: PreviewProvider {
    static var previews: some View {
        iconView(iconName: "house.fill", title: "Home")
    }
}

extension Color {
    static func rgb(red: Int, green: Int, blue: Int) -> Color {
        return Color(
            red: Double(red) / 255.0,
            green: Double(green) / 255.0,
            blue: Double(blue) / 255.0
        )
    }
}
