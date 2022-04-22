//
//  CNTButton.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/22/22.
//

import SwiftUI

struct CNTButton: View {
  let title: String
  let theme: AppColors.Button
  let action: () -> Void

  init(
    _ title: String,
    theme: AppColors.Button = .primary,
    action: @escaping () -> Void
  ) {
    self.title = title
    self.theme = theme
    self.action = action
  }

  var body: some View {
    Button(title, action: action)
      .buttonStyle(CNTButtonStyle(theme: theme))
  }
}
