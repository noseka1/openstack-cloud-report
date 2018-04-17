# openstack-cloud-report

In OpenStack, we were missing some kind of reporting on resource usage. In our organization, each development team has its dedicated project in OpenStack. It is important to us to understand, how much of the cloud resources each team is consuming, i.e. how many CPU cores, memory, and volumes. In addition to per project usage, we also monitor the total resource usage across the entire cluster. In the case, that the total usage is reaching the total capacity available we can organize additional hardware ahead of time.

Around OpenStack Mitaka release, we didn't find any tool that would generate the usage reports. However, OpenStack's MariaDB database contains all the input data required to create such reports. And so we created this set of SQL scripts to generate the reports directly out of the OpenStack's database. We run these scripts periodically using Icinga, so that we can see the report output on our monitoring dashboard. 
