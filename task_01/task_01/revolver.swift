//
//  revolver.swift
//  task_01
//
//  Created by DonHalab on 30.11.2023.
//

import Foundation

class Revolver<T> {
    private var _clamp: [T?] = Array(repeating: nil, count: 6)

    var pointer: T? {
        return clamp.first ?? nil
    }

    var clamp: [T?] {
        get {
            return _clamp
        }
        set(newClamp) {
            if newClamp.count <= 6 {
                _clamp = newClamp + Array(repeating: nil, count: 6 - newClamp.count)
            }
        }
    }

    init(clamp: [T?]) {
        self.clamp = clamp
    }

    init() {
        clamp = Array(repeating: nil, count: 6)
    }

    func printClampContents() {
        for item in clamp {
            print(item ?? "nil")
        }
    }

    func add(newElem: T) -> Bool {
        for index in 0 ..< clamp.count {
            if clamp[index] == nil {
                clamp[index] = newElem
                return true
            }
        }
        return false
    }

    func add(newCollect: [T]) -> Bool {
        let emptySlots = clamp.filter { $0 == nil }.count
        let elementsToAdd = Array(newCollect.prefix(emptySlots))

        if !elementsToAdd.isEmpty {
            // Удаляем пустые слоты из начала обоймы
            _clamp = _clamp.filter { $0 != nil }
            // Добавляем новые элементы в начало обоймы
            _clamp = elementsToAdd.reversed() + _clamp

            if _clamp.count < 6 {
                _clamp += Array(repeating: nil, count: 6 - _clamp.count)
            }
            return true
        } else {
            // Если нет свободных слотов для добавления, возвращаем false
            return false
        }
    }

    func shot() -> T? {
        if let firstBullet = clamp.first, firstBullet != nil {
            // Удаляем первый элемент (выстрел)
            let shot = clamp.removeFirst()
            // Добавляем nil в конец обоймы
            clamp.append(nil)
            return shot
        } else {
            return nil
        }
    }

    func upload(index: Int) -> T? {
        if index < 6 {
            let tmp = clamp[index]
            clamp[index] = nil
            return tmp
        }
        return nil
    }

    func uploadAll() -> [T?] {
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
}

extension Revolver {
    func toStringDescription() -> String {
        let infoClass = "Structure: Revolver<\(T.self)>\n"
        let object = "Objects: [" + clamp.map { $0.map(String.init(describing:)) ?? "nil" }.joined(separator: ",") + "]\n"
        let point = "Pointer: \(pointer.map(String.init(describing:)) ?? "nil")"
        return infoClass + object + point
    }
}

extension Revolver: Equatable where T: Comparable {
    static func == (lhs: Revolver<T>, rhs: Revolver<T>) -> Bool {
        let lhsSorted = lhs.clamp.compactMap { $0 }.sorted()
        let rhsSorted = rhs.clamp.compactMap { $0 }.sorted()

        return lhsSorted == rhsSorted
    }
}
