//
//  main.swift
//  task_05
//
//  Created by DonHalab on 02.12.2023.
//

import Foundation

var playerOne = Profile(nickname: "SnookiSnook", age: 30, name: "Anatoly", weapon: Riffle(caliber: 21))
var playerTwo = Profile(nickname: "Driade", age: 24, name: "Alex", weapon: Riffle(caliber: 30))
var server = Server(serverAddress: "www.s21_fight.ru")

server.fight(player1: playerOne, player2: playerTwo)
