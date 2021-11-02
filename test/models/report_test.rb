# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "#editable?" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    report = FactoryBot.create(:report, user_id: user1.id)
    
    assert report.editable?(user1)
    assert_not report.editable?(user2)
  end

  test "#created_on" do
    user = FactoryBot.create(:user)
    report = FactoryBot.create(:report, user_id: user.id)

    assert_equal Date.current, report.created_on
  end
end
