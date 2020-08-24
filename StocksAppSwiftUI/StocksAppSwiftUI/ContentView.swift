//
//  ContentView.swift
//  StocksAppSwiftUI
//
//  Created by WingCH on 24/8/2020.
//  Copyright © 2020 WingCH. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchTerm: String = ""
    
    init() {
//        UINavigationBar.appearance().backgroundColor = UIColor.black
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading){
                Color.black
                Text("January 5 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).offset( y: -400)
                
                SearchView(searchTerm: $searchTerm)
                    .offset (y: -350)
                
                
            }
            .navigationBarTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
