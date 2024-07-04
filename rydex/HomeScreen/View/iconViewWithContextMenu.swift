//
//  iconViewWithContextMenu.swift
//  rydex
//
//  Created by elluminati on 24/06/24.
//

import SwiftUI

struct iconViewWithContextMenu: View {
    let iconName: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.black)
                .font(.caption)
            Text(title)
                .font(.caption)
                .foregroundColor(.black)
                .fontWeight(.light)
            Image(systemName: "chevron.down")
                .font(.caption)
                .foregroundColor(.black)
                .contextMenu {
                    Button(action: {
                        print("Option 1 selected")
                    }) {
                        Text("Option 1")
                        Image(systemName: "star")
                    }
                    Button(action: {
                        print("Option 2 selected")
                    }) {
                        Text("Option 2")
                        Image(systemName: "pencil")
                    }
                    Button(action: {
                        print("Option 3 selected")
                    }) {
                        Text("Option 3")
                        Image(systemName: "trash")
                    }
                }
        }
        .padding(5)
        .background(Color.rgb(red: 245, green: 245, blue: 245))
        .cornerRadius(6)
    }
}

struct iconViewWithContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        iconViewWithContextMenu(iconName: "person.fill", title: "For me")
    }
}
