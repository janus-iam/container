# Janus Docker image

Builds the base Janus Keycloak Docker image that is used in our cluster.

## Extensions

This distribution contains the following extensions:

| Component              | Status             | Repository                                              | Description                                                              |
| ---------------------- | ------------------ | ------------------------------------------------------- | ------------------------------------------------------------------------ |
| TOTP Admin API         | :white_check_mark: | https://github.com/janus-iam/keycloak-totp-admin-api    | Exposes TOTP lifecycle endpoints in the Keycloak Admin REST API.         |
| Kete                   | :white_check_mark: | https://github.com/FortuneN/kete                        | Streams matched Keycloak events to various destinations and formats.     |

## Disabled features

The image disables the following Keycloak features with `KC_FEATURES_DISABLED`. The variable is part of the image environment, so a container start keeps these features disabled:

- `organization`
- `workflows`
- `impersonation`
- `authorization`
- `scripts`
- `admin-fine-grained-authz`

In addition to the [features disabled by default](https://www.keycloak.org/server/features#_disabled_by_default)

## Differences to come

### Cache

This will package a `cache-ispn-jdbc-ping.xml` for setting up Infinispan/JGroups discovery via the `JDBC` ping protocol.
