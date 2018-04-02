import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  var presenter: HomePresenter?

  let table = UITableView()
  var todos: [Task] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.setNavigationBarHidden(false, animated: false)
    self.navigationController?.navigationBar.tintColor = UIColor.red
    self.title = "Home"
    let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onClickAddBtn))
    self.navigationItem.rightBarButtonItem = addBtn
    
    table.frame = self.view.bounds
    table.register(UITableViewCell.self, forCellReuseIdentifier: "data")
    table.dataSource = self
    table.delegate = self
    self.view.backgroundColor = .white
    self.view.addSubview(table)
    self.presenter?.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    self.presenter?.viewWillAppear()
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todos.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "data", for: indexPath) as UITableViewCell
    cell.textLabel?.text = todos[indexPath.row].todo
    return cell
  }
  
  @objc func onClickAddBtn() {
    self.presenter?.toAddPage()
  }

}
