//
//  DiscoveryCategoriesView.swift
//  Discovery
//
//  Created by Nikolas Gianoglou Coelho on 26/10/2023.
//

import Kingfisher
import SwiftUI
import SDWebImageSwiftUI

struct DiscoveryCategoriesView: View {
    
    let categories: [Category] = [
        Category(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sports", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "music.mic"),
        .init(name: "History", imageName: "music.mic")
    ]
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(0..<categories.count) { index in
                    NavigationLink {
                        NavigationLazyView(
                            CategoryDetailsView(name: categories[index].name)
                        )
                        
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
