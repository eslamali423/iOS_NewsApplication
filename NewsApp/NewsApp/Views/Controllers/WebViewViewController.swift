//
//  WebViewViewController.swift
//  NewsApp
//
//  Created by Eslam Ali  on 21/07/2022.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {
    
    
    //MARK:- Vars
    private let webView : WKWebView = {
        let prefrences = WKWebpagePreferences()
        prefrences.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = prefrences
        
        let view = WKWebView(frame: .zero, configuration: configuration)
        return view
        
    }()
    
    private let url : URL
    
    init(url : URL, title: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        webView.load(URLRequest(url: url))
        configureButtons()

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    
    //MARK:- Configure NavBar Buttons
    private func configureButtons(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTabButton))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(didTabRefresh))

        navigationController?.navigationBar.tintColor = .systemPink

    }
    
    //MARK:- Button action
    @objc private func didTabButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTabRefresh(){
        webView.load(URLRequest(url: url))
    }
    
}
