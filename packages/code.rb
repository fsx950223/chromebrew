require 'package'

class Code < Package
  description 'Visual Studio Code is a source code editor developed by Microsoft for Windows, Linux and macOS.'
  homepage 'https://code.visualstudio.com/'
  case ARCH
  when 'x86_64'
    version '1.25.1'
    source_url 'https://vscode-update.azurewebsites.net/1.25.1/linux-x64/stable'
    source_sha256 '5856bbebf38aa05d584da4722869bbe507cf123f69f7ffab5f1532d73dbf3438'
  when 'i686'
    version '1.25.1'
    source_url 'https://vscode-update.azurewebsites.net/1.25.1/linux-ia32/stable'
    source_sha256 'af6adc2e2500e50bfebe7ee7b97d661b6e774a590136bf5f89334132a5b292e2'
  else
    version '1.21.1'
    source_url 'https://github.com/fsx950223/vscode-arm/releases/download/1.21.1/code.tar.gz'
    source_sha256 '3df9b3db973b493e93116606a9433db49fd82d259c5ad7574eb65f962109ce20'
  end

  binary_url ({
  })
  binary_sha256 ({
  })

  depends_on 'gtk2'
  depends_on 'libgconf'
  depends_on 'xdg_base'
  depends_on 'sommelier'
  def self.install
    case ARCH
    when 'x86_64', 'i686', 'armv7l', 'aarch64'
      system "mkdir", "-p", "#{CREW_DEST_PREFIX}/share/code"
      system "mkdir", "-p", "#{CREW_DEST_PREFIX}/bin"
      system "cp", "-rpa", ".", "#{CREW_DEST_PREFIX}/share/code/"
      system "ln", "-s", "#{CREW_PREFIX}/share/code/bin/code", "#{CREW_DEST_PREFIX}/bin/code"
    end
  end

  def self.postinstall
    puts
    puts 'Congratulations! You have installed Visual Studio Code on Chrome OS!'.lightgreen
    puts 'Now, please run \'code\' to start Visual Studio.'.lightgreen
    puts 'Happy coding!'.lightgreen
    puts
  end
end
