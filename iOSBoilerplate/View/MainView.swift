//
//  MainView.swift
//  iOSBoilerplate
//

import UIKit
import Cartography

class MainView: UIView, UITableViewDelegate, UITableViewDataSource {
  
  let table = UITableView()
  var todos: [String] = ["test"]
  
  override init(frame: CGRect) {
    super.init(frame: frame)

    table.frame = frame
    table.register(UITableViewCell.self, forCellReuseIdentifier: "data")
    table.dataSource = self
    table.delegate = self
    self.backgroundColor = .white
    self.addSubview(table)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todos.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "data", for: indexPath) as UITableViewCell
    cell.textLabel?.text = todos[indexPath.row]
    return cell
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
}
