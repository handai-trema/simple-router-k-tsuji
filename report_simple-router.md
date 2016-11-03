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
ルーティングテーブルの内容をすべて標準出力する．<br>
コマンドは下記の通りである．<br>
```
./bin/simple_router dump_routing_tb
```
このコマンドは下記の順で処理する．<br>
####１．`RoutingTable`クラスの`dump`メソッドを呼び出す．
[lib/simple_router.rb](lib/simple_router.rb)
において，
[lib/routing_table.rb](lib/routing_table.rb)
に定義される`RoutingTable`クラスの`dump`メソッドを呼び出す．<br>
####２．`RoutingTable`クラスの`@db`を文字列化して返す．
[lib/routing_table.rb](lib/routing_table.rb)
における`RoutingTable`クラスの`@db`を文字列化して返す．<br>
####３．返ってきた文字列を出力する．
[bin/simple_router](bin/simple_router)
において下記の例のように返ってきた文字列を出力する．<br>
下記の結果は
[simple_router.conf](simple_router.conf)
に対する結果である．<br>
```
Destination     | Next hop
----------------------------------------
0.0.0.0/0       | 192.168.1.2
```



###② ルーティングテーブルエントリの追加
ルーティングテーブルに新しいエントリーを追加する．<br>
コマンドは下記の通りである．<br>
ここで，`dest`とは宛先IPアドレス，netmask_lengthとはサブネットマスク長，`next_hop`とは次にホップするIPアドレスを意味する．<br>
```
./bin/simple_router add_entry2routing_tb dest netmask_length next_hop
```
このコマンドは下記の順で処理する．<br>
####１．[bin/simple_router](bin/simple_router)において`add_entry2routing_tb`メソッドを呼び出す．
####２．`RoutingTable`クラスの`add`メソッドを呼び出す．
[lib/routing_table.rb](lib/routing_table.rb)
における`RoutingTable`クラスの`add`メソッドを呼び出す．<br>
ここで，`add`メソッドは既存のものを使用しており，
`add`メソッドは下記のようなハッシュを受け取り，
受け取ったハッシュの情報に応じたエントリーを`@db`に記録する．<br>
```
:destination => 宛先IPアドレス,
:netmask_length => サブネットマスク長,
:next_hop => 次にホップするIPアドレス
```
さらに，下記のコマンドを実行する．<br>
```
./bin/simple_router add_entry2routing_tb 192.168.1.1 24 192.168.2.1
./bin/simple_router dump_routing_tb
```
すると，下記の結果を得たため，コマンドの実行が成功した．<br>
```
Destination     | Next hop
----------------------------------------
192.168.1.0/24  | 192.168.2.1
0.0.0.0/0       | 192.168.1.2
```



###③ ルーティングテーブルエントリの追加と削除
ルーティングテーブルの一つのエントリーを削除する．<br>
コマンドは下記の通りである．<br>
ここで，`dest`とは宛先IPアドレス，netmask_lengthとはサブネットマスク長を意味する．<br>
```
./bin/simple_router del_entry2routing_tb dest netmask_length
```
このコマンドは下記の順で処理する．<br>
####１．[bin/simple_router](bin/simple_router)において`del_entry2routing_tb`メソッドを呼び出す．
####２．`RoutingTable`クラスの`deletes`メソッドを呼び出す．
[lib/routing_table.rb](lib/routing_table.rb)
における`RoutingTable`クラスの`delete`メソッドを呼び出す．<br>
ここで，`delete`メソッドは未存であったため，
新しく追加した．<br>
`delete`メソッドとは下記のようなハッシュを受け取り，
受け取ったハッシュの情報に応じたエントリーを`@db`から削除する．<br>
```
:destination => 宛先IPアドレス,
:netmask_length => サブネットマスク長
```
さらに，下記のルーティングテーブルに対して，
```
Destination     | Next hop
----------------------------------------
192.168.1.0/24  | 192.168.2.1
0.0.0.0/0       | 192.168.1.2
```
下記のコマンドを実行する．<br>
```
./bin/simple_router del_entry2routing_tb 192.168.1.1 24
./bin/simple_router dump_routing_tb
```
すると，下記の結果を得たため，コマンドの実行が成功した．<br>
```
Destination     | Next hop
----------------------------------------
0.0.0.0/0       | 192.168.1.2
```





###④ ルータのインタフェース一覧の表示






##関連リンク
* [課題 (ルータのCLIを作ろう)](https://github.com/handai-trema/deck/blob/develop/week5/assignment_simple_router.md)
* [bin/simple_router](bin/simple_router)
* [lib/simple_router.rb](lib/simple_router.rb)
* [lib/routing_table.rb](lib/routing_table.rb)
