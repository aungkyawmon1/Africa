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
    @State private var isGridActivated: Bool = false
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    // MARK: - FUNCTION
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid column: \(gridColumn)")
        // Toolbar imag
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    //MARK: - BODY
    var body: some View {
        NavigationView {
            
            Group {
                if !isGridActivated {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            } //: Link
                        } //: Loop
                    
                    } //: List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                } //: Link
                            } //: Loop
                        } //: LazyVGrid
                        .padding(10)
                        .animation(.easeIn, value: isGridActivated)
                    } //: ScrollView
                } //: Condition
                
            } //: Group
            .navigationTitle("Africa")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        // List
                        Button {
                           print("list view is activated.")
                            isGridActivated = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridActivated ? .primary : .accentColor)
                        } //: Button
                        
                        // Grid
                        Button {
                           print("grid view is activated.")
                            isGridActivated = true
                            haptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridActivated ? .accentColor : .primary)
                        } //: Button
                    }
                } //: ToolBarItems
            } //: toolbar
    
        } //: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
