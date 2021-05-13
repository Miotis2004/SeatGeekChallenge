//
//  Events.swift
//  SeatGeekChallenge
//
//  Created by Ronald Joubert on 5/11/21.
//

import Foundation

struct EventWrapper: Codable {
    var events: [Event]
}

struct Event: Codable, Identifiable {
    var id: Int
    var datetime_utc: String
    var venue: Venue
    var performers: [Performers]
}

struct Venue: Codable {
    var display_location: String
}

struct Performers: Codable {
    var name: String
    var image: String
}
