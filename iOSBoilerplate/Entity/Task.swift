//
//  Task.swift
//  iOSBoilerplate
//
//  Created by yk13475 on 2018/03/30.
//  Copyright © 2018年 tronperidot. All rights reserved.
//

import SQLite

struct ColumnInfo<DataType> {
  var column: Expression<DataType>
  var template: String {
    get {
      return self.column.template
    }
  }
  
  init(_ template: String) {
    self.column = Expression<DataType>(template)
  }
}

protocol ColumnProps {
  var table: Table { get set }
}

class TableModel: NSObject {
}

class Task: TableModel {
  var id: Int64 = 0
  var todo: String = ""
}
