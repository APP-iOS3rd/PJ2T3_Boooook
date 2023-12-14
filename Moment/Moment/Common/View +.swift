//
//  View +.swift
//  Moment
//
//  Created by 정인선 on 12/15/23.
//

import SwiftUI

// MARK: - 키보드 내리기
extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
