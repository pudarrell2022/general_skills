---
name: init-skill
description: 按统一规范生成新的 Skill 目录与模板文件。用于用户要求“创建 Skill”“初始化 Skill”“生成 SKILL.md 与 agents/openai.yaml”或显式调用 $init-skill 时。
---

# Init Skill

## 目标

按用户要求初始化一个可直接使用的 Skill 目录，确保命名、文件结构、YAML 头和 Agent 配置格式一致，减少后续手工修正。

## 执行流程

1. 规范化技能名
- 将用户给定名称转换为全小写英文与短横线形式。
- 若名称不合规，先修正后再创建目录。

2. 创建目录结构
- 默认创建的 Skill 在当前项目文件夹的 `.agents/skills`（如果文件夹不存在可以创建）下，除非用户明确要求保存在别的地方。
- 在目标根目录下创建 `<skill-name>/`。
- 创建 `SKILL.md`（文件名固定为该形式）。
- 创建 `agents/openai.yaml`。

3. 生成 `SKILL.md`
- 文件的格式参考
    ```markdown
    ---
    name: <name>
    description: <description>
    ---
    <content>
    ```
- `name` 使用全小写加短横线。
- `description` 使用中文，明确技能功能与触发时机。
- 正文使用中文，至少包含“目标”“执行流程”“质量与安全要求”三个部分。

4. 生成 `agents/openai.yaml`
- 文件的格式参考
    ```yaml
    interface:
      display_name: <display_name>
      short_description: <short_description>
      default_prompt: <default_prompt>
    ```
- `display_name` 使用英文首字母大写写法（例如 `Init Skill`）。
- `short_description` 使用简短英文。
- `default_prompt` 使用中文，明确调用意图。

5. 结果自检
- 检查目录与文件是否存在。
- 检查 frontmatter YAML 语法是否有效。
- 检查 `name`、`description`、`display_name`、`short_description`、`default_prompt` 是否满足格式约束。

## 质量与安全要求

- 不覆盖已有同名 Skill；如目录已存在，先提示并等待确认。
- 不生成与规范无关的额外文档文件。
- 不写入无关目录，严格限制在目标技能目录内。
- 所有模板内容应可直接复用，避免含糊或占位性描述。
