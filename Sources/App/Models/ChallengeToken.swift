//
//  ChallengeToken.swift
//  App
//
//  Created by Andrew Tsukuda on 7/24/19.
//

import Vapor

struct ChallengeToken: Content {
    var token: String
    var challenge: String
    var type: String
}
