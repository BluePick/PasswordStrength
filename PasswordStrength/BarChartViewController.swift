//
//  BarChartViewController.swift
//  PasswordStrength
//
//  Created by Dylan Iruretagoyena on 2015-11-29.
//  Copyright © 2015 Micheal Griffin. All rights reserved.
//

import Foundation
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        months = ["Strong", "Weak", "Recomended", "Yours"]
        let unitsSold = [500.0, 100.0, 300.0, 700.0]
        
        setChart(months, values: unitsSold)
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
        
        barChartView.xAxis.labelPosition = .Bottom
        
        chartDataSet.colors = [UIColor(red: 100/255, green: 200/255, blue: 10/255, alpha: 1), UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1),UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1), UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)]
        
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        let ll = ChartLimitLine(limit: 500.0, label: "")
        barChartView.rightAxis.addLimitLine(ll)
        let ii = ChartLimitLine(limit: 100.0, label: "")
        barChartView.rightAxis.addLimitLine(ii)
        
        
    }
    
    
}

