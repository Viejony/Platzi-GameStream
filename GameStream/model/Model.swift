//
//  Model.swift
//  GameStream
//
//  Created by Jhonyfer Angarita on 11/06/22.
//

import Foundation

struct Games: Codable{
    var games:[Game]
}

struct Game: Codable, Hashable{
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

struct VideosUrls: Codable, Hashable{
    var mobile: String
    var tablet: String
}

struct Comment: Hashable{
    var userName: String
    var comment: String
    var publicationTime: String
    var userImage: String
    
    
//    init(){
//        userName = ""
//        comment + ""
//        publicationTime = ""
//    }
}


struct SearchResult: Codable, Hashable{
    var results: [Game]
}
