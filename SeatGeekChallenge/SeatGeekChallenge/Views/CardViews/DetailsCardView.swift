//
//  DetailsCardView.swift
//  SeatGeekChallenge
//
//  Created by Ronald Joubert on 5/11/21.
//

import SwiftUI
import CoreData

struct DetailsCardView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var image: String = "image-not-found"
    var showName: String = "Show Name"
    var location: String = "Location"
    var dateTime: String = "TUE, 11 MAY 2021 8:00 PM"
    var id: Int32 = 0
    
    
    let dc = DateChanger()
    
    var body: some View {
        VStack {
            HStack {
                Text(showName)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    let event = LikeEvent(context: managedObjectContext)
                    event.eventId = id
                    event.liked = !event.liked
                    PersistenceController.shared.save()
                }, label: {
                    let event = LikeEvent(context: managedObjectContext)
                    
                    if !event.liked {
                        Image(systemName: "heart")
                            .font(.system(size: 24, weight: .regular))
                            .foregroundColor(.red)
                    } else {
                        Image(systemName: "heart.fill")
                            .font(.system(size: 24, weight: .regular))
                            .foregroundColor(.red)
                    }
                })
            }
            ImageView(url: image)
                
            Text(dc.stringToDate(dateString: dateTime))
                .font(.title)
                .fontWeight(.bold)
            Text(location)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

struct DetailsCardView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsCardView()
    }
}
