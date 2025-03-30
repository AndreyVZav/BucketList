//
//  ContentView6.swift
//  BucketList
//
//  Created by Андрей Завадский on 27.03.2025.
//
import SwiftUI
import MapKit


struct ContentView6: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    @State private var viewModel = ViewModel()
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach(viewModel.locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Button(action: {
                            viewModel.selectedPlace = location
                        }) {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundStyle(.red)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(.circle)
                        }
                        .onLongPressGesture {
                            viewModel.selectedPlace = location
                        }
                    }
                }
            }
            .onTapGesture { position in
                
                if let coordinate = proxy.convert(position, from: .local) {
                    
                    viewModel.addLocation(at: coordinate)
                }
            }
            .sheet(item: $viewModel.selectedPlace) { place in
                EditView(location: place) {
                    viewModel.update(location: $0)
                    
                    
                }
            }
        }
    }
}

#Preview {
    ContentView6()
}
