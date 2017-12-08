Name:       ACS-acsstartup
Version:    2017.06
Release:    1%{?dist}
Summary:    ACS Start scripts
License:    LGPL
URL:        http://csrg-utfsm.github.io
Source0:    %{name}-%{version}.tar.gz
BuildRequires:  ACS-Tools-Kit-Benchmark-devel >= %{version} ACS-acsidlcommon >= %{version}
Requires:   ACS-Tools-Kit-Benchmark >= %{version}

%description
ACS Start Scripts in Python, C++ and Bash

%prep
%setup -q

%build


%install
mkdir -p %{buildroot}%{_usr}/local/lib/python/site-packages/
#mv %{_builddir}/%{name}-%{version}/LGPL/CommonSoftware/acserridl/ws/lib/python/site-packages/ACSErr__POA/ %{buildroot}%{_usr}/local/lib/python/site-packages/

mkdir -p %{buildroot}%{_usr}/local/share/java/
#mv %{_builddir}/%{name}-%{version}/LGPL/CommonSoftware/acserridl/ws/lib/acserr.jar %{buildroot}%{_usr}/local/share/java/

mkdir -p %{buildroot}%{_usr}/local/%{_lib}/
#mv %{_builddir}/%{name}-%{version}/LGPL/CommonSoftware/acserridl/ws/lib/libacserrStubs.so %{buildroot}%{_usr}/local/%{_lib}/
# Clean
cd %{buildroot}%{_usr}/local/lib/python/site-packages/

%files


%changelog
* Wed Dec 6 2017 Maximiliano Osorio <mosorio@inf.utfsm.cl> - 0.1-1
Initial Packaging

