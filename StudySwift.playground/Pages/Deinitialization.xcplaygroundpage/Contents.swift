//: [Previous](@previous)

import Foundation

/// Deinitialization 析构过程

// 析构器只适用于类类型，当一个类的实例被释放之前，析构器会被立即调用。析构器用关键字deinit来标示，类似于构造器要用init来标示。

/// Deinitializers in Action 析构器实践
// 这是一个析构器实践的例子。这个例子描述了一个简单的游戏，这里定义了两种新类型，分别是Bank和Player。Bank类管理一种虚拟硬币，确保流通的硬币数量永远不可能超过 10,000。在游戏中有且只能有一个Bank存在，因此Bank用类来实现，并使用类型属性和类型方法来存储和管理其当前状态。
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

// Player类描述了游戏中的一个玩家。每一个玩家在任意时间都有一定数量的硬币存储在他们的钱包中。这通过玩家的coinsInPurse属性来表示：
class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

// Player类定义了一个win(coins:)方法，该方法从Bank对象获取一定数量的硬币，并把它们添加到玩家的钱包。Player类还实现了一个析构器，这个析构器在Player实例释放前被调用。在这里，析构器的作用只是将玩家的所有硬币都返还给Bank对象：
var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
// 打印 "A new player has joined the game with 100 coins"
print("There are now \(Bank.coinsInBank) coins left in the bank")
// 打印 "There are now 9900 coins left in the bank"

// 因为playerOne是可选的，所以访问其coinsInPurse属性来打印钱包中的硬币数量时，使用感叹号（!）强制解包：
playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
// 输出 "PlayerOne won 2000 coins & now has 2100 coins"
print("The bank now only has \(Bank.coinsInBank) coins left")
// 输出 "The bank now only has 7900 coins left"

// 玩家现在已经离开了游戏。这通过将可选类型的playerOne变量设置为nil来表示，意味着“没有Player实例”。当这一切发生时，playerOne变量对Player实例的引用被破坏了。没有其它属性或者变量引用Player实例，因此该实例会被释放，以便回收内存。在这之前，该实例的析构器被自动调用，玩家的硬币被返还给银行。
playerOne = nil
print("PlayerOne has left the game")
// 打印 "PlayerOne has left the game"
print("The bank now has \(Bank.coinsInBank) coins")
// 打印 "The bank now has 10000 coins"
