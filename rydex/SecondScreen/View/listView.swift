//
//  listView.swift
//  rydex
//
//  Created by elluminati on 26/06/24.
//

import SwiftUI
struct listView: View {
    var body: some View {

              VStack(alignment: .leading) {
                  Text("Favorite Address")
                      .font(.footnote)
                      .fontWeight(.regular)
                      .padding([.top, .leading, .trailing])
                  
                  VStack{
                      AddressRow(icon: "house.fill", title: "Home", subtitle: "Rajkot, Gujarat, India", iconz: "ellipsis")
                      Divider()
                      
                      AddressRow(icon: "briefcase.fill", title: "Office", subtitle: "7PV7+78 Rajkot, Gujarat, India", iconz: "ellipsis")
                      Divider()
                      
                      AddressRow(icon: "plus.circle.fill", title: "Add new address", subtitle: "", iconz: "")
                      Divider()
                      
                      AddressRow(icon: "map.fill", title: "Set Location on map", subtitle: "", iconz: "")
                      Divider()
                      
                      AddressRow(icon: "pin.fill", title: "Set Destination Later", subtitle: "", iconz: "")
                  }
                  
                  Spacer()
              }
              .padding(.horizontal , 10)
              .background(Color.rgb(red: 240, green: 240, blue: 240))
          
      }
}

struct listView_Previews: PreviewProvider {
    static var previews: some View {
        listView()
    }
}

