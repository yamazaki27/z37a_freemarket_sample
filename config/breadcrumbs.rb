crumb :root do
  link "メルカリ", root_path
end

crumb :item do |item|
  link item.name, items_path(item)
end

crumb :users do
  link "マイページ", users_path
end

crumb :sell do |sell|
  link "出品した商品 - 出品中", sell_path(@user)
  parent :users
end

crumb :edit_profile do |profile|
  link "プロフィール", edit_profiles_path(@user)
  parent :users
end

crumb :identification do |identification|
  link "本人情報の登録", edit_identification_path(@user)
  parent :users
end

crumb :card do |card|
  link "支払い方法", card_path(@user)
  parent :users
end

crumb :profile do |profile|
  link "ログアウト", profiles_path(@user)
  parent :users
end


# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
