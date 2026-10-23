# Janus Docker image

Builds the base Janus Keycloak Docker image that is used in our cluster.

## Extensions

This distribution contains the following extensions:

| Component              | Status             | Repository                                              | Description                                                              |
| ---------------------- | ------------------ | ------------------------------------------------------- | ------------------------------------------------------------------------ |
| 🚫 TOTP Admin API         | :white_check_mark: | https://github.com/janus-iam/keycloak-totp-admin-api    | Exposes TOTP lifecycle endpoints in the Keycloak Admin REST API.         |
| ✅ Kete                   | :white_check_mark: | https://github.com/FortuneN/kete                        | Streams matched Keycloak events to various destinations and formats.     |

## Disabled features

The image disables the following Keycloak features via `KC_FEATURES_DISABLED`. The variable is part of the image environment, so a container start keeps these features disabled:

| Feature                   | Description                                                                                          |
| ------------------------- | ---------------------------------------------------------------------------------------------------- |
| `organization`            | Multi-tenancy support for organizing users, groups, and clients into hierarchical organizational units. |
| `workflows`               | User-facing approval workflows for actions such as registration, password reset, and role requests.  |
| `impersonation`           | Admin or user impersonation, allowing one identity to act as another.                                |
| `authorization`           | OAuth 2.0 authorization services (RPT-based policies, scopes, and fine-grained client protection).   |
| `scripts`                 | Server-side JavaScript execution for custom logic (e.g., user storage providers, SPIs).              |
| `admin-fine-grained-authz` | Fine-grained admin console permissions via the admin authorization services.                        |
| `identity-brokering-api`  | OAuth 2.0 / OpenID Connect provider discovery and setup APIs.                                        |
| `twitter-broker`          | Twitter as a social identity provider (brokering) option.                                            |
| `kerberos`                | Kerberos / SSO integration for browser-based single sign-on.                                         |
| `jwt-authorization-grant` | JWT-as-authorization-grant flow for client credential exchange.                                      |
| `scim-api`                | SCIM 2.0 REST API for user and group provisioning.                                                   |
| `ciba`                    | Client Initiated Backchannel Authentication (CIBA) — asynchronous device-to-server auth.             |
| `step-up-authentication-saml` | Step-up authentication enforcement for SAML assertions.                                           |
| `user-event-metrics`      | Metrics collection and analytics for user lifecycle events.                                          |
| `log-mdc`                 | Logging MDC (Mapped Diagnostic Context) integration for contextual log lines.                        |
