//
//  ImageHorizontalScrollView.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import SwiftUI

struct ImageHorizontalScrollView: View {
    let geo: GeometryProxy
    let photos: [ImageData]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(photos) { image in
                    Image(image.imageString)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: max(geo.size.width - 40, 0), height: geo.size.height * 0.2)
                        .clipped()
                        .clipShape(.rect(cornerRadius: 10))
                        .shadow(radius: 3, x: 0, y: 5)
                }
            }
            .scrollTargetLayout()
            .padding(20)
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
    }
}

#Preview {
    GeometryReader { geo in
        ImageHorizontalScrollView(geo: geo, photos: ImageData.imageDummyData)
    }
}
