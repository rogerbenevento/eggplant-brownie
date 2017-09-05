//: Playground - noun: a place where people can play

import UIKit

class Meal {
    var happines:Int
    var name:String
    var items = Array<Item>()
    
    init(name:String, happines:Int) {
        self.name = name
        self.happines = happines
    }
    
    func allCalories() -> Double {
        var total = 0.0
        for i in items {
            total += i.calories
        }
        return total
    }
}

class Item {
    var name:String
    var calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
}

let brownie = Meal(name: "eggplant brownie", happines: 5)

let item1 = Item(name: "brownie", calories: 115)
let item2 = Item(name: "vegan cream", calories: 40)

brownie.items.append(item1)
brownie.items.append(item2)
print(brownie.allCalories())

