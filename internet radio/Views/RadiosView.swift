//
//  RadiosView.swift
//  internet radio
//
//  Created by Matus Barta on 11/08/2023.
//

import SwiftUI

let radios: [Radio] = APIManager.fetchData().(completion: <#T##(Result<[Radio], Error>) -> Void#>)

struct RadiosView: View {
    var body: some View {
        List(radios) { radio in
            HStack{
                Image(radio.image)
                    .resizable()
                    .frame(width: 48, height:48)
                Text(radio.name)
            }
        }
    }
}

struct RadiosView_Previews: PreviewProvider {
    func fetch() {
            APIManager.shared.fetchProducts { response in
                switch response {
                case .success(let products):
                    self.products = products
                case .failue(let error):
                    print(error)
                }
            }
        }
    
    static var previews: some View {
        RadiosView()
    }
}
