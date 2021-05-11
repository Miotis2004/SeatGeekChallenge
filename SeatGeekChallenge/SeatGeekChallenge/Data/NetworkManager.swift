//
//  NetworkManager.swift
//  SeatGeekChallenge
//
//  Created by Ronald Joubert on 5/11/21.
//

import SwiftUI

enum CustomError: Error {
    case urlFailure
    case dataFailure
    case decodeFailure
}

protocol Network {
    func loadResults(name: String, completion: @escaping (Result<[Event], Error>) -> Void)
}

final class NetworkManager {
    static var shared = NetworkManager()
    
    let session: URLSession
    
    private init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}

extension NetworkManager: Network {
    func loadResults(name: String, completion: @escaping (Result<[Event], Error>) -> Void) {
        guard let url = URL(string: "https://api.seatgeek.com/2/events?client_id=MjE4OTUwMzZ8MTYyMDc3NDQxMS40MDEwMTA1&q=\(name)") else {
            print("Guard URL statement failed")
            completion(.failure(CustomError.urlFailure))
            return
        }
    }
    
    
}
