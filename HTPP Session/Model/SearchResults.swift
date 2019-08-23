//
//  SearchResults.swift
//  HTPP Session
//
//  Created by  Джон Костанов on 23/08/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [MusicInfo]
}
