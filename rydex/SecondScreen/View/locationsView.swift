import SwiftUI

struct LocationsView: View {
    @State var numberOfLocations: Int = 0
    @State private var animateDottedLines: [Bool] = []

    var body: some View {
        VStack(spacing: 0) {
            PickupView(address: "Om coldrinks ni bajuma 17 namdarni s...")
            Divider()
                .padding(.leading, 60)
            
            ForEach(0..<numberOfLocations, id: \.self) { index in
                locationRow(index: index)
            }
            
            Divider()
                .padding(.leading, 80)
                .overlay(alignment: .trailing) {
                    if numberOfLocations == 0 {
                        addStopButton()
                    }
                }
            
            DropoffView(address: "Drop Off")
                .overlay(alignment: .trailing) {
                    if numberOfLocations != 0 {
                        addButton()
                    }
                }
        }
        .frame(maxWidth: .infinity)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        .onAppear {
            animateDottedLines = Array(repeating: false, count: numberOfLocations)
        }
    }
    
    @ViewBuilder
    func locationRow(index: Int) -> some View {
        HStack(spacing: 15) {
            lineShape(index: index)
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 7) {
                Text("Location")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("address")
                    .font(.footnote)
                    .lineLimit(1)
            }
            Spacer()
            removeButton(index: index)
        }
        .padding(.horizontal, 15)
        
        Divider()
            .padding(.leading, 60)
    }

    @ViewBuilder
    func lineShape(index: Int) -> some View {
        VStack(spacing: 0.0) {
            DottedVerticalLineShape()
                .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round))
                .frame(width: 1, height: animateDottedLines.indices.contains(index) && animateDottedLines[index] ? 50 : 0)
                .foregroundColor(Color.gray)
                .overlay {
                    Circle()
                        .frame(width: 28, height: 28)
                        .foregroundColor(Color.rgb(red: 225, green: 225, blue: 225))
                        .overlay {
                            Circle()
                                .fill(Color.rgb(red: 11, green: 29, blue: 27))
                                .frame(width: 22, height: 22)
                                .overlay(
                                    Text("\(index + 1)")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .frame(width: 20, height: 20)
                                )
                        }
                }
                .onAppear {
                    withAnimation(.easeIn) {
                        if animateDottedLines.indices.contains(index) {
                            animateDottedLines[index] = true
                        }
                    }
                }
                .onDisappear {
                    if animateDottedLines.indices.contains(index) {
                        animateDottedLines[index] = false
                    }
                }
        }
    }

    @ViewBuilder
    func removeButton(index: Int) -> some View {
        Button {
            withAnimation {
                if numberOfLocations > 0 {
                    numberOfLocations -= 1
                    guard index < animateDottedLines.count else { return }
                    animateDottedLines.remove(at: index)
                }
            }
        } label: {
            Image(systemName: "x.circle")
                .foregroundColor(Color.gray.opacity(0.4))
        }
        .disabled(numberOfLocations == 0)
    }

    @ViewBuilder
    func addStopButton() -> some View {
        Button(action: {
            withAnimation {
                numberOfLocations = 1
                animateDottedLines = Array(repeating: false, count: numberOfLocations)
            }
        }) {
            Text("+ Add Stop")
                .frame(width: 60, height: 15)
                .font(.system(size: 8))
                .foregroundColor(Color.black)
                .background(Color.rgb(red: 253, green: 253, blue: 253))
                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 0.5)
                )
        }
        .offset(x: -20)
    }

    @ViewBuilder
    func addButton() -> some View {
        Button {
            withAnimation {
                if numberOfLocations < 3 {
                    numberOfLocations += 1
                    animateDottedLines.append(false)
                }
            }
        } label: {
            Image(systemName: "plus.circle")
                .foregroundColor(Color.black)
                .padding()
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
