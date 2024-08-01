//
//  ContentView.swift
//  BackCAPS Restaurants
//
//  Created by Zohaib Ahmed on 29/07/2024.
//

import SwiftUI

struct RestaurantTabView: View {
    
    var body: some View {
        TabView{
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            FoodScreen()
                .tabItem {
                    Label("Food", systemImage: "birthday.cake")
                }
            MartScreen()
                .tabItem{
                    Label("Mart", systemImage: "basket")
                }
            DineInScreen()
                .tabItem {
                    Label("Dine In", systemImage: "chair.lounge")
                }
            CourierScreen()
                .tabItem {
                    Label("Courier", systemImage: "archivebox")
                }
        }
    }
}

#Preview {
    RestaurantTabView()
}
