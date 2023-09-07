//
//  AddSetView.swift
//  SimplySets
//
//  Created by Andrew Blad on 9/4/23.
//

import SwiftUI

struct AddSetView: View {
    
    @ObservedObject var vm: DataViewModel
    @FocusState private var keyboardFocused: Bool
    @Binding var totalReps: Int
    @Binding var totalWeight: Double
    @State var exercise: Exercise
    
    var body: some View {
        ZStack {
            Color("AddSetBackgroundColor")
                .ignoresSafeArea()
            VStack {
                VStack {
                    
                    HStack {
                        Spacer()
                        Text("-")
                        Spacer()
                        Text("Weight")
                        Spacer()
                        Text("+")
                        Spacer()
                    }
                    .font(.system(size: 18))
                    .bold()
                    
                    HStack {
                        deleteWeightButton(totalWeight: $totalWeight, weight: 10)
                        deleteWeightButton(totalWeight: $totalWeight, weight: 5)
                        deleteWeightButton(totalWeight: $totalWeight, weight: 2.5)
                        
                        Text("\(totalWeight.formatted())")
                            .foregroundColor(.white)
                            .frame(width: 75, height: 30)
                            .background(Color.gray)
                            .cornerRadius(10)
                            .font(.system(size: 18))
                        
                        
                        addWeightButton(totalWeight: $totalWeight, weight: 2.5)
                        addWeightButton(totalWeight: $totalWeight, weight: 5)
                        addWeightButton(totalWeight: $totalWeight, weight: 10)
                    }
                }
                .padding(10)
                .background(Color("BackgroundColor"))
                .cornerRadius(20)
                    
                VStack {
                    HStack {
                        Spacer()
                        Text("-")
                        Spacer()
                        Text("Reps")
                        Spacer()
                        Text("+")
                        Spacer()
                    }
                    .font(.system(size: 18))
                    .bold()
                    
                    HStack {
                        deleteRepButton(totalReps: $totalReps, reps: 3)
                        deleteRepButton(totalReps: $totalReps, reps: 2)
                        deleteRepButton(totalReps: $totalReps, reps: 1)
                        
                        Text("\(totalReps)")
                            .foregroundColor(.white)
                            .frame(width: 75, height: 30)
                            .background(Color.gray)
                            .cornerRadius(10)
                            .font(.system(size: 18))
                        
                        addRepButton(totalReps: $totalReps, reps: 1)
                        addRepButton(totalReps: $totalReps, reps: 2)
                        addRepButton(totalReps: $totalReps, reps: 3)
                    }
                }
                .padding(10)
                .background(Color("BackgroundColor"))
                .cornerRadius(20)
                
                Button(action: {
                    vm.addSet(exercise: exercise, weight: totalWeight, reps: totalReps)
                    
                }, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .frame(width: 75, height: 40)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .font(.system(size: 18))
                        .padding(20)
                })
            }
        }
    }
}

struct AddSetView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct addWeightButton: View {
    @Binding var totalWeight: Double
    @State var weight: Double
    
    var body: some View {
        Button {
            totalWeight += weight
        } label: {
            Text("\(weight.formatted())")
                .foregroundColor(.white)
                .frame(width: 45, height: 30)
                .background(Color.green)
                .cornerRadius(10)
                .font(.system(size: 18))
                .padding(-2)
        }

    }
}

struct deleteWeightButton: View {
    @Binding var totalWeight: Double
    @State var weight: Double
    
    var body: some View {
        Button {
            if totalWeight - weight >= 0 {
                totalWeight -= weight
            }
        } label: {
            Text("\(weight.formatted())")
                .foregroundColor(.white)
                .frame(width: 45, height: 30)
                .background(Color.orange)
                .cornerRadius(10)
                .font(.system(size: 18))
                .padding(-2)
        }

    }
}

struct addRepButton: View {
    @Binding var totalReps: Int
    @State var reps: Int
    
    var body: some View {
        Button {
            totalReps += reps
        } label: {
            Text("\(reps.formatted())")
                .foregroundColor(.white)
                .frame(width: 45, height: 30)
                .background(Color.green)
                .cornerRadius(10)
                .font(.system(size: 18))
                .padding(-2)
        }

    }
}

struct deleteRepButton: View {
    @Binding var totalReps: Int
    @State var reps: Int
    
    var body: some View {
        Button {
            if totalReps - reps >= 0 {
                totalReps -= reps
            }
        } label: {
            Text("\(reps.formatted())")
                .foregroundColor(.white)
                .frame(width: 45, height: 30)
                .background(Color.orange)
                .cornerRadius(10)
                .font(.system(size: 18))
                .padding(-2)
        }

    }
}
