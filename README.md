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
git clone [https://github.com/OrtegaDaniel84/linux.git](https://github.com/OrtegaDaniel84/linux.git) configs
cd configs
chmod +x setup.sh install_apps.sh
sh setup.sh
```

## Access
You can connect to your server now using the browser:
* Desctop: http://**IP**:3000
 * Ctrl + Space     → Lanzador Rofi (apps)
 * Ctrl + ↑ (Up)    → Maximiza ventana
 * Ctrl + ↓ (Down)  → Restaura/centra ventana

- CasaOS : http://**IP**:8080
