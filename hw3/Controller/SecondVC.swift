import UIKit
import SnapKit



class SecondVC: UIViewController, UITableViewDataSource {
    private let cell = "Quasar"
    private let tableView = UITableView()
    
    private let peoples: [Contact] = [
        .init(name: "Jane Cooper", phoneNumber: "(270) 555-0117", image: "userImage"),
        .init(name: "Devon Lane", phoneNumber: "(308) 555-0121", image: "userImage"),
        .init(name: "Darrell Steward", phoneNumber: "(684) 555-0102", image: "userImage"),
        .init(name: "Devon Lane", phoneNumber: "(704) 555-0127", image: "userImage"),
        .init(name: "Courtney Henry", phoneNumber: "(505) 555-0125", image: "userImage"),
        .init(name: "Wade Warren", phoneNumber: "(225) 555-0118", image: "userImage"),
        .init(name: "Bessie Cooper", phoneNumber: "(406) 555-0120", image: "userImage"),
        .init(name: "Robert Fox", phoneNumber: "(480) 555-0103", image: "userImage"),
        .init(name: "Jacob Jones", phoneNumber: "(702) 555-0122", image: "userImage"),
        .init(name: "Jenny Wilson", phoneNumber: "(239) 555-0108", image: "userImage")
    ]

    private lazy var titleLabel: UILabel = MakerView.makerView.createLabel(
        text: "My Contacts", fontSize: 16, fontWeight: .semibold, textAlignment: .center
    )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    
    private func initUI() {
        view.backgroundColor = .white
        tableView.dataSource = self
    
        view.safeAreaLayoutGuide.owningView?.backgroundColor = UIColor(hex: "#F6F6F6")
        
        configureTitleLabel()
        configureTableView()
    }
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
        }
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


extension SecondVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        peoples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cell)
        cell.textLabel?.text = peoples[indexPath.row].name
        cell.textLabel?.font = .systemFont(ofSize: 17)
        cell.imageView?.image = UIImage(named: peoples[indexPath.row].image)
        cell.detailTextLabel?.text = peoples[indexPath.row].phoneNumber
        cell.detailTextLabel?.textColor = UIColor(hex: "#8A8A8D")
        return cell
    }
}
