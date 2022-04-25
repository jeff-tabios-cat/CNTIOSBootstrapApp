//
//  CampaignSummary.swift
//  CNTIOSBootstrapApp
//
//  Created by Jeffrey Tabios on 4/26/22.
//

import SwiftUI

struct CampaignSummary: View {
    var campaign: Campaign
    
    var body: some View {
        ZStack {
            VStack {
                Image(campaign.logo)
                Text(campaign.title)
                Text(campaign.subtitle)
                Text(campaign.conversions)
                Text(campaign.revenue)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.blue, lineWidth: 4)
            )
        }
        .padding()
    }
}

struct CampaignSummary_Previews: PreviewProvider {
    static var previews: some View {
        let campaign = Campaign(logo: "leslie",
                                title: "test",
                                subtitle: "subtest",
                                conversions: "0",
                                revenue: "0.00")
        CampaignSummary(campaign: campaign)
    }
}
