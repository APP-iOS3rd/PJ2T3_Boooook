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
        .task {
            await network.fetchData(queryValue: "개발")
        }
    }
}

#Preview {
    NetworkTest()
}
