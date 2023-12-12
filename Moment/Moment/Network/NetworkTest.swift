//
//  NetworkTest.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import SwiftUI

struct NetworkTest: View {
    @StateObject var network = BookAPI.shared
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .onAppear() {
            network.fetchData(queryValue: "주식")
        }
    }
}

#Preview {
    NetworkTest()
}
