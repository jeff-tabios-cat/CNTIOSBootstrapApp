//
//  Campaigns.swift
//  CNTIOSBootstrapApp
//
//  Created by Jeffrey Tabios on 4/19/22.
//

import Foundation

// MARK: - Campaigns
struct Campaigns: Codable {
    let campaigns: [Campaign]
}

// MARK: - Campaign
struct Campaign: Codable {
    let logo, title, subtitle, conversions: String
    let revenue: String
}
