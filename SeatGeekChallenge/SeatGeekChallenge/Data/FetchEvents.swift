//
//  FetchEvents.swift
//  SeatGeekChallenge
//
//  Created by Ronald Joubert on 5/12/21.
//

import Foundation

class FetchEvents: ObservableObject {
    @Published var events = [Event]()
    
    init(name: String) {
        let url = URL(string: "https://api.seatgeek.com/2/events?client_id=MjE4OTUwMzZ8MTYyMDc3NDQxMS40MDEwMTA1&q=\(name)")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let eventData = data {
                    let decodedData = try JSONDecoder().decode([Event].self, from: eventData)
                    DispatchQueue.main.async {
                        self.events = decodedData
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}
