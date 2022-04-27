//
//  CampaignsViewModel.swift
//  CNTIOSBootstrapApp
//
//  Created by Jeffrey Tabios on 4/26/22.
//

import Foundation
import Combine

struct CampaignResult: Identifiable {
    let id = UUID()
    let campaign: Campaign
}

final class CampaignsViewModel: ObservableObject {
    @Published var campaigns: [CampaignResult] = []
    let service: CampaignsService
    private var cancellables: Set<AnyCancellable> = []
    
    init(service: CampaignsService = CampaignsServiceForProd()) {
        self.service = service
        getCampaigns()
    }
}

private extension CampaignsViewModel {
    func getCampaigns() {
        service.getCampaigns().sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let encounteredError):
                print(encounteredError) //Do something with error
            }
        }, receiveValue: { [weak self] response in
            guard let self = self else { return }
            // do something with response
            self.campaigns = response.campaigns.map({ campaign in
                CampaignResult(campaign: campaign)
            })
        }).store(in: &cancellables)
    }
}
