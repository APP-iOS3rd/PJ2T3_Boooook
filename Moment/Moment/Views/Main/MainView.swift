//
//  MainView.swift
//  Moment
//
//  Created by phang on 12/13/23.
//

import SwiftUI

struct MainView: View {
    @State var selectedOption = 0

    var body: some View {
        VStack(spacing: 0) {
            if selectedOption == 0 {
                VStack(spacing: 16) {
//                    SearchBar()
                    SegmentBar(preselectedIndex: $selectedOption)
                    MainShelfView()
                }
            } else if selectedOption == 1 {
                ZStack(alignment: .top) {
                    MainMapView()
                    VStack(spacing: 16) {
//                        SearchBar()
                        SegmentBar(preselectedIndex: $selectedOption)
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}

