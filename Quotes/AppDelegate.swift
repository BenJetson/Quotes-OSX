//
//  AppDelegate.swift
//  Quotes
//
//  Created by Ben Godfrey on 5/2/20.
//  Copyright © 2020 Ben Godfrey. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    let popover = NSPopover()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named: NSImage.Name("StatusBarButtonImage"))
            button.action = #selector(togglePopover(_:))
        }
        
        // constructMenu()
        
        popover.contentViewController = QuotesViewController.freshController()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

//    func constructMenu() {
//        let menu = NSMenu()
//
//        menu.addItem(NSMenuItem(title: "Print Quote",
//                                action: #selector(AppDelegate.togglePopover(_:)),
//                                keyEquivalent: "P"))
//        menu.addItem(NSMenuItem.separator())
//        menu.addItem(NSMenuItem(title: "Quit Quotes",
//                                action: #selector(NSApplication.terminate(_:)),
//                                keyEquivalent: "q"))
//
//        statusItem.menu = menu
//    }
    
    func showPopover(sender: Any?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    
    func hidePopover(sender: Any?) {
        popover.performClose(sender)
    }
    
    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            hidePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
}

