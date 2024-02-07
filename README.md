# Helm Chart another-ldap-auth

Use it like any other Helm Chart.

## Helm repo setup

Once Helm is locally installed, add the repo as follows:

```bash
helm repo add nginx-ldap-auth https://jgkirschbaum.github.io/another-ldap-auth
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo another-ldap-auth`
to see the charts.

## App installation

To install the `another-ldap-auth` chart:

```bash
helm upgrade --install -n mynamespace my-another-ldap-auth nginx-ldap-auth/another-ldap-auth
```

## App uninstallation

To uninstall the chart:

```bash
helm delete -n mynamespace my-another-ldap-auth
```
