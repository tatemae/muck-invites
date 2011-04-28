# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{muck-invites}
  s.version = "3.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Justin Ball, Joel Duffin"]
  s.date = %q{2011-04-27}
  s.description = %q{The invite engine for the muck system.}
  s.email = %q{justin@tatemae.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "MIT-LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "app/controllers/muck/invites_controller.rb",
    "app/helpers/muck_invites_helper.rb",
    "app/mailers/invite_mailer.rb",
    "app/views/invite_mailer/invite_notification.html.erb",
    "app/views/invite_mailer/invite_notification.text.erb",
    "app/views/invite_mailer/invited_joined_notification.html.erb",
    "app/views/invite_mailer/invited_joined_notification.text.erb",
    "app/views/invites/_contact_container.erb",
    "app/views/invites/_contact_list.erb",
    "app/views/invites/_contact_list_gravatar.erb",
    "app/views/invites/_contacts_loading.erb",
    "app/views/invites/_contacts_query.erb",
    "app/views/invites/_gmail_oauth.erb",
    "app/views/invites/_invite_compose.erb",
    "app/views/invites/_invite_scripts.erb",
    "app/views/invites/_invite_standard.erb",
    "app/views/invites/compose.erb",
    "app/views/invites/create.erb",
    "app/views/invites/get_contacts.html.erb",
    "app/views/invites/get_contacts.js.erb",
    "app/views/invites/new.erb",
    "config/locales/ar.yml",
    "config/locales/bg.yml",
    "config/locales/ca.yml",
    "config/locales/cs.yml",
    "config/locales/da.yml",
    "config/locales/de.yml",
    "config/locales/el.yml",
    "config/locales/en.yml",
    "config/locales/es.yml",
    "config/locales/et.yml",
    "config/locales/fa.yml",
    "config/locales/fi.yml",
    "config/locales/fr.yml",
    "config/locales/gl.yml",
    "config/locales/hi.yml",
    "config/locales/hr.yml",
    "config/locales/hu.yml",
    "config/locales/id.yml",
    "config/locales/it.yml",
    "config/locales/iw.yml",
    "config/locales/ja.yml",
    "config/locales/ko.yml",
    "config/locales/lt.yml",
    "config/locales/lv.yml",
    "config/locales/mt.yml",
    "config/locales/nl.yml",
    "config/locales/no.yml",
    "config/locales/pl.yml",
    "config/locales/pt-PT.yml",
    "config/locales/ro.yml",
    "config/locales/ru.yml",
    "config/locales/sk.yml",
    "config/locales/sl.yml",
    "config/locales/sq.yml",
    "config/locales/sr.yml",
    "config/locales/sv.yml",
    "config/locales/th.yml",
    "config/locales/tl.yml",
    "config/locales/tr.yml",
    "config/locales/uk.yml",
    "config/locales/vi.yml",
    "config/locales/zh-CN.yml",
    "config/locales/zh-TW.yml",
    "config/locales/zh.yml",
    "config/routes.rb",
    "db/migrate/20090928213532_create_invites.rb",
    "db/migrate/20091128170318_make_invites_polymorphic.rb",
    "lib/muck-invites.rb",
    "lib/muck-invites/config.rb",
    "lib/muck-invites/engine.rb",
    "lib/muck-invites/exceptions.rb",
    "lib/muck-invites/models/invite.rb",
    "lib/muck-invites/models/invitee.rb",
    "lib/muck-invites/models/inviter.rb",
    "lib/tasks/muck_invites.rake",
    "muck-invites.gemspec",
    "public/stylesheets/muck-invites.css"
  ]
  s.homepage = %q{http://github.com/tatemae/muck-invites}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.0}
  s.summary = %q{The invite engine for the muck system}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<contacts>, [">= 1.2.4"])
      s.add_runtime_dependency(%q<muck-portablecontacts>, [">= 0"])
      s.add_runtime_dependency(%q<hpricot>, [">= 0"])
      s.add_runtime_dependency(%q<muck-engine>, [">= 3.3.4"])
      s.add_runtime_dependency(%q<muck-auth>, [">= 3.5.1"])
    else
      s.add_dependency(%q<contacts>, [">= 1.2.4"])
      s.add_dependency(%q<muck-portablecontacts>, [">= 0"])
      s.add_dependency(%q<hpricot>, [">= 0"])
      s.add_dependency(%q<muck-engine>, [">= 3.3.4"])
      s.add_dependency(%q<muck-auth>, [">= 3.5.1"])
    end
  else
    s.add_dependency(%q<contacts>, [">= 1.2.4"])
    s.add_dependency(%q<muck-portablecontacts>, [">= 0"])
    s.add_dependency(%q<hpricot>, [">= 0"])
    s.add_dependency(%q<muck-engine>, [">= 3.3.4"])
    s.add_dependency(%q<muck-auth>, [">= 3.5.1"])
  end
end

