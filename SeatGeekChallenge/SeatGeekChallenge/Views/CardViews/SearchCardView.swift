//
//  SearchCardView.swift
//  SeatGeekChallenge
//
//  Created by Ronald Joubert on 5/11/21.
//

import SwiftUI
import CoreData

struct SearchCardView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var image: String = "image-not-found"
    var showName: String = "Show Name"
    var location: String = "Location"
    var dateTime: String = "TUE, 11 MAY 2021 8:00 PM"
    var id: Int32 = 0

    let dc = DateChanger()
    @FetchRequest var likedEvents: FetchedResults<LikeEvent>

    init(image: String = "image-not-found", showName: String = "Show Name", location: String = "Location", dateTime: String = "TUE, 11 MAY 2021 8:00 PM", id: Int32 = 0) {
        self.image = image
        self.showName = showName
        self.location = location
        self.dateTime = dateTime
        self.id = id
    
        let request: NSFetchRequest<LikeEvent> = LikeEvent.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \LikeEvent.eventId, ascending: true)]
        request.predicate = NSPredicate(format: "eventId == \(id)")
        self._likedEvents = FetchRequest(fetchRequest: request)
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            HStack {
                ImageView(url: image)
                    .frame(width: 100, height: 100, alignment: .center)
                VStack {
                    Text(showName)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(location)
                    
                    Text(dc.stringToDate(dateString: dateTime))
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.05), radius: 20, x: 15, y: 15)
            .clipShape(Capsule())
            if let event = likedEvents.first, event.liked {
                Image(systemName: "heart.fill")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(.red)
            }
            
        }
    }
}

struct SearchCardView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCardView()
            .previewLayout(.sizeThatFits)
    }
}
