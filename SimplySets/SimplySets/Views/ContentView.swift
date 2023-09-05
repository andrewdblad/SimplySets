//
//  ContentView.swift
//  SimplySets
//
//  Created by Andrew Blad on 8/17/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var vm = DataViewModel()
    @State var isNewUser = true
    @State var showingPopUp = false
    @State var showingExercise = false
    
    var body: some View {
        NavigationStack {
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
                    
                    if vm.savedEntities == [] {
                        Text("Click the \"Add Exercise\" button to ceate your first Exercise.")
                            .multilineTextAlignment(.center)
                            .opacity(0.5)
                            .padding(50)
                    } else {
                        List {
                            ForEach(vm.savedEntities) { exercise in
                                NavigationLink(value: exercise) {
                                    Text(exercise.name!)
                                }
                            }.onDelete(perform: vm.deleteExercise(indexSet:))
                        }
                        .navigationDestination(for: Exercise.self) { exercise in
                            ExerciseView(exercise: exercise)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        showingPopUp.toggle()
                    }, label: {
                        Text("Add Exercise")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 40)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding()
                            .font(.system(size: 18))
                    })
                    .sheet(isPresented: $showingPopUp) {
                        PopUpView(vm: vm, isNewUser: $isNewUser, showingPopUp: $showingPopUp)
                            .presentationDetents([.height(225)])
                    }
                }
            }
        }
    }
}
    
struct ContentViewPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

