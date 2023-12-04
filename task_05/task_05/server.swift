//
//  server.swift
//  task_03
//
//  Created by DonHalab on 01.12.2023.
//

import Foundation

class Server: PlayerAction {
    let serverAddress: String
    var players: [Profile]

    init(serverAddress: String) {
        self.serverAddress = serverAddress
        players = []
    }

    func findOpponent(for player: Profile) -> Profile? {
        for potentialOpponent in players where potentialOpponent.status == .SEARCH && potentialOpponent.nickname != player.nickname {
            potentialOpponent.status = .IN_PLAY
            player.status = .IN_PLAY
            return potentialOpponent
        }
        return nil
    }

    func addPlayer(player: Profile) {
        players.append(player)
        player.playerActionDelegate = self
    }

    func addPlayer(player: [Profile]) {
        for addPlayes in player {
            players.append(addPlayes)
            addPlayes.playerActionDelegate = self
        }
    }

    func printInfo() {
        let playerStrings = players.map { "Profile(\"\($0.nickname)\", \($0.status))" }
        let str = "[\(playerStrings.joined(separator: ", "))]"
        print(str)
    }

    @discardableResult
    func fight(player1: Profile, player2: Profile) -> Bool {
        print("MyProfile nickname - \"\(player1.nickname)\", weapon - \(player1.weapon.nameWeapon), damage - \(player1.weapon.damage)")
        print("Opponent nickname - \"\(player2.nickname)\", weapon - \(player2.weapon.nameWeapon), damage - \(player2.weapon.damage)\n")

        var hpPlayer1 = 100
        var hpPlayer2 = 100

        let weaponPlayer1 = player1.weapon
        let weaponPlayer2 = player2.weapon

        var patronsOne: [Patron] = generatePatrons(player: player1) ?? []
        var patronsTwo: [Patron] = generatePatrons(player: player2) ?? []

        print("Fight!\n")
        print("\(player1.nickname) \(hpPlayer1) - \(hpPlayer2) \(player2.nickname)\n")
        while hpPlayer1 > 0, hpPlayer2 > 0 {
            let isPlayer1Attacking = Bool.random()
            if isPlayer1Attacking {
                print("\(player1.nickname) shot")
                handleAttack(from: weaponPlayer1, to: &hpPlayer2, patronsForWeapon: &patronsOne)
                print("\(player1.nickname) \(hpPlayer1) - \(hpPlayer2) \(player2.nickname)\n")
            } else {
                // Атакует игрок 2
                print("\(player2.nickname) shot")
                handleAttack(from: weaponPlayer2, to: &hpPlayer1, patronsForWeapon: &patronsTwo)
                print("\(player1.nickname) \(hpPlayer1) - \(hpPlayer2) \(player2.nickname)\n")
            }

            let bothHaveFirearms = !(weaponPlayer1 is Knife || weaponPlayer2 is Knife)
            let outOfAmmo = patronsOne.isEmpty && patronsTwo.isEmpty
            if hpPlayer1 <= 0 || hpPlayer2 <= 0 || (bothHaveFirearms && outOfAmmo) {
                break
            }
        }
        if hpPlayer1 <= 0 {
            // Если здоровье первого игрока <= 0, то победил второй игрок
            print("\(player2.nickname) is the winner!")
            return false
        } else if hpPlayer2 <= 0 {
            // Если здоровье второго игрока <= 0, то победил первый игрок
            print("\(player1.nickname) is the winner!")
            return true
        } else {
            // Если у обоих игроков здоровье > 0, то ничья
            print("It is Tie!")
            return false
        }
    }

    private func handleAttack(from weapon: Weapon, to health: inout Int, patronsForWeapon: inout [Patron]) {
        if weapon is Riffle {
            if let riffle = weapon as? Riffle {
                if !patronsForWeapon.isEmpty {
                    riffle.add(newElem: patronsForWeapon.removeFirst())
                }
                print(riffle.shoot() ?? "")
                if riffle.patron?.type != .blank {
                    health -= weapon.damage
                }
            }
        } else if weapon is Revolver {
            if let revolver = weapon as? Revolver {
                // Если обойма пуста, перезаряжаем револьвер
                if revolver.getSize() == 0, !patronsForWeapon.isEmpty {
                    print("\(revolver.nameWeapon) is reloading...")

                    revolver.add(newCollect: Array(patronsForWeapon.prefix(6)))
                    patronsForWeapon.removeFirst(min(6, patronsForWeapon.count))
                }
                // Выстрел из револьвера
                if revolver.shoot() as? String == "Bang" {
                    health -= revolver.damage
                }
            }
        } else if weapon is Knife {
            health -= weapon.damage
            print("\(weapon.shoot() ?? "") \(weapon.damage)")
        }
    }

    private func generatePatrons(player: Profile) -> [Patron]? {
        if player.weapon is Riffle {
            let info = player.weapon as! Riffle
            return (1 ... 4).map { _ in Patron(type: Bool.random() ? .live : .blank, caliber: info.caliber) }
        } else if player.weapon is Revolver {
            let info = player.weapon as! Revolver
            return (1 ... 12).map { _ in Patron(type: Bool.random() ? .live : .blank, caliber: info.caliber) }
        }
        return nil
    }
}
