Name:       parameter
Version:    2017.06
Release:    2%{?dist}
Summary:    ACS Start scripts
License:    LGPL
URL:        http://csrg-utfsm.github.io
Source0:    %{name}-%{version}.tar.gz
#BuildRequires:  ACS-Tools-Kit-Benchmark-devel >= %{version} ACS-acsidlcommon >= %{version}
#Requires:   ACS-Tools-Kit-Benchmark >= %{version}

%description
ACS Start Scripts in Python, C++ and Bash

%prep
%setup -q

%build
ls -lR

%install
mkdir -p %{buildroot}%{_usr}/local/lib/python/site-packages/
mkdir -p %{buildroot}%{_usr}/local/share/java/
mkdir -p %{buildroot}%{_usr}/local/%{_lib}/
mkdir -p %{buildroot}%{_usr}/local/bin/

#move libs
mv lib/* %{buildroot}%{_usr}/local/%{_lib}/

%files
#move libs
%{_usr}/local/%{_lib}/*

%changelog
* Fri Dec 08 2017 Maximiliano Osorio-Bañados+mosorio@inf.utfsm.cl - 2017.06-2
- Automatic Packaging

