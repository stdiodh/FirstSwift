//
//  ViewController.swift
//  webView
//
//  Created by DH on 5/2/24.
// 블로그 과제 : HTML, XML 언어 정리, site들 가고싶은 회사, 여행 장소

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebpage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.navigationDelegate = self
        loadWebpage("https://blog.naver.com/stdio_dh")
        // Do any additional setup after loading the view.
    }
    
    
    //버튼 클릭시 해당 URL로 이동
    @IBAction func btnGotoSite1(_ sender: UIBarButtonItem) {
        loadWebpage("https://blog.naver.com/stdio_dh")
    }
    @IBAction func btnGotoSite2(_ sender: UIBarButtonItem) {
        loadWebpage("https://github.com/stdiodh")
    }
    
    @IBAction func btnGotoSite3(_ sender: UIBarButtonItem) {
        loadWebpage("https://toss.im/career")
    }
    
    @IBAction func btnGotoSite4(_ sender: UIBarButtonItem) {
        loadWebpage("https://www.nytimes.com/")
    }
    
    
    @IBAction func btnLoadHtmlString(_ sender: UIBarButtonItem) {
        let htmlString = "<h1> HTML String </h1><p>String 변수를 이용한 홈페이지<br><a href=\"https://www.induk.ac.kr\">induk대 홈페이지로 이동</a></p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIBarButtonItem) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func checkUrl(_ url: String) -> String{
        var strUrl = url
        let flag = strUrl.hasPrefix("http:\\")
        if !flag{
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebpage(myUrl)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

