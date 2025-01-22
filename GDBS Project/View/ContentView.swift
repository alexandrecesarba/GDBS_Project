//
//  ContentView.swift
//  GDBS Project
//
//  Created by Alexandre César Brandão de Andrade on 13/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MapView()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    ContentView()
}
