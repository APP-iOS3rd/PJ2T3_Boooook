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
	
	@State var scale = 1.0
	@State private var lastScale = 1.0
	let minScale = 1.0
	let maxScale = 5.0
	
	var magnification: some Gesture {
		MagnificationGesture()
			.onChanged { state in
				adjustScale(from: state)
			}
			.onEnded { state in
				withAnimation {
					validateScaleLimits()
				}
				lastScale = 1.0
			}
	}
	
	var body: some View {
		ZStack {
			Color.black
				.ignoresSafeArea()
			Image(uiImage: uiImage)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.scaleEffect(scale)
				.gesture(magnification)
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
	
	private func adjustScale(from state: MagnificationGesture.Value) {
		let delta = state / lastScale
		scale *= delta
		lastScale = state
	}
	
	private func getMinimumScaleAllowed() -> CGFloat {
		return max(scale, minScale)
	}
	
	private func getMaximumScaleAllowed() -> CGFloat {
		return min(scale, maxScale)
	}
	
	private func validateScaleLimits() {
		scale = getMinimumScaleAllowed()
		scale = getMaximumScaleAllowed()
	}
}

//#Preview {
//	GeometryReader { geo in
//		ImageHorizontalScrollView(geo: geo, photos: ImageData.imageDummyData)
//	}
//}
