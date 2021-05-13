//
//  ImageView.swift
//  SeatGeekChallenge
//
//  Created by Ronald Joubert on 5/13/21.
//

import SwiftUI

struct ImageView: View {
    
    var url: String = ""
    
    var body: some View {
        RemoteImage(url: url)
            .aspectRatio(contentMode: .fit)
            .frame(width: 100)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
