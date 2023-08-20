//
//  RadiosView.swift
//  internet radio
//
//  Created by Matus Barta on 11/08/2023.
//

import SwiftUI


struct RadiosView: View {
    @StateObject var radioModel = RadioModel()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(radioModel.radios, id:\.self){ radio in
                    HStack{
                        AsyncImage(url: URL(string: radio.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                            .frame(width: 48, height:48)
                            .background(Color.gray)
                            .cornerRadius(7)
                        Text(radio.name)
                    }
                }
            }
            .navigationTitle("Radios")
            .onAppear{
                radioModel.fetch()
            }
        }
    }
}

struct RadiosView_Previews: PreviewProvider {
    static var previews: some View {
        RadiosView()
    }
}
