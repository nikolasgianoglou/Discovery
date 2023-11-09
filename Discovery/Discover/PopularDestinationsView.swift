//
//  PopularDestinationsView.swift
//  Discovery
//
//  Created by Nikolas Gianoglou Coelho on 25/10/2023.
//

import MapKit
import SwiftUI

struct PopularDestinationsView: View {
    
    let destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.855014, longitude: 2.341231),
        .init(name: "Tokyo", country: "Japan", imageName: "japan", latitude: 35.67988, longitude: 139.7695),
        .init(name: "New York", country: "US", imageName: "new_york", latitude: 40.71592, longitude: -74.0055),
        
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular destinations")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8){
                    ForEach(destinations, id: \.self) { destination in
                        NavigationLink(destination: {
                            PopularDestinationsDetailsView(destination: destination)
                        }, label: {
                            PopularDestinationTile(destination: destination)
    //                        .modifier(TileModifier())
                            .padding(.bottom)
                        })
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct PopularDestinationsDetailsView: View {
    
    let destination: Destination
    @State var region: MKCoordinateRegion
    @State var isShowingAttractions = false
    
    let attractions:[Attraction] = [
        .init(name: "Eiffel Tower", latitude: 48.859565, longitude: 2.353235),
        .init(name: "Champs-Elysees", latitude: 48.866867, longitude: 2.311780),
        .init(name: "Louvre Museum", latitude: 48.860288, longitude: 2.337789),
    ]
    
    init(destination: Destination) {
        self.destination = destination
        region = MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude: destination.longitude), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1))
    }
    
    var body: some View {
        ScrollView {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 250)
                .clipped()
                
            VStack(alignment: .leading, spacing: 0) {
                Text(destination.name)
                    .font(.system(size: 18, weight: .bold))
        
                Text(destination.country)
                   
                HStack {
                    ForEach(0..<5) { index in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }
                .padding(.top, 4)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo")
                    .padding(.top, 2)
                    
                    
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.bottom)
            
            HStack(spacing: 0) {
                Text("Location")
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                Button {
                    isShowingAttractions.toggle()
                } label: {
                    Text("\(isShowingAttractions ? "Hide":"Show") Attractions")
                        .padding(.trailing, 7)
                        .font(.system(size: 14, weight: .semibold))
                        
                }
                
                Toggle("", isOn: $isShowingAttractions)
                    .labelsHidden()
                    .padding(.trailing)

            }
            
            
            
//            Map(coordinateRegion: $region)
//                .frame(height: 300)
            
            Map(coordinateRegion: $region,
                annotationItems: isShowingAttractions ? attractions: []) { attraction in
                MapMarker(coordinate: .init(latitude: attraction.latitude,
                                            longitude: attraction.longitude),
                          tint: .red)
                
            }
            .frame(height: 300)
            

        }
        .navigationTitle(destination.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Attraction: Identifiable {
    var id = UUID().uuidString
    
    let name: String
    let latitude, longitude: Double
}


struct PopularDestinationTile: View {
    
    let destination: Destination
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(5)
                .padding(.horizontal, 6)
                .padding(.vertical, 6)
            
            Text(destination.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .foregroundColor(Color(.label))
            
            Text(destination.country)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .padding(.bottom, 12)
                .foregroundColor(.gray)
        }
        .asTile()
    }
    
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularDestinationsDetailsView(destination: .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
//            PopularDestinationsDetailsView(destination: .init(name: "Tokyo", country: "Japan", imageName: "japan", latitude: 35.679693, longitude: 139.771913))
        }
        PopularDestinationsView()
        DiscoveryView()
    }
}
