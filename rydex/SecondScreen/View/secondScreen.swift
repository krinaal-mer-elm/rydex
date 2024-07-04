//
//  secondScreen.swift
//  rydex
//
//  Created by elluminati on 25/06/24.
//

import SwiftUI


struct secondScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State var locations : [String] = ["No Location"]
    @State var numberOfLocations: Int = 0
    @State var num : [String] = ["1","2","3"]
    let icons = itemsIcons()
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading){
                        LocationsView()
                    
                }
                .padding(.horizontal)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        icons.backButton
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        icons.notificationButton
                    }
                }
                listView()
            }
            .padding(.vertical, 10)
            Spacer()
            NavigationLink {
                MapView()
            } label: {
                HStack{
                    Text("Continue")
                        .fontWeight(.bold)
                    Image(systemName: "arrow.right")
                        .fontWeight(.bold)
                }
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .font(.subheadline)
                .background(Color.rgb(red: 12, green: 29, blue: 67))
                .cornerRadius(8)
                .padding(.horizontal)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
    var middleView : some View {
        HStack(spacing: 0){
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray.opacity(0.3))
            Button {
                
            } label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .foregroundColor(Color.black)
            }
        }
        .padding(.horizontal)
    }
}
struct DottedVerticalLineShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let dashHeight: CGFloat = 2
        let dashSpacing: CGFloat = 2
        
        var y: CGFloat = 0
        while y < rect.height {
            path.move(to: CGPoint(x: rect.midX, y: y))
            path.addLine(to: CGPoint(x: rect.midX, y: y + dashHeight))
            y += dashHeight + dashSpacing
        }
        return path
    }
}

struct secondScreen_Previews: PreviewProvider {
    static var previews: some View {
        secondScreen()
    }
}



