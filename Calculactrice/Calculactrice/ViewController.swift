//
//  ViewController.swift
//  Calculactrice
//
//  Created by SAVIN Guillaume on 26/02/2020.
//  Copyright © 2020 SAVIN Guillaume. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var onEstAuMilieuDeLaSaisie = false
    var pileDeNombres = [Double]()

    @IBOutlet weak var ecran: UILabel!
    @IBAction func addNumber(_ sender: UIButton)
    {
        let chiffre = sender.currentTitle
        print("le chiffre est \(chiffre!)")
        if(onEstAuMilieuDeLaSaisie)
        {
            ecran.text! += chiffre!
            
        }
        else
        {
            ecran.text! = chiffre!
            onEstAuMilieuDeLaSaisie = true
        }
        
    }
    @IBAction func enter(_ sender: Any)
    {
        pileDeNombres.append(valeurAffichée)
        print("La pile est \(pileDeNombres)")
        onEstAuMilieuDeLaSaisie = false
    }
    
    @IBAction func applyOperation(_ sender: UIButton)
    {
        switch sender.currentTitle!
        {
            case "+":
                calculeOperationBinaire(operation: +)
            case "-":
                calculeOperationBinaire() {$1 - $0}
            case "*":
                calculeOperationBinaire(operation: *)
            case "/":
                calculeOperationBinaire() {$1 / $0}
            case "√":
                calculeOperationUnaire() {sqrt($0)}
            case "²":
                calculeOperationUnaire() {$0 * $0}
            case "³":
                calculeOperationUnaire() {$0 * $0 * $0}
            case "(-)":
                calculeOperationUnaire() {-$0}
            default:
                break
            
        }
        
    }
    
    func calculeOperationUnaire(operation: (Double) -> Double)
    {
        if pileDeNombres.count >= 1
        {
            valeurAffichée = operation(pileDeNombres.removeLast())
            enter(self)
        }
    }
    func calculeOperationBinaire(operation: (Double, Double) -> Double)
    {
        if pileDeNombres.count >= 2
        {
            valeurAffichée = operation(pileDeNombres.removeLast(), pileDeNombres.removeLast())
            enter(self)
            
        }
    }
    var valeurAffichée : Double
    {
        get
        {
            return NumberFormatter().number(from: ecran.text!)!.doubleValue
        }
        set
        {
            ecran.text = "\(newValue)"
            onEstAuMilieuDeLaSaisie = false
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

