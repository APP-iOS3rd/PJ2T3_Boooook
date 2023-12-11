//
//  StartButtonView.swift
//  Moment
//
//  Created by 백대홍 on 12/11/23.
//

import SwiftUI
struct StartButtonView: View {
    
    //@AppStorage("isOnboarding") var isOnboarding: Bool?
    
    var body: some View {
      Button(action: {
        //isOnboarding = false
      }) {
          HStack(spacing: 8) {
              Text("시작하기")
                  .foregroundStyle(Color.white)
          }
          
          .frame(width: 240, height: 50)
          .background(.mainBrown)
          .cornerRadius(24)
      }
        
      
    }
}
#Preview {
    StartButtonView()
}
