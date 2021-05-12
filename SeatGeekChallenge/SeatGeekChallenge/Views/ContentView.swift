//
//  ContentView.swift
//  SeatGeekChallenge
//
//  Created by Ronald Joubert on 5/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var nameData: String?
    let vm = EventViewModel()
    
    func loadData() {
        self.vm.callNetwork(name: nameData ?? "")
    }
    
    var body: some View {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
