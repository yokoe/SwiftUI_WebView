import SwiftUI
import WebKit

public struct WebView : UIViewRepresentable {
    var url: URL
    
    public init(url: URL) {
        self.url = url
    }
    
    public func makeCoordinator() -> WebView.Coordinator {
        return Coordinator()
    }

    public func makeUIView(context: Context) -> WKWebView  {
        let view = WKWebView(frame: .zero)
        view.navigationDelegate = context.coordinator
        return view
    }
    public func updateUIView(_ uiView: WKWebView, context: Context) {
        let req = URLRequest(url: url)
        uiView.load(req)
        
    }
}

extension WebView {
    public class Coordinator: NSObject, WKNavigationDelegate {
        public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if navigationAction.navigationType == WKNavigationType.linkActivated {
                guard let url = navigationAction.request.url else {
                    debugPrint("no url")
                    return
                }
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                decisionHandler(WKNavigationActionPolicy.cancel)
                return
            }
            decisionHandler(WKNavigationActionPolicy.allow)
        }
    }
}
