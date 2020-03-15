# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Item::SearchItems', type: :system do
  it 'search items by name' do
    create(:item, name: 'アイテープ')
    create(:item, name: 'リップ')

    visit items_path
    within('form[name=search]') do
      fill_in 'q[name_cont]', with: 'ア'
    end
    click_on '検索'

    expect(page).to have_content('アイテープ')
    expect(page).to_not have_content('リップ')
  end

  it 'search items by status' do
    create(:item, status: :purchased)
    create(:item, status: :unpurchased)

    visit items_path
    within('form[name=search]') do
      check '買った'
    end
    click_on '検索'

    expect(page).to have_selector '.list-item__status', text: '買った'
    expect(page).to_not have_selector '.list-item__status', text: '買ってない'
  end
end
