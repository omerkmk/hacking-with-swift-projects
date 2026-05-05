//
//  DetailViewController.swift
//  Project7
//
//  Created by ömer kumek on 24.04.2026.
//


import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
        body {
            font-size: 150%;
            font-family: -apple-system;
            line-height: 1.5;
            padding: 20px;
        }
        h1 {
            font-size: 130%;
        }
        </style>
        </head>
        <body>
        <h1>\(detailItem.title)</h1>
        <p><strong>Signatures:</strong> \(detailItem.signatureCount)</p>
        <p>\(detailItem.body)</p>
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
    }
}
