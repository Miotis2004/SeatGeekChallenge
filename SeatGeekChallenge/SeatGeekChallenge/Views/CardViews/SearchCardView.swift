//
//  SearchCardView.swift
//  SeatGeekChallenge
//
//  Created by Ronald Joubert on 5/11/21.
//

import SwiftUI

struct SearchCardView: View {
    
    var image: String = "image-not-found"
    var showName: String = "Show Name"
    var location: String = "Location"
    var dateTime: Date = Date()
    
    func getDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .long
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .padding()
                VStack {
                    Text(showName)
                        .font(.headline)
                        .fontWeight(.bold)
                        
                    Text(location)
                        
                    Text(getDate(date: dateTime))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
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
