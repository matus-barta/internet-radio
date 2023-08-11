//
//  ContentView.swift
//  internet radio
//
//  Created by Matus Barta on 09/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            RadiosView().tabItem {
                Image(systemName: "dot.radiowaves.left.and.right")
                Text("Radios") }
            .tag(1)
            SearchView().tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search") }
            .tag(2)
            FavoritesView().tabItem {
                Image(systemName: "heart")
                Text("Favorites") }
            .tag(3)
            SettingsView().tabItem {
                Image(systemName: "gearshape")
                Text("Settings") }
            .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
