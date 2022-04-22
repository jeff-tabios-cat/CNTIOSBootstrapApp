//
//  AppColors.swift
//  CNTIOSBootstrapApp
//
//  Created by Jeffrey Tabios on 4/12/22.
//

import SwiftUI

enum AppColors {
  /// Default text color
  static let textOnLight: Color = .black
  static let textOnDark: Color = .white

  /// Default background color
  static let backgroundLight: Color = .white
  static let backgroundDark: Color = .black

  static let primary: Color = .accentColor
  static let secondary: Color = .secondary

  static let error: Color = .red
  static let warning: Color = .orange
  static let success: Color = .green
  static let info: Color = .blue

  // MARK: Grays
  static let grayInactive: Color = .gray
}

// MARK: - Buttons

extension AppColors {
  struct Button {
    let backgroundActive: Color
    let foregroundActive: Color
    let borderActive: Color

    let backgroundInactive: Color
    let foregroundInactive: Color
    let borderInactive: Color

    let backgroundFocus: Color
    let foregroundFocus: Color
    let borderFocus: Color

    static let primary = Self(
      backgroundActive: AppColors.primary,
      foregroundActive: AppColors.textOnDark,
      borderActive: AppColors.primary,
      backgroundInactive: AppColors.grayInactive,
      foregroundInactive: AppColors.textOnDark,
      borderInactive: AppColors.grayInactive,
      backgroundFocus: .black,
      foregroundFocus: .white,
      borderFocus: .black
    )

    static let outline = Self(
      backgroundActive: AppColors.backgroundLight,
      foregroundActive: AppColors.primary,
      borderActive: AppColors.primary,
      backgroundInactive: AppColors.backgroundLight,
      foregroundInactive: AppColors.grayInactive,
      borderInactive: AppColors.grayInactive,
      backgroundFocus: AppColors.backgroundLight,
      foregroundFocus: .black,
      borderFocus: .black
    )
  }
}

// MARK: - TextField

extension AppColors {
  struct TextField {
    let placeholderActive: Color
    let foregroundActive: Color
    let lineActive: Color

    let placeholderInactive: Color
    let foregroundInactive: Color
    let lineInactive: Color

    let placeholderError: Color
    let foregroundError: Color
    let lineError: Color

    static let primary = Self(
      placeholderActive: AppColors.textOnLight,
      foregroundActive: AppColors.textOnLight,
      lineActive: AppColors.textOnLight,
      placeholderInactive: AppColors.grayInactive,
      foregroundInactive: AppColors.grayInactive,
      lineInactive: AppColors.grayInactive,
      placeholderError: AppColors.error,
      foregroundError: AppColors.error,
      lineError: AppColors.error
    )
  }
}
