//
//  AnimalModel.swift
//  Africa
//
//  Created by Aung Kyaw Mon on 08/06/2566 BE.
//

import Foundation

struct Animal: Codable, Identifiable {
    let id, name, headline, description, link, image: String
    let gallery, fact: [String]
    
}

