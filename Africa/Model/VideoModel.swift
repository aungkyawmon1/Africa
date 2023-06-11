//
//  VideoMoel.swift
//  Africa
//
//  Created by solinx on 09/06/2023.
//

import Foundation

struct Video: Codable, Identifiable {
    let id, name, headline: String
    
    //Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
