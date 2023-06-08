//
//  ContentView.swift
//  Africa
//
//  Created by Aung Kyaw Mon on 02/06/2566 BE.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTY
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    //MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) { animal in
                    AnimalListItemView(animal: animal)
                }
                
            } //: LIST
            .navigationTitle("Africa")
    
        } //: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
