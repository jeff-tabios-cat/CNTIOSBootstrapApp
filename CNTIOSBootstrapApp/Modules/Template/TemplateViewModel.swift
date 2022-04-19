//
//  TemplateViewModel.swift
//  CNTIOSBootstrapApp
//
//  Created by Jeffrey Tabios on 4/12/22.
//

import Foundation
import Combine

protocol TemplateViewModelProtocol {
    //Exposed vars and funcs
    var someVar: CurrentValueSubject<String, Never> { get }
    func someFunc()
}

final class TemplateViewModel: ObservableObject, TemplateViewModelProtocol {
    
    let someVar: CurrentValueSubject<String, Never> = CurrentValueSubject<String, Never>("")
    @Published var sampleVar: String = ""
    
    var cancellable: AnyCancellable?
    
    init() {
        setupBindings()
    }
    
    func someFunc() {
        someVar.send("text change")
    }
}

extension TemplateViewModel {
    func setupBindings() {
        cancellable = someVar.sink(receiveValue: { [weak self] val in
            guard let self = self else { return }
            self.sampleVar = val
        })
    }
}
