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
    func loadEventList(name: String, completion: @escaping (Result<[Event], Error>) -> Void)
}

class NetworkManager {
    
    
    
}

extension NetworkManager: Network {
    func loadEventList(name: String, completion: @escaping (Result<[Event], Error>) -> Void) {
        guard let url = URL(string: "https://api.seatgeek.com/2/events?client_id=MjE4OTUwMzZ8MTYyMDc3NDQxMS40MDEwMTA1&q=\(name)") else {
            print("Guard URL statement failed")
            completion(.failure(CustomError.urlFailure))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(.failure(CustomError.dataFailure))
                return
            }
            
            do{
                let wrapper = try JSONDecoder().decode(EventWrapper.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(wrapper.events))
                }
                
            } catch {
                print(error)
                completion(.failure(CustomError.decodeFailure))
            }
        }.resume()
    }
    
    
}
