//
//  Model.swift
//  JsonApiWithSwiftUI
//
//  Created by Akin on 14/08/2021.
//

import Foundation
import SwiftUI

// I will be using the api from The GuardiAN News organisation.

class Akin: ObservableObject {
 
    @Published var items: [Results] = []
    
    struct Results: Codable, Hashable {
        var webTitle: String
    }
    
    
    struct Guardian: Codable, Hashable {
        var results: [Results]
    }
    
    
    struct GuardianResponse: Codable {
        var response: Guardian
       
    }
    
    func getData(){
        
        guard let url = URL(string: "https://content.guardianapis.com/search?api-key=21b7bbb2-7987-4ef2-bfab-ec61018fa736") else {
            fatalError("error in url")
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if error != nil {
                print("error")
            }else {
                if let data =  data {
                    let decoder = JSONDecoder()
                    if let itemz = try? decoder.decode(GuardianResponse.self, from: data) {
                        
                        // execute this next line on the main queue. UI work needs to be executed with this function. 
                        DispatchQueue.main.async {
                            self.items = itemz.response.results
                        }
                        
                    }
                    
                }
                
            }
        }
        task.resume()
        
    }
    
    
    
    
}


