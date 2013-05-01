require 'spec_helper'

describe User do

	before(:each) do
		@attr = { :username => "example",
              :email => "example@skypig.com",
              :password => "example123",
              :password_confirmation => "example123",
            }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

end