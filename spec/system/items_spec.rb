require 'rails_helper'

RSpec.describe "Items", type: :system do
  it 'create an item' do
    visit new_item_path

    fill_in 'アイテム名', 'コンクリコンシーラー'
    fill_in 'なぜ買いたいか', 'Youtuber絶賛の商品'
    select '1ヶ月(優先度高)', from: 'いつまでに買いたいか'
    click_on '保存する'

    expect(page).to have_content 'コンクリコンシーラーを買いたいモノに追加しました'
  end

  it 'update an item ' do
    item = Item.create(name: 'とうふリップ', description: 'プルプル唇になるらしい', status: 0, priority: 2)

    visit edit_item_path(item)

    fill_in 'なぜ買いたいか', 'とろとろ唇になるらしい'
    click_on '保存する'

    expect(page).to have_content "#{item.name}の情報を修正しました"
  end

  it 'delete an item' do
    item = Item.create(name: 'とうふリップ', description: 'プルプル唇になるらしい', status: 0, priority: 2)
    
    visit item_path(item)
    accept_alert do
      click_on 'アイテムを削除する'
    end

    expect(page).to have_content "#{item.name}を削除しました"
  end
end
