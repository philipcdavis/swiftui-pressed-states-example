//
//  ContentView.swift
//  PressedStates
//
//  Created by Philip Davis on 1/31/22.
//

import SwiftUI

struct ShadowButton: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 30)
            .padding(.vertical, 16)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(.white)
                        .shadow(color: Color("DarkBlue").opacity(0.25), radius: 10, x:0, y: configuration.isPressed ? 10: 15)
                        .shadow(color: Color("DarkBlue").opacity(0.25), radius: 3, x:0, y: configuration.isPressed ? 4: 6)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.97: 1)
            .foregroundColor(.primary)
            .animation(.spring(), value: configuration.isPressed)
    }
}

struct ShadowButtonGrow: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 30)
            .padding(.vertical, 16)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(.white)
                        .shadow(color: Color("DarkBlue").opacity(0.25), radius: configuration.isPressed ? 15 : 10, x:0, y: configuration.isPressed ? 20: 15)
                        .shadow(color: Color("DarkBlue").opacity(0.25), radius: configuration.isPressed ? 8 : 3, x:0, y: configuration.isPressed ? 10: 6)
                }
            )
            .scaleEffect(configuration.isPressed ? 1.1: 1)
            .foregroundColor(.primary)
            .animation(.spring(), value: configuration.isPressed)
    }
}

struct Highlight: ButtonStyle {
    let tint: Color
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 30)
            .padding(.vertical, 16)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(.blue.opacity(0.2))
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(tint).opacity(configuration.isPressed ? 0.4 : 0)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.97: 1)
            .foregroundColor(.blue)
            .animation(.spring(), value: configuration.isPressed)
    }
}

struct HighlightGrow: ButtonStyle {
    let tint: Color
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 30)
            .padding(.vertical, 16)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(tint).opacity(configuration.isPressed ? 0.1 : 0)
                }
            )
            .scaleEffect(configuration.isPressed ? 1.03: 1)
            .foregroundColor(.primary)
            .animation(.spring(), value: configuration.isPressed)
    }
}

struct Instant: ButtonStyle {
    let tint: Color
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 30)
            .padding(.vertical, 16)
            .animation(.spring(), value: configuration.isPressed)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(.blue)
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(tint).opacity(configuration.isPressed ? 0.1 : 0)
                }
            )
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 0.95: 1)
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.05).ignoresSafeArea()
            VStack(spacing: 30) {
                
                VStack {
                    Text("Shadow Shrink").fontWeight(.bold).foregroundColor(Color("DarkBlue")).opacity(0.5)
                    Button {
                        print("Pressed!")
                    } label: {
                        Image(systemName: "creditcard.fill").font(.title)
                    }.buttonStyle(ShadowButton())
                }
                
                VStack {
                    Text("Shadow Grow").fontWeight(.bold).foregroundColor(Color("DarkBlue")).opacity(0.5)
                    Button(action: {
                        print("Pressed!")
                    }){
                        Image(systemName: "creditcard.fill").font(.title)
                    }.buttonStyle(ShadowButtonGrow())
                }
                
                VStack {
                    Text("Highlight Light").fontWeight(.bold).foregroundColor(Color("DarkBlue")).opacity(0.5)
                    Button(action: {
                        print("Pressed!")
                    }){
                        Image(systemName: "creditcard.fill").font(.title)
                    }.buttonStyle(Highlight(tint: .white))
                }
                VStack {
                    Text("Highlight Dark").fontWeight(.bold).foregroundColor(Color("DarkBlue")).opacity(0.5)
                    Button(action: {
                        print("Pressed!")
                    }){
                        Image(systemName: "creditcard.fill").font(.title)
                    }.buttonStyle(Highlight(tint: .blue.opacity(0.5)))
                }
                
                VStack {
                    Text("Highlight Grow").fontWeight(.bold).foregroundColor(Color("DarkBlue")).opacity(0.5)
                    Button(action: {
                        print("Pressed!")
                    }){
                        Image(systemName: "creditcard.fill").font(.title)
                    }.buttonStyle(HighlightGrow(tint: .black))
                }
                
                VStack {
                    Text("Instant Press").fontWeight(.bold).foregroundColor(Color("DarkBlue")).opacity(0.5)
                    Button(action: {
                        print("Pressed!")
                    }){
                        Image(systemName: "creditcard.fill").font(.title)
                    }.buttonStyle(Instant(tint: .black))
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
