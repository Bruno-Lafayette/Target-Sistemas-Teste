//
//  Invoicing.swift
//  Target-Sistemas-Teste
//
//  Created by Bruno Lafayette on 01/04/23.
//

import Foundation


class Invoicing {
    
    static let shared = Invoicing()
 
    private let jsonString = Resource.shared.jsonString
    
    private lazy var jsonData = jsonString.data(using: .utf8)!
    private lazy var dailyBilling = try! JSONDecoder().decode([Invoice].self, from: jsonData)
    
    private func calculateValues() -> (Double, Double, Int){
        var lowerValue = dailyBilling.max { $0.valor < $1.valor }?.valor ?? 0
        for invoicing in dailyBilling{
            if invoicing.valor > 0{
                if lowerValue > invoicing.valor{
                    lowerValue = invoicing.valor
                }
            }
        }
        let highestValue = dailyBilling.max { $0.valor < $1.valor }?.valor ?? 0
        let sumBilling = dailyBilling.reduce(0) { $0 + $1.valor }
        let monthlyAverage = sumBilling / Double(dailyBilling.count)
        let aboveAverageDays = dailyBilling.filter { $0.valor > monthlyAverage }.count
        return (lowerValue, highestValue, aboveAverageDays)
    }
    
    func executeInvoicing(){
        let (lowerValue, highestValue, aboveAverageDays) = calculateValues()
        print("\n\n*** TESTE 3 ***")
        print("CÁLCULO DE FATURAMENTO\n")
        print("Menor faturamento: \(lowerValue)")
        print("Maior faturamento: \(highestValue)")
        print("Número de dias com faturamento acima da média: \(aboveAverageDays)")
    }
    
    
    
    
}
