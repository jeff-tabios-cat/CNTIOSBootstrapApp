//
//  CNTTextField.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/22/22.
//

import SwiftUI

struct CNTTextField: View {
  var placeholder: String
  @Binding var value: String
  @Binding var uiState: UIState

  enum UIState {
    case active, inactive, error
  }

  var body: some View {
    VStack(alignment: .leading) {
      placeholderView
        .hidden(when: value.isEmpty)

      HStack {
        ZStack(alignment: .leading) {
          TextField("", text: $value)
            .appTypographyStyle(.bodyRegular)
            .foregroundColor(foregroundColor)

          placeholderView
            .visible(when: value.isEmpty)
        }

        if uiState == .error {
          Rectangle().fill(Color.red).frame(width: 24, height: 24)
        }
      }
      .frame(minHeight: 30)

      Rectangle()
        .fill(lineColor)
        .frame(maxWidth: .infinity, maxHeight: 2)
    }
    .frame(maxWidth: .infinity, minHeight: 60)
  }
}

// MARK: - Custom Views

private extension CNTTextField {
  struct CNTTextFieldPlaceholder: View {
    var text: String = ""
    var color: Color = AppColors.TextField.primary.placeholderActive

    var body: some View {
      Text(text)
        .appTypographyStyle(.bodySmall)
        .foregroundColor(color)
    }
  }
}

// MARK: - Private Getters

private extension CNTTextField {
  var foregroundColor: Color {
    switch uiState {
    case .active:
      return AppColors.TextField.primary.foregroundActive
    case .inactive:
      return AppColors.TextField.primary.foregroundInactive
    case .error:
      return AppColors.TextField.primary.foregroundError
    }
  }

  var placeholderColor: Color {
    switch uiState {
    case .active:
      return AppColors.TextField.primary.placeholderActive
    case .inactive:
      return AppColors.TextField.primary.placeholderInactive
    case .error:
      return AppColors.TextField.primary.placeholderError
    }
  }

  var lineColor: Color {
    switch uiState {
    case .active:
      return AppColors.TextField.primary.lineActive
    case .inactive:
      return AppColors.TextField.primary.lineInactive
    case .error:
      return AppColors.TextField.primary.lineError
    }
  }

  var placeholderView: CNTTextFieldPlaceholder {
    CNTTextFieldPlaceholder(
      text: placeholder,
      color: placeholderColor
    )
  }
}
