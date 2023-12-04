//
//  main.swift
//  task_02
//
//  Created by DonHalab on 30.11.2023.
//

import Foundation

func menu() {
    print("1. Shoot or damp")
    let patronOne = Patron(type: .live, caliber: 32)
    let patronTwo = Patron(type: .blank, caliber: 32)
    let revolverOne = Revolver(caliber: 32)
    _ = revolverOne.add(newCollect: [patronOne, patronTwo])
    print(revolverOne.toStringDescription())

    print("Shoot # call shoot()")
    revolverOne.shoot()
    print(revolverOne.toStringDescription())
    print("Shoot")
    revolverOne.shoot()
    print(revolverOne.toStringDescription())

    print("\n2. Unique Patron")

    let patronThree = Patron(type: .live, caliber: 32)

    print("Patron (\(patronThree.id),\(patronThree.type),\(patronThree.caliber))\n")

    let revolverTwo = Revolver(caliber: 32)
    let revolverThree = Revolver(caliber: 32)
    print("Revolver1: \(revolverTwo.clamp)")
    print("Revolver2: \(revolverThree.clamp)\n")

    print("Add1 # call add()")
    _ = revolverTwo.add(newElem: patronThree)

    print("Revolver1: \(revolverTwo.toStringDescriptionBonus())")
    print("Revolver2: \(revolverThree.toStringDescriptionBonus())")

    print("\nAdd2")
    _ = revolverThree.add(newElem: patronThree)
    print("Revolver1: \(revolverTwo.toStringDescriptionBonus())")
    print("Revolver2: \(revolverThree.toStringDescriptionBonus())\n")

    print("3. Unique Patron in collection")

    let revolverFour = Revolver(caliber: 32)
    let revolverFive = Revolver(caliber: 32)
    let one = Patron(type: .live, caliber: 32)
    let two = Patron(type: .live, caliber: 32)
    let three = Patron(type: .live, caliber: 32)
    let four = Patron(type: .live, caliber: 32)
    let five = Patron(type: .live, caliber: 32)
    let collectPatronOne = [one, two, three]
    let collectPatronTwo = [one, four, five]

    print("Revolver1: \(revolverFour.toStringDescriptionBonus())")
    print("Revolver2: \(revolverFive.toStringDescriptionBonus())\n")

    print("Patrons: [\(collectPatronOne.map { $0.description }.joined(separator: ", "))]")
    print("Patrons: [\(collectPatronTwo.map { $0.description }.joined(separator: ", "))]\n")

    print("Add1 # call add for 1 st collection\n")
    _ = revolverFour.add(newCollect: collectPatronOne)
    _ = revolverFive.add(newCollect: collectPatronTwo)
    print("Revolver1: \(revolverFour.toStringDescriptionBonus())")
    print("Revolver2: \(revolverFive.toStringDescriptionBonus())\n")
}

menu()
