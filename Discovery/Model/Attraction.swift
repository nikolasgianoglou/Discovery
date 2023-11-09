//
//  Attraction.swift
//  Discovery
//
//  Created by Nikolas Gianoglou Coelho on 09/11/2023.
//

import Foundation

struct Attraction: Identifiable {
    var id = UUID().uuidString
    let name: String
    let imageName: String
    let latitude, longitude: Double
}
