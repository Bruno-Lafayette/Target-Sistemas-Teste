//
//  InvertedCharacter.swift
//  Target-Sistemas-Teste
//
//  Created by Bruno Lafayette on 01/04/23.
//

import Foundation

struct InvertedCharacter{
    
    static let shared = InvertedCharacter()

    private func invertString(string: String) -> String{
        var invertedSting = ""
        let originalString = string
        for i in stride(from: string.count - 1, through: 0, by: -1) {
            let index = originalString.index(originalString.startIndex, offsetBy: i)
            invertedSting.append(originalString[index])
        }
        return invertedSting
    }
    
    func executeInverterCharacter(){
        print("\n\n*** TESTE 5 ***")
        print("INVERTENDO AS ORDENS\n")
        print("Digite a String que será invertida:")
        let originalString = readLine() ?? "lamento, mas voce nao digitou nada"
        let invertedString = invertString(string: originalString)
        print("\nString original: \(originalString)")
        print("String invertida: \(invertedString)\n\n\n")
    }
 
}
