# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mpango}
  s.version = "0.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Anderson"]
  s.date = %q{2011-02-24}
  s.description = %q{provides billing stack for use of PayPal Web Standards}
  s.email = %q{dsaronin@gmail.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "MIT-LICENSE",
    "README",
    "Rakefile",
    "VERSION",
    "app/controllers/application_controller.rb",
    "app/controllers/payment_notifications_controller.rb",
    "app/helpers/application_helper.rb",
    "app/helpers/payment_notifications_helper.rb",
    "app/models/cart.rb",
    "app/models/payment_notification.rb",
    "app/models/subscription.rb",
    "app/models/subscription_mailer.rb",
    "app/models/subscription_plan.rb",
    "app/views/paypal/samples.html.haml",
    "config/app_config.yml",
    "doc/paypal_stuff.txt",
    "doc/saas_billing_requirements.txt",
    "doc/stack_action_descriptions.txt",
    "doc/state_machine_stuff.txt",
    "generators/mpango_migration/USAGE",
    "generators/mpango_migration/mpango_migration_generator.rb",
    "generators/mpango_migration/templates/20110219011144_create_payment_notifications.rb",
    "generators/mpango_migration/templates/20110219012745_create_carts.rb",
    "generators/mpango_migration/templates/migration.rb",
    "lib/mpango.rb",
    "lib/mpango/account_product.rb",
    "lib/mpango/billing_gateway.rb",
    "lib/mpango/gateways/paypal.rb",
    "lib/mpango/gateways/test.rb",
    "lib/mpango/product_feature.rb",
    "lib/mpango/subscription_billing.rb",
    "lib/tasks.rb",
    "mpango-0.1.3.gem",
    "mpango.gemspec",
    "pkg/mpango-0.1.3.gem",
    "tasks/mpango_tasks.rake",
    "test.rb",
    "test/application.rb",
    "test/db/database.yml",
    "test/db/models.rb",
    "test/db/schema.rb",
    "test/fixtures/payment_notifications.yml",
    "test/fixtures/subscription_plans.yml",
    "test/fixtures/subscriptions.yml",
    "test/fixtures/users.yml",
    "test/functional/payment_notifications_controller_test.rb",
    "test/gateways/brain_tree_gateway_test.rb",
    "test/mpango_test.rb",
    "test/performance/browsing_test.rb",
    "test/test_helper.rb",
    "test/unit/helpers/payment_notifications_helper_test.rb",
    "test/unit/payment_notification_test.rb",
    "test/units/manual_billing_test.rb",
    "test/units/recurring_billing_test.rb",
    "test/units/subscription_plan_test.rb",
    "test/units/subscription_test.rb"
  ]
  s.homepage = %q{git://github.com/dsaronin/mpango.git}
  s.licenses = ["MIT for the gem"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.4.2}
  s.summary = %q{PayPal Web Standard w/ Recurring Payments billing stack}
  s.test_files = [
    "test/application.rb",
    "test/db/models.rb",
    "test/db/schema.rb",
    "test/functional/payment_notifications_controller_test.rb",
    "test/gateways/brain_tree_gateway_test.rb",
    "test/mpango_test.rb",
    "test/performance/browsing_test.rb",
    "test/test_helper.rb",
    "test/unit/helpers/payment_notifications_helper_test.rb",
    "test/unit/payment_notification_test.rb",
    "test/units/manual_billing_test.rb",
    "test/units/recurring_billing_test.rb",
    "test/units/subscription_plan_test.rb",
    "test/units/subscription_test.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<aasm>, [">= 2.2"])
      s.add_development_dependency(%q<rails>, [">= 3.0"])
      s.add_development_dependency(%q<haml>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_runtime_dependency(%q<aasm>, [">= 0"])
    else
      s.add_dependency(%q<aasm>, [">= 2.2"])
      s.add_dependency(%q<rails>, [">= 3.0"])
      s.add_dependency(%q<haml>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<aasm>, [">= 0"])
    end
  else
    s.add_dependency(%q<aasm>, [">= 2.2"])
    s.add_dependency(%q<rails>, [">= 3.0"])
    s.add_dependency(%q<haml>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<aasm>, [">= 0"])
  end
end

