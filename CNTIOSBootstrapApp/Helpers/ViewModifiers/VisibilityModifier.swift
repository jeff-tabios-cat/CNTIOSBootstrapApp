//
//  VisibilityModifier.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/22/22.
//

import SwiftUI

struct VisibilityModifier: ViewModifier {
  let isHidden: Bool

  @ViewBuilder
  func body(content: Content) -> some View {
    if isHidden {
      content.hidden()
    } else {
      content
    }
  }
}

extension View {
  func hidden(when isHidden: Bool) -> some View {
    modifier(VisibilityModifier(isHidden: isHidden))
  }

  func visible(when isVisible: Bool) -> some View {
    modifier(VisibilityModifier(isHidden: !isVisible))
  }
}
