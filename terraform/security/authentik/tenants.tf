data "authentik_tenant" "authentik-default" {
  domain = "authentik-default"
}

resource "authentik_tenant" "pollreisz" {
  domain              = var.external_domain
  default             = false
  branding_title      = "Pollreisz"
  flow_authentication = authentik_flow.pollreisz-authentication.uuid
  flow_invalidation   = data.authentik_flow.default-invalidation-flow.id
  flow_user_settings  = data.authentik_flow.default-user-settings-flow.id
  branding_logo       = "/media/branding/pollreisz-logo.svg"
  branding_favicon    = "/media/branding/pollreisz-favicon.png"
}
