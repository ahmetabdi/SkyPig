require 'spec_helper'

describe Stiki::Page do
  subject { create(:page) }
  it { should belong_to(:space) }
  it { should validate_uniqueness_of(:title).scoped_to(:space_id) }
  it { should validate_presence_of(:body) }
end