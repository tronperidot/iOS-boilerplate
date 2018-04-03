import UIKit
import Charts

class GraphViewController: UIViewController, ChartViewDelegate {
  var presenter: GraphPresenter?
  
  private let ITEM_COUNT = 15

  var chartView = CombinedChartView()
  
  let months = ["Jan", "Feb", "Mar",
                "Apr", "May", "Jun",
                "Jul", "Aug", "Sep",
                "Jul", "Aug", "Sep",
                "Oct", "Nov", "Dec"]

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "graph"
    
    self.chartView.frame = self.view.bounds
    self.chartView.delegate = self
    self.chartView.chartDescription?.enabled = false
    self.chartView.drawBarShadowEnabled = false
    self.chartView.highlightFullBarEnabled = false
    self.chartView.drawOrder = [DrawOrder.bar.rawValue,
                           DrawOrder.line.rawValue]

    let l = chartView.legend
    l.wordWrapEnabled = true
    l.horizontalAlignment = .center
    l.verticalAlignment = .bottom
    l.orientation = .horizontal
    l.drawInside = false
    //        chartView.legend = l
    
    let rightAxis = chartView.rightAxis
    rightAxis.axisMinimum = 0
    
    let leftAxis = chartView.leftAxis
    leftAxis.axisMinimum = 0
    
    let xAxis = chartView.xAxis
    xAxis.labelPosition = .bothSided
    xAxis.axisMinimum = 0
    xAxis.granularity = 1
    xAxis.valueFormatter = self
    
    self.view.backgroundColor = UIColor.white
    self.view.addSubview(self.chartView)
    self.presenter?.viewDidLoad()
    self.setChartData()
  }

  override func viewWillAppear(_ animated: Bool) {
    self.presenter?.viewWillAppear()
  }
  
  func setChartData() {
    let data = CombinedChartData()
    data.lineData = generateLineData()
    data.barData = generateBarData()
    
    self.chartView.xAxis.axisMaximum = data.xMax + 0.25
    self.chartView.data = data
  }
  
  func generateLineData() -> LineChartData {
    let entries = (0..<ITEM_COUNT).map { (i) -> ChartDataEntry in
      return ChartDataEntry(x: Double(i), y: Double(arc4random_uniform(15) + 5))
    }
    
    let set = LineChartDataSet(values: entries, label: "Line DataSet")
    set.setColor(UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1))
    set.lineWidth = 2.5
    set.setCircleColor(UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1))
    set.circleRadius = 5
    set.circleHoleRadius = 2.5
    set.fillColor = UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1)
    set.mode = .cubicBezier
    set.drawValuesEnabled = true
    set.valueFont = .systemFont(ofSize: 10)
    set.valueTextColor = UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1)
    
    set.axisDependency = .left
    
    return LineChartData(dataSet: set)
  }
  
  func generateBarData() -> BarChartData {
    let entries1 = (0..<ITEM_COUNT).map { (i) -> BarChartDataEntry in
      return BarChartDataEntry(x: Double(i), y: Double(arc4random_uniform(25) + 25))
    }
    
    let set1 = BarChartDataSet(values: entries1, label: "Bar 1")
    set1.setColor(UIColor(red: 60/255, green: 220/255, blue: 78/255, alpha: 1))
    set1.valueTextColor = UIColor(red: 60/255, green: 220/255, blue: 78/255, alpha: 1)
    set1.valueFont = .systemFont(ofSize: 10)
    // set1.axisDependency = .left
    
    set1.drawValuesEnabled = false

    let barWidth = 0.9
    
    let data = BarChartData(dataSet: set1)
    data.barWidth = barWidth
    
    return data
  }
}

extension GraphViewController: IAxisValueFormatter {
  func stringForValue(_ value: Double, axis: AxisBase?) -> String {
    return months[Int(value) % months.count]
  }
}

