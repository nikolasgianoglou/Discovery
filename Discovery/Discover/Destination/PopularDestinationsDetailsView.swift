//
//  PopularDestinationsDetailsView.swift
//  Discovery
//
//  Created by Nikolas Gianoglou Coelho on 09/11/2023.
//

import MapKit
import SwiftUI

struct PopularDestinationsDetailsView: View {
    
    let destination: Destination
    @State var region: MKCoordinateRegion
    @State var isShowingAttractions = true
    
    let attractions:[Attraction] = [
        .init(name: "Eiffel Tower",
              imageName: "art2",
              latitude: 48.859565,
              longitude: 2.353235),
        .init(name: "Champs-Elysees",
              imageName: "art2",
              latitude: 48.866867,
              longitude: 2.311780),
        .init(name: "Louvre Museum",
              imageName: "art2",
              latitude: 48.860288,
              longitude: 2.337789),
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
//                MapMarker(coordinate: .init(latitude: attraction.latitude,
//                                            longitude: attraction.longitude),
//                          tint: .red)
                MapAnnotation(coordinate: .init(latitude: attraction.latitude,
                                                longitude: attraction.longitude),
                              content: {
                    CustomMapAnnotationView(attraction: attraction)
                })
                
            }
            .frame(height: 300)
            

        }
        .navigationTitle(destination.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}




struct PopularDestinations_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationsDetailsView(destination: .init(name: "Paris",
                                                          country: "France",
                                                          imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
    }
}
