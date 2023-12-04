//
//  weaponProtocol.swift
//  task_04
//
//  Created by DonHalab on 01.12.2023.
//

import Foundation

protocol Weapon {
    var nameWeapon: String { get }
    var damage: Int { get }
    func shoot() -> Any?
}
