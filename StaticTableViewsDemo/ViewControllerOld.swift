//  Created by Dominik Hauser on 10.12.21.
//  
//

import UIKit

class ViewControllerOld: UIViewController {

  var contentView: View {
    return view as! View
  }

  override func loadView() {
    let contentView = View()
    view = contentView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Old"

    let tableView = contentView.tableView
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }
}

extension ViewControllerOld: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return Section.allCases.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let section = Section(rawValue: section) else {
      return 0
    }

    switch section {
      case .personal:
        return PersonalRow.allCases.count
      case .appSettings:
        return AppSettingsRow.allCases.count
      case .appInfo:
        return AppInfoRow.allCases.count
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    guard let section = Section(rawValue: indexPath.section) else {
      return UITableViewCell()
    }

    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

    switch section {
      case .personal:
        guard let row = PersonalRow(rawValue: indexPath.row) else {
          return UITableViewCell()
        }
        cell.textLabel?.text = row.title
      case .appSettings:
        guard let row = AppSettingsRow(rawValue: indexPath.row) else {
          return UITableViewCell()
        }
        cell.textLabel?.text = row.title
      case .appInfo:
        guard let row = AppInfoRow(rawValue: indexPath.row) else {
          return UITableViewCell()
        }
        cell.textLabel?.text = row.title
    }

    return cell
  }
}

extension ViewControllerOld {
  enum Section: Int, CaseIterable {
    case personal
    case appSettings
    case appInfo
  }

  enum PersonalRow: Int, CaseIterable {
    case name
    case twitter
    case github

    var title: String {
      switch self {
        case .name:
          return "Name"
        case .twitter:
          return "Twitter"
        case .github:
          return "GitHub"
      }
    }
  }

  enum AppSettingsRow: Int, CaseIterable {
    case showIcons
    case monochrome

    var title: String {
      switch self {
        case .showIcons:
          return "Show icons"
        case .monochrome:
          return "Monochome"
      }
    }
  }

  enum AppInfoRow: Int, CaseIterable {
    case imprint
    case termsOfService

    var title: String {
      switch self {
        case .imprint:
          return "Imprint"
        case .termsOfService:
          return "Terms of service"
      }
    }
  }
}
