//
//  protocolAction.swift
//  task_03
//
//  Created by DonHalab on 01.12.2023.
//

import Foundation

protocol PlayerAction {
    func findOpponent(for player: Profile) -> Profile?
    func fight(player1: Profile, player2: Profile) -> Bool
}
