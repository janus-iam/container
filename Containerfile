ARG KEYCLOAK_VERSION=26.8.1

FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION} AS builder

# renovate: datasource=github-releases depName=janus-iam/keycloak-totp-admin-api
#ARG TOTP_ADMIN_API_VERSION=1.2.0

# renovate: datasource=github-releases depName=FortuneN/kete
ARG KETE_VERSION=2026.03.23.23.48

#ADD --chown=keycloak:keycloak --chmod=644 https://github.com/janus-iam/keycloak-totp-admin-api/releases/download/v${TOTP_ADMIN_API_VERSION}/keycloak-totp-admin-api-${TOTP_ADMIN_API_VERSION}.jar /opt/keycloak/providers/keycloak-totp-admin-api-${TOTP_ADMIN_API_VERSION}.jar

ADD --chown=keycloak:keycloak --chmod=644 https://github.com/FortuneN/kete/releases/download/${KETE_VERSION}/kete.jar /opt/keycloak/providers/kete.jar

# Build-time options passed only to `kc.sh build` are dropped when the container
# starts without `--optimized`. Keycloak then rebuilds with defaults, which
# turns these features back on. Keeping the same values in the image environment
# makes a normal start and an optimized start agree.
ENV KC_DB=postgres \
    KC_HTTP_RELATIVE_PATH=/auth \
    KC_HEALTH_ENABLED=true \
    KC_METRICS_ENABLED=true \
    KC_TRACING_ENABLED=true \
    KC_EVENT_METRICS_USER_ENABLED=true \
    KC_SPI_EVENTS_LISTENER__KETE__ENABLED=true \
    KC_SPI_EVENTS_LISTENER__KETE__METRICS_ENABLED=true \
    KC_FEATURES_DISABLED=organization,workflows,impersonation,authorization,scripts,admin-fine-grained-authz

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION}
COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENV KC_DB=postgres \
    KC_HTTP_RELATIVE_PATH=/auth \
    KC_HEALTH_ENABLED=true \
    KC_METRICS_ENABLED=true \
    KC_TRACING_ENABLED=true \
    KC_EVENT_METRICS_USER_ENABLED=true \
    KC_SPI_EVENTS_LISTENER__KETE__ENABLED=true \
    KC_SPI_EVENTS_LISTENER__KETE__METRICS_ENABLED=true \
    KC_FEATURES_DISABLED=organization,workflows,impersonation,authorization,scripts,admin-fine-grained-authz

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
