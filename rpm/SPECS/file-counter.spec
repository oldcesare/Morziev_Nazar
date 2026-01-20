Name: file-counter
Version: 1.0
Release: 1
Summary: Bash script counting files in /etc
License: GPL
BuildArch: noarch
Source0: file-counter-1.0.tar.gz

%description
Counts regular files in /etc excluding directories and symlinks.

%prep
%setup -q

%install
mkdir -p %{buildroot}/usr/local/bin
cp count_files.sh %{buildroot}/usr/local/bin/file-counter

%files
/usr/local/bin/file-counter

