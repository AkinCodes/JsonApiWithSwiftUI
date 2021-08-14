//
//  ContentView.swift
//  JsonApiWithSwiftUI
//
//  Created by Akin on 14/08/2021.
//

import SwiftUI

struct ContentView: View {
  @StateObject var akin = Akin()
    
    var body: some View {
            NavigationView {
                    
                List {
                    ForEach(akin.items, id: \.self) { item in
                        Text(item.webTitle)
                            .font(.largeTitle)
                            .bold()
                            .padding()
                       
                    }
                    
                    
                    
                }.onAppear(perform: {
                    akin.getData()
                })
                
                .navigationTitle("NEWS COVERAGE")
                
                
                
                
            }
            
           
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
