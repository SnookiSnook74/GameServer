//
//  main.swift
//  task_01
//
//  Created by DonHalab on 29.11.2023.
//

import Foundation

func menu() {
    print("1. Adding elements")
    let revolverOne = Revolver<Int>(clamp: [1, 2, 3, 4, 5, 9])
    print(revolverOne.toStringDescription())

    print("\n2. Subscript")
    let first = revolverOne.clamp.first?.map(String.init(describing:)) ?? "nil"
    let last = revolverOne.clamp.last?.map(String.init(describing:)) ?? "nil"
    print("\(first), \(last)\n")

    print("3. Scroll")
    revolverOne.scroll()
    print(revolverOne.toStringDescription())

    print("\n4. Deletion")
    _ = revolverOne.shot()
    _ = revolverOne.shot()
    _ = revolverOne.shot()
    _ = revolverOne.shot()
    print(revolverOne.toStringDescription())

    print("\n5. Supply collection")
    let arr: Array = [4, 6, 3, 22, 77, 43, 76, 5]
    print("Before: \nSupply collection: \(arr)\n")
    print(revolverOne.toStringDescription())
    _ = revolverOne.add(newCollect: arr)
    print("\nAfter add operation performed:")
    print(revolverOne.toStringDescription())

    print("\n6. Extraction")
    let extractedList = revolverOne.clamp.map { $0.map { String($0) } ?? "nil" }
    print("The extracted list: [\(extractedList.joined(separator: ","))]")
    print("size: \(revolverOne.getSize())\n")
    _ = revolverOne.uploadAll()
    print(revolverOne.toStringDescription())
    print("size: \(revolverOne.getSize())\n")

    print("7. Supply collection 2")
    let arr2: Array = [77, 43, 76, 5]
    print("Before: \nSupply collection: \(arr2)\n")
    print(revolverOne.toStringDescription())
    _ = revolverOne.add(newCollect: arr2)
    print("\nAfter add operation performed:")
    print(revolverOne.toStringDescription())

    print("\n8. Equals")
    let revolverTwo = Revolver<Int>(clamp: revolverOne.clamp)
    revolverOne.scroll()
    print(revolverOne.toStringDescription() + "\n")
    print(revolverTwo.toStringDescription() + "\n")
    let result = revolverOne == revolverTwo
    if result {
        print("Result: equals")
    } else {
        print("Result: not equals")
    }
}

menu()
