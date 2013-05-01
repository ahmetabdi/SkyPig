require 'spec_helper'

describe Stiki::Space do
  subject { create(:space) }
  it { should have_many(:pages) }
  it { should validate_uniqueness_of(:name) }
end