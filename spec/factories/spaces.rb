FactoryGirl.define do
  factory :space, class: 'Stiki::Space' do
    sequence(:name) { |n| "Test#{n}#{Time.now.to_s.gsub(/[ :-]/, '')}" }
  end
end