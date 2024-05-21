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
        JobsModel(image: Image(.presidenta), story: "Senhora Presidente, os alunos de várias escolas estão sem livros. O que você gostaria de fazer para garantir que todos tenham os livros de que precisam?", name: "A presidente", description: ["A presidente é a chefe de um país", "Ela ajuda as pessoas do país", "Ela fala em nome do país em eventos importantes"]),
        JobsModel(image: Image(systemName: "square.and.arrow.down.fill"), story: "Essa é uma historia sobre o teste 2", name: "teste", description: ["Vc é usado para testar", "Vc valida"]),
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
