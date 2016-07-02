//
//  NUIRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 07/02/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIRenderer: NSObject {
    
    static var gInstance: NUIRenderer?
    
    var rerenderOnOrientationChange = true
    
    // MARK: - UIActivityIndicatorView
    static func renderActivityIndicator(activityIndicator: UIActivityIndicatorView) {
        NUIActivityIndicatorRenderer.render(activityIndicator, withClass: "ActivityIndicator")
    }
    
    static func renderActivityIndicator(activityIndicator: UIActivityIndicatorView, withClass className: String) {
        NUIActivityIndicatorRenderer.render(activityIndicator, withClass: className)
    }
    
    // MARK: - UIBarButtonItem
    static func renderBarButtonItem(item: UIBarButtonItem) {
        NUIBarButtonItemRenderer.render(item, withClass: "BarButton")
    }
    
    static func renderBarButtonItem(item: UIBarButtonItem, withClass className: String) {
        NUIBarButtonItemRenderer.render(item, withClass: className)
    }
    
    // MARK: - UIButton
    static func renderButton(button: UIButton) {
        NUIButtonRenderer.render(button, withClass: "Button")
    }
    
    static func renderButton(button: UIButton, withClass className: String) {
        NUIButtonRenderer.render(button, withClass: className)
    }
    
    // MARK - UIControl
    static func renderControl(control: UIControl) {
        NUIControlRenderer.render(control, withClass: "Control")
    }
    
    static func renderControl(control: UIControl, withClass className: String) {
        NUIControlRenderer.render(control, withClass: className)
    }
    
    // MARK: - UILabel
    static func renderLabel(label: UILabel) {
        NUILabelRenderer.render(label, withClass: "label")
    }
    
    static func renderLabel(label: UILabel, withClass className: String) {
        NUILabelRenderer.render(label, withClass: className)
    }
    
    static func renderLabel(label: UILabel, withClass className: String, withSuffix suffix: String) {
        NUILabelRenderer.render(label, withClass: className, withSuffix: suffix)
    }
    
    // MARK: - UINavigationBar
    static func renderNavigationBar(bar: UINavigationBar) {
        NUINavigationBarRenderer.render(bar, withClass: "NavigationBar")
    }
    
    static func renderNavigationBar(bar: UINavigationBar, withClass className: String) {
        NUINavigationBarRenderer.render(bar, withClass: className)
    }
    
    // MARK: - UIProgressView
    static func renderProgressView(progressView: UIProgressView) {
        NUIProgressViewRenderer.render(progressView, withClass: "ProgressView")
    }
    
    static func renderProgressView(progressView: UIProgressView, withClass className: String) {
        NUIProgressViewRenderer.render(progressView, withClass: className)
    }
    
    
    // MARK: - UINavigationItem
    static func renderNavigationItem(item: UINavigationItem) {
        NUINavigationItemRenderer.render(item, withClass: "NavigationBar")
    }
    
    static func renderNavigationItem(item: UINavigationItem, withClass className: String) {
        NUINavigationItemRenderer.render(item, withClass: className)
    }
    
    // MARK: - UISearchBar
    static func renderSearchBar(bar: UISearchBar) {
        NUISearchBarRenderer.render(bar, withClass: "SearchBar")
    }
    
    static func renderSearchBar(bar: UISearchBar, withClass className: String) {
        NUISearchBarRenderer.render(bar, withClass: className)
    }
    
    // MARK: - UISegmentedControl
    static func renderSegmentedControl(control: UISegmentedControl) {
        NUISegmentedControlRenderer.render(control, withClass: "SegmentedControl")
    }
    
    static func renderSegmentedControl(control: UISegmentedControl, withClass className: String) {
        NUISegmentedControlRenderer.render(control, withClass: className)
    }
    
    // MARK: - UISlider
    static func renderSlider(slider: UISlider) {
        NUISliderRenderer.render(slider, withClass: "Slider")
    }
    
    static func renderSlider(slider: UISlider, withClass className: String) {
        NUISliderRenderer.render(slider, withClass: className)
    }
    
    // MARK: - UISwitch
    static func renderSwitch(uiSwitch: UISwitch) {
        NUISwitchRenderer.render(uiSwitch, withClass: "Switch")
    }
    
    static func renderSwitch(uiSwitch: UISwitch, withClass className: String) {
        NUISwitchRenderer.render(uiSwitch, withClass: className)
    }
    
    // MARK: - UIPageControl
    static func renderPageControl(pageControl: UIPageControl) {
        NUIPageControlRenderer.render(pageControl, withClass: "PageControl")
    }
    
    static func renderPageControl(pageControl: UIPageControl, withClass className: String) {
        NUIPageControlRenderer.render(pageControl, withClass: className)
    }
    
    // MARK: - UITabBar
    static func renderTabBar(bar: UITabBar) {
        NUITabBarRenderer.render(bar, withClass: "TabBar")
    }
    
    static func renderTabBar(bar: UITabBar, withClass className: String) {
        NUITabBarRenderer.render(bar, withClass: className)
    }
    
    // MARK: - UITabBarItem
    static func renderTabBarItem(item: UITabBarItem) {
        NUITabBarItemRenderer.render(item, withClass: "TabBarItem")
    }
    
    static func renderTabBarItem(item: UITabBarItem, withClass className: String) {
        NUITabBarItemRenderer.render(item, withClass: className)
    }
    
    // MARK: - UITableView
    static func renderTableView(tableView: UITableView) {
        NUITableViewRenderer.render(tableView, withClass: "TableView")
    }
    
    static func renderTableView(tableView: UITableView, withClass className: String) {
        NUITableViewRenderer.render(tableView, withClass: className)
    }
    
    // MARK: - UITableViewCell
    static func renderTableViewCell(cell: UITableViewCell) {
        NUITableViewCellRenderer.render(cell, withClass: "TableCell")
    }
    
    static func renderTableViewCell(cell: UITableViewCell, withClass className: String) {
        NUITableViewCellRenderer.render(cell, withClass: className)
    }
    
    // MARK: - UIToolbar
    static func renderToolbar(bar: UIToolbar) {
        NUIToolbarRenderer.render(bar, withClass: "Toolbar")
    }
    
    static func renderToolbar(bar: UIToolbar, withClass className: String) {
        NUIToolbarRenderer.render(bar, withClass: className)
    }
    
    // MARK: - UITextField
    static func renderTextField(textField: UITextField) {
        NUITextFieldRenderer.render(textField, withClass: "TextField")
    }
    
    static func renderTextField(textField: UITextField, withClass className: String) {
        NUITextFieldRenderer.render(textField, withClass: className)
    }
    
    // MARK: - UITextView
    static func renderTextView(textView: UITextView) {
        NUITextViewRenderer.render(textView, withClass: "TextView")
    }
    
    static func renderTextView(textView: UITextView, withClass className: String) {
        NUITextViewRenderer.render(textView, withClass: className)
    }
    
    // MARK: - UIView
    static func renderView(view: UIView) {
        NUIViewRenderer.render(view, withClass: "View")
    }
    
    static func renderView(view: UIView, withClass className: String) {
        NUIViewRenderer.render(view, withClass: className)
    }
    
    static func renderView(view: UIView, withClass className: String, withSuffix suffix: String) {
        NUIViewRenderer.render(view, withClass: className, withSuffix: suffix)
    }
    
    // MARK: - UIWindow
    static func renderWindow(window: UIWindow) {
        NUIWindowRenderer.render(window, withClass: "Window")
    }
    
    static func renderWindow(window: UIWindow, withClass className: String) {
        NUIWindowRenderer.render(window, withClass: className)
    }
    
    // MARK: - Text Transform
    static func needsTextTransformWithClass(className: String) -> Bool {
        return NUILabelRenderer.needsTextTransformWithClass(className)
    }
    
    static func transformText(text: String, withClass className: String) -> String {
        return NUILabelRenderer.transformText(text, withClass: className)
    }
    
    static func transformAttributedText(text: NSAttributedString, withClass className: String) -> NSAttributedString {
        return NUILabelRenderer.transformAttributedText(text, withClass: className)
    }
    
    // MARK: - Size Change
    static func sizeDidChangeForNavigationBar(bar: UINavigationBar) {
        NUINavigationBarRenderer.sizeDidChange(bar)
    }
    
    static func sizeDidChangeForTabBar(bar: UITabBar) {
        NUITabBarRenderer.sizeDidChange(bar)
    }
    
    static func sizeDidChangeForTableViewCell(cell: UITableViewCell) {
        NUITableViewCellRenderer.sizeDidChange(cell)
    }
    
    static func sizeDidChangeForTableView(tableView: UITableView) {
        NUITableViewRenderer.sizeDidChange(tableView)
    }
    
    // MARK: - Orientation Observers
    static func addOrientationDidChangeObserver(observer: AnyObject) {
        NSNotificationCenter.defaultCenter().addObserver(observer,
                                                         selector: #selector(orientationDidChange),
                                                         name: UIApplicationDidChangeStatusBarOrientationNotification,
                                                         object: nil)
    }
    
    static func removeOrientationDidChangeObserver(observer: AnyObject) {
        NSNotificationCenter.defaultCenter().removeObserver(observer,
                                                            name: UIApplicationDidChangeStatusBarOrientationNotification,
                                                            object: nil)
    }
    
    // MARK: - Rerendering
    static func rerender() {
        
        for window in UIApplication.sharedApplication().windows {
            
            let rootView = window.rootViewController?.view
            
            if let rootView = rootView {
                rerenderView(rootView)
            }
        }
    }
    
    static func rerenderView(view: UIView) {
        
        for subview in view.subviews {
            rerenderView(subview)
        }
        
        view.applyNUI()
        
        if view.isFirstResponder() {
            
            let inputAccessoryView = view.inputAccessoryView
            
            if let inputAccessoryView = inputAccessoryView {
                rerenderView(inputAccessoryView)
            }
        }
    }
    
    // MARK: - Other
    
    static func setRerenderOnOrientationChange(rerender: Bool) {
        
        let instance = getInstance()
        
        if instance.rerenderOnOrientationChange != rerender {
            
            instance.rerenderOnOrientationChange = rerender
            
            if rerender {
                addOrientationDidChangeObserver(self)
            } else {
                removeOrientationDidChangeObserver(self)
            }
        }
        
    }
    
    static func getInstance() -> NUIRenderer {
        
        let rendererQueue = dispatch_queue_create("com.NUI.NUIRendererQueue", nil)
        dispatch_sync(rendererQueue) { 
            
            if gInstance == nil {
                
                gInstance = NUIRenderer()
                
                if NUISettings.autoUpdateIsEnabled() {
                    
                    NUIFileMonitor.watch(NUISettings.autoUpdatePath()) {
                        dispatch_async(dispatch_get_main_queue()) {
                            stylesheetFileChanged()
                        }
                    }
                }
            }
        }
        
        return gInstance!
    }
    
    static func orientationDidChange(notification: NSNotification) {
        
        let orientation = UIApplication.sharedApplication().statusBarOrientation
        let didReload = NUISettings.reloadStylesheetsOnOrientationChange(orientation)
        
        if didReload {
            rerender()
        }
    }
    
    static func stylesheetFileChanged() {
        
        NUISettings.loadStylesheetByPath(NUISettings.autoUpdatePath())
        rerender()
        CATransaction.flush()
    }
}
