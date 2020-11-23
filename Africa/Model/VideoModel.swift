//
//  VideoModel.swift
//  Africa
//
//  Created by Victor Manuel Puga Ruiz on 22/11/20.
//

import Foundation

struct Video {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}

extension Video: Codable, Identifiable { }
