pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Run script from repo') {
            steps {
                sh 'chmod +x count_files.sh'
                sh './count_files.sh'
            }
        }

        stage('Build DEB (no install)') {
            steps {
                sh '''
                  rm -rf deb
                  mkdir -p deb/file-counter/DEBIAN
                  mkdir -p deb/file-counter/usr/local/bin
                  cp count_files.sh deb/file-counter/usr/local/bin/file-counter

                  cat > deb/file-counter/DEBIAN/control <<'EOF'
Package: file-counter
Version: 1.0
Section: base
Priority: optional
Architecture: all
Maintainer: Nazar Morziev
Description: Counts regular files in /etc directory
EOF

                  dpkg-deb --build deb/file-counter
                  ls -l deb/file-counter.deb
                '''
            }
        }

        stage('Build RPM (no install)') {
            steps {
                sh '''
                  rm -rf rpm file-counter-1.0 file_counter-1.0 file-counter-1.0
                  mkdir -p rpm/{BUILD,RPMS,SOURCES,SPECS,SRPMS}

                  mkdir -p file-counter-1.0
                  cp count_files.sh file-counter-1.0/

                  tar -czf rpm/SOURCES/file-counter-1.0.tar.gz file-counter-1.0

                  cat > rpm/SPECS/file-counter.spec <<'EOF'
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
EOF

                  rpmbuild --define "_topdir $(pwd)/rpm" -ba rpm/SPECS/file-counter.spec
                  ls -l rpm/RPMS/noarch/*.rpm
                '''
            }
        }
    }
}


