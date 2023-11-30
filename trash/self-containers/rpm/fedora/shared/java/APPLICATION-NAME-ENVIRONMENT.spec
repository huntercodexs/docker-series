# SPEC file overview:
# https://docs.fedoraproject.org/en-US/quick-docs/creating-rpm-packages/#con_rpm-spec-file-overview
# Fedora packaging guidelines:
# https://docs.fedoraproject.org/en-US/packaging-guidelines/
#
# NOTE: Specific to JAR projects
#

Name:		APPLICATION-NAME-ENVIRONMENT
Version:	20.01.1
Release:	0
Summary:	APPLICATION-NAME-ENVIRONMENT

#Put the correct License, example: MIT, GNU, GNU 3.0, APACHE, ASL 2.0 etc...
License:	ASL 2.0
URL:		https://github.com/huntercodexs
Source0:	APPLICATION-NAME-%{version}-SNAPSHOT.jar
Source1:	%{name}.service
Source2:	application.properties
Source3:	log4j2.xml

BuildRequires:	systemd
%{?systemd_requires}
Requires:	shadow-utils,bash

%description
%{summary}

# disable debuginfo, which is useless on binary-only packages
%define debug_package %{nil}

# do not repack jar files
%define __jar_repack %{nil}

%prep
%build
%pre
# create Spring Starter service group
getent group ${USER} >/dev/null || groupadd -f -g 30001 -r ${USER}

# create Spring Starter service user
if ! getent passwd ${USER} >/dev/null ; then
    if ! getent passwd 30001 >/dev/null ; then
      useradd -r -u 30001 -g ${USER} -d /home/${USER} -s /sbin/nologin -c "${USER} account" ${USER}
    else
      useradd -r -g ${USER}  -d /home/${USER} -s /sbin/nologin -c "mappv account" ${USER}
    fi
fi
exit 0

%install
app_dir=%{buildroot}/opt/${USER}/APPLICATION-NAME
config_dir=%{buildroot}/etc/opt/${USER}/APPLICATION-NAME
data_dir=%{buildroot}/var/opt/${USER}/APPLICATION-NAME
log_dir=%{buildroot}/var/log/${USER}/APPLICATION-NAME
service_dir=%{buildroot}/%{_unitdir}
# cleanup build root
rm -rf %{buildroot}
mkdir -p  %{buildroot}

# create app folder
mkdir -p $app_dir

# create data folder
mkdir -p $config_dir

# create data folder
mkdir -p $data_dir

# create service folder
mkdir -p $service_dir

# create LOG folder
mkdir -p $log_dir

# copy all files
cp %{SOURCE0} $app_dir/APPLICATION-NAME.jar
cp %{SOURCE1} $service_dir
cp %{SOURCE2} $config_dir
cp %{SOURCE3} $config_dir


%files
# define default file attributes
%defattr(-,${USER},${USER},-)

# list of directories that are packaged
%dir /opt/${USER}/APPLICATION-NAME
%dir /etc/opt/${USER}/APPLICATION-NAME
%dir /var/log/${USER}/APPLICATION-NAME

%dir %attr(660, -, -) /var/opt/${USER}/APPLICATION-NAME

# list of files that are packaged
/opt/${USER}/APPLICATION-NAME/APPLICATION-NAME.jar
/etc/opt/${USER}/APPLICATION-NAME/application.properties
/usr/lib/systemd/system/%{name}.service
/etc/opt/${USER}/APPLICATION-NAME/log4j2.xml
%post

# ensure Spring Starter service is enabled and running
%systemd_post %{name}.service
%{_bindir}/systemctl enable %{name}.service
%{_bindir}/systemctl start %{name}.service

##### UNINSTALL SECTION #####
%preun

# ensure Spring Starter service is disabled and stopped
%systemd_preun %{name}.service

%postun

case "$1" in
	0) # This is a package remove

		# remove app and data folders
		rm -rf /opt/${USER}/APPLICATION-NAME
		rm -rf /etc/opt/${USER}/APPLICATION-NAME
		rm -rf /var/log/${USER}/APPLICATION-NAME
		# remove Spring Starter service user and group
		#userdel ${USER}
	;;
	1) # This is a package upgrade
		# do nothing
	;;
esac

# ensure Spring Starter service restartet if an upgrade is performed
%systemd_postun_with_restart %{name}.service

##### CHANGELOG SECTION #####
%changelog

* Mon Jan 1 2020 HUNTERCODEXS - 20.01.1-0
%doc
%license


