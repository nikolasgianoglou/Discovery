//
//  CategoryDetailsView.swift
//  Discovery
//
//  Created by Nikolas Gianoglou Coelho on 30/10/2023.
//

import Kingfisher
import SwiftUI
import SDWebImageSwiftUI

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
//                            KFImage(URL(string: vm.places[index].thumbnail))
                            WebImage(url: URL(string: vm.places[index].thumbnail))
                                .resizable()
                                .indicator(.activity)
                                .transition(.fade(duration: 0.5))
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


struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailsView()
    }
}
