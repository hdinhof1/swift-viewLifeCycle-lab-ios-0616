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
    var rollList : [Int] = []
    
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
    
    
//    #pragma TODO: add a clear rollList if number of rolls == 6
    @IBAction func dieTapped(sender: AnyObject) {
        let dieNumber = randomDiceRoll()
        print ("A \(dieNumber) was rolled!")
        if (self.rollList.count == 6) { self.rollList.removeAll() ; self.hidePreviousRolls() }
        
        switch dieNumber {
        case 1: displayOne(); displayRollValue(1)
        case 2: displayTwo() ; displayRollValue(2)
        case 3: displayThree() ; displayRollValue(3)
        case 4: displayFour() ; displayRollValue(4)
        case 5: displayFive() ; displayRollValue(5)
        case 6: displaySix(); displayRollValue(6)
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
    }
    func displayTwo() {
        self.upperLeft.hidden = true
        self.midLeft.hidden = true
        self.center.hidden = true
        self.midRight.hidden = true
        self.bottomRight.hidden = true
        
        self.bottomLeft.hidden = false
        self.upperRight.hidden = false
    }
    func displayThree() {
        self.upperLeft.hidden = true
        self.midLeft.hidden = true
        self.midRight.hidden = true
        self.bottomRight.hidden = true
       
        self.bottomLeft.hidden = false
        self.center.hidden = false
        self.upperRight.hidden = false
    }
    func displayFour() {
        self.midLeft.hidden = true
        self.midRight.hidden = true
        self.center.hidden = true
        
        self.upperLeft.hidden = false
        self.bottomLeft.hidden = false
        self.upperRight.hidden = false
        self.bottomRight.hidden = false
    }
    func displayFive() {
        self.midLeft.hidden = true
        self.midRight.hidden = true
        
        self.upperLeft.hidden = false
        self.bottomLeft.hidden = false
        self.center.hidden = false
        self.upperRight.hidden = false
        self.bottomRight.hidden = false
    }
    func displaySix() {
        self.center.hidden = true
        
        self.upperLeft.hidden = false
        self.midLeft.hidden = false
        self.bottomLeft.hidden = false
        self.upperRight.hidden = false
        self.midRight.hidden = false
        self.bottomRight.hidden = false
    }
    func displayRollValue(rollNumber: Int) {
        self.rollList.append(rollNumber)
        let ithRollNumber = self.rollList.count

        switch ithRollNumber {
        case 1: first.hidden = false ; firstLabel.text = String(rollNumber)
        case 2: second.hidden = false ; secondLabel.text = String(rollNumber)
        case 3: third.hidden = false ; thirdLabel.text = String(rollNumber)
        case 4: fourth.hidden = false ; fourthLabel.text = String(rollNumber)
        case 5: fifth.hidden = false ;  fifthLabel.text = String(rollNumber)
        case 6: sixth.hidden = false ; sixthLabel.text  = String(rollNumber)
        default:
            print("Perhaps too many rolls? The count is currently \(ithRollNumber)")
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
