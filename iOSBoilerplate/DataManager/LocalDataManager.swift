//
//  LocalDataManager.swift
//  iOSBoilerplate
//
//  Created by yk13475 on 2018/03/28.
//  Copyright © 2018年 tronperidot. All rights reserved.
//

import UIKit
import SQLite

class LocalDataManager: NSObject {
  var db: Connection?
  let taskTable = Table("tasks")
  let idCol = Expression<Int64>("id")
  let taskCol = Expression<String>("todo")
  
  override init() {
    let path = NSSearchPathForDirectoriesInDomains(
      .documentDirectory, .userDomainMask, true
      ).first!
    do {
      self.db = try Connection("\(path)/db.sqlite3")
    } catch {
      print("db connection Err")
      print(path)
    }
    super.init()
  }
  
  
  func writeTask(text: String) -> Bool {
    do {
      let rowid = try self.db?.run(taskTable.insert(taskCol <- text))
      print("inserted id: \(String(describing: rowid))")
      return true
    } catch {
      print("insertion failed: \(error)")
      return false
    }
  }
  
  func loadTasks() -> [String] {
    do {
      var todos: [String] = []
      if (self.db != nil) {
        for data in try self.db!.prepare(taskTable) {
          todos.append(data[taskCol])
        }
      }
      return todos
    } catch {
      print("prepare error")
      return []
    }
  }
  
  func tableInit() {
    do {
      try self.db?.run(taskTable.create { t in
        t.column(idCol, primaryKey: .autoincrement)
        t.column(Expression<String>("todo"))
      })
    } catch {
      print("create err")
    }
  }
}
