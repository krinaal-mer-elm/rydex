import SwiftUI
import GoogleMaps

struct GoogleMapsView: UIViewRepresentable {
    @Binding var currentLocation: CLLocationCoordinate2D?

    private let defaultLatitude: CLLocationDegrees = 22.27094
    private let defaultLongitude: CLLocationDegrees = 70.73864
    private let defaultZoom: Float = 10
    private let circleRadius: CLLocationDistance = 50 // Radius in meters

    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: defaultLatitude, longitude: defaultLongitude, zoom: defaultZoom)
        let options = GMSMapViewOptions()
        options.frame = CGRect.zero
        options.camera = camera
        let mapView = GMSMapView.init(options: options)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        return mapView
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {
        uiView.clear() // Clear existing markers and circles

        if let location = currentLocation {
            let camera = GMSCameraPosition.camera(withLatitude: location.latitude, longitude: location.longitude, zoom: defaultZoom)
            uiView.animate(to: camera)

            // Create a blue circle to represent the current location
            let circle = GMSCircle(position: location, radius: circleRadius)
            circle.fillColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.1) // Light blue color with transparency
            circle.strokeColor = .blue // Blue border
            circle.strokeWidth = 1
            circle.map = uiView

            // Create a marker to represent the current location
            let marker = GMSMarker(position: location)
            let markerView = UIImageView(image: UIImage(named: "custom-marker"))
            markerView.frame.size = CGSize(width: 30, height: 30) // Adjust size as needed
            marker.iconView = markerView
            marker.map = uiView
            
        } else {
            let camera = GMSCameraPosition.camera(withLatitude: defaultLatitude, longitude: defaultLongitude, zoom: defaultZoom)
            uiView.animate(to: camera)
        }
    }
}
