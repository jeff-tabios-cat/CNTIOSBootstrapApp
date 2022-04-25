//
//  TemplateView.swift
//  CNTIOSBootstrapApp
//
//  Created by Jeffrey Tabios on 4/12/22.
//

import SwiftUI

struct TemplateView: View {
    
    @ObservedObject var viewModel: TemplateViewModel
    
    init(viewModel: TemplateViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack {
            Text(viewModel.sampleVar)
            
            Button {
                viewModel.someFunc()
            } label: {
                Text("Push")
            }
        }
        .navigationTitle("First Page")
    }
}

struct TemplateView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateView(viewModel: TemplateViewModel())
    }
}
