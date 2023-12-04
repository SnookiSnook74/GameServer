//
//  profile.swift
//  task_03
//
//  Created by DonHalab on 01.12.2023.
//

import Foundation

class Profile {
    let id: UUID
    let nickname: String
    let age: Int
    let name: String
    let revolver: Revolver
    let creationDate: String
    var status: Status
    lazy var profileLink: String = "http://gameserver.com/\(id.uuidString)-\(nickname)"
    var playerActionDelegate: PlayerAction?

    enum Status {
        case IN_PLAY, SEARCH, IDLE, OFFLINE
    }

    init(nickname: String, age: Int, name: String, revolver: Revolver) {
        id = UUID()
        self.nickname = nickname
        self.age = age
        self.name = name
        self.revolver = revolver
        creationDate = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
        status = .IDLE
    }

    func findOpponent() {
        status = .SEARCH
        guard let opponent = playerActionDelegate?.findOpponent(for: self) else {
            print("No opponent found")
            status = .IDLE
            return
        }
        // print("Opponent found: \(opponent.nickname)")
    }

    func profileInfo() {
        print("Profile(\"\(nickname)\", \(status))")
    }
}
