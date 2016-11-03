#Report: simple-router
Submission: &nbsp; Nov./2/2016<br>
Branch: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; develop<br>






##提出者
<B>辻　健太</B><br>
33E16012<br>
長谷川研究室 所属<br>






##追加したコマンド（ボーナス点対象）
[bin/simple_router](bin/simple_router)
に以下４つのコマンドを追加した．<br>

###① ルーティングテーブルの表示
コネクションID（`dpid`）先にあるスイッチにおいるルーティングテーブルの内容をすべて標準出力する．<br>
コマンドは下記の通りである．<br>
```
./bin/simple_router dump_routing_tb dpid
```
このコマンドは下記の順で処理する．<br>
####１．`RoutingTable`クラスの`dump`メソッドを呼び出す．
[lib/routing_table.rb](lib/routing_table.rb)
における`RoutingTable`クラスの`dump`メソッドを呼び出す．<br>
####２．`RoutingTable`クラスの`@db`を文字列化して返す．
ib/routing_table.rb](lib/routing_table.rb)
における`RoutingTable`クラスの`@db`を文字列化して返す．
####３．帰ってきた文字列を出力する．
[bin/simple_router](bin/simple_router)
における`dump_routing_tb`メソッドを呼び出し，下記の順で処理する．<br>



###② ルーティングテーブルエントリの追加と削除

###③ ルータのインタフェース一覧の表示


###④ ルータへのインタフェース追加と削除






##関連リンク
* [課題 (ルータのCLIを作ろう)](https://github.com/handai-trema/deck/blob/develop/week5/assignment_simple_router.md)
* [bin/simple_router](bin/simple_router)
* [lib/routing_table.rb](lib/routing_table.rb)
