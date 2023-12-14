//
//  UIImage +.swift
//  Moment
//
//  Created by Minjae Kim on 12/14/23.
//

import SwiftUI

extension UIImage {
	func resize(newWidth: CGFloat) -> UIImage {
		let scale = newWidth / self.size.width
		let newHeight = self.size.height * scale
		
		let size = CGSize(width: newWidth, height: newHeight)
		let render = UIGraphicsImageRenderer(size: size)
		let renderImage = render.image { context in
			self.draw(in: CGRect(origin: .zero, size: size))
		}
		
		return renderImage
	}
}
