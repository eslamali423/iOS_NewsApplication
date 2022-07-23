News App iOS Documentaion
-------------------------------------

1- MainTabBarViewController has 2 view controllers [ HomeViewController , HeadlinesViewController ]

2- HomeViewController contains a TableView with a customized HeaderView & customized tableViewCell

3 - HeaderView contains a searchBar & SettingsButton

4- SearchBar allows users to search about any articles and automaticly bind the tableView 

5 -  Did tap settingsButton opens SettingsViewController that you can change the language for tha whole App (Localization)

7 - Each cell in HomeTableView has specific  articles info that fetched form viewModel 

8 - didSelect cell navigate to newsDetailsViewController show all ditails in scrolable view
 
9-  HeadlinesViewController contains a collectionView for Top-Headlines 

10- didSelect a collectionViewCell opens webKit in app with with URL from response.

--------------------------------------------------------------------------

- MVVM as a architecture design pattern
- RxSwift: binding data and ui visual elements in any propagation of change
- Network Layer
- Alamofire with Generics Codable Models for parsing JSON
- SDWebImage
- NVActivityIndicatorView, ProgressHUD
- Presentable Intutative UI/UX
--------------------------------------------------------------------------
 PS:  you need to install pods to build & run the app 
