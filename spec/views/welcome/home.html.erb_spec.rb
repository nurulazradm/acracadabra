# Copyright (c) 2012 Livefront, Inc.
# See the file license.txt for copying permission.

require 'spec_helper'

describe "welcome/home" do

  it "should have a div with the correct classes" do
    render
    rendered.should have_selector 'div', class: "center hero-unit"
  end

  describe "when setup is incomplete" do

    it "should display an error" do
      assign(:recipients, "")
      render
      rendered.should have_selector 'h1.error'
    end

  end

  describe "when setup is complete" do

    before do
      assign(:recipients, "jeremy@livefront.com")
      render
    end

    it "should display success" do
      rendered.should_not have_selector 'h1.error'
    end

    it "should provide instructions on Android app setup" do
      rendered.should have_content "Configuring your Android app" 
    end

  end

end
