//
//  VideoListView.swift
//  Africa
//
//  Created by Aung Kyaw Mon on 02/06/2566 BE.
//

import SwiftUI

struct VideoListView: View {
    //MARK: - PROPERTY
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImapact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name), label: {
                        VideoItemView(video: item)
                    })
                }
            } //: List
            .navigationTitle("Watch")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Shuffle videos
                        videos.shuffle()
                        hapticImapact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
        } //: NavigationView
       
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
