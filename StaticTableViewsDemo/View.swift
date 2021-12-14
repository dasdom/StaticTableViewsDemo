//  Created by Dominik Hauser on 13.12.21.
//  
//

import UIKit

class View: UIView {

  let tableView: UITableView

  override init(frame: CGRect) {

    tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false

    super.init(frame: frame)

    addSubview(tableView)

    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: topAnchor),
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
    ])
  }

  required init?(coder: NSCoder) { fatalError() }
}
