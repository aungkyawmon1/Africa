//
//  GalleryView.swift
//  Africa
//
//  Created by Aung Kyaw Mon on 02/06/2566 BE.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - PROPERTY
    
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Gallery")
        } //: ScrollView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
