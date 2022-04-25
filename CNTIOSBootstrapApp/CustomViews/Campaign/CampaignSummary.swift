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
                HStack {
                    Image(campaign.logo)
                    Spacer()
                }
                
                HStack {
                    Text(campaign.title)
                        .bold()
                        .font(.system(size: 20))
                    Spacer()
                }
                
                HStack {
                    Text(campaign.subtitle)
                    Spacer()
                }
                
                HStack(alignment: .center) {
                    Spacer()
                    
                    VStack {
                        Text("Conversions")
                        Text(campaign.conversions)
                    }
                    .padding()
                    
                    Spacer()
                    
                    VStack {
                        Text("Revenue")
                        Text(campaign.revenue)
                    }.padding()
                    
                    Spacer()
                }
                .background(
                    RoundedRectangle(cornerRadius: 50, style: .continuous).fill(Color.red)
                )
                .padding(.top, 10)
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
