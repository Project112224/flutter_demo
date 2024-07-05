//
//  CheckRoot.swift
//  Runner
//
//  Created by --- on 2024/1/19.
//

import Foundation
import Darwin
import UIKit

class CheckRoot {
    
    private let fm = FileManager.default
    
    var isRoot: Bool {
        return isCydiaAppInstalled() || canEditSandboxFilesForJailBreakDetecttion() || callApiFuntion()
    }
    
    var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
    
    private var filesPathToCheck: [String] {
        return [
            "/private/var/lib/apt",
            "/Applications/Cydia.app",
            "/private/var/lib/cydia",
            "/private/var/tmp/cydia.log",
            "/Applications/RockApp.app",
            "/Applications/Icy.app",
            "/Applications/WinterBoard.app",
            "/Applications/SBSetttings.app",
            "/Applications/blackra1n.app",
            "/Applications/IntelliScreen.app",
            "/Applications/Snoop-itConfig.app",
            "/usr/libexec/cydia/",
            "/usr/sbin/frida-server",
            "/usr/bin/cycript",
            "/usr/local/bin/cycript",
            "/usr/lib/libcycript.dylib",
            "/bin/sh",
            "/usr/libexec/sftp-server",
            "/usr/libexec/ssh-keysign",
            "/Library/MobileSubstrate/MobileSubstrate.dylib",
            "/bin/bash",
            "/usr/sbin/sshd",
            "/etc/apt",
            "/usr/bin/ssh",
            "/bin.sh",
            "/var/checkra1n.dmg",
            "/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
            "/System/Library/LaunchDaemons/com.ikey.bbot.plist",
            "/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
            "/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
            "/private/var/stash",
            "/etc/apt/sources.list",
            "/private/var/root/Library/MobileSubstrate",
            "/etc/apt/trusted.gpg.d/cydia.gpg",
            "/etc/sysctl.conf",
        ]
    }
    
    private func isCydiaAppInstalled() -> Bool {
        return UIApplication.shared.canOpenURL(URL(string: "cydia://")!)
    }
    
    private func canEditSandboxFilesForJailBreakDetecttion() -> Bool {
        let jailBreakTestText = "Test for JailBreak"
        do {
            try jailBreakTestText.write(
                toFile: "/private/jailBreakTestText.txt",
                atomically: true,
                encoding: String.Encoding.utf8
            )
            return true
        } catch {
            return false
        }
    }
    
    
    private func checklJailBrokenFiles() -> Bool {
        var checkFileIfExist: Bool = false
        filesPathToCheck.forEach {
            checkFileIfExist =  fm.fileExists(atPath: $0) ? true : false
            if checkFileIfExist{
                return
            }
        }
        return checkFileIfExist
    }
    
    private func callApiFuntion() -> Bool {
        let pid = getpgrp()
        return pid < 0
    }
}
