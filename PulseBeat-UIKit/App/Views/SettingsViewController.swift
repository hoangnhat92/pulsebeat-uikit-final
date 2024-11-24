//
//  SettingsViewController.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 23/11/24.
//
import UIKit

class SettingsViewController: UIViewController {
    private let viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func handleLogout() {
        let alert = UIAlertController(
            title: "Logout",
            message: "Are you sure you want to log out?",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Logout", style: .destructive) { [weak self] _ in
            print("User logged out")
            self?.viewModel.logout()
        })
        present(alert, animated: true)
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
            viewModel.sections.count + 1 // Add 1 for the Logout section
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if section < viewModel.sections.count {
                return viewModel.sections[section].count
            } else {
                return 1 // Logout section has only 1 row
            }
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.section < viewModel.sections.count {
            cell.textLabel?.text = viewModel.setting(at: indexPath)
            cell.textLabel?.textColor = .black
            cell.textLabel?.textAlignment = .left
        } else {
            cell.textLabel?.text = "Logout"
            cell.textLabel?.textColor = .red
            cell.textLabel?.textAlignment = .center
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == viewModel.sections.count {
            handleLogout()
        } else {
            let selectedSetting = viewModel.sections[indexPath.section][indexPath.row]
            print("Selected: \(selectedSetting)")
            // Handle other settings actions here
        }
    }
}
