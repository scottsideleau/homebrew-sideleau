class Gitless < Formula
  desc "Experimental version control system built on top of Git."
  homepage "http://gitless.com"
  url "https://github.com/sdg-mit/gitless/archive/v0.8.4.tar.gz"
  sha256 "ecde4887eb20109a0345a1bfee420140522f981deff335d552908a00952853c8"

  depends_on "python3"
  depends_on "git"
  depends_on "libgit2"

  def install
    ENV["LANG"] = "en_US.UTF-8"
    version = Language::Python.major_minor_version "python3"
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{version}/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{version}/site-packages"
    ENV.prepend_create_path "PYTHONPATH", "#{HOMEBREW_PREFIX}/lib/python#{version}/site-packages"

    system "pip3", "install", "pygit2"
    system "python3", "setup.py", "install"
  end

  test do
    system "gl", "--version"
  end
end
