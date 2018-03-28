//
//  HomeView.swift
//  iOSBoilerplate
//
//  Created by yk13475 on 2018/03/28.
//  Copyright © 2018年 tronperidot. All rights reserved.
//

import UIKit

class HomeView: UIViewController, UITableViewDelegate, UITableViewDataSource {
  var addButton: UIBarButtonItem!
  let table = UITableView()
  var todos: [String] = []

  // TODO: change interface to PresenterProtcol
  var presenter: HomePresenter?

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    super.viewDidLoad()
    self.navigationController?.setNavigationBarHidden(false, animated: false)
    self.navigationController?.navigationBar.tintColor = UIColor.red
    self.title = "Home"
    self.addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onClickAddButton))
    self.navigationItem.rightBarButtonItem = self.addButton

    table.frame = self.view.bounds
    table.register(UITableViewCell.self, forCellReuseIdentifier: "data")
    table.dataSource = self
    table.delegate = self
    self.view.backgroundColor = .white
    self.view.addSubview(table)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.presenter?.viewWillAppear()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todos.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "data", for: indexPath) as UITableViewCell
    cell.textLabel?.text = todos[indexPath.row]
    return cell
  }
  
  @objc func onClickAddButton() {
    self.presenter?.toAddPage()
  }

}
