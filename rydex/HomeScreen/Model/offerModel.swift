//
//  offerModel.swift
//  rydex
//
//  Created by elluminati on 25/06/24.
//

import Foundation

struct offerModel : Identifiable {
    let id : UUID = UUID()
    let name: String
    let imageName: String
    let isDisabled: Bool
}

