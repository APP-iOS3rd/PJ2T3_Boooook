//
//  MainShelfView.swift
//  Moment
//
//  Created by 백대홍 on 12/12/23.
//

import SwiftUI

struct MainShelfView: View {
    @State var selectedOption = 0

    var body: some View {
        ZStack(alignment:.bottomTrailing) {
            VStack(spacing: 16) {
                //SearchBar()

                SegmentBar(preselectedIndex: 0)

                ScrollView(.vertical, showsIndicators: false) {

                    if selectedOption == 0 {
                        NoContentView()
                            .padding()
                    } else if selectedOption == 1 {
                        ContentShelfView()
                    }
                }
            }
            .padding()

            ZStack(alignment:.bottomTrailing) {
                Button {
                    // Just Design example
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 30))
                        .fontWeight(.medium)
                }
                .buttonStyle(.circled(color: .lightBrown, size: 30))
            }
            .padding()

        }
    }
}

#Preview {
    MainShelfView()
}
