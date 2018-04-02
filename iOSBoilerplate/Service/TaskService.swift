import UIKit
import SQLite

class TaskService: NSObject {
  let db: Connection
  
  init(_ db: Connection) {
    self.db = db
  }
  
  func all() -> [Task] {
    do {
      var todos: [Task] = []
      for row in try self.db.prepare(TaskSchema.table) {
        let todo = Task()
        todo.id = row[TaskSchema.id]
        todo.todo = row[TaskSchema.todo]
        todos.append(todo)
      }
      return todos
    } catch {
      return []
    }
  }
  
  func insert(_ todo: String) -> Int64 {
    do {
      let rowId = try self.db.run(TaskSchema.table.insert(TaskSchema.todo <- todo))
      return rowId
    } catch {
      return 0
    }
  }
  
  func update(_ task: Task) -> Bool {
    do {
      let row = TaskSchema.table.filter(TaskSchema.id == task.id)
      try self.db.run(row.update(TaskSchema.todo <- task.todo))
      return true
    } catch {
      return false
    }
  }
  
  func delete(_ task: Task) -> Bool {
    do {
      let row = TaskSchema.table.filter(TaskSchema.id == task.id)
      try self.db.run(row.delete())
      return true
    } catch {
      return false
    }
  }
}
