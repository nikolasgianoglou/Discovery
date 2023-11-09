//
//  CustomMapAnnotationView.swift
//  Discovery
//
//  Created by Nikolas Gianoglou Coelho on 09/11/2023.
//

import SwiftUI

struct CustomMapAnnotationView: View {
    
    let attraction: Attraction
    
    var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                Image(attraction.imageName)
                    .resizable()
                    .frame(width: 80,
                           height: 60)
                    .cornerRadius(4)
                    .overlay {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(.init(white: 0, alpha: 0.5)))
                    }
                
                Text(attraction.name)
                    .font(.system(size: 12,
                                  weight: .semibold))
                    .padding(.horizontal, 6)
                    .padding(.vertical, 4)
                    .background(
                        LinearGradient(colors: [Color.red, Color.blue],
                                       startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(5)
                    .foregroundColor(.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(.init(white: 0, alpha: 0.5)))
                    }
            } else {
                Image(attraction.imageName)
                    .resizable()
                    .frame(width: 80,
                           height: 60)
                    .cornerRadius(4)
                Text(attraction.name)
                    .font(.system(size: 12,
                                  weight: .semibold))
                    .padding(.horizontal, 6)
                    .padding(.vertical, 4)
                    .background(
                        LinearGradient(colors: [Color.red, Color.blue],
                                       startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(5)
                    .foregroundColor(.white)
            }
        }.shadow(radius: 5)
    }
}

struct CustomMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomMapAnnotationView(attraction: Attraction( name: "Eiffel Tower",
                                imageName: "art2",
                                latitude: 48.859565,
                                longitude: 2.353235))
    }
}
