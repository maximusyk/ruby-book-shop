require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Self-management Books Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["bookshop@example.com"], mail.from
    assert_match /1 x The 10X Rule/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Self-management Books Store Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["bookshop@example.com"], mail.from
    assert_match /<td[^>]*>1<\/td>\s*<td>Tue 10X Rule<\/td>/, mail.body.encoded
  end
end
