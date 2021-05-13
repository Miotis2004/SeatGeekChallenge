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
    var dateTime: String = "TUE, 11 MAY 2021 8:00 PM"
    
        
    var body: some View {
        VStack {
            HStack {
//                Image(image)
//                    .resizable()
//                    .frame(width: 100, height: 100, alignment: .center)
//                    .padding()
                ImageView(url: image)
                VStack {
                    Text(showName)
                        .font(.headline)
                        .fontWeight(.bold)
                        
                    Text(location)
                        
                    Text(dateTime)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.05), radius: 20, x: 15, y: 15)
            .clipShape(Capsule())
        }
        
    }
}

struct SearchCardView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCardView()
            .previewLayout(.sizeThatFits)
    }
}
