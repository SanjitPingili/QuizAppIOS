import UIKit

class SearchViewController: UIViewController {

    let searchTextField = UITextField()
    let searchButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure search text field
        searchTextField.placeholder = "Enter search query"
        searchTextField.borderStyle = .roundedRect
        view.addSubview(searchTextField)

        // Configure search button
        searchButton.setTitle("Search", for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        view.addSubview(searchButton)

        // Layout search text field and button
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            searchTextField.widthAnchor.constraint(equalToConstant: 200),
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20)
        ])
    }

    @objc func searchButtonTapped() {
        // TODO: Implement search functionality
    }

}
