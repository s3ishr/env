# ~/.cshrc: executed by tcsh(1) in any case.

# このファイルを利用しないでください (設定項目が **意図的に** 削られています).
# オリジナルの ~/.cshrc を解説することを目的に書かれています.

# オリジナルの .cshrc は以下から入手できます:
#   /local/share.rw/user.skel/2015/.cshrc

umask 022

set system=`uname -s`   # `uname -s` => カーネル名
switch ($system)
case SunOS:
    # Solaris で使う設定が書かれている(内容は省略)
    breaksw
default:
    # カーネルに応じて設定を読み込む.
    # Linux であれば ~/.cshrc.Linux に設定を記述すればよい.
    if (-f .cshrc.$system) source .cshrc.$system
endsw

# 外部ファイルの読み込みが先頭で行われるため,
# 以下の設定項目は ~/.cshrc.$system で上書きできないことに注意する.

if ($?HOST == 0) then   # HOST 環境変数が空のとき
  setenv HOST `hostname`
endif

## Uncomment this if you prefer Japanese message.
#setenv LANG ja_JP.UTF-8

# Common applications
  # 外部ファイルの読み込みより後に設定されるため,
  # ~/.cshrc.$system で設定しても emacs と less で上書きされてしまう.
setenv EDITOR 'emacs -nw'
setenv PAGER less

# Common servers
  # MailサーバーやNewsサーバーの設定(内容は省略)

if ($?prompt == 0) exit             # 対話シェルでなければ修了
set history=100
set prompt="[$user@$HOST] \! % "
set notify filec                    # notify: バックグラウンドジョブの修了をすぐに知らせる
                                    # filec:  ファイル補完を行う
