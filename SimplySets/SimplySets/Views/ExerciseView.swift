//
//  ExerciseView.swift
//  SimplySets
//
//  Created by Andrew Blad on 8/31/23.
//

import SwiftUI

struct ExerciseView: View {
    
    var exercise: Exercise
    
    var body: some View {

        
        
        ZStack {
            Color("MainBackgroundColor")
                .ignoresSafeArea()
            VStack {
                
                HStack {
                    Text(exercise.name!)
                        .bold()
                        .font(.system(size: 20))
                    Image(systemName: "chevron.down")
                        .bold()
                } .padding(.top, -35)
    
                Spacer()
                
                Text("Click the \"Add Set\" button to ceate your first set.")
                    .multilineTextAlignment(.center)
                    .opacity(0.5)
                    .padding(50)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Add Set")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 40)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                        .font(.system(size: 18))
                })

            }
        }
    }
}

struct ExerciseViewPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
