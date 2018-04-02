import UIKit
import SQLite

class InitService: NSObject {
  let db: Connection
  
  init(_ db: Connection) {
    self.db = db
  }
  
  func migration() {
    do {
      if (self.db.userVersion == 0) {
        try self.migration1()
        self.db.userVersion = 1
      }
    } catch {
      print("create err")
    }

  }

  private func migration1() throws {
    try self.db.run(TaskSchema.table.create { t in
      t.column(TaskSchema.id, primaryKey: .autoincrement)
      t.column(TaskSchema.todo)
    })
  }
}
