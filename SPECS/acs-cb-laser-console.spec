Name:       laser-console
Version:    2017.08
Release:    2%{?dist}
Summary:    ACS CommonSoftware Module
License:    LGPL
URL:        http://csrg-utfsm.github.io
Source0:    %{name}-%{version}.tar.gz
Requires:   ACS-Tools-Kit-Benchmark <= %{version}

%description
 %{name} CommonSoftware Module light RPM

%prep
%setup -q

%build
ls -lR

%install
#mkdir -p %{buildroot}%{_usr}/local/lib/python/site-packages/
mkdir -p %{buildroot}%{_usr}/local/share/java/
#mkdir -p %{buildroot}%{_usr}/local/%{_lib}/
#mkdir -p %{buildroot}%{_usr}/local/bin/

# Copying files from buildir to buildroot
#cp %{_builddir}/%{name}-%{version}/bin/* %{buildroot}%{_usr}/local/bin/
#cp %{_builddir}/%{name}-%{version}/lib/* %{buildroot}%{_usr}/local/%{_lib}/
#cp -r %{_builddir}/%{name}-%{version}/site-packages/* %{buildroot}%{_usr}/local/lib/python/site-packages/
cp %{_builddir}/%{name}-%{version}/java/* %{buildroot}%{_usr}/local/share/java/

%files
#%{_usr}/local/bin/*
#%{_usr}/local/%{_lib}/*
%{_usr}/local/share/java/*
#%{_usr}/local/lib/python/site-packages/*

%changelog
* Fri Dec 08 2017 Maximiliano Osorio-Bañados+mosorio@inf.utfsm.cl - 2017.08-2
- Automatic Packaging

