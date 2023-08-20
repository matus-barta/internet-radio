//
//  MiniPlayerView.swift
//  internet radio
//
//  Created by Matúš Barta on 20/08/2023.
//

import SwiftUI

struct MiniPlayerView: View {
    var animation: Namespace.ID
    @Binding var expand: Bool
    
    var height = UIScreen.main.bounds.height / 3
    var safeArea = UIApplication.shared.windows.first?.safeAreaInsets
    
    @State var volume: CGFloat = 0
    @State var offset : CGFloat = 0
    
    var body: some View {
        VStack{
            Capsule()
                .fill(Color.gray)
                .frame(width: expand ? 60 : 0, height: expand ? 4 : 0)
                .opacity(expand ? 1 : 0)
                .padding(.top, expand ? safeArea?.top : 0)
                .padding(.vertical, expand ? 30 : 0)
            
            HStack(spacing: 15){
                
                if expand {Spacer(minLength: 0)}
                
                Image("img1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: expand ?  height: 55, height: expand ? height : 55)
                    .cornerRadius(15)
                
                if !expand{
                    Text("Radio name")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                Spacer(minLength: 0)
                
                
                if !expand{
                    Button(action: {}, label: {
                        Image(systemName: "play.fill")
                            .font(.title)
                            .foregroundColor(.primary)
                            .matchedGeometryEffect(id: "Label", in: animation)
                    })
                }
            }
            .padding(.horizontal)
            
            VStack(spacing: 15){
                Spacer(minLength: 0)
                
                HStack{
                    if expand {
                        Text("Radio name")
                            .font(.title2)
                            .foregroundColor(.primary)
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: "Label", in: animation)
                    }
                    Spacer(minLength: 0)
                    
                    Button(action: {}){
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
                .padding()
                .padding(.top, 20)
                
                // Live String...
                
                HStack{
                    Capsule()
                        .fill(
                            LinearGradient(gradient: .init(colors: [Color.primary.opacity(0.7),Color.primary.opacity(0.1)]), startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(height: 4)
                    Text("LIVE")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Capsule()
                        .fill(
                            LinearGradient(gradient: .init(colors: [Color.primary.opacity(0.1),Color.primary.opacity(0.7)]), startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(height: 4)
                }
                .padding()
                
                // Stop Button
                Button(action: {}){
                    Image(systemName: "stop.fill")
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                }
                .padding()
                
                Spacer(minLength: 0)
                
                HStack(spacing: 15){
                    Image(systemName: "speaker.fill")
                    Slider(value: $volume)
                    Image(systemName: "speaker.wave.2.fill")
                }
                .padding()
                
                HStack(spacing: 22){
                    Button(action: {}){
                        Image(systemName: "arrow.up.message")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    
                    Button(action: {}){
                        Image(systemName: "airplayaudio")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    
                    Button(action: {}){
                        Image(systemName: "list.bullet")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.bottom, safeArea?.bottom == 0 ? 15 : safeArea?.bottom)
                
            }
            // This will give stretch effect
            .frame(height: expand ? nil : 0)
            .opacity(expand ? 1 : 0 )
        }
        .frame(maxHeight: expand ? .infinity : 80)
        .background(
            VStack(spacing: 0){
                BlurView()
                Divider()
            }
                .onTapGesture {
                    withAnimation(.spring()){expand = true}
                }
        )
        .cornerRadius(expand ? 20 : 0)
        .offset(y: expand ? 0 : -48)
        .offset(y: offset)
        .gesture(DragGesture().onEnded(onEnded(value:)).onChanged(onChanged(value:)))
        .ignoresSafeArea()
    }
    
    func onChanged(value: DragGesture.Value){
        if value.translation.height > 0 && expand {
            offset = value.translation.height
        }
    }
    
    func onEnded(value: DragGesture.Value){
        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.95, blendDuration: 0.95)){
            // if value is  > than heaight / 3 then closing view ...
            
            if value.translation.height > height {
                expand = false
            }
            offset = 0
        }
    }
}
