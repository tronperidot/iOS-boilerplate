//
//  HomeController.swift
//  iOSBoilerplate
//
//  Created by yk13475 on 2018/03/26.
//  Copyright © 2018年 tronperidot. All rights reserved.
//

import UIKit
import SQLite

class HomePresenter: UIViewController {
  var addButton: UIBarButtonItem!
  var mainView: MainView!
  var db: Connection!

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.setNavigationBarHidden(false, animated: false)
    self.navigationController?.navigationBar.tintColor = UIColor.red
    self.title = "Home"
    self.mainView = MainView(frame: self.view.bounds)
    self.mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    self.addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onClickAddButton))
    self.navigationItem.rightBarButtonItem = self.addButton
    
    self.dbInit()
    
    self.view.addSubview(self.mainView)
  }
 
  override func viewWillAppear(_ animated: Bool) {
    self.mainView.todos = []
    let tasks = Table("tasks")
    let todo = Expression<String>("todo")
    do {
      for task in try self.db.prepare(tasks) {
        self.mainView.todos.append(task[todo])
      }
      // テーブル情報を更新する
      self.mainView.table.reloadData()
    } catch {
      print("prepare err")
    }
  }
  
  private func dbInit() {
    let path = NSSearchPathForDirectoriesInDomains(
      .documentDirectory, .userDomainMask, true
      ).first!
    do {
      self.db = try Connection("\(path)/db.sqlite3")
      self.tableInit()
    } catch {
      print("db connection Err")
      print(path)
    }
  }
  
  private func tableInit() {
    do {
      let tasks = Table("tasks")
      print(tasks)
      print("tasks")
      try self.db.run(tasks.create { t in
        t.column(Expression<Int64>("id"), primaryKey: .autoincrement)
        t.column(Expression<String>("todo"))
      })
    } catch {
        print("create err")
    }
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @objc func onClickAddButton() {
    let second = EditPresenter()
    self.navigationController?.pushViewController(second, animated: true)
  }

}
