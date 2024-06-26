class WAScripts < Formula
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

  def uninstall
    # Run the check_uninstall.sh script with parameters
    system "#{bin}/wa.binary", "possible", "uninstall"

    # Check if the script was successful
    if $?.exitstatus == 0
      # Future uninstall requirements
    else
      odie "Uninstallation not allowed. Please delete the condition file to proceed."
    end
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
