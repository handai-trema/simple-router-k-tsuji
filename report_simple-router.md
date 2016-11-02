#Report: simple-router
Submission: &nbsp; Nov./2/2016<br>
Branch: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; develop<br>






##提出者
<B>辻　健太</B><br>
33E16012<br>
長谷川研究室 所属<br>






##追加したコマンド（ボーナス点対象）
<p>以下３つのコマンドを追加した．</p>

###① ルーティングテーブルの表示
コネクションID（`dpid`）先にあるスイッチにおいるルーティングテーブルの内容をすべて標準出力する．<br>
コマンドは下記の通りである．<br>
```
./bin/simple_router dump_routing_tb dpid
```
このコマンドは
[lib/simple_router.rb](lib/simple_router.rb)
における`dump_routing_tb`メソッドを呼び出し，下記の順で処理する．<br>
####１． `RoutingTable`クラスの`dump`メソッドを呼び出す．
[lib/routing_table.rb](lib/routing_table.rb)
の`RoutingTable`クラスがもつ`dump`メソッドを呼び出す．<br>




###② ルーティングテーブルエントリの追加と削除


###③ ルータのインタフェース一覧の表示


###④ ルータへのインタフェース追加と削除


##関連リンク
* [課題 (パッチパネルの機能拡張)](https://github.com/handai-trema/deck/blob/develop/week3/assignment_patch_panel.md)
* [bin/patch_panel](bin/patch_panel)
* [lib/patch_panel.rb](lib/patch_panel.rb)
