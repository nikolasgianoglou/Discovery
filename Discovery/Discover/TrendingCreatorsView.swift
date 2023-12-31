//
//  TrendingCreatorsView.swift
//  Discovery
//
//  Created by Nikolas Gianoglou Coelho on 26/10/2023.
//

import SwiftUI

struct TrendingCreatorsView: View {
    
    let users: [User] = [
        .init(name: "Amy Adams", imageName: "amy"),
        .init(name: "Billy", imageName: "billy"),
        .init(name: "Sam Smith", imageName: "sam"),
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Trending Creators")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 12){
                    ForEach(0..<users.count) { index in
                        VStack {
                            Image(users[index].imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .cornerRadius(.infinity)
                            
                            Text(users[index].name)
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 60)
                        .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        .padding(.bottom)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}


struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsView()
    }
}
