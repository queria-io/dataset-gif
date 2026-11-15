# dataset-gif

Queria のデータセット `gif`（政府相互運用性フレームワーク（GIF））のリポジトリです。データセットの説明は [docs/index.md](docs/index.md) にあります。

## ビルド

```bash
git submodule update --init
uv sync
scripts/build.sh   # fdl checkout → python main.py → fdl commit
```

毎月 3 日に GitHub Actions の Sync が実行され、新しいタグがあれば取り込みます。
