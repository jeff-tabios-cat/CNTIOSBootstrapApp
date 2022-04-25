//
//  CampaignsService.swift
//  CNTIOSBootstrapApp
//
//  Created by Jeffrey Tabios on 4/19/22.
//

import Foundation
import Combine

protocol CampaignsService {
    func getCampaigns() -> AnyPublisher<Campaigns, Error>
}

final class CampaignsServiceForProd: CampaignsService, APIService {
    let method: HTTPMethod = .get
    let urlString: String
    let headers: [String : String]? = nil;
    let parameters: Any? = nil
    let authToken: AuthToken = .none
    
    init() {
        urlString = Server.baseURL + "/campaigns"
    }
    
    func getCampaigns() -> AnyPublisher<Campaigns, Error> {
        let cancellable: AnyPublisher<Campaigns, Error> = request()
        return cancellable
    }
}
