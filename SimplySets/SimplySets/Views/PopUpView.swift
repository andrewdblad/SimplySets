//
//  PopUpView.swift
//  SimplySets
//
//  Created by Andrew Blad on 8/28/23.
//

import SwiftUI

struct PopUpView: View {
    
    @ObservedObject var vm: DataViewModel
    @Binding var isNewUser: Bool
    @Binding var showingPopUp: Bool
    @State var name = ""
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                Button(action: {
                    showingPopUp = false
                }, label: {
                    HStack {
                        Image(systemName: "arrow.backward")
                            .padding(.trailing, -5)
                            .bold()
                        Text("Cancel")
                            .font(.system(size: 18))
                    }
                    .padding(10)
                    Spacer()
                    
                        })
                
                Spacer()
                HStack {
                    Text("Add Exercise")
                    Image(systemName: "chevron.down")
                        .bold()
                }
                TextField("Enter exercise name: ", text: $name)
                    .multilineTextAlignment(.leading)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    showingPopUp = false
                    isNewUser = false
                    vm.addExercise(name: name)
                    
                }, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .frame(width: 75, height: 40)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .font(.system(size: 18))
                })
                .padding(.bottom, 10)
            }
            .frame(width: 300, height: 300)
            .background(Color("MainBackgroundColor"))
            .cornerRadius(15)
        }
    }
}

