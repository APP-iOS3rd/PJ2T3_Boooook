//
//  MainShelfView.swift
//  Moment
//
//  Created by 백대홍 on 12/12/23.
//

import SwiftUI

struct MainShelfView: View {
    let booooook: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if !booooook {
                NoContentView()
                    .padding()
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    ContentShelfView()
                }
            }
            Button {
                // Just Design example
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 30))
                    .fontWeight(.medium)
            }
            .buttonStyle(.circled(color: .lightBrown, size: 30))
            .padding([.bottom, .trailing], 30)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MainShelfView()
}
