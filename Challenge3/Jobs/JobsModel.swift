//
//  JobsModel.swift
//  Challenge3
//
//  Created by Sérgio César Lira Júnior on 15/05/24.
//

import Foundation
import SwiftUI


struct DataBase {
    static var listJobs: [JobsModel] = [
        JobsModel(image: Image(systemName: "trash.square.fill"), story: "Agora vc é um lixeiro", name: "Lixeiro", description: ["Vc corre atraz do caminhao", "Vc é foda"])
    ]
}


struct JobsModel{
    let image: Image
    let story: String
    let name: String
    let description: [String]
    init(image: Image!, story: String, name: String, description: [String]) {
        self.image = image
        self.story = story
        self.name = name
        self.description = description
    }
}
