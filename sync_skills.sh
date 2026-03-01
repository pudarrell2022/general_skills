#!/usr/bin/env sh
set -eu

# 用法: ./sync-skills.sh [destination_dir]
# 默认目标目录: ~/.agents
DEST_DIR="${1:-$HOME/.agents}"
SRC_DIR="$(pwd)/skills/"

if [ ! -d "$(pwd)/skills" ]; then
  echo "错误: 当前目录下未找到 skills 目录: $(pwd)/skills" >&2
  exit 1
fi

mkdir -p "$DEST_DIR"

# 同步 skills 目录内容到目标目录下的 skills 子目录
rsync -av --delete --exclude=".*" "$SRC_DIR" "$DEST_DIR/skills/"

echo "同步完成: $SRC_DIR -> $DEST_DIR/skills/"
