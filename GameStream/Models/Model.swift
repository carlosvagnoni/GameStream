//
//  Model.swift
//  GameStream
//
//  Created by user239477 on 5/12/23.
//

import Foundation

struct Games: Codable {
    
    var games: [Game]
    
}

struct Results: Codable {
    
    var results: [Game]
    
}

struct Game: Codable, Hashable {
    
    var title: String
    
    var studio: String
    
    var contentRaiting: String
    
    var publicationYear: String
    
    var description: String
    
    var platforms: [String]
    
    var tags: [String]
    
    var videosUrls: VideosUrls
    
    var galleryImages: [String]
    
}

struct VideosUrls: Codable, Hashable {
    
    var mobile: String
    
    var tablet: String

    
}
