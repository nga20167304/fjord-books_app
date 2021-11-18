# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @report = FactoryBot.create(:report, user_id: @user1.id)
  end

  test '#editable?' do
    assert @report.editable?(@user1)
    assert_not @report.editable?(@user2)
  end

  test '#created_on' do
    travel_to @report.created_on
    assert_equal Date.current, @report.created_on
  end
end
