import UIKit
import SQLite

class ResourceService: NSObject {
  private var db: Connection?
  let initService: InitService
  let task: TaskService
  
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
    self.task = TaskService(self.db!)
    self.initService = InitService(self.db!)

    super.init()
  }
}

extension Connection {
  public var userVersion: Int {
    get {
      do {
        return Int(try scalar("PRAGMA user_version") as! Int64)
      } catch {
        return 999
      }
    }
    set { try! run("PRAGMA user_version = \(newValue)") }
  }
}
