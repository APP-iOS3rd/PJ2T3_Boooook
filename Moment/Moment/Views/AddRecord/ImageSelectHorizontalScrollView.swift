//
//  ImageSelectHorizontalScrollView.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import SwiftUI
import PhotosUI

// MARK: - Photos Dummy Data
struct PhotoData: Identifiable {
    let id = UUID()
    var image: UIImage?
}

struct ImageSelectHorizontalScrollView: View {
    @State private var showActionSheet: Bool = false
    @State private var photoDummyData: [UIImage?] = [
        nil, nil, nil
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .lastTextBaseline) {
                Text("사진 등록")
                    .font(.system(size: 16))
                Text("(최대 3장)")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray1)
            }
            .padding(.horizontal, 20)
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach($photoDummyData.indices, id: \.self) { index in
                        if let _ = photoDummyData[index] {
                            ImageView(image: $photoDummyData[index],
                                      photoDummyData: $photoDummyData,
                                      currentIndex: index)
                        } else {
                            EmptyImageView()
                                .onTapGesture {
                                    showActionSheet.toggle()
                                }
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .scrollIndicators(.hidden)
        }
        .confirmationDialog("", isPresented: $showActionSheet, titleVisibility: .hidden) {
            Button("카메라") {
            }
            Button("라이브러리") {
            }
        } message: {
            Text("불러올 사진 위치를 선택해주세요")
        }
    }
}

struct ImageView: View {
    @Binding var image: UIImage?
    @Binding var photoDummyData: [UIImage?]
    var currentIndex: Int
    
    var body: some View {
        Image(uiImage: image!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 160, height: 160)
            .clipped()
            .clipShape(.rect(cornerRadius: 10))
            .overlay(alignment: .topTrailing) {
                Button {
                    removePhoto()
                } label: {
                    XmarkOnGrayCircle()
                        .padding([.top, .trailing], 10)
                }
            }
    }
    
    private func removePhoto() {
        self.photoDummyData.remove(at: currentIndex)
        photoDummyData.append(nil)
    }
}

struct XmarkOnGrayCircle: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.gray2)
                .opacity(0.6)
                .frame(width: 28)
            Image(systemName: "xmark")
                .foregroundStyle(.white)
                .fontWeight(.semibold)
        }
    }
}

struct EmptyImageView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.gray5)
            .stroke(Color.gray3, lineWidth: 1)
            .frame(width: 160, height: 160)
            .overlay {
                VStack(spacing: 10) {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40)
                        .foregroundStyle(Color.gray2)
                    Text("사진을 등록하세요!")
                        .font(.system(size: 14))
                        .foregroundStyle(Color.gray1)
                }
            }
    }
}

#Preview {
    ImageSelectHorizontalScrollView()
}

