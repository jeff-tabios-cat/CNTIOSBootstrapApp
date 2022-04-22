//
//  AppTypographyStyle.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/22/22.
//

import SwiftUI

struct AppTypographyStyle {
  let lineSpacing: CGFloat
  let isAllCaps: Bool
  private(set) var font: Font!

  init(
    font: Font,
    lineSpacing: CGFloat = 0,
    isAllCaps: Bool = false
  ) {
    self.font = font
    self.lineSpacing = lineSpacing
    self.isAllCaps = isAllCaps
  }

  init(
    fontName: String,
    figmaSize: CGFloat, /// The font size defined in Figma. 1px = 1pt
    relativeTo: Font.TextStyle,
    lineSpacing: CGFloat,
    isAllCaps: Bool = false
  ) {
    // TODO: Perform additional calculation for pointSize
    let pointSize = figmaSize
    let font = Font.custom(fontName, size: pointSize, relativeTo: relativeTo)

    self.init(font: font, lineSpacing: lineSpacing, isAllCaps: isAllCaps)
  }
}


// MARK: - Styles

extension AppTypographyStyle {
  // MARK: Title

  static let largeTitle = AppTypographyStyle(
    font: .largeTitle.bold(),
    lineSpacing: 5
  )

  static let header1 = AppTypographyStyle(
    font: .title.bold(),
    lineSpacing: 5
  )

  static let header2 = AppTypographyStyle(
    font: .title2.bold(),
    lineSpacing: 5
  )

  static let header3 = AppTypographyStyle(
    font: .title3.bold(),
    lineSpacing: 5
  )

  // MARK: Body

  static let bodySmall = AppTypographyStyle(
    font: .caption,
    lineSpacing: 2
  )

  static let bodyBold = AppTypographyStyle(
    font: .body.bold(),
    lineSpacing: 2
  )

  static let bodyItalic = AppTypographyStyle(
    font: .body.italic(),
    lineSpacing: 2
  )

  static let bodyBoldItalic = AppTypographyStyle(
    font: .body.bold().italic(),
    lineSpacing: 2
  )

  static let bodyRegular = AppTypographyStyle(
    font: .body,
    lineSpacing: 2
  )

  // MARK: Smaller text

  static let cta = AppTypographyStyle(
    font: .caption.bold(),
    lineSpacing: 2
  )
}
