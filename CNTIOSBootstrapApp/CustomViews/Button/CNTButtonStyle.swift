//
//  CNTButtonStyle.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/22/22.
//

import SwiftUI

struct CNTButtonStyle: ButtonStyle {
  let theme: AppColors.Button

  func makeBody(configuration: Configuration) -> some View {
    CNTButtonStyleView(configuration: configuration, theme: theme)
  }
}

private extension CNTButtonStyle {
  struct CNTButtonStyleView: View {
    @Environment(\.isEnabled) var isEnabled

    let configuration: CNTButtonStyle.Configuration
    let theme: AppColors.Button

    var body: some View {
      var backgroundColor = theme.backgroundActive
      var foregroundColor = theme.foregroundActive
      var borderColor = theme.borderActive

      if !isEnabled {
        backgroundColor = theme.backgroundInactive
        foregroundColor = theme.foregroundInactive
        borderColor = theme.borderInactive
      } else if configuration.isPressed {
        backgroundColor = theme.backgroundFocus
        foregroundColor = theme.foregroundFocus
        borderColor = theme.borderFocus
      }

      return configuration.label
        .appTypographyStyle(.bodyBold)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(foregroundColor)
        .background(backgroundColor)
        .border(borderColor)
    }
  }
}
