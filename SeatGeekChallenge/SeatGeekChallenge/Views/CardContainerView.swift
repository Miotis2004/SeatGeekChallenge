//
//  CardContainerView.swift
//  SeatGeekChallenge
//
//  Created by Ronald Joubert on 5/13/21.
//

import SwiftUI

struct CardContainerView: View {
    
    var image: String = "image-not-found"
    var showName: String = "Show Name"
    var location: String = "Location"
    var dateTime: String = "TUE, 11 MAY 2021 8:00 PM"
    var id: Int32 = 0
    
    var body: some View {
        Button(action: {
            
        }, label: {
            SearchCardView(image: image, showName: showName, location: location, dateTime: dateTime, id: id)
                
        })
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
        )
        .padding()
    }
}

struct CardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CardContainerView()
    }
}
