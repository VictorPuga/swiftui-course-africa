//
//  CoverImageModel.swift
//  Africa
//
//  Created by Victor Manuel Puga Ruiz on 14/11/20.
//

import SwiftUI

struct CoverImage {
    let id: Int
    let name: String
}

extension CoverImage: Codable, Identifiable {}
