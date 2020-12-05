//
//  KSITunesSearchResponse.swift
//  KeysocTest
//
//  Created by Steve Lai on 5/12/2020.
//

import Foundation

struct KSITunesSearchResponse: Decodable{
    let resultCount: Int
    let results: [KSAlbum]
}
