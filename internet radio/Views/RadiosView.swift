//
//  RadiosView.swift
//  internet radio
//
//  Created by Matus Barta on 11/08/2023.
//

import SwiftUI

struct Radio: Identifiable{
    var id = UUID()
    
    let name: String
    let url: String
    let image : Image
}

let radios = [
    Radio(name: "Test1", url: "http://google.com/", image: Image("img1")),
    Radio(name: "Test2", url: "https://apple.com/", image: Image("img2"))
]

struct RadiosView: View {
    var body: some View {
        List(radios) { radio in
            HStack{
                radio.image
                    .resizable()
                    .frame(width: 48, height:48)
                Text(radio.name)
            }
        }
    }
}

struct RadiosView_Previews: PreviewProvider {
    static var previews: some View {
        RadiosView()
    }
}
