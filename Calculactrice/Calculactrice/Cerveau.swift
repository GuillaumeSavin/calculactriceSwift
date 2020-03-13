//
//  Cerveau.swift
//  Calculactrice
//
//  Created by SAVIN Guillaume on 13/03/2020.
//  Copyright © 2020 SAVIN Guillaume. All rights reserved.
//

import Foundation

class Cerveau
{
    var pileDOp = Array<Op>()
    var operationConnues = Dictionary<String, Op>()
    
    init()
    {
        operationConnues["+"] = Op.OperationBinaire("+") {$1 + $0}
        operationConnues["-"] = Op.OperationBinaire("-") {$1 - $0}
        operationConnues["(-)"] = Op.OperationUnaire("(-)") {-$0}
    }
    
    enum Op
    {
        case Operande(Double)
        case OperationUnaire(String, (Double) -> Double)
        case OperationBinaire(String, (Double, Double) -> Double)
    }
    
    func push(nombre: Double)
    {
        pileDOp.append(Op.Operande(nombre))
    }
    
    func push(operation: String)
    {
        if let op = operationConnues[operation]
        {
            pileDOp.append(op)
        }
        
    }
    
    
}
