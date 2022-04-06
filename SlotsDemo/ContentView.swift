//
//  ContentView.swift
//  SlotsDemo
//
//  Created by Oncu Ohancan on 6.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [0, 0, 0]
    @State private var credits = 1000
    private var betAmount = 5
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.cyan)
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(.accentColor).rotationEffect(.degrees(45)).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    Text("SwiftUI Slots!").foregroundColor(.white).bold()
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                }
                .scaleEffect(2)
                
                Spacer()
                
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Spacer()
                HStack {
                    Spacer()
                    Image(symbols[numbers[0]]).resizable().aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Image(symbols[numbers[1]]).resizable().aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Image(symbols[numbers[2]]).resizable().aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                    self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                    self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                    
//                    CHECK
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        
//                    WON
                        self.credits += betAmount * 10
                    } else {
                        self.credits -= betAmount
                    }
                }) {
                    Text("Spin")
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(.pink)
                        .cornerRadius(20)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
