"""GIF（政府相互運用性フレームワーク）データパイプライン。

1. gif: 最新のタグから語彙の Excel 3 つを CSV にする
2. dbt: dbt ビルド
"""

import logging

from dbt.cli.main import dbtRunner

from pipelines.gif import download_gif

logging.basicConfig(level=logging.INFO, format="%(message)s")
logger = logging.getLogger("pipelines")


def dbt_build():
    dbt = dbtRunner()
    for command in (["deps"], ["build"], ["docs", "generate"]):
        result = dbt.invoke(command)
        if not result.success:
            raise SystemExit(f"dbt {' '.join(command)} failed")


def main():
    logger.info("1/2: gif (GIF の語彙)")
    download_gif()

    logger.info("2/2: dbt build")
    dbt_build()


if __name__ == "__main__":
    main()
