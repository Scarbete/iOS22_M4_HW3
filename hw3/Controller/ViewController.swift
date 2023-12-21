import UIKit
import SnapKit



class ViewController: UIViewController {
    
    private lazy var loginLabel: UILabel = MakerView.makerView.createLabel(
        text: "Login", fontSize: 18, fontWeight: .bold
    )
    
    private lazy var loginImage: UIImageView = MakerView.makerView.createImage(
        image: UIImage(systemName: "person.crop.circle")
    )
    
    private lazy var welcomeBackLabel: UILabel = MakerView.makerView.createLabel(
        text: "Welcome back , Rohit thakur", textColor: UIColor(hex: "#5B5B5B")
    )
    
    private lazy var mainImage: UIImageView = MakerView.makerView.createImage(
        image: UIImage(named: "mainImage")
    )
    
    private lazy var orangeLabel: UILabel = MakerView.makerView.createLabel(
        text: "Enter Your Mobile Number", textColor: UIColor(hex: "#F2796B"), fontSize: 17, fontWeight: .bold
    )
    
    private lazy var numberTF: UITextField = MakerView.makerView.createTF(
        placeholder: "Enter Number", backgroundColor: .white, cornerRadius: 10, leftView: true, rightView: true
    )
    
    private lazy var loginButton: UIButton = MakerView.makerView.createButton(
        text: "Login", textColor: .white, fontSize: 15, fontWeight: .bold, cornerRadius: 10, backgroundColor: UIColor(hex: "#F2796B")
    )

        
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    

    private func initUI() {
        view.backgroundColor = UIColor(hex: "#F6F6F6")
        configureLoginLabel()
        configureLoginImage()
        configureWelcomeBackLabel()
        configureMainImage()
        configureOrangeLabel()
        configureNumberTF()
        configureLoginButton()
    }

    private func configureLoginLabel() {
        view.addSubview(loginLabel)
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.leading.equalToSuperview().offset(24)
        }
    }

    private func configureLoginImage() {
        view.addSubview(loginImage)
        
        loginImage.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.top)
            make.leading.equalTo(loginLabel.snp.trailing).offset(4)
        }
    }

    private func configureWelcomeBackLabel() {
        view.addSubview(welcomeBackLabel)
        
        welcomeBackLabel.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(24)
        }
    }

    private func configureMainImage() {
        view.addSubview(mainImage)
        
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(welcomeBackLabel.snp.bottom).offset(49)
            make.centerX.equalToSuperview()
            make.height.equalTo(231)
        }
    }

    private func configureOrangeLabel() {
        view.addSubview(orangeLabel)
        
        orangeLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
    }

    private func configureNumberTF() {
        view.addSubview(numberTF)
        
        numberTF.snp.makeConstraints { make in
            make.top.equalTo(orangeLabel.snp.bottom).offset(31)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(43)
        }
    }

    private func configureLoginButton() {
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(numberTF.snp.bottom).offset(64)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(43)
        }
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped(_ sender: UIButton) {
        if numberTF.hasText {
            numberTF.placeholder = "Enter Number"
            numberTF.layer.borderWidth = 0
            numberTF.layer.borderColor = .none
            navigationController?.pushViewController(SecondVC(), animated: true)
        }
        else {
            numberTF.placeholder = "Заполните пожалуйста!"
            numberTF.layer.borderWidth = 1
            numberTF.layer.borderColor = UIColor.red.cgColor
        }
    }
    
}

