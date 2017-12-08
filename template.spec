Name:       ACS-acsstartup
Version:    2017.08

Release:    1%{?dist}
Summary:    ACS Start scripts
License:    LGPL
URL:        http://csrg-utfsm.github.io
Source0:    %{name}-%{version}.tar.gz
Requires:   ACS-Tools-Kit-Benchmark <= %{version}

%description
ACS Start Scripts in Python, C++ and Bash

%prep
%setup -q

#%build

%install
cp -r %{_builddir}/%{name}-%{version}/* %{buildroot}/

%files
%{_usr}/local/bin/*
%{_usr}/local/%{_lib}/*
%{_usr}/local/share/java/*
%{_usr}/local/lib/python/site-packages/*

%changelog
