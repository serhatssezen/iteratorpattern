//
//  Task.swift
//  iteratorPattern
//
//  Created by Aydın Serhat SEZEN on 18.04.2023.
//

import Foundation

// Model sınıfı: Görev veri modelini temsil eder
struct Task: Identifiable {
    var id = UUID()
    var title: String
}
