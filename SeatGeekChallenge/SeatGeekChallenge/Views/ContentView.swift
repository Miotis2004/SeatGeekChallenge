//
//  ContentView.swift
//  SeatGeekChallenge
//
//  Created by Ronald Joubert on 5/11/21.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var events = [Event]()
    @State var text: String = "swift"
    
    var body: some View {
        SearchBar(text: $text)
        Text(text)
            
        List(events, id: \.id) { event in
                VStack {
                    SearchCardView(image: event.performers[0].image, showName: event.performers[0].name, location: event.venue.display_location, dateTime: event.datetime_utc)
                }
            }
        .onChange(of: text, perform: { value in
            ApiCall(text: $text).getEvents { (events) in
                self.events = events
            }
        })
        .onAppear {
            ApiCall(text: $text).getEvents() { (events) in
                self.events = events
            }
            
        }
        
    }
    
    
}

