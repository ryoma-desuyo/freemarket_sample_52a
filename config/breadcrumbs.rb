crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypages_path
end

crumb :edit do
  link "プロフィール", edit_mypage_path
  parent :mypage
end

crumb :card do
  link "支払い方法", card_mypages_path
  parent :mypage
end

crumb :credit do
  link "クレジットカード情報入力", credits_users_path
  parent :mypage
  parent :card
end

crumb :currentexhibit do
  link "出品した商品-出品中", mypages_path
  parent :mypage
end

crumb :exhibit do
  link "出品商品画面", exhibit_product_path
  parent :mypage
  parent :currentexhibit
end

crumb :logout do
  link "ログアウト", users_logout_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", identification_mypage_path
  parent :mypage
end