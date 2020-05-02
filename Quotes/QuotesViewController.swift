//
//  QuotesViewController.swift
//  Quotes
//
//  Created by Ben Godfrey on 5/2/20.
//  Copyright © 2020 Ben Godfrey. All rights reserved.
//

import Cocoa

class QuotesViewController: NSViewController {
    @IBOutlet weak var textLabel: NSTextField!
    
    var quotes = Quote.all
    var currentQuoteIndex: Int = 0 {
        didSet {
            updateQuote()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        currentQuoteIndex = 0
    }
    
    func updateQuote() {
        textLabel.stringValue = String(describing: quotes[currentQuoteIndex])
    }
    
    @IBAction func previous(_ sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex - 1 + quotes.count) % quotes.count
    }
    
    @IBAction func next(_ sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
    }
    
    @IBAction func quit(_ sender: NSButton) {
        NSApplication.shared.terminate(sender)
    }
}

extension QuotesViewController {
    static func freshController() -> QuotesViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(stringLiteral: "Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier(stringLiteral: "QuotesViewController")
        
        guard let viewController = storyboard.instantiateController(withIdentifier: identifier) as? QuotesViewController else {
            fatalError("QuotesViewController not found. Check storyboard file.")
        }
        
        return viewController
    }
}
