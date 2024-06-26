class WaScripts < Formula
  desc "WA application"
  homepage "https://github.com/emdeevy/wa.scripts"
  url "https://github.com/emdeevy/wa.scripts.git", :using => :git, :branch => "main"
  version "1.0.0b"

  def install
    bin.install "wa.binary"
    prefix.install "wa.runner"
  end

  def post_install
    puts "Please run 'wa.config' to properly set up wa.scripts"
    ohai "Please run 'wa.config' to properly set up wa.scripts"
  end

  def post_uninstall
    puts "Uninstalled wa.scripts. Remember to clean up any configuration files manually."
  end

  def caveats
    <<~EOS
      To use `wa` in the current shell, please run:
        source ~/.bashrc
        or
        source ~/.zshrc

      This needs to be done after installation and after every shell restart.
    EOS
  end
end
