# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Items', type: :system do
  it 'create an item' do
    visit new_item_path

    fill_in 'アイテム名', with: 'とうふリップ'
    fill_in 'なぜ買いたいか', with: 'プルプル唇になるらしい'
    select '1ヶ月(優先度高)', from: 'いつまでに買いたいか'
    click_on '保存する'

    expect(page).to have_content "とうふリップを買いたいモノに追加しました"
  end

  it 'update an item ' do
    item = create(:item, description: 'なんとなく買いたい')

    visit edit_item_path(item)

    fill_in 'なぜ買いたいか', with: '今月限りの受注生産商品'
    click_on '保存する'

    expect(page).to have_content "#{item.name}の情報を修正しました"
  end

  it 'delete an item' do
    item = create(:item)

    visit item_path(item)
    accept_alert do
      click_on 'アイテムを削除する'
    end

    expect(page).to have_content "#{item.name}を削除しました"
  end
end
