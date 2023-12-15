//
//  CustomButtons.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import SwiftUI

struct CustomButtons: View {
    var body: some View {
        VStack(spacing: 20) {
            Button {
                // Just Design example
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 30))
                    .fontWeight(.medium)
            }
            .buttonStyle(.circled(color: .lightBrown, size: 40))
            
            Button {
                // Just Design example
            } label: {
                Text("Capsuled Button")
                    .font(.bold18)
            }
            .buttonStyle(.capsuled(color: .lightBrown, width: 200))
            
            Button {
                // Just Design example
            } label: {
                Text("Custom Prominent")
                    .font(.regular18)
            }
            .buttonStyle(.customProminent(color: .offBrown))
        }
        .padding()
    }
}

// MARK: - 원형 Button
struct CircledButton: ButtonStyle {
    let color: Color
    let frameSize: CGFloat
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: frameSize, height: frameSize)
            .padding(20)
            .background(
                Circle()
                    .fill(color)
            )
            .foregroundStyle(Color.white)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
    }
}

// MARK: - 캡슐 Button
struct CapsuledButton: ButtonStyle {
    let color: Color
    let frameWidth: CGFloat
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: frameWidth)
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(color)
            )
            .foregroundStyle(Color.white)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
    }
}

// MARK: - 커스텀 Prominent Button
struct CustomProminentButton: ButtonStyle {
    let color: Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(color)
            )
            .foregroundStyle(Color.white)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
    }
}

#Preview {
    CustomButtons()
}
