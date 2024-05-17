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
        JobsModel(image: Image(systemName: "trash.square.fill"), story: "Agora vc é um lixeiro", name: "Lixeiro", description: ["Vc corre atrás do caminhao", "Vc é foda"]),
        JobsModel(image: Image(systemName: "square.and.arrow.down.fill"), story: "Essa é uma historia sobre o teste 2", name: "Teste", description: ["Vc é usado para testar", "Vc valida"]),
        JobsModel(image: Image(systemName: "pencil"), story: "Agora vc é um lapis", name: "Lapis", description: ["Voce é Grande", "Voce escreve"])


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
