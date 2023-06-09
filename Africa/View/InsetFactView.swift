//
//  InsetFactView.swift
//  Africa
//
//  Created by solinx on 09/06/2023.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - PROPERTY
    var animal: Animal
    
    // MARK: - BODY
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact,id: \.self) { item in
                    Text(item)
                }
            } //: TabView
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: GroupBox
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[1])
    }
}
