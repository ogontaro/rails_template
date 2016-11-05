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

* テンプレートエンジンをslimに
gemfileに以下を追加
```
gem 'slim-rails'
```

既存のerbファイルをslimにしたいときは以下のgemを一時的に追加
```
gem 'html2slim'
```
その後以下のコマンドをプロジェクトルートディレクトリで実行するとslimファイルにerbファイルが変換される
```shell
# for i in app/views/**/*.erb; do erb2slim $i ${i%erb}slim && rm $i; done
```

* rubyのバージョンの指定
プロジェクトルートに".ruby-version"ファイルを置くことで、
rbenvやbundlerに実行するrubyのバージョンを指定させる。
