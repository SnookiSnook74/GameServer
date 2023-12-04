//
//  main.swift
//  task_04
//
//  Created by DonHalab on 01.12.2023.
//

import Foundation

func menu() {
    let knife = Knife()
    let revolver = Revolver(caliber: 20)
    let riffle = Riffle(caliber: 50)
    let one = Patron(type: .live, caliber: 20)
    let two = Patron(type: .blank, caliber: 20)
    let three = Patron(type: .blank, caliber: 20)
    let four = Patron(type: .live, caliber: 10)
    let fiveAWP = Patron(type: .blank, caliber: 50)

    knife.knifeInfo()
    revolver.revolverInfo()
    riffle.riffleInfo()

    print("\nKnife shot")
    print("\(knife.shoot() ?? "") \(knife.damage)\n")

    print("Revolver Calibre \(revolver.caliber)")
    revolver.add(newCollect: [one, two, three, four])
    print("Result adding:")
    print(revolver.toStringDescriptionBonus())
    print("\nScrolling:")
    revolver.scroll()
    print(revolver.toStringDescriptionBonus())
    print("Shoot:")
    revolver.shoot()
    print("\nRiffle Calibre \(riffle.caliber)")
    riffle.add(newElem: fiveAWP)
    print("Add element: \(String(describing: riffle.patron))")
    print("Shoot:")
    print(riffle.shoot() ?? "")
}

menu()
