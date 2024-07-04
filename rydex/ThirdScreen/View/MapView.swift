//
//  MapView.swift
//  rydex
//
//  Created by elluminati on 02/07/24.
//

import SwiftUI
import CoreLocation

struct MapView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var locationManager = LocationManager()
    @State private var dragOffset = CGSize.zero
    var fullScreenheight = UIScreen.main.bounds.height + 40
    private var overlayHeight: CGFloat = UIScreen.main.bounds.height / 3 + 20
    @State var changeValue = CGSize.zero
    @State private var isFullScreen = false
    @StateObject private var viewModel = MapViewModel()
    let icons = itemsIcons()
    
    
    var body: some View {
        ZStack {
            GoogleMapsView(currentLocation: Binding(
                get: { locationManager.lastKnownLocation?.coordinate },
                set: { _ in }
            ))
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                locationManager.requestAuthorization()
                locationManager.startUpdating()
                viewModel.fetchVehicleTypes()
            }
            .overlay(alignment: .bottom, content: {
                VStack {
                    if isFullScreen {
                        VStack{
                            Rectangle()
                                .frame(height: UIScreen.main.bounds.height / 7)
                                .opacity(0)
                            withAnimation(.easeOut(duration: 2)){
                                LocationsView()
                                    .padding(.horizontal)
                            }
                            HStack{
                                Text("Choose Ride")
                                    .fontWeight(.medium )
                                    .foregroundColor(Color.black)
                                Spacer()
                                iconViewWithContextMenu(iconName: "calendar.badge.clock", title: "Now")
                            }
                            .padding()
                            ScrollView {
                                VStack{
                                    ForEach(viewModel.vehicleTypes) { type in
                                        dataView(image: type.imageURL, type: type.name.en, capacity: type.passengerCapacity, driver: type.isDriverAvailable, price: type.price)
                                            .padding(.horizontal)
                                        Divider()
                                            .padding(.leading,20)
                                    }
                                }
                            }
                            Spacer()
                            NavigationLink {
                            } label: {
                                HStack{
                                    Text("Ride with Rydex")
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
                                .padding()
                            }
                        }

                    } else {
                        // Default overlay content
                        VStack{
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: 35, height: 3 )
                                .padding(.top)
                            HStack{
                                Text("Choose Ride")
                                    .fontWeight(.medium )
                                    .foregroundColor(Color.black)
                                Spacer()
                                iconViewWithContextMenu(iconName: "calendar.badge.clock", title: "Now")
                            }
                            .padding()
                            
                            ForEach(viewModel.vehicleTypes.prefix(2)) { type in
                                dataView(image: type.imageURL, type: type.name.en, capacity: type.passengerCapacity, driver: type.isDriverAvailable, price: type.price)
                                    .padding(.horizontal)
                                
                                Divider()
                                    .padding(.leading, 20)
                            }
                            
                            NavigationLink(destination: EmptyView()) {
                                HStack {
                                    Text("Ride with Rydex")
                                        .fontWeight(.bold)
                                    Image(systemName: "arrow.right")
                                        .fontWeight(.bold)
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .font(.subheadline)
                                .background(Color.rgb(red: 12, green: 29, blue: 67))
                                .cornerRadius(8)
                                .padding(.horizontal)
                            }
                        }
                    }
                    Spacer()
                }
                .background(Color.white)
                .cornerRadius(isFullScreen ? 0 : 30)
                .padding(.top)
                .frame(height: isFullScreen ? fullScreenheight : (overlayHeight - dragOffset.height + 10))
                .frame(maxWidth: .infinity)
//                .offset(y: dragOffset.height)
                .gesture(
                    DragGesture()
//                        .onChanged { value in
//                            guard !isFullScreen else { return }
//                            let translation = value.translation
//                            let limitedTranslation = CGSize(width: 0, height: min(max(translation.height, -100), 100))
//                            dragOffset = limitedTranslation
//
//                        }
//                        .onEnded { value in
//                            guard !isFullScreen else { return }
//                            if value.translation.height < -10 {
//                                withAnimation {
//                                    dragOffset = .zero
//                                    overlayHeight = UIScreen.main.bounds.height + 30
//                                    isFullScreen = true
//                                }
//                            }else {
//                                withAnimation {
//                                    dragOffset = .zero
//                                }
//                            }
//                        }
                        .onChanged { value in
                                      if value.translation.height < 0 {
                                          withAnimation(.linear) {
                                              dragOffset = value.translation
                                          }
                                      }
                                  }
                                  .onEnded { value in
                                      if dragOffset.height < -25 {
                                          withAnimation(.linear) {
                                              isFullScreen = true
                                          }
                                      } else {
                                          withAnimation(.linear) {
                                              isFullScreen = false
                                          }
                                      }
                                      dragOffset = .zero
                                  }
                )
                .animation(.spring(), value: dragOffset)
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    icons.backButton
                        .onTapGesture(perform: {
                            if isFullScreen {
                                withAnimation {
                                    dragOffset = .zero
                                    isFullScreen = false
                                }
                            }else{
                                presentationMode.wrappedValue.dismiss()
                            }
                        })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    icons.notificationButton
                        .padding(.trailing)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    icons.sliderButton
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarBackButtonHidden(true)
        }
    }
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MapView()
        }
    }
}
