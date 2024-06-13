//
//  JobsModel.swift
//  Challenge3
//
//  Created by Sérgio César Lira Júnior on 15/05/24.
//

import Foundation
import SwiftUI


struct DataBase {
    #warning("Esta variável poderia estar dentro do próprio JobsModel ou até um extension!")
    static var listJobs: [JobsModel] = [
        JobsModel(image: Image(.presidenta), story: "Olá, presidente! Hoje é seu primeiro dia. Você está pronta para ajudar e resolver os problemas do país?\n\nSenhora Presidente, os alunos de várias escolas estão sem livros. O que você gostaria de fazer para garantir que todos tenham os livros de que precisam?", name: "A Presidente", description: ["A presidente é chefe de um país", "Ela ajuda as pessoas do país", "Ela fala em nome do país em eventos importantes"], audioName: "presidentAudio"),
        JobsModel(image: Image( .cientista), story: "Olá, cientista! Hoje é um dia muito emocionante no laboratório. Estamos tentando descobrir uma cura para uma doença.\n\nRecebemos algo que poderá nos ajudar, mas não sabemos o que é. Como você vai investigar e descobrir o que é?", name: "A Cientista", description: ["Faz pesquisas e experimentos", "Descobre coisas novas", "Resolve probelmas importantes"], audioName: "scientistAudio"),
        JobsModel(image: Image( .guerreira), story: "Olá, guerreira! A floresta está em perigo e precisa de sua proteção. Invasores foram vistos perto da entrada da floresta. O que você vai fazer para impedir que eles entrem e causem danos?", name: "A Guerreira", description: ["Ela protege sua terra e família", "Está sempre pronta para lutar", "É corajosa e determinada"], audioName: "warriorAudio"),
        JobsModel(image: Image( .astronauta), story: "Olá, astronauta! Hoje é um dia muito importante para nossa missão espacial. Estamos prestes a explorar um novo planeta.\n\nEstamos nos aproximando de um novo planeta com sinais de vida. Como você vai explorar e estudar este novo mundo?", name: "A Astronauta", description: ["Viaja pelo Universo", "Pilota seu próprio foguete", "Ela usa roupa espacial para andar"], audioName: "astronautAudio"),
        JobsModel(image: Image(.atleta), story: "Olá, atleta! Você é a Capitã do time de vôlei! Hoje é o dia da grande final do campeonato mundial de vôlei.\n\nSeu time está perdendo por poucos pontos. O que você vai dizer aos companheiros para motivá-los a dar o melhor de si?", name: "A Atleta", description: ["Ela é rápida e destemida", "Trabalha em equipe", "Ganha medalhas em campeonatos"], audioName: "athleteAudio"),

    ]
}


struct JobsModel{
    let image: Image
    let story: String
    let name: String
    let description: [String]
    let audioName: String
    #warning("Esse construtor é redundante por conta do memberwise initilization das Structs")
    #warning("Este param image, por que é um optional forced?")
    init(image: Image!, story: String, name: String, description: [String], audioName: String) {
        self.image = image
        self.story = story
        self.name = name
        self.description = description
        self.audioName = audioName
    }
}
