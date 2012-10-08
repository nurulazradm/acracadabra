require 'spec_helper'

describe ReportsController do

  context 'given a report' do

    before do
      post :create, ANDROID_VERSION: "2.1", APP_PACKAGE: "com.drivescribe"
    end

    it 'responds with successful HTTP status' do
      response.should be_success
    end

  end

end
