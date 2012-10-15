require 'spec_helper'

describe WelcomeHelper do

  describe "show_result" do

    describe "when recipients is blank" do

      it "should render an error page" do
        helper.show_result("").should =~ /Setup incomplete!/
      end

    end

    describe "when recipients are set" do

      it "should render a success page" do
        helper.show_result("jeremy@livefront.com").should =~ /Setup complete!/
      end
    end

  end

end
