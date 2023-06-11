//
//  MapAnnotationView.swift
//  Africa
//
//  Created by solinx on 11/06/2023.
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: - PROPERTIES
    var loaction: NationalParkLocation
    @State private var animation: Double = 0.0
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(loaction.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48,height: 48)
            .clipShape(Circle())
        } //: ZStack
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

// MARK: - PREVIEW
struct MapAnnotationView_Previews: PreviewProvider {
    static let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    static var previews: some View {
        MapAnnotationView(loaction: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
