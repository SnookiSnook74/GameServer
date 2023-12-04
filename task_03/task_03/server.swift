//
//  server.swift
//  task_03
//
//  Created by DonHalab on 01.12.2023.
//

import Foundation

class Server: PlayerAction {
    let serverAddress: String
    var players: [Profile]

    init(serverAddress: String) {
        self.serverAddress = serverAddress
        players = []
    }

    func findOpponent(for player: Profile) -> Profile? {
        for potentialOpponent in players where potentialOpponent.status == .SEARCH && potentialOpponent.nickname != player.nickname {
            potentialOpponent.status = .IN_PLAY
            player.status = .IN_PLAY
            return potentialOpponent
        }
        return nil
    }

    func addPlayer(player: Profile) {
        players.append(player)
        player.playerActionDelegate = self
    }

    func addPlayer(player: [Profile]) {
        for addPlayes in player {
            players.append(addPlayes)
            addPlayes.playerActionDelegate = self
        }
    }

    func printInfo() {
        var str = "["
        for player in players {
            let tmp = "Profile(\"\(player.nickname)\", \(player.status)), "
            str += tmp
        }
        str.removeLast(2)
        str += "]"
        print(str)
    }
}
