FactoryGirl.define do
  factory :page, class: 'Stiki::Page' do
    sequence(:title) { |n| "Test#{n}#{Time.now.to_s.gsub(/[ :-]/, '')}" }
    body "body"
    space
  end
end