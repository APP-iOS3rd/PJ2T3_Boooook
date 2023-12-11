//
//  CustomTextField.swift
//  Moment
//
//  Created by 정인선 on 12/11/23.
//

import SwiftUI

struct CustomTextField: View {
    
    @State var testSentence = ""
    
    var body: some View {
        VStack {
            TextField("TextField Placeholder", text: $testSentence)
                .textFieldStyle(BorderedTextFieldStyle())
        }
        .frame(height: 10)
        .padding()
    }
}

// MARK: - 텍스트필드 커스텀
struct BorderedTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.lightBrown)
                .foregroundStyle(.clear)
            
            // TextField
            configuration
                .font(.regular14)
                .padding(10)
        }
        
    }
}

#Preview {
    CustomTextField()
}
