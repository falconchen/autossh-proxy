# autossh-proxy

基于 Docker 的 autossh SOCKS5 代理隧道，自动重连，持久运行。

## 快速开始

```bash
cp .env.example .env
# 编辑 .env 填入你的 SSH 服务器信息
docker compose up -d
```

## 配置

| 环境变量 | 默认值 | 说明 |
| --- | --- | --- |
| `SSH_HOST` | — | SSH 服务器地址 (**必填**) |
| `SSH_PORT` | `22` | SSH 端口 |
| `SSH_USER` | `root` | SSH 用户名 |
| `SOCKS_PORT` | `1280` | 本地 SOCKS5 代理端口 |
| `SSH_KEY_PATH` | `~/.ssh/id_rsa` | SSH 私钥路径 |
| `SSH_KNOWN_HOSTS` | `~/.ssh/known_hosts` | known_hosts 文件路径 |
| `SERVER_ALIVE_INTERVAL` | `30` | 保活间隔（秒） |
| `SERVER_ALIVE_COUNT_MAX` | `3` | 最大保活失败次数 |
| `STRICT_HOST_KEY_CHECKING` | `accept-new` | 主机密钥检查策略 |
| `SSH_EXTRA_OPTS` | — | 额外的 SSH 参数 |
| `AUTOSSH_GATETIME` | `60` | autossh 守护宽限期 |
| `AUTOSSH_MAXSTART` | `10` | autossh 最大重启次数 |

## 使用代理

代理运行在 `127.0.0.1:${SOCKS_PORT}`，例如：

```bash
curl --socks5-hostname localhost:1280 ip.fm
```
