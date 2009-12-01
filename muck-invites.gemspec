# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{muck-invites}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Justin Ball, Joel Duffin"]
  s.date = %q{2009-11-30}
  s.description = %q{The invite engine for the muck system.}
  s.email = %q{justin@tatemae.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "MIT-LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "app/controllers/muck/invites_controller.rb",
     "app/models/invite_mailer.rb",
     "app/views/invite_mailer/invite_notification.text.html.erb",
     "app/views/invite_mailer/invite_notification.text.plain.erb",
     "app/views/invite_mailer/invited_joined_notification.text.html.erb",
     "app/views/invite_mailer/invited_joined_notification.text.plain.erb",
     "app/views/invites/_get_contacts.html.erb",
     "app/views/invites/new.html.erb",
     "config/muck_invites_routes.rb",
     "db/migrate/20090928213532_create_invites.rb",
     "db/migrate/20091128170318_make_invites_polymorphic.rb",
     "install.rb",
     "lib/active_record/acts/muck_invite.rb",
     "lib/active_record/acts/muck_invitee.rb",
     "lib/active_record/acts/muck_inviter.rb",
     "lib/muck_invites.rb",
     "lib/muck_invites/initialize_routes.rb",
     "lib/muck_invites/tasks.rb",
     "locales/ar.yml",
     "locales/bg.yml",
     "locales/ca.yml",
     "locales/cs.yml",
     "locales/da.yml",
     "locales/de.yml",
     "locales/el.yml",
     "locales/en.yml",
     "locales/es.yml",
     "locales/et.yml",
     "locales/fa.yml",
     "locales/fi.yml",
     "locales/fr.yml",
     "locales/gl.yml",
     "locales/hi.yml",
     "locales/hr.yml",
     "locales/hu.yml",
     "locales/id.yml",
     "locales/it.yml",
     "locales/iw.yml",
     "locales/ja.yml",
     "locales/ko.yml",
     "locales/lt.yml",
     "locales/lv.yml",
     "locales/mt.yml",
     "locales/nl.yml",
     "locales/no.yml",
     "locales/pl.yml",
     "locales/pt-PT.yml",
     "locales/ro.yml",
     "locales/ru.yml",
     "locales/sk.yml",
     "locales/sl.yml",
     "locales/sq.yml",
     "locales/sr.yml",
     "locales/sv.yml",
     "locales/th.yml",
     "locales/tl.yml",
     "locales/tr.yml",
     "locales/uk.yml",
     "locales/vi.yml",
     "locales/zh-CN.yml",
     "locales/zh-TW.yml",
     "locales/zh.yml",
     "muck-invites.gemspec",
     "public/stylesheets/muck-invites.css",
     "rails/init.rb",
     "tasks/muck_invites_tasks.rake",
     "test/rails_root/.gitignore",
     "test/rails_root/.rake_tasks",
     "test/rails_root/Capfile",
     "test/rails_root/Rakefile",
     "test/rails_root/app/controllers/application_controller.rb",
     "test/rails_root/app/controllers/default_controller.rb",
     "test/rails_root/app/helpers/application_helper.rb",
     "test/rails_root/app/models/.keep",
     "test/rails_root/app/models/activity.rb",
     "test/rails_root/app/models/invite.rb",
     "test/rails_root/app/models/invitee.rb",
     "test/rails_root/app/models/user.rb",
     "test/rails_root/app/models/user_session.rb",
     "test/rails_root/app/views/default/index.html.erb",
     "test/rails_root/app/views/layouts/default.html.erb",
     "test/rails_root/config/boot.rb",
     "test/rails_root/config/database.yml",
     "test/rails_root/config/environment.rb",
     "test/rails_root/config/environments/cucumber.rb",
     "test/rails_root/config/environments/development.rb",
     "test/rails_root/config/environments/production.rb",
     "test/rails_root/config/environments/test.rb",
     "test/rails_root/config/global_config.yml",
     "test/rails_root/config/initializers/inflections.rb",
     "test/rails_root/config/initializers/mime_types.rb",
     "test/rails_root/config/initializers/requires.rb",
     "test/rails_root/config/initializers/session_store.rb",
     "test/rails_root/config/routes.rb",
     "test/rails_root/db/.keep",
     "test/rails_root/db/migrate/20090320174818_create_muck_permissions_and_roles.rb",
     "test/rails_root/db/migrate/20090402033319_add_muck_activities.rb",
     "test/rails_root/db/migrate/20090402234137_create_languages.rb",
     "test/rails_root/db/migrate/20090426041056_create_countries.rb",
     "test/rails_root/db/migrate/20090426041103_create_states.rb",
     "test/rails_root/db/migrate/20090602041838_create_users.rb",
     "test/rails_root/db/migrate/20090608073052_create_friends.rb",
     "test/rails_root/db/migrate/20090703055724_add_contents.rb",
     "test/rails_root/db/migrate/20090704220055_create_slugs.rb",
     "test/rails_root/db/migrate/20090928213532_create_invites.rb",
     "test/rails_root/db/migrate/20091128170318_make_invites_polymorphic.rb",
     "test/rails_root/features/comments.feature",
     "test/rails_root/features/step_definitions/comment_steps.rb",
     "test/rails_root/features/step_definitions/common_steps.rb",
     "test/rails_root/features/step_definitions/webrat_steps.rb",
     "test/rails_root/features/support/env.rb",
     "test/rails_root/features/support/paths.rb",
     "test/rails_root/lib/tasks/cucumber.rake",
     "test/rails_root/public/.htaccess",
     "test/rails_root/public/404.html",
     "test/rails_root/public/422.html",
     "test/rails_root/public/500.html",
     "test/rails_root/public/dispatch.rb",
     "test/rails_root/public/favicon.ico",
     "test/rails_root/public/images/arrow_down.gif",
     "test/rails_root/public/images/arrow_left.gif",
     "test/rails_root/public/images/arrow_right.gif",
     "test/rails_root/public/images/arrow_up.gif",
     "test/rails_root/public/images/fancybox/fancy_closebox.png",
     "test/rails_root/public/images/fancybox/fancy_left.png",
     "test/rails_root/public/images/fancybox/fancy_progress.png",
     "test/rails_root/public/images/fancybox/fancy_right.png",
     "test/rails_root/public/images/fancybox/fancy_shadow_e.png",
     "test/rails_root/public/images/fancybox/fancy_shadow_n.png",
     "test/rails_root/public/images/fancybox/fancy_shadow_ne.png",
     "test/rails_root/public/images/fancybox/fancy_shadow_nw.png",
     "test/rails_root/public/images/fancybox/fancy_shadow_s.png",
     "test/rails_root/public/images/fancybox/fancy_shadow_se.png",
     "test/rails_root/public/images/fancybox/fancy_shadow_sw.png",
     "test/rails_root/public/images/fancybox/fancy_shadow_w.png",
     "test/rails_root/public/images/fancybox/fancy_title_left.png",
     "test/rails_root/public/images/fancybox/fancy_title_main.png",
     "test/rails_root/public/images/fancybox/fancy_title_right.png",
     "test/rails_root/public/images/icons/accept.png",
     "test/rails_root/public/images/icons/add.png",
     "test/rails_root/public/images/icons/blue_guy.png",
     "test/rails_root/public/images/icons/button_background.png",
     "test/rails_root/public/images/icons/cancel.png",
     "test/rails_root/public/images/icons/close.png",
     "test/rails_root/public/images/icons/comment.png",
     "test/rails_root/public/images/icons/delete.png",
     "test/rails_root/public/images/icons/exclaim.png",
     "test/rails_root/public/images/icons/grey_guy.png",
     "test/rails_root/public/images/icons/hide.png",
     "test/rails_root/public/images/icons/information.png",
     "test/rails_root/public/images/icons/minus.png",
     "test/rails_root/public/images/icons/question.png",
     "test/rails_root/public/images/icons/search_box.png",
     "test/rails_root/public/images/icons/star.png",
     "test/rails_root/public/images/icons/stop.png",
     "test/rails_root/public/images/icons/thumb_down.png",
     "test/rails_root/public/images/icons/thumb_up.png",
     "test/rails_root/public/images/icons/vote.png",
     "test/rails_root/public/images/loading.gif",
     "test/rails_root/public/images/nothing.png",
     "test/rails_root/public/images/profile_default.jpg",
     "test/rails_root/public/images/rails.png",
     "test/rails_root/public/images/spinner.gif",
     "test/rails_root/public/images/sprites.png",
     "test/rails_root/public/javascripts/application.js",
     "test/rails_root/public/javascripts/builder.js",
     "test/rails_root/public/javascripts/controls.js",
     "test/rails_root/public/javascripts/dragdrop.js",
     "test/rails_root/public/javascripts/effects.js",
     "test/rails_root/public/javascripts/fancyzoom.min.js",
     "test/rails_root/public/javascripts/jquery/jquery-ui.js",
     "test/rails_root/public/javascripts/jquery/jquery.easing.js",
     "test/rails_root/public/javascripts/jquery/jquery.fancybox.js",
     "test/rails_root/public/javascripts/jquery/jquery.form.js",
     "test/rails_root/public/javascripts/jquery/jquery.jgrowl.js",
     "test/rails_root/public/javascripts/jquery/jquery.js",
     "test/rails_root/public/javascripts/jquery/jquery.tips.js",
     "test/rails_root/public/javascripts/jquery/jrails.js",
     "test/rails_root/public/javascripts/muck.js",
     "test/rails_root/public/javascripts/muck_activities.js",
     "test/rails_root/public/javascripts/muck_time/en.js",
     "test/rails_root/public/javascripts/prototype.js",
     "test/rails_root/public/javascripts/scriptaculous.js",
     "test/rails_root/public/javascripts/slider.js",
     "test/rails_root/public/javascripts/sound.js",
     "test/rails_root/public/robots.txt",
     "test/rails_root/public/stylesheets/.keep",
     "test/rails_root/public/stylesheets/admin.css",
     "test/rails_root/public/stylesheets/blueprint/ie.css",
     "test/rails_root/public/stylesheets/blueprint/liquid_screen.css",
     "test/rails_root/public/stylesheets/blueprint/plugins/buttons/icons/cross.png",
     "test/rails_root/public/stylesheets/blueprint/plugins/buttons/icons/key.png",
     "test/rails_root/public/stylesheets/blueprint/plugins/buttons/icons/tick.png",
     "test/rails_root/public/stylesheets/blueprint/plugins/buttons/readme.txt",
     "test/rails_root/public/stylesheets/blueprint/plugins/buttons/screen.css",
     "test/rails_root/public/stylesheets/blueprint/plugins/fancy-type/readme.txt",
     "test/rails_root/public/stylesheets/blueprint/plugins/fancy-type/screen.css",
     "test/rails_root/public/stylesheets/blueprint/plugins/link-icons/icons/doc.png",
     "test/rails_root/public/stylesheets/blueprint/plugins/link-icons/icons/email.png",
     "test/rails_root/public/stylesheets/blueprint/plugins/link-icons/icons/external.png",
     "test/rails_root/public/stylesheets/blueprint/plugins/link-icons/icons/feed.png",
     "test/rails_root/public/stylesheets/blueprint/plugins/link-icons/icons/im.png",
     "test/rails_root/public/stylesheets/blueprint/plugins/link-icons/icons/pdf.png",
     "test/rails_root/public/stylesheets/blueprint/plugins/link-icons/icons/visited.png",
     "test/rails_root/public/stylesheets/blueprint/plugins/link-icons/icons/xls.png",
     "test/rails_root/public/stylesheets/blueprint/plugins/link-icons/readme.txt",
     "test/rails_root/public/stylesheets/blueprint/plugins/link-icons/screen.css",
     "test/rails_root/public/stylesheets/blueprint/plugins/liquid/liquid.css",
     "test/rails_root/public/stylesheets/blueprint/plugins/liquid/src/liquid.css",
     "test/rails_root/public/stylesheets/blueprint/plugins/rtl/readme.txt",
     "test/rails_root/public/stylesheets/blueprint/plugins/rtl/screen.css",
     "test/rails_root/public/stylesheets/blueprint/print.css",
     "test/rails_root/public/stylesheets/blueprint/screen.css",
     "test/rails_root/public/stylesheets/blueprint/sprite.css",
     "test/rails_root/public/stylesheets/blueprint/src/forms.css",
     "test/rails_root/public/stylesheets/blueprint/src/grid.css",
     "test/rails_root/public/stylesheets/blueprint/src/grid.png",
     "test/rails_root/public/stylesheets/blueprint/src/ie.css",
     "test/rails_root/public/stylesheets/blueprint/src/print.css",
     "test/rails_root/public/stylesheets/blueprint/src/reset.css",
     "test/rails_root/public/stylesheets/blueprint/src/typography.css",
     "test/rails_root/public/stylesheets/jquery/cupertino/images/ui-bg_diagonals-small_0_aaaaaa_40x40.png",
     "test/rails_root/public/stylesheets/jquery/cupertino/images/ui-bg_diagonals-thick_15_444444_40x40.png",
     "test/rails_root/public/stylesheets/jquery/cupertino/images/ui-bg_glass_100_f0f0f0_1x400.png",
     "test/rails_root/public/stylesheets/jquery/cupertino/images/ui-bg_glass_50_99c2ff_1x400.png",
     "test/rails_root/public/stylesheets/jquery/cupertino/images/ui-bg_glass_55_fbf5d0_1x400.png",
     "test/rails_root/public/stylesheets/jquery/cupertino/images/ui-bg_glass_80_e6e6e6_1x400.png",
     "test/rails_root/public/stylesheets/jquery/cupertino/images/ui-bg_glass_95_fef1ec_1x400.png",
     "test/rails_root/public/stylesheets/jquery/cupertino/images/ui-bg_highlight-hard_100_f9f9f9_1x100.png",
     "test/rails_root/public/stylesheets/jquery/cupertino/images/ui-bg_highlight-soft_100_e7eef3_1x100.png",
     "test/rails_root/public/stylesheets/jquery/cupertino/images/ui-icons_222222_256x240.png",
     "test/rails_root/public/stylesheets/jquery/cupertino/images/ui-icons_2694e8_256x240.png",
     "test/rails_root/public/stylesheets/jquery/cupertino/images/ui-icons_2e83ff_256x240.png",
     "test/rails_root/public/stylesheets/jquery/cupertino/images/ui-icons_72a7cf_256x240.png",
     "test/rails_root/public/stylesheets/jquery/cupertino/images/ui-icons_888888_256x240.png",
     "test/rails_root/public/stylesheets/jquery/cupertino/images/ui-icons_cd0a0a_256x240.png",
     "test/rails_root/public/stylesheets/jquery/cupertino/images/ui-icons_ffffff_256x240.png",
     "test/rails_root/public/stylesheets/jquery/cupertino/jquery-ui-1.7.1.custom.css",
     "test/rails_root/public/stylesheets/jquery/jquery.fancybox.css",
     "test/rails_root/public/stylesheets/jquery/redmond/images/ui-bg_flat_0_aaaaaa_40x100.png",
     "test/rails_root/public/stylesheets/jquery/redmond/images/ui-bg_flat_55_fbec88_40x100.png",
     "test/rails_root/public/stylesheets/jquery/redmond/images/ui-bg_glass_75_d0e5f5_1x400.png",
     "test/rails_root/public/stylesheets/jquery/redmond/images/ui-bg_glass_85_dfeffc_1x400.png",
     "test/rails_root/public/stylesheets/jquery/redmond/images/ui-bg_glass_95_fef1ec_1x400.png",
     "test/rails_root/public/stylesheets/jquery/redmond/images/ui-bg_gloss-wave_55_5c9ccc_500x100.png",
     "test/rails_root/public/stylesheets/jquery/redmond/images/ui-bg_inset-hard_100_f5f8f9_1x100.png",
     "test/rails_root/public/stylesheets/jquery/redmond/images/ui-bg_inset-hard_100_fcfdfd_1x100.png",
     "test/rails_root/public/stylesheets/jquery/redmond/images/ui-icons_217bc0_256x240.png",
     "test/rails_root/public/stylesheets/jquery/redmond/images/ui-icons_2e83ff_256x240.png",
     "test/rails_root/public/stylesheets/jquery/redmond/images/ui-icons_469bdd_256x240.png",
     "test/rails_root/public/stylesheets/jquery/redmond/images/ui-icons_6da8d5_256x240.png",
     "test/rails_root/public/stylesheets/jquery/redmond/images/ui-icons_cd0a0a_256x240.png",
     "test/rails_root/public/stylesheets/jquery/redmond/images/ui-icons_d8e7f3_256x240.png",
     "test/rails_root/public/stylesheets/jquery/redmond/images/ui-icons_f9bd01_256x240.png",
     "test/rails_root/public/stylesheets/jquery/redmond/jquery-ui-1.7.1.custom.css",
     "test/rails_root/public/stylesheets/jquery/smoothness/images/ui-bg_flat_0_aaaaaa_40x100.png",
     "test/rails_root/public/stylesheets/jquery/smoothness/images/ui-bg_flat_75_ffffff_40x100.png",
     "test/rails_root/public/stylesheets/jquery/smoothness/images/ui-bg_glass_55_fbf9ee_1x400.png",
     "test/rails_root/public/stylesheets/jquery/smoothness/images/ui-bg_glass_65_ffffff_1x400.png",
     "test/rails_root/public/stylesheets/jquery/smoothness/images/ui-bg_glass_75_dadada_1x400.png",
     "test/rails_root/public/stylesheets/jquery/smoothness/images/ui-bg_glass_75_e6e6e6_1x400.png",
     "test/rails_root/public/stylesheets/jquery/smoothness/images/ui-bg_glass_95_fef1ec_1x400.png",
     "test/rails_root/public/stylesheets/jquery/smoothness/images/ui-bg_highlight-soft_75_cccccc_1x100.png",
     "test/rails_root/public/stylesheets/jquery/smoothness/images/ui-icons_222222_256x240.png",
     "test/rails_root/public/stylesheets/jquery/smoothness/images/ui-icons_2e83ff_256x240.png",
     "test/rails_root/public/stylesheets/jquery/smoothness/images/ui-icons_454545_256x240.png",
     "test/rails_root/public/stylesheets/jquery/smoothness/images/ui-icons_888888_256x240.png",
     "test/rails_root/public/stylesheets/jquery/smoothness/images/ui-icons_cd0a0a_256x240.png",
     "test/rails_root/public/stylesheets/jquery/smoothness/jquery-ui-1.7.1.custom.css",
     "test/rails_root/public/stylesheets/jquery/ui-lightness/images/ui-bg_diagonals-thick_18_b81900_40x40.png",
     "test/rails_root/public/stylesheets/jquery/ui-lightness/images/ui-bg_diagonals-thick_20_666666_40x40.png",
     "test/rails_root/public/stylesheets/jquery/ui-lightness/images/ui-bg_flat_10_000000_40x100.png",
     "test/rails_root/public/stylesheets/jquery/ui-lightness/images/ui-bg_glass_100_f6f6f6_1x400.png",
     "test/rails_root/public/stylesheets/jquery/ui-lightness/images/ui-bg_glass_100_fdf5ce_1x400.png",
     "test/rails_root/public/stylesheets/jquery/ui-lightness/images/ui-bg_glass_65_ffffff_1x400.png",
     "test/rails_root/public/stylesheets/jquery/ui-lightness/images/ui-bg_gloss-wave_35_f6a828_500x100.png",
     "test/rails_root/public/stylesheets/jquery/ui-lightness/images/ui-bg_highlight-soft_100_eeeeee_1x100.png",
     "test/rails_root/public/stylesheets/jquery/ui-lightness/images/ui-bg_highlight-soft_75_ffe45c_1x100.png",
     "test/rails_root/public/stylesheets/jquery/ui-lightness/images/ui-icons_222222_256x240.png",
     "test/rails_root/public/stylesheets/jquery/ui-lightness/images/ui-icons_228ef1_256x240.png",
     "test/rails_root/public/stylesheets/jquery/ui-lightness/images/ui-icons_ef8c08_256x240.png",
     "test/rails_root/public/stylesheets/jquery/ui-lightness/images/ui-icons_ffd27a_256x240.png",
     "test/rails_root/public/stylesheets/jquery/ui-lightness/images/ui-icons_ffffff_256x240.png",
     "test/rails_root/public/stylesheets/jquery/ui-lightness/jquery-ui-1.7.1.custom.css",
     "test/rails_root/public/stylesheets/muck-invites.css",
     "test/rails_root/public/stylesheets/reset.css",
     "test/rails_root/public/stylesheets/styles.css",
     "test/rails_root/public/stylesheets/themes/blue/styles.css",
     "test/rails_root/public/stylesheets/themes/red/styles.css",
     "test/rails_root/script/about",
     "test/rails_root/script/breakpointer",
     "test/rails_root/script/console",
     "test/rails_root/script/create_project.rb",
     "test/rails_root/script/cucumber",
     "test/rails_root/script/dbconsole",
     "test/rails_root/script/destroy",
     "test/rails_root/script/generate",
     "test/rails_root/script/performance/benchmarker",
     "test/rails_root/script/performance/profiler",
     "test/rails_root/script/performance/request",
     "test/rails_root/script/plugin",
     "test/rails_root/script/process/inspector",
     "test/rails_root/script/process/reaper",
     "test/rails_root/script/process/spawner",
     "test/rails_root/script/runner",
     "test/rails_root/script/server",
     "test/rails_root/test/functional/.keep",
     "test/rails_root/test/functional/invites_controller_test.rb",
     "test/rails_root/test/test_helper.rb",
     "test/rails_root/test/unit/.keep",
     "test/rails_root/test/unit/contacts_test.rb",
     "test/rails_root/test/unit/invite_mailer_test.rb",
     "test/rails_root/test/unit/invite_test.rb",
     "test/rails_root/test/unit/invitee_test.rb",
     "test/rails_root/test/unit/user_test.rb",
     "test/rails_root/vendor/plugins/jrails/CHANGELOG",
     "test/rails_root/vendor/plugins/jrails/LICENSE",
     "test/rails_root/vendor/plugins/jrails/README.rdoc",
     "test/rails_root/vendor/plugins/jrails/Rakefile",
     "test/rails_root/vendor/plugins/jrails/VERSION.yml",
     "test/rails_root/vendor/plugins/jrails/bin/jrails",
     "test/rails_root/vendor/plugins/jrails/init.rb",
     "test/rails_root/vendor/plugins/jrails/install.rb",
     "test/rails_root/vendor/plugins/jrails/javascripts/jquery-ui.js",
     "test/rails_root/vendor/plugins/jrails/javascripts/jquery.js",
     "test/rails_root/vendor/plugins/jrails/javascripts/jrails.js",
     "test/rails_root/vendor/plugins/jrails/javascripts/sources/jrails.js",
     "test/rails_root/vendor/plugins/jrails/jrails.gemspec",
     "test/rails_root/vendor/plugins/jrails/lib/jrails.rb",
     "test/rails_root/vendor/plugins/jrails/rails/init.rb",
     "test/rails_root/vendor/plugins/jrails/tasks/jrails.rake",
     "test/rails_root/vendor/plugins/ssl_requirement/README",
     "test/rails_root/vendor/plugins/ssl_requirement/lib/ssl_requirement.rb",
     "test/rails_root/vendor/plugins/ssl_requirement/test/ssl_requirement_test.rb",
     "uninstall.rb"
  ]
  s.homepage = %q{http://github.com/tatemae/muck_invites}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{muck-invites}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{The invite engine for the muck system}
  s.test_files = [
    "test/rails_root/app/controllers/application_controller.rb",
     "test/rails_root/app/controllers/default_controller.rb",
     "test/rails_root/app/helpers/application_helper.rb",
     "test/rails_root/app/models/activity.rb",
     "test/rails_root/app/models/invite.rb",
     "test/rails_root/app/models/invitee.rb",
     "test/rails_root/app/models/user.rb",
     "test/rails_root/app/models/user_session.rb",
     "test/rails_root/config/boot.rb",
     "test/rails_root/config/environment.rb",
     "test/rails_root/config/environments/cucumber.rb",
     "test/rails_root/config/environments/development.rb",
     "test/rails_root/config/environments/production.rb",
     "test/rails_root/config/environments/test.rb",
     "test/rails_root/config/initializers/inflections.rb",
     "test/rails_root/config/initializers/mime_types.rb",
     "test/rails_root/config/initializers/requires.rb",
     "test/rails_root/config/initializers/session_store.rb",
     "test/rails_root/config/routes.rb",
     "test/rails_root/db/migrate/20090320174818_create_muck_permissions_and_roles.rb",
     "test/rails_root/db/migrate/20090402033319_add_muck_activities.rb",
     "test/rails_root/db/migrate/20090402234137_create_languages.rb",
     "test/rails_root/db/migrate/20090426041056_create_countries.rb",
     "test/rails_root/db/migrate/20090426041103_create_states.rb",
     "test/rails_root/db/migrate/20090602041838_create_users.rb",
     "test/rails_root/db/migrate/20090608073052_create_friends.rb",
     "test/rails_root/db/migrate/20090703055724_add_contents.rb",
     "test/rails_root/db/migrate/20090704220055_create_slugs.rb",
     "test/rails_root/db/migrate/20090928213532_create_invites.rb",
     "test/rails_root/db/migrate/20091128170318_make_invites_polymorphic.rb",
     "test/rails_root/features/step_definitions/comment_steps.rb",
     "test/rails_root/features/step_definitions/common_steps.rb",
     "test/rails_root/features/step_definitions/webrat_steps.rb",
     "test/rails_root/features/support/env.rb",
     "test/rails_root/features/support/paths.rb",
     "test/rails_root/public/dispatch.rb",
     "test/rails_root/script/create_project.rb",
     "test/rails_root/test/functional/invites_controller_test.rb",
     "test/rails_root/test/test_helper.rb",
     "test/rails_root/test/unit/contacts_test.rb",
     "test/rails_root/test/unit/invite_mailer_test.rb",
     "test/rails_root/test/unit/invite_test.rb",
     "test/rails_root/test/unit/invitee_test.rb",
     "test/rails_root/test/unit/user_test.rb",
     "test/rails_root/vendor/plugins/jrails/init.rb",
     "test/rails_root/vendor/plugins/jrails/install.rb",
     "test/rails_root/vendor/plugins/jrails/lib/jrails.rb",
     "test/rails_root/vendor/plugins/jrails/rails/init.rb",
     "test/rails_root/vendor/plugins/ssl_requirement/lib/ssl_requirement.rb",
     "test/rails_root/vendor/plugins/ssl_requirement/test/ssl_requirement_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<contacts>, [">= 0"])
      s.add_runtime_dependency(%q<muck-engine>, [">= 0"])
    else
      s.add_dependency(%q<contacts>, [">= 0"])
      s.add_dependency(%q<muck-engine>, [">= 0"])
    end
  else
    s.add_dependency(%q<contacts>, [">= 0"])
    s.add_dependency(%q<muck-engine>, [">= 0"])
  end
end
