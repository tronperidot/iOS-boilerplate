import UIKit
import Charts

class GraphViewController: UIViewController, ChartViewDelegate {
  var presenter: GraphPresenter?
  
  private let ITEM_COUNT = 15

  var chartView = CombinedChartView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.isTranslucent = false
    self.title = "graph"
    self.navigationController?.setNavigationBarHidden(false, animated: false)
    let frame = self.view.frame
    // margin 5% 10%
    self.chartView.frame = CGRect(x: frame.width * 0.05, y: frame.height * 0.1, width: frame.width * 0.9, height: frame.height * 0.8)
    self.chartView.delegate = self
    self.chartView.chartDescription?.enabled = false
    
    self.chartView.drawBarShadowEnabled = false
    self.chartView.drawValueAboveBarEnabled = false
    self.chartView.highlightFullBarEnabled = false
    
    self.chartView.pinchZoomEnabled = false
    self.chartView.doubleTapToZoomEnabled = false
    
    self.chartView.drawOrder = [DrawOrder.bar.rawValue,
                           DrawOrder.line.rawValue]
    self.chartView.pinchZoomEnabled = false

    let l = chartView.legend
    l.wordWrapEnabled = true
    l.horizontalAlignment = .left
    l.verticalAlignment = .bottom
    l.orientation = .horizontal
    l.drawInside = false
    l.form = .line
    
    let rightAxis = chartView.rightAxis
    rightAxis.axisMinimum = 0

    let leftAxis = chartView.leftAxis
    leftAxis.axisMinimum = 0
    
    let xAxis = chartView.xAxis
    xAxis.labelPosition = .bottom
    xAxis.axisMinimum = 0
    xAxis.granularity = 1
    xAxis.drawGridLinesEnabled = false
    xAxis.drawAxisLineEnabled = false
    xAxis.enabled = false
    self.setChartData()
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
    print(self.view.bounds)
    print(self.view.frame)
    label.text = "単位（xxx）"
    self.view.backgroundColor = UIColor.white
    self.view.addSubview(self.chartView)
    self.view.addSubview(label)
    self.presenter?.viewDidLoad()
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
    var entries = (0..<ITEM_COUNT).map { (i) -> ChartDataEntry in
      return ChartDataEntry(x: Double(i), y: Double(arc4random_uniform(30) + 20))
    }
    
    entries.remove(at: 2)
    entries.remove(at: 2)
  
    
    let entries2 = (0..<ITEM_COUNT).map { (i) -> ChartDataEntry in
      return ChartDataEntry(x: Double(i), y: Double(arc4random_uniform(45) + 5))
    }
    let yellow = UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1)
    let set1 = self.makeLineDataSet(values: Array(entries.prefix(2)).map{$0}, label: "Line DataSet", color: yellow)
    let set2 = self.makeLineDataSet(values: Array(Array(entries.dropFirst(1)).prefix(2)).map{$0}, label: "Line DataSet", color: yellow)
    let set3 = self.makeLineDataSet(values: Array(entries.dropFirst(2)).map{$0}, label: "Line DataSet", color: yellow)
    set2.lineDashLengths = [5, 2.5]
    
    let setAtBlue = self.makeLineDataSet(values: entries2, label: "Line DataSet", color: UIColor.blue)
    return LineChartData(dataSets: [set1, set2, set3, setAtBlue])
  }
  
  private func makeLineDataSet(values: [Charts.ChartDataEntry]?, label: String?, color: UIColor) -> LineChartDataSet {
    let set = LineChartDataSet(values: values, label: label)
    set.setColor(color)
    set.lineWidth = 2.5
    set.setCircleColor(color)
    set.circleRadius = 5
    set.circleHoleRadius = 2.5
    set.fillColor = color
    set.mode = .linear
    set.drawValuesEnabled = true
    set.valueFont = .systemFont(ofSize: 10)
    set.valueTextColor = color
    
    set.axisDependency = .left
    return set
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
