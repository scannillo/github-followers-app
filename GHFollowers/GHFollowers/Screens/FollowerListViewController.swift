//
//  FollowerListViewController.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/15/21.
//

import UIKit

class FollowerListViewController: UIViewController, UICollectionViewDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    enum CollectionViewSection {
        case main
    }
    
    var followers: [Follower] = []
    var filteredFollowers: [Follower] = []
    var username: String!
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<CollectionViewSection, Follower>!
    
    var page = 1
    var hasMoreFollowers = true
    
    override func viewDidLoad() {
        super.viewDidLoad()             // Table of contents for your VC
        configureViewControllerUI()
        configureCollectionView()
        configureDataSource()
        configureSearchController()
        getFollowers(page: page)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Layout UI
    
    func configureViewControllerUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCollectionViewCell.self, forCellWithReuseIdentifier: FollowerCollectionViewCell.reuseIdentifier)
        collectionView.delegate = self
    }
    
    func configureSearchController() {
        // TODO: Do we need a UISearchController here? Would a search bar work?
        // Do we need both delegates?
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for a username"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // MARK: - UISearchResultsUpdating
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, filter != "" else {
            return
        }
        
        filteredFollowers = followers.filter {$0.login.lowercased().contains(filter.lowercased())}
        updateData(followers: filteredFollowers)
    }
    
    // MARK: UISearchBarDelegate
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        updateData(followers: followers)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        updateData(followers: followers)
    }
        
    // MARK: DiffableDataSource
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCollectionViewCell.reuseIdentifier, for: indexPath) as! FollowerCollectionViewCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    func updateData(followers: [Follower]) {
        var snapshot = NSDiffableDataSourceSnapshot<CollectionViewSection, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    // MARK: - Helpers
    
    func getFollowers(page: Int) {
        showLoadingView()
        
        NetworkManager.shared.getFollowers(for: username, page: page) { [weak self] result in
            guard let self = self else { return } // unwrapping optional self

            DispatchQueue.main.async {
                self.hideLoadingView()
            }
                        
            switch result {
            case .success(let followers):
                if followers.count < 100 {
                    self.hasMoreFollowers = false
                }
                print("Followers count: \(followers.count)")
                print(followers)
                self.followers.append(contentsOf: followers)
                self.updateData(followers: self.followers)
            case .failure(let error):
                self.presentCustomAlertOnMainThread(title: "No followers found.", message: error.rawValue, buttonTitle: "Okay")
            }
        }
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let totalContentHeight = scrollView.contentSize.height
        let screenHeight = scrollView.frame.size.height
        
        if offsetY > totalContentHeight - screenHeight && hasMoreFollowers {
            page += 1
            getFollowers(page: page)
        }
    }
    
}
