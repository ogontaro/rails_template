# rails_template
Railsのテンプレートです。
これをベースにすることで、面倒な初期設定を省き、実務で使うRails構成で開発を行うことができます。
また、wikiには、具体的な構築手順を記載しています。

## システム構成
DB: MySQL
テスト: RSpec

## 変更内容
### rails new
以下のコマンドでrailsを構成する
```shell
$ rails new --database=mysql --skip-turbolinks --skip-test
```

### rubyのバージョンの指定
以下のコマンドでそのディレクトリ以下で実行されるrubyのバージョンを指定できる。
コマンドの結果は```.ruby-version```に出力されるので、後から変更する場合はこのファイルを変更する。

```shell
rbenv local 2.3.1
```


### テンプレートエンジンをslimに
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

### rspecの導入
Gemfileに以下を追加してbundle install

```rb:Gemfile
group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
```

* factory_girl_rails: test時に使用するデータの生成するgem
* faker: いい感じのモデルの属性を生成するgem(テストでしか使用しないが、springの関係で落ちるのでdevelopmentでも読み込むように)
* capybara: featureテストを実行するためのgem
* database_cleaner: テスト終了時にDBをcleanしてくれるgem
* launchy: capybaraのテスト時に現在のページをブラウザで開けるgem
* selenium-webdriver: ブラウザテスト用のライブラリ


```$ bundle exec rails generate rspec:install```を実行。
下記を生成。

```
create  .rspec
create  spec
create  spec/spec_helper.rb
```

rails g した時に不要なファイルを生成しないように

```rb:/config/application.rb
config.generators do |g|
  g.test_framework :rspec,
    fixtures: true,
    view_specs: false,
    helper_specs: false,
    routing_specs: false,
    controller_specs: true,
    request_specs: false
  g.fixture_replacement :factory_girl, dir: "spec/factories"
end
