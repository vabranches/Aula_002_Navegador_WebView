import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {
    
    //MARK: OUTLETS
    @IBOutlet weak var textFieldEndereco: UITextField!
    @IBOutlet weak var minhaWebView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: URL E REQUEST
        let stringURL = "http://google.com.br"
        let URLSite = Foundation.URL(string: stringURL)
        let urlRequestSite = URLRequest(url: URLSite!)
        minhaWebView.loadRequest(urlRequestSite)
        
        textFieldEndereco.text = stringURL

        //MARK: DELEGATE
        minhaWebView.delegate = self
        textFieldEndereco.delegate = self
    }
    
    //MARK: METODOS DE UIRESPONDER
    
    //MARK: ACTIONS
    @IBAction func pararPagina(_ sender: UIButton) {
        minhaWebView.stopLoading()
    }
    
    @IBAction func recarregarPagina(_ sender: UIButton) {
        minhaWebView.reload()
    }
    
    @IBAction func voltarPagina(_ sender: UIButton) {
        if minhaWebView.canGoBack{
            minhaWebView.goBack()
        }
    }
    
    @IBAction func avancarPagina(_ sender: UIButton) {
        if minhaWebView.canGoForward{
            minhaWebView.goForward()
        }
    }
    
    @IBAction func home(_ sender: UIButton) {
        let stringURL = "http://google.com.br"
        let URLSite = Foundation.URL(string: stringURL)
        let urlRequestSite = URLRequest(url: URLSite!)
        
        minhaWebView.loadRequest(urlRequestSite)
    }
    
    //MARK: METODOS DE TEXTFIELD DELEGATE
    override var canBecomeFirstResponder: Bool{
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldEndereco.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let URLSite = Foundation.URL(string: "http://" + textFieldEndereco.text!)
        let urlRequestSite = URLRequest(url: URLSite!)
        minhaWebView.loadRequest(urlRequestSite)
        
        textFieldEndereco.resignFirstResponder() //Perde o foco
        return true
    }
    
    //MARK: METODOS DE WEBVIEW DELEGATE
    func webViewDidFinishLoad(_ webView: UIWebView) {
        let urlAtual = minhaWebView.request?.mainDocumentURL?.absoluteString
        textFieldEndereco.text = urlAtual
    }
    
    


}

