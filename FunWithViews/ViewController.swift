//
//  ViewController.swift
//  FunWithViews
//
//  Created by James Campagno on 6/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//  var rollList = [Int]() practicing array init
//  var rollList : [Int] = []
    var rollCount = 0
    
    @IBOutlet weak var upperLeft: UIView!
    @IBOutlet weak var midLeft: UIView!
    @IBOutlet weak var bottomLeft: UIView!
    @IBOutlet weak var center: UIView!
    @IBOutlet weak var upperRight: UIView!
    @IBOutlet weak var midRight: UIView!
    @IBOutlet weak var bottomRight: UIView!
    
    
    
    @IBOutlet weak var first: UIView!
    @IBOutlet weak var second: UIView!
    @IBOutlet weak var third: UIView!
    @IBOutlet weak var fourth: UIView!
    @IBOutlet weak var fifth: UIView!
    @IBOutlet weak var sixth: UIView!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    @IBOutlet weak var sixthLabel: UILabel!
    
    

    @IBAction func dieTapped(sender: AnyObject) {
        let dieNumber = randomDiceRoll()
        print ("A \(dieNumber) was rolled!")
        if (self.rollCount == 6) { self.hidePreviousRolls() ; self.rollCount = 0 }
        
        switch dieNumber {
        case 1: displayOne()
        case 2: displayTwo()
        case 3: displayThree()
        case 4: displayFour()
        case 5: displayFive()
        case 6: displaySix()
            default:
                print ("An error occurred for die number \(dieNumber)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // Returns back a random Int (1, 2, 3, 4, 5, or 6)
    func randomDiceRoll() -> Int {
        return Int(arc4random_uniform(6) + 1)
    }
    
    
    func displayOne(){
        self.upperLeft.hidden = true
        self.midLeft.hidden = true
        self.bottomLeft.hidden = true
        self.upperRight.hidden = true
        self.midRight.hidden = true
        self.bottomRight.hidden = true
        
        self.center.hidden = false
        displayRollValue(1)
    }
    func displayTwo() {
        self.upperLeft.hidden = true
        self.midLeft.hidden = true
        self.center.hidden = true
        self.midRight.hidden = true
        self.bottomRight.hidden = true
        
        self.bottomLeft.hidden = false
        self.upperRight.hidden = false
        displayRollValue(2)
    }
    func displayThree() {
        self.upperLeft.hidden = true
        self.midLeft.hidden = true
        self.midRight.hidden = true
        self.bottomRight.hidden = true
       
        self.bottomLeft.hidden = false
        self.center.hidden = false
        self.upperRight.hidden = false
        displayRollValue(3)
    }
    func displayFour() {
        self.midLeft.hidden = true
        self.midRight.hidden = true
        self.center.hidden = true
        
        self.upperLeft.hidden = false
        self.bottomLeft.hidden = false
        self.upperRight.hidden = false
        self.bottomRight.hidden = false
        displayRollValue(4)
    }
    func displayFive() {
        self.midLeft.hidden = true
        self.midRight.hidden = true
        
        self.upperLeft.hidden = false
        self.bottomLeft.hidden = false
        self.center.hidden = false
        self.upperRight.hidden = false
        self.bottomRight.hidden = false
        displayRollValue(5)
    }
    func displaySix() {
        self.center.hidden = true
        
        self.upperLeft.hidden = false
        self.midLeft.hidden = false
        self.bottomLeft.hidden = false
        self.upperRight.hidden = false
        self.midRight.hidden = false
        self.bottomRight.hidden = false
        displayRollValue(6)
    }
    func displayRollValue(rollNumber: Int) {
        self.rollCount += 1

        switch self.rollCount {
        case 1: first.hidden = false ; firstLabel.text = String(rollNumber)
        case 2: second.hidden = false ; secondLabel.text = String(rollNumber)
        case 3: third.hidden = false ; thirdLabel.text = String(rollNumber)
        case 4: fourth.hidden = false ; fourthLabel.text = String(rollNumber)
        case 5: fifth.hidden = false ;  fifthLabel.text = String(rollNumber)
        case 6: sixth.hidden = false ; sixthLabel.text  = String(rollNumber)
        default:
            print("Perhaps too many rolls? The count is currently \(self.rollCount)")
        }
    }
    func hidePreviousRolls() {
        first.hidden = true
        second.hidden = true
        third.hidden = true
        fourth.hidden = true
        fifth.hidden = true
        sixth.hidden = true
    }
}
