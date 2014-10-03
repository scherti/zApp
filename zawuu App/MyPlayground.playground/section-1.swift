// Playground - noun: a place where people can play

import UIKit


let str = "Hello, playground"
//let image = UIImage("730-preview.jpg")

// 1
class TipCalculator {
    
    // 2
    let total: Double
    let taxPct: Double
    let subtotal: Double
    
    // 3
    init(total:Double, taxPct:Double) {
        self.total = total
        self.taxPct = taxPct
        subtotal = total / (taxPct + 1)
    }
    
    // 4
    func calcTipWithTipPct(tipPct:Double) -> Double {
        return subtotal * tipPct
    }
    
    // 5
    func printPossibleTips() {
        println("15%: \(calcTipWithTipPct(0.15))")
        println("18%: \(calcTipWithTipPct(0.18))")
        println("20%: \(calcTipWithTipPct(0.20))")
    }
    
}

// 6
let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
tipCalc.printPossibleTips()