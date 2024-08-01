//
//  HomeScreen.swift
//  BackCAPS Restaurants
//
//  Created by Zohaib Ahmed on 29/07/2024.
//

import SwiftUI

struct HomeScreen: View {
    
    
    var columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())
    ]
    @State var searchField = ""
    
    var body: some View {
        ScrollView{
            VStack{
                HomeScreenTabBar()
                
                SearchFieldWithFilter(searchField: $searchField)
                
                LazyVGrid(columns: columns){
                    CategoryCard(title: "Food", requiredTime: "25 mins", imageName: "food")
                    CategoryCard(title: "Mart", requiredTime: "20 mins", imageName: "food")
                    CategoryCard(title: "Courier", requiredTime: "30 mins", imageName: "food")
                    
                }
                
//                ScrollView(.horizontal){
//                    ZStack{
//                        HStack{
//                            VStack(alignment: .leading){
//                                Text("Get up to")
//                                    .font(.callout)
//                                Text("25%off")
//                                    .font(.headline)
//                                Text("on all food orders")
//                                    .font(.body)
//                                Button{
//                                    
//                                }label: {
//                                    Text("Order now")
//                                }
//                                .buttonStyle(.borderedProminent)
//                                .buttonBorderShape(.roundedRectangle)
//                            }
//                            Spacer()
//                        }
//                    }.background(Color.yellow.opacity(0.3))
//                }
                
                Text("**This is a bold text** and this is *italic* [click here](https://www.apple.com) to go to apple.com this is a long text to test the functionality of how long the text can go lorem lorem lorem lorem")
                    .rotation3DEffect(.degrees(41), axis: (x: 0, y: 0, z: 0))
                    
            }
            .padding()
        }
    }
}

#Preview {
    HomeScreen()
}

struct HomeScreenTabBar: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Deliver Now")
                    .font(.subheadline)
                    .foregroundStyle(Color(.systemGray))
                Text("Jhelum, Pakistan")
                    .font(.headline)
                    .fontWeight(.bold)
            }
            Spacer()
            Button{
                
            } label:{
                Image(systemName:"person")
            }
            .buttonBorderShape(.roundedRectangle)
            .frame(width: 42, height: 42)
            .background(Color.gray.opacity(0.2))
            .foregroundStyle(.primary)
            .clipShape(Circle())
        }
    }
}

struct SearchFieldWithFilter: View {
    
    @Binding var searchField: String
    
    var body: some View {
        TextField("Search for food, grocery, meat, etc", text: $searchField)
            .font(.subheadline)
            .padding(.leading, 40)
            .frame(width: .infinity, height: 42)
            .background(Color(.systemGray).opacity(0.1))
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 25, height: 30)))
            .overlay(alignment: .leading){
                Image(systemName:"magnifyingglass")
                    .padding(.leading, 10)
                
            }
            .overlay(alignment: .trailing){
                HStack{
                    Button{
                        
                    } label: {
                        Image(systemName: "mic")
                    }
                    Rectangle()
                        .frame(width: 1, height: .infinity)
                        .padding(.vertical, 10)
                    Button{
                        
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                }
                .padding(.trailing, 10)
                .foregroundStyle(.primary)
                
            }
    }
}
