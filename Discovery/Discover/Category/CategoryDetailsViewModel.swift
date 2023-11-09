//
//  CategoryDetailsViewModel.swift
//  Discovery
//
//  Created by Nikolas Gianoglou Coelho on 30/10/2023.
//

import SwiftUI

class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMessage = ""
    
    init(name: String) {
        // real network
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased())".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: urlString)
        
        else {
            isLoading = false
            return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                    self.isLoading = false
                    self.errorMessage = "Bad status: \(statusCode)"
                    return
                }
                
                guard let data = data else { return }
                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                } catch let error {
                    print("Failed to decode JSON:", error)
                    self.errorMessage = error.localizedDescription
                }
                self.isLoading = false
            }
        
        }.resume()
        
        
        // network code will happen here, fake net work code
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
//            self.isLoading = false
//            self.places = [1,2,3,4]
//        })
    }
}

