//
//  InsetMapView.swift
//  Africa
//
//  Created by solinx on 09/06/2023.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    // MARK: - PROPERTY
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    // MARK: - BODY
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                        
                        Text("Location")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    } //: HStack
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(Color.black)
                    .opacity(0.4)
                    .cornerRadius(8.0)
                } //: NavigationLink
                    .padding(12)
                , alignment: .topTrailing
            )
            
            .frame(height: 256)
            .cornerRadius(12.0)
    }
}

// MARK: - PREVIEWS
struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
