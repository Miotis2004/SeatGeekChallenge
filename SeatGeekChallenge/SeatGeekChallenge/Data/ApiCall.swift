//
//  ApiCall.swift
//  SeatGeekChallenge
//
//  Created by Ronald Joubert on 5/12/21.
//

import SwiftUI

struct ApiCall {
    
    @Binding var text: String
    
    func getEvents(completion: @escaping ([Event]) -> ()) {
        guard let url = URL(string: "https://api.seatgeek.com/2/events?client_id=MjE4OTUwMzZ8MTYyMDc3NDQxMS40MDEwMTA1&q=\(text)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do {
                let wrapper = try JSONDecoder().decode(EventWrapper.self, from: data!)
                
                DispatchQueue.main.async {
                    completion(wrapper.events)
                }
            } catch {
                print("Error decoding: \(error.localizedDescription)")
            }
            
        }.resume()
    }
    
    
}
