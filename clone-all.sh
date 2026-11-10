#!/usr/bin/env bash
# Clone every fork listed in this hub into stage folders.
# Usage: ./clone-all.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"

clone_one() {
  local dir="$1"
  local url="$2"
  if [[ -d "$dir/.git" ]]; then
    echo "skip (already exists): $dir"
    return 0
  fi
  if [[ -e "$dir" ]]; then
    echo "error: $dir exists but is not a git repo" >&2
    return 1
  fi
  mkdir -p "$(dirname "$dir")"
  echo "cloning $url -> $dir"
  git clone --single-branch "$url" "$dir"
}

echo "==> 01 分析内核"
clone_one "01-分析内核/rea" "https://github.com/cnbei/rea.git"
clone_one "01-分析内核/ghidra" "https://github.com/cnbei/ghidra.git"
clone_one "01-分析内核/GhidraMCP" "https://github.com/cnbei/GhidraMCP.git"
clone_one "01-分析内核/ida-pro-mcp" "https://github.com/cnbei/ida-pro-mcp.git"

echo "==> 02 移动端与 App"
clone_one "02-移动端与App/jadx" "https://github.com/cnbei/jadx.git"
clone_one "02-移动端与App/Apktool" "https://github.com/cnbei/Apktool.git"
clone_one "02-移动端与App/frida" "https://github.com/cnbei/frida.git"
clone_one "02-移动端与App/ILSpy" "https://github.com/cnbei/ILSpy.git"

echo "==> 03 二进制与底层"
clone_one "03-二进制与底层/radare2" "https://github.com/cnbei/radare2.git"
clone_one "03-二进制与底层/x64dbg" "https://github.com/cnbei/x64dbg.git"
clone_one "03-二进制与底层/ImHex" "https://github.com/cnbei/ImHex.git"
clone_one "03-二进制与底层/angr" "https://github.com/cnbei/angr.git"

echo "==> 04 网络与运行"
clone_one "04-网络与运行/mitmproxy" "https://github.com/cnbei/mitmproxy.git"
clone_one "04-网络与运行/dnSpy" "https://github.com/cnbei/dnSpy.git"
clone_one "04-网络与运行/rizin" "https://github.com/cnbei/rizin.git"
clone_one "04-网络与运行/raddebugger" "https://github.com/cnbei/raddebugger.git"

echo "==> 05 重建与验证"
clone_one "05-重建与验证/awesome-ai-reverse-engineering" "https://github.com/cnbei/awesome-ai-reverse-engineering.git"
clone_one "05-重建与验证/awesome-reverse-engineering" "https://github.com/cnbei/awesome-reverse-engineering.git"

echo "done. REA workflow: 01-分析内核/rea/.agents/skills/reverse-engineer-anything/"
echo "      clean-room loop: 01-分析内核/rea/docs/specs/"
