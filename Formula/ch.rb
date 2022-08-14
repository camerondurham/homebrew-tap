# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Ch < Formula
  desc "Docker config and shell manager for using (or misusing) containers as dev environments"
  homepage "https://github.com/camerondurham/ch"
  version "0.3.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/camerondurham/ch/releases/download/v0.3.5/ch-darwin-arm64.zip"
      sha256 "ed38a72e1be376a5282eee36086d6f6d376c66296d3eee52775a3c386c145ca9"

      def install
        bin.install "ch"

        bash_output = Utils.safe_popen_read("#{bin}/ch", "completion", "bash")
        (bash_completion/"ch").write bash_output
        zsh_output = Utils.safe_popen_read("#{bin}/ch", "completion", "zsh")
        (zsh_completion/"_ch").write zsh_output
      end
    end

    # if Hardware::CPU.intel?
    #   url "https://github.com/camerondurham/ch/releases/download/v0.3.5/ch-darwin-amd64.zip"
    #   sha256 "ed38a72e1be376a5282eee36086d6f6d376c66296d3eee52775a3c386c145ca9"

    #   def install
    #     bin.install "ch"

    #     bash_output = Utils.safe_popen_read("#{bin}/ch", "completion", "bash")
    #     (bash_completion/"ch").write bash_output
    #     zsh_output = Utils.safe_popen_read("#{bin}/ch", "completion", "zsh")
    #     (zsh_completion/"_ch").write zsh_output
    #   end
    # end
  end

  # on_linux
  #   if Hardware::CPU.intel?
  #     url "https://github.com/camerondurham/ch/releases/download/v0.3.5/ch-linux-amd64.zip"
  #     sha256 "b41bebd25fd7bb1a67dc2cd5ee12c9f67073094567fdf7b3871f05fd74a45fdd"
  #   end
  #   if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
  #     url "https://github.com/camerondurham/ch/releases/download/v0.3.5/ch-linux-arm64.zip"
  #     sha256 "97cadca3c3c3f36388a4a601acf878dd356d6275a976bee516798b72bfdbeecf"
  #   end
  # end

  test do
    system "#{bin}/ch --version"
  end
end

