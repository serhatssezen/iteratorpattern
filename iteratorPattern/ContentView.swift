//
//  ContentView.swift
//  iteratorPattern
//
//  Created by Aydın Serhat SEZEN on 18.04.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskList: TaskList
    private var taskIterator: TaskIterator
    
    init(taskList: TaskList) {
        _taskList = ObservedObject(wrappedValue: taskList)
        self.taskIterator = taskList.createIterator()
    }
    
    var body: some View {
        VStack {
            Text("Task List")
                .font(.title)
                .bold()
            
            List {
                ForEach(taskList.getTasks()) { task in
                    Text(task.title)
                }
            }
            
            Button("Restart") {
                taskList.restartIterator()
            }
            
            Button("Add Task") {
                taskList.addTask("New Task")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskList: TaskList())
    }
}
