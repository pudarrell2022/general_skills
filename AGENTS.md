# AGENTS 指南（general_skills）

## 项目目标
本仓库用于维护一组可复用的本地 Skill，供 Codex/Agent 在仓库协作中调用。主要输入是用户意图（如自动提交、自动推送、初始化 Skill、更新 AGENTS 文档），主要输出是对应 Skill 的 `SKILL.md` 规范与 `agents/openai.yaml` 接口配置，以及可执行的同步脚本。

## 目录结构与职责
- `skills/<skill-name>/SKILL.md`：技能说明与执行流程（当前以中文为主）。
- `skills/<skill-name>/agents/openai.yaml`：技能在 Agent 侧的展示名、简介和默认提示词。
- `sync_skills.sh`：将仓库内 `skills/` 镜像同步到目标目录下的 `skills/`。
- `README.md`：英文项目说明与使用方式。

## 环境与依赖
- Shell：`sh`（脚本 shebang 为 `#!/usr/bin/env sh`）。
- 必要工具：`rsync`（用于同步，含 `--delete` 与 `--exclude` 参数）。
- 当前仓库未发现语言级依赖清单（如 `package.json`、`pyproject.toml`、`Makefile`）。

## 常用命令
- 查看技能文件：
  `rg --files skills`
- 默认同步到 `~/.agents/skills/`：
  `./sync_skills.sh`
- 同步到自定义根目录（实际目标为 `<dest>/skills/`）：
  `./sync_skills.sh /path/to/dest`

## 内容与命名约定
- Skill 目录名使用小写英文与短横线（如 `auto-commit`）。
- 每个 Skill 保持固定文件布局：`SKILL.md` + `agents/openai.yaml`。
- `SKILL.md` 顶部使用 frontmatter（`name`、`description`）。
- `agents/openai.yaml` 使用 `interface.display_name`、`short_description`、`default_prompt` 三项核心字段。

## 测试、提交流程与发布
- 当前仓库未发现自动化测试配置或 CI 配置；修改后至少应手动检查文档与脚本可读性。
- 提交流程建议遵循已有技能约定：可使用 `auto-commit` / `auto-push` 完成规范提交与推送。
- 当前仓库未发现发布脚本或版本发布流程定义。

## 安全与变更边界
- 运行 `sync_skills.sh` 会执行 `rsync --delete`，目标目录中多余文件会被删除；操作前确认目标路径。
- 脚本会忽略隐藏文件（`--exclude=".*"`），不要依赖隐藏文件作为同步产物。
- 更新文档时仅记录已验证的仓库事实，不写未落地的临时决策。
