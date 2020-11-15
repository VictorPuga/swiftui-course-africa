//
//  AnimalModel.swift
//  Africa
//
//  Created by Victor Manuel Puga Ruiz on 14/11/20.
//

import SwiftUI

struct Animal {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}

extension Animal: Codable, Identifiable {}
