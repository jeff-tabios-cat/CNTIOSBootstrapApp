//
//  APIServicesTest.swift
//  CNTIOSBootstrapAppTests
//
//  Created by Jeffrey Tabios on 4/25/22.
//

import XCTest
import Combine
@testable import CNTIOSBootstrapApp

class APIServicesTest: XCTestCase {
    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        cancellables = []
    }
    
    func testLoginShouldReturnToken() {
        let sut = LoginService(username: "someUsername", password: "somePassword")
        var loginResponse: LoginResponse!
        let expectation = expectation(description: "Login Service")
        
        sut.login()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let encounteredError):
                    print(encounteredError)
                    XCTAssert(false)
                }
                expectation.fulfill()
            }, receiveValue: { response in
                loginResponse = response
            }).store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1)
        
        XCTAssert(loginResponse != nil)
    }
    
}
