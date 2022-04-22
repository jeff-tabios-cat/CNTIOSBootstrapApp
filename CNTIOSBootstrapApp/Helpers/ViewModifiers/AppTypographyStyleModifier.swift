//
//  AppTypographyStyleModifier.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/22/22.
//

import SwiftUI

struct AppTypographyStyleModifier: ViewModifier {
  let style: AppTypographyStyle

  func body(content: Content) -> some View {
    content.font(style.font)
      .lineSpacing(style.lineSpacing)
      .textCase(style.isAllCaps ? .uppercase : nil)
  }
}

extension View {
  func appTypographyStyle(_ style: AppTypographyStyle) -> some View {
    modifier(AppTypographyStyleModifier(style: style))
  }
}
