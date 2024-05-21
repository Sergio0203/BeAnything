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
        JobsModel(image: Image(.presidenta), story: "Senhora Presidente, os alunos de várias escolas estão sem livros. O que você gostaria de fazer para garantir que todos tenham os livros de que precisam?", name: "A Presidente", description: ["A presidente é a chefe de um país", "Ela ajuda as pessoas do país", "Ela fala em nome do país em eventos importantes"]),
        JobsModel(image: Image( .cientista), story: "Hoje é um dia muito emocionante no laboratório. Estamos tentando descobrir uma cura para uma doença muito importante. Recebemos uma amostra misteriosa da natureza que ninguém consegue explicar. Como você vai investigar e descobrir o que é essa amostra?", name: "A Cientista", description: ["Ela descobre coisas novas", "Ela faz experimentos e pesquisas para descobrir coisas", "Ela estuda para entender como as coisas funcionam", "Ela usa sua criatividade e conhecimento para resolver problemas importantes"]),
        JobsModel(image: Image( .guerreira), story: "A floresta está em perigo e precisa de sua proteção. Invasores foram vistos perto da entrada da floresta. O que você vai fazer para impedir que eles entrem e causem danos?", name: "A Guerreira", description: ["Ela protege sua terra e família", "Ela está sempre pronta para lutar contra qualquer ameaça", "Ela é líder, comandam exércitos e planejam estratégias", "É corajosa e determinada", "Ela defende a justiça" ]),
        JobsModel(image: Image( .astronauta), story: "Hoje é um dia muito importante para nossa missão espacial. Estamos prestes a explorar um novo planeta. Estamos nos aproximando de um novo planeta com sinais de vida. Como você vai explorar e estudar este novo mundo?", name: "A Astronauta", description: ["Ela viaja para fora da Terra e visitam a lua e outros planetas", "Ela usa uma roupa especial com um capacete para poder andar no espaço", "Ela pilota um foguete" ]),
        JobsModel(image: Image(.atleta), story: "Você é a Capitã do time de vôlei! Hoje é o dia da grande final do campeonato mundial de vôlei. Você está pronta para liderar sua equipe à vitória? Seu time está perdendo por poucos pontos. O que você vai dizer aos seus companheiros para motivá-los a dar o melhor de si?", name: "A Atleta de Vôlei", description: ["Ela treina e pratica muito o esporte", "Ela joga com seu time", "Ela compete em jogos e campeonatos", "Ela ganha medalhas quando vence os jogos com seu time"]),

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
