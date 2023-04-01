//
//  FibonacciTest.swift
//  Target-Sistemas-Teste
//
//  Created by Bruno Lafayette on 01/04/23.
//

import Foundation

class FibonacciTest{
    
    static let shared = FibonacciTest()
    
    private func isFibonacci(number: Int) -> Bool {
        var a = 0
        var b = 1
        
        while b < number {
            let c = a + b
            a = b
            b = c
        }
        
        return b == number
    }
    
    private func resultTest(_ isFibonacciNumber: Bool,_ number: Int){
        if isFibonacciNumber {
            print("Número \(number) pertence à sequência de Fibonacci.")
        } else {
            print("Número \(number) não pertence à sequência de Fibonacci.")
        }
    }
    
    func executeTestFibonacci(){
        print("\n\n*** TESTE 2 ***")
        print("TESTE FIBONACCI\n")
        print("Digite um numero para ser verificado se pertence ou não a Sequência de Fibonacci:")
        let number = Int(readLine()!)!
        resultTest(isFibonacci(number: number), number)
    }

}


