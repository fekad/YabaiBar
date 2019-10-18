//
//  AppDelegate.swift
//  YabaiBar
//
//  Created by Adam Fekete on 19/10/2019.
//  Copyright © 2019 fekad. All rights reserved.
//
//  Tutorials:
//  - https://8thlight.com/blog/casey-brant/2019/05/21/macos-menu-bar-extras.html
//  - https://www.youtube.com/watch?v=ii89L7LVAs4
//
//  Mandatory steps:
//  > Info.plist > Application is agent (UIElement) > YES
//  > YabaiBar.entitlements > App Sanbox: OFF

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var statusBarItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
      
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
            
            let statusBarMenu = NSMenu(title: "Cap Status Bar Menu")

            statusBarItem.button?.title = "❐"
            statusBarItem.menu = statusBarMenu

            statusBarMenu.addItem(
                withTitle: "Restart yabai",
                action: #selector(AppDelegate.restart_yabai),
                keyEquivalent: "")

            statusBarMenu.addItem(
                withTitle: "Stop yabai",
                action: #selector(AppDelegate.stop_yabai),
                keyEquivalent: "")

            statusBarMenu.addItem(NSMenuItem.separator())

            statusBarMenu.addItem(
                withTitle: "Edit .yabairc",
                action: #selector(AppDelegate.edit_yabai),
                keyEquivalent: "")
            
            statusBarMenu.addItem(
                withTitle: "Edit .skhdrc",
                action: #selector(AppDelegate.edit_skhd),
                keyEquivalent: "")
            
            statusBarMenu.addItem(NSMenuItem.separator())

            statusBarMenu.addItem(
                withTitle: "Exit",
                action: #selector(AppDelegate.exit),
                keyEquivalent: "")

    }
        
    @objc func restart_yabai(sender: NSMenuItem) {
        let path = "/usr/local/bin/brew"
        let arguments = ["services", "restart", "yabai"]

        let task = Process.launchedProcess(launchPath: path, arguments: arguments)
        task.waitUntilExit()
    }

    @objc func stop_yabai(sender: NSMenuItem) {
        let path = "/usr/local/bin/brew"
        let arguments = ["services", "stop", "yabai"]

        let task = Process.launchedProcess(launchPath: path, arguments: arguments)
        task.waitUntilExit()
    }
    
    @objc func edit_yabai(sender: NSMenuItem) {
        let path = "/usr/bin/open"
        let arguments = ["-t", NSHomeDirectory() + "/.config/yabai/yabairc"]

        let task = Process.launchedProcess(launchPath: path, arguments: arguments)
        task.waitUntilExit()
    }
    @objc func edit_skhd(sender: NSMenuItem) {
        let path = "/usr/bin/open"
        let arguments = ["-t", NSHomeDirectory() + "/.skhdrc"]

        let task = Process.launchedProcess(launchPath: path, arguments: arguments)
        task.waitUntilExit()
    }
     
    @objc func exit(sender: Any){
        NSApplication.shared.terminate(self)
    }


    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

