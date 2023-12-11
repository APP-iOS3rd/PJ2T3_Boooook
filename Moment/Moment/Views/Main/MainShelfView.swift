//
//  MainShelfView.swift
//  Moment
//
//  Created by 백대홍 on 12/11/23.
//

import SwiftUI

struct MainShelfView: View {
    @State var selectedOption = 0
    
    var body: some View {
        VStack(spacing: 16) {
            SearchBar()
            
            SegmentBar(preselectedIndex: 0)
            
            ScrollView(.vertical, showsIndicators: false) {
                if selectedOption == 0 {
                    NoContentView()
                    HStack {
                        Spacer()
                        
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
                } else if selectedOption == 1 {
                    
                    ZStack {
                        
                        VStack {
                            ContentShelfView()
                            HStack {
                                Spacer()
                                
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
            }
        }
        .padding()
    }
}

#Preview {
    MainShelfView()
}
