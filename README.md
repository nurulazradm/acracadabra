# Acracadabra

Android crash reports. Detailed. Fast. Direct to your inbox.


## Contents

* [Overview](#overview)
* [Dependencies](#dependencies)
* [Development Setup](#setup)
* [Deploying to Heroku](#deployment)
* [Configuring your Android app](#android-config)
* [License](#license)

<a name="overview"></a>
## Overview

Acracadabra is a Rails app that receives [ACRA](https://github.com/ACRA/acra)-generated crash reports from Android applications and passes them directly to your email inbox. What's ACRA?

> ...a library enabling Android Application to automatically post their crash reports to a GoogleDoc form. It is targetted to android applications developers to help them get data from their applications when they crash or behave erroneously.

> [It] can be used with your own self-hosted report receiver script.

Acracadabra is a fast-pass to your own "self-hosted report receiver script."

Follow the steps below. You can be up and running in under 20 minutes.

<a name="dependencies"></a>
## Dependencies

* See the Gemfile
* Ruby 1.9.3
* Rails 3.2.8
* [Heroku Toolbelt](https://toolbelt.heroku.com/)

<a name="setup"></a>
## Setup

### Grab the Source

1. [Fork the repo](https://github.com/livefront/acracadabra/fork_select)

2. Checkout the source

        $ git clone git@github.com:<your_account>/acracadabra.git
        $ cd acracadabra
        $ git checkout -t origin/stable
        $ git checkout master

### App Setup

1. Install dependencies:

        $ bundle install

2. Set up RSpec

        $ rails generate rspec:install  

3. Run unit tests:

        $ rspec

4. Specify 'from' address and report recipients in the `.env` file.  Example:

        FROM_ADDRESS=jeremy@livefront.com
        RECIPIENTS=jeremy@livefront.com

5. Fire it up:

        $ foreman start

    [Foreman](https://github.com/ddollar/foreman) is used because of its ability to easily set environment variables with the `.env` file. 

5. Confirm the dev server is running and configured properly

    Load `http://localhost:5000` in your browser.

<a name="deployment"></a>
## Deploying to Heroku

### One-time setup

1. Create the app

        $ heroku create --stack cedar

1. Add Heroku add-on(s)

        $ heroku addons:add sendgrid:starter

2. Set Heroku config variable for report recipients

        $ heroku config:add FROM_ADDRESS=<email_address>
        $ heroku config:add RECIPIENTS=<email_address>

### Deployment

1. Deploy to Heroku

        $ git push heroku master
        $ heroku ps:restart

2. Confirm configuration

        $ heroku open

3. [Optional] Disable the welcome page in production
<br />
<br />
    1. In `config/routes.rb`, change this:

            root :to => 'welcome#home'
            # root :to => 'welcome#not_found'

        to this:

            # root :to => 'welcome#home'
            root :to => 'welcome#not_found'
            
<a name="android-config"></a>
## Configuring your Android app

### Add the ACRA library

1. Download the [ACRA library](https://github.com/ACRA/acra/downloads)
1. Extract the ZIP
1. Copy the `build/acra-<version>.jar` file to `<android_app_root>/libs`

### Configure ACRA in an Application subclass

1. If you do not already have an Application subclass, create one:  

        import android.app.Application;

        public class MyApplication extends Application {
        }
    and update `AndroidManifest.xml` to use your new Application subclass:
       
        ...
        <application android:icon="@drawable/icon" android:label="@string/app_name"
            android:name="MyApplication">
        ...

2. Add the `ReportsCrashes` annotation to your Application subclass.  `formKey` will be ignored. Set the value of `formUri` to the `reports` path of your acracadabra service.

        ...
        import org.acra.ACRA;
        import org.acra.annotation.ReportsCrashes;
        ...

        @ReportsCrashes(formKey = "",
                        formUri = "http://<acracadabra_hostname_and_port>/reports")
        public class MyApplication extends Application {
        }

3. Initialize ACRA in `onCreate()`
  
        @Override
        public void onCreate() {
            ACRA.init(this);
            super.onCreate();
        }

4. If your `AndroidManifest.xml` does not already request the `INTERNET` permission, add it:

        <uses-permission android:name="android.permission.INTERNET"/>

5. That's it!  See the <a href="https://code.google.com/p/acra/wiki/BasicSetup">ACRA documentation</a> for advanced configuration options. If you want to test a crash report, you can do something simple like throwing a RuntimeException in `onResume()` of one of your activities:

        @Override onResume() {
            throw new RuntimeException("And we're done.");
        }

<a href="#license"></a>
## License

Acradabra is released under the [MIT license](www.opensource.org/licenses/MIT).      

Copyright (c) 2012 Livefront, Inc.  
