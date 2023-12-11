//
//  ContentShelfView.swift
//  Moment
//
//  Created by 백대홍 on 12/11/23.
//

import SwiftUI

struct ContentShelfView: View {
    var body: some View {
        VStack {
            VStack {
                ForEach(0...3, id: \.self) { _ in
                    HStack {
                        ZStack {
                            Image("TestBook", bundle: nil)
                                .resizable()
                                .frame(width: 130, height: 170)
                            //                    .clipShape(.rect(cornerRadius: 8))
                            
                            CustomShelf()
                                .fill(.lightBrown)
                                .frame(width: 150, height: 180)
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Image("TestBook", bundle: nil)
                                .resizable()
                                .frame(width: 130, height: 170)
                            //                    .clipShape(.rect(cornerRadius: 8))
                            
                            CustomShelf()
                                .fill(.lightBrown)
                                .frame(width: 150, height: 180)
                        }
                        
                    }
                    
                }
                .padding(.vertical)
            }
        }
    
    }
}
#Preview {
    ContentShelfView()
}
