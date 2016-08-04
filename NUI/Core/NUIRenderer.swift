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
    static func renderActivityIndicator(_ activityIndicator: UIActivityIndicatorView) {
        NUIActivityIndicatorRenderer.render(activityIndicator, withClass: "ActivityIndicator")
    }
    
    static func renderActivityIndicator(_ activityIndicator: UIActivityIndicatorView, withClass className: String) {
        NUIActivityIndicatorRenderer.render(activityIndicator, withClass: className)
    }
    
    // MARK: - UIBarButtonItem
    static func renderBarButtonItem(_ item: UIBarButtonItem) {
        NUIBarButtonItemRenderer.render(item, withClass: "BarButton")
    }
    
    static func renderBarButtonItem(_ item: UIBarButtonItem, withClass className: String) {
        NUIBarButtonItemRenderer.render(item, withClass: className)
    }
    
    // MARK: - UIButton
    static func renderButton(_ button: UIButton) {
        NUIButtonRenderer.render(button, withClass: "Button")
    }
    
    static func renderButton(_ button: UIButton, withClass className: String) {
        NUIButtonRenderer.render(button, withClass: className)
    }
    
    // MARK - UIControl
    static func renderControl(_ control: UIControl) {
        NUIControlRenderer.render(control, withClass: "Control")
    }
    
    static func renderControl(_ control: UIControl, withClass className: String) {
        NUIControlRenderer.render(control, withClass: className)
    }
    
    // MARK: - UILabel
    static func renderLabel(_ label: UILabel) {
        NUILabelRenderer.render(label, withClass: "label")
    }
    
    static func renderLabel(_ label: UILabel, withClass className: String) {
        NUILabelRenderer.render(label, withClass: className)
    }
    
    static func renderLabel(_ label: UILabel, withClass className: String, withSuffix suffix: String) {
        NUILabelRenderer.render(label, withClass: className, withSuffix: suffix)
    }
    
    // MARK: - UINavigationBar
    static func renderNavigationBar(_ bar: UINavigationBar) {
        NUINavigationBarRenderer.render(bar, withClass: "NavigationBar")
    }
    
    static func renderNavigationBar(_ bar: UINavigationBar, withClass className: String) {
        NUINavigationBarRenderer.render(bar, withClass: className)
    }
    
    // MARK: - UIProgressView
    static func renderProgressView(_ progressView: UIProgressView) {
        NUIProgressViewRenderer.render(progressView, withClass: "ProgressView")
    }
    
    static func renderProgressView(_ progressView: UIProgressView, withClass className: String) {
        NUIProgressViewRenderer.render(progressView, withClass: className)
    }
    
    
    // MARK: - UINavigationItem
    static func renderNavigationItem(_ item: UINavigationItem) {
        NUINavigationItemRenderer.render(item, withClass: "NavigationBar")
    }
    
    static func renderNavigationItem(_ item: UINavigationItem, withClass className: String) {
        NUINavigationItemRenderer.render(item, withClass: className)
    }
    
    // MARK: - UISearchBar
    static func renderSearchBar(_ bar: UISearchBar) {
        NUISearchBarRenderer.render(bar, withClass: "SearchBar")
    }
    
    static func renderSearchBar(_ bar: UISearchBar, withClass className: String) {
        NUISearchBarRenderer.render(bar, withClass: className)
    }
    
    // MARK: - UISegmentedControl
    static func renderSegmentedControl(_ control: UISegmentedControl) {
        NUISegmentedControlRenderer.render(control, withClass: "SegmentedControl")
    }
    
    static func renderSegmentedControl(_ control: UISegmentedControl, withClass className: String) {
        NUISegmentedControlRenderer.render(control, withClass: className)
    }
    
    // MARK: - UISlider
    static func renderSlider(_ slider: UISlider) {
        NUISliderRenderer.render(slider, withClass: "Slider")
    }
    
    static func renderSlider(_ slider: UISlider, withClass className: String) {
        NUISliderRenderer.render(slider, withClass: className)
    }
    
    // MARK: - UISwitch
    static func renderSwitch(_ uiSwitch: UISwitch) {
        NUISwitchRenderer.render(uiSwitch, withClass: "Switch")
    }
    
    static func renderSwitch(_ uiSwitch: UISwitch, withClass className: String) {
        NUISwitchRenderer.render(uiSwitch, withClass: className)
    }
    
    // MARK: - UIPageControl
    static func renderPageControl(_ pageControl: UIPageControl) {
        NUIPageControlRenderer.render(pageControl, withClass: "PageControl")
    }
    
    static func renderPageControl(_ pageControl: UIPageControl, withClass className: String) {
        NUIPageControlRenderer.render(pageControl, withClass: className)
    }
    
    // MARK: - UITabBar
    static func renderTabBar(_ bar: UITabBar) {
        NUITabBarRenderer.render(bar, withClass: "TabBar")
    }
    
    static func renderTabBar(_ bar: UITabBar, withClass className: String) {
        NUITabBarRenderer.render(bar, withClass: className)
    }
    
    // MARK: - UITabBarItem
    static func renderTabBarItem(_ item: UITabBarItem) {
        NUITabBarItemRenderer.render(item, withClass: "TabBarItem")
    }
    
    static func renderTabBarItem(_ item: UITabBarItem, withClass className: String) {
        NUITabBarItemRenderer.render(item, withClass: className)
    }
    
    // MARK: - UITableView
    static func renderTableView(_ tableView: UITableView) {
        NUITableViewRenderer.render(tableView, withClass: "TableView")
    }
    
    static func renderTableView(_ tableView: UITableView, withClass className: String) {
        NUITableViewRenderer.render(tableView, withClass: className)
    }
    
    // MARK: - UITableViewCell
    static func renderTableViewCell(_ cell: UITableViewCell) {
        NUITableViewCellRenderer.render(cell, withClass: "TableCell")
    }
    
    static func renderTableViewCell(_ cell: UITableViewCell, withClass className: String) {
        NUITableViewCellRenderer.render(cell, withClass: className)
    }
    
    // MARK: - UIToolbar
    static func renderToolbar(_ bar: UIToolbar) {
        NUIToolbarRenderer.render(bar, withClass: "Toolbar")
    }
    
    static func renderToolbar(_ bar: UIToolbar, withClass className: String) {
        NUIToolbarRenderer.render(bar, withClass: className)
    }
    
    // MARK: - UITextField
    static func renderTextField(_ textField: UITextField) {
        NUITextFieldRenderer.render(textField, withClass: "TextField")
    }
    
    static func renderTextField(_ textField: UITextField, withClass className: String) {
        NUITextFieldRenderer.render(textField, withClass: className)
    }
    
    // MARK: - UITextView
    static func renderTextView(_ textView: UITextView) {
        NUITextViewRenderer.render(textView, withClass: "TextView")
    }
    
    static func renderTextView(_ textView: UITextView, withClass className: String) {
        NUITextViewRenderer.render(textView, withClass: className)
    }
    
    // MARK: - UIView
    static func renderView(_ view: UIView) {
        NUIViewRenderer.render(view, withClass: "View")
    }
    
    static func renderView(_ view: UIView, withClass className: String) {
        NUIViewRenderer.render(view, withClass: className)
    }
    
    static func renderView(_ view: UIView, withClass className: String, withSuffix suffix: String) {
        NUIViewRenderer.render(view, withClass: className, withSuffix: suffix)
    }
    
    // MARK: - UIWindow
    static func renderWindow(_ window: UIWindow) {
        NUIWindowRenderer.render(window, withClass: "Window")
    }
    
    static func renderWindow(_ window: UIWindow, withClass className: String) {
        NUIWindowRenderer.render(window, withClass: className)
    }
    
    // MARK: - Text Transform
    static func needsTextTransformWithClass(_ className: String) -> Bool {
        return NUILabelRenderer.needsTextTransformWithClass(className)
    }
    
    static func transformText(_ text: String, withClass className: String) -> String {
        return NUILabelRenderer.transformText(text, withClass: className)
    }
    
    static func transformAttributedText(_ text: NSAttributedString, withClass className: String) -> NSAttributedString {
        return NUILabelRenderer.transformAttributedText(text, withClass: className)
    }
    
    // MARK: - Size Change
    static func sizeDidChangeForNavigationBar(_ bar: UINavigationBar) {
        NUINavigationBarRenderer.sizeDidChange(bar)
    }
    
    static func sizeDidChangeForTabBar(_ bar: UITabBar) {
        NUITabBarRenderer.sizeDidChange(bar)
    }
    
    static func sizeDidChangeForTableViewCell(_ cell: UITableViewCell) {
        NUITableViewCellRenderer.sizeDidChange(cell)
    }
    
    static func sizeDidChangeForTableView(_ tableView: UITableView) {
        NUITableViewRenderer.sizeDidChange(tableView)
    }
    
    // MARK: - Orientation Observers
    static func addOrientationDidChangeObserver(_ observer: AnyObject) {
        NotificationCenter.default.addObserver(observer,
                                                         selector: #selector(orientationDidChange),
                                                         name: NSNotification.Name.UIApplicationDidChangeStatusBarOrientation,
                                                         object: nil)
    }
    
    static func removeOrientationDidChangeObserver(_ observer: AnyObject) {
        NotificationCenter.default.removeObserver(observer,
                                                            name: NSNotification.Name.UIApplicationDidChangeStatusBarOrientation,
                                                            object: nil)
    }
    
    // MARK: - Rerendering
    static func rerender() {
        
        for window in UIApplication.shared.windows {
            
            let rootView = window.rootViewController?.view
            
            if let rootView = rootView {
                rerenderView(rootView)
            }
        }
    }
    
    static func rerenderView(_ view: UIView) {
        
        for subview in view.subviews {
            rerenderView(subview)
        }
        
        view.applyNUI()
        
        if view.isFirstResponder {
            
            let inputAccessoryView = view.inputAccessoryView
            
            if let inputAccessoryView = inputAccessoryView {
                rerenderView(inputAccessoryView)
            }
        }
    }
    
    // MARK: - Other
    
    static func setRerenderOnOrientationChange(_ rerender: Bool) {
        
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

        let rendererQueue = DispatchQueue(label: "com.NUI.NUIRendererQueue")
        rendererQueue.sync { 
            
            if gInstance == nil {
                
                gInstance = NUIRenderer()
                
                if NUISettings.autoUpdateIsEnabled() {
                    
                    NUIFileMonitor.watch(NUISettings.autoUpdatePath()!) {
                        DispatchQueue.main.async {
                            stylesheetFileChanged()
                        }
                    }
                }
            }
        }
        
        return gInstance!
    }
    
    static func orientationDidChange(_ notification: Notification) {
        
        let orientation = UIApplication.shared.statusBarOrientation
        let didReload = NUISettings.reloadStylesheetsOnOrientationChange(orientation)
        
        if didReload {
            rerender()
        }
    }
    
    static func stylesheetFileChanged() {
        
        NUISettings.loadStylesheetByPath(NUISettings.autoUpdatePath()!)
        rerender()
        CATransaction.flush()
    }
}
