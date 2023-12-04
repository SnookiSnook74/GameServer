//
//  revolver.swift
//  task_02
//
//  Created by DonHalab on 30.11.2023.
//

import Foundation

class Revolver: Weapon {
    var nameWeapon: String = "Revolver"

    var damage: Int = 20

    private var _clamp: [Patron?] = Array(repeating: nil, count: 6)
    let caliber: Int

    var pointer: Patron? {
        return clamp.first ?? nil
    }

    var clamp: [Patron?] {
        get {
            return _clamp
        }
        set(newClamp) {
            if newClamp.count <= 6 {
                _clamp = newClamp + Array(repeating: nil, count: 6 - newClamp.count)
            }
        }
    }

    init(caliber: Int) {
        self.caliber = caliber
    }

    @discardableResult
    func add(newElem: Patron) -> Bool {
        guard newElem.caliber == caliber, !newElem.isInRevolver else {
            return false
        }

        for index in 0 ..< clamp.count {
            if clamp[index] == nil {
                clamp[index] = newElem
                newElem.isInRevolver = true
                return true
            }
        }
        return false
    }

    @discardableResult
    func add(newCollect: [Patron]) -> Bool {
        var added = false
        for patron in newCollect {
            if patron.caliber == caliber, !patron.isInRevolver {
                if add(newElem: patron) {
                    added = true
                }
            }
        }
        return added
    }

    @discardableResult
    func shoot() -> Any? {
        if let firstBullet = clamp.first, let bullet = firstBullet {
            // Удаляем первый элемент (выстрел)
            _ = clamp.removeFirst()
            clamp.append(nil)

            bullet.isInRevolver = false
            if bullet.type == .live {
                bullet.shoot()
            } else {
                return print("Click")
            }
        } else {
            return print("Click")
        }
        return nil
    }

    func upload(index: Int) -> Patron? {
        if index < 6 {
            let tmp = clamp[index]
            clamp[index] = nil
            return tmp
        }
        return nil
    }

    func uploadAll() -> [Patron?] {
        let tmp = clamp.filter { $0 != nil }
        for index in 0 ..< clamp.count {
            _ = upload(index: index)
        }
        return tmp
    }

    func scroll() {
        let randomIndex = Int.random(in: 0 ..< clamp.count)
        if randomIndex != 0 {
            // "Вращаем" элементы так, чтобы элемент с randomIndex оказался первым
            let rotated = Array(_clamp[randomIndex...] + _clamp[..<randomIndex])
            _clamp = rotated
        }
    }

    func getSize() -> Int {
        let tmp = clamp.filter { $0 != nil }
        return tmp.count
    }

    func revolverInfo() {
        print("Revolver(\"\(nameWeapon)\", \(damage))")
    }
}

extension Revolver {
    func toStringDescription() -> String {
        let infoClass = "Structure: Revolver \(caliber) caliber\n"
        let object = "Objects: [" + clamp.map {
            if let patron = $0 {
                return "id: \(patron.id), type: \(patron.type), caliber: \(patron.caliber)"
            } else {
                return "nil"
            }
        }.joined(separator: ", ") + "]\n"
        let point = "Pointer: \(pointer.map { "id: \($0.id), type: \($0.type), caliber: \($0.caliber)\n" } ?? "nil")"

        return infoClass + object + point
    }
}

extension Revolver {
    func toStringDescriptionBonus() -> String {
        let object = "Objects: [" + clamp.map {
            if let patron = $0 {
                return "id: \(patron.id), type: \(patron.type), caliber: \(patron.caliber)"
            } else {
                return "nil"
            }
        }.joined(separator: ", ") + "]"

        return object
    }
}
