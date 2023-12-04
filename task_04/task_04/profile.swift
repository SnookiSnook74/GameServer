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
    let weapon: Weapon
    let creationDate: String
    var status: Status
    lazy var profileLink: String = "http://gameserver.com/\(id.uuidString)-\(nickname)"

    enum Status {
        case IN_PLAY, SEARCH, IDLE, OFFLINE
    }

    init(nickname: String, age: Int, name: String, weapon: Weapon) {
        id = UUID()
        self.nickname = nickname
        self.age = age
        self.name = name
        self.weapon = weapon
        creationDate = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
        status = .IDLE
    }

    func profileInfo() {
        print("Profile(\"\(nickname)\", \(status))")
    }
}
