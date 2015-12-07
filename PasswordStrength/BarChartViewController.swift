//
//  BarChartViewController.swift
//  PasswordStrength
//
//  Created by Dylan Iruretagoyena on 2015-11-29.
//  Copyright © 2015 Micheal Griffin. All rights reserved.
//

import Foundation
import UIKit
//
//  BarChartViewController.swift
//  iOSChartsDemo
//
//  Created by Joyce Echessa on 6/12/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController {
    
    @IBOutlet weak var barChartView: BarChartView!
    
    var months: [String]!
    var passwordToDisplay: String = "default"
    var oneGram = "default"
    var twoGram = "default"
    var threeGram = "default"
    var fourGram = "default"
    var substringfor1 = "default"
    var substringfor2 = "default"
    var subStringForOneG = "default"
    var subStringForTwoG = "default"
    var subStringForThreeG = "default"
    var subStringForFourG = "default"
    var totalProb = 1.0
    var numAtempt = 0.0
    //time per attempt
    var time = 0.0
    var myPassWordStrength = 0.0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("\(passwordToDisplay)")
       
        //Mark: SetUp
        //Program setup and run here then put password strength below
        if passwordToDisplay.characters.count > 0 {
        let index1 = passwordToDisplay.startIndex.advancedBy(1)
        oneGram = passwordToDisplay.substringToIndex(index1)
        print("\(oneGram)")
            
            totalProb = totalProb*OneGram(oneGram)
            
        print("\(totalProb)")
        }
        
        if passwordToDisplay.characters.count > 1 {
        let index2 = passwordToDisplay.startIndex.advancedBy(2)
        twoGram = passwordToDisplay.substringToIndex(index2)
        print("\(twoGram)")
            totalProb = totalProb*TwoGram(twoGram)
        print("\(totalProb)")
        }
        
        if passwordToDisplay.characters.count > 2 {
        let index3 = passwordToDisplay.startIndex.advancedBy(3)
        threeGram = passwordToDisplay.substringToIndex(index3)
        print("\(threeGram)")
            totalProb = totalProb*ThreeGram(threeGram)
        print("\(totalProb)")
        }
        
        if passwordToDisplay.characters.count > 3 {
        let index4 = passwordToDisplay.startIndex.advancedBy(4)
        fourGram = passwordToDisplay.substringToIndex(index4)
        print("\(fourGram)")
            totalProb = totalProb*FourGram(fourGram)
        print("\(totalProb)")

        }
        //oneGram = passwordToDisplay.startIndex.advancedBy(1)
        //twoGram = passwordToDisplay.startIndex.advancedBy(2)
        //threeGram = passwordToDisplay.startIndex.advancedBy(3)
        //fourGram = passwordToDisplay.startIndex.advancedBy(4)
        
        for var i=1; i+4 <= passwordToDisplay.characters.count; ++i{
            print("\(i)")
            
            var indexfor1 = passwordToDisplay.startIndex.advancedBy(i)
            substringfor1 = passwordToDisplay.substringFromIndex(indexfor1)
            
            var indexfor2 = substringfor1.startIndex.advancedBy(4)
            substringfor2 = substringfor1.substringToIndex(indexfor2)
            
            totalProb = totalProb*FourGram(substringfor2)
            print("\(totalProb)")
            
            print("\(substringfor2)")
            
            
        }
        
        numAtempt = attempts(totalProb)
        
        
        
        //time = 0.000001
        
        
        myPassWordStrength = numAtempt
        
        
        
        //Mark: Add Values to Chart
        months = ["Strong", "Weak", "Recomended", "Yours"]
        let unitsSold = [500.0, 100.0, 300.0, myPassWordStrength]
        
        setChart(months, values: unitsSold as! [Double])
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart"
        barChartView.noDataTextDescription = "You need to enter a valid password"
        
        
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Time in days")
        let chartData = BarChartData(xVals: months, dataSet: chartDataSet)
        barChartView.data = chartData
        
        barChartView.descriptionText = ""
        
        //barChartView.xAxis.labelPosition = .Bottom
        
        chartDataSet.colors = [UIColor(red: 100/255, green: 200/255, blue: 10/255, alpha: 1), UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1),UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1), UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)]
        
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        let ll = ChartLimitLine(limit: 500.0, label: "")
        barChartView.rightAxis.addLimitLine(ll)
        let ii = ChartLimitLine(limit: 100.0, label: "")
        barChartView.rightAxis.addLimitLine(ii)
        
        
    }
    
    func OneGram(oneGram: String) -> Double {
      //  let greeting = "Hello, " + oneGram + "!"
        
        let myFileURL = NSBundle.mainBundle().URLForResource("unigrams", withExtension: "txt")!
        let myText = try! String(contentsOfURL: myFileURL, encoding: NSUTF8StringEncoding)
        
        
       // if let content = (myText){
            var myStrings = myText.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
     //       TextView.text = myStrings[0]
      //  }
        var i: Int = 0
        var found: Bool = false
        while  found == false{
        var indexforOneG = myStrings[i].startIndex.advancedBy(1)
        subStringForOneG = myStrings[i].substringToIndex(indexforOneG)
        
   //     var indexfor2 = subStringForOneG.startIndex.advancedBy(1)
   //     subStringForOneG = subStringForOneG.substringToIndex(indexfor2)
        
        
        print(subStringForOneG)
            
            if subStringForOneG == oneGram{
                var lineParsed = myStrings[i].componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                print(lineParsed[0], lineParsed[1], lineParsed[2])
                print(Double(lineParsed[1])!)
                return Double(lineParsed[1])!
            }
            ++i
        
        }
        
        print(myStrings[i])
        
        print(myText)
        
        
        return (1.0/96.0)
    }
    
    func TwoGram(twoGram: String) -> Double {
       // let greeting = "Hello, " + twoGram + "!"
        
        let myFileURL = NSBundle.mainBundle().URLForResource("digrams", withExtension: "txt")!
        let myText = try! String(contentsOfURL: myFileURL, encoding: NSUTF8StringEncoding)
        
        
        
        
        
        
        var indexfor1 = twoGram.startIndex.advancedBy(1)
        var subStringfor1 = twoGram.substringToIndex(indexfor1)
        
      //  var indexfor2 = twoGram.startIndex.advancedBy(2)
      //  substringfor2 = twoGram.substringToIndex(indexfor2)
        
       var indexfor2 = twoGram.startIndex.advancedBy(1)
        var subStringfor2 = twoGram.substringFromIndex(indexfor2)
        
        var newGram2 = subStringfor1+" "+subStringfor2
        
        print("\(newGram2)")
        
        indexfor2 = substringfor1.startIndex.advancedBy(4)
        substringfor2 = substringfor1.substringToIndex(indexfor2)
        
        
        
        
        // if let content = (myText){
        var myStrings = myText.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
        //       TextView.text = myStrings[0]
        //  }
        var i: Int = 0
        var found: Bool = false
        while  found == false{
            var indexforOneG = myStrings[i].startIndex.advancedBy(3)
            subStringForTwoG = myStrings[i].substringToIndex(indexforOneG)
            
            //     var indexfor2 = subStringForOneG.startIndex.advancedBy(1)
            //     subStringForOneG = subStringForOneG.substringToIndex(indexfor2)
            
            
            
            
            
   /*         var indexfor1 = passwordToDisplay.startIndex.advancedBy(i)
            substringfor1 = passwordToDisplay.substringFromIndex(indexfor1)
            
            var indexfor2 = substringfor1.startIndex.advancedBy(4)
            substringfor2 = substringfor1.substringToIndex(indexfor2)
     */
            
            print(subStringForTwoG)
            
            if subStringForTwoG == newGram2{
                var lineParsed = myStrings[i].componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                print(lineParsed[0], lineParsed[1], lineParsed[2], lineParsed[3])
                print(Double(lineParsed[2])!)
                return Double(lineParsed[2])!
            }
            ++i
         
            
            print(myStrings[i])
        }
        
        print(myStrings[i])

        
        
        
        
        
        
        
        
        print(myText)
        
        
        
        return (1.0/96.0)
    }
    
    func ThreeGram(threeGram: String) -> Double {
      //  let greeting = "Hello, " + threeGram + "!"
        
        let myFileURL = NSBundle.mainBundle().URLForResource("trigrams", withExtension: "txt")!
        let myText = try! String(contentsOfURL: myFileURL, encoding: NSUTF8StringEncoding)
        
        
        
        
        
        
        
        var indexfor1 = threeGram.startIndex.advancedBy(2)
        var subStringfor1 = threeGram.substringToIndex(indexfor1)
        
        //  var indexfor2 = twoGram.startIndex.advancedBy(2)
        //  substringfor2 = twoGram.substringToIndex(indexfor2)
        
        var indexfor2 = threeGram.startIndex.advancedBy(2)
        var subStringfor2 = threeGram.substringFromIndex(indexfor2)
        
        var newGram2 = subStringfor1+" "+subStringfor2
        
        print("\(newGram2)")
        
        indexfor2 = substringfor1.startIndex.advancedBy(5)
        substringfor2 = substringfor1.substringToIndex(indexfor2)
        
        // if let content = (myText){
        var myStrings = myText.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
        //       TextView.text = myStrings[0]
        //  }
        var i: Int = 0
        var found: Bool = false
        while  found == false{
            var indexforOneG = myStrings[i].startIndex.advancedBy(4)
            subStringForTwoG = myStrings[i].substringToIndex(indexforOneG)
            
            
            print(subStringForTwoG)
            print("\(newGram2)")
            
            if subStringForTwoG == newGram2{
                var lineParsed = myStrings[i].componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                print(lineParsed[0], lineParsed[1], lineParsed[2], lineParsed[3])
                print(Double(lineParsed[2])!)
                return Double(lineParsed[2])!
            }
            ++i
            
            
            print(myStrings[i])
        
        }
        
        print(myText)
        
        
        
        return (1.0/96.0)
    
    }
    
    func FourGram(fourGram: String) -> Double {
       // let greeting = "Hello, " + fourGram + "!"
        
        
        let myFileURL = NSBundle.mainBundle().URLForResource("quadgrams", withExtension: "txt")!
        let myText = try! String(contentsOfURL: myFileURL, encoding: NSUTF8StringEncoding)
        
        
        
        
        
        
        var indexfor1 = fourGram.startIndex.advancedBy(3)
        var subStringfor1 = fourGram.substringToIndex(indexfor1)
        
        //  var indexfor2 = twoGram.startIndex.advancedBy(2)
        //  substringfor2 = twoGram.substringToIndex(indexfor2)
        
        var indexfor2 = fourGram.startIndex.advancedBy(3)
        var subStringfor2 = fourGram.substringFromIndex(indexfor2)
        
        var newGram2 = subStringfor1+" "+subStringfor2
        
        print("\(newGram2)")
        
        indexfor2 = substringfor1.startIndex.advancedBy(5)
        substringfor2 = substringfor1.substringToIndex(indexfor2)
        
        // if let content = (myText){
        var myStrings = myText.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
        //       TextView.text = myStrings[0]
        //  }
        var i: Int = 0
        var found: Bool = false
        while  found == false{
            var indexforOneG = myStrings[i].startIndex.advancedBy(5)
            subStringForTwoG = myStrings[i].substringToIndex(indexforOneG)
            
            
            print(subStringForTwoG)
            print("\(newGram2)")
            
            if subStringForTwoG == newGram2{
                var lineParsed = myStrings[i].componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                print(lineParsed[0], lineParsed[1], lineParsed[2], lineParsed[3])
                print(Double(lineParsed[2])!)
                return Double(lineParsed[2])!
            }
            ++i
            
            
            print(myStrings[i])
            
        }
        
        print(myText)
        

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        return 2.0
    }
    
    func attempts(totalProb: Double) -> Double {
        // let greeting = "Hello, " + fourGram + "!"
        
        let myFileURL = NSBundle.mainBundle().URLForResource("finalDatabaseNoPasswords", withExtension: "txt")!
        let myText = try! String(contentsOfURL: myFileURL, encoding: NSUTF8StringEncoding)
        //print(myText)
        
        var at: Double
    //    at = totalProb*10000
        at = 300
        
 
        
        // if let content = (myText){
        var myStrings = myText.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
        //       TextView.text = myStrings[0]
        //  }
        var i: Int = 0
        var found: Bool = false
        while  found == false{
            var lineParsed = myStrings[i].componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
          //  var indexforOneG = myStrings[i].startIndex.advancedBy(1)
          //  subStringForOneG = myStrings[i].substringToIndex(indexforOneG)
            
            //     var indexfor2 = subStringForOneG.startIndex.advancedBy(1)
            //     subStringForOneG = subStringForOneG.substringToIndex(indexfor2)
            
            
           // print(Double(subStringForOneG)!)
           var probFile = Double(lineParsed[0])!
        
            print("prob file \(probFile)")
            print("total prob \(totalProb)")
            
            if probFile <= totalProb{
                var lineParsed = myStrings[i].componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                print(lineParsed[0], lineParsed[1])
                print(Double(lineParsed[1])!)
                return Double(lineParsed[1])!
            }
            ++i
            
        }

        
        
        return at
    }
    

    
    
}

