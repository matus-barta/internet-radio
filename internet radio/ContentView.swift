//
//  ContentView.swift
//  internet radio
//
//  Created by Matus Barta on 09/08/2023.
//

import SwiftUI

struct ContentView: View {
    // Dafautl tab index
    @State var current = 0
    
    // Miniplayer properties
    @State var expand = false
    @Namespace var animation
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView(selection: $current) {
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
            MiniPlayerView(animation: animation, expand: $expand)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
