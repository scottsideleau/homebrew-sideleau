class Gitless < Formula
  # Bottle should work on MacOS < 10.11 (El Capitan), but fails in 10.11
  # due to the introduction of SIP protection on python/site-packages paths.
  desc "Experimental version control system built on top of Git."
  homepage "http://gitless.com"
  url "https://github.com/scottsideleau/gitless/archive/master.tar.gz"
  version "0.8.3-1"
  sha256 "146fdf96774b39b93549d23bb4a453edc8a4f5a8881823f2a83998eaab3b89da"

  depends_on "python"
  depends_on "python3"
  depends_on "git"
  depends_on "libgit2"

  def install
    ENV["LANG"] = "en_US.UTF-8"
    version = Language::Python.major_minor_version "python3"
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{version}/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{version}/site-packages"
    ENV.prepend_create_path "PYTHONPATH", "#{HOMEBREW_PREFIX}/lib/python#{version}/site-packages"

    system "pip3.5", "install", "pygit2"
    system "pip3.5", "install", "."
  end

  test do
    system "gl", "--version"
  end
end
