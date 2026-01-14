# Debian Light Desktop & Web Access

This project provides a script to transform a minimal Debian installation into a lightweight workstation, ideal for old laptops and ZimaBlade devices. It features a local desktop environment and a web-based remote desktop (noVNC).

## 🛠 Tools & Components

| Tool | Purpose |
| :--- | :--- |
| **Openbox** | Ultra-lightweight window manager to save RAM. |
| **Xvfb** | Virtual framebuffer to run the desktop without needing a physical GPU. |
| **noVNC / Websockify** | Allows you to access your desktop via any web browser. |
| **Polybar / Rofi** | Modern and light taskbar and app launcher. |
| **Network Manager** | Handles Wi-Fi and Ethernet connections easily. |
| **Docker** | Container engine to run modern applications efficiently. |
| **CasaOS** | Simple web dashboard to manage Docker containers and files. |
| **Google Chrome** | Standard web browser for the desktop session. |
| **Antigravity** | Auto-updater tool for system maintenance. |

## 🚀 Installation

### 1. Initial Debian Setup
Install **Debian** using the netinst ISO. During the software selection, **uncheck** all desktop environments and only select:
* Standard system utilities
* SSH server

### 2. Run the Setup Script
Connect via SSH to your device and run these commands (replace `<username>` with your actual user):

```bash
# Switch to root to configure sudo
su -
apt update && apt upgrade -y
apt install sudo git -y
echo "<username> ALL=(ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/<username>
exit

# Clone and install
git clone https://github.com/OrtegaDaniel84/linux.git configs
chmod +x configs/*.sh
sh configs/setup.sh
```

## Accessing the Server
You can access your desktop and services through any web browser:

### Desktop Environment
URL: http://**<YOUR_IP>**:3000

#### Shortcuts:
- Ctrl + Space: Open Rofi (App Launcher).
- Ctrl + ↑ (Up): Maximize window.
- Ctrl + ↓ (Down): Restore or center window.
- Ctrl + ← (Left): Snap window to the left.
- Ctrl + → (Right): Snap window to the right.

### Management Dashboard
CasaOS: http://**<YOUR_IP>**:8080
