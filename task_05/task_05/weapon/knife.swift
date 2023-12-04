//
//  knife.swift
//  task_04
//
//  Created by DonHalab on 02.12.2023.
//

import Foundation

class Knife: Weapon {
    var nameWeapon: String = "Krife butterfly"

    var damage: Int = 10

    func shoot() -> Any? {
        return "Crrr!"
    }

    func knifeInfo() {
        print("Knife(\"\(nameWeapon)\", \(damage))")
    }
}
