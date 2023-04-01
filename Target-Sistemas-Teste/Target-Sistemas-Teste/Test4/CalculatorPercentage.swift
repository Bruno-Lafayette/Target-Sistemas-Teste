//
//  CalculatorPercentage.swift
//  Target-Sistemas-Teste
//
//  Created by Bruno Lafayette on 01/04/23.
//

import Foundation

class CalculatorPercentage{
    
    static let shared = CalculatorPercentage()
    
    private let sp = 67836.43
    private let rj = 36678.66
    private let mg = 29229.88
    private let es = 27165.48
    private let others = 19849.53
    
    private let invoicing: [String: Double] = ["SP": 67836.43,
                                       "RJ": 36678.66,
                                       "MG": 29229.88,
                                       "ES": 27165.48,
                                       "Outros": 19849.53]
    
    private lazy var calculateTotal = invoicing.reduce(0.0) { (accumulator, invoice) in
        return accumulator + invoice.value
    }

    private func calculatePercentage(_ invoicing: [String:Double]) -> [String:Double]{
        let total = calculateTotal
        let percentage = 100
        var percentageByState: [String:Double] = [:]
        for invoice in invoicing {
            percentageByState[invoice.key] = invoice.value/(total) * Double(percentage)
        }
        return percentageByState
    }
    
    func executeTestCalculatorPercentage(){
        let invoicing = calculatePercentage(invoicing).sorted(by: {$0.value > $1.value})
        print("\n\n*** TESTE 4 ***")
        print("CÁLCULO DE PORCENTAGEM\n")
        print("Percentual de representação de cada estado:\n")
        for invoice in invoicing {
            print("\(invoice.key): \(String(format: "%.2f", invoice.value))%")
        }
        
    }
}
