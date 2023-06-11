//
//  VideoView.swift
//  Africa
//
//  Created by solinx on 09/06/2023.
//

import SwiftUI

struct VideoItemView: View {
    // MARK: - PROPERTY
    let video: Video
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                .cornerRadius(5)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            } //: ZStack
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            } //: VStack
        } //: HStack
    }
}

// MARK: - PREVIEW
struct VideoItemView_Previews: PreviewProvider {
    static let videoes: [Video] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        VideoItemView(video: videoes[0])
            .previewLayout(.sizeThatFits)
    }
}
