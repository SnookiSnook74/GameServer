//
//  main.swift
//  task_03
//
//  Created by DonHalab on 30.11.2023.
//

import Foundation

let playerOne = Profile(nickname: "DonHalab", age: 17, name: "Anatoly", revolver: Revolver(caliber: 32))
let playerTwo = Profile(nickname: "Driade", age: 17, name: "Alex", revolver: Revolver(caliber: 32))
let playerThree = Profile(nickname: "SnookiSnook", age: 17, name: "Tolya", revolver: Revolver(caliber: 32))
let playerFour = Profile(nickname: "Nagibator777", age: 12, name: "Artur", revolver: Revolver(caliber: 100))

playerTwo.status = .OFFLINE
playerThree.status = .IN_PLAY
playerFour.status = .SEARCH

print("SearcherProfile:")
playerOne.profileInfo()

print("\nServerProfiles:")

let gameServer = Server(serverAddress: "www.testServer.ru")
gameServer.addPlayer(player: [playerOne, playerTwo, playerThree, playerFour])
gameServer.printInfo()

print("\nStart Search")
print("SearcherProfile:")
playerOne.status = .SEARCH
playerOne.profileInfo()
gameServer.printInfo()

print("\nResult Search")
playerOne.status = .SEARCH
print("SearcherProfile:")
playerOne.profileInfo()
let resultInfo = gameServer.findOpponent(for: playerOne)
resultInfo?.status = .SEARCH
print("Opponent:")
resultInfo?.profileInfo()
playerOne.findOpponent()

print("ServerProfiles:")
gameServer.printInfo()
