News App iOS Documentaion
-------------------------------------

1- MainTabBarViewController has 2 view controllers [ HomeViewController , HeadlinesViewController ]

2- HomeViewController contains a TableView with a customized HeaderView & customized tableViewCell

3 - HeaderView contains a searchBar & SettingsButton

4- SearchBar allows users to search for any articles and automatically bind the tableView 

5 - Tap the settings button opens SettingsViewController so that you can change the language for the whole App (Localization)

7 - Each cell in HomeTableView has specific  articles info that is fetched from ViewModel 

8 - did select cell navigate to newsDetailsViewController show all details in a scrollable view
 
9-  HeadlinesViewController contains a collectionView for Top-Headlines 

10- Selecting a collection view cell opens WebKit in the app with the URL from the response.

--------------------------------------------------------------------------

- MVVM as a architecture design pattern
- RxSwift: binding data and UI visual elements in any propagation of change
- Network Layer
- Alamofire with Generics Codable Models for parsing JSON
- SDWebImage
- NVActivityIndicatorView, ProgressHUD
- Presentable Intutative UI/UX
--------------------------------------------------------------------------
 PS:  you need to install pods to build & run the app 
