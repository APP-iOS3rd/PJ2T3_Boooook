//
//  PhotoPicker.swift
//  Moment
//
//  Created by phang on 12/12/23.
//

import SwiftUI
import PhotosUI

// MARK: - PHPickerViewController 로, 앨범에서 사진 고르기 사용
struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var selectedPhotos: [UIImage?]
    @Binding var isLibraryPresented: Bool
    private let tatoalSpace = 3
    let remainingSpaces: Int
    

    class Coordinator: PHPickerViewControllerDelegate {
        private let parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            for (idx, result) in results.enumerated() {
                let itemProvider = result.itemProvider
                guard itemProvider.canLoadObject(ofClass: UIImage.self) else { continue }
                _ = itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                    if let image = image as? UIImage {
                        DispatchQueue.main.async {
                            self.parent.selectedPhotos[self.parent.tatoalSpace - self.parent.remainingSpaces + idx] = image
                        }
                    }
                }
            }
            parent.isLibraryPresented = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = remainingSpaces
        configuration.preferredAssetRepresentationMode = .current
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        //
    }
}
