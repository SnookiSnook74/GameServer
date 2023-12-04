//
//  riffle.swift
//  task_04
//
//  Created by DonHalab on 02.12.2023.
//

import Foundation

class Riffle: Weapon {
    var nameWeapon: String = "AWP"

    var damage: Int = 30

    let caliber: Int
    var patron: Patron?

    init(caliber: Int) {
        self.caliber = caliber
        patron = nil
    }

    @discardableResult
    func shoot() -> Any? {
        if let currentPatron = patron, currentPatron.type == .live {
            currentPatron.isInRevolver = false
            print("Bang! \(damage)")
            patron = nil
        } else {
            return "Click"
        }
        return nil
    }

    @discardableResult
    func add(newElem: Patron) -> Bool {
        guard newElem.caliber == caliber, !newElem.isInRevolver else { return false }
        patron = newElem
        newElem.isInRevolver = true
        return true
    }

    func riffleInfo() {
        print("Riffle(\"\(nameWeapon)\", \(damage))")
    }
}
