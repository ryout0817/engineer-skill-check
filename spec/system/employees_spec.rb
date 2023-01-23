require 'rails_helper'

RSpec.describe "Employees", type: :system do
  let!(:office) { FactoryBot.create(:office) }
  let!(:department) { FactoryBot.create(:department) }
  let!(:employee) { FactoryBot.create(:employee) }

  before do
    visit login_path
    fill_in "employees[account]",	with: "yamada"
    fill_in "employees[password]", with: "hogehoge"
    click_button "ログイン"
  end

  it "メールアドレスの入力確認" do
    visit new_employee_path
  end
end
