//
//  ExerciseView.swift
//  SimplySets
//
//  Created by Andrew Blad on 8/31/23.
//

import SwiftUI

struct ExerciseView: View {
    
    @ObservedObject var vm: DataViewModel
    @State var exercise: Exercise
    @State var showingAddSet = false
    @State var totalReps = 0
    @State var totalWeight = 0.0
    
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
                    showingAddSet.toggle()
                    
                }, label: {
                    Text("Add Set")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 40)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                        .font(.system(size: 18))
                })
                .sheet(isPresented: $showingAddSet) {
                    ZStack {
                        Color.red
                            .ignoresSafeArea()
                        VStack {
                            AddSetView(vm: vm, totalReps: $totalReps, totalWeight: $totalWeight, exercise: exercise)
                                .presentationDetents([.height(265)])
                                .presentationCornerRadius(25)
                        }
                    }
                }
            }
        }
    }
}

struct ExerciseViewPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
