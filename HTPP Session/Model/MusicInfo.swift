//
//  SongInfo.swift
//  HTPP Session
//
//  Created by  Джон Костанов on 22/08/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import Foundation

struct MusicInfo {
    var trackName: String
    var artistName: String

    
    enum CodingKeys: String, CodingKey {
        case trackName
        case artistName
    }
}

extension MusicInfo: Codable {
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        trackName = try valueContainer.decode(String.self, forKey: CodingKeys.trackName)
        artistName = try valueContainer.decode(String.self, forKey: CodingKeys.artistName)
    }
}
