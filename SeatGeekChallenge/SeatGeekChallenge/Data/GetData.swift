//
//  GetData.swift
//  SeatGeekChallenge
//
//  Created by Ronald Joubert on 5/11/21.
//

import SwiftUI
import Combine

class GetData: ObservableObject {
    
    @Published var events = [Event]()
    
    init(name: String) {
        guard let url = URL(string: "https://api.seatgeek.com/2/events?client_id=MjE4OTUwMzZ8MTYyMDc3NDQxMS40MDEwMTA1&q=\(name)") else {
            print("Guard URL statement failed")
            
            return
        }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with:url) { (data, _, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
            do {
                let json = try JSONDecoder().decode(EventWrapper.self, data)
            } catch {
                print("Error decoding data")
            }
        }
    }
}
