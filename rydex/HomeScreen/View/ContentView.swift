import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var vm = HomeScreenVM()
    let offerArray: [String] = ["one", "two", "three"]
    let dataArray: [(String, String)] = []
    var rowss: [GridItem] {
        if vm.dataArray2.count <= 3 {
            return Array(repeating: GridItem(.flexible(), spacing: 16), count: vm.dataArray2.count)
         } else {
             return Array(repeating: GridItem(.flexible(), spacing: 16), count: 2)
         }
     }
    
    let icons = itemsIcons()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        iconViewWithContextMenu(iconName: "person.fill", title: "For me")
                        
                        Text("Rajkot")
                            .fontWeight(.light)
                            .font(.footnote)
                            .foregroundColor(Color.rgb(red: 239, green: 19, blue: 0))
                            .padding(.vertical, 6)
                        Text("Let's get started")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                            .padding(.bottom, 15)
                    }
                    
                    VStack(alignment: .leading, spacing: 10.0) {
                        Text("Where did you want to go today?")
                            .font(.caption)
                            .fontWeight(.light)
                        Button(action: {}, label: {
                            Circle()
                                .foregroundColor(Color.rgb(red: 241, green: 95, blue: 92))
                                .overlay {
                                    Image(systemName: "arrow.right")
                                        .resizable()
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.white)
                                        .frame(width: 10, height: 10)
                                }
                                .frame(width: 20, height: 20)
                            Text("Set Your Destination")
                                .font(.caption)
                                .foregroundColor(Color.gray)
                        })
                    }
                    .padding(.horizontal, 20.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 80)
                    .background(Color.rgb(red: 245, green: 245, blue: 245))
                    .cornerRadius(10)
                    
                    HStack {
                        iconView(iconName: "house.fill", title: "Home")
                        iconView(iconName: "bag.fill", title: "office")
                        iconView(iconName: "heart.fill", title: "See all favorites")
                    }
                    TabView {
                        ForEach(0 ..< 5) { ind in
                            OfferView()
                                .tag(ind)
                                .padding(.horizontal , 5)
                        }
                    }
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity)
                    .frame(height: 160)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    Text("How would you like to ride?")
                        .padding(.vertical)
                        .font(.footnote)
                        .fontWeight(.light)
                    
                        LazyVGrid(
                            columns: rowss,
                            spacing: 6,
                            content: {
                                ForEach(vm.dataArray2.filter { !$0.isDisabled }) { offer in
                                    NavigationLink {
                                        secondScreen()
                                    } label: {
                                        VStack {
                                            Image(offer.imageName)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .background(Color.rgb(red: 245, green: 245, blue: 245))
                                                .cornerRadius(15)
                                            Text(offer.name)
                                                .font(.caption)
                                                .fontWeight(.light)
                                                .foregroundColor(Color.black)
                                            
                                        }
                                    }
                                }
                            })
    
                    
                    Text("Rides near you")
                        .padding(.vertical)
                        .font(.footnote)
                        .fontWeight(.light)
                    
                    GoogleMapsView(currentLocation: Binding(
                        get: { locationManager.lastKnownLocation?.coordinate },
                        set: { _ in }
                    ))
                    .frame(height: 180)
                }
                .padding(.horizontal)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        icons.menuButton
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        icons.notificationButton
                    }
                }
            }
            .padding(.vertical, 10)
        }
        .navigationTitle("")
        .onAppear {
            locationManager.requestAuthorization()
            locationManager.startUpdating()
            vm.fetchVehicleTypes()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

