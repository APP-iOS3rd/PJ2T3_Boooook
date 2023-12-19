//
//  ImageHorizontalScrollView.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import SwiftUI
import SwiftData

struct ImageHorizontalScrollView: View {
	let geo: GeometryProxy
	let photos: [Data]
    @State var isShowImageView: Bool = false
	
	var body: some View {
		ScrollView(.horizontal) {
			HStack(spacing: 10) {
				ForEach(photos, id: \.self) { photo in
					if let uiImage = UIImage(data: photo) {
                        NavigationLink {
                            FullSizeImageView(uiImage: uiImage)
                        } label: {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: max(geo.size.width - 40, 0), height: geo.size.height * 0.3)
                                .clipped()
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 3, x: 0, y: 5)
                        }
					} else {
						Image("defaultImage")
							.resizable()
							.aspectRatio(contentMode: .fill)
							.frame(width: max(geo.size.width - 40, 0), height: geo.size.height * 0.3)
							.clipped()
							.clipShape(.rect(cornerRadius: 10))
							.shadow(radius: 3, x: 0, y: 5)
					}
				}
			}
			.scrollTargetLayout()
			.padding(20)
		}
		.scrollIndicators(.hidden)
		.scrollTargetBehavior(.viewAligned(limitBehavior: .always))
	}
}

struct FullSizeImageView: View {
    @Environment(\.dismiss) var dismiss
    let uiImage: UIImage
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.offBrown)
                        }
                    }
                }
        }
    }
}

//#Preview {
//	GeometryReader { geo in
//		ImageHorizontalScrollView(geo: geo, photos: ImageData.imageDummyData)
//	}
//}
