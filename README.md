# System Resources Saver (LowPriorityLock v3.4)

A lightweight Magisk module designed to reduce CPU usage by assigning low priority to background apps. It helps improve device battery life and thermal efficiency without affecting foreground performance.

---

## 🚀 Features

- Renice selected apps to lowest CPU priority (`nice = 19`)
- Configurable app list (`applist.txt`)
- Lightweight shell script – no daemons or binary dependencies
- Auto-runs at boot and every 2 minutes
- Optional logging and configuration via `.prop` files

---

## 🧠 How It Works

The module runs `renice` on selected app PIDs based on your list, making them less CPU-hungry. It's perfect for background-heavy apps like browsers, social media, or analytics.

---

## ⚙️ Configuration Files

| File | Purpose |
|------|--------|
| `applist.txt` | Package names of apps to renice |
| `priority_list.txt` | List of exact processes to target (optional) |
| `log_control.prop` | Enable/disable logging (`LOG_MODE=on/off`) |
| `config.prop` | Module settings (like interval, delay etc.) |

---

## 📂 File Structure


---

## 🛠️ Customization

- ✏️ Edit `applist.txt` to include app package names
- 🔄 Modify `config.prop` to change behavior (like delay, interval)
- 📜 Logs are saved only if `LOG_MODE=on`

---

## ✅ Compatibility

- Works on Android 9–15
- No BusyBox required
- Tested on Nothing OS / CMF 1 rooted device

---

## ⚠️ Notes

- This module doesn't interfere with foreground app priority.
- Use responsibly — overly aggressive renicing can cause background desyncs.
- Safe to uninstall anytime via Magisk Manager.

---

## 📥 Download

[Click here to download latest ZIP](https://t.me/+dcRSRcksU6VmMzhl)

---

## 🙏 Credits

Created by [UC YT OFFICIAL](https://www.youtube.com/@UCYT-OFFICIAL)  
Maintained with ❤️ by Zaki
