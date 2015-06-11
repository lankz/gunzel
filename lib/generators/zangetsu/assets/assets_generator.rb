class Zangetsu::AssetsGenerator < Rails::Generators::Base
  def self.source_root
    Rails.root.join('bower_components')
  end

  def clean
    remove_file 'build/assets'
  end

  def jquery
    copy_file 'jquery/dist/jquery.js',
              'build/assets/javascripts/jquery.js'
  end

  def modernizr
    copy_file 'modernizr/modernizr.js',
              'build/assets/javascripts/modernizr.js'
  end

  def respond
    copy_file 'respond/dest/respond.src.js',
              'build/assets/javascripts/respond.js'
  end

  def fontawesome
    directory 'fontawesome/scss',
              'build/assets/stylesheets/fontawesome'

    gsub_file 'build/assets/stylesheets/fontawesome/_path.scss',
              /url\(\'.+?\/(fontawesome-webfont.(eot|svg|ttf|woff2|woff)).+?'\)/, 'font-url(\'fontawesome/\1\')'

    directory 'fontawesome/fonts',
              'build/assets/fonts/fontawesome',
              :exclude_pattern => /^((?!\.(eot|svg|ttf|woff2|woff)$).)*$/i
  end

  def bootstrap
    directory 'bootstrap-sass/assets/stylesheets',
              'build/assets/stylesheets/bootstrap',
              :exclude_pattern => /^((?!\.scss$).)*$/i

    directory 'bootstrap-sass/assets/javascripts',
              'build/assets/javascripts/bootstrap',
              :exclude_pattern => /^((?!\.js$).)*$/i

    directory 'bootstrap-sass/assets/fonts/bootstrap',
              'build/assets/fonts/bootstrap',
              :exclude_pattern => /^((?!\.(eot|svg|ttf|woff2|woff)$).)*$/i
  end
end
