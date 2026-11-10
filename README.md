# AI 逆向工程工具链汇总

这是一个索引仓库，用来把 [@0xluffy_eth 在 2026 年 11 月 2 日发布的 REA 工具清单](https://x.com/0xluffy_eth/status/2117208910285435119) 里 18 个真实 GitHub 仓库的 fork 放在一起查看和下载。

GitHub 的 fork 必须各自独立成库，没法把 18 个上游项目真正合并成一个仓库。本仓库作为汇总入口：下面按五个逆向环节列出 fork 和上游地址；运行 `clone-all.sh` 可以把全部 fork 按环节克隆到本仓库目录里。

克隆本仓库后执行：

```bash
chmod +x clone-all.sh
./clone-all.sh
```

脚本默认拉取每个 fork 的默认分支。Ghidra、radare2、ILSpy 等仓库体积较大，首次克隆可能需要一些时间和磁盘空间。若某个目录已经存在，脚本会跳过，不会覆盖你的本地改动。

清单里另外两项——「REA 工作流」和「净室循环」——不是独立仓库，已包含在 [rea](https://github.com/cnbei/rea) fork 中：

- **REA 工作流**位于 `.agents/skills/reverse-engineer-anything/`（一份 `SKILL.md` 加若干参考文档）
- **净室循环**位于 `docs/specs/<功能名>/`，通常包含 `spec.md`、`plan.md`、`tasks.md`、`verification.md`

---

## 01 分析内核

- [rea](https://github.com/cnbei/rea) ← [morluto/rea](https://github.com/morluto/rea) — 用智能体做逆向，MCP 接口打通，从 App 行为到原生二进制。
- [ghidra](https://github.com/cnbei/ghidra) ← [NationalSecurityAgency/ghidra](https://github.com/NationalSecurityAgency/ghidra) — NSA 出品的免费软件逆向框架与反编译器。
- [GhidraMCP](https://github.com/cnbei/GhidraMCP) ← [LaurieWired/GhidraMCP](https://github.com/LaurieWired/GhidraMCP) — 让智能体直接操作 Ghidra 的 MCP Server。
- [ida-pro-mcp](https://github.com/cnbei/ida-pro-mcp) ← [mrexodia/ida-pro-mcp](https://github.com/mrexodia/ida-pro-mcp) — 把智能体接到 IDA Pro 上的 MCP 接口。

## 02 移动端与 App

- [jadx](https://github.com/cnbei/jadx) ← [skylot/jadx](https://github.com/skylot/jadx) — 把 Android APK 反编译回 Java。
- [Apktool](https://github.com/cnbei/Apktool) ← [iBotPeaches/Apktool](https://github.com/iBotPeaches/Apktool) — 拆开 APK 再重新打包。
- [frida](https://github.com/cnbei/frida) ← [frida/frida](https://github.com/frida/frida) — 在 App 运行时动态插桩、挂钩子。
- [ILSpy](https://github.com/cnbei/ILSpy) ← [icsharpcode/ILSpy](https://github.com/icsharpcode/ILSpy) — .NET 反编译器，支持 PDB、ReadyToRun 等。

## 03 二进制与底层

- [radare2](https://github.com/cnbei/radare2) ← [radareorg/radare2](https://github.com/radareorg/radare2) — 跑在终端里的 UNIX 风格逆向框架。
- [x64dbg](https://github.com/cnbei/x64dbg) ← [x64dbg/x64dbg](https://github.com/x64dbg/x64dbg) — Windows 用户态调试器，面向逆向场景。
- [ImHex](https://github.com/cnbei/ImHex) ← [WerWolv/ImHex](https://github.com/WerWolv/ImHex) — 带模式语言的十六进制编辑器。
- [angr](https://github.com/cnbei/angr) ← [angr/angr](https://github.com/angr/angr) — 二进制分析与符号执行引擎。

## 04 网络与运行

- [mitmproxy](https://github.com/cnbei/mitmproxy) ← [mitmproxy/mitmproxy](https://github.com/mitmproxy/mitmproxy) — 可交互的 TLS 流量拦截代理。
- [dnSpy](https://github.com/cnbei/dnSpy) ← [dnSpyEx/dnSpy](https://github.com/dnSpyEx/dnSpy) — .NET 调试与汇编编辑器的非官方续作（推文指向此仓库，而非已停止维护的 dnSpy/dnSpy）。
- [rizin](https://github.com/cnbei/rizin) ← [rizinorg/rizin](https://github.com/rizinorg/rizin) — radare2 的分支，UNIX 风格逆向框架。
- [raddebugger](https://github.com/cnbei/raddebugger) ← [EpicGames/raddebugger](https://github.com/EpicGames/raddebugger) — Epic Games 出品的原生、多进程图形调试器（旧地址 EpicGamesExt/raddebugger 已重定向到这里）。

## 05 重建与验证

- [awesome-ai-reverse-engineering](https://github.com/cnbei/awesome-ai-reverse-engineering) ← [zhuyansen/awesome-ai-reverse-engineering](https://github.com/zhuyansen/awesome-ai-reverse-engineering) — 面向编程智能体的 AI 逆向工具清单（推文所称的 122 项评分列表）。
- [awesome-reverse-engineering](https://github.com/cnbei/awesome-reverse-engineering) ← [morluto/awesome-reverse-engineering](https://github.com/morluto/awesome-reverse-engineering) — REA 作者亲自整理的逆向工具与学习资源清单。
- **REA 工作流**（非独立仓库）：见 [rea](https://github.com/cnbei/rea) 中的 `.agents/skills/reverse-engineer-anything/`。
- **净室循环**（非独立仓库）：见 [rea](https://github.com/cnbei/rea) 中的 `docs/specs/`。

---

说明：推文里部分 t.co 链接的展示文本被截断，以上地址已按可访问的完整仓库核对。`cnbei/rea` 在本次操作前已经存在，故未重复 fork。
