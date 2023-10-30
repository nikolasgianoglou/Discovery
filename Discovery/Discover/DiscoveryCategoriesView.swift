//
//  DiscoveryCategoriesView.swift
//  Discovery
//
//  Created by Nikolas Gianoglou Coelho on 26/10/2023.
//

import SwiftUI

struct DiscoveryCategoriesView: View {
    
    let categories: [Category] = [
        Category(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "music.mic"),
        .init(name: "History", imageName: "music.mic")
    ]
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(0..<categories.count) { index in
                    NavigationLink {
                        CategoryDetailsView()
                    } label: {
                        VStack(spacing: 8) {
                            //                        Spacer()
                            Image(systemName: categories[index].imageName)
                                .foregroundColor(Color.orange)
                                .font(.system(size: 20))
                                .frame(width: 68, height: 68)
                                .background(Color.white)
                                .cornerRadius(.infinity)
                            Text(categories[index].name)
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                        .frame(width: 70)
                    }

                }
            }.padding(.horizontal)
        }
    }
}

struct Place: Decodable {
    let id: Int
    let name, thumbnail: String
}

class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMessage = ""
    
    init() {
        // real network
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
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

struct ActivityIndicatorView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        view.color = .white
        return view
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
    
    typealias UIViewType = UIActivityIndicatorView
}

struct CategoryDetailsView: View {
    
    @ObservedObject var vm = CategoryDetailsViewModel()
    
    var body: some View {
        if vm.isLoading {
            VStack {
                ActivityIndicatorView()
                Text("Loading...")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding(10)
            .background(Color.black)
            .cornerRadius(8)
        } else {
            ZStack {
                Text(vm.errorMessage)
                ScrollView {
                    ForEach(0..<vm.places.count) { index in
                        VStack(alignment: .leading, spacing: 0) {
                            Image("art1")
                                .resizable()
                                .scaledToFill()
                            Text(vm.places[index].name)
                                .font(.system(size: 12, weight: .semibold))
                                .padding()
                                
                        }.asTile()
                            .padding()
                    }
                }
            }
            
            .navigationTitle("Category")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DiscoveryCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView {
//            CategoryDetailsView()
//        }
        DiscoveryView()
//        ZStack {
//            Color.orange
//            DiscoveryCategoriesView()
//        }
    }
}
