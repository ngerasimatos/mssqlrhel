oc new-project mssql --as system:admin
oc adm policy add-scc-to-user anyuid -z default --as system:admin
oc new-app https://github.com/ngerasimatos/mssqlrhel  --as system:admin
oc env "dc/mssqlrhel" -e ACCEPT_EULA=y -e SA_PASSWORD=RedHat123! --as system:admin
oc volume "dc/mssqlrhel" --add --mount-path=/var/opt/mssql --type=persistentVolumeClaim --claim-name=mssqlrhel --claim-mode="ReadWriteOnce" --claim-size=1G --as system:admin
sleep 20
oc logs -f bc/mssqlrhel --as system:admin

