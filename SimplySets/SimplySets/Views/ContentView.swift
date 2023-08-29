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
    private let adaptiveColumns = [ GridItem(.adaptive(minimum: 170)) ]
    
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
                
                if vm.savedEntities == [] {
                    Text("Click the \"Add Exercise\" button to ceate your first set.")
                        .multilineTextAlignment(.center)
                        .opacity(0.5)
                        .padding(50)
                } else {
                    NavigationView {
                        ScrollView {
                            LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                                ForEach(vm.savedEntities) { exercise in
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 170, height: 170)
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    Spacer()
                    
                    Button(action: {
                        showingPopUp = true
                    }, label: {
                        Text("Add Exercise")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 40)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding()
                            .font(.system(size: 18))
                    })
                    
                }
                
                if showingPopUp == true {
                    PopUpView(vm: vm, isNewUser: $isNewUser, showingPopUp: $showingPopUp)
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
