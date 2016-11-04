# rails_template
Railsのテンプレートです。
これをベースにすることで、面倒な初期設定を省き、実務で使うRails構成で開発を行うことができます。
また、wikiには、具体的な構築手順を記載しています。

* システム構成
DB: MySQL
テスト: RSpec

* rails new
以下のコマンドでrailsを構成する
```shell
rails new --database=mysql --skip-turbolinks --skip-test
```
