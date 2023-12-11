//
//  ButtonStyle +.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import SwiftUI

// MARK: - ButtonStyle 커스텀 추가
extension ButtonStyle where Self == CircledButton {
    static func circled(color: Color, size: CGFloat) -> Self {
        return CircledButton(color: color, frameSize: size)
    }
}

extension ButtonStyle where Self == CapsuledButton {
    static func capsuled(color: Color, width: CGFloat) -> Self {
        return CapsuledButton(color: color, frameWidth: width)
    }
}

extension ButtonStyle where Self == CustomProminentButton {
    static func customProminent(color: Color) -> Self {
        return CustomProminentButton(color: color)
    }
}
