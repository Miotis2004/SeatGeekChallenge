//
//  Events.swift
//  SeatGeekChallenge
//
//  Created by Ronald Joubert on 5/11/21.
//

import Foundation

struct Event: Codable {
    var events: EventDetail
}

struct EventDetail: Codable {
    var venue: Venue
    var performer: Performer
}

struct Venue: Codable {
    var name: String
    var display_location: String
}

struct Performer: Codable {
    var name: String
    var image: String
}
