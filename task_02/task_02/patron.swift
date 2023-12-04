//
//  patron.swift
//  task_02
//
//  Created by DonHalab on 30.11.2023.
//

import Foundation

class Patron {
    enum Types {
        case live
        case blank
    }

    let type: Types
    let id: UUID
    let caliber: Int
    var isInRevolver: Bool = false

    init(type: Types, caliber: Int) {
        self.type = type
        id = UUID()
        self.caliber = caliber
    }

    func shoot() {
        switch type {
        case .live:
            print("Bang! \(caliber)\n")
        case .blank:
            print("Click!")
        }
    }
}

extension Patron: CustomStringConvertible {
    var description: String {
        let typeDescription = type == .live ? "charged" : "blank"
        return "Patron(\(id.uuidString), \(typeDescription), \(caliber))"
    }
}
