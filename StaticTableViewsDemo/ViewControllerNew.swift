//  Created by Dominik Hauser on 13.12.21.
//  
//

import UIKit

class ViewControllerNew: UIViewController {

  var dataSource: UITableViewDiffableDataSource<Section, Row>?
  var contentView: View {
    return view as! View
  }

  override func loadView() {
    let contentView = View()
    view = contentView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "New"

    let tableView = contentView.tableView
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    dataSource = UITableViewDiffableDataSource<Section, Row>(tableView: tableView, cellProvider: { tableView, indexPath, row in
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      cell.textLabel?.text = row.title
      return cell
    })

    setUp()
  }

  private func setUp() {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Row>()
    snapshot.appendSections([.personal, .appSettings, .appInfo])
    snapshot.appendItems([.name, .twitter, .github], toSection: .personal)
    snapshot.appendItems([.showIcons, .monochrome], toSection: .appSettings)
    snapshot.appendItems([.imprint, .termsOfService], toSection: .appInfo)
    dataSource?.apply(snapshot)
  }
}

extension ViewControllerNew {
  enum Section: Int, CaseIterable {
    case personal
    case appSettings
    case appInfo
  }

  enum Row: Hashable {
    case name
    case twitter
    case github
    case showIcons
    case monochrome
    case imprint
    case termsOfService

    var title: String {
      switch self {
        case .name:
          return "Name"
        case .twitter:
          return "Twitter"
        case .github:
          return "GitHub"
        case .showIcons:
          return "Show icons"
        case .monochrome:
          return "Monochome"
        case .imprint:
          return "Imprint"
        case .termsOfService:
          return "Terms of service"
      }
    }
  }
}
