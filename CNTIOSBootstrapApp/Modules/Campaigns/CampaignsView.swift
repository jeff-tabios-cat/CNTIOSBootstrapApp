//
//  CampaignsView.swift
//  CNTIOSBootstrapApp
//
//  Created by Jeffrey Tabios on 4/26/22.
//

import SwiftUI

struct CampaignsView: View {
    let viewModel = CampaignsViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 1) {
                    ForEach(viewModel.campaigns) { campaignResult in
                        CampaignSummary(campaign: campaignResult.campaign)
                    }
                }
            }
        }
        .navigationBarHidden(false)
        .navigationBarTitle("My Campaigns", displayMode: .large)
    }
}

struct CampaignsView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignsView()
    }
}
