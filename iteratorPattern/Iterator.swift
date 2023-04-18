//
//  Iterator.swift
//  iteratorPattern
//
//  Created by Aydın Serhat SEZEN on 18.04.2023.
//

import Foundation
import Combine

// Iterator arayüzü: Görev listesi üzerinde dolaşmak için gerekli işlemleri tanımlar
protocol TaskIterator {
    func getNextTask() -> Task?
    func restart()
}

// Concrete Iterator sınıfı: Görev listesi üzerinde dolaşmak için kullanılan iterator
class TaskListIterator: TaskIterator {
    private var tasks: [Task]
    private var currentIndex = 0
    
    init(tasks: [Task]) {
        self.tasks = tasks
    }
    
    func getNextTask() -> Task? {
        guard currentIndex < tasks.count else {
            return nil
        }
        let task = tasks[currentIndex]
        currentIndex += 1
        return task
    }
    
    func restart() {
        currentIndex = 0
    }
}

// Concrete Collection sınıfı: Görev listesini temsil eder
class TaskList: ObservableObject {
    @Published private var tasks: [Task] = []
    
    func addTask(_ title: String) {
        tasks.append(Task(title: "\(title) \(tasks.count)"))
    }
    
    func createIterator() -> TaskIterator {
        return TaskListIterator(tasks: tasks)
    }
    
    func getTasks() -> [Task] {
        return tasks
    }
    
    func restartIterator() {
        tasks = []
        createIterator().restart()
    }
}
