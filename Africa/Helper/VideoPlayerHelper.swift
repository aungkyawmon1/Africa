//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by solinx on 10/06/2023.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    if let bundle = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
        videoPlayer = AVPlayer(url: bundle)
        videoPlayer?.play()
    }
    
    return videoPlayer!
}
