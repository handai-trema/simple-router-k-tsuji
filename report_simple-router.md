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
コネクションID（`dpid`）先にあるスイッチにおいて，`port_monitor`ポートから入ってくるパケットを`port_monitor`ポートへミラーリングする．<br>
コマンドは下記の通りである．<br>
```
./bin/patch_panel mirror dpid port_monitor port_mirror
```
このコマンドは
[lib/patch_panel.rb](lib/patch_panel.rb)
における`create_mirror`メソッドを呼び出し，下記の順で処理する．<br>
####１． `add_mirror_entry`メソッドを呼び出す．
フローテーブルにMirroringを実現するルールを追加する．<br>
具体的なルールは，port_monitorが所属するパッチ`port_out`を`@patches`から取得し，`port_monitor`からのPacketInに対しては`port_out`および`port_mirror`へフォワーディングする．<br>
####２．`@mirrors`へミラーリングを記録する．
[lib/patch_panel.rb](lib/patch_panel.rb)
の`start`メソッドにおいてインスタンス変数`@mirrors`（ハッシュ）を宣言し，`@patches`
と同様に，`add_mirror_entry`メソッドによって実現したミラーをリスト構造として記録する．<br>

###② ルーティングテーブルエントリの追加と削除


###③ ルータのインタフェース一覧の表示


###④ ルータへのインタフェース追加と削除


##関連リンク
* [課題 (パッチパネルの機能拡張)](https://github.com/handai-trema/deck/blob/develop/week3/assignment_patch_panel.md)
* [bin/patch_panel](bin/patch_panel)
* [lib/patch_panel.rb](lib/patch_panel.rb)
