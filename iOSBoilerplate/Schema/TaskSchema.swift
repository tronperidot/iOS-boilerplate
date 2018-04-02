import UIKit
import SQLite

struct TaskSchema {
    static let table: Table = Table("table")

    static let id: Expression<Int64> = Expression<Int64>("id")
    static let todo: Expression<String> = Expression<String>("todo")
}
