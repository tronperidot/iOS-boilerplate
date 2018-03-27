//
//  EditPresenter.swift
//  iOSBoilerplate
//
//  Created by yk13475 on 2018/03/27.
//  Copyright © 2018年 tronperidot. All rights reserved.
//

import UIKit
import SQLite

class EditPresenter: UIViewController {

  var textField: UITextField!
  var db: Connection!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Edit"
    self.view.backgroundColor = UIColor.cyan
    textField = UITextField(frame: CGRect(x: 100, y: 100, width: 200, height: 30))
    textField.borderStyle = UITextBorderStyle.roundedRect
    self.view.addSubview(textField)
    let writeBtn: UIButton = UIButton(frame: CGRect(x: 100, y: 150, width: 200, height: 30))
    writeBtn.backgroundColor = UIColor.magenta
    writeBtn.setTitle("タスク保存", for: UIControlState.normal)
    writeBtn.addTarget(self, action: #selector(writeData), for: UIControlEvents.touchUpInside)
    self.view.addSubview(writeBtn)
    self.dbInit()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  private func dbInit() {
    let path = NSSearchPathForDirectoriesInDomains(
      .documentDirectory, .userDomainMask, true
      ).first!
    do {
      self.db = try Connection("\(path)/db.sqlite3")
    } catch {
      print("db connection Err")
      print(path)
    }
  }
  
  @objc func writeData() {
      do {
        let tasks = Table("tasks")
        let todo = Expression<String>("todo")
        let text: String = self.textField.text ?? "unknown"
        let rowid = try self.db.run(tasks.insert(todo <- text))
        print("inserted id: \(rowid)")
        self.navigationController?.popViewController(animated: true)
      } catch {
        print("insertion failed: \(error)")
      }
  }

}
