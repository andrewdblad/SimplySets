//
//  Persistence.swift
//  SimplySets
//
//  Created by Andrew Blad on 8/17/23.
//

import CoreData
import Foundation

class DataViewModel: ObservableObject {
    
    let container = NSPersistentContainer(name: "SimplySets")
    @Published var savedEntities: [Exercise] = []
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        fetchExercises()
    }
    
    func fetchExercises() {
        let request = NSFetchRequest<Exercise>(entityName: "Exercise")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addExercise(name: String) {
        let newExercise = Exercise(context: container.viewContext)
        newExercise.name = name
        saveData()
    }
    
    func addSet(exercise: Exercise, weight: Double, reps: Int) {
        let newSet = Set(context: container.viewContext)
        newSet.weight = weight
        newSet.reps = Int16(reps)
        newSet.date = Date()
        newSet.exercise = exercise
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchExercises()
        } catch let error {
            print("Error Saving \(error)")
        }
    }
    
    func deleteExercise(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    

}
