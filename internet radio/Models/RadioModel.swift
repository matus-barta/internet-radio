//
//  RadioModel.swift
//  internet radio
//
//  Created by Matúš Barta on 20/08/2023.
//

import Foundation
import SwiftUI

struct Radio: Hashable, Codable{
    let name: String
    let url: String
    let image : String
}

class RadioModel : ObservableObject {
    @Published var radios: [Radio] = []
    
    func fetch(){
        guard let url = URL(string: "https://raw.githubusercontent.com/matus-barta/internet-radio/main/radios.json") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            // convert to JSON
            do{
                let radios = try JSONDecoder().decode([Radio].self, from: data)
                DispatchQueue.main.async {
                    self?.radios = radios
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
