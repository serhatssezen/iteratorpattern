//
//  iteratorPatternApp.swift
//  iteratorPattern
//
//  Created by Aydın Serhat SEZEN on 18.04.2023.
//

import SwiftUI

@main
struct iteratorPatternApp: App {
    var taskList = TaskList()
    var body: some Scene {
        WindowGroup {
            ContentView(taskList: taskList)
        }
    }
}
