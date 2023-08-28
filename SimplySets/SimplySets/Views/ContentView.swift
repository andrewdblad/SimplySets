//
//  ContentView.swift
//  SimplySets
//
//  Created by Andrew Blad on 8/17/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var isNewUser = true
    
    var body: some View {
        ZStack {
            Color("MainBackgroundColor")
                .ignoresSafeArea()
            VStack {
                
                HStack {
                    Text("Exercises")
                        .bold()
                        .font(.system(size: 20))
                    Image(systemName: "chevron.down")
                        .bold()
                }
                
                Spacer()
                
                Text("Click the \"Add Exercise\" button to ceate your first set.")
                    .multilineTextAlignment(.center)
                    .opacity(0.5)
                    .padding(50)
                
                Spacer()
                
                Button(action: {
                        print("tapped!")
                    }, label: {
                        Text("Add Exercise")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 40)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .padding()
                            .font(.system(size: 18))
                })
                
            }
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
