//
//  FavoriteViewController.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 23/11/24.
//
import UIKit

class FavoriteViewController: UIViewController {
    
    private let viewModel: FavoriteViewModel
    private var favoriteSongs: [String] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView
            .register(
                UITableViewCell.self,
                forCellReuseIdentifier: "cell"
        )
        
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    init(viewModel: FavoriteViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFavorites()
    }
    
    private func setupUI() {
        title = "Favorite"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func loadFavorites() {
        favoriteSongs = viewModel.getFavoriteSongs()
        tableView.reloadData()
    }
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteSongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = favoriteSongs[indexPath.row]
        return cell
    }
}
