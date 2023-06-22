$OutputEncoding = [System.Text.Encoding]::UTF8
######################################
##### 名前とメールアドレスの入力 #####
######################################
# github に登録してあるユーザIDと
# メールアドレスを入力してください。
######################################
$user_name  = "sample"
$user_email = "sample@sample.com"
######################################
######################################
######################################

##### ソフトウェアのインストール #####
Invoke-RestMethod get.scoop.sh | Invoke-Expression

# インストールしたいソフトウェアのリストを作成
$softwareList = @(
    "git",
    "go"
)

# リスト内のソフトウェアを順番にインストール
foreach ($software in $softwareList) {
    Write-Host "インストール中: $software"
    scoop install $software
    Write-Host "インストール完了: $software"
}
######################################
go install github.com/isksss/cheeky@latest

cheeky new $user_name $user_email
cheeky set $user_name

##### gitの設定 ######################
git config --global color.ui auto
git config --global fetch.prune true
git config --global pull.ff only
git config --global rebase.autostash true
git config --global rebase.autosquash true
git config --global push.default current

git config --global core.autocrlf input
git config --global core.ignorecase false
git config --global core.quotepath false

