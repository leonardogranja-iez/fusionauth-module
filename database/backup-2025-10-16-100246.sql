--
-- PostgreSQL database dump
--

\restrict EP8nRn8kgELKkBMj96IDFUKNJWS0aC9Buax7L9WAti4Mt0H68q4sq7BVd1ae3jA

-- Dumped from database version 14.19 (Debian 14.19-1.pgdg13+1)
-- Dumped by pg_dump version 14.19 (Debian 14.19-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: application_daily_active_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_daily_active_users (
    applications_id uuid NOT NULL,
    count integer NOT NULL,
    day integer NOT NULL
);


ALTER TABLE public.application_daily_active_users OWNER TO postgres;

--
-- Name: application_monthly_active_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_monthly_active_users (
    applications_id uuid NOT NULL,
    count integer NOT NULL,
    month integer NOT NULL
);


ALTER TABLE public.application_monthly_active_users OWNER TO postgres;

--
-- Name: application_oauth_scopes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_oauth_scopes (
    id uuid NOT NULL,
    applications_id uuid NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.application_oauth_scopes OWNER TO postgres;

--
-- Name: application_registration_counts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_registration_counts (
    applications_id uuid NOT NULL,
    count integer NOT NULL,
    decremented_count integer NOT NULL,
    hour integer NOT NULL
);


ALTER TABLE public.application_registration_counts OWNER TO postgres;

--
-- Name: application_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_roles (
    id uuid NOT NULL,
    applications_id uuid NOT NULL,
    description character varying(255),
    insert_instant bigint NOT NULL,
    is_default boolean NOT NULL,
    is_super_role boolean NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.application_roles OWNER TO postgres;

--
-- Name: applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applications (
    id uuid NOT NULL,
    access_token_populate_lambdas_id uuid,
    access_token_signing_keys_id uuid,
    active boolean NOT NULL,
    admin_registration_forms_id uuid NOT NULL,
    data text NOT NULL,
    email_update_email_templates_id uuid,
    email_verification_email_templates_id uuid,
    email_verified_email_templates_id uuid,
    forgot_password_email_templates_id uuid,
    forms_id uuid,
    id_token_populate_lambdas_id uuid,
    id_token_signing_keys_id uuid,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    login_id_in_use_on_create_email_templates_id uuid,
    login_id_in_use_on_update_email_templates_id uuid,
    login_new_device_email_templates_id uuid,
    login_suspicious_email_templates_id uuid,
    multi_factor_email_message_templates_id uuid,
    multi_factor_sms_message_templates_id uuid,
    name character varying(191) NOT NULL,
    passwordless_email_templates_id uuid,
    password_update_email_templates_id uuid,
    password_reset_success_email_templates_id uuid,
    phone_configuration_forgot_password_templates_id uuid,
    phone_configuration_identity_update_templates_id uuid,
    phone_configuration_login_id_in_use_on_create_templates_id uuid,
    phone_configuration_login_id_in_use_on_update_templates_id uuid,
    phone_configuration_login_new_device_templates_id uuid,
    phone_configuration_login_suspicious_templates_id uuid,
    phone_configuration_passwordless_templates_id uuid,
    phone_configuration_password_reset_success_templates_id uuid,
    phone_configuration_password_update_templates_id uuid,
    phone_configuration_set_password_templates_id uuid,
    phone_configuration_two_factor_method_add_templates_id uuid,
    phone_configuration_two_factor_method_remove_templates_id uuid,
    phone_configuration_verification_complete_templates_id uuid,
    phone_configuration_verification_templates_id uuid,
    samlv2_default_verification_keys_id uuid,
    samlv2_issuer character varying(191),
    samlv2_keys_id uuid,
    samlv2_logout_keys_id uuid,
    samlv2_logout_default_verification_keys_id uuid,
    samlv2_populate_lambdas_id uuid,
    samlv2_single_logout_keys_id uuid,
    self_service_registration_validation_lambdas_id uuid,
    self_service_user_forms_id uuid,
    set_password_email_templates_id uuid,
    tenants_id uuid,
    themes_id uuid,
    two_factor_method_add_email_templates_id uuid,
    two_factor_method_remove_email_templates_id uuid,
    ui_ip_access_control_lists_id uuid,
    universal boolean DEFAULT false NOT NULL,
    userinfo_populate_lambdas_id uuid,
    verification_email_templates_id uuid
);


ALTER TABLE public.applications OWNER TO postgres;

--
-- Name: asynchronous_tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asynchronous_tasks (
    id uuid NOT NULL,
    data text,
    entity_id uuid,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    nodes_id uuid,
    status smallint NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.asynchronous_tasks OWNER TO postgres;

--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_logs (
    id bigint NOT NULL,
    insert_instant bigint NOT NULL,
    insert_user character varying(255) NOT NULL,
    message text NOT NULL,
    data text
);


ALTER TABLE public.audit_logs OWNER TO postgres;

--
-- Name: audit_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audit_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audit_logs_id_seq OWNER TO postgres;

--
-- Name: audit_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audit_logs_id_seq OWNED BY public.audit_logs.id;


--
-- Name: authentication_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authentication_keys (
    id uuid NOT NULL,
    expiration_instant bigint,
    insert_instant bigint NOT NULL,
    ip_access_control_lists_id uuid,
    last_update_instant bigint NOT NULL,
    key_format smallint,
    key_manager boolean NOT NULL,
    key_value character varying(191) NOT NULL,
    permissions text,
    meta_data text,
    name character varying(191),
    tenants_id uuid,
    CONSTRAINT authentication_keys_chk_1 CHECK (((key_format <> 1) OR (name IS NOT NULL)))
);


ALTER TABLE public.authentication_keys OWNER TO postgres;

--
-- Name: breached_password_metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.breached_password_metrics (
    tenants_id uuid NOT NULL,
    matched_exact_count integer NOT NULL,
    matched_sub_address_count integer NOT NULL,
    matched_common_password_count integer NOT NULL,
    matched_password_count integer NOT NULL,
    passwords_checked_count integer NOT NULL
);


ALTER TABLE public.breached_password_metrics OWNER TO postgres;

--
-- Name: clean_speak_applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clean_speak_applications (
    applications_id uuid NOT NULL,
    clean_speak_application_id uuid NOT NULL
);


ALTER TABLE public.clean_speak_applications OWNER TO postgres;

--
-- Name: common_breached_passwords; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.common_breached_passwords (
    password character varying(191) NOT NULL
);


ALTER TABLE public.common_breached_passwords OWNER TO postgres;

--
-- Name: connectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.connectors (
    id uuid NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    reconcile_lambdas_id uuid,
    ssl_certificate_keys_id uuid,
    type smallint NOT NULL
);


ALTER TABLE public.connectors OWNER TO postgres;

--
-- Name: connectors_tenants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.connectors_tenants (
    connectors_id uuid NOT NULL,
    data text NOT NULL,
    sequence smallint NOT NULL,
    tenants_id uuid NOT NULL
);


ALTER TABLE public.connectors_tenants OWNER TO postgres;

--
-- Name: consents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consents (
    id uuid NOT NULL,
    consent_email_templates_id uuid,
    data text,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    email_plus_email_templates_id uuid
);


ALTER TABLE public.consents OWNER TO postgres;

--
-- Name: current_usage_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.current_usage_stats (
    last_checked_instant bigint NOT NULL,
    last_modified_instant bigint NOT NULL,
    stats text NOT NULL
);


ALTER TABLE public.current_usage_stats OWNER TO postgres;

--
-- Name: data_sets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_sets (
    name character varying(191) NOT NULL,
    last_update_instant bigint NOT NULL
);


ALTER TABLE public.data_sets OWNER TO postgres;

--
-- Name: email_templates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_templates (
    id uuid NOT NULL,
    default_from_name character varying(255),
    default_html_template text NOT NULL,
    default_subject character varying(255) NOT NULL,
    default_text_template text NOT NULL,
    from_email character varying(255),
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    localized_from_names text,
    localized_html_templates text NOT NULL,
    localized_subjects text NOT NULL,
    localized_text_templates text NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.email_templates OWNER TO postgres;

--
-- Name: entities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities (
    id uuid NOT NULL,
    client_id character varying(191) NOT NULL,
    client_secret character varying(255) NOT NULL,
    data text,
    entity_types_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(255) NOT NULL,
    parent_id uuid,
    tenants_id uuid NOT NULL
);


ALTER TABLE public.entities OWNER TO postgres;

--
-- Name: entity_entity_grant_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entity_entity_grant_permissions (
    entity_entity_grants_id uuid NOT NULL,
    entity_type_permissions_id uuid NOT NULL
);


ALTER TABLE public.entity_entity_grant_permissions OWNER TO postgres;

--
-- Name: entity_entity_grants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entity_entity_grants (
    id uuid NOT NULL,
    data text,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    recipient_id uuid NOT NULL,
    target_id uuid NOT NULL
);


ALTER TABLE public.entity_entity_grants OWNER TO postgres;

--
-- Name: entity_type_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entity_type_permissions (
    id uuid NOT NULL,
    data text,
    description text,
    entity_types_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    is_default boolean NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.entity_type_permissions OWNER TO postgres;

--
-- Name: entity_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entity_types (
    id uuid NOT NULL,
    access_token_signing_keys_id uuid,
    data text,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.entity_types OWNER TO postgres;

--
-- Name: entity_user_grant_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entity_user_grant_permissions (
    entity_user_grants_id uuid NOT NULL,
    entity_type_permissions_id uuid NOT NULL
);


ALTER TABLE public.entity_user_grant_permissions OWNER TO postgres;

--
-- Name: entity_user_grants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entity_user_grants (
    id uuid NOT NULL,
    data text,
    entities_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.entity_user_grants OWNER TO postgres;

--
-- Name: event_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_logs (
    id bigint NOT NULL,
    insert_instant bigint NOT NULL,
    message text NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.event_logs OWNER TO postgres;

--
-- Name: event_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_logs_id_seq OWNER TO postgres;

--
-- Name: event_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_logs_id_seq OWNED BY public.event_logs.id;


--
-- Name: external_identifiers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.external_identifiers (
    id character varying(191) NOT NULL,
    applications_id uuid,
    data text,
    expiration_instant bigint,
    insert_instant bigint NOT NULL,
    tenants_id uuid NOT NULL,
    type smallint NOT NULL,
    users_id uuid
);


ALTER TABLE public.external_identifiers OWNER TO postgres;

--
-- Name: families; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.families (
    data text,
    family_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    owner boolean NOT NULL,
    role smallint NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.families OWNER TO postgres;

--
-- Name: federated_domains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_domains (
    identity_providers_id uuid NOT NULL,
    domain character varying(191) NOT NULL
);


ALTER TABLE public.federated_domains OWNER TO postgres;

--
-- Name: form_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form_fields (
    id uuid NOT NULL,
    consents_id uuid,
    data text,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.form_fields OWNER TO postgres;

--
-- Name: form_steps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form_steps (
    form_fields_id uuid NOT NULL,
    forms_id uuid NOT NULL,
    sequence smallint NOT NULL,
    step smallint NOT NULL
);


ALTER TABLE public.form_steps OWNER TO postgres;

--
-- Name: forms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forms (
    id uuid NOT NULL,
    data text,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.forms OWNER TO postgres;

--
-- Name: global_daily_active_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.global_daily_active_users (
    count integer NOT NULL,
    day integer NOT NULL
);


ALTER TABLE public.global_daily_active_users OWNER TO postgres;

--
-- Name: global_monthly_active_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.global_monthly_active_users (
    count integer NOT NULL,
    month integer NOT NULL
);


ALTER TABLE public.global_monthly_active_users OWNER TO postgres;

--
-- Name: global_registration_counts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.global_registration_counts (
    count integer NOT NULL,
    decremented_count integer NOT NULL,
    hour integer NOT NULL
);


ALTER TABLE public.global_registration_counts OWNER TO postgres;

--
-- Name: group_application_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_application_roles (
    application_roles_id uuid NOT NULL,
    groups_id uuid NOT NULL
);


ALTER TABLE public.group_application_roles OWNER TO postgres;

--
-- Name: group_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_members (
    id uuid NOT NULL,
    groups_id uuid NOT NULL,
    data text,
    insert_instant bigint NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.group_members OWNER TO postgres;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id uuid NOT NULL,
    data text,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    tenants_id uuid NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: hourly_logins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hourly_logins (
    applications_id uuid NOT NULL,
    count integer NOT NULL,
    data text,
    hour integer NOT NULL
);


ALTER TABLE public.hourly_logins OWNER TO postgres;

--
-- Name: identities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identities (
    id bigint NOT NULL,
    breached_password_last_checked_instant bigint,
    breached_password_status smallint,
    connectors_id uuid,
    email character varying(191),
    encryption_scheme character varying(255),
    factor integer,
    insert_instant bigint NOT NULL,
    last_login_instant bigint,
    last_update_instant bigint NOT NULL,
    password character varying(255),
    password_change_reason smallint,
    password_change_required boolean,
    password_last_update_instant bigint,
    is_primary boolean,
    salt character varying(255),
    status smallint NOT NULL,
    tenants_id uuid NOT NULL,
    type smallint,
    username character varying(191),
    username_index character varying(191),
    username_status smallint,
    users_id uuid NOT NULL,
    display_value character varying(191),
    value character varying(191),
    verified boolean NOT NULL,
    verified_instant bigint,
    verified_reason smallint
);


ALTER TABLE public.identities OWNER TO postgres;

--
-- Name: identities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.identities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.identities_id_seq OWNER TO postgres;

--
-- Name: identities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.identities_id_seq OWNED BY public.identities.id;


--
-- Name: identity_provider_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider_links (
    data text NOT NULL,
    identity_providers_id uuid NOT NULL,
    identity_providers_user_id character varying(191) NOT NULL,
    insert_instant bigint NOT NULL,
    last_login_instant bigint NOT NULL,
    tenants_id uuid NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.identity_provider_links OWNER TO postgres;

--
-- Name: identity_providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_providers (
    id uuid NOT NULL,
    data text NOT NULL,
    enabled boolean NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    type character varying(255) NOT NULL,
    keys_id uuid,
    request_signing_keys_id uuid,
    reconcile_lambdas_id uuid
);


ALTER TABLE public.identity_providers OWNER TO postgres;

--
-- Name: identity_providers_applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_providers_applications (
    applications_id uuid NOT NULL,
    data text NOT NULL,
    enabled boolean NOT NULL,
    identity_providers_id uuid NOT NULL,
    keys_id uuid
);


ALTER TABLE public.identity_providers_applications OWNER TO postgres;

--
-- Name: identity_providers_tenants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_providers_tenants (
    tenants_id uuid NOT NULL,
    data text NOT NULL,
    identity_providers_id uuid NOT NULL
);


ALTER TABLE public.identity_providers_tenants OWNER TO postgres;

--
-- Name: instance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instance (
    id uuid NOT NULL,
    activate_instant bigint,
    data text,
    license text,
    license_id character varying(255),
    setup_complete boolean NOT NULL,
    tenant_manager_applications_id uuid NOT NULL
);


ALTER TABLE public.instance OWNER TO postgres;

--
-- Name: integrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.integrations (
    data text NOT NULL
);


ALTER TABLE public.integrations OWNER TO postgres;

--
-- Name: ip_access_control_lists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ip_access_control_lists (
    id uuid NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.ip_access_control_lists OWNER TO postgres;

--
-- Name: ip_location_database; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ip_location_database (
    data bytea NOT NULL,
    last_modified bigint NOT NULL,
    seq integer NOT NULL
);


ALTER TABLE public.ip_location_database OWNER TO postgres;

--
-- Name: ip_location_meta_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ip_location_meta_data (
    digest character varying(255) NOT NULL,
    last_modified bigint NOT NULL
);


ALTER TABLE public.ip_location_meta_data OWNER TO postgres;

--
-- Name: keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keys (
    id uuid NOT NULL,
    algorithm character varying(255),
    certificate text,
    expiration_instant bigint,
    insert_instant bigint NOT NULL,
    issuer character varying(255),
    kid character varying(191) NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    private_key text,
    public_key text,
    secret text,
    type character varying(255) NOT NULL
);


ALTER TABLE public.keys OWNER TO postgres;

--
-- Name: kickstart_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kickstart_files (
    id uuid NOT NULL,
    kickstart bytea NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.kickstart_files OWNER TO postgres;

--
-- Name: lambdas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lambdas (
    id uuid NOT NULL,
    body text NOT NULL,
    debug boolean NOT NULL,
    engine_type character varying(255) NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(255) NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.lambdas OWNER TO postgres;

--
-- Name: last_login_instants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.last_login_instants (
    applications_id uuid,
    registration_last_login_instant bigint,
    users_id uuid,
    user_last_login_instant bigint,
    identities_value character varying(191),
    identities_type smallint
);


ALTER TABLE public.last_login_instants OWNER TO postgres;

--
-- Name: locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locks (
    type character varying(191) NOT NULL,
    update_instant bigint
);


ALTER TABLE public.locks OWNER TO postgres;

--
-- Name: master_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.master_record (
    id uuid NOT NULL,
    instant bigint NOT NULL
);


ALTER TABLE public.master_record OWNER TO postgres;

--
-- Name: message_templates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message_templates (
    id uuid NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.message_templates OWNER TO postgres;

--
-- Name: messengers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messengers (
    id uuid NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.messengers OWNER TO postgres;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    name character varying(191) NOT NULL,
    run_instant bigint NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: nodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nodes (
    id uuid NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_checkin_instant bigint NOT NULL,
    runtime_mode character varying(255) NOT NULL,
    url character varying(255) NOT NULL
);


ALTER TABLE public.nodes OWNER TO postgres;

--
-- Name: previous_passwords; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.previous_passwords (
    insert_instant bigint NOT NULL,
    encryption_scheme character varying(255) NOT NULL,
    factor integer NOT NULL,
    password character varying(2048) NOT NULL,
    salt character varying(255) NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.previous_passwords OWNER TO postgres;

--
-- Name: raw_application_daily_active_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raw_application_daily_active_users (
    applications_id uuid NOT NULL,
    day integer NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.raw_application_daily_active_users OWNER TO postgres;

--
-- Name: raw_application_monthly_active_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raw_application_monthly_active_users (
    applications_id uuid NOT NULL,
    month integer NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.raw_application_monthly_active_users OWNER TO postgres;

--
-- Name: raw_application_registration_counts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raw_application_registration_counts (
    id bigint NOT NULL,
    applications_id uuid NOT NULL,
    count integer NOT NULL,
    decremented_count integer NOT NULL,
    hour integer NOT NULL
);


ALTER TABLE public.raw_application_registration_counts OWNER TO postgres;

--
-- Name: raw_application_registration_counts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.raw_application_registration_counts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.raw_application_registration_counts_id_seq OWNER TO postgres;

--
-- Name: raw_application_registration_counts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.raw_application_registration_counts_id_seq OWNED BY public.raw_application_registration_counts.id;


--
-- Name: raw_global_daily_active_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raw_global_daily_active_users (
    day integer NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.raw_global_daily_active_users OWNER TO postgres;

--
-- Name: raw_global_monthly_active_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raw_global_monthly_active_users (
    month integer NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.raw_global_monthly_active_users OWNER TO postgres;

--
-- Name: raw_global_registration_counts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raw_global_registration_counts (
    id bigint NOT NULL,
    count integer NOT NULL,
    decremented_count integer NOT NULL,
    hour integer NOT NULL
);


ALTER TABLE public.raw_global_registration_counts OWNER TO postgres;

--
-- Name: raw_global_registration_counts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.raw_global_registration_counts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.raw_global_registration_counts_id_seq OWNER TO postgres;

--
-- Name: raw_global_registration_counts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.raw_global_registration_counts_id_seq OWNED BY public.raw_global_registration_counts.id;


--
-- Name: raw_logins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raw_logins (
    applications_id uuid,
    instant bigint NOT NULL,
    ip_address character varying(255),
    identities_value character varying(191),
    identities_type smallint,
    users_id uuid NOT NULL
);


ALTER TABLE public.raw_logins OWNER TO postgres;

--
-- Name: refresh_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refresh_tokens (
    id uuid NOT NULL,
    applications_id uuid,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    start_instant bigint NOT NULL,
    tenants_id uuid,
    token character varying(191),
    token_hash character(64),
    token_hash_n1 character varying(44),
    token_seed character varying(20),
    token_text text,
    users_id uuid NOT NULL
);


ALTER TABLE public.refresh_tokens OWNER TO postgres;

--
-- Name: request_frequencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.request_frequencies (
    count integer NOT NULL,
    last_update_instant bigint NOT NULL,
    request_id character varying(191) NOT NULL,
    tenants_id uuid NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE public.request_frequencies OWNER TO postgres;

--
-- Name: scim_external_id_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scim_external_id_groups (
    entities_id uuid NOT NULL,
    external_id character varying(255) NOT NULL,
    groups_id uuid NOT NULL
);


ALTER TABLE public.scim_external_id_groups OWNER TO postgres;

--
-- Name: scim_external_id_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scim_external_id_users (
    entities_id uuid NOT NULL,
    external_id character varying(255) NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.scim_external_id_users OWNER TO postgres;

--
-- Name: system_configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_configuration (
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    report_timezone character varying(255) NOT NULL
);


ALTER TABLE public.system_configuration OWNER TO postgres;

--
-- Name: tenants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tenants (
    id uuid NOT NULL,
    access_token_signing_keys_id uuid NOT NULL,
    admin_user_forms_id uuid NOT NULL,
    client_credentials_access_token_populate_lambdas_id uuid,
    confirm_child_email_templates_id uuid,
    data text,
    email_update_email_templates_id uuid,
    email_verified_email_templates_id uuid,
    failed_authentication_user_actions_id uuid,
    family_request_email_templates_id uuid,
    forgot_password_email_templates_id uuid,
    id_token_signing_keys_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    login_id_in_use_on_create_email_templates_id uuid,
    login_id_in_use_on_update_email_templates_id uuid,
    login_new_device_email_templates_id uuid,
    login_suspicious_email_templates_id uuid,
    login_validation_lambdas_id uuid,
    multi_factor_email_message_templates_id uuid,
    multi_factor_sms_message_templates_id uuid,
    multi_factor_sms_messengers_id uuid,
    name character varying(191) NOT NULL,
    password_reset_success_email_templates_id uuid,
    password_update_email_templates_id uuid,
    parent_registration_email_templates_id uuid,
    passwordless_email_templates_id uuid,
    phone_configuration_forgot_password_templates_id uuid,
    phone_configuration_identity_update_templates_id uuid,
    phone_configuration_login_id_in_use_on_create_templates_id uuid,
    phone_configuration_login_id_in_use_on_update_templates_id uuid,
    phone_configuration_login_new_device_templates_id uuid,
    phone_configuration_login_suspicious_templates_id uuid,
    phone_configuration_messengers_id uuid,
    phone_configuration_passwordless_templates_id uuid,
    phone_configuration_password_reset_success_templates_id uuid,
    phone_configuration_password_update_templates_id uuid,
    phone_configuration_set_password_templates_id uuid,
    phone_configuration_two_factor_method_add_templates_id uuid,
    phone_configuration_two_factor_method_remove_templates_id uuid,
    phone_configuration_verification_complete_templates_id uuid,
    phone_configuration_verification_templates_id uuid,
    scim_client_entity_types_id uuid,
    scim_enterprise_user_request_converter_lambdas_id uuid,
    scim_enterprise_user_response_converter_lambdas_id uuid,
    scim_group_request_converter_lambdas_id uuid,
    scim_group_response_converter_lambdas_id uuid,
    scim_server_entity_types_id uuid,
    scim_user_request_converter_lambdas_id uuid,
    scim_user_response_converter_lambdas_id uuid,
    set_password_email_templates_id uuid,
    themes_id uuid NOT NULL,
    two_factor_method_add_email_templates_id uuid,
    two_factor_method_remove_email_templates_id uuid,
    ui_ip_access_control_lists_id uuid,
    verification_email_templates_id uuid
);


ALTER TABLE public.tenants OWNER TO postgres;

--
-- Name: themes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.themes (
    id uuid NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    name character varying(191) NOT NULL
);


ALTER TABLE public.themes OWNER TO postgres;

--
-- Name: usage_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usage_stats (
    application_version character varying(255) NOT NULL,
    instance_id uuid NOT NULL,
    collection_duration bigint NOT NULL,
    collection_instant bigint NOT NULL,
    failed_stats text,
    sent boolean NOT NULL,
    stats text NOT NULL,
    stats_version character varying(255) NOT NULL,
    timings text NOT NULL
);


ALTER TABLE public.usage_stats OWNER TO postgres;

--
-- Name: user_action_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_action_logs (
    id uuid NOT NULL,
    actioner_users_id uuid,
    actionee_users_id uuid NOT NULL,
    comment text,
    email_user_on_end boolean NOT NULL,
    end_event_sent boolean,
    expiry bigint,
    history text,
    insert_instant bigint NOT NULL,
    localized_name character varying(191),
    localized_option character varying(255),
    localized_reason character varying(255),
    name character varying(191),
    notify_user_on_end boolean NOT NULL,
    option_name character varying(255),
    reason character varying(255),
    reason_code character varying(255),
    user_actions_id uuid NOT NULL
);


ALTER TABLE public.user_action_logs OWNER TO postgres;

--
-- Name: user_action_logs_applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_action_logs_applications (
    applications_id uuid NOT NULL,
    user_action_logs_id uuid NOT NULL
);


ALTER TABLE public.user_action_logs_applications OWNER TO postgres;

--
-- Name: user_action_reasons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_action_reasons (
    id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    localized_texts text,
    text character varying(191) NOT NULL,
    code character varying(191) NOT NULL
);


ALTER TABLE public.user_action_reasons OWNER TO postgres;

--
-- Name: user_actions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_actions (
    id uuid NOT NULL,
    active boolean NOT NULL,
    cancel_email_templates_id uuid,
    end_email_templates_id uuid,
    include_email_in_event_json boolean NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    localized_names text,
    modify_email_templates_id uuid,
    name character varying(191) NOT NULL,
    options text,
    prevent_login boolean NOT NULL,
    send_end_event boolean NOT NULL,
    start_email_templates_id uuid,
    temporal boolean NOT NULL,
    transaction_type smallint NOT NULL,
    user_notifications_enabled boolean NOT NULL,
    user_emailing_enabled boolean NOT NULL
);


ALTER TABLE public.user_actions OWNER TO postgres;

--
-- Name: user_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_comments (
    id uuid NOT NULL,
    comment text,
    commenter_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.user_comments OWNER TO postgres;

--
-- Name: user_consents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_consents (
    id uuid NOT NULL,
    consents_id uuid NOT NULL,
    data text,
    giver_users_id uuid NOT NULL,
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.user_consents OWNER TO postgres;

--
-- Name: user_consents_email_plus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_consents_email_plus (
    id bigint NOT NULL,
    next_email_instant bigint NOT NULL,
    user_consents_id uuid NOT NULL
);


ALTER TABLE public.user_consents_email_plus OWNER TO postgres;

--
-- Name: user_consents_email_plus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_consents_email_plus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_consents_email_plus_id_seq OWNER TO postgres;

--
-- Name: user_consents_email_plus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_consents_email_plus_id_seq OWNED BY public.user_consents_email_plus.id;


--
-- Name: user_registrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_registrations (
    id uuid NOT NULL,
    applications_id uuid NOT NULL,
    authentication_token character varying(255),
    clean_speak_id uuid,
    data text,
    insert_instant bigint NOT NULL,
    last_login_instant bigint,
    last_update_instant bigint NOT NULL,
    timezone character varying(255),
    username character varying(191),
    username_status smallint NOT NULL,
    users_id uuid NOT NULL,
    verified boolean NOT NULL,
    verified_instant bigint
);


ALTER TABLE public.user_registrations OWNER TO postgres;

--
-- Name: user_registrations_application_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_registrations_application_roles (
    application_roles_id uuid NOT NULL,
    user_registrations_id uuid NOT NULL
);


ALTER TABLE public.user_registrations_application_roles OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    active boolean NOT NULL,
    breached_password_last_checked_instant bigint,
    breached_password_status smallint,
    birth_date character(10),
    clean_speak_id uuid,
    connectors_id uuid,
    data text,
    expiry bigint,
    first_name character varying(255),
    full_name character varying(255),
    image_url text,
    insert_instant bigint NOT NULL,
    last_name character varying(255),
    last_login_instant bigint,
    last_update_instant bigint NOT NULL,
    middle_name character varying(255),
    mobile_phone character varying(255),
    parent_email character varying(255),
    password character varying(2048),
    password_change_reason smallint,
    password_change_required boolean,
    password_encryption_scheme character varying(255),
    password_factor integer,
    password_last_update_instant bigint,
    password_salt character varying(255),
    tenants_id uuid NOT NULL,
    timezone character varying(255),
    verified_instant bigint
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.version (
    version character varying(255) NOT NULL
);


ALTER TABLE public.version OWNER TO postgres;

--
-- Name: webauthn_credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webauthn_credentials (
    id uuid NOT NULL,
    credential_id text NOT NULL,
    data text NOT NULL,
    insert_instant bigint NOT NULL,
    last_use_instant bigint NOT NULL,
    tenants_id uuid NOT NULL,
    users_id uuid NOT NULL
);


ALTER TABLE public.webauthn_credentials OWNER TO postgres;

--
-- Name: webhook_attempt_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webhook_attempt_logs (
    id uuid NOT NULL,
    data text,
    end_instant bigint NOT NULL,
    start_instant bigint NOT NULL,
    webhook_event_logs_id uuid NOT NULL,
    webhooks_id uuid
);


ALTER TABLE public.webhook_attempt_logs OWNER TO postgres;

--
-- Name: webhook_event_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webhook_event_logs (
    id uuid NOT NULL,
    data text,
    event_result smallint NOT NULL,
    event_type character varying(64) NOT NULL,
    insert_instant bigint NOT NULL,
    last_attempt_instant bigint,
    last_update_instant bigint NOT NULL,
    linked_object_id uuid,
    sequence bigint NOT NULL
);


ALTER TABLE public.webhook_event_logs OWNER TO postgres;

--
-- Name: webhook_event_logs_sequence_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.webhook_event_logs_sequence_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webhook_event_logs_sequence_seq OWNER TO postgres;

--
-- Name: webhook_event_logs_sequence_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.webhook_event_logs_sequence_seq OWNED BY public.webhook_event_logs.sequence;


--
-- Name: webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webhooks (
    id uuid NOT NULL,
    connect_timeout integer NOT NULL,
    description character varying(255),
    data text,
    global boolean NOT NULL,
    headers text,
    http_authentication_username character varying(255),
    http_authentication_password character varying(255),
    insert_instant bigint NOT NULL,
    last_update_instant bigint NOT NULL,
    read_timeout integer NOT NULL,
    signing_keys_id uuid,
    ssl_certificate text,
    ssl_certificate_keys_id uuid,
    url text NOT NULL
);


ALTER TABLE public.webhooks OWNER TO postgres;

--
-- Name: webhooks_tenants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webhooks_tenants (
    webhooks_id uuid NOT NULL,
    tenants_id uuid NOT NULL
);


ALTER TABLE public.webhooks_tenants OWNER TO postgres;

--
-- Name: audit_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs ALTER COLUMN id SET DEFAULT nextval('public.audit_logs_id_seq'::regclass);


--
-- Name: event_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_logs ALTER COLUMN id SET DEFAULT nextval('public.event_logs_id_seq'::regclass);


--
-- Name: identities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identities ALTER COLUMN id SET DEFAULT nextval('public.identities_id_seq'::regclass);


--
-- Name: raw_application_registration_counts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raw_application_registration_counts ALTER COLUMN id SET DEFAULT nextval('public.raw_application_registration_counts_id_seq'::regclass);


--
-- Name: raw_global_registration_counts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raw_global_registration_counts ALTER COLUMN id SET DEFAULT nextval('public.raw_global_registration_counts_id_seq'::regclass);


--
-- Name: user_consents_email_plus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consents_email_plus ALTER COLUMN id SET DEFAULT nextval('public.user_consents_email_plus_id_seq'::regclass);


--
-- Name: webhook_event_logs sequence; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhook_event_logs ALTER COLUMN sequence SET DEFAULT nextval('public.webhook_event_logs_sequence_seq'::regclass);


--
-- Data for Name: application_daily_active_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application_daily_active_users (applications_id, count, day) FROM stdin;
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	1	20370
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	20370
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	20374
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	1	20374
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	20377
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	20376
a290a97c-e315-4c11-9823-57496eed344c	2	20376
a290a97c-e315-4c11-9823-57496eed344c	3	20377
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	3	20376
\.


--
-- Data for Name: application_monthly_active_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application_monthly_active_users (applications_id, count, month) FROM stdin;
a290a97c-e315-4c11-9823-57496eed344c	5	669
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	4	669
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	669
\.


--
-- Data for Name: application_oauth_scopes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application_oauth_scopes (id, applications_id, data, insert_instant, last_update_instant, name) FROM stdin;
\.


--
-- Data for Name: application_registration_counts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application_registration_counts (applications_id, count, decremented_count, hour) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	0	488893
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	1	0	488898
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	3	3	489037
a290a97c-e315-4c11-9823-57496eed344c	1	0	489037
a290a97c-e315-4c11-9823-57496eed344c	1	1	489038
a290a97c-e315-4c11-9823-57496eed344c	3	3	489060
\.


--
-- Data for Name: application_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.application_roles (id, applications_id, description, insert_instant, is_default, is_super_role, last_update_instant, name) FROM stdin;
631ecd9d-8d40-4c13-8277-80cedb8236e2	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Global admin	1760016864741	f	t	1760016864741	admin
631ecd9d-8d40-4c13-8277-80cedb8236e3	3c219e58-ed0e-4b18-ad48-f4f92793ae32	API key manager	1760016864741	f	f	1760016864741	api_key_manager
631ecd9d-8d40-4c13-8277-80cedb8236e4	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Application deleter	1760016864741	f	f	1760016864741	application_deleter
631ecd9d-8d40-4c13-8277-80cedb8236e5	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Application manager	1760016864741	f	f	1760016864741	application_manager
631ecd9d-8d40-4c13-8277-80cedb8236e6	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Audit log viewer	1760016864741	f	f	1760016864741	audit_log_viewer
631ecd9d-8d40-4c13-8277-80cedb8236e7	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Email template manager	1760016864741	f	f	1760016864741	email_template_manager
631ecd9d-8d40-4c13-8277-80cedb8236e8	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Report viewer	1760016864741	f	f	1760016864741	report_viewer
631ecd9d-8d40-4c13-8277-80cedb8236e9	3c219e58-ed0e-4b18-ad48-f4f92793ae32	System configuration manager	1760016864741	f	f	1760016864741	system_manager
631ecd9d-8d40-4c13-8277-80cedb8236f0	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User action deleter	1760016864741	f	f	1760016864741	user_action_deleter
631ecd9d-8d40-4c13-8277-80cedb8236f1	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User action manager	1760016864741	f	f	1760016864741	user_action_manager
631ecd9d-8d40-4c13-8277-80cedb8236f2	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User deleter	1760016864741	f	f	1760016864741	user_deleter
631ecd9d-8d40-4c13-8277-80cedb8236f3	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User manager	1760016864741	f	f	1760016864741	user_manager
631ecd9d-8d40-4c13-8277-80cedb8236f4	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Webhook manager	1760016864741	f	f	1760016864741	webhook_manager
631ecd9d-8d40-4c13-8277-80cedb8236f5	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Group manager	1760016864741	f	f	1760016864741	group_manager
631ecd9d-8d40-4c13-8277-80cedb8236f6	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Group deleter	1760016864741	f	f	1760016864741	group_deleter
631ecd9d-8d40-4c13-8277-80cedb8236f7	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Tenant manager	1760016864741	f	f	1760016864741	tenant_manager
631ecd9d-8d40-4c13-8277-80cedb8236f8	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Tenant deleter	1760016864741	f	f	1760016864741	tenant_deleter
631ecd9d-8d40-4c13-8277-80cedb8236f9	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Lambda manager	1760016864741	f	f	1760016864741	lambda_manager
631ecd9d-8d40-4c13-8277-80cedb8236fa	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Event log viewer	1760016864741	f	f	1760016864741	event_log_viewer
631ecd9d-8d40-4c13-8277-80cedb8236fb	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Key manager	1760016864741	f	f	1760016864741	key_manager
631ecd9d-8d40-4c13-8277-80cedb8236fc	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Consent deleter	1760016864741	f	f	1760016864741	consent_deleter
631ecd9d-8d40-4c13-8277-80cedb8236fd	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Consent manager	1760016864741	f	f	1760016864741	consent_manager
631ecd9d-8d40-4c13-8277-80cedb8236fe	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Theme manager	1760016864741	f	f	1760016864741	theme_manager
631ecd9d-8d40-4c13-8277-80cedb8236ff	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Reactor manager	1760016864741	f	f	1760016864741	reactor_manager
631ecd9d-8d40-4c13-8277-80cedb823700	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Connector deleter	1760016864741	f	f	1760016864741	connector_deleter
631ecd9d-8d40-4c13-8277-80cedb823701	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Connector manager	1760016864741	f	f	1760016864741	connector_manager
631ecd9d-8d40-4c13-8277-80cedb823702	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Form deleter	1760016864741	f	f	1760016864741	form_deleter
631ecd9d-8d40-4c13-8277-80cedb823703	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Form manager	1760016864741	f	f	1760016864741	form_manager
631ecd9d-8d40-4c13-8277-80cedb823704	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User support manager	1760016864741	f	f	1760016864741	user_support_manager
631ecd9d-8d40-4c13-8277-80cedb823705	3c219e58-ed0e-4b18-ad48-f4f92793ae32	User support viewer	1760016864741	f	f	1760016864741	user_support_viewer
631ecd9d-8d40-4c13-8277-80cedb823706	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Entity manager	1760016864741	f	f	1760016864741	entity_manager
631ecd9d-8d40-4c13-8277-80cedb823707	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Messenger deleter	1760016864741	f	f	1760016864741	messenger_deleter
631ecd9d-8d40-4c13-8277-80cedb823708	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Messenger manager	1760016864741	f	f	1760016864741	messenger_manager
631ecd9d-8d40-4c13-8277-80cedb823709	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Message template deleter	1760016864741	f	f	1760016864741	message_template_deleter
631ecd9d-8d40-4c13-8277-80cedb823710	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Message template manager	1760016864741	f	f	1760016864741	message_template_manager
631ecd9d-8d40-4c13-8277-80cedb823711	3c219e58-ed0e-4b18-ad48-f4f92793ae32	ACL deleter	1760016864741	f	f	1760016864741	acl_deleter
631ecd9d-8d40-4c13-8277-80cedb823712	3c219e58-ed0e-4b18-ad48-f4f92793ae32	ACL manager	1760016864741	f	f	1760016864741	acl_manager
631ecd9d-8d40-4c13-8277-80cedb823713	3c219e58-ed0e-4b18-ad48-f4f92793ae32	Webhook event log viewer	1760016864741	f	f	1760016864741	webhook_event_log_viewer
631ecd9d-8d40-4c13-8277-80cedb823714	c2a229f8-2dbc-1099-f0f1-db09f08fa0df	Admin	1760016864741	f	t	1760016864741	admin
\.


--
-- Data for Name: applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applications (id, access_token_populate_lambdas_id, access_token_signing_keys_id, active, admin_registration_forms_id, data, email_update_email_templates_id, email_verification_email_templates_id, email_verified_email_templates_id, forgot_password_email_templates_id, forms_id, id_token_populate_lambdas_id, id_token_signing_keys_id, insert_instant, last_update_instant, login_id_in_use_on_create_email_templates_id, login_id_in_use_on_update_email_templates_id, login_new_device_email_templates_id, login_suspicious_email_templates_id, multi_factor_email_message_templates_id, multi_factor_sms_message_templates_id, name, passwordless_email_templates_id, password_update_email_templates_id, password_reset_success_email_templates_id, phone_configuration_forgot_password_templates_id, phone_configuration_identity_update_templates_id, phone_configuration_login_id_in_use_on_create_templates_id, phone_configuration_login_id_in_use_on_update_templates_id, phone_configuration_login_new_device_templates_id, phone_configuration_login_suspicious_templates_id, phone_configuration_passwordless_templates_id, phone_configuration_password_reset_success_templates_id, phone_configuration_password_update_templates_id, phone_configuration_set_password_templates_id, phone_configuration_two_factor_method_add_templates_id, phone_configuration_two_factor_method_remove_templates_id, phone_configuration_verification_complete_templates_id, phone_configuration_verification_templates_id, samlv2_default_verification_keys_id, samlv2_issuer, samlv2_keys_id, samlv2_logout_keys_id, samlv2_logout_default_verification_keys_id, samlv2_populate_lambdas_id, samlv2_single_logout_keys_id, self_service_registration_validation_lambdas_id, self_service_user_forms_id, set_password_email_templates_id, tenants_id, themes_id, two_factor_method_add_email_templates_id, two_factor_method_remove_email_templates_id, ui_ip_access_control_lists_id, universal, userinfo_populate_lambdas_id, verification_email_templates_id) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	\N	93762d6f-53be-ade7-12fe-c8087fda46a4	t	0c017da4-f7fd-3bbb-f80e-e23a1d902873	{"jwtConfiguration": {"enabled": true, "timeToLiveInSeconds": 60, "refreshTokenExpirationPolicy": "SlidingWindow", "refreshTokenTimeToLiveInMinutes": 60, "refreshTokenUsagePolicy": "OneTimeUse"},"registrationConfiguration": {"type":"basic"}, "oauthConfiguration": {"authorizedRedirectURLs": ["/admin/login"], "clientId": "3c219e58-ed0e-4b18-ad48-f4f92793ae32", "clientSecret": "OWZlM2M4ZDlhNzBlYmFmN2VlMWExNDk4ZmY4MjA1OTVjM2NiMTllMDZkZTc5ODIxZTQxZGZhNGQzYmZmMDE1Yg==", "enabledGrants": ["authorization_code", "refresh_token"], "logoutURL": "/admin/single-logout", "generateRefreshTokens": true, "clientAuthenticationPolicy": "Required", "proofKeyForCodeExchangePolicy": "Required" },"loginConfiguration": {"allowTokenRefresh": false, "generateRefreshTokens": false, "requireAuthentication": true},"unverified":{ "behavior": "Allow" },"verificationStrategy":"ClickableLink","state": "Active"}	\N	\N	\N	\N	\N	\N	092dbedc-30af-4149-9c61-b578f2c72f59	1760016864741	1760016864741	\N	\N	\N	\N	\N	\N	FusionAuth	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4706a90d-b0c6-c6b8-e73a-b9e89d19875b	\N	\N	\N	\N	f	\N	\N
c2a229f8-2dbc-1099-f0f1-db09f08fa0df	\N	60dac87e-4a9e-39f0-a870-a89dd2772a1d	t	0c017da4-f7fd-3bbb-f80e-e23a1d902873	{"state": "Active", "jwtConfiguration": {"enabled": true, "timeToLiveInSeconds": 60, "refreshTokenUsagePolicy": "OneTimeUse", "refreshTokenExpirationPolicy": "SlidingWindow", "refreshTokenTimeToLiveInMinutes": 60, "refreshTokenOneTimeUseConfiguration": {"gracePeriodInSeconds": 0}, "refreshTokenSlidingWindowConfiguration": {"maximumTimeToLiveInMinutes": 43200}}, "oauthConfiguration": {"debug": true, "clientId": "c2a229f8-2dbc-1099-f0f1-db09f08fa0df", "logoutURL": "/tenant-manager/single-logout", "consentMode": "AlwaysPrompt", "clientSecret": "MDVjNzc1MjIyYzQ3MWZlM2U2Yjk1Y2RjZTdlNDRjNTY4ZjY5YTY3MjhkZDY4YTI1YzE0YWUwM2Y0NWVkMTc4NQ==", "relationship": "FirstParty", "enabledGrants": ["authorization_code", "refresh_token"], "logoutBehavior": "AllApplications", "unknownScopePolicy": "Reject", "providedScopePolicy": {"email": {"enabled": false, "required": false}, "phone": {"enabled": false, "required": false}, "address": {"enabled": false, "required": false}, "profile": {"enabled": false, "required": false}}, "requireRegistration": true, "scopeHandlingPolicy": "Strict", "generateRefreshTokens": true, "authorizedRedirectURLs": ["/tenant-manager"], "clientAuthenticationPolicy": "Required", "requireClientAuthentication": true, "authorizedURLValidationPolicy": "ExactMatch", "proofKeyForCodeExchangePolicy": "Required"}, "universalConfiguration": {}}	\N	\N	\N	\N	\N	\N	80ccfe1e-209e-1725-bb37-6c4214dea375	1760016864741	1760016864741	\N	\N	\N	\N	\N	\N	Tenant manager	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	\N
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	\N	d0b3f8a1-4885-43a1-9f04-668543613875	t	0c017da4-f7fd-3bbb-f80e-e23a1d902873	{"accessControlConfiguration":{},"authenticationTokenConfiguration":{"enabled":false},"data":{},"externalIdentifierConfiguration":{},"formConfiguration":{"selfServiceFormConfiguration":{"requireCurrentPasswordOnPasswordChange":false}},"jwtConfiguration":{"enabled":false,"refreshTokenExpirationPolicy":"Fixed","refreshTokenOneTimeUseConfiguration":{"gracePeriodInSeconds":0},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"loginConfiguration":{"allowTokenRefresh":false,"generateRefreshTokens":false,"requireAuthentication":true},"multiFactorConfiguration":{"email":{},"sms":{}},"oauthConfiguration":{"authorizedURLValidationPolicy":"ExactMatch","clientAuthenticationPolicy":"Required","clientId":"c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305","clientSecret":"iRdgqQzR5W08H6glp0WAAI0H-iDuVncNhVhADM8mOTQ","consentMode":"AlwaysPrompt","debug":false,"enabledGrants":["authorization_code","refresh_token","password"],"generateRefreshTokens":true,"logoutBehavior":"AllApplications","proofKeyForCodeExchangePolicy":"NotRequired","providedScopePolicy":{"address":{"enabled":true,"required":false},"email":{"enabled":true,"required":false},"phone":{"enabled":true,"required":false},"profile":{"enabled":true,"required":false}},"relationship":"FirstParty","requireClientAuthentication":true,"requireRegistration":false,"scopeHandlingPolicy":"Strict","unknownScopePolicy":"Reject"},"passwordlessConfiguration":{"enabled":false},"registrationConfiguration":{"birthDate":{"enabled":false,"required":false},"confirmPassword":false,"enabled":false,"firstName":{"enabled":false,"required":false},"fullName":{"enabled":false,"required":false},"lastName":{"enabled":false,"required":false},"loginIdType":"email","middleName":{"enabled":false,"required":false},"mobilePhone":{"enabled":false,"required":false},"preferredLanguages":{"enabled":false,"required":false},"type":"basic"},"registrationDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"samlv2Configuration":{"assertionEncryptionConfiguration":{"digestAlgorithm":"SHA256","enabled":false,"encryptionAlgorithm":"AES256GCM","keyLocation":"Child","keyTransportAlgorithm":"RSA_OAEP","maskGenerationFunction":"MGF1_SHA1"},"debug":false,"enabled":false,"initiatedLogin":{"enabled":false,"nameIdFormat":"urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"},"loginHintConfiguration":{"enabled":true,"parameterName":"login_hint"},"logout":{"behavior":"AllParticipants","requireSignedRequests":false,"singleLogout":{"enabled":false,"xmlSignatureC14nMethod":"exclusive_with_comments"},"xmlSignatureC14nMethod":"exclusive_with_comments"},"requireSignedRequests":false,"xmlSignatureC14nMethod":"exclusive_with_comments","xmlSignatureLocation":"Assertion"},"state":"Active","universalConfiguration":{"universal":false},"unverified":{"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyRegistration":false,"webAuthnConfiguration":{"bootstrapWorkflow":{"enabled":false},"enabled":false,"reauthenticationWorkflow":{"enabled":false}}}	\N	\N	\N	\N	\N	\N	d0b3f8a1-4885-43a1-9f04-668543613875	1760025703853	1760035810195	\N	\N	\N	\N	\N	\N	fab	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4706a90d-b0c6-c6b8-e73a-b9e89d19875b	\N	\N	\N	\N	f	\N	\N
a290a97c-e315-4c11-9823-57496eed344c	\N	d0b3f8a1-4885-43a1-9f04-668543613875	t	0c017da4-f7fd-3bbb-f80e-e23a1d902873	{"accessControlConfiguration":{},"authenticationTokenConfiguration":{"enabled":false},"data":{},"externalIdentifierConfiguration":{},"formConfiguration":{"selfServiceFormConfiguration":{"requireCurrentPasswordOnPasswordChange":false}},"jwtConfiguration":{"enabled":false,"refreshTokenExpirationPolicy":"Fixed","refreshTokenOneTimeUseConfiguration":{"gracePeriodInSeconds":0},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"loginConfiguration":{"allowTokenRefresh":false,"generateRefreshTokens":false,"requireAuthentication":true},"multiFactorConfiguration":{"email":{},"sms":{}},"oauthConfiguration":{"authorizedURLValidationPolicy":"ExactMatch","clientAuthenticationPolicy":"Required","clientId":"a290a97c-e315-4c11-9823-57496eed344c","clientSecret":"MXicQbHkr7rxR6-jzj0Df9UoX1QzZLKKDswEaftYSIk","consentMode":"AlwaysPrompt","debug":false,"enabledGrants":["authorization_code","refresh_token"],"generateRefreshTokens":true,"logoutBehavior":"AllApplications","proofKeyForCodeExchangePolicy":"NotRequired","providedScopePolicy":{"address":{"enabled":true,"required":false},"email":{"enabled":true,"required":false},"phone":{"enabled":true,"required":false},"profile":{"enabled":true,"required":false}},"relationship":"FirstParty","requireClientAuthentication":true,"requireRegistration":false,"scopeHandlingPolicy":"Strict","unknownScopePolicy":"Reject"},"passwordlessConfiguration":{"enabled":false},"registrationConfiguration":{"birthDate":{"enabled":false,"required":false},"confirmPassword":false,"enabled":false,"firstName":{"enabled":false,"required":false},"fullName":{"enabled":false,"required":false},"lastName":{"enabled":false,"required":false},"loginIdType":"email","middleName":{"enabled":false,"required":false},"mobilePhone":{"enabled":false,"required":false},"preferredLanguages":{"enabled":false,"required":false},"type":"basic"},"registrationDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"samlv2Configuration":{"assertionEncryptionConfiguration":{"digestAlgorithm":"SHA256","enabled":false,"encryptionAlgorithm":"AES256GCM","keyLocation":"Child","keyTransportAlgorithm":"RSA_OAEP","maskGenerationFunction":"MGF1_SHA1"},"debug":false,"enabled":false,"initiatedLogin":{"enabled":false,"nameIdFormat":"urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"},"loginHintConfiguration":{"enabled":true,"parameterName":"login_hint"},"logout":{"behavior":"AllParticipants","requireSignedRequests":false,"singleLogout":{"enabled":false,"xmlSignatureC14nMethod":"exclusive_with_comments"},"xmlSignatureC14nMethod":"exclusive_with_comments"},"requireSignedRequests":false,"xmlSignatureC14nMethod":"exclusive_with_comments","xmlSignatureLocation":"Assertion"},"state":"Active","universalConfiguration":{"universal":false},"unverified":{"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyRegistration":false,"webAuthnConfiguration":{"bootstrapWorkflow":{"enabled":false},"enabled":false,"reauthenticationWorkflow":{"enabled":false}}}	\N	\N	\N	\N	\N	\N	d0b3f8a1-4885-43a1-9f04-668543613875	1760533891936	1760533891936	\N	\N	\N	\N	\N	\N	web	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3df9a1ee-a354-4f0b-b8dd-4b55565d2372	\N	\N	\N	\N	f	\N	\N
\.


--
-- Data for Name: asynchronous_tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asynchronous_tasks (id, data, entity_id, insert_instant, last_update_instant, nodes_id, status, type) FROM stdin;
\.


--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_logs (id, insert_instant, insert_user, message, data) FROM stdin;
1	1760025703923	leonardo.granja@iez.com.br	Created the application with Id [c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305] and name [Skywatch]	{"data":{},"reason":"FusionAuth First Time Setup"}
2	1760025719495	leonardo.granja@iez.com.br	Completed the first time setup wizard.	{"data":{},"reason":"FusionAuth User Interface"}
3	1760026028084	leonardo.granja@iez.com.br	Updated the tenant with Id [4706a90d-b0c6-c6b8-e73a-b9e89d19875b] and name [Fabrica]	{"data":{},"newValue":{"accessControlConfiguration":{},"captchaConfiguration":{"captchaMethod":"GoogleRecaptchaV3","enabled":false,"threshold":0.5},"configured":true,"connectorPolicies":[{"connectorId":"e3306678-a53a-4964-9040-1c96f36dda72","domains":["*"],"migrate":false}],"data":{},"emailConfiguration":{"additionalHeaders":[],"debug":false,"defaultFromEmail":"change-me@example.com","defaultFromName":"FusionAuth","forgotPasswordEmailTemplateId":"de70e8df-860a-4cb3-9bb1-f8cdc112af34","host":"localhost","implicitEmailVerificationAllowed":true,"passwordlessEmailTemplateId":"20cff312-0de9-4ac0-85ea-f68b3b7a1263","port":25,"security":"NONE","setPasswordEmailTemplateId":"dcc66541-f54c-4aec-9f9b-d7cad905467d","unverified":{"allowEmailChangeWhenGated":false,"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyEmail":false,"verifyEmailWhenChanged":false},"eventConfiguration":{"events":{"group.create":{"enabled":false,"transactionType":"None"},"group.create.complete":{"enabled":false,"transactionType":"None"},"group.delete":{"enabled":false,"transactionType":"None"},"group.delete.complete":{"enabled":false,"transactionType":"None"},"group.member.add":{"enabled":false,"transactionType":"None"},"group.member.add.complete":{"enabled":false,"transactionType":"None"},"group.member.remove":{"enabled":false,"transactionType":"None"},"group.member.remove.complete":{"enabled":false,"transactionType":"None"},"group.member.update":{"enabled":false,"transactionType":"None"},"group.member.update.complete":{"enabled":false,"transactionType":"None"},"group.update":{"enabled":false,"transactionType":"None"},"group.update.complete":{"enabled":false,"transactionType":"None"},"jwt.public-key.update":{"enabled":false,"transactionType":"None"},"jwt.refresh":{"enabled":false,"transactionType":"None"},"jwt.refresh-token.revoke":{"enabled":false,"transactionType":"None"},"user.action":{"enabled":false,"transactionType":"None"},"user.bulk.create":{"enabled":false,"transactionType":"None"},"user.create":{"enabled":false,"transactionType":"None"},"user.create.complete":{"enabled":false,"transactionType":"None"},"user.deactivate":{"enabled":false,"transactionType":"None"},"user.delete":{"enabled":false,"transactionType":"None"},"user.delete.complete":{"enabled":false,"transactionType":"None"},"user.email.update":{"enabled":false,"transactionType":"None"},"user.email.verified":{"enabled":false,"transactionType":"None"},"user.identity-provider.link":{"enabled":false,"transactionType":"None"},"user.identity-provider.unlink":{"enabled":false,"transactionType":"None"},"user.identity.update":{"enabled":false,"transactionType":"None"},"user.identity.verified":{"enabled":false,"transactionType":"None"},"user.login.failed":{"enabled":false,"transactionType":"None"},"user.login.new-device":{"enabled":false,"transactionType":"None"},"user.login.success":{"enabled":false,"transactionType":"None"},"user.login.suspicious":{"enabled":false,"transactionType":"None"},"user.loginId.duplicate.create":{"enabled":false,"transactionType":"None"},"user.loginId.duplicate.update":{"enabled":false,"transactionType":"None"},"user.password.breach":{"enabled":false,"transactionType":"None"},"user.password.reset.send":{"enabled":false,"transactionType":"None"},"user.password.reset.start":{"enabled":false,"transactionType":"None"},"user.password.reset.success":{"enabled":false,"transactionType":"None"},"user.password.update":{"enabled":false,"transactionType":"None"},"user.reactivate":{"enabled":false,"transactionType":"None"},"user.registration.create":{"enabled":false,"transactionType":"None"},"user.registration.create.complete":{"enabled":false,"transactionType":"None"},"user.registration.delete":{"enabled":false,"transactionType":"None"},"user.registration.delete.complete":{"enabled":false,"transactionType":"None"},"user.registration.update":{"enabled":false,"transactionType":"None"},"user.registration.update.complete":{"enabled":false,"transactionType":"None"},"user.registration.verified":{"enabled":false,"transactionType":"None"},"user.two-factor.method.add":{"enabled":false,"transactionType":"None"},"user.two-factor.method.remove":{"enabled":false,"transactionType":"None"},"user.update":{"enabled":false,"transactionType":"None"},"user.update.complete":{"enabled":false,"transactionType":"None"}}},"externalIdentifierConfiguration":{"authorizationGrantIdTimeToLiveInSeconds":30,"changePasswordIdGenerator":{"length":32,"type":"randomBytes"},"changePasswordIdTimeToLiveInSeconds":600,"deviceCodeTimeToLiveInSeconds":300,"deviceUserCodeIdGenerator":{"length":6,"type":"randomAlphaNumeric"},"emailVerificationIdGenerator":{"length":32,"type":"randomBytes"},"emailVerificationIdTimeToLiveInSeconds":86400,"emailVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"externalAuthenticationIdTimeToLiveInSeconds":300,"loginIntentTimeToLiveInSeconds":1800,"oneTimePasswordTimeToLiveInSeconds":60,"passwordlessLoginGenerator":{"length":32,"type":"randomBytes"},"passwordlessLoginOneTimeCodeGenerator":{"length":6,"type":"randomDigits"},"passwordlessLoginTimeToLiveInSeconds":180,"pendingAccountLinkTimeToLiveInSeconds":3600,"phoneVerificationIdGenerator":{"length":32,"type":"randomBytes"},"phoneVerificationIdTimeToLiveInSeconds":86400,"phoneVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"registrationVerificationIdGenerator":{"length":32,"type":"randomBytes"},"registrationVerificationIdTimeToLiveInSeconds":86400,"registrationVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"rememberOAuthScopeConsentChoiceTimeToLiveInSeconds":2592000,"samlv2AuthNRequestIdTimeToLiveInSeconds":300,"setupPasswordIdGenerator":{"length":32,"type":"randomBytes"},"setupPasswordIdTimeToLiveInSeconds":86400,"trustTokenTimeToLiveInSeconds":180,"twoFactorIdTimeToLiveInSeconds":300,"twoFactorOneTimeCodeIdGenerator":{"length":6,"type":"randomDigits"},"twoFactorOneTimeCodeIdTimeToLiveInSeconds":60,"twoFactorTrustIdTimeToLiveInSeconds":2592000,"webAuthnAuthenticationChallengeTimeToLiveInSeconds":180,"webAuthnRegistrationChallengeTimeToLiveInSeconds":180},"failedAuthenticationConfiguration":{"actionCancelPolicy":{"onPasswordReset":false},"actionDuration":3,"actionDurationUnit":"MINUTES","emailUser":false,"resetCountInSeconds":60,"tooManyAttempts":5},"familyConfiguration":{"allowChildRegistrations":true,"deleteOrphanedAccounts":false,"deleteOrphanedAccountsDays":30,"enabled":false,"maximumChildAge":12,"minimumOwnerAge":21,"parentEmailRequired":false},"formConfiguration":{"adminUserFormId":"8df860fe-857d-847d-ada8-2e86bac1fb87"},"httpSessionMaxInactiveInterval":3600,"id":"4706a90d-b0c6-c6b8-e73a-b9e89d19875b","insertInstant":1760016863741,"issuer":"localhost:9011","jwtConfiguration":{"accessTokenKeyId":"d0b3f8a1-4885-43a1-9f04-668543613875","idTokenKeyId":"d0b3f8a1-4885-43a1-9f04-668543613875","refreshTokenExpirationPolicy":"Fixed","refreshTokenOneTimeUseConfiguration":{"gracePeriodInSeconds":0},"refreshTokenRevocationPolicy":{"onLoginPrevented":true,"onMultiFactorEnable":false,"onOneTimeTokenReuse":false,"onPasswordChanged":true},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1760026028016,"loginConfiguration":{"requireAuthentication":true},"maximumPasswordAge":{"days":180,"enabled":false},"minimumPasswordAge":{"enabled":false,"seconds":30},"multiFactorConfiguration":{"authenticator":{"algorithm":"HmacSHA1","codeLength":6,"enabled":true,"timeStep":30},"email":{"enabled":false,"templateId":"bc6a1254-8779-4112-b3da-88c42a3abde9"},"loginPolicy":"Enabled","sms":{"enabled":false}},"name":"Fabrica","oauthConfiguration":{},"passwordEncryptionConfiguration":{"encryptionScheme":"salted-pbkdf2-hmac-sha256","encryptionSchemeFactor":24000,"modifyEncryptionSchemeOnLogin":false},"passwordValidationRules":{"breachDetection":{"enabled":false,"matchMode":"High","notifyUserEmailTemplateId":"b27c0cf8-3468-4f83-a1f6-97e9075428e2","onLogin":"Off"},"maxLength":256,"minLength":8,"rememberPreviousPasswords":{"count":1,"enabled":false},"requireMixedCase":false,"requireNonAlpha":false,"requireNumber":false,"validateOnLogin":false},"phoneConfiguration":{"implicitPhoneVerificationAllowed":true,"unverified":{"allowPhoneNumberChangeWhenGated":false,"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyPhoneNumber":false},"rateLimitConfiguration":{"failedLogin":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"forgotPassword":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendEmailVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordless":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordlessPhone":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPhoneVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendRegistrationVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendTwoFactor":{"enabled":false,"limit":5,"timePeriodInSeconds":60}},"registrationConfiguration":{"blockedDomains":[]},"scimServerConfiguration":{"enabled":false},"ssoConfiguration":{"allowAccessTokenBootstrap":false,"deviceTrustTimeToLiveInSeconds":31536000},"state":"Active","themeId":"75a068fd-e94b-451a-9aeb-3ddb9a3b5987","userDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"usernameConfiguration":{"unique":{"enabled":false,"numberOfDigits":5,"separator":"#","strategy":"OnCollision"}},"webAuthnConfiguration":{"bootstrapWorkflow":{"authenticatorAttachmentPreference":"any","enabled":false,"userVerificationRequirement":"required"},"debug":false,"enabled":false,"reauthenticationWorkflow":{"authenticatorAttachmentPreference":"platform","enabled":false,"userVerificationRequirement":"required"}}},"oldValue":{"accessControlConfiguration":{},"captchaConfiguration":{"captchaMethod":"GoogleRecaptchaV3","enabled":false,"threshold":0.5},"configured":false,"connectorPolicies":[{"connectorId":"e3306678-a53a-4964-9040-1c96f36dda72","domains":["*"],"migrate":false}],"data":{},"emailConfiguration":{"additionalHeaders":[],"debug":false,"defaultFromEmail":"change-me@example.com","defaultFromName":"FusionAuth","forgotPasswordEmailTemplateId":"de70e8df-860a-4cb3-9bb1-f8cdc112af34","host":"localhost","implicitEmailVerificationAllowed":true,"passwordlessEmailTemplateId":"20cff312-0de9-4ac0-85ea-f68b3b7a1263","port":25,"setPasswordEmailTemplateId":"dcc66541-f54c-4aec-9f9b-d7cad905467d","unverified":{"allowEmailChangeWhenGated":false,"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyEmail":false,"verifyEmailWhenChanged":false},"eventConfiguration":{"events":{}},"externalIdentifierConfiguration":{"authorizationGrantIdTimeToLiveInSeconds":30,"changePasswordIdGenerator":{"length":32,"type":"randomBytes"},"changePasswordIdTimeToLiveInSeconds":600,"deviceCodeTimeToLiveInSeconds":300,"deviceUserCodeIdGenerator":{"length":6,"type":"randomAlphaNumeric"},"emailVerificationIdGenerator":{"length":32,"type":"randomBytes"},"emailVerificationIdTimeToLiveInSeconds":86400,"emailVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"externalAuthenticationIdTimeToLiveInSeconds":300,"loginIntentTimeToLiveInSeconds":1800,"oneTimePasswordTimeToLiveInSeconds":60,"passwordlessLoginGenerator":{"length":32,"type":"randomBytes"},"passwordlessLoginOneTimeCodeGenerator":{"length":6,"type":"randomDigits"},"passwordlessLoginTimeToLiveInSeconds":180,"pendingAccountLinkTimeToLiveInSeconds":3600,"phoneVerificationIdGenerator":{"length":32,"type":"randomBytes"},"phoneVerificationIdTimeToLiveInSeconds":86400,"phoneVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"registrationVerificationIdGenerator":{"length":32,"type":"randomBytes"},"registrationVerificationIdTimeToLiveInSeconds":86400,"registrationVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"rememberOAuthScopeConsentChoiceTimeToLiveInSeconds":2592000,"samlv2AuthNRequestIdTimeToLiveInSeconds":300,"setupPasswordIdGenerator":{"length":32,"type":"randomBytes"},"setupPasswordIdTimeToLiveInSeconds":86400,"trustTokenTimeToLiveInSeconds":180,"twoFactorIdTimeToLiveInSeconds":300,"twoFactorOneTimeCodeIdGenerator":{"length":6,"type":"randomDigits"},"twoFactorOneTimeCodeIdTimeToLiveInSeconds":60,"twoFactorTrustIdTimeToLiveInSeconds":2592000,"webAuthnAuthenticationChallengeTimeToLiveInSeconds":180,"webAuthnRegistrationChallengeTimeToLiveInSeconds":180},"failedAuthenticationConfiguration":{"actionCancelPolicy":{"onPasswordReset":false},"actionDuration":3,"actionDurationUnit":"MINUTES","emailUser":false,"resetCountInSeconds":60,"tooManyAttempts":5},"familyConfiguration":{"allowChildRegistrations":true,"deleteOrphanedAccounts":false,"deleteOrphanedAccountsDays":30,"enabled":false,"maximumChildAge":12,"minimumOwnerAge":21,"parentEmailRequired":false},"formConfiguration":{"adminUserFormId":"8df860fe-857d-847d-ada8-2e86bac1fb87"},"httpSessionMaxInactiveInterval":3600,"id":"4706a90d-b0c6-c6b8-e73a-b9e89d19875b","insertInstant":1760016863741,"issuer":"localhost:9011","jwtConfiguration":{"accessTokenKeyId":"d0b3f8a1-4885-43a1-9f04-668543613875","idTokenKeyId":"d0b3f8a1-4885-43a1-9f04-668543613875","refreshTokenExpirationPolicy":"Fixed","refreshTokenOneTimeUseConfiguration":{"gracePeriodInSeconds":0},"refreshTokenRevocationPolicy":{"onLoginPrevented":true,"onMultiFactorEnable":false,"onOneTimeTokenReuse":false,"onPasswordChanged":true},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1760017304822,"loginConfiguration":{"requireAuthentication":true},"maximumPasswordAge":{"days":180,"enabled":false},"minimumPasswordAge":{"enabled":false,"seconds":30},"multiFactorConfiguration":{"authenticator":{"algorithm":"HmacSHA1","codeLength":6,"enabled":true,"timeStep":30},"email":{"enabled":false,"templateId":"bc6a1254-8779-4112-b3da-88c42a3abde9"},"loginPolicy":"Enabled","sms":{"enabled":false}},"name":"Default","oauthConfiguration":{},"passwordEncryptionConfiguration":{"encryptionScheme":"salted-pbkdf2-hmac-sha256","encryptionSchemeFactor":24000,"modifyEncryptionSchemeOnLogin":false},"passwordValidationRules":{"breachDetection":{"enabled":false,"notifyUserEmailTemplateId":"b27c0cf8-3468-4f83-a1f6-97e9075428e2"},"maxLength":256,"minLength":8,"rememberPreviousPasswords":{"count":1,"enabled":false},"requireMixedCase":false,"requireNonAlpha":false,"requireNumber":false,"validateOnLogin":false},"phoneConfiguration":{"implicitPhoneVerificationAllowed":true,"unverified":{"allowPhoneNumberChangeWhenGated":false,"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyPhoneNumber":false},"rateLimitConfiguration":{"failedLogin":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"forgotPassword":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendEmailVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordless":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordlessPhone":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPhoneVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendRegistrationVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendTwoFactor":{"enabled":false,"limit":5,"timePeriodInSeconds":60}},"registrationConfiguration":{"blockedDomains":[]},"scimServerConfiguration":{"enabled":false},"ssoConfiguration":{"allowAccessTokenBootstrap":false,"deviceTrustTimeToLiveInSeconds":31536000},"state":"Active","themeId":"75a068fd-e94b-451a-9aeb-3ddb9a3b5987","userDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"usernameConfiguration":{"unique":{"enabled":false,"numberOfDigits":5,"separator":"#","strategy":"OnCollision"}},"webAuthnConfiguration":{"bootstrapWorkflow":{"authenticatorAttachmentPreference":"any","enabled":false,"userVerificationRequirement":"required"},"debug":false,"enabled":false,"reauthenticationWorkflow":{"authenticatorAttachmentPreference":"platform","enabled":false,"userVerificationRequirement":"required"}}},"reason":"FusionAuth User Interface"}
4	1760030525142	leonardo.granja@iez.com.br	Created the tenant with Id [3df9a1ee-a354-4f0b-b8dd-4b55565d2372] and name [Greatek]	{"data":{},"reason":"FusionAuth User Interface"}
5	1760034399137	leonardo.granja@iez.com.br	Updated the application with Id [c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305] and name [fab]	{"data":{},"newValue":{"accessControlConfiguration":{},"active":true,"authenticationTokenConfiguration":{"enabled":false},"data":{},"emailConfiguration":{},"externalIdentifierConfiguration":{},"formConfiguration":{"adminRegistrationFormId":"0c017da4-f7fd-3bbb-f80e-e23a1d902873","selfServiceFormConfiguration":{"requireCurrentPasswordOnPasswordChange":false}},"id":"c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305","jwtConfiguration":{"accessTokenKeyId":"d0b3f8a1-4885-43a1-9f04-668543613875","enabled":false,"idTokenKeyId":"d0b3f8a1-4885-43a1-9f04-668543613875","refreshTokenExpirationPolicy":"Fixed","refreshTokenOneTimeUseConfiguration":{"gracePeriodInSeconds":0},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1760034399073,"loginConfiguration":{"allowTokenRefresh":false,"generateRefreshTokens":false,"requireAuthentication":true},"multiFactorConfiguration":{"email":{},"sms":{}},"name":"fab","oauthConfiguration":{"authorizedOriginURLs":[],"authorizedRedirectURLs":[],"authorizedURLValidationPolicy":"ExactMatch","clientAuthenticationPolicy":"Required","clientId":"c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305","clientSecret":"*****","consentMode":"AlwaysPrompt","debug":false,"enabledGrants":["authorization_code","refresh_token"],"generateRefreshTokens":true,"logoutBehavior":"AllApplications","proofKeyForCodeExchangePolicy":"NotRequired","providedScopePolicy":{"address":{"enabled":true,"required":false},"email":{"enabled":true,"required":false},"phone":{"enabled":true,"required":false},"profile":{"enabled":true,"required":false}},"relationship":"FirstParty","requireClientAuthentication":true,"requireRegistration":false,"scopeHandlingPolicy":"Strict","unknownScopePolicy":"Reject"},"passwordlessConfiguration":{"enabled":false},"phoneConfiguration":{},"registrationConfiguration":{"birthDate":{"enabled":false,"required":false},"confirmPassword":false,"enabled":false,"firstName":{"enabled":false,"required":false},"fullName":{"enabled":false,"required":false},"lastName":{"enabled":false,"required":false},"loginIdType":"email","middleName":{"enabled":false,"required":false},"mobilePhone":{"enabled":false,"required":false},"preferredLanguages":{"enabled":false,"required":false},"type":"basic"},"registrationDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"roles":[],"samlv2Configuration":{"assertionEncryptionConfiguration":{"digestAlgorithm":"SHA256","enabled":false,"encryptionAlgorithm":"AES256GCM","keyLocation":"Child","keyTransportAlgorithm":"RSA_OAEP","maskGenerationFunction":"MGF1_SHA1"},"authorizedRedirectURLs":[],"debug":false,"enabled":false,"initiatedLogin":{"enabled":false,"nameIdFormat":"urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"},"loginHintConfiguration":{"enabled":true,"parameterName":"login_hint"},"logout":{"behavior":"AllParticipants","requireSignedRequests":false,"singleLogout":{"enabled":false,"xmlSignatureC14nMethod":"exclusive_with_comments"},"xmlSignatureC14nMethod":"exclusive_with_comments"},"requireSignedRequests":false,"xmlSignatureC14nMethod":"exclusive_with_comments","xmlSignatureLocation":"Assertion"},"scopes":[],"state":"Active","tenantId":"4706a90d-b0c6-c6b8-e73a-b9e89d19875b","universalConfiguration":{"universal":false},"unverified":{"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyRegistration":false,"webAuthnConfiguration":{"bootstrapWorkflow":{"enabled":false},"enabled":false,"reauthenticationWorkflow":{"enabled":false}}},"oldValue":{"accessControlConfiguration":{},"active":true,"authenticationTokenConfiguration":{"enabled":false},"data":{},"emailConfiguration":{},"externalIdentifierConfiguration":{},"formConfiguration":{"adminRegistrationFormId":"0c017da4-f7fd-3bbb-f80e-e23a1d902873","selfServiceFormConfiguration":{"requireCurrentPasswordOnPasswordChange":false}},"id":"c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305","insertInstant":1760025703853,"jwtConfiguration":{"enabled":false,"refreshTokenExpirationPolicy":"Fixed","refreshTokenOneTimeUseConfiguration":{"gracePeriodInSeconds":0},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1760025703853,"loginConfiguration":{"allowTokenRefresh":false,"generateRefreshTokens":false,"requireAuthentication":true},"multiFactorConfiguration":{"email":{},"sms":{}},"name":"Skywatch","oauthConfiguration":{"authorizedOriginURLs":[],"authorizedRedirectURLs":[],"authorizedURLValidationPolicy":"ExactMatch","clientAuthenticationPolicy":"Required","clientId":"c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305","clientSecret":"*****","consentMode":"AlwaysPrompt","debug":false,"enabledGrants":["authorization_code","refresh_token"],"generateRefreshTokens":true,"logoutBehavior":"AllApplications","proofKeyForCodeExchangePolicy":"NotRequired","providedScopePolicy":{"address":{"enabled":true,"required":false},"email":{"enabled":true,"required":false},"phone":{"enabled":true,"required":false},"profile":{"enabled":true,"required":false}},"relationship":"FirstParty","requireClientAuthentication":true,"requireRegistration":false,"scopeHandlingPolicy":"Strict","unknownScopePolicy":"Reject"},"passwordlessConfiguration":{"enabled":false},"phoneConfiguration":{},"registrationConfiguration":{"birthDate":{"enabled":false,"required":false},"confirmPassword":false,"enabled":false,"firstName":{"enabled":false,"required":false},"fullName":{"enabled":false,"required":false},"lastName":{"enabled":false,"required":false},"loginIdType":"email","middleName":{"enabled":false,"required":false},"mobilePhone":{"enabled":false,"required":false},"preferredLanguages":{"enabled":false,"required":false},"type":"basic"},"registrationDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"roles":[],"samlv2Configuration":{"assertionEncryptionConfiguration":{"digestAlgorithm":"SHA256","enabled":false,"encryptionAlgorithm":"AES256GCM","keyLocation":"Child","keyTransportAlgorithm":"RSA_OAEP","maskGenerationFunction":"MGF1_SHA1"},"authorizedRedirectURLs":[],"debug":false,"enabled":false,"initiatedLogin":{"enabled":false,"nameIdFormat":"urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"},"loginHintConfiguration":{"enabled":true,"parameterName":"login_hint"},"logout":{"behavior":"AllParticipants","requireSignedRequests":false,"singleLogout":{"enabled":false,"xmlSignatureC14nMethod":"exclusive_with_comments"},"xmlSignatureC14nMethod":"exclusive_with_comments"},"requireSignedRequests":false,"xmlSignatureC14nMethod":"exclusive_with_comments","xmlSignatureLocation":"Assertion"},"scopes":[],"state":"Active","tenantId":"4706a90d-b0c6-c6b8-e73a-b9e89d19875b","universalConfiguration":{"universal":false},"unverified":{"behavior":"Allow"},"verifyRegistration":false,"webAuthnConfiguration":{"bootstrapWorkflow":{"enabled":false},"enabled":false,"reauthenticationWorkflow":{"enabled":false}}},"reason":"FusionAuth User Interface"}
6	1760034494777	leonardo.granja@iez.com.br	Created user with Id [5000f553-be8f-44ed-9dc6-bdd10db1ac67], name [null] and loginId [teste@fabrica.com]	{"data":{},"reason":"FusionAuth User Interface"}
7	1760034705197	leonardo.granja@iez.com.br	Updated the user with Id [5000f553-be8f-44ed-9dc6-bdd10db1ac67] and loginId [teste@fabrica.com]	{"data":{},"newValue":{"active":true,"connectorId":"e3306678-a53a-4964-9040-1c96f36dda72","data":{},"email":"teste@fabrica.com","id":"5000f553-be8f-44ed-9dc6-bdd10db1ac67","identities":[{"insertInstant":1760034494681,"lastLoginInstant":1760034494681,"lastUpdateInstant":1760034494681,"primary":true,"type":"email","value":"teste@fabrica.com","verified":false,"verifiedReason":"Disabled"}],"insertInstant":1760034494681,"lastLoginInstant":1760034494681,"lastUpdateInstant":1760034705147,"memberships":[],"passwordChangeReason":"Administrative","passwordChangeRequired":true,"preferredLanguages":[],"registrations":[],"tenantId":"4706a90d-b0c6-c6b8-e73a-b9e89d19875b","twoFactor":{"methods":[],"recoveryCodes":[]},"usernameStatus":"ACTIVE","verified":true,"verifiedInstant":1760034494681},"oldValue":{"active":true,"connectorId":"e3306678-a53a-4964-9040-1c96f36dda72","data":{},"email":"teste@fabrica.com","id":"5000f553-be8f-44ed-9dc6-bdd10db1ac67","identities":[{"insertInstant":1760034494681,"lastLoginInstant":1760034494681,"lastUpdateInstant":1760034494681,"primary":true,"type":"email","value":"teste@fabrica.com","verified":false,"verifiedReason":"Disabled"}],"insertInstant":1760034494681,"lastLoginInstant":1760034494681,"lastUpdateInstant":1760034494681,"memberships":[],"passwordChangeRequired":false,"preferredLanguages":[],"registrations":[],"tenantId":"4706a90d-b0c6-c6b8-e73a-b9e89d19875b","twoFactor":{"methods":[],"recoveryCodes":[]},"usernameStatus":"ACTIVE","verified":true,"verifiedInstant":1760034494681},"reason":"FusionAuth User Interface"}
8	1760034887107	leonardo.granja@iez.com.br	Deactivated user with Id [5000f553-be8f-44ed-9dc6-bdd10db1ac67]	{"data":{},"reason":"FusionAuth User Interface"}
9	1760034960141	leonardo.granja@iez.com.br	Reactivated user with Id [5000f553-be8f-44ed-9dc6-bdd10db1ac67], name [null] and username/email [teste@fabrica.com]	{"data":{},"reason":"FusionAuth User Interface"}
10	1760034975769	leonardo.granja@iez.com.br	Deleted user with Id [5000f553-be8f-44ed-9dc6-bdd10db1ac67]	{"data":{},"reason":"FusionAuth User Interface"}
11	1760035070379	leonardo.granja@iez.com.br	Created user with Id [5e05cf13-5601-4819-8cdb-3c2fa3bb4d48], name [null] and loginId [teste@fabrica.com]	{"data":{},"reason":"FusionAuth User Interface"}
12	1760035208064	leonardo.granja@iez.com.br	Created user registration with Id [eb3adb65-b6c4-455c-a5dd-dc5e9cadcf65] for user with Id [5e05cf13-5601-4819-8cdb-3c2fa3bb4d48] and application with Id [c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305]	{"data":{},"reason":"FusionAuth User Interface"}
13	1760035810252	leonardo.granja@iez.com.br	Updated the application with Id [c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305] and name [fab]	{"data":{},"newValue":{"accessControlConfiguration":{},"active":true,"authenticationTokenConfiguration":{"enabled":false},"data":{},"emailConfiguration":{},"externalIdentifierConfiguration":{},"formConfiguration":{"adminRegistrationFormId":"0c017da4-f7fd-3bbb-f80e-e23a1d902873","selfServiceFormConfiguration":{"requireCurrentPasswordOnPasswordChange":false}},"id":"c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305","jwtConfiguration":{"accessTokenKeyId":"d0b3f8a1-4885-43a1-9f04-668543613875","enabled":false,"idTokenKeyId":"d0b3f8a1-4885-43a1-9f04-668543613875","refreshTokenExpirationPolicy":"Fixed","refreshTokenOneTimeUseConfiguration":{"gracePeriodInSeconds":0},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1760035810195,"loginConfiguration":{"allowTokenRefresh":false,"generateRefreshTokens":false,"requireAuthentication":true},"multiFactorConfiguration":{"email":{},"sms":{}},"name":"fab","oauthConfiguration":{"authorizedOriginURLs":[],"authorizedRedirectURLs":[],"authorizedURLValidationPolicy":"ExactMatch","clientAuthenticationPolicy":"Required","clientId":"c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305","clientSecret":"*****","consentMode":"AlwaysPrompt","debug":false,"enabledGrants":["authorization_code","refresh_token","password"],"generateRefreshTokens":true,"logoutBehavior":"AllApplications","proofKeyForCodeExchangePolicy":"NotRequired","providedScopePolicy":{"address":{"enabled":true,"required":false},"email":{"enabled":true,"required":false},"phone":{"enabled":true,"required":false},"profile":{"enabled":true,"required":false}},"relationship":"FirstParty","requireClientAuthentication":true,"requireRegistration":false,"scopeHandlingPolicy":"Strict","unknownScopePolicy":"Reject"},"passwordlessConfiguration":{"enabled":false},"phoneConfiguration":{},"registrationConfiguration":{"birthDate":{"enabled":false,"required":false},"confirmPassword":false,"enabled":false,"firstName":{"enabled":false,"required":false},"fullName":{"enabled":false,"required":false},"lastName":{"enabled":false,"required":false},"loginIdType":"email","middleName":{"enabled":false,"required":false},"mobilePhone":{"enabled":false,"required":false},"preferredLanguages":{"enabled":false,"required":false},"type":"basic"},"registrationDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"roles":[],"samlv2Configuration":{"assertionEncryptionConfiguration":{"digestAlgorithm":"SHA256","enabled":false,"encryptionAlgorithm":"AES256GCM","keyLocation":"Child","keyTransportAlgorithm":"RSA_OAEP","maskGenerationFunction":"MGF1_SHA1"},"authorizedRedirectURLs":[],"debug":false,"enabled":false,"initiatedLogin":{"enabled":false,"nameIdFormat":"urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"},"loginHintConfiguration":{"enabled":true,"parameterName":"login_hint"},"logout":{"behavior":"AllParticipants","requireSignedRequests":false,"singleLogout":{"enabled":false,"xmlSignatureC14nMethod":"exclusive_with_comments"},"xmlSignatureC14nMethod":"exclusive_with_comments"},"requireSignedRequests":false,"xmlSignatureC14nMethod":"exclusive_with_comments","xmlSignatureLocation":"Assertion"},"scopes":[],"state":"Active","tenantId":"4706a90d-b0c6-c6b8-e73a-b9e89d19875b","universalConfiguration":{"universal":false},"unverified":{"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyRegistration":false,"webAuthnConfiguration":{"bootstrapWorkflow":{"enabled":false},"enabled":false,"reauthenticationWorkflow":{"enabled":false}}},"oldValue":{"accessControlConfiguration":{},"active":true,"authenticationTokenConfiguration":{"enabled":false},"data":{},"emailConfiguration":{},"externalIdentifierConfiguration":{},"formConfiguration":{"adminRegistrationFormId":"0c017da4-f7fd-3bbb-f80e-e23a1d902873","selfServiceFormConfiguration":{"requireCurrentPasswordOnPasswordChange":false}},"id":"c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305","insertInstant":1760025703853,"jwtConfiguration":{"accessTokenKeyId":"d0b3f8a1-4885-43a1-9f04-668543613875","enabled":false,"idTokenKeyId":"d0b3f8a1-4885-43a1-9f04-668543613875","refreshTokenExpirationPolicy":"Fixed","refreshTokenOneTimeUseConfiguration":{"gracePeriodInSeconds":0},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1760034399073,"loginConfiguration":{"allowTokenRefresh":false,"generateRefreshTokens":false,"requireAuthentication":true},"multiFactorConfiguration":{"email":{},"sms":{}},"name":"fab","oauthConfiguration":{"authorizedOriginURLs":[],"authorizedRedirectURLs":[],"authorizedURLValidationPolicy":"ExactMatch","clientAuthenticationPolicy":"Required","clientId":"c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305","clientSecret":"*****","consentMode":"AlwaysPrompt","debug":false,"enabledGrants":["authorization_code","refresh_token"],"generateRefreshTokens":true,"logoutBehavior":"AllApplications","proofKeyForCodeExchangePolicy":"NotRequired","providedScopePolicy":{"address":{"enabled":true,"required":false},"email":{"enabled":true,"required":false},"phone":{"enabled":true,"required":false},"profile":{"enabled":true,"required":false}},"relationship":"FirstParty","requireClientAuthentication":true,"requireRegistration":false,"scopeHandlingPolicy":"Strict","unknownScopePolicy":"Reject"},"passwordlessConfiguration":{"enabled":false},"phoneConfiguration":{},"registrationConfiguration":{"birthDate":{"enabled":false,"required":false},"confirmPassword":false,"enabled":false,"firstName":{"enabled":false,"required":false},"fullName":{"enabled":false,"required":false},"lastName":{"enabled":false,"required":false},"loginIdType":"email","middleName":{"enabled":false,"required":false},"mobilePhone":{"enabled":false,"required":false},"preferredLanguages":{"enabled":false,"required":false},"type":"basic"},"registrationDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"roles":[],"samlv2Configuration":{"assertionEncryptionConfiguration":{"digestAlgorithm":"SHA256","enabled":false,"encryptionAlgorithm":"AES256GCM","keyLocation":"Child","keyTransportAlgorithm":"RSA_OAEP","maskGenerationFunction":"MGF1_SHA1"},"authorizedRedirectURLs":[],"debug":false,"enabled":false,"initiatedLogin":{"enabled":false,"nameIdFormat":"urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"},"loginHintConfiguration":{"enabled":true,"parameterName":"login_hint"},"logout":{"behavior":"AllParticipants","requireSignedRequests":false,"singleLogout":{"enabled":false,"xmlSignatureC14nMethod":"exclusive_with_comments"},"xmlSignatureC14nMethod":"exclusive_with_comments"},"requireSignedRequests":false,"xmlSignatureC14nMethod":"exclusive_with_comments","xmlSignatureLocation":"Assertion"},"scopes":[],"state":"Active","tenantId":"4706a90d-b0c6-c6b8-e73a-b9e89d19875b","universalConfiguration":{"universal":false},"unverified":{"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyRegistration":false,"webAuthnConfiguration":{"bootstrapWorkflow":{"enabled":false},"enabled":false,"reauthenticationWorkflow":{"enabled":false}}},"reason":"FusionAuth User Interface"}
14	1760377887898	leonardo.granja@iez.com.br	Created the group with Id [18a954cf-3a23-441c-9033-ccce5f2c0281] and name [Greatek]	{"data":{},"reason":"FusionAuth User Interface"}
15	1760377901238	leonardo.granja@iez.com.br	Updated the tenant with Id [3df9a1ee-a354-4f0b-b8dd-4b55565d2372] and name [Web]	{"data":{},"newValue":{"accessControlConfiguration":{},"captchaConfiguration":{"captchaMethod":"GoogleRecaptchaV3","enabled":false,"threshold":0.5},"configured":true,"connectorPolicies":[{"connectorId":"e3306678-a53a-4964-9040-1c96f36dda72","domains":["*"],"migrate":false}],"data":{},"emailConfiguration":{"additionalHeaders":[],"debug":false,"defaultFromEmail":"change-me@example.com","defaultFromName":"FusionAuth","forgotPasswordEmailTemplateId":"de70e8df-860a-4cb3-9bb1-f8cdc112af34","host":"localhost","implicitEmailVerificationAllowed":true,"passwordlessEmailTemplateId":"20cff312-0de9-4ac0-85ea-f68b3b7a1263","port":25,"security":"NONE","setPasswordEmailTemplateId":"dcc66541-f54c-4aec-9f9b-d7cad905467d","unverified":{"allowEmailChangeWhenGated":false,"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyEmail":false,"verifyEmailWhenChanged":false},"eventConfiguration":{"events":{"group.create":{"enabled":false,"transactionType":"None"},"group.create.complete":{"enabled":false,"transactionType":"None"},"group.delete":{"enabled":false,"transactionType":"None"},"group.delete.complete":{"enabled":false,"transactionType":"None"},"group.member.add":{"enabled":false,"transactionType":"None"},"group.member.add.complete":{"enabled":false,"transactionType":"None"},"group.member.remove":{"enabled":false,"transactionType":"None"},"group.member.remove.complete":{"enabled":false,"transactionType":"None"},"group.member.update":{"enabled":false,"transactionType":"None"},"group.member.update.complete":{"enabled":false,"transactionType":"None"},"group.update":{"enabled":false,"transactionType":"None"},"group.update.complete":{"enabled":false,"transactionType":"None"},"jwt.public-key.update":{"enabled":false,"transactionType":"None"},"jwt.refresh":{"enabled":false,"transactionType":"None"},"jwt.refresh-token.revoke":{"enabled":false,"transactionType":"None"},"user.action":{"enabled":false,"transactionType":"None"},"user.bulk.create":{"enabled":false,"transactionType":"None"},"user.create":{"enabled":false,"transactionType":"None"},"user.create.complete":{"enabled":false,"transactionType":"None"},"user.deactivate":{"enabled":false,"transactionType":"None"},"user.delete":{"enabled":false,"transactionType":"None"},"user.delete.complete":{"enabled":false,"transactionType":"None"},"user.email.update":{"enabled":false,"transactionType":"None"},"user.email.verified":{"enabled":false,"transactionType":"None"},"user.identity-provider.link":{"enabled":false,"transactionType":"None"},"user.identity-provider.unlink":{"enabled":false,"transactionType":"None"},"user.identity.update":{"enabled":false,"transactionType":"None"},"user.identity.verified":{"enabled":false,"transactionType":"None"},"user.login.failed":{"enabled":false,"transactionType":"None"},"user.login.new-device":{"enabled":false,"transactionType":"None"},"user.login.success":{"enabled":false,"transactionType":"None"},"user.login.suspicious":{"enabled":false,"transactionType":"None"},"user.loginId.duplicate.create":{"enabled":false,"transactionType":"None"},"user.loginId.duplicate.update":{"enabled":false,"transactionType":"None"},"user.password.breach":{"enabled":false,"transactionType":"None"},"user.password.reset.send":{"enabled":false,"transactionType":"None"},"user.password.reset.start":{"enabled":false,"transactionType":"None"},"user.password.reset.success":{"enabled":false,"transactionType":"None"},"user.password.update":{"enabled":false,"transactionType":"None"},"user.reactivate":{"enabled":false,"transactionType":"None"},"user.registration.create":{"enabled":false,"transactionType":"None"},"user.registration.create.complete":{"enabled":false,"transactionType":"None"},"user.registration.delete":{"enabled":false,"transactionType":"None"},"user.registration.delete.complete":{"enabled":false,"transactionType":"None"},"user.registration.update":{"enabled":false,"transactionType":"None"},"user.registration.update.complete":{"enabled":false,"transactionType":"None"},"user.registration.verified":{"enabled":false,"transactionType":"None"},"user.two-factor.method.add":{"enabled":false,"transactionType":"None"},"user.two-factor.method.remove":{"enabled":false,"transactionType":"None"},"user.update":{"enabled":false,"transactionType":"None"},"user.update.complete":{"enabled":false,"transactionType":"None"}}},"externalIdentifierConfiguration":{"authorizationGrantIdTimeToLiveInSeconds":30,"changePasswordIdGenerator":{"length":32,"type":"randomBytes"},"changePasswordIdTimeToLiveInSeconds":600,"deviceCodeTimeToLiveInSeconds":300,"deviceUserCodeIdGenerator":{"length":6,"type":"randomAlphaNumeric"},"emailVerificationIdGenerator":{"length":32,"type":"randomBytes"},"emailVerificationIdTimeToLiveInSeconds":86400,"emailVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"externalAuthenticationIdTimeToLiveInSeconds":300,"loginIntentTimeToLiveInSeconds":1800,"oneTimePasswordTimeToLiveInSeconds":60,"passwordlessLoginGenerator":{"length":32,"type":"randomBytes"},"passwordlessLoginOneTimeCodeGenerator":{"length":6,"type":"randomDigits"},"passwordlessLoginTimeToLiveInSeconds":180,"pendingAccountLinkTimeToLiveInSeconds":3600,"phoneVerificationIdGenerator":{"length":32,"type":"randomBytes"},"phoneVerificationIdTimeToLiveInSeconds":86400,"phoneVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"registrationVerificationIdGenerator":{"length":32,"type":"randomBytes"},"registrationVerificationIdTimeToLiveInSeconds":86400,"registrationVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"rememberOAuthScopeConsentChoiceTimeToLiveInSeconds":2592000,"samlv2AuthNRequestIdTimeToLiveInSeconds":300,"setupPasswordIdGenerator":{"length":32,"type":"randomBytes"},"setupPasswordIdTimeToLiveInSeconds":86400,"trustTokenTimeToLiveInSeconds":180,"twoFactorIdTimeToLiveInSeconds":300,"twoFactorOneTimeCodeIdGenerator":{"length":6,"type":"randomDigits"},"twoFactorOneTimeCodeIdTimeToLiveInSeconds":60,"twoFactorTrustIdTimeToLiveInSeconds":2592000,"webAuthnAuthenticationChallengeTimeToLiveInSeconds":180,"webAuthnRegistrationChallengeTimeToLiveInSeconds":180},"failedAuthenticationConfiguration":{"actionCancelPolicy":{"onPasswordReset":false},"actionDuration":3,"actionDurationUnit":"MINUTES","emailUser":false,"resetCountInSeconds":60,"tooManyAttempts":5},"familyConfiguration":{"allowChildRegistrations":true,"deleteOrphanedAccounts":false,"deleteOrphanedAccountsDays":30,"enabled":false,"maximumChildAge":12,"minimumOwnerAge":21,"parentEmailRequired":false},"formConfiguration":{"adminUserFormId":"8df860fe-857d-847d-ada8-2e86bac1fb87"},"httpSessionMaxInactiveInterval":3600,"id":"3df9a1ee-a354-4f0b-b8dd-4b55565d2372","insertInstant":1760030525087,"issuer":"localhost:9011","jwtConfiguration":{"accessTokenKeyId":"d0b3f8a1-4885-43a1-9f04-668543613875","idTokenKeyId":"d0b3f8a1-4885-43a1-9f04-668543613875","refreshTokenExpirationPolicy":"Fixed","refreshTokenOneTimeUseConfiguration":{"gracePeriodInSeconds":0},"refreshTokenRevocationPolicy":{"onLoginPrevented":true,"onMultiFactorEnable":false,"onOneTimeTokenReuse":false,"onPasswordChanged":true},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1760377901159,"loginConfiguration":{"requireAuthentication":true},"maximumPasswordAge":{"days":180,"enabled":false},"minimumPasswordAge":{"enabled":false,"seconds":30},"multiFactorConfiguration":{"authenticator":{"algorithm":"HmacSHA1","codeLength":6,"enabled":true,"timeStep":30},"email":{"enabled":false,"templateId":"bc6a1254-8779-4112-b3da-88c42a3abde9"},"loginPolicy":"Enabled","sms":{"enabled":false}},"name":"Web","oauthConfiguration":{},"passwordEncryptionConfiguration":{"encryptionScheme":"salted-pbkdf2-hmac-sha256","encryptionSchemeFactor":24000,"modifyEncryptionSchemeOnLogin":false},"passwordValidationRules":{"breachDetection":{"enabled":false,"matchMode":"High","notifyUserEmailTemplateId":"b27c0cf8-3468-4f83-a1f6-97e9075428e2","onLogin":"Off"},"maxLength":256,"minLength":8,"rememberPreviousPasswords":{"count":1,"enabled":false},"requireMixedCase":false,"requireNonAlpha":false,"requireNumber":false,"validateOnLogin":false},"phoneConfiguration":{"implicitPhoneVerificationAllowed":true,"unverified":{"allowPhoneNumberChangeWhenGated":false,"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyPhoneNumber":false},"rateLimitConfiguration":{"failedLogin":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"forgotPassword":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendEmailVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordless":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordlessPhone":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPhoneVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendRegistrationVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendTwoFactor":{"enabled":false,"limit":5,"timePeriodInSeconds":60}},"registrationConfiguration":{"blockedDomains":[]},"scimServerConfiguration":{"enabled":false},"ssoConfiguration":{"allowAccessTokenBootstrap":false,"deviceTrustTimeToLiveInSeconds":31536000},"state":"Active","themeId":"75a068fd-e94b-451a-9aeb-3ddb9a3b5987","userDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"usernameConfiguration":{"unique":{"enabled":false,"numberOfDigits":5,"separator":"#","strategy":"OnCollision"}},"webAuthnConfiguration":{"bootstrapWorkflow":{"authenticatorAttachmentPreference":"platform","enabled":false,"userVerificationRequirement":"required"},"debug":false,"enabled":false,"reauthenticationWorkflow":{"authenticatorAttachmentPreference":"platform","enabled":false,"userVerificationRequirement":"required"}}},"oldValue":{"accessControlConfiguration":{},"captchaConfiguration":{"captchaMethod":"GoogleRecaptchaV3","enabled":false,"threshold":0.5},"configured":true,"connectorPolicies":[{"connectorId":"e3306678-a53a-4964-9040-1c96f36dda72","domains":["*"],"migrate":false}],"data":{},"emailConfiguration":{"additionalHeaders":[],"debug":false,"defaultFromEmail":"change-me@example.com","defaultFromName":"FusionAuth","forgotPasswordEmailTemplateId":"de70e8df-860a-4cb3-9bb1-f8cdc112af34","host":"localhost","implicitEmailVerificationAllowed":true,"passwordlessEmailTemplateId":"20cff312-0de9-4ac0-85ea-f68b3b7a1263","port":25,"security":"NONE","setPasswordEmailTemplateId":"dcc66541-f54c-4aec-9f9b-d7cad905467d","unverified":{"allowEmailChangeWhenGated":false,"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyEmail":false,"verifyEmailWhenChanged":false},"eventConfiguration":{"events":{"group.create":{"enabled":false,"transactionType":"None"},"group.create.complete":{"enabled":false,"transactionType":"None"},"group.delete":{"enabled":false,"transactionType":"None"},"group.delete.complete":{"enabled":false,"transactionType":"None"},"group.member.add":{"enabled":false,"transactionType":"None"},"group.member.add.complete":{"enabled":false,"transactionType":"None"},"group.member.remove":{"enabled":false,"transactionType":"None"},"group.member.remove.complete":{"enabled":false,"transactionType":"None"},"group.member.update":{"enabled":false,"transactionType":"None"},"group.member.update.complete":{"enabled":false,"transactionType":"None"},"group.update":{"enabled":false,"transactionType":"None"},"group.update.complete":{"enabled":false,"transactionType":"None"},"jwt.public-key.update":{"enabled":false,"transactionType":"None"},"jwt.refresh":{"enabled":false,"transactionType":"None"},"jwt.refresh-token.revoke":{"enabled":false,"transactionType":"None"},"user.action":{"enabled":false,"transactionType":"None"},"user.bulk.create":{"enabled":false,"transactionType":"None"},"user.create":{"enabled":false,"transactionType":"None"},"user.create.complete":{"enabled":false,"transactionType":"None"},"user.deactivate":{"enabled":false,"transactionType":"None"},"user.delete":{"enabled":false,"transactionType":"None"},"user.delete.complete":{"enabled":false,"transactionType":"None"},"user.email.update":{"enabled":false,"transactionType":"None"},"user.email.verified":{"enabled":false,"transactionType":"None"},"user.identity-provider.link":{"enabled":false,"transactionType":"None"},"user.identity-provider.unlink":{"enabled":false,"transactionType":"None"},"user.identity.update":{"enabled":false,"transactionType":"None"},"user.identity.verified":{"enabled":false,"transactionType":"None"},"user.login.failed":{"enabled":false,"transactionType":"None"},"user.login.new-device":{"enabled":false,"transactionType":"None"},"user.login.success":{"enabled":false,"transactionType":"None"},"user.login.suspicious":{"enabled":false,"transactionType":"None"},"user.loginId.duplicate.create":{"enabled":false,"transactionType":"None"},"user.loginId.duplicate.update":{"enabled":false,"transactionType":"None"},"user.password.breach":{"enabled":false,"transactionType":"None"},"user.password.reset.send":{"enabled":false,"transactionType":"None"},"user.password.reset.start":{"enabled":false,"transactionType":"None"},"user.password.reset.success":{"enabled":false,"transactionType":"None"},"user.password.update":{"enabled":false,"transactionType":"None"},"user.reactivate":{"enabled":false,"transactionType":"None"},"user.registration.create":{"enabled":false,"transactionType":"None"},"user.registration.create.complete":{"enabled":false,"transactionType":"None"},"user.registration.delete":{"enabled":false,"transactionType":"None"},"user.registration.delete.complete":{"enabled":false,"transactionType":"None"},"user.registration.update":{"enabled":false,"transactionType":"None"},"user.registration.update.complete":{"enabled":false,"transactionType":"None"},"user.registration.verified":{"enabled":false,"transactionType":"None"},"user.two-factor.method.add":{"enabled":false,"transactionType":"None"},"user.two-factor.method.remove":{"enabled":false,"transactionType":"None"},"user.update":{"enabled":false,"transactionType":"None"},"user.update.complete":{"enabled":false,"transactionType":"None"}}},"externalIdentifierConfiguration":{"authorizationGrantIdTimeToLiveInSeconds":30,"changePasswordIdGenerator":{"length":32,"type":"randomBytes"},"changePasswordIdTimeToLiveInSeconds":600,"deviceCodeTimeToLiveInSeconds":300,"deviceUserCodeIdGenerator":{"length":6,"type":"randomAlphaNumeric"},"emailVerificationIdGenerator":{"length":32,"type":"randomBytes"},"emailVerificationIdTimeToLiveInSeconds":86400,"emailVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"externalAuthenticationIdTimeToLiveInSeconds":300,"loginIntentTimeToLiveInSeconds":1800,"oneTimePasswordTimeToLiveInSeconds":60,"passwordlessLoginGenerator":{"length":32,"type":"randomBytes"},"passwordlessLoginOneTimeCodeGenerator":{"length":6,"type":"randomDigits"},"passwordlessLoginTimeToLiveInSeconds":180,"pendingAccountLinkTimeToLiveInSeconds":3600,"phoneVerificationIdGenerator":{"length":32,"type":"randomBytes"},"phoneVerificationIdTimeToLiveInSeconds":86400,"phoneVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"registrationVerificationIdGenerator":{"length":32,"type":"randomBytes"},"registrationVerificationIdTimeToLiveInSeconds":86400,"registrationVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"rememberOAuthScopeConsentChoiceTimeToLiveInSeconds":2592000,"samlv2AuthNRequestIdTimeToLiveInSeconds":300,"setupPasswordIdGenerator":{"length":32,"type":"randomBytes"},"setupPasswordIdTimeToLiveInSeconds":86400,"trustTokenTimeToLiveInSeconds":180,"twoFactorIdTimeToLiveInSeconds":300,"twoFactorOneTimeCodeIdGenerator":{"length":6,"type":"randomDigits"},"twoFactorOneTimeCodeIdTimeToLiveInSeconds":60,"twoFactorTrustIdTimeToLiveInSeconds":2592000,"webAuthnAuthenticationChallengeTimeToLiveInSeconds":180,"webAuthnRegistrationChallengeTimeToLiveInSeconds":180},"failedAuthenticationConfiguration":{"actionCancelPolicy":{"onPasswordReset":false},"actionDuration":3,"actionDurationUnit":"MINUTES","emailUser":false,"resetCountInSeconds":60,"tooManyAttempts":5},"familyConfiguration":{"allowChildRegistrations":true,"deleteOrphanedAccounts":false,"deleteOrphanedAccountsDays":30,"enabled":false,"maximumChildAge":12,"minimumOwnerAge":21,"parentEmailRequired":false},"formConfiguration":{"adminUserFormId":"8df860fe-857d-847d-ada8-2e86bac1fb87"},"httpSessionMaxInactiveInterval":3600,"id":"3df9a1ee-a354-4f0b-b8dd-4b55565d2372","insertInstant":1760030525087,"issuer":"localhost:9011","jwtConfiguration":{"accessTokenKeyId":"d0b3f8a1-4885-43a1-9f04-668543613875","idTokenKeyId":"d0b3f8a1-4885-43a1-9f04-668543613875","refreshTokenExpirationPolicy":"Fixed","refreshTokenOneTimeUseConfiguration":{"gracePeriodInSeconds":0},"refreshTokenRevocationPolicy":{"onLoginPrevented":true,"onMultiFactorEnable":false,"onOneTimeTokenReuse":false,"onPasswordChanged":true},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"lambdaConfiguration":{},"lastUpdateInstant":1760030525087,"loginConfiguration":{"requireAuthentication":true},"maximumPasswordAge":{"days":180,"enabled":false},"minimumPasswordAge":{"enabled":false,"seconds":30},"multiFactorConfiguration":{"authenticator":{"algorithm":"HmacSHA1","codeLength":6,"enabled":true,"timeStep":30},"email":{"enabled":false,"templateId":"bc6a1254-8779-4112-b3da-88c42a3abde9"},"loginPolicy":"Enabled","sms":{"enabled":false}},"name":"Greatek","oauthConfiguration":{},"passwordEncryptionConfiguration":{"encryptionScheme":"salted-pbkdf2-hmac-sha256","encryptionSchemeFactor":24000,"modifyEncryptionSchemeOnLogin":false},"passwordValidationRules":{"breachDetection":{"enabled":false,"matchMode":"High","notifyUserEmailTemplateId":"b27c0cf8-3468-4f83-a1f6-97e9075428e2","onLogin":"Off"},"maxLength":256,"minLength":8,"rememberPreviousPasswords":{"count":1,"enabled":false},"requireMixedCase":false,"requireNonAlpha":false,"requireNumber":false,"validateOnLogin":false},"phoneConfiguration":{"implicitPhoneVerificationAllowed":true,"unverified":{"allowPhoneNumberChangeWhenGated":false,"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyPhoneNumber":false},"rateLimitConfiguration":{"failedLogin":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"forgotPassword":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendEmailVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordless":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordlessPhone":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPhoneVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendRegistrationVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendTwoFactor":{"enabled":false,"limit":5,"timePeriodInSeconds":60}},"registrationConfiguration":{"blockedDomains":[]},"scimServerConfiguration":{"enabled":false},"ssoConfiguration":{"allowAccessTokenBootstrap":false,"deviceTrustTimeToLiveInSeconds":31536000},"state":"Active","themeId":"75a068fd-e94b-451a-9aeb-3ddb9a3b5987","userDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"usernameConfiguration":{"unique":{"enabled":false,"numberOfDigits":5,"separator":"#","strategy":"OnCollision"}},"webAuthnConfiguration":{"bootstrapWorkflow":{"authenticatorAttachmentPreference":"platform","enabled":false,"userVerificationRequirement":"required"},"debug":false,"enabled":false,"reauthenticationWorkflow":{"authenticatorAttachmentPreference":"platform","enabled":false,"userVerificationRequirement":"required"}}},"reason":"FusionAuth User Interface"}
16	1760379547523	leonardo.granja@iez.com.br	Created user with Id [b8291ee3-dd34-46d8-80a9-1cd1b6d885d1], name [null] and loginId [teste@web.com]	{"data":{},"reason":"FusionAuth User Interface"}
17	1760533642820	leonardo.granja@iez.com.br	Created the API key with Id [cb7b6a34-ce32-424a-92ed-f56847cce86a] and a key ending [*rPxAVRi].	{"data":{},"reason":"FusionAuth User Interface"}
18	1760533705021	leonardo.granja@iez.com.br	Deleted user with Id [99f25af8-8ea5-4cee-9adb-825d761d145e]	{"data":{},"reason":"FusionAuth User Interface"}
19	1760533891997	leonardo.granja@iez.com.br	Created the application with Id [a290a97c-e315-4c11-9823-57496eed344c] and name [web]	{"data":{},"reason":"FusionAuth User Interface"}
20	1760533933658	leonardo.granja@iez.com.br	Deleted user with Id [3ea72eea-fc4e-481d-b5b0-74034aedcfe9]	{"data":{},"reason":"FusionAuth User Interface"}
21	1760534005652	leonardo.granja@iez.com.br	Deleted user with Id [840dc3b2-46d9-410c-99e6-eeda141e71a4]	{"data":{},"reason":"FusionAuth User Interface"}
22	1760537366526	leonardo.granja@iez.com.br	Deleted user with Id [a446b8b7-d8f5-4a61-9790-c4e46e07e8d6]	{"data":{},"reason":"FusionAuth User Interface"}
23	1760617080564	leonardo.granja@iez.com.br	Deleted user with Id [b8d74322-c167-435a-bb45-d2cb143f381c]	{"data":{},"reason":"FusionAuth User Interface"}
24	1760617233318	leonardo.granja@iez.com.br	Deleted user with Id [84235969-dcd3-4cab-86a3-c2a064a14b35]	{"data":{},"reason":"FusionAuth User Interface"}
25	1760617316907	leonardo.granja@iez.com.br	Deleted user with Id [834dc1e7-7a02-4214-b5c0-437f592a08f5]	{"data":{},"reason":"FusionAuth User Interface"}
\.


--
-- Data for Name: authentication_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentication_keys (id, expiration_instant, insert_instant, ip_access_control_lists_id, last_update_instant, key_format, key_manager, key_value, permissions, meta_data, name, tenants_id) FROM stdin;
fa2232c8-30b7-6cd1-9e1b-af2198d64c44	\N	1760016864741	\N	1760016864741	\N	f	__internal_ZjhmMzZhODllN2YwOTljZGU3NGE3Y2RjYzQ3Y2QwNmQxYWFkZmU2MTczYWFkMDk5YTRlNDEwMjcyZTBiNzc2MQ==	{"endpoints": {"/api/cache/reload": ["POST"], "/api/system/log/export": ["POST"], "/internal/webhook": ["POST"]}}	{"attributes": {"description": "Internal Use Only.", "internalCacheReloader": "true", "internalLogDownloader": "true", "internalWebhook": "true"}}	\N	\N
cb7b6a34-ce32-424a-92ed-f56847cce86a	\N	1760533642807	\N	1760533642807	0	f	M25pYtuBjT2Wh6nNPTb_otST88X0z2czdumkHbwD98J0r7wazrPxAVRi	\N	{}	Wrapper	\N
\.


--
-- Data for Name: breached_password_metrics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.breached_password_metrics (tenants_id, matched_exact_count, matched_sub_address_count, matched_common_password_count, matched_password_count, passwords_checked_count) FROM stdin;
\.


--
-- Data for Name: clean_speak_applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clean_speak_applications (applications_id, clean_speak_application_id) FROM stdin;
\.


--
-- Data for Name: common_breached_passwords; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.common_breached_passwords (password) FROM stdin;
\.


--
-- Data for Name: connectors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.connectors (id, data, insert_instant, last_update_instant, name, reconcile_lambdas_id, ssl_certificate_keys_id, type) FROM stdin;
e3306678-a53a-4964-9040-1c96f36dda72	{}	1760016864741	1760016864741	Default	\N	\N	0
\.


--
-- Data for Name: connectors_tenants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.connectors_tenants (connectors_id, data, sequence, tenants_id) FROM stdin;
e3306678-a53a-4964-9040-1c96f36dda72	{"data":{},"domains":["*"],"migrate":false}	0	4706a90d-b0c6-c6b8-e73a-b9e89d19875b
e3306678-a53a-4964-9040-1c96f36dda72	{"data":{},"domains":["*"],"migrate":false}	0	3df9a1ee-a354-4f0b-b8dd-4b55565d2372
\.


--
-- Data for Name: consents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consents (id, consent_email_templates_id, data, insert_instant, last_update_instant, name, email_plus_email_templates_id) FROM stdin;
70db7dad-2691-40db-ba67-e18f463a56ba	\N	{"countryMinimumAgeForSelfConsent":{},"data":{},"defaultMinimumAgeForSelfConsent":13,"emailPlus":{"enabled":true,"maximumTimeToSendEmailInHours":48,"minimumTimeToSendEmailInHours":24},"multipleValuesAllowed":false,"values":[]}	1760017304865	1760017304865	COPPA Email+	\N
f5f85786-70a2-4802-a00a-56b521cd9588	\N	{"countryMinimumAgeForSelfConsent":{},"data":{},"defaultMinimumAgeForSelfConsent":13,"emailPlus":{"enabled":false,"maximumTimeToSendEmailInHours":48,"minimumTimeToSendEmailInHours":24},"multipleValuesAllowed":false,"values":[]}	1760017304870	1760017304870	COPPA VPC	\N
\.


--
-- Data for Name: current_usage_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.current_usage_stats (last_checked_instant, last_modified_instant, stats) FROM stdin;
1760552458406	1756842246204	apiKeyExpiringEnabled,apiKeyHashedEnabled,applicationActiveNumber,applicationActiveLoggedIntoNumber,applicationActiveRoleNumber,applicationActsAsSamlv2Idp,applicationBasicSelfServiceRegistrationEnabled,applicationAdvancedSelfServiceRegistrationEnabled,applicationCustomSelfServiceAccountForm,applicationCustomThemeUsed,applicationEmailUpdateTemplate,applicationEmailVerificationTemplate,applicationEmailVerifiedTemplate,applicationEnabledIdentityProviders,applicationEnabledIdentityProvidersWithLambdas,applicationForgotPasswordTemplate,applicationLoggedInApplicationsUsingSimpleThemes,applicationLoginApiAuthenticationDisabled,applicationLoginApiRefreshTokensEnabled,applicationLoginIdInUseOnCreateTemplate,applicationLoginIdInUseOnUpdateTemplate,applicationLoginNewDevice,applicationLoginSuspiciousEmailTemplate,applicationMagicLinks,applicationMfaPolicy,applicationMultiFactorEmailMessageTemplate,applicationMultiFactorSmsMessageTemplate,applicationNumber,applicationPasswordResetSuccessTemplate,applicationPasswordUpdateTemplate,applicationPasswordlessTemplate,applicationRefreshTokenGracePeriodEnabled,applicationSetPasswordTemplate,applicationRequiredScopes,applicationOptionalScopes,applicationThirdParty,applicationTwoFactorMethodAddTemplate,applicationTwoFactorMethodRemoveTemplate,applicationVerificationTemplate,applicationSelfServiceRegistrationValidationLambda,applicationUserinfoPopulateLambda,applicationAccessTokenPopulateLambda,applicationSamlv2PopulateLambda,applicationIdTokenPopulateLambda,atdCaptcha,atdIpAcls,atdRateLimiting,scimEnabled,entitiesEntityGrants,entitiesPermissions,entitiesTypeNumber,groupApplicationRoles,instanceCompanyPlan,instanceDailyActiveUsers,instanceDatabaseConnectionTimeout,instanceDatabaseIdleTimeout,instanceDatabaseMaxLifetime,instanceDatabaseMaximumPoolSize,instanceDatabaseMinimumIdle,instanceDatabaseMysqlEnforceUtf8mb4,instanceDatabaseVersion,instanceElasticsearchVersion,instanceFirstTimeSetupProgress,instanceFusionauthAppHttpReadTimeout,instanceFusionauthAppLocalMetricsEnabled,instanceFusionauthAppMemory,instanceFusionauthAppReindexBatchSize,instanceFusionauthAppReindexThreadCount,instanceFusionauthAppSearchDefaultRefreshInterval,instanceFusionauthSearchHostsCount,instanceJavaVersion,instanceLicenseType,instanceNodes,instanceProxyEnabled,instanceSearchType,tenantBreachedPasswordDetection,tenantConfirmChildTemplate,tenantCustomAdminUserForm,tenantCustomConnectors,tenantCustomThemeUsed,tenantEmailMfaEnabled,tenantEmailUpdateTemplate,tenantEmailVerifiedTemplate,tenantFamilyEnabledTemplate,tenantFamilyRequestTemplate,tenantForgotPasswordTemplate,tenantLoggedInApplicationsUsingSimpleThemesFromTenant,tenantLoginIdInUseOnCreateTemplate,tenantLoginIdInUseOnUpdateTemplate,tenantLoginNewDeviceTemplate,tenantLoginSuspiciousEmailTemplate,tenantMultiFactorEmailMessageTemplate,tenantClientCredentialsLambdaEnabled,messengersTwilio,integrationsCleanspeakEnabled,integrationsKafkaEnabled,messengersGeneric,messengersKafka,organizationAdminTenantNumber,tenantMultiFactorSmsMessageTemplate,tenantNumber,tenantParentRegistrationTemplate,tenantPasswordResetSuccessTemplate,tenantPasswordUpdateTemplate,tenantPasswordlessTemplate,tenantSetPasswordTemplate,tenantSmsMfaEnabled,tenantSsoSessionBootstrapEnabled,tenantTotpMfaEnabled,tenantTwoFactorMethodAddTemplate,tenantTwoFactorMethodRemoveTemplate,tenantVerificationTemplate,tenantWebauthnEnabled,universalApplicationNumber,webhookAuditLogCreate,webhookEventLogCreate,webhookGroupCreate,webhookGroupCreateComplete,webhookGroupCreateTransactional,webhookGroupDelete,webhookGroupDeleteComplete,webhookGroupDeleteTransactional,webhookGroupMemberAdd,webhookGroupMemberAddComplete,webhookGroupMemberAddTransactional,webhookGroupMemberRemove,webhookGroupMemberRemoveComplete,webhookGroupMemberRemoveTransactional,webhookGroupMemberUpdate,webhookGroupMemberUpdateComplete,webhookGroupMemberUpdateTransactional,webhookGroupUpdate,webhookGroupUpdateComplete,webhookGroupUpdateTransactional,webhookJwtPublicKeyUpdate,webhookJwtPublicKeyUpdateTransactional,webhookJwtRefresh,webhookJwtRefreshTransactional,webhookJwtRefreshTokenRevoke,webhookJwtRefreshTokenRevokeTransactional,webhookKickstartSuccess,webhookUserAction,webhookUserBulkCreate,webhookUserBulkCreateTransactional,webhookUserCreate,webhookUserCreateComplete,webhookUserCreateTransactional,webhookUserDeactivate,webhookUserDeactivateTransactional,webhookUserDelete,webhookUserDeleteComplete,webhookUserDeleteTransactional,webhookUserEmailUpdate,webhookUserEmailVerified,webhookUserEmailVerifiedTransactional,webhookUserIdentityProviderLink,webhookUserIdentityProviderUnlink,webhookUserLoginFailed,webhookUserLoginFailedTransactional,webhookUserLoginNewDevice,webhookUserLoginNewDeviceTransactional,webhookUserLoginSuccess,webhookUserLoginSuccessTransactional,webhookUserLoginSuspicious,webhookUserLoginSuspiciousTransactional,webhookUserLoginIdDuplicateCreate,webhookUserLoginIdDuplicateUpdate,webhookUserPasswordBreach,webhookUserPasswordBreachTransactional,webhookUserPasswordResetSend,webhookUserPasswordResetStart,webhookUserPasswordResetSuccess,webhookUserPasswordUpdate,webhookUserReactivate,webhookUserReactivateTransactional,webhookUserRegistrationCreate,webhookUserRegistrationCreateComplete,webhookUserRegistrationCreateTransactional,webhookUserRegistrationDelete,webhookUserRegistrationDeleteComplete,webhookUserRegistrationDeleteTransactional,webhookUserRegistrationUpdate,webhookUserRegistrationUpdateComplete,webhookUserRegistrationUpdateTransactional,webhookUserRegistrationVerified,webhookUserRegistrationVerifiedTransactional,webhookUserTwoFactorMethodAdd,webhookUserTwoFactorMethodRemove,webhookUserUpdate,webhookUserUpdateComplete,webhookUserUpdateTransactional
\.


--
-- Data for Name: data_sets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_sets (name, last_update_instant) FROM stdin;
BreachPasswords	1581476456155
\.


--
-- Data for Name: email_templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_templates (id, default_from_name, default_html_template, default_subject, default_text_template, from_email, insert_instant, last_update_instant, localized_from_names, localized_html_templates, localized_subjects, localized_text_templates, name) FROM stdin;
b27c0cf8-3468-4f83-a1f6-97e9075428e2	\N	[#setting url_escaping_charset="UTF-8"]\n<p>This password was found in the list of vulnerable passwords, and is no longer secure.</p>\n\n<p>In order to secure your account, it is recommended to change your password at your earliest convenience.</p>\n\n<p>Follow this link to change your password.</p>\n\n<a href="http://localhost:9011/password/forgot?client_id=${(application.oauthConfiguration.clientId)!''}&email=${user.email?url}&tenantId=${user.tenantId}">\n  http://localhost:9011/password/forgot?client_id=${(application.oauthConfiguration.clientId)!''}&email=${user.email?url}&tenantId=${user.tenantId}\n</a>\n\n- FusionAuth Admin	Your password is not secure	[#setting url_escaping_charset="UTF-8"]\nThis password was found in the list of vulnerable passwords, and is no longer secure.\n\nIn order to secure your account, it is recommended to change your password at your earliest convenience.\n\nFollow this link to change your password.\n\nhttp://localhost:9011/password/forgot?client_id=${(application.oauthConfiguration.clientId)!''}&email=${user.email?url}&tenantId=${user.tenantId}\n\n- FusionAuth Admin\n\n\n	\N	1760017304471	1760017304471	{}	{}	{}	{}	[FusionAuth Default] Breached Password Notification
de70e8df-860a-4cb3-9bb1-f8cdc112af34	\N	[#setting url_escaping_charset="UTF-8"]\nTo change your password click on the following link.\n<p>\n  [#-- The optional 'state' map provided on the Forgot Password API call is exposed in the template as 'state'.\n       If we have an application context, append the client_id to ensure the correct application theme when applicable.\n  --]\n  [#assign url = "http://localhost:9011/password/change/${changePasswordId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}" /]\n  [#list state!{} as key, value][#if key != "tenantId" && key != "client_id" && value??][#assign url = url + "&" + key?url + "=" + value?url/][/#if][/#list]\n  <a href="${url}">${url}</a>\n</p>\n- FusionAuth Admin\n	Reset your password	[#setting url_escaping_charset="UTF-8"]\nTo change your password click on the following link.\n\n  [#-- The optional 'state' map provided on the Forgot Password API call is exposed in the template as 'state'.\n       If we have an application context, append the client_id to ensure the correct application theme when applicable.\n  --]\n[#assign url = "http://localhost:9011/password/change/${changePasswordId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}" /]\n[#list state!{} as key, value][#if key != "tenantId" && key != "client_id" && value??][#assign url = url + "&" + key?url + "=" + value?url/][/#if][/#list]\n\n${url}\n\n- FusionAuth Admin\n	\N	1760017304476	1760017304476	{}	{}	{}	{}	[FusionAuth Default] Forgot Password
8d42d882-aa39-4e97-9837-515ba7918bfb	\N	Your child has created an account with us and you need to confirm them before they are added to your family. Click the link below to confirm your child's account.\n<p>\n  <a href="http://example.com/family/confirm-child">http://example.com/family/confirm-child</a>\n</p>\n- FusionAuth Admin	Confirm your child's account	Your child has created an account with us and you need to confirm them before they are added to your family. Click the link below to confirm your child's account.\n\nhttp://example.com/family/confirm-child\n\n- FusionAuth Admin	\N	1760017304476	1760017304476	{}	{}	{}	{}	[FusionAuth Default] Confirm Child Account
a3300a3f-aac4-45d9-8df8-19a4faea8cc9	\N	A while ago, you granted your child consent in our system. This email is a second notice of this consent as required by law and also to remind to that you can revoke this consent at anytime on our website or by clicking the link below:\n<p>\n  <a href="http://example.com/consent/manage">http://example.com/consent/manage</a>\n</p>\n- FusionAuth Admin	Reminder: Notice of your consent	A while ago, you granted your child consent in our system. This email is a second notice of this consent as required by law and also to remind to that you can revoke this consent at anytime on our website or by clicking the link below:\n\nhttp://example.com/consent/manage\n\n- FusionAuth Admin	\N	1760017304477	1760017304477	{}	{}	{}	{}	[FusionAuth Default] COPPA Notice Reminder
dfe74cf5-a6a0-405b-b6c0-03b9ed280e38	\N	You recently granted your child consent in our system. This email is to notify you of this consent. If you did not grant this consent or wish to revoke this consent, click the link below:\n<p>\n  <a href="http://example.com/consent/manage">http://example.com/consent/manage</a>\n</p>\n- FusionAuth Admin	Notice of your consent	You recently granted your child consent in our system. This email is to notify you of this consent. If you did not grant this consent or wish to revoke this consent, click the link below:\n\nhttp://example.com/consent/manage\n\n- FusionAuth Admin	\N	1760017304478	1760017304478	{}	{}	{}	{}	[FusionAuth Default] COPPA Notice
c879a280-ec5d-45b6-bc55-9a2f05b6c1f9	\N	[#if user.verified]\nPro tip, your email has already been verified, but feel free to complete the verification process to verify your verification of your email address.\n[/#if]\n\n[#-- When a one-time code is provided, you will want the user to enter this value interactively using a form. In this workflow the verificationId\n     is not shown to the user and instead the one-time code must be paired with the verificationId which is usually in a hidden form field. When the two\n     values are presented together, the email address can be verified --]\n[#if verificationOneTimeCode??]\n<p>To complete your email verification enter this code into the email verification form.</p>\n<p> ${verificationOneTimeCode} </p>\n[#else]\nTo complete your email verification click on the following link.\n<p>\n  <a href="http://localhost:9011/email/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}">\n    http://localhost:9011/email/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}\n  </a>\n</p>\n[/#if]\n\n- FusionAuth Admin\n	Verify your FusionAuth email address	[#if user.verified]\nPro tip, your email has already been verified, but feel free to complete the verification process to verify your verification of your email address.\n[/#if]\n\n[#-- When a one-time code is provided, you will want the user to enter this value interactively using a form. In this workflow the verificationId\n     is not shown to the user and instead the one-time code must be paired with the verificationId which is usually in a hidden form field. When the two\n     values are presented together, the email address can be verified --]\n[#if verificationOneTimeCode??]\nTo complete your email verification enter this code into the email verification form.\n\n${verificationOneTimeCode}\n[#else]\nTo complete your email verification click on the following link.\n\nhttp://localhost:9011/email/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}\n[/#if]\n\n- FusionAuth Admin\n	\N	1760017304480	1760017304480	{}	{}	{}	{}	[FusionAuth Default] Email Verification
8ed32563-d321-4ab7-b2bf-fecb21dc0973	\N	Your child has created an account with us and needs you to create an account and verify them. You can sign up using the link below:\n<p>\n  <a href="http://example.com/family/confirm-child">http://example.com/family/confirm-child</a>\n</p>\n- FusionAuth Admin	Create your parental account	Your child has created an account with us and needs you to create an account and verify them. You can sign up using the link below:\n\nhttp://example.com/family/confirm-child\n\n- FusionAuth Admin	\N	1760017304481	1760017304481	{}	{}	{}	{}	[FusionAuth Default] Parent Registration
20cff312-0de9-4ac0-85ea-f68b3b7a1263	\N	[#setting url_escaping_charset="UTF-8"]\nYou have requested to log into FusionAuth using this email address. If you do not recognize this request please ignore this email.\n<p>\n  [#-- The optional 'state' map provided on the Start Passwordless API call is exposed in the template as 'state' --]\n  [#assign url = "http://localhost:9011/oauth2/passwordless/${code}?tenantId=${user.tenantId}" /]\n  [#list state!{} as key, value][#if key != "tenantId" && value??][#assign url = url + "&" + key?url + "=" + value?url/][/#if][/#list]\n  <a href="${url}">${url}</a>\n</p>\n- FusionAuth Admin\n	Log into FusionAuth	[#setting url_escaping_charset="UTF-8"]\nYou have requested to log into FusionAuth using this email address. If you do not recognize this request please ignore this email.\n\n[#-- The optional 'state' map provided on the Start Passwordless API call is exposed in the template as 'state' --]\n[#assign url = "http://localhost:9011/oauth2/passwordless/${code}?tenantId=${user.tenantId}" /]\n[#list state!{} as key, value][#if key != "tenantId" && value??][#assign url = url + "&" + key?url + "=" + value?url/][/#if][/#list]\n\n${url}\n\n- FusionAuth Admin\n	\N	1760017304481	1760017304481	{}	{}	{}	{}	[FusionAuth Default] Passwordless Login
b6984194-0274-4c16-a78a-4f69c59cfa45	\N	[#if registration.verified]\nPro tip, your registration has already been verified, but feel free to complete the verification process to verify your verification of your registration.\n[/#if]\n\n[#-- When a one-time code is provided, you will want the user to enter this value interactively using a form. In this workflow the verificationId\n     is not shown to the user and instead the one-time code must be paired with the verificationId which is usually in a hidden form field. When the two\n     values are presented together, the registration can be verified --]\n[#if verificationOneTimeCode??]\n<p>To complete your registration verification enter this code into the registration verification form.</p>\n<p> ${verificationOneTimeCode} </p>\n[#else]\nTo complete your registration verification click on the following link.\n<p>\n  <a href="http://localhost:9011/registration/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}">\n    http://localhost:9011/registration/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}\n  </a>\n</p>\n[/#if]\n\n- FusionAuth Admin\n	Verify your registration	[#if registration.verified]\nPro tip, your registration has already been verified, but feel free to complete the verification process to verify your verification of your registration.\n[/#if]\n\n[#-- When a one-time code is provided, you will want the user to enter this value interactively using a form. In this workflow the verificationId\n     is not shown to the user and instead the one-time code must be paired with the verificationId which is usually in a hidden form field. When the two\n     values are presented together, the registration can be verified --]\n[#if verificationOneTimeCode??]\nTo complete your registration verification enter this code into the registration verification form.\n\n${verificationOneTimeCode}\n[#else]\nTo complete your registration verification click on the following link.\n\nhttp://localhost:9011/registration/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}\n[/#if]\n\n- FusionAuth Admin\n	\N	1760017304482	1760017304482	{}	{}	{}	{}	[FusionAuth Default] Registration Verification
dcc66541-f54c-4aec-9f9b-d7cad905467d	\N	Your account has been created and you must set up a password. Click on the following link to set up your password.\n<p>\n  <a href="http://localhost:9011/password/change/${changePasswordId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}">\n    http://localhost:9011/password/change/${changePasswordId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}\n  </a>\n</p>\n- FusionAuth Admin\n	Set up your password	Your account has been created and you must set up a password. Click on the following link to set up your password.\n\nhttp://localhost:9011/password/change/${changePasswordId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}\n\n- FusionAuth Admin\n	\N	1760017304482	1760017304482	{}	{}	{}	{}	[FusionAuth Default] Set up Password
bc6a1254-8779-4112-b3da-88c42a3abde9	\N	<p>\n  To complete your login request, enter this one-time code code on the login form when prompted.\n</p>\n<p>\n  <strong>${code}</strong>\n</p>\n\n- FusionAuth Admin	Your second factor code	To complete your login request, enter this one-time code code on the login form when prompted.\n\n${code}\n\n- FusionAuth Admin	\N	1760017304482	1760017304482	{}	{}	{}	{}	[FusionAuth Default] Two Factor Authentication
7a360fa1-521d-48cf-ab4e-c3648450319e	\N	[#-- @ftlvariable name="event" type="io.fusionauth.domain.event.UserLoginSuspiciousEvent" --]\n[#setting url_escaping_charset="UTF-8"]\n[#if event.type == "UserLoginSuspicious"]\n  <p>A suspicious login was made on your account. If this was you, you can safely ignore this email. If this wasn't you, we recommend that you change your password as soon as possible.</p>\n[#elseif event.type == "UserLoginNewDevice"]\n  <p>A login from a new device was detected on your account. If this was you, you can safely ignore this email. If this wasn't you, we recommend that you change your password as soon as possible.</p>\n[#else]\n  <p>Suspicious activity has been observed on your account. In order to secure your account, it is recommended to change your password at your earliest convenience.</p>\n[/#if]\n\n<p>Device details</p>\n<ul>\n  <li><strong>Device name:</strong> ${(event.info.deviceName)!'&mdash;'}</li>\n  <li><strong>Device description:</strong> ${(event.info.deviceDescription)!'&mdash;'}</li>\n  <li><strong>Device type:</strong> ${(event.info.deviceType)!'&mdash;'}</li>\n  <li><strong>User agent:</strong> ${(event.info.userAgent)!'&mdash;'}</li>\n</ul>\n\n<p>Event details</p>\n<ul>\n  <li><strong>IP address:</strong> ${(event.info.ipAddress)!'&mdash;'}</li>\n  <li><strong>City:</strong> ${(event.info.location.city)!'&mdash;'}</li>\n  <li><strong>Country:</strong> ${(event.info.location.country)!'&mdash;'}</li>\n  <li><strong>Zipcode:</strong> ${(event.info.location.zipcode)!'&mdash;'}</li>\n  <li><strong>Lat/long:</strong> ${(event.info.location.latitude)!'&mdash;'}/${(event.info.location.longitude)!'&mdash;'}</li>\n</ul>\n\n- FusionAuth Admin\n	Threat Detected	[#setting url_escaping_charset="UTF-8"]\n[#if event.type == "UserLoginSuspicious"]\nA suspicious login was made on your account. If this was you, you can safely ignore this email. If this wasn't you, we recommend that you change your password as soon as possible.\n[#elseif event.type == "UserLoginNewDevice"]\nA login from a new device was detected on your account. If this was you, you can safely ignore this email. If this wasn't you, we recommend that you change your password as soon as possible.\n[#else]\nSuspicious activity has been observed on your account. In order to secure your account, it is recommended to change your password at your earliest convenience.\n[/#if]\n\nDevice details\n\n* Device name: ${(event.info.deviceName)!'&mdash;'}\n* Device description: ${(event.info.deviceDescription)!'&mdash;'}\n* Device type: ${(event.info.deviceType)!'&mdash;'}\n* User agent: ${(event.info.userAgent)!'&mdash;'}\n\nEvent details\n\n* IP address: ${(event.info.ipAddress)!'-'}\n* City: ${(event.info.location.city)!'-'}\n* Country: ${(event.info.location.country)!'-'}\n* Zipcode: ${(event.info.location.zipcode)!'-'}\n* Lat/long: ${(event.info.location.latitude)!'-'}/${(event.info.location.longitude)!'-'}\n\n- FusionAuth Admin\n	\N	1760017304484	1760017304484	{}	{}	{}	{}	[FusionAuth Default] Threat Detected
1794a457-c223-4b21-9139-d9ce3e35bd5a	\N	<p>\n The following two factor method was added to ${user.email}:\n\n  <br>\n  <strong>Method: ${method.method}</strong>\n  <br>\n  <strong>Identifier: ${method.id}</strong>\n\n</p>\n\n- FusionAuth Admin	A second factor was added	The following two factor method was added to ${user.email}:\n\n- Method: ${method.method}\n- Identifier: ${method.id}\n\n- FusionAuth Admin	\N	1760017304496	1760017304496	{}	{}	{}	{}	[FusionAuth Default] Two Factor Authentication Method Added
b67783ea-f6b7-49c7-9b71-31de76a42480	\N	<p>\n The following two factor method was removed from ${user.email}:\n\n  <br>\n  <strong>Method: ${method.method}</strong>\n  <br>\n  <strong>Identifier: ${method.id}</strong>\n\n</p>\n\n- FusionAuth Admin	A second factor was removed	The following two factor method was removed from ${user.email}:\n\n- Method: ${method.method}\n- Identifier: ${method.id}\n\n- FusionAuth Admin	\N	1760017304497	1760017304497	{}	{}	{}	{}	[FusionAuth Default] Two Factor Authentication Method Removed
\.


--
-- Data for Name: entities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entities (id, client_id, client_secret, data, entity_types_id, insert_instant, last_update_instant, name, parent_id, tenants_id) FROM stdin;
\.


--
-- Data for Name: entity_entity_grant_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entity_entity_grant_permissions (entity_entity_grants_id, entity_type_permissions_id) FROM stdin;
\.


--
-- Data for Name: entity_entity_grants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entity_entity_grants (id, data, insert_instant, last_update_instant, recipient_id, target_id) FROM stdin;
\.


--
-- Data for Name: entity_type_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entity_type_permissions (id, data, description, entity_types_id, insert_instant, is_default, last_update_instant, name) FROM stdin;
b4e74b74-8f7d-4b57-baf6-df4828c928ea	{"data":{}}	Create SCIM User	0c3d2038-e255-4ebc-80d4-af126b45fb48	1760017304487	f	1760017304487	scim:user:create
63406d9e-3b9e-4693-9e72-dbd553b357a3	{"data":{}}	Read SCIM User	0c3d2038-e255-4ebc-80d4-af126b45fb48	1760017304489	f	1760017304489	scim:user:read
b75b1034-5af7-465c-ae86-897525bb09e7	{"data":{}}	Update SCIM User	0c3d2038-e255-4ebc-80d4-af126b45fb48	1760017304489	f	1760017304489	scim:user:update
c28c6e7c-7e86-4cb3-90ca-6e73969964db	{"data":{}}	Delete SCIM User	0c3d2038-e255-4ebc-80d4-af126b45fb48	1760017304490	f	1760017304490	scim:user:delete
5af7f24c-5d63-4233-8a5d-42f2ce299f2d	{"data":{}}	Create SCIM Enterprise User	0c3d2038-e255-4ebc-80d4-af126b45fb48	1760017304490	f	1760017304490	scim:enterprise:user:create
cd603bb0-fde4-44a0-94fd-cf6890a8e99f	{"data":{}}	Read SCIM Enterprise User	0c3d2038-e255-4ebc-80d4-af126b45fb48	1760017304491	f	1760017304491	scim:enterprise:user:read
459ca66f-9216-46a9-9e5c-1c690f107520	{"data":{}}	Update SCIM Enterprise User	0c3d2038-e255-4ebc-80d4-af126b45fb48	1760017304491	f	1760017304491	scim:enterprise:user:update
e432b4c0-f096-4fc3-9861-e65b07536d58	{"data":{}}	Delete SCIM Enterprise User	0c3d2038-e255-4ebc-80d4-af126b45fb48	1760017304491	f	1760017304491	scim:enterprise:user:delete
28bad10d-a04e-4854-9f43-98c588b25790	{"data":{}}	Create SCIM Group	0c3d2038-e255-4ebc-80d4-af126b45fb48	1760017304492	f	1760017304492	scim:group:create
3a32852e-1bed-4e36-9ccd-0db805d07e3d	{"data":{}}	Read SCIM Group	0c3d2038-e255-4ebc-80d4-af126b45fb48	1760017304492	f	1760017304492	scim:group:read
2071cc92-ade8-4f0e-8908-5c997fe30ca2	{"data":{}}	Update SCIM Group	0c3d2038-e255-4ebc-80d4-af126b45fb48	1760017304492	f	1760017304492	scim:group:update
09252050-6bbe-4cb9-82de-7648eb866566	{"data":{}}	Delete SCIM Group	0c3d2038-e255-4ebc-80d4-af126b45fb48	1760017304493	f	1760017304493	scim:group:delete
e857a9ac-d212-4220-a518-3efa9506a5e2	{"data":{}}	Read SCIM Resource Types	0c3d2038-e255-4ebc-80d4-af126b45fb48	1760017304493	f	1760017304493	scim:resource-types:read
bd65536b-3750-4889-82d0-8101a2e2035d	{"data":{}}	Read SCIM Schemas	0c3d2038-e255-4ebc-80d4-af126b45fb48	1760017304493	f	1760017304493	scim:schemas:read
7e165fdb-09d4-43dc-976c-8033e269311a	{"data":{}}	Read SCIM Service Provider Configuration	0c3d2038-e255-4ebc-80d4-af126b45fb48	1760017304494	f	1760017304494	scim:service-provider-config:read
\.


--
-- Data for Name: entity_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entity_types (id, access_token_signing_keys_id, data, insert_instant, last_update_instant, name) FROM stdin;
0c3d2038-e255-4ebc-80d4-af126b45fb48	\N	{"data":{},"jwtConfiguration":{"enabled":false,"timeToLiveInSeconds":0}}	1760017304485	1760017304485	[FusionAuth Default] SCIM Server
ee2878ee-9121-4650-ad00-bf1b886ff4e5	\N	{"data":{},"jwtConfiguration":{"enabled":false,"timeToLiveInSeconds":0}}	1760017304494	1760017304494	[FusionAuth Default] SCIM Client
\.


--
-- Data for Name: entity_user_grant_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entity_user_grant_permissions (entity_user_grants_id, entity_type_permissions_id) FROM stdin;
\.


--
-- Data for Name: entity_user_grants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entity_user_grants (id, data, entities_id, insert_instant, last_update_instant, users_id) FROM stdin;
\.


--
-- Data for Name: event_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_logs (id, insert_instant, message, type) FROM stdin;
1	1760034494749	Async Email Send exception occurred.\n\nTemplate Id: dcc66541-f54c-4aec-9f9b-d7cad905467d\nTemplate Name: [FusionAuth Default] Set up Password\nTenant Id: 4706a90d-b0c6-c6b8-e73a-b9e89d19875b\nAddressed to: teste@fabrica.com\n\nCause:\norg.eclipse.angus.mail.util.MailConnectException : Message: Couldn't connect to host, port: localhost, 25; timeout 2000	2
\.


--
-- Data for Name: external_identifiers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.external_identifiers (id, applications_id, data, expiration_instant, insert_instant, tenants_id, type, users_id) FROM stdin;
\.


--
-- Data for Name: families; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.families (data, family_id, insert_instant, last_update_instant, owner, role, users_id) FROM stdin;
\.


--
-- Data for Name: federated_domains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_domains (identity_providers_id, domain) FROM stdin;
\.


--
-- Data for Name: form_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_fields (id, consents_id, data, insert_instant, last_update_instant, name) FROM stdin;
d81c935d-dd7f-6fbf-72ca-1c14e3c56c37	\N	{"key": "user.email", "control": "text", "required": true, "type": "email", "data": {"leftAddon": "user"}}	1760016864741	1760016864741	Email
3a7f9314-3761-d38c-a552-fceaedd82505	\N	{"key": "user.password", "control": "password", "required": true, "type": "string", "data": {"leftAddon": "lock"}}	1760016864741	1760016864741	Password
a000a044-c78d-d564-7c6f-2f17dcf35640	\N	{"key": "user.firstName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1760016864741	1760016864741	First name
8fab600e-3cfb-c7ea-3d58-43b3c9fcc537	\N	{"key": "user.middleName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1760016864741	1760016864741	Middle name
2b63756e-c0ff-58ec-6671-7a76c43d2691	\N	{"key": "user.lastName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1760016864741	1760016864741	Last name
27ca6a20-3786-0be5-2b72-fcc167b408ba	\N	{"key": "user.fullName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1760016864741	1760016864741	Full name
11796ef0-e327-ce2e-c77f-78813ee02b25	\N	{"key": "user.birthDate", "control": "text", "required": false, "type": "date", "data": {"leftAddon": "calendar"}}	1760016864741	1760016864741	Birthdate
498bf220-4b31-5f11-6d4b-667be1ea41b3	\N	{"key": "user.mobilePhone", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "mobile"}}	1760016864741	1760016864741	Mobile phone
45bdb4e5-0693-5e72-3572-0b0ba570a2fb	\N	{"key": "user.username", "control": "text", "required": true, "type": "string", "data": {"leftAddon": "user"}}	1760016864741	1760016864741	Username
13047192-4f47-0261-0d19-5411456d8f13	\N	{"key": "user.parentEmail", "control": "text", "required": false, "type": "email", "data": {"leftAddon": "user"}}	1760016864741	1760016864741	[Registration] parent email
2f09d796-c96e-58e5-78fa-468ac3cfff9c	\N	{"key": "registration.preferredLanguages", "control": "select", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1760016864741	1760016864741	[Admin Registration] preferred languages
cd32988b-0b7e-02b9-64dd-dffe0b1f63c9	\N	{"key": "registration.roles", "control": "checkbox", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1760016864741	1760016864741	[Admin Registration] roles
b90514be-a8d0-a4ff-4d77-edb2f54d6574	\N	{"key": "registration.timezone", "control": "select", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1760016864741	1760016864741	[Admin Registration] timezone
1bf42882-0784-3b4b-d40c-30fe4c90218e	\N	{"key": "registration.username", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "user"}}	1760016864741	1760016864741	[Admin Registration] username
47522e22-85ba-c058-7ba0-50230c42ccba	\N	{"key": "user.birthDate", "control": "text", "required": false, "type": "date", "data": {"leftAddon": "calendar"}}	1760016864741	1760016864741	[Admin User] birthdate
8f26c5a2-b768-8d89-a672-a7f98a9eb4f0	\N	{"key": "user.email", "control": "text", "required": false, "type": "email", "data": {"leftAddon": "user"}}	1760016864741	1760016864741	[Admin User] email
f4db6b5e-56a5-4084-fff7-afcd7157a599	\N	{"key": "user.firstName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1760016864741	1760016864741	[Admin User] first name
bb78026f-0e9e-88ac-fb8d-c287b61c6b70	\N	{"key": "user.fullName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1760016864741	1760016864741	[Admin User] full name
c7c5aaa9-4aed-3985-6d37-1c1bd2d7dde5	\N	{"key": "user.imageUrl", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1760016864741	1760016864741	[Admin User] image URL
2902cb06-166c-0f2f-a564-968a32f1b1b1	\N	{"key": "user.lastName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1760016864741	1760016864741	[Admin User] last name
4e6bebc7-d31c-853f-ded4-8606161bf650	\N	{"key": "user.middleName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1760016864741	1760016864741	[Admin User] middle name
fcd7d13c-6b05-caea-b1f7-486c2a57a2bb	\N	{"key": "user.mobilePhone", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "mobile"}}	1760016864741	1760016864741	[Admin User] mobile phone
148e35a1-386f-8b4d-6557-1c9bf3d2e654	\N	{"key": "user.password", "control": "password", "required": true, "confirm": true, "type": "string", "data": {"leftAddon": "lock"}}	1760016864741	1760016864741	[Admin User] password
b886f658-82fd-3d66-adf2-08fae9414666	\N	{"key": "user.preferredLanguages", "control": "select", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1760016864741	1760016864741	[Admin User] preferred languages
6e3c57ad-19ee-9a3b-1aa6-2666efafcda3	\N	{"key": "user.timezone", "control": "select", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1760016864741	1760016864741	[Admin User] timezone
d1d8af4c-11c6-52ae-c662-5a09fad42256	\N	{"key": "user.username", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "user"}}	1760016864741	1760016864741	[Admin User] username
2a27cca1-11e7-00cf-0ffe-7782149f7baf	\N	{"key": "user.phoneNumber", "control": "text", "required": false, "type": "phoneNumber", "data": {"leftAddon": "mobile"}}	1760016864741	1760016864741	[Admin User] phone number
e4210745-3291-d699-07b0-08b7002bd3ad	\N	{"key": "user.email", "control": "text", "required": false, "type": "email", "data": {"leftAddon": "user"}}	1760016864741	1760016864741	[Self Service User] email
94e962b4-b617-dcc8-2a4b-b0244a644257	\N	{"key": "user.phoneNumber", "control": "text", "required": false, "type": "phoneNumber", "data": {"leftAddon": "mobile"}}	1760016864741	1760016864741	[Self Service User] phone number
fbe09665-1a67-3b71-ecea-e1b4055d125c	\N	{"key": "user.firstName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1760016864741	1760016864741	[Self Service User] first name
59247423-29da-84b7-7ed1-7305b858872e	\N	{"key": "user.lastName", "control": "text", "required": false, "type": "string", "data": {"leftAddon": "info"}}	1760016864741	1760016864741	[Self Service User] last name
4bf275d4-ac9d-b6b4-266e-12020366416c	\N	{"key": "user.password", "control": "password", "required": true, "confirm": true, "type": "string", "data": {"leftAddon": "lock"}}	1760016864741	1760016864741	[Self Service User] password
\.


--
-- Data for Name: form_steps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_steps (form_fields_id, forms_id, sequence, step) FROM stdin;
1bf42882-0784-3b4b-d40c-30fe4c90218e	0c017da4-f7fd-3bbb-f80e-e23a1d902873	0	0
2f09d796-c96e-58e5-78fa-468ac3cfff9c	0c017da4-f7fd-3bbb-f80e-e23a1d902873	1	0
b90514be-a8d0-a4ff-4d77-edb2f54d6574	0c017da4-f7fd-3bbb-f80e-e23a1d902873	2	0
cd32988b-0b7e-02b9-64dd-dffe0b1f63c9	0c017da4-f7fd-3bbb-f80e-e23a1d902873	3	0
8f26c5a2-b768-8d89-a672-a7f98a9eb4f0	8df860fe-857d-847d-ada8-2e86bac1fb87	0	0
2a27cca1-11e7-00cf-0ffe-7782149f7baf	8df860fe-857d-847d-ada8-2e86bac1fb87	1	0
d1d8af4c-11c6-52ae-c662-5a09fad42256	8df860fe-857d-847d-ada8-2e86bac1fb87	2	0
148e35a1-386f-8b4d-6557-1c9bf3d2e654	8df860fe-857d-847d-ada8-2e86bac1fb87	3	0
47522e22-85ba-c058-7ba0-50230c42ccba	8df860fe-857d-847d-ada8-2e86bac1fb87	0	1
f4db6b5e-56a5-4084-fff7-afcd7157a599	8df860fe-857d-847d-ada8-2e86bac1fb87	1	1
4e6bebc7-d31c-853f-ded4-8606161bf650	8df860fe-857d-847d-ada8-2e86bac1fb87	2	1
2902cb06-166c-0f2f-a564-968a32f1b1b1	8df860fe-857d-847d-ada8-2e86bac1fb87	3	1
bb78026f-0e9e-88ac-fb8d-c287b61c6b70	8df860fe-857d-847d-ada8-2e86bac1fb87	4	1
b886f658-82fd-3d66-adf2-08fae9414666	8df860fe-857d-847d-ada8-2e86bac1fb87	5	1
6e3c57ad-19ee-9a3b-1aa6-2666efafcda3	8df860fe-857d-847d-ada8-2e86bac1fb87	6	1
c7c5aaa9-4aed-3985-6d37-1c1bd2d7dde5	8df860fe-857d-847d-ada8-2e86bac1fb87	7	1
e4210745-3291-d699-07b0-08b7002bd3ad	db093870-032e-e937-0f8e-8e01150bcd05	0	0
94e962b4-b617-dcc8-2a4b-b0244a644257	db093870-032e-e937-0f8e-8e01150bcd05	1	0
fbe09665-1a67-3b71-ecea-e1b4055d125c	db093870-032e-e937-0f8e-8e01150bcd05	2	0
59247423-29da-84b7-7ed1-7305b858872e	db093870-032e-e937-0f8e-8e01150bcd05	3	0
4bf275d4-ac9d-b6b4-266e-12020366416c	db093870-032e-e937-0f8e-8e01150bcd05	4	0
\.


--
-- Data for Name: forms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forms (id, data, insert_instant, last_update_instant, name, type) FROM stdin;
0c017da4-f7fd-3bbb-f80e-e23a1d902873	\N	1760016861741	1760016861741	Default Admin Registration provided by FusionAuth	1
8df860fe-857d-847d-ada8-2e86bac1fb87	\N	1760016862741	1760016862741	Default Admin User provided by FusionAuth	2
db093870-032e-e937-0f8e-8e01150bcd05	\N	1760016863741	1760016863741	Default User Self Service provided by FusionAuth	3
\.


--
-- Data for Name: global_daily_active_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.global_daily_active_users (count, day) FROM stdin;
3	20370
3	20374
6	20376
4	20377
\.


--
-- Data for Name: global_monthly_active_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.global_monthly_active_users (count, month) FROM stdin;
12	669
\.


--
-- Data for Name: global_registration_counts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.global_registration_counts (count, decremented_count, hour) FROM stdin;
1	0	488893
2	1	488898
1	0	488994
4	3	489037
1	1	489038
3	3	489060
\.


--
-- Data for Name: group_application_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_application_roles (application_roles_id, groups_id) FROM stdin;
631ecd9d-8d40-4c13-8277-80cedb823714	18a954cf-3a23-441c-9033-ccce5f2c0281
\.


--
-- Data for Name: group_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_members (id, groups_id, data, insert_instant, users_id) FROM stdin;
e29ccad0-5b0a-459a-8136-7148b9d796c1	18a954cf-3a23-441c-9033-ccce5f2c0281	{}	1760379603433	b8291ee3-dd34-46d8-80a9-1cd1b6d885d1
cde1e122-a810-4cd3-a8f5-4cc783304477	18a954cf-3a23-441c-9033-ccce5f2c0281	{}	1760617343753	07a72057-6ec7-456d-87ac-37ca77e4fe13
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, data, insert_instant, last_update_instant, name, tenants_id) FROM stdin;
18a954cf-3a23-441c-9033-ccce5f2c0281	{}	1760377887833	1760377887833	Greatek	3df9a1ee-a354-4f0b-b8dd-4b55565d2372
\.


--
-- Data for Name: hourly_logins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hourly_logins (applications_id, count, data, hour) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	\N	488896
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	\N	488897
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	2	\N	488898
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	2	\N	488993
3c219e58-ed0e-4b18-ad48-f4f92793ae32	2	\N	488993
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1	\N	489036
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	3	\N	489037
a290a97c-e315-4c11-9823-57496eed344c	1	\N	489037
a290a97c-e315-4c11-9823-57496eed344c	1	\N	489038
3c219e58-ed0e-4b18-ad48-f4f92793ae32	2	\N	489060
a290a97c-e315-4c11-9823-57496eed344c	3	\N	489060
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identities (id, breached_password_last_checked_instant, breached_password_status, connectors_id, email, encryption_scheme, factor, insert_instant, last_login_instant, last_update_instant, password, password_change_reason, password_change_required, password_last_update_instant, is_primary, salt, status, tenants_id, type, username, username_index, username_status, users_id, display_value, value, verified, verified_instant, verified_reason) FROM stdin;
4	\N	\N	\N	teste@fabrica.com	\N	\N	1760035070317	1760377738836	1760035070317	\N	\N	\N	\N	t	\N	0	4706a90d-b0c6-c6b8-e73a-b9e89d19875b	0	\N	\N	\N	5e05cf13-5601-4819-8cdb-3c2fa3bb4d48	\N	teste@fabrica.com	f	\N	6
5	\N	\N	\N	teste@web.com	\N	\N	1760379547455	1760379547455	1760379547455	\N	\N	\N	\N	t	\N	0	3df9a1ee-a354-4f0b-b8dd-4b55565d2372	0	\N	\N	\N	b8291ee3-dd34-46d8-80a9-1cd1b6d885d1	\N	teste@web.com	f	\N	6
1	\N	\N	\N	leonardo.granja@iez.com.br	\N	\N	1760017304426	1760617066343	1760017304426	\N	\N	\N	\N	t	\N	0	4706a90d-b0c6-c6b8-e73a-b9e89d19875b	0	\N	\N	\N	435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4	\N	leonardo.granja@iez.com.br	f	\N	0
13	\N	\N	\N	t@t.com	\N	\N	1760617343659	\N	1760617343659	\N	\N	\N	\N	t	\N	0	3df9a1ee-a354-4f0b-b8dd-4b55565d2372	0	\N	\N	\N	07a72057-6ec7-456d-87ac-37ca77e4fe13	\N	t@t.com	f	\N	6
\.


--
-- Data for Name: identity_provider_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider_links (data, identity_providers_id, identity_providers_user_id, insert_instant, last_login_instant, tenants_id, users_id) FROM stdin;
\.


--
-- Data for Name: identity_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_providers (id, data, enabled, insert_instant, last_update_instant, name, type, keys_id, request_signing_keys_id, reconcile_lambdas_id) FROM stdin;
\.


--
-- Data for Name: identity_providers_applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_providers_applications (applications_id, data, enabled, identity_providers_id, keys_id) FROM stdin;
\.


--
-- Data for Name: identity_providers_tenants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_providers_tenants (tenants_id, data, identity_providers_id) FROM stdin;
\.


--
-- Data for Name: instance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instance (id, activate_instant, data, license, license_id, setup_complete, tenant_manager_applications_id) FROM stdin;
9a632006-60f5-3254-ad99-859ab32b6330	\N	{"data":{},"firstTimeSetup":{"applicationId":"c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305","complete":true,"emailConfigured":false,"licenseActivated":false},"status":{"advancedIdentityProviders":"UNKNOWN","advancedLambdas":"UNKNOWN","advancedMultiFactorAuthentication":"UNKNOWN","advancedOAuthScopes":"UNKNOWN","advancedOAuthScopesCustomScopes":"UNKNOWN","advancedOAuthScopesThirdPartyApplications":"UNKNOWN","advancedRegistration":"UNKNOWN","applicationMultiFactorAuthentication":"UNKNOWN","applicationThemes":"UNKNOWN","breachedPasswordDetection":"UNKNOWN","connectors":"UNKNOWN","entityManagement":"UNKNOWN","licensed":false,"scimServer":"UNKNOWN","tenantManagerApplication":"UNKNOWN","threatDetection":"UNKNOWN","universalApplication":"UNKNOWN","webAuthn":"UNKNOWN","webAuthnPlatformAuthenticators":"UNKNOWN","webAuthnRoamingAuthenticators":"UNKNOWN"}}	\N	\N	t	c2a229f8-2dbc-1099-f0f1-db09f08fa0df
\.


--
-- Data for Name: integrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.integrations (data) FROM stdin;
{}
\.


--
-- Data for Name: ip_access_control_lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ip_access_control_lists (id, data, insert_instant, last_update_instant, name) FROM stdin;
\.


--
-- Data for Name: ip_location_database; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ip_location_database (data, last_modified, seq) FROM stdin;
\.


--
-- Data for Name: ip_location_meta_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ip_location_meta_data (digest, last_modified) FROM stdin;
\.


--
-- Data for Name: keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keys (id, algorithm, certificate, expiration_instant, insert_instant, issuer, kid, last_update_instant, name, private_key, public_key, secret, type) FROM stdin;
93762d6f-53be-ade7-12fe-c8087fda46a4	HS256	\N	\N	1760016858741	\N	3fad21a21	1760016858741	Default signing key	\N	\N	AUC6dnbKaKqcJ9u+nzUStroUUJ6oDMa5+Js9xodLsMI=	HMAC
092dbedc-30af-4149-9c61-b578f2c72f59	HS256	\N	\N	1760016859741	\N	36714773a	1760016859741	OpenID Connect compliant HMAC using SHA-256	\N	\N	\N	HMAC
4b8f1c06-518e-45bd-9ac5-d549686ae02a	HS384	\N	\N	1760016860741	\N	77b054a94	1760016860741	OpenID Connect compliant HMAC using SHA-384	\N	\N	\N	HMAC
c753a44d-7f2e-48d3-bc4e-c2c16488a23b	HS512	\N	\N	1760016861741	\N	d8c089bfb	1760016861741	OpenID Connect compliant HMAC using SHA-512	\N	\N	\N	HMAC
60dac87e-4a9e-39f0-a870-a89dd2772a1d	HS256	\N	\N	1760016862741	\N	a466cfcf7	1760016862741	Tenant manager signing key	\N	\N	alio5QOZ3ivOJOhhTpGWpJ0Zoq80alkusEm9zL7bheI=	HMAC
80ccfe1e-209e-1725-bb37-6c4214dea375	HS256	\N	\N	1760016863741	\N	b86fce96b	1760016863741	Tenant manager OpenID Connect compliant HMAC using SHA-256	\N	\N	\N	HMAC
d0b3f8a1-4885-43a1-9f04-668543613875	RS256	-----BEGIN CERTIFICATE-----\nMIICuzCCAaOgAwIBAQIRANCz+KFIhUOhnwRmhUNhOHUwDQYJKoZIhvcNAQELBQAw\nGTEXMBUGA1UEAxMObG9jYWxob3N0OjkwMTEwHhcNMjUxMDA5MTM0MTQ0WhcNMzUx\nMDA5MTM0MTQ0WjAZMRcwFQYDVQQDEw5sb2NhbGhvc3Q6OTAxMTCCASIwDQYJKoZI\nhvcNAQEBBQADggEPADCCAQoCggEBAL1h2eZJ467WczqtiwTMjhPGn6zYnRTR4T1F\n+pmJ24RAg1IWqyYJVAEhOKE43W4Ugs2SF+fFI1JnHh12VavjjMBP57QCP5uUI/1t\nmDHi4TJ3jNwGI1WC4JjOLjLUBCrkQJHaxqd+okdDaW5EKEP5x9Xl5LDaHrGqszL/\nsHCyT/MKwgz7ZiygXDtuAw/+K5cWgZjZzQrST/EjWG2Vca31Rnya57LxcAzWW3oH\nY8gQYboZ9UXjRxFU8zDwKfvHFjvcglgbDrBl0I1bJUmeqZ/MeK52ewbevdGTrE5P\nr/6huGf2JanAz/TFdS40F3uKwECQr4NkmKYxBdFe1ayNAzzTZdECAwEAATANBgkq\nhkiG9w0BAQsFAAOCAQEAk3S47npXumHWPMmjoCOlqvaCL5w+8ooob+IW6ebDMIuy\nwbngxx/Jk7STv/ELwwKinyJNwkOhtNAzjvNXy0zaWlaIuXMdfQeec8UrvOcSwNiq\n37xK84pQ3pMrprfa7jMnOuB1PbEDHzr9sKkoQockT0XTuO8F2CHJPylts9zo0d6B\nEbgUlQZuQ4pTB3wHF+yMjH5ixj1O3n07aV+fcqg8tmYEKOpD1dd+RCRnH2EKJE9F\nNKbADs94MD22AMH5xTb3E4sCdo+mPhAWbKVCYdy6nZo++qU90nS2mu3gzXxqCccT\n5VtUmvxU8yVwfnR0Qmgf+Bo9nA3HTGAErF4X5sLweA==\n-----END CERTIFICATE-----	2075550104526	1760017304526	localhost:9011	Ec19Q7YnqHs3v4gylesvVxvNmL4	1760017304526	Default RSA signing key	-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC9YdnmSeOu1nM6\nrYsEzI4Txp+s2J0U0eE9RfqZiduEQINSFqsmCVQBITihON1uFILNkhfnxSNSZx4d\ndlWr44zAT+e0Aj+blCP9bZgx4uEyd4zcBiNVguCYzi4y1AQq5ECR2sanfqJHQ2lu\nRChD+cfV5eSw2h6xqrMy/7Bwsk/zCsIM+2YsoFw7bgMP/iuXFoGY2c0K0k/xI1ht\nlXGt9UZ8muey8XAM1lt6B2PIEGG6GfVF40cRVPMw8Cn7xxY73IJYGw6wZdCNWyVJ\nnqmfzHiudnsG3r3Rk6xOT6/+obhn9iWpwM/0xXUuNBd7isBAkK+DZJimMQXRXtWs\njQM802XRAgMBAAECggEAAQZeii3W2u4I1vB0KCUolQLQ1RFMXah6cj0cC2irlMj5\n7PUicqTqR3dJOdYiR046caewvsMFBep48eqKBtFxxDiqewGSxozEBRhqvRpf4vNd\nV8jQuCMVLr6EPCeEPkHYokbE0ciQUu0Sd6j2xCdokB0bt7lLy+UDQ0C5pmJ7UZ1i\n5M6AiOR0x+XVMUmrfvqUmh7SrOE5Tq8OLX0yxCKeeTqbZ8RDkd6y8GzarwkRhI1O\npnsaIWkvO5ogESsiFH/9KCYJy6H9tRfZkB49hDuObQCK/l6ir1M8N2Igmo1Y+nCh\nunejDcM7Y4tgkxOboxuFsXJ7/9U1IEG8XsqAXRvV4QKBgQDGtUJEqVVizuYiYq5D\nXF1+o1aXU1a2KF1jXq/t1hKacn93uz45gkj1yqrWrSyJ10R2tGX8YBhdQtjdSedo\nMYwGPgPF/ROL4tkF+zwv0i9npD0Jdf72cz/fdbzQautSkpB70aayrhW25CWI56G3\nNrR6bpVbstjzTlzRQwCCkmkvPwKBgQDz/D/cqByIkSP2fBaPOELwKtwjpUUW9rT5\neiyMgTtBUnhVO06jrXxzynVBJ5SG1jVZL/vjWDoyPActcfhISkO9ckA6BUetRFTl\nlb6mNrQrlY4jbvn3CTZL6xex2nwHq9BeduA8BnrxN7MK4bvErCaydOwHTt0nlxPZ\nr6gPYhc27wKBgHICWc1PYuBYWY5tFBMuEa6xRON6O4w0SLDVCRfq9a2L+DrYQfF5\nISd1auPVZHKKAowhIUrWT+RikE8XMiCEHRUPy9ZzSB3AwEhAR94gOHa8sxCUlP8O\nTR2HThg+4Fn2IdQJDB4E6AyRhj+wtwaJ6q88d5GvYe7njTW7vbUtEBC9AoGBAK3J\nek+Y6yIXh+80+fiv0XYygTVerjSqK8Qb0wmNr4Ba1t2W7e/GTgRILHbpU3EruTo6\n5IdOO722ZkJnkLslMtUJQVhSlHiFWJdjrzXDd1goIeN5U9EznZo77VfA0WHBbx0q\nPZRj5URWMVDJ8y4mlTW99LVL5lkh0oDXDrVOYEy/AoGAG1dWW8lfwsVPn4oPOX3S\nSKEXKSpEq2UaXOPWuSamV/KlUcfu3ohUqgryKkC3VNFT5IrSe0kCNmKfVah0HKjA\n7nBA13nY13WL5MH538dFS09BaihgyD3XwJuXB7bZ0onawjsDsQmfeq9eFjwJm/6r\nzeKTx3M6EBC3rogmxuFFkXo=\n-----END PRIVATE KEY-----	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvWHZ5knjrtZzOq2LBMyO\nE8afrNidFNHhPUX6mYnbhECDUharJglUASE4oTjdbhSCzZIX58UjUmceHXZVq+OM\nwE/ntAI/m5Qj/W2YMeLhMneM3AYjVYLgmM4uMtQEKuRAkdrGp36iR0NpbkQoQ/nH\n1eXksNoesaqzMv+wcLJP8wrCDPtmLKBcO24DD/4rlxaBmNnNCtJP8SNYbZVxrfVG\nfJrnsvFwDNZbegdjyBBhuhn1ReNHEVTzMPAp+8cWO9yCWBsOsGXQjVslSZ6pn8x4\nrnZ7Bt690ZOsTk+v/qG4Z/YlqcDP9MV1LjQXe4rAQJCvg2SYpjEF0V7VrI0DPNNl\n0QIDAQAB\n-----END PUBLIC KEY-----	\N	RSA
\.


--
-- Data for Name: kickstart_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kickstart_files (id, kickstart, name) FROM stdin;
\.


--
-- Data for Name: lambdas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lambdas (id, body, debug, engine_type, insert_instant, last_update_instant, name, type) FROM stdin;
7ff0fe51-fa21-4ad8-b955-b803aea135b2	/**\n* This is the default Apple reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} idToken - the decoded JSON payload of the id_token returned by Apple.\n*/\nfunction reconcile(user, registration, idToken) {\n  // Un-comment this line to see the idToken object printed to the event log\n  // console.info(JSON.stringify(idToken, null, 2));\n\n  // During the first login attempt, the user object will be available which may contain first and last name.\n  if (idToken.user && idToken.user.name) {\n    user.firstName = idToken.user.name.firstName || user.firstName;\n    user.lastName = idToken.user.name.lastName || user.lastName;\n  }\n}\n	f	GraalJS	1760017304483	1760017304483	[FusionAuth Default] Apple Reconcile	4
23f26f58-4253-4eb5-897c-0b0d07007650	/**\n* This is the default Facebook reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} facebookUser - the decoded JSON payload returned by the Facebook Me API.\n*/\nfunction reconcile(user, registration, facebookUser) {\n  // Un-comment this line to see the facebookUser object printed to the event log\n  // console.info(JSON.stringify(facebookUser, null, 2));\n\n  user.firstName = facebookUser.first_name;\n  user.middleName = facebookUser.middle_name;\n  user.lastName = facebookUser.last_name;\n  user.fullName = facebookUser.name;\n\n  if (facebookUser.picture && !facebookUser.picture.data.is_silhouette) {\n    user.imageUrl = facebookUser.picture.data.url;\n  }\n\n  if (facebookUser.birthday) {\n    // Convert MM/dd/yyyy -> YYYY-MM-DD\n    var parts = facebookUser.birthday.split('/');\n    user.birthDate = parts[2] + '-' + parts[0] + '-' + parts[1];\n  }\n}\n	f	GraalJS	1760017304483	1760017304483	[FusionAuth Default] Facebook Reconcile	6
c1ec1f46-c72d-4462-9895-1166bbe755a6	/**\n* This is the default Google reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} idToken - the decoded JSON payload returned by the Google Token Info API.\n*/\nfunction reconcile(user, registration, idToken) {\n  // Un-comment this line to see the idToken object printed to the event log\n  // console.info(JSON.stringify(idToken, null, 2));\n\n  // The idToken is the response from the tokeninfo endpoint\n  // https://developers.google.com/identity/sign-in/web/backend-auth#calling-the-tokeninfo-endpoint\n  user.firstName = idToken.given_name;\n  user.lastName = idToken.family_name;\n  user.fullName = idToken.name;\n  user.imageUrl = idToken.picture;\n}\n	f	GraalJS	1760017304483	1760017304483	[FusionAuth Default] Google Reconcile	7
f264d0d6-ae8f-489c-8924-69b12f3016cd	/**\n* This is the default LinkedIn reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} linkedInUser - the decoded JSON payload returned by the LinkedIn Me API or the LinkedIn UserInfo API\n*/\nfunction reconcile(user, registration, linkedInUser) {\n  // Un-comment this line to see the linkedInUser object printed to the event log\n  // console.info(JSON.stringify(linkedInUser, null, ' '));\n\n  // Depending on how and when you have set up your LinkedIn application you may get a different response back in the linkedInUser.\n  //\n  // The first checks apply if you are using the "openid", "email", and "profile" scopes.\n  // If so FusionAuth will call the LinkedIn UserInfo API.\n  // See https://learn.microsoft.com/en-us/linkedin/consumer/integrations/self-serve/sign-in-with-linkedin-v2#api-request-to-retreive-member-details\n  //\n  // The second checks apply if you are using the legacy program and Profile API with the "r_liteprofile" or "r_basicprofile" scopes.\n  // See https://learn.microsoft.com/en-us/linkedin/shared/integrations/people/profile-api\n\n  if (linkedInUser.given_name) {\n    user.firstName = linkedInUser.given_name;\n  } else if (linkedInUser.localizedFirstName) {\n    user.firstName = linkedInUser.localizedFirstName;\n  }\n\n  if (linkedInUser.family_name) {\n    user.lastName = linkedInUser.family_name;\n  } else if (linkedInUser.localizedLastName) {\n    user.lastName = linkedInUser.localizedLastName;\n  }\n\n  if (linkedInUser.picture) {\n    // UserInfo will only supply one image size\n    user.imageUrl = linkedInUser.picture;\n  } else if (linkedInUser.profilePicture){\n    // LinkedIn may return several images sizes.\n    // See https://docs.microsoft.com/en-us/linkedin/shared/references/v2/profile/profile-picture\n    // We'll sort the array by descending size and then grab the largest one.\n    var images = linkedInUser.profilePicture['displayImage~'].elements || [];\n    images.sort(function(a, b) {\n      return b.data["com.linkedin.digitalmedia.mediaartifact.StillImage"].displaySize.width - a.data["com.linkedin.digitalmedia.mediaartifact.StillImage"].displaySize.width;\n    });\n    if (images.length > 0) {\n      user.imageUrl = images[0].identifiers[0].identifier;\n    }\n  }\n}\n	f	GraalJS	1760017304483	1760017304483	[FusionAuth Default] LinkedIn Reconcile	11
eaf2aca0-281b-443f-b497-c834f2358d58	/**\n* This is the default OpenID Connect reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} jwt - the JSON response from the UserInfo endpoint\n* @param {Object} [idToken] - the decoded JSON payload of the id_token. The id_token is available when the\n*                             'openid' scope was requested, and the signature can be successfully verified.\n* @param {Object} tokens an object containing the encoded access_token and when available the id_token. The\n*                        id_token is only available when returned by the IdP and the signature has been verified.\n*/\nfunction reconcile(user, registration, jwt, idToken, tokens) {\n  // Un-comment this line to see the jwt object printed to the event log\n  // console.info(JSON.stringify(jwt, null, 2));\n\n  user.firstName = jwt.given_name;\n  user.middleName = jwt.middle_name;\n  user.lastName = jwt.family_name;\n  user.fullName = jwt.name;\n  user.imageUrl = jwt.picture;\n  user.mobilePhone = jwt.phone_number;\n\n  // https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims\n  if (jwt.birthdate && jwt.birthdate !== '0000') {\n    if (jwt.birthdate.length === 4) {\n      // Only a year was provided, set to January 1.\n      user.birthDate = jwt.birthdate + '-01-01';\n    } else {\n      user.birthDate = jwt.birthdate;\n    }\n  }\n\n  // https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims\n  if (jwt.locale) {\n    user.preferredLanguages = user.preferredLanguages || [];\n    // Replace the dash with an under_score.\n    user.preferredLanguages.push(jwt.locale.replace('-', '_'));\n  }\n\n  // Set preferred_username in registration.\n  // - This is just for display purposes, this value cannot be used to uniquely identify\n  //   the user in FusionAuth.\n  registration.username = jwt.preferred_username;\n}\n	f	GraalJS	1760017304484	1760017304484	[FusionAuth Default] OpenID Connect Reconcile	1
3f123135-7e1b-44cc-a4ea-cd36da127e61	/**\n* This is the default SAML v2 reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} samlResponse - the SAML AuthN response returned by the SAML v2 Identity Provider. This\n*                                object is a parsed version of the actual XML document returned. See\n*                                the FusionAuth documentation for more details, or print the contents of this\n*                                object to the event log to assist in debugging.\n*/\nfunction reconcile(user, registration, samlResponse) {\n  // Un-comment this line to see the samlResponse object printed to the event log\n  // console.info(JSON.stringify(samlResponse, null, 2));\n\n  var getAttribute = function(samlResponse, attribute) {\n    var values = samlResponse.assertion.attributes[attribute];\n    if (values && values.length > 0) {\n      return values[0];\n    }\n\n    return null;\n  };\n\n  // Retrieve an attribute from the samlResponse\n  // - Arguments [2 .. ] provide a preferred order of attribute names to lookup the value in the response.\n  var defaultIfNull = function(samlResponse) {\n    for (var i = 1; i < arguments.length; i++) {\n      var value = getAttribute(samlResponse, arguments[i]);\n      if (value !== null) {\n        return value;\n      }\n    }\n  };\n\n  user.birthDate = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/dateofbirth', 'birthdate', 'date_of_birth');\n  user.firstName = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname', 'first_name');\n  user.lastName = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname', 'last_name');\n  user.fullName = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name', 'name', 'full_name');\n  user.mobilePhone = defaultIfNull(samlResponse, 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/mobilephone', 'mobile_phone');\n}\n	f	GraalJS	1760017304484	1760017304484	[FusionAuth Default] SAML v2 Reconcile	2
4848fad8-cbf9-4808-998c-cb15ab1d8164	/**\n* This is the default Twitter reconcile, modify this to your liking. Modify the user\n* and registration objects using the incoming values from the identity provider.\n*\n* @param {Object} user - the FusionAuth user\n* @param {Object} registration - the FusionAuth user registration\n* @param {Object} twitterUser - the decoded JSON payload returned by the Twitter Verify Credentials API.\n*/\nfunction reconcile(user, registration, twitterUser) {\n  // Un-comment this line to see the twitterUser object printed to the event log\n  // console.info(JSON.stringify(twitterUser, null, 2));\n\n  // Set name if available in the response\n  if (twitterUser.name) {\n    user.fullName = twitterUser.name;\n  }\n\n  // https://developer.twitter.com/en/docs/accounts-and-users/user-profile-images-and-banners.html\n  if (twitterUser.profile_image_url_https) {\n    // Remove the _normal suffix to get the original size.\n    user.imageUrl = twitterUser.profile_image_url_https.replace('_normal.png', '.png');\n  }\n\n  // Set twitter screen_name in registration.\n  // - This is just for display purposes, this value cannot be used to uniquely identify\n  //   the user in FusionAuth.\n  registration.username = twitterUser.screen_name;\n}\n	f	GraalJS	1760017304484	1760017304484	[FusionAuth Default] Twitter Reconcile	9
f09096ff-b010-497c-ac84-1dc746c1e449	// This is the default SCIM Group request converter, modify this to your liking.\nfunction convert(group, members, options, scimGroup) {\n\n  // Un-comment this line to see the scimGroup object printed to the event log\n  // console.info(JSON.stringify(scimGroup, null, 2));\n\n  // Request options\n  // FusionAuth allows you to assign one or more application roles to a group.\n  // To use this feature, assign one or more application Ids here.\n  // options.roleIds = [];\n\n  // Set the name of the group using the SCIM Group displayName\n  // Note, the group.name field is required.\n  group.name = scimGroup.displayName;\n\n  // Build a members array with a userId and a $ref in custom data\n  if (scimGroup.members) {\n    for (var i = 0; i < scimGroup.members.length; i++) {\n      members.push({\n        userId: scimGroup.members[i].value,\n        data: {\n          $ref: scimGroup.members[i]['$ref']\n        }\n      });\n    }\n  }\n}\n	f	GraalJS	1760017304485	1760017304485	[FusionAuth Default] SCIM Group Request Converter	19
43a3bcf7-160e-4286-acdb-f32c7d011922	// This is the default SCIM Group response converter, modify this to your liking.\nfunction convert(scimGroup, group, members) {\n  // Un-comment this line to see the group object printed to the event log\n  // console.info(JSON.stringify(group, null, 2));\n\n  // Set the outgoing displayName on the SCIM group using the FusionAuth group name.\n  scimGroup.displayName = group.name;\n}\n	f	GraalJS	1760017304485	1760017304485	[FusionAuth Default] SCIM Group Response Converter	20
0090e899-16c1-4f88-bc0b-df6582f0ee05	// This is the default SCIM User request converter, modify this to your liking.\nfunction convert(user, options, scimUser) {\n  // Un-comment this line to see the scimUser object printed to the event log\n  // console.info(JSON.stringify(scimUser, null, 2));\n\n  // Request options\n  // Note, sendSetPasswordEmail is only utilized during a user create request.\n  // options.applicationId = null;\n  // options.disableDomainBlock = false;\n  // options.sendSetPasswordEmail = false;\n  // options.skipVerification = false;\n\n  user.active = scimUser.active;\n  user.data.honorificPrefix = scimUser.name && scimUser.name.honorificPrefix;\n  user.data.honorificSuffix = scimUser.name && scimUser.name.honorificSuffix;\n  user.firstName = scimUser.name && scimUser.name.givenName;\n  user.fullName = scimUser.name && scimUser.name.formatted;\n  user.lastName = scimUser.name && scimUser.name.familyName;\n  user.middleName = scimUser.name && scimUser.name.middleName;\n  user.password = scimUser.password;\n  user.username = scimUser.userName;\n\n  // user.email\n  if (scimUser.emails) {\n    for (var i = 0; i < scimUser.emails.length; i++) {\n      if (scimUser.emails[i].primary) {\n        user.email = scimUser.emails[i].value;\n      }\n    }\n  }\n\n  // user.mobilePhone\n  if (scimUser.phoneNumbers) {\n    for (var j = 0; j < scimUser.phoneNumbers.length; j++) {\n      if (scimUser.phoneNumbers[j].primary) {\n        user.mobilePhone = scimUser.phoneNumbers[j].value;\n      }\n    }\n  }\n\n  // Handle the Enterprise User extension and other custom extensions\n  if (scimUser.schemas) {\n    for (var k = 0; k < scimUser.schemas.length; k++) {\n      var schema = scimUser.schemas[k];\n      if (schema !== 'urn:ietf:params:scim:schemas:core:2.0:User') {\n        user.data = user.data || {};\n        user.data.extensions = user.data.extensions || {};\n        user.data.extensions[schema] = scimUser[schema] || {};\n      }\n    }\n  }\n}\n	f	GraalJS	1760017304485	1760017304485	[FusionAuth Default] SCIM User Request Converter	21
1c8b1ee8-44c4-4236-8ab9-fc515be32032	// This is the default SCIM User response converter, modify this to your liking.\nfunction convert(scimUser, user) {\n  // Un-comment this line to see the user object printed to the event log\n  // console.info(JSON.stringify(user, null, 2));\n\n  scimUser.active = user.active;\n  scimUser.userName = user.username;\n  scimUser.name = {\n    formatted: user.fullName,\n    familyName: user.lastName,\n    givenName: user.firstName,\n    middleName: user.middleName,\n    honorificPrefix: user.data.honorificPrefix,\n    honorificSuffix: user.data.honorificSuffix\n  };\n\n  scimUser.phoneNumbers = [{\n    primary: true,\n    value: user.mobilePhone,\n    type: "mobile"\n  }];\n\n  scimUser.emails = [{\n    primary: true,\n    value: user.email,\n    type: "work"\n  }];\n\n  // Optionally return any custom extensions stored in user.data\n  if (user.data && user.data.extensions) {\n    for (var extension in user.data.extensions) {\n      if (scimUser.schemas.indexOf(extension) === -1) {\n        scimUser.schemas.push(extension);\n      }\n      scimUser[extension] = user.data.extensions[extension];\n    }\n  }\n}\n	f	GraalJS	1760017304485	1760017304485	[FusionAuth Default] SCIM User Response Converter	22
\.


--
-- Data for Name: last_login_instants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.last_login_instants (applications_id, registration_last_login_instant, users_id, user_last_login_instant, identities_value, identities_type) FROM stdin;
\.


--
-- Data for Name: locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locks (type, update_instant) FROM stdin;
UserActionEndEvent	\N
EmailPlus	\N
Family	\N
com.inversoft.migration.Migrator	\N
Reindex	\N
Reset	\N
AsyncTaskManager	\N
ProcessLastLoginInstants	\N
SCIMGroups	\N
DatabaseMigration	\N
\.


--
-- Data for Name: master_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.master_record (id, instant) FROM stdin;
3be3899b-9960-4416-8d0e-af8ae496087e	1760619756061
\.


--
-- Data for Name: message_templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.message_templates (id, data, insert_instant, last_update_instant, name, type) FROM stdin;
52bb481e-a809-ef3b-c3a3-3b61bf8ee275	{ "defaultTemplate": "Two Factor Code: ${code}" }	1760016864741	1760016864741	Default Two Factor Request	0
1198aca1-2fef-4df1-980f-8a32c5152c7f	{"data":{},"defaultTemplate":"[#setting url_escaping_charset=\\"UTF-8\\"]\\nTo change your password click on the following link.\\n\\n  [#-- The optional 'state' map provided on the Forgot Password API call is exposed in the template as 'state'.\\n       If we have an application context, append the client_id to ensure the correct application theme when applicable.\\n  --]\\n[#assign url = \\"http://localhost:9011/password/change/${changePasswordId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}\\" /]\\n[#list state!{} as key, value][#if key != \\"tenantId\\" && key != \\"client_id\\" && value??][#assign url = url + \\"&\\" + key?url + \\"=\\" + value?url/][/#if][/#list]\\n\\n${url}\\n\\n- FusionAuth Admin\\n","localizedTemplates":{}}	1760017304500	1760017304500	[FusionAuth Default] Phone Forgot Password	0
aa6bc470-f25f-47a2-b042-68f15f0c73ac	{"data":{},"defaultTemplate":"[#setting url_escaping_charset=\\"UTF-8\\"]\\nYou have requested to log into FusionAuth using this phone number. If you do not recognize this request please ignore this message.\\n\\n[#if oneTimeCode??]\\n  Login code: ${oneTimeCode}\\n[#else]\\n[#-- The optional 'state' map provided on the Start Passwordless API call is exposed in the template as 'state' --]\\n    [#assign url = \\"http://localhost:9011/oauth2/passwordless/${code}?tenantId=${user.tenantId}\\" /]\\n    [#list state!{} as key, value][#if key != \\"tenantId\\" && value??][#assign url = url + \\"&\\" + key?url + \\"=\\" + value?url/][/#if][/#list]\\n\\n    ${url}\\n[/#if]\\n\\n- FusionAuth Admin\\n","localizedTemplates":{}}	1760017304502	1760017304502	[FusionAuth Default] Phone Passwordless Login	0
573e1d1e-bff6-45ed-bcf8-4d576b7db6c5	{"data":{},"defaultTemplate":"Your account has been created and you must click the following link to set a password.\\n\\nhttp://localhost:9011/password/change/${changePasswordId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${user.tenantId}\\n","localizedTemplates":{}}	1760017304504	1760017304504	[FusionAuth Default] Phone Set up Password	0
3f7c7326-2f79-4041-9b7d-358679d1471e	{"data":{},"defaultTemplate":"[#-- When a one-time code is provided, you will want the user to enter this value interactively using a form. In this workflow the verificationId\\n     is not shown to the user and instead the one-time code must be paired with the verificationId which is usually in a hidden form field. When the two\\n     values are presented together, the phone number can be verified --]\\n[#if verificationOneTimeCode??]\\nVerification code: ${verificationOneTimeCode}\\n[#else]\\nTo complete your phone number verification click on the following link.\\n\\nhttp://localhost:9011/phone/verify/${verificationId}?client_id=${(application.oauthConfiguration.clientId)!''}&tenantId=${tenant.id}\\n[/#if]\\n\\n- FusionAuth Admin\\n","localizedTemplates":{}}	1760017304505	1760017304505	[FusionAuth Default] Phone Verification	0
6a4a6370-7987-4dfe-83c2-8ba1209920a3	{"data":{},"defaultTemplate":"[#setting url_escaping_charset=\\"UTF-8\\"]\\n[#if event.type == \\"UserLoginSuspicious\\"]\\nA suspicious login was made on your account. If this was you, you can safely ignore this message. If this wasn't you, we recommend that you change your password as soon as possible.\\n[#elseif event.type == \\"UserLoginNewDevice\\"]\\nA login from a new device was detected on your account. If this was you, you can safely ignore this message. If this wasn't you, we recommend that you change your password as soon as possible.\\n[#else]\\nSuspicious activity has been observed on your account. In order to secure your account, it is recommended to change your password at your earliest convenience.\\n[/#if]\\n\\nDevice details\\n\\n* Device name: ${(event.info.deviceName)!'-'}\\n* Device description: ${(event.info.deviceDescription)!'-'}\\n* Device type: ${(event.info.deviceType)!'-'}\\n* User agent: ${(event.info.userAgent)!'-'}\\n\\nEvent details\\n\\n* IP address: ${(event.info.ipAddress)!'-'}\\n* City: ${(event.info.location.city)!'-'}\\n* Country: ${(event.info.location.country)!'-'}\\n* Zipcode: ${(event.info.location.zipcode)!'-'}\\n* Lat/long: ${(event.info.location.latitude)!'-'}/${(event.info.location.longitude)!'-'}\\n\\n- FusionAuth Admin\\n","localizedTemplates":{}}	1760017304506	1760017304506	[FusionAuth Default] Phone Threat Detected	0
0308e08d-964e-415e-bb9b-7c02638f087a	{"data":{},"defaultTemplate":"The following two factor method was added to ${user.phoneNumber}:\\n\\n- Method: ${method.method}\\n- Identifier: ${method.id}\\n\\n- FusionAuth Admin\\n","localizedTemplates":{}}	1760017304508	1760017304508	[FusionAuth Default] Phone Two Factor Add	0
3dbc1ca0-3081-45ae-af27-520f45c082b7	{"data":{},"defaultTemplate":"The following two factor method was removed from ${user.phoneNumber}:\\n\\n- Method: ${method.method}\\n- Identifier: ${method.id}\\n\\n- FusionAuth Admin\\n","localizedTemplates":{}}	1760017304509	1760017304509	[FusionAuth Default] Phone Two Factor Remove	0
\.


--
-- Data for Name: messengers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messengers (id, data, insert_instant, last_update_instant, name, type) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (name, run_instant) FROM stdin;
io.fusionauth.api.migration.guice.Migration_1_8_0	0
io.fusionauth.api.migration.guice.Migration_1_9_2	0
io.fusionauth.api.migration.guice.Migration_1_10_0	0
io.fusionauth.api.migration.guice.Migration_1_13_0	0
io.fusionauth.api.migration.guice.Migration_1_15_3	0
io.fusionauth.api.migration.guice.Migration_1_30_0	0
io.fusionauth.api.migration.guice.Migration_1_42_0	0
io.fusionauth.api.migration.guice.Migration_1_59_0	0
\.


--
-- Data for Name: nodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nodes (id, data, insert_instant, last_checkin_instant, runtime_mode, url) FROM stdin;
3be3899b-9960-4416-8d0e-af8ae496087e	{"data":{},"ipAddresses":{"eth0":["172.20.0.3"]},"platform":{"arch":"amd64","name":"Linux","version":"5.14.0-570.49.1.el9_6.x86_64"}}	1760613003759	1760619743061	development	http://localhost:9011
\.


--
-- Data for Name: previous_passwords; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.previous_passwords (insert_instant, encryption_scheme, factor, password, salt, users_id) FROM stdin;
\.


--
-- Data for Name: raw_application_daily_active_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raw_application_daily_active_users (applications_id, day, users_id) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	20376	435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	20376	99f25af8-8ea5-4cee-9adb-825d761d145e
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	20376	3ea72eea-fc4e-481d-b5b0-74034aedcfe9
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	20376	840dc3b2-46d9-410c-99e6-eeda141e71a4
a290a97c-e315-4c11-9823-57496eed344c	20376	a446b8b7-d8f5-4a61-9790-c4e46e07e8d6
a290a97c-e315-4c11-9823-57496eed344c	20376	b8d74322-c167-435a-bb45-d2cb143f381c
3c219e58-ed0e-4b18-ad48-f4f92793ae32	20377	435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4
a290a97c-e315-4c11-9823-57496eed344c	20377	84235969-dcd3-4cab-86a3-c2a064a14b35
a290a97c-e315-4c11-9823-57496eed344c	20377	834dc1e7-7a02-4214-b5c0-437f592a08f5
a290a97c-e315-4c11-9823-57496eed344c	20377	07a72057-6ec7-456d-87ac-37ca77e4fe13
\.


--
-- Data for Name: raw_application_monthly_active_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raw_application_monthly_active_users (applications_id, month, users_id) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	669	435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	669	5e05cf13-5601-4819-8cdb-3c2fa3bb4d48
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	669	99f25af8-8ea5-4cee-9adb-825d761d145e
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	669	3ea72eea-fc4e-481d-b5b0-74034aedcfe9
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	669	840dc3b2-46d9-410c-99e6-eeda141e71a4
a290a97c-e315-4c11-9823-57496eed344c	669	a446b8b7-d8f5-4a61-9790-c4e46e07e8d6
a290a97c-e315-4c11-9823-57496eed344c	669	b8d74322-c167-435a-bb45-d2cb143f381c
a290a97c-e315-4c11-9823-57496eed344c	669	84235969-dcd3-4cab-86a3-c2a064a14b35
a290a97c-e315-4c11-9823-57496eed344c	669	834dc1e7-7a02-4214-b5c0-437f592a08f5
a290a97c-e315-4c11-9823-57496eed344c	669	07a72057-6ec7-456d-87ac-37ca77e4fe13
\.


--
-- Data for Name: raw_application_registration_counts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raw_application_registration_counts (id, applications_id, count, decremented_count, hour) FROM stdin;
\.


--
-- Data for Name: raw_global_daily_active_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raw_global_daily_active_users (day, users_id) FROM stdin;
20376	435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4
20376	99f25af8-8ea5-4cee-9adb-825d761d145e
20376	3ea72eea-fc4e-481d-b5b0-74034aedcfe9
20376	840dc3b2-46d9-410c-99e6-eeda141e71a4
20376	a446b8b7-d8f5-4a61-9790-c4e46e07e8d6
20376	b8d74322-c167-435a-bb45-d2cb143f381c
20377	435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4
20377	84235969-dcd3-4cab-86a3-c2a064a14b35
20377	834dc1e7-7a02-4214-b5c0-437f592a08f5
20377	07a72057-6ec7-456d-87ac-37ca77e4fe13
\.


--
-- Data for Name: raw_global_monthly_active_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raw_global_monthly_active_users (month, users_id) FROM stdin;
669	435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4
669	5000f553-be8f-44ed-9dc6-bdd10db1ac67
669	5e05cf13-5601-4819-8cdb-3c2fa3bb4d48
669	b8291ee3-dd34-46d8-80a9-1cd1b6d885d1
669	99f25af8-8ea5-4cee-9adb-825d761d145e
669	3ea72eea-fc4e-481d-b5b0-74034aedcfe9
669	840dc3b2-46d9-410c-99e6-eeda141e71a4
669	a446b8b7-d8f5-4a61-9790-c4e46e07e8d6
669	b8d74322-c167-435a-bb45-d2cb143f381c
669	84235969-dcd3-4cab-86a3-c2a064a14b35
669	834dc1e7-7a02-4214-b5c0-437f592a08f5
669	07a72057-6ec7-456d-87ac-37ca77e4fe13
\.


--
-- Data for Name: raw_global_registration_counts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raw_global_registration_counts (id, count, decremented_count, hour) FROM stdin;
\.


--
-- Data for Name: raw_logins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raw_logins (applications_id, instant, ip_address, identities_value, identities_type, users_id) FROM stdin;
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1760025689518	172.20.0.1	leonardo.granja@iez.com.br	0	435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1760030159416	172.20.0.1	leonardo.granja@iez.com.br	0	435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4
\N	1760035070317	172.20.0.1	\N	\N	5e05cf13-5601-4819-8cdb-3c2fa3bb4d48
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	1760035208010	172.20.0.1	\N	\N	5e05cf13-5601-4819-8cdb-3c2fa3bb4d48
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	1760035813186	172.20.0.1	teste@fabrica.com	0	5e05cf13-5601-4819-8cdb-3c2fa3bb4d48
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	1760375995095	172.20.0.1	teste@fabrica.com	0	5e05cf13-5601-4819-8cdb-3c2fa3bb4d48
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1760377632413	172.20.0.1	leonardo.granja@iez.com.br	0	435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4
c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	1760377738836	172.20.0.1	teste@fabrica.com	0	5e05cf13-5601-4819-8cdb-3c2fa3bb4d48
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1760377797496	172.20.0.1	leonardo.granja@iez.com.br	0	435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4
\N	1760379547455	172.20.0.1	\N	\N	b8291ee3-dd34-46d8-80a9-1cd1b6d885d1
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1760530821388	172.20.0.1	leonardo.granja@iez.com.br	0	435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1760617061124	172.20.0.1	leonardo.granja@iez.com.br	0	435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4
3c219e58-ed0e-4b18-ad48-f4f92793ae32	1760617066343	172.20.0.1	leonardo.granja@iez.com.br	0	435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4
a290a97c-e315-4c11-9823-57496eed344c	1760617343664	172.20.0.1	\N	\N	07a72057-6ec7-456d-87ac-37ca77e4fe13
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refresh_tokens (id, applications_id, data, insert_instant, start_instant, tenants_id, token, token_hash, token_hash_n1, token_seed, token_text, users_id) FROM stdin;
266a8b0b-d430-4d2f-a7b6-fffad8b75515	\N	{"data":{},"metaData":{"data":{"auth_time":1760617066},"device":{"lastAccessedAddress":"172.20.0.1","lastAccessedInstant":1760617066399,"name":"Linux Firefox","type":"BROWSER"}}}	1760617066399	1760617066399	4706a90d-b0c6-c6b8-e73a-b9e89d19875b	\N	OLHMyhbATki2Kqq5Ny5rQMkxQKMXWH/2EwdLWjugucM=                    	\N	\N	kl-4Yq1BW1Z9lsAUbM7O8wP4bEr9NB7U5hRSivjttR67EX-VYBj0PA	435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4
8343b098-4733-4f64-998b-15486020467a	3c219e58-ed0e-4b18-ad48-f4f92793ae32	{"data":{"auth_time":1760617066,"grants":["authorization_code"],"lastRotated":1760617309,"source":"oauth","ssoSessionId":"266a8b0b-d430-4d2f-a7b6-fffad8b75515","v":2},"metaData":{"device":{"lastAccessedAddress":"172.20.0.1","lastAccessedInstant":1760617309391,"name":"Linux Firefox","type":"BROWSER"},"scopes":["offline_access"]}}	1760617066569	1760617309391	\N	\N	wAkcuoWX5HkRTA5WN1XPH/twMI6sqesz04of9oAejrY=                    	gdfsRLHH/92uTZWV97FKS6dXpl0gW0sNgNAOt7cttCE=	XKecndyflcLYNKfJXzXl	XKecndyflcLYNKfJXzXlsm4aQ77MKsOj77G9j3rEfOH-J4BL0_MdhpTJJ8yVdj3o	435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4
\.


--
-- Data for Name: request_frequencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.request_frequencies (count, last_update_instant, request_id, tenants_id, type) FROM stdin;
\.


--
-- Data for Name: scim_external_id_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scim_external_id_groups (entities_id, external_id, groups_id) FROM stdin;
\.


--
-- Data for Name: scim_external_id_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scim_external_id_users (entities_id, external_id, users_id) FROM stdin;
\.


--
-- Data for Name: system_configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_configuration (data, insert_instant, last_update_instant, report_timezone) FROM stdin;
{"auditLogConfiguration":{"delete":{"enabled":false,"numberOfDaysToRetain":365}},"cookieEncryptionKey":"0QpIz6Ibf9r2xpzLH+1C4A==","corsConfiguration":{"allowCredentials":false,"debug":false,"enabled":false,"preflightMaxAgeInSeconds":0},"data":{},"eventLogConfiguration":{"numberToRetain":10000},"loginRecordConfiguration":{"delete":{"enabled":false,"numberOfDaysToRetain":365}},"trustedProxyConfiguration":{"trustPolicy":"All"},"uiConfiguration":{},"usageDataConfiguration":{"enabled":true,"numberOfDaysToRetain":366},"webhookEventLogConfiguration":{"delete":{"enabled":true,"numberOfDaysToRetain":30},"enabled":false}}	1760016864741	1760016864741	America/Denver
\.


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tenants (id, access_token_signing_keys_id, admin_user_forms_id, client_credentials_access_token_populate_lambdas_id, confirm_child_email_templates_id, data, email_update_email_templates_id, email_verified_email_templates_id, failed_authentication_user_actions_id, family_request_email_templates_id, forgot_password_email_templates_id, id_token_signing_keys_id, insert_instant, last_update_instant, login_id_in_use_on_create_email_templates_id, login_id_in_use_on_update_email_templates_id, login_new_device_email_templates_id, login_suspicious_email_templates_id, login_validation_lambdas_id, multi_factor_email_message_templates_id, multi_factor_sms_message_templates_id, multi_factor_sms_messengers_id, name, password_reset_success_email_templates_id, password_update_email_templates_id, parent_registration_email_templates_id, passwordless_email_templates_id, phone_configuration_forgot_password_templates_id, phone_configuration_identity_update_templates_id, phone_configuration_login_id_in_use_on_create_templates_id, phone_configuration_login_id_in_use_on_update_templates_id, phone_configuration_login_new_device_templates_id, phone_configuration_login_suspicious_templates_id, phone_configuration_messengers_id, phone_configuration_passwordless_templates_id, phone_configuration_password_reset_success_templates_id, phone_configuration_password_update_templates_id, phone_configuration_set_password_templates_id, phone_configuration_two_factor_method_add_templates_id, phone_configuration_two_factor_method_remove_templates_id, phone_configuration_verification_complete_templates_id, phone_configuration_verification_templates_id, scim_client_entity_types_id, scim_enterprise_user_request_converter_lambdas_id, scim_enterprise_user_response_converter_lambdas_id, scim_group_request_converter_lambdas_id, scim_group_response_converter_lambdas_id, scim_server_entity_types_id, scim_user_request_converter_lambdas_id, scim_user_response_converter_lambdas_id, set_password_email_templates_id, themes_id, two_factor_method_add_email_templates_id, two_factor_method_remove_email_templates_id, ui_ip_access_control_lists_id, verification_email_templates_id) FROM stdin;
4706a90d-b0c6-c6b8-e73a-b9e89d19875b	d0b3f8a1-4885-43a1-9f04-668543613875	8df860fe-857d-847d-ada8-2e86bac1fb87	\N	\N	{"accessControlConfiguration":{},"captchaConfiguration":{"captchaMethod":"GoogleRecaptchaV3","enabled":false,"threshold":0.5},"configured":true,"data":{},"emailConfiguration":{"debug":false,"defaultFromEmail":"change-me@example.com","defaultFromName":"FusionAuth","host":"localhost","implicitEmailVerificationAllowed":true,"port":25,"security":"NONE","unverified":{"allowEmailChangeWhenGated":false,"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyEmail":false,"verifyEmailWhenChanged":false},"eventConfiguration":{"events":{"jwt.public-key.update":{"enabled":false,"transactionType":"None"},"jwt.refresh-token.revoke":{"enabled":false,"transactionType":"None"},"jwt.refresh":{"enabled":false,"transactionType":"None"},"group.create":{"enabled":false,"transactionType":"None"},"group.create.complete":{"enabled":false,"transactionType":"None"},"group.delete":{"enabled":false,"transactionType":"None"},"group.delete.complete":{"enabled":false,"transactionType":"None"},"group.member.add":{"enabled":false,"transactionType":"None"},"group.member.add.complete":{"enabled":false,"transactionType":"None"},"group.member.remove":{"enabled":false,"transactionType":"None"},"group.member.remove.complete":{"enabled":false,"transactionType":"None"},"group.member.update":{"enabled":false,"transactionType":"None"},"group.member.update.complete":{"enabled":false,"transactionType":"None"},"group.update":{"enabled":false,"transactionType":"None"},"group.update.complete":{"enabled":false,"transactionType":"None"},"user.action":{"enabled":false,"transactionType":"None"},"user.bulk.create":{"enabled":false,"transactionType":"None"},"user.create":{"enabled":false,"transactionType":"None"},"user.create.complete":{"enabled":false,"transactionType":"None"},"user.deactivate":{"enabled":false,"transactionType":"None"},"user.delete":{"enabled":false,"transactionType":"None"},"user.delete.complete":{"enabled":false,"transactionType":"None"},"user.email.update":{"enabled":false,"transactionType":"None"},"user.email.verified":{"enabled":false,"transactionType":"None"},"user.identity-provider.link":{"enabled":false,"transactionType":"None"},"user.identity-provider.unlink":{"enabled":false,"transactionType":"None"},"user.loginId.duplicate.create":{"enabled":false,"transactionType":"None"},"user.loginId.duplicate.update":{"enabled":false,"transactionType":"None"},"user.login.failed":{"enabled":false,"transactionType":"None"},"user.login.new-device":{"enabled":false,"transactionType":"None"},"user.login.success":{"enabled":false,"transactionType":"None"},"user.login.suspicious":{"enabled":false,"transactionType":"None"},"user.password.breach":{"enabled":false,"transactionType":"None"},"user.password.reset.send":{"enabled":false,"transactionType":"None"},"user.password.reset.start":{"enabled":false,"transactionType":"None"},"user.password.reset.success":{"enabled":false,"transactionType":"None"},"user.password.update":{"enabled":false,"transactionType":"None"},"user.reactivate":{"enabled":false,"transactionType":"None"},"user.registration.create":{"enabled":false,"transactionType":"None"},"user.registration.create.complete":{"enabled":false,"transactionType":"None"},"user.registration.delete":{"enabled":false,"transactionType":"None"},"user.registration.delete.complete":{"enabled":false,"transactionType":"None"},"user.registration.update":{"enabled":false,"transactionType":"None"},"user.registration.update.complete":{"enabled":false,"transactionType":"None"},"user.registration.verified":{"enabled":false,"transactionType":"None"},"user.two-factor.method.add":{"enabled":false,"transactionType":"None"},"user.two-factor.method.remove":{"enabled":false,"transactionType":"None"},"user.update":{"enabled":false,"transactionType":"None"},"user.update.complete":{"enabled":false,"transactionType":"None"},"user.identity.verified":{"enabled":false,"transactionType":"None"},"user.identity.update":{"enabled":false,"transactionType":"None"}}},"externalIdentifierConfiguration":{"authorizationGrantIdTimeToLiveInSeconds":30,"changePasswordIdGenerator":{"length":32,"type":"randomBytes"},"changePasswordIdTimeToLiveInSeconds":600,"deviceCodeTimeToLiveInSeconds":300,"deviceUserCodeIdGenerator":{"length":6,"type":"randomAlphaNumeric"},"emailVerificationIdGenerator":{"length":32,"type":"randomBytes"},"emailVerificationIdTimeToLiveInSeconds":86400,"emailVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"externalAuthenticationIdTimeToLiveInSeconds":300,"loginIntentTimeToLiveInSeconds":1800,"oneTimePasswordTimeToLiveInSeconds":60,"passwordlessLoginGenerator":{"length":32,"type":"randomBytes"},"passwordlessLoginOneTimeCodeGenerator":{"length":6,"type":"randomDigits"},"passwordlessLoginTimeToLiveInSeconds":180,"pendingAccountLinkTimeToLiveInSeconds":3600,"phoneVerificationIdGenerator":{"length":32,"type":"randomBytes"},"phoneVerificationIdTimeToLiveInSeconds":86400,"phoneVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"registrationVerificationIdGenerator":{"length":32,"type":"randomBytes"},"registrationVerificationIdTimeToLiveInSeconds":86400,"registrationVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"rememberOAuthScopeConsentChoiceTimeToLiveInSeconds":2592000,"samlv2AuthNRequestIdTimeToLiveInSeconds":300,"setupPasswordIdGenerator":{"length":32,"type":"randomBytes"},"setupPasswordIdTimeToLiveInSeconds":86400,"trustTokenTimeToLiveInSeconds":180,"twoFactorIdTimeToLiveInSeconds":300,"twoFactorOneTimeCodeIdGenerator":{"length":6,"type":"randomDigits"},"twoFactorOneTimeCodeIdTimeToLiveInSeconds":60,"twoFactorTrustIdTimeToLiveInSeconds":2592000,"webAuthnAuthenticationChallengeTimeToLiveInSeconds":180,"webAuthnRegistrationChallengeTimeToLiveInSeconds":180},"failedAuthenticationConfiguration":{"actionCancelPolicy":{"onPasswordReset":false},"actionDuration":3,"actionDurationUnit":"MINUTES","emailUser":false,"resetCountInSeconds":60,"tooManyAttempts":5},"familyConfiguration":{"allowChildRegistrations":true,"deleteOrphanedAccounts":false,"deleteOrphanedAccountsDays":30,"enabled":false,"maximumChildAge":12,"minimumOwnerAge":21,"parentEmailRequired":false},"formConfiguration":{},"httpSessionMaxInactiveInterval":3600,"issuer":"localhost:9011","jwtConfiguration":{"enabled":false,"refreshTokenExpirationPolicy":"Fixed","refreshTokenOneTimeUseConfiguration":{"gracePeriodInSeconds":0},"refreshTokenRevocationPolicy":{"onLoginPrevented":true,"onMultiFactorEnable":false,"onOneTimeTokenReuse":false,"onPasswordChanged":true},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"loginConfiguration":{"requireAuthentication":true},"maximumPasswordAge":{"days":180,"enabled":false},"minimumPasswordAge":{"enabled":false,"seconds":30},"multiFactorConfiguration":{"authenticator":{"algorithm":"HmacSHA1","codeLength":6,"enabled":true,"timeStep":30},"email":{"enabled":false,"templateId":"bc6a1254-8779-4112-b3da-88c42a3abde9"},"loginPolicy":"Enabled","sms":{"enabled":false}},"passwordEncryptionConfiguration":{"encryptionScheme":"salted-pbkdf2-hmac-sha256","encryptionSchemeFactor":24000,"modifyEncryptionSchemeOnLogin":false},"passwordValidationRules":{"breachDetection":{"enabled":false,"matchMode":"High","notifyUserEmailTemplateId":"b27c0cf8-3468-4f83-a1f6-97e9075428e2","onLogin":"Off"},"maxLength":256,"minLength":8,"rememberPreviousPasswords":{"count":1,"enabled":false},"requireMixedCase":false,"requireNonAlpha":false,"requireNumber":false,"validateOnLogin":false},"phoneConfiguration":{"implicitPhoneVerificationAllowed":true,"unverified":{"allowPhoneNumberChangeWhenGated":false,"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyPhoneNumber":false},"rateLimitConfiguration":{"failedLogin":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"forgotPassword":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendEmailVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordless":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordlessPhone":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPhoneVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendRegistrationVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendTwoFactor":{"enabled":false,"limit":5,"timePeriodInSeconds":60}},"registrationConfiguration":{},"scimServerConfiguration":{"enabled":false},"ssoConfiguration":{"allowAccessTokenBootstrap":false,"deviceTrustTimeToLiveInSeconds":31536000},"state":"Active","userDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"usernameConfiguration":{"unique":{"enabled":false,"numberOfDigits":5,"separator":"#","strategy":"OnCollision"}},"webAuthnConfiguration":{"bootstrapWorkflow":{"authenticatorAttachmentPreference":"any","enabled":false,"userVerificationRequirement":"required"},"debug":false,"enabled":false,"reauthenticationWorkflow":{"authenticatorAttachmentPreference":"platform","enabled":false,"userVerificationRequirement":"required"}}}	\N	\N	\N	\N	de70e8df-860a-4cb3-9bb1-f8cdc112af34	d0b3f8a1-4885-43a1-9f04-668543613875	1760016863741	1760026028016	\N	\N	\N	\N	\N	bc6a1254-8779-4112-b3da-88c42a3abde9	\N	\N	Fabrica	\N	\N	\N	20cff312-0de9-4ac0-85ea-f68b3b7a1263	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	dcc66541-f54c-4aec-9f9b-d7cad905467d	75a068fd-e94b-451a-9aeb-3ddb9a3b5987	\N	\N	\N	\N
3df9a1ee-a354-4f0b-b8dd-4b55565d2372	d0b3f8a1-4885-43a1-9f04-668543613875	8df860fe-857d-847d-ada8-2e86bac1fb87	\N	\N	{"accessControlConfiguration":{},"captchaConfiguration":{"captchaMethod":"GoogleRecaptchaV3","enabled":false,"threshold":0.5},"configured":true,"data":{},"emailConfiguration":{"debug":false,"defaultFromEmail":"change-me@example.com","defaultFromName":"FusionAuth","host":"localhost","implicitEmailVerificationAllowed":true,"port":25,"security":"NONE","unverified":{"allowEmailChangeWhenGated":false,"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyEmail":false,"verifyEmailWhenChanged":false},"eventConfiguration":{"events":{"jwt.public-key.update":{"enabled":false,"transactionType":"None"},"jwt.refresh-token.revoke":{"enabled":false,"transactionType":"None"},"jwt.refresh":{"enabled":false,"transactionType":"None"},"group.create":{"enabled":false,"transactionType":"None"},"group.create.complete":{"enabled":false,"transactionType":"None"},"group.delete":{"enabled":false,"transactionType":"None"},"group.delete.complete":{"enabled":false,"transactionType":"None"},"group.member.add":{"enabled":false,"transactionType":"None"},"group.member.add.complete":{"enabled":false,"transactionType":"None"},"group.member.remove":{"enabled":false,"transactionType":"None"},"group.member.remove.complete":{"enabled":false,"transactionType":"None"},"group.member.update":{"enabled":false,"transactionType":"None"},"group.member.update.complete":{"enabled":false,"transactionType":"None"},"group.update":{"enabled":false,"transactionType":"None"},"group.update.complete":{"enabled":false,"transactionType":"None"},"user.action":{"enabled":false,"transactionType":"None"},"user.bulk.create":{"enabled":false,"transactionType":"None"},"user.create":{"enabled":false,"transactionType":"None"},"user.create.complete":{"enabled":false,"transactionType":"None"},"user.deactivate":{"enabled":false,"transactionType":"None"},"user.delete":{"enabled":false,"transactionType":"None"},"user.delete.complete":{"enabled":false,"transactionType":"None"},"user.email.update":{"enabled":false,"transactionType":"None"},"user.email.verified":{"enabled":false,"transactionType":"None"},"user.identity-provider.link":{"enabled":false,"transactionType":"None"},"user.identity-provider.unlink":{"enabled":false,"transactionType":"None"},"user.loginId.duplicate.create":{"enabled":false,"transactionType":"None"},"user.loginId.duplicate.update":{"enabled":false,"transactionType":"None"},"user.login.failed":{"enabled":false,"transactionType":"None"},"user.login.new-device":{"enabled":false,"transactionType":"None"},"user.login.success":{"enabled":false,"transactionType":"None"},"user.login.suspicious":{"enabled":false,"transactionType":"None"},"user.password.breach":{"enabled":false,"transactionType":"None"},"user.password.reset.send":{"enabled":false,"transactionType":"None"},"user.password.reset.start":{"enabled":false,"transactionType":"None"},"user.password.reset.success":{"enabled":false,"transactionType":"None"},"user.password.update":{"enabled":false,"transactionType":"None"},"user.reactivate":{"enabled":false,"transactionType":"None"},"user.registration.create":{"enabled":false,"transactionType":"None"},"user.registration.create.complete":{"enabled":false,"transactionType":"None"},"user.registration.delete":{"enabled":false,"transactionType":"None"},"user.registration.delete.complete":{"enabled":false,"transactionType":"None"},"user.registration.update":{"enabled":false,"transactionType":"None"},"user.registration.update.complete":{"enabled":false,"transactionType":"None"},"user.registration.verified":{"enabled":false,"transactionType":"None"},"user.two-factor.method.add":{"enabled":false,"transactionType":"None"},"user.two-factor.method.remove":{"enabled":false,"transactionType":"None"},"user.update":{"enabled":false,"transactionType":"None"},"user.update.complete":{"enabled":false,"transactionType":"None"},"user.identity.verified":{"enabled":false,"transactionType":"None"},"user.identity.update":{"enabled":false,"transactionType":"None"}}},"externalIdentifierConfiguration":{"authorizationGrantIdTimeToLiveInSeconds":30,"changePasswordIdGenerator":{"length":32,"type":"randomBytes"},"changePasswordIdTimeToLiveInSeconds":600,"deviceCodeTimeToLiveInSeconds":300,"deviceUserCodeIdGenerator":{"length":6,"type":"randomAlphaNumeric"},"emailVerificationIdGenerator":{"length":32,"type":"randomBytes"},"emailVerificationIdTimeToLiveInSeconds":86400,"emailVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"externalAuthenticationIdTimeToLiveInSeconds":300,"loginIntentTimeToLiveInSeconds":1800,"oneTimePasswordTimeToLiveInSeconds":60,"passwordlessLoginGenerator":{"length":32,"type":"randomBytes"},"passwordlessLoginOneTimeCodeGenerator":{"length":6,"type":"randomDigits"},"passwordlessLoginTimeToLiveInSeconds":180,"pendingAccountLinkTimeToLiveInSeconds":3600,"phoneVerificationIdGenerator":{"length":32,"type":"randomBytes"},"phoneVerificationIdTimeToLiveInSeconds":86400,"phoneVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"registrationVerificationIdGenerator":{"length":32,"type":"randomBytes"},"registrationVerificationIdTimeToLiveInSeconds":86400,"registrationVerificationOneTimeCodeGenerator":{"length":6,"type":"randomAlphaNumeric"},"rememberOAuthScopeConsentChoiceTimeToLiveInSeconds":2592000,"samlv2AuthNRequestIdTimeToLiveInSeconds":300,"setupPasswordIdGenerator":{"length":32,"type":"randomBytes"},"setupPasswordIdTimeToLiveInSeconds":86400,"trustTokenTimeToLiveInSeconds":180,"twoFactorIdTimeToLiveInSeconds":300,"twoFactorOneTimeCodeIdGenerator":{"length":6,"type":"randomDigits"},"twoFactorOneTimeCodeIdTimeToLiveInSeconds":60,"twoFactorTrustIdTimeToLiveInSeconds":2592000,"webAuthnAuthenticationChallengeTimeToLiveInSeconds":180,"webAuthnRegistrationChallengeTimeToLiveInSeconds":180},"failedAuthenticationConfiguration":{"actionCancelPolicy":{"onPasswordReset":false},"actionDuration":3,"actionDurationUnit":"MINUTES","emailUser":false,"resetCountInSeconds":60,"tooManyAttempts":5},"familyConfiguration":{"allowChildRegistrations":true,"deleteOrphanedAccounts":false,"deleteOrphanedAccountsDays":30,"enabled":false,"maximumChildAge":12,"minimumOwnerAge":21,"parentEmailRequired":false},"formConfiguration":{},"httpSessionMaxInactiveInterval":3600,"issuer":"localhost:9011","jwtConfiguration":{"enabled":false,"refreshTokenExpirationPolicy":"Fixed","refreshTokenOneTimeUseConfiguration":{"gracePeriodInSeconds":0},"refreshTokenRevocationPolicy":{"onLoginPrevented":true,"onMultiFactorEnable":false,"onOneTimeTokenReuse":false,"onPasswordChanged":true},"refreshTokenSlidingWindowConfiguration":{"maximumTimeToLiveInMinutes":43200},"refreshTokenTimeToLiveInMinutes":43200,"refreshTokenUsagePolicy":"Reusable","timeToLiveInSeconds":3600},"loginConfiguration":{"requireAuthentication":true},"maximumPasswordAge":{"days":180,"enabled":false},"minimumPasswordAge":{"enabled":false,"seconds":30},"multiFactorConfiguration":{"authenticator":{"algorithm":"HmacSHA1","codeLength":6,"enabled":true,"timeStep":30},"email":{"enabled":false,"templateId":"bc6a1254-8779-4112-b3da-88c42a3abde9"},"loginPolicy":"Enabled","sms":{"enabled":false}},"passwordEncryptionConfiguration":{"encryptionScheme":"salted-pbkdf2-hmac-sha256","encryptionSchemeFactor":24000,"modifyEncryptionSchemeOnLogin":false},"passwordValidationRules":{"breachDetection":{"enabled":false,"matchMode":"High","notifyUserEmailTemplateId":"b27c0cf8-3468-4f83-a1f6-97e9075428e2","onLogin":"Off"},"maxLength":256,"minLength":8,"rememberPreviousPasswords":{"count":1,"enabled":false},"requireMixedCase":false,"requireNonAlpha":false,"requireNumber":false,"validateOnLogin":false},"phoneConfiguration":{"implicitPhoneVerificationAllowed":true,"unverified":{"allowPhoneNumberChangeWhenGated":false,"behavior":"Allow"},"verificationStrategy":"ClickableLink","verifyPhoneNumber":false},"rateLimitConfiguration":{"failedLogin":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"forgotPassword":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendEmailVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordless":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPasswordlessPhone":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendPhoneVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendRegistrationVerification":{"enabled":false,"limit":5,"timePeriodInSeconds":60},"sendTwoFactor":{"enabled":false,"limit":5,"timePeriodInSeconds":60}},"registrationConfiguration":{},"scimServerConfiguration":{"enabled":false},"ssoConfiguration":{"allowAccessTokenBootstrap":false,"deviceTrustTimeToLiveInSeconds":31536000},"state":"Active","userDeletePolicy":{"unverified":{"enabled":false,"numberOfDaysToRetain":120}},"usernameConfiguration":{"unique":{"enabled":false,"numberOfDigits":5,"separator":"#","strategy":"OnCollision"}},"webAuthnConfiguration":{"bootstrapWorkflow":{"authenticatorAttachmentPreference":"platform","enabled":false,"userVerificationRequirement":"required"},"debug":false,"enabled":false,"reauthenticationWorkflow":{"authenticatorAttachmentPreference":"platform","enabled":false,"userVerificationRequirement":"required"}}}	\N	\N	\N	\N	de70e8df-860a-4cb3-9bb1-f8cdc112af34	d0b3f8a1-4885-43a1-9f04-668543613875	1760030525087	1760377901159	\N	\N	\N	\N	\N	bc6a1254-8779-4112-b3da-88c42a3abde9	\N	\N	Web	\N	\N	\N	20cff312-0de9-4ac0-85ea-f68b3b7a1263	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	dcc66541-f54c-4aec-9f9b-d7cad905467d	75a068fd-e94b-451a-9aeb-3ddb9a3b5987	\N	\N	\N	\N
\.


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.themes (id, data, insert_instant, last_update_instant, name) FROM stdin;
75a068fd-e94b-451a-9aeb-3ddb9a3b5987	{}	1760016864741	1760016864741	FusionAuth
3c717291-5d83-4014-bd51-97c76475dc86	{"type":"simple"}	1760016864741	1760016864741	FusionAuth - Simple
\.


--
-- Data for Name: usage_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usage_stats (application_version, instance_id, collection_duration, collection_instant, failed_stats, sent, stats, stats_version, timings) FROM stdin;
\.


--
-- Data for Name: user_action_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_action_logs (id, actioner_users_id, actionee_users_id, comment, email_user_on_end, end_event_sent, expiry, history, insert_instant, localized_name, localized_option, localized_reason, name, notify_user_on_end, option_name, reason, reason_code, user_actions_id) FROM stdin;
\.


--
-- Data for Name: user_action_logs_applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_action_logs_applications (applications_id, user_action_logs_id) FROM stdin;
\.


--
-- Data for Name: user_action_reasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_action_reasons (id, insert_instant, last_update_instant, localized_texts, text, code) FROM stdin;
\.


--
-- Data for Name: user_actions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_actions (id, active, cancel_email_templates_id, end_email_templates_id, include_email_in_event_json, insert_instant, last_update_instant, localized_names, modify_email_templates_id, name, options, prevent_login, send_end_event, start_email_templates_id, temporal, transaction_type, user_notifications_enabled, user_emailing_enabled) FROM stdin;
\.


--
-- Data for Name: user_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_comments (id, comment, commenter_id, insert_instant, users_id) FROM stdin;
\.


--
-- Data for Name: user_consents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_consents (id, consents_id, data, giver_users_id, insert_instant, last_update_instant, users_id) FROM stdin;
\.


--
-- Data for Name: user_consents_email_plus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_consents_email_plus (id, next_email_instant, user_consents_id) FROM stdin;
\.


--
-- Data for Name: user_registrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_registrations (id, applications_id, authentication_token, clean_speak_id, data, insert_instant, last_login_instant, last_update_instant, timezone, username, username_status, users_id, verified, verified_instant) FROM stdin;
eb3adb65-b6c4-455c-a5dd-dc5e9cadcf65	c7c6dce9-2e9b-4b2c-b4ab-d00bd1301305	\N	\N	{"data":{},"preferredLanguages":[],"tokens":{}}	1760035208010	1760377738836	1760035208010	\N	\N	0	5e05cf13-5601-4819-8cdb-3c2fa3bb4d48	t	1760035208010
51d67d06-1382-4557-83a6-735e76d077a7	3c219e58-ed0e-4b18-ad48-f4f92793ae32	\N	\N	{"data":{},"preferredLanguages":[],"tokens":{}}	1760017304451	1760617066343	1760017304451	\N	\N	0	435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4	t	1760017304451
580f4064-3c6d-47b9-a770-71f789ab6bb4	a290a97c-e315-4c11-9823-57496eed344c	\N	\N	{"data":{},"preferredLanguages":[],"tokens":{}}	1760617343664	1760617343664	1760617343664	\N	\N	0	07a72057-6ec7-456d-87ac-37ca77e4fe13	t	1760617343664
\.


--
-- Data for Name: user_registrations_application_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_registrations_application_roles (application_roles_id, user_registrations_id) FROM stdin;
631ecd9d-8d40-4c13-8277-80cedb8236e2	51d67d06-1382-4557-83a6-735e76d077a7
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, active, breached_password_last_checked_instant, breached_password_status, birth_date, clean_speak_id, connectors_id, data, expiry, first_name, full_name, image_url, insert_instant, last_name, last_login_instant, last_update_instant, middle_name, mobile_phone, parent_email, password, password_change_reason, password_change_required, password_encryption_scheme, password_factor, password_last_update_instant, password_salt, tenants_id, timezone, verified_instant) FROM stdin;
5e05cf13-5601-4819-8cdb-3c2fa3bb4d48	t	\N	\N	\N	\N	e3306678-a53a-4964-9040-1c96f36dda72	{"data":{},"preferredLanguages":[],"twoFactor":{}}	\N	\N	\N	\N	1760035070317	\N	1760377738836	1760035070317	\N	\N	\N	X8/Ez0FngxZjPIE/0M0KaXfuHb6N+2TVFNoG2hYhjOU=	\N	f	salted-pbkdf2-hmac-sha256	24000	1760035070323	q2OSzEuWXJUP0OJx/49O/LCr/yiN0fWTWh1iJvFsSW0=	4706a90d-b0c6-c6b8-e73a-b9e89d19875b	\N	1760035070317
b8291ee3-dd34-46d8-80a9-1cd1b6d885d1	t	\N	\N	\N	\N	e3306678-a53a-4964-9040-1c96f36dda72	{"data":{},"preferredLanguages":[],"twoFactor":{}}	\N	\N	\N	\N	1760379547455	\N	1760379547455	1760379547455	\N	\N	\N	LtjMUIEyd65rKgIX2uZk4zDLffFoqE3qUKEDQe3voeA=	\N	f	salted-pbkdf2-hmac-sha256	24000	1760379547461	pIZWOspQnaZIsImHuy9MpZR4Flsgl0/R74sigr6bS84=	3df9a1ee-a354-4f0b-b8dd-4b55565d2372	\N	1760379547455
07a72057-6ec7-456d-87ac-37ca77e4fe13	t	\N	\N	\N	\N	e3306678-a53a-4964-9040-1c96f36dda72	{"data":{},"preferredLanguages":[],"twoFactor":{}}	\N	\N	T	\N	1760617343659	\N	1760617343664	1760617343659	\N	\N	\N	W8s9kFklRKXdiQDvYidN029kfvImxMxLYG3uOwRoDsM=	\N	f	salted-pbkdf2-hmac-sha256	24000	1760617343740	jbnGOELc4oVjGpy0VxdPfqFEkSA3lupUfPtH+1T2TME=	3df9a1ee-a354-4f0b-b8dd-4b55565d2372	\N	1760617343659
435c1b32-ec7f-48aa-9d96-3a37e1e4fdf4	t	\N	\N	\N	\N	e3306678-a53a-4964-9040-1c96f36dda72	{"data":{},"preferredLanguages":[],"twoFactor":{}}	\N	FusionAuth	\N	\N	1760017304426	admin	1760617066343	1760017304426	\N	\N	\N	E7Q3S9w7jVK03GscY8cQvhQ4Yh0oRkDmvM+tOXkQJKQ=	\N	f	salted-pbkdf2-hmac-sha256	24000	1760017304433	r4L0jUkvhwZHxttJlvJFurc3ehZ0O0r8KvAy6QsLSok=	4706a90d-b0c6-c6b8-e73a-b9e89d19875b	\N	1760017304426
\.


--
-- Data for Name: version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.version (version) FROM stdin;
1.60.2
\.


--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webauthn_credentials (id, credential_id, data, insert_instant, last_use_instant, tenants_id, users_id) FROM stdin;
\.


--
-- Data for Name: webhook_attempt_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webhook_attempt_logs (id, data, end_instant, start_instant, webhook_event_logs_id, webhooks_id) FROM stdin;
\.


--
-- Data for Name: webhook_event_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webhook_event_logs (id, data, event_result, event_type, insert_instant, last_attempt_instant, last_update_instant, linked_object_id, sequence) FROM stdin;
\.


--
-- Data for Name: webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webhooks (id, connect_timeout, description, data, global, headers, http_authentication_username, http_authentication_password, insert_instant, last_update_instant, read_timeout, signing_keys_id, ssl_certificate, ssl_certificate_keys_id, url) FROM stdin;
\.


--
-- Data for Name: webhooks_tenants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webhooks_tenants (webhooks_id, tenants_id) FROM stdin;
\.


--
-- Name: audit_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audit_logs_id_seq', 25, true);


--
-- Name: event_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_logs_id_seq', 1, true);


--
-- Name: identities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.identities_id_seq', 13, true);


--
-- Name: raw_application_registration_counts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.raw_application_registration_counts_id_seq', 17, true);


--
-- Name: raw_global_registration_counts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.raw_global_registration_counts_id_seq', 20, true);


--
-- Name: user_consents_email_plus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_consents_email_plus_id_seq', 1, false);


--
-- Name: webhook_event_logs_sequence_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.webhook_event_logs_sequence_seq', 1, false);


--
-- Name: application_daily_active_users application_daily_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_daily_active_users
    ADD CONSTRAINT application_daily_active_users_uk_1 UNIQUE (applications_id, day);


--
-- Name: application_monthly_active_users application_monthly_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_monthly_active_users
    ADD CONSTRAINT application_monthly_active_users_uk_1 UNIQUE (applications_id, month);


--
-- Name: application_oauth_scopes application_oauth_scopes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_oauth_scopes
    ADD CONSTRAINT application_oauth_scopes_pkey PRIMARY KEY (id);


--
-- Name: application_oauth_scopes application_oauth_scopes_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_oauth_scopes
    ADD CONSTRAINT application_oauth_scopes_uk_1 UNIQUE (applications_id, name);


--
-- Name: application_registration_counts application_registration_counts_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_registration_counts
    ADD CONSTRAINT application_registration_counts_uk_1 UNIQUE (applications_id, hour);


--
-- Name: application_roles application_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_roles
    ADD CONSTRAINT application_roles_pkey PRIMARY KEY (id);


--
-- Name: application_roles application_roles_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_roles
    ADD CONSTRAINT application_roles_uk_1 UNIQUE (name, applications_id);


--
-- Name: applications applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);


--
-- Name: applications applications_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_uk_1 UNIQUE (name, tenants_id);


--
-- Name: applications applications_uk_2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_uk_2 UNIQUE (samlv2_issuer, tenants_id);


--
-- Name: asynchronous_tasks asynchronous_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asynchronous_tasks
    ADD CONSTRAINT asynchronous_tasks_pkey PRIMARY KEY (id);


--
-- Name: asynchronous_tasks asynchronous_tasks_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asynchronous_tasks
    ADD CONSTRAINT asynchronous_tasks_uk_1 UNIQUE (entity_id);


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: authentication_keys authentication_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_keys
    ADD CONSTRAINT authentication_keys_pkey PRIMARY KEY (id);


--
-- Name: authentication_keys authentication_keys_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_keys
    ADD CONSTRAINT authentication_keys_uk_1 UNIQUE (key_value);


--
-- Name: authentication_keys authentication_keys_uk_2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_keys
    ADD CONSTRAINT authentication_keys_uk_2 UNIQUE (name);


--
-- Name: breached_password_metrics breached_password_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.breached_password_metrics
    ADD CONSTRAINT breached_password_metrics_pkey PRIMARY KEY (tenants_id);


--
-- Name: clean_speak_applications clean_speak_applications_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clean_speak_applications
    ADD CONSTRAINT clean_speak_applications_uk_1 UNIQUE (applications_id, clean_speak_application_id);


--
-- Name: common_breached_passwords common_breached_passwords_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.common_breached_passwords
    ADD CONSTRAINT common_breached_passwords_pkey PRIMARY KEY (password);


--
-- Name: connectors connectors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connectors
    ADD CONSTRAINT connectors_pkey PRIMARY KEY (id);


--
-- Name: connectors_tenants connectors_tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connectors_tenants
    ADD CONSTRAINT connectors_tenants_pkey PRIMARY KEY (connectors_id, tenants_id);


--
-- Name: connectors_tenants connectors_tenants_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connectors_tenants
    ADD CONSTRAINT connectors_tenants_uk_1 UNIQUE (connectors_id, tenants_id, sequence);


--
-- Name: connectors connectors_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connectors
    ADD CONSTRAINT connectors_uk_1 UNIQUE (name);


--
-- Name: consents consents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consents
    ADD CONSTRAINT consents_pkey PRIMARY KEY (id);


--
-- Name: consents consents_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consents
    ADD CONSTRAINT consents_uk_1 UNIQUE (name);


--
-- Name: data_sets data_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_sets
    ADD CONSTRAINT data_sets_pkey PRIMARY KEY (name);


--
-- Name: email_templates email_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_pkey PRIMARY KEY (id);


--
-- Name: email_templates email_templates_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_uk_1 UNIQUE (name);


--
-- Name: entities entities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities
    ADD CONSTRAINT entities_pkey PRIMARY KEY (id);


--
-- Name: entities entities_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities
    ADD CONSTRAINT entities_uk_1 UNIQUE (client_id);


--
-- Name: entity_entity_grant_permissions entity_entity_grant_permissions_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_entity_grant_permissions
    ADD CONSTRAINT entity_entity_grant_permissions_uk_1 UNIQUE (entity_entity_grants_id, entity_type_permissions_id);


--
-- Name: entity_entity_grants entity_entity_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_entity_grants
    ADD CONSTRAINT entity_entity_grants_pkey PRIMARY KEY (id);


--
-- Name: entity_entity_grants entity_entity_grants_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_entity_grants
    ADD CONSTRAINT entity_entity_grants_uk_1 UNIQUE (recipient_id, target_id);


--
-- Name: entity_type_permissions entity_type_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_type_permissions
    ADD CONSTRAINT entity_type_permissions_pkey PRIMARY KEY (id);


--
-- Name: entity_type_permissions entity_type_permissions_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_type_permissions
    ADD CONSTRAINT entity_type_permissions_uk_1 UNIQUE (entity_types_id, name);


--
-- Name: entity_types entity_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_types
    ADD CONSTRAINT entity_types_pkey PRIMARY KEY (id);


--
-- Name: entity_types entity_types_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_types
    ADD CONSTRAINT entity_types_uk_1 UNIQUE (name);


--
-- Name: entity_user_grant_permissions entity_user_grant_permissions_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_user_grant_permissions
    ADD CONSTRAINT entity_user_grant_permissions_uk_1 UNIQUE (entity_user_grants_id, entity_type_permissions_id);


--
-- Name: entity_user_grants entity_user_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_user_grants
    ADD CONSTRAINT entity_user_grants_pkey PRIMARY KEY (id);


--
-- Name: entity_user_grants entity_user_grants_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_user_grants
    ADD CONSTRAINT entity_user_grants_uk_1 UNIQUE (entities_id, users_id);


--
-- Name: event_logs event_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_logs
    ADD CONSTRAINT event_logs_pkey PRIMARY KEY (id);


--
-- Name: external_identifiers external_identifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_identifiers
    ADD CONSTRAINT external_identifiers_pkey PRIMARY KEY (id);


--
-- Name: families families_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.families
    ADD CONSTRAINT families_pkey PRIMARY KEY (family_id, users_id);


--
-- Name: federated_domains federated_domains_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_domains
    ADD CONSTRAINT federated_domains_uk_1 UNIQUE (domain);


--
-- Name: form_fields form_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_fields
    ADD CONSTRAINT form_fields_pkey PRIMARY KEY (id);


--
-- Name: form_fields form_fields_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_fields
    ADD CONSTRAINT form_fields_uk_1 UNIQUE (name);


--
-- Name: form_steps form_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_steps
    ADD CONSTRAINT form_steps_pkey PRIMARY KEY (forms_id, form_fields_id);


--
-- Name: forms forms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_pkey PRIMARY KEY (id);


--
-- Name: forms forms_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_uk_1 UNIQUE (name);


--
-- Name: global_daily_active_users global_daily_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_daily_active_users
    ADD CONSTRAINT global_daily_active_users_uk_1 UNIQUE (day);


--
-- Name: global_monthly_active_users global_monthly_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_monthly_active_users
    ADD CONSTRAINT global_monthly_active_users_uk_1 UNIQUE (month);


--
-- Name: global_registration_counts global_registration_counts_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_registration_counts
    ADD CONSTRAINT global_registration_counts_uk_1 UNIQUE (hour);


--
-- Name: group_application_roles group_application_roles_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_application_roles
    ADD CONSTRAINT group_application_roles_uk_1 UNIQUE (groups_id, application_roles_id);


--
-- Name: group_members group_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_pkey PRIMARY KEY (id);


--
-- Name: group_members group_members_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_uk_1 UNIQUE (groups_id, users_id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: groups groups_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_uk_1 UNIQUE (name, tenants_id);


--
-- Name: hourly_logins hourly_logins_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hourly_logins
    ADD CONSTRAINT hourly_logins_uk_1 UNIQUE (applications_id, hour);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_uk_1 UNIQUE (email, tenants_id);


--
-- Name: identities identities_uk_2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_uk_2 UNIQUE (username_index, tenants_id);


--
-- Name: identities identities_uk_3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_uk_3 UNIQUE (tenants_id, type, value);


--
-- Name: identity_provider_links identity_provider_links_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_links
    ADD CONSTRAINT identity_provider_links_uk_1 UNIQUE (identity_providers_id, identity_providers_user_id, tenants_id);


--
-- Name: identity_providers identity_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_providers
    ADD CONSTRAINT identity_providers_pkey PRIMARY KEY (id);


--
-- Name: identity_providers identity_providers_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_providers
    ADD CONSTRAINT identity_providers_uk_1 UNIQUE (name);


--
-- Name: ip_access_control_lists ip_access_control_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ip_access_control_lists
    ADD CONSTRAINT ip_access_control_lists_pkey PRIMARY KEY (id);


--
-- Name: ip_access_control_lists ip_access_control_lists_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ip_access_control_lists
    ADD CONSTRAINT ip_access_control_lists_uk_1 UNIQUE (name);


--
-- Name: ip_location_database ip_location_database_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ip_location_database
    ADD CONSTRAINT ip_location_database_pkey PRIMARY KEY (last_modified, seq);


--
-- Name: ip_location_meta_data ip_location_meta_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ip_location_meta_data
    ADD CONSTRAINT ip_location_meta_data_pkey PRIMARY KEY (last_modified);


--
-- Name: keys keys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_pkey PRIMARY KEY (id);


--
-- Name: keys keys_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_uk_1 UNIQUE (kid);


--
-- Name: keys keys_uk_2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_uk_2 UNIQUE (name);


--
-- Name: kickstart_files kickstart_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kickstart_files
    ADD CONSTRAINT kickstart_files_pkey PRIMARY KEY (id);


--
-- Name: lambdas lambdas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lambdas
    ADD CONSTRAINT lambdas_pkey PRIMARY KEY (id);


--
-- Name: locks locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locks
    ADD CONSTRAINT locks_pkey PRIMARY KEY (type);


--
-- Name: message_templates message_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_templates
    ADD CONSTRAINT message_templates_pkey PRIMARY KEY (id);


--
-- Name: message_templates message_templates_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_templates
    ADD CONSTRAINT message_templates_uk_1 UNIQUE (name);


--
-- Name: messengers messengers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messengers
    ADD CONSTRAINT messengers_pkey PRIMARY KEY (id);


--
-- Name: messengers messengers_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messengers
    ADD CONSTRAINT messengers_uk_1 UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (name);


--
-- Name: nodes nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nodes
    ADD CONSTRAINT nodes_pkey PRIMARY KEY (id);


--
-- Name: previous_passwords previous_passwords_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.previous_passwords
    ADD CONSTRAINT previous_passwords_uk_1 UNIQUE (users_id, insert_instant);


--
-- Name: raw_application_daily_active_users raw_application_daily_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raw_application_daily_active_users
    ADD CONSTRAINT raw_application_daily_active_users_uk_1 UNIQUE (applications_id, day, users_id);


--
-- Name: raw_application_monthly_active_users raw_application_monthly_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raw_application_monthly_active_users
    ADD CONSTRAINT raw_application_monthly_active_users_uk_1 UNIQUE (applications_id, month, users_id);


--
-- Name: raw_application_registration_counts raw_application_registration_counts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raw_application_registration_counts
    ADD CONSTRAINT raw_application_registration_counts_pkey PRIMARY KEY (id);


--
-- Name: raw_global_daily_active_users raw_global_daily_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raw_global_daily_active_users
    ADD CONSTRAINT raw_global_daily_active_users_uk_1 UNIQUE (day, users_id);


--
-- Name: raw_global_monthly_active_users raw_global_monthly_active_users_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raw_global_monthly_active_users
    ADD CONSTRAINT raw_global_monthly_active_users_uk_1 UNIQUE (month, users_id);


--
-- Name: raw_global_registration_counts raw_global_registration_counts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raw_global_registration_counts
    ADD CONSTRAINT raw_global_registration_counts_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_uk_1 UNIQUE (token);


--
-- Name: refresh_tokens refresh_tokens_uk_2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_uk_2 UNIQUE (token_hash);


--
-- Name: refresh_tokens refresh_tokens_uk_3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_uk_3 UNIQUE (token_hash_n1);


--
-- Name: refresh_tokens refresh_tokens_uk_4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_uk_4 UNIQUE (token_seed);


--
-- Name: request_frequencies request_frequencies_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request_frequencies
    ADD CONSTRAINT request_frequencies_uk_1 UNIQUE (tenants_id, type, request_id);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- Name: tenants tenants_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_uk_1 UNIQUE (name);


--
-- Name: themes themes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);


--
-- Name: themes themes_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_uk_1 UNIQUE (name);


--
-- Name: usage_stats usage_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usage_stats
    ADD CONSTRAINT usage_stats_pkey PRIMARY KEY (collection_instant);


--
-- Name: user_action_logs user_action_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_action_logs
    ADD CONSTRAINT user_action_logs_pkey PRIMARY KEY (id);


--
-- Name: user_action_reasons user_action_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_action_reasons
    ADD CONSTRAINT user_action_reasons_pkey PRIMARY KEY (id);


--
-- Name: user_action_reasons user_action_reasons_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_action_reasons
    ADD CONSTRAINT user_action_reasons_uk_1 UNIQUE (text);


--
-- Name: user_action_reasons user_action_reasons_uk_2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_action_reasons
    ADD CONSTRAINT user_action_reasons_uk_2 UNIQUE (code);


--
-- Name: user_actions user_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_pkey PRIMARY KEY (id);


--
-- Name: user_actions user_actions_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_uk_1 UNIQUE (name);


--
-- Name: user_comments user_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_comments
    ADD CONSTRAINT user_comments_pkey PRIMARY KEY (id);


--
-- Name: user_consents_email_plus user_consents_email_plus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consents_email_plus
    ADD CONSTRAINT user_consents_email_plus_pkey PRIMARY KEY (id);


--
-- Name: user_consents user_consents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consents
    ADD CONSTRAINT user_consents_pkey PRIMARY KEY (id);


--
-- Name: user_registrations_application_roles user_registrations_application_roles_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_registrations_application_roles
    ADD CONSTRAINT user_registrations_application_roles_uk_1 UNIQUE (user_registrations_id, application_roles_id);


--
-- Name: user_registrations user_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_registrations
    ADD CONSTRAINT user_registrations_pkey PRIMARY KEY (id);


--
-- Name: user_registrations user_registrations_uk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_registrations
    ADD CONSTRAINT user_registrations_uk_1 UNIQUE (applications_id, users_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: webauthn_credentials webauthn_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_pkey PRIMARY KEY (id);


--
-- Name: webhook_attempt_logs webhook_attempt_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhook_attempt_logs
    ADD CONSTRAINT webhook_attempt_logs_pkey PRIMARY KEY (id);


--
-- Name: webhook_event_logs webhook_event_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhook_event_logs
    ADD CONSTRAINT webhook_event_logs_pkey PRIMARY KEY (id);


--
-- Name: webhooks webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks
    ADD CONSTRAINT webhooks_pkey PRIMARY KEY (id);


--
-- Name: webhooks_tenants webhooks_tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks_tenants
    ADD CONSTRAINT webhooks_tenants_pkey PRIMARY KEY (webhooks_id, tenants_id);


--
-- Name: applications_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX applications_i_1 ON public.applications USING btree (tenants_id);


--
-- Name: audit_logs_i1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX audit_logs_i1 ON public.audit_logs USING btree (insert_instant);


--
-- Name: entity_user_grants_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entity_user_grants_i_1 ON public.entity_user_grants USING btree (users_id);


--
-- Name: event_logs_i1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX event_logs_i1 ON public.event_logs USING btree (insert_instant);


--
-- Name: external_identifiers_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX external_identifiers_i_1 ON public.external_identifiers USING btree (tenants_id, type, insert_instant);


--
-- Name: external_identifiers_i_2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX external_identifiers_i_2 ON public.external_identifiers USING btree (type, users_id, applications_id);


--
-- Name: external_identifiers_i_3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX external_identifiers_i_3 ON public.external_identifiers USING btree (expiration_instant);


--
-- Name: families_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX families_i_1 ON public.families USING btree (users_id);


--
-- Name: group_members_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX group_members_i_1 ON public.group_members USING btree (users_id);


--
-- Name: identities_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX identities_i_1 ON public.identities USING btree (users_id);


--
-- Name: identity_provider_links_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX identity_provider_links_i_1 ON public.identity_provider_links USING btree (users_id);


--
-- Name: raw_logins_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX raw_logins_i_1 ON public.raw_logins USING btree (instant);


--
-- Name: raw_logins_i_2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX raw_logins_i_2 ON public.raw_logins USING btree (users_id, instant);


--
-- Name: refresh_tokens_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX refresh_tokens_i_1 ON public.refresh_tokens USING btree (start_instant);


--
-- Name: refresh_tokens_i_2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX refresh_tokens_i_2 ON public.refresh_tokens USING btree (applications_id);


--
-- Name: refresh_tokens_i_3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX refresh_tokens_i_3 ON public.refresh_tokens USING btree (users_id);


--
-- Name: refresh_tokens_i_4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX refresh_tokens_i_4 ON public.refresh_tokens USING btree (tenants_id);


--
-- Name: request_frequencies_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX request_frequencies_i_1 ON public.request_frequencies USING btree (tenants_id, type, last_update_instant);


--
-- Name: scim_external_id_groups_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scim_external_id_groups_i_1 ON public.scim_external_id_groups USING btree (entities_id, external_id);


--
-- Name: scim_external_id_groups_i_2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scim_external_id_groups_i_2 ON public.scim_external_id_groups USING btree (entities_id, groups_id);


--
-- Name: scim_external_id_users_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scim_external_id_users_i_1 ON public.scim_external_id_users USING btree (entities_id, external_id);


--
-- Name: scim_external_id_users_i_2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scim_external_id_users_i_2 ON public.scim_external_id_users USING btree (entities_id, users_id);


--
-- Name: user_action_logs_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_action_logs_i_1 ON public.user_action_logs USING btree (insert_instant);


--
-- Name: user_action_logs_i_2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_action_logs_i_2 ON public.user_action_logs USING btree (expiry, end_event_sent);


--
-- Name: user_comments_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_comments_i_1 ON public.user_comments USING btree (insert_instant);


--
-- Name: user_comments_i_2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_comments_i_2 ON public.user_comments USING btree (users_id);


--
-- Name: user_comments_i_3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_comments_i_3 ON public.user_comments USING btree (commenter_id);


--
-- Name: user_consents_email_plus_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_consents_email_plus_i_1 ON public.user_consents_email_plus USING btree (next_email_instant);


--
-- Name: user_registrations_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_registrations_i_1 ON public.user_registrations USING btree (clean_speak_id);


--
-- Name: user_registrations_i_2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_registrations_i_2 ON public.user_registrations USING btree (users_id);


--
-- Name: users_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_i_1 ON public.users USING btree (clean_speak_id);


--
-- Name: users_i_2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_i_2 ON public.users USING btree (parent_email);


--
-- Name: webauthn_credentials_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webauthn_credentials_i_1 ON public.webauthn_credentials USING btree (tenants_id, users_id);


--
-- Name: webhook_attempt_logs_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webhook_attempt_logs_i_1 ON public.webhook_attempt_logs USING btree (webhook_event_logs_id);


--
-- Name: webhook_attempt_logs_i_2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webhook_attempt_logs_i_2 ON public.webhook_attempt_logs USING btree (webhooks_id);


--
-- Name: webhook_event_logs_i_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webhook_event_logs_i_1 ON public.webhook_event_logs USING btree (insert_instant);


--
-- Name: application_daily_active_users application_daily_active_users_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_daily_active_users
    ADD CONSTRAINT application_daily_active_users_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: application_monthly_active_users application_monthly_active_users_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_monthly_active_users
    ADD CONSTRAINT application_monthly_active_users_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: application_oauth_scopes application_oauth_scopes_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_oauth_scopes
    ADD CONSTRAINT application_oauth_scopes_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: application_registration_counts application_registration_counts_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_registration_counts
    ADD CONSTRAINT application_registration_counts_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: application_roles application_roles_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_roles
    ADD CONSTRAINT application_roles_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: applications applications_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_1 FOREIGN KEY (verification_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_10 FOREIGN KEY (email_verification_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_11 FOREIGN KEY (forgot_password_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_12 FOREIGN KEY (passwordless_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_13 FOREIGN KEY (set_password_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_14 FOREIGN KEY (samlv2_default_verification_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_15 FOREIGN KEY (admin_registration_forms_id) REFERENCES public.forms(id);


--
-- Name: applications applications_fk_16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_16 FOREIGN KEY (samlv2_logout_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_17 FOREIGN KEY (samlv2_logout_default_verification_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_18 FOREIGN KEY (samlv2_single_logout_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_19 FOREIGN KEY (multi_factor_email_message_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_2 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: applications applications_fk_20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_20 FOREIGN KEY (multi_factor_sms_message_templates_id) REFERENCES public.message_templates(id);


--
-- Name: applications applications_fk_21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_21 FOREIGN KEY (self_service_user_forms_id) REFERENCES public.forms(id);


--
-- Name: applications applications_fk_22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_22 FOREIGN KEY (themes_id) REFERENCES public.themes(id);


--
-- Name: applications applications_fk_23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_23 FOREIGN KEY (email_verified_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_24 FOREIGN KEY (login_new_device_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_25 FOREIGN KEY (login_suspicious_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_26 FOREIGN KEY (password_reset_success_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_27 FOREIGN KEY (ui_ip_access_control_lists_id) REFERENCES public.ip_access_control_lists(id);


--
-- Name: applications applications_fk_28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_28 FOREIGN KEY (email_update_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_29 FOREIGN KEY (login_id_in_use_on_create_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_3 FOREIGN KEY (access_token_populate_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: applications applications_fk_30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_30 FOREIGN KEY (login_id_in_use_on_update_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_31 FOREIGN KEY (password_update_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_32 FOREIGN KEY (two_factor_method_add_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_33 FOREIGN KEY (two_factor_method_remove_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: applications applications_fk_34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_34 FOREIGN KEY (self_service_registration_validation_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: applications applications_fk_35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_35 FOREIGN KEY (userinfo_populate_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: applications applications_fk_36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_36 FOREIGN KEY (phone_configuration_passwordless_templates_id) REFERENCES public.message_templates(id);


--
-- Name: applications applications_fk_37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_37 FOREIGN KEY (phone_configuration_verification_templates_id) REFERENCES public.message_templates(id);


--
-- Name: applications applications_fk_38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_38 FOREIGN KEY (phone_configuration_verification_complete_templates_id) REFERENCES public.message_templates(id);


--
-- Name: applications applications_fk_39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_39 FOREIGN KEY (phone_configuration_forgot_password_templates_id) REFERENCES public.message_templates(id);


--
-- Name: applications applications_fk_4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_4 FOREIGN KEY (id_token_populate_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: applications applications_fk_40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_40 FOREIGN KEY (phone_configuration_set_password_templates_id) REFERENCES public.message_templates(id);


--
-- Name: applications applications_fk_41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_41 FOREIGN KEY (phone_configuration_identity_update_templates_id) REFERENCES public.message_templates(id);


--
-- Name: applications applications_fk_42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_42 FOREIGN KEY (phone_configuration_login_id_in_use_on_create_templates_id) REFERENCES public.message_templates(id);


--
-- Name: applications applications_fk_43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_43 FOREIGN KEY (phone_configuration_login_id_in_use_on_update_templates_id) REFERENCES public.message_templates(id);


--
-- Name: applications applications_fk_44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_44 FOREIGN KEY (phone_configuration_login_new_device_templates_id) REFERENCES public.message_templates(id);


--
-- Name: applications applications_fk_45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_45 FOREIGN KEY (phone_configuration_login_suspicious_templates_id) REFERENCES public.message_templates(id);


--
-- Name: applications applications_fk_46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_46 FOREIGN KEY (phone_configuration_password_reset_success_templates_id) REFERENCES public.message_templates(id);


--
-- Name: applications applications_fk_47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_47 FOREIGN KEY (phone_configuration_password_update_templates_id) REFERENCES public.message_templates(id);


--
-- Name: applications applications_fk_48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_48 FOREIGN KEY (phone_configuration_two_factor_method_add_templates_id) REFERENCES public.message_templates(id);


--
-- Name: applications applications_fk_49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_49 FOREIGN KEY (phone_configuration_two_factor_method_remove_templates_id) REFERENCES public.message_templates(id);


--
-- Name: applications applications_fk_5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_5 FOREIGN KEY (samlv2_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_6 FOREIGN KEY (samlv2_populate_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: applications applications_fk_7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_7 FOREIGN KEY (access_token_signing_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_8 FOREIGN KEY (id_token_signing_keys_id) REFERENCES public.keys(id);


--
-- Name: applications applications_fk_9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_fk_9 FOREIGN KEY (forms_id) REFERENCES public.forms(id);


--
-- Name: asynchronous_tasks asynchronous_tasks_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asynchronous_tasks
    ADD CONSTRAINT asynchronous_tasks_fk_1 FOREIGN KEY (nodes_id) REFERENCES public.nodes(id);


--
-- Name: authentication_keys authentication_keys_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_keys
    ADD CONSTRAINT authentication_keys_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: authentication_keys authentication_keys_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_keys
    ADD CONSTRAINT authentication_keys_fk_2 FOREIGN KEY (ip_access_control_lists_id) REFERENCES public.ip_access_control_lists(id);


--
-- Name: breached_password_metrics breached_password_metrics_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.breached_password_metrics
    ADD CONSTRAINT breached_password_metrics_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: clean_speak_applications clean_speak_applications_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clean_speak_applications
    ADD CONSTRAINT clean_speak_applications_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: connectors connectors_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connectors
    ADD CONSTRAINT connectors_fk_1 FOREIGN KEY (ssl_certificate_keys_id) REFERENCES public.keys(id);


--
-- Name: connectors connectors_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connectors
    ADD CONSTRAINT connectors_fk_2 FOREIGN KEY (reconcile_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: connectors_tenants connectors_tenants_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connectors_tenants
    ADD CONSTRAINT connectors_tenants_fk_1 FOREIGN KEY (connectors_id) REFERENCES public.connectors(id);


--
-- Name: connectors_tenants connectors_tenants_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connectors_tenants
    ADD CONSTRAINT connectors_tenants_fk_2 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: consents consents_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consents
    ADD CONSTRAINT consents_fk_1 FOREIGN KEY (consent_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: consents consents_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consents
    ADD CONSTRAINT consents_fk_2 FOREIGN KEY (email_plus_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: entities entities_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities
    ADD CONSTRAINT entities_fk_1 FOREIGN KEY (entity_types_id) REFERENCES public.entity_types(id) ON DELETE CASCADE;


--
-- Name: entities entities_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities
    ADD CONSTRAINT entities_fk_2 FOREIGN KEY (parent_id) REFERENCES public.entities(id) ON DELETE CASCADE;


--
-- Name: entities entities_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities
    ADD CONSTRAINT entities_fk_3 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id) ON DELETE CASCADE;


--
-- Name: entity_entity_grant_permissions entity_entity_grant_permissions_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_entity_grant_permissions
    ADD CONSTRAINT entity_entity_grant_permissions_fk_1 FOREIGN KEY (entity_entity_grants_id) REFERENCES public.entity_entity_grants(id) ON DELETE CASCADE;


--
-- Name: entity_entity_grant_permissions entity_entity_grant_permissions_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_entity_grant_permissions
    ADD CONSTRAINT entity_entity_grant_permissions_fk_2 FOREIGN KEY (entity_type_permissions_id) REFERENCES public.entity_type_permissions(id) ON DELETE CASCADE;


--
-- Name: entity_entity_grants entity_entity_grants_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_entity_grants
    ADD CONSTRAINT entity_entity_grants_fk_1 FOREIGN KEY (recipient_id) REFERENCES public.entities(id) ON DELETE CASCADE;


--
-- Name: entity_entity_grants entity_entity_grants_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_entity_grants
    ADD CONSTRAINT entity_entity_grants_fk_2 FOREIGN KEY (target_id) REFERENCES public.entities(id) ON DELETE CASCADE;


--
-- Name: entity_type_permissions entity_type_permissions_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_type_permissions
    ADD CONSTRAINT entity_type_permissions_fk_1 FOREIGN KEY (entity_types_id) REFERENCES public.entity_types(id) ON DELETE CASCADE;


--
-- Name: entity_types entity_types_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_types
    ADD CONSTRAINT entity_types_fk_1 FOREIGN KEY (access_token_signing_keys_id) REFERENCES public.keys(id);


--
-- Name: entity_user_grant_permissions entity_user_grant_permissions_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_user_grant_permissions
    ADD CONSTRAINT entity_user_grant_permissions_fk_1 FOREIGN KEY (entity_user_grants_id) REFERENCES public.entity_user_grants(id) ON DELETE CASCADE;


--
-- Name: entity_user_grant_permissions entity_user_grant_permissions_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_user_grant_permissions
    ADD CONSTRAINT entity_user_grant_permissions_fk_2 FOREIGN KEY (entity_type_permissions_id) REFERENCES public.entity_type_permissions(id) ON DELETE CASCADE;


--
-- Name: entity_user_grants entity_user_grants_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_user_grants
    ADD CONSTRAINT entity_user_grants_fk_1 FOREIGN KEY (entities_id) REFERENCES public.entities(id) ON DELETE CASCADE;


--
-- Name: entity_user_grants entity_user_grants_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_user_grants
    ADD CONSTRAINT entity_user_grants_fk_2 FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: external_identifiers external_identifiers_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_identifiers
    ADD CONSTRAINT external_identifiers_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: external_identifiers external_identifiers_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_identifiers
    ADD CONSTRAINT external_identifiers_fk_2 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: external_identifiers external_identifiers_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_identifiers
    ADD CONSTRAINT external_identifiers_fk_3 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: families families_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.families
    ADD CONSTRAINT families_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: federated_domains federated_domains_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_domains
    ADD CONSTRAINT federated_domains_fk_1 FOREIGN KEY (identity_providers_id) REFERENCES public.identity_providers(id);


--
-- Name: form_fields form_fields_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_fields
    ADD CONSTRAINT form_fields_fk_1 FOREIGN KEY (consents_id) REFERENCES public.consents(id);


--
-- Name: form_steps form_steps_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_steps
    ADD CONSTRAINT form_steps_fk_1 FOREIGN KEY (forms_id) REFERENCES public.forms(id);


--
-- Name: form_steps form_steps_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_steps
    ADD CONSTRAINT form_steps_fk_2 FOREIGN KEY (form_fields_id) REFERENCES public.form_fields(id);


--
-- Name: group_application_roles group_application_roles_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_application_roles
    ADD CONSTRAINT group_application_roles_fk_1 FOREIGN KEY (groups_id) REFERENCES public.groups(id);


--
-- Name: group_application_roles group_application_roles_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_application_roles
    ADD CONSTRAINT group_application_roles_fk_2 FOREIGN KEY (application_roles_id) REFERENCES public.application_roles(id);


--
-- Name: group_members group_members_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: group_members group_members_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_fk_2 FOREIGN KEY (groups_id) REFERENCES public.groups(id);


--
-- Name: groups groups_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: hourly_logins hourly_logins_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hourly_logins
    ADD CONSTRAINT hourly_logins_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: identities identities_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: identities identities_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_fk_2 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: identity_provider_links identity_provider_links_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_links
    ADD CONSTRAINT identity_provider_links_fk_1 FOREIGN KEY (identity_providers_id) REFERENCES public.identity_providers(id);


--
-- Name: identity_provider_links identity_provider_links_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_links
    ADD CONSTRAINT identity_provider_links_fk_2 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: identity_provider_links identity_provider_links_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_links
    ADD CONSTRAINT identity_provider_links_fk_3 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: identity_providers_applications identity_providers_applications_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_providers_applications
    ADD CONSTRAINT identity_providers_applications_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: identity_providers_applications identity_providers_applications_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_providers_applications
    ADD CONSTRAINT identity_providers_applications_fk_2 FOREIGN KEY (identity_providers_id) REFERENCES public.identity_providers(id);


--
-- Name: identity_providers_applications identity_providers_applications_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_providers_applications
    ADD CONSTRAINT identity_providers_applications_fk_3 FOREIGN KEY (keys_id) REFERENCES public.keys(id);


--
-- Name: identity_providers identity_providers_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_providers
    ADD CONSTRAINT identity_providers_fk_1 FOREIGN KEY (keys_id) REFERENCES public.keys(id);


--
-- Name: identity_providers identity_providers_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_providers
    ADD CONSTRAINT identity_providers_fk_2 FOREIGN KEY (reconcile_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: identity_providers identity_providers_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_providers
    ADD CONSTRAINT identity_providers_fk_3 FOREIGN KEY (request_signing_keys_id) REFERENCES public.keys(id);


--
-- Name: identity_providers_tenants identity_providers_tenants_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_providers_tenants
    ADD CONSTRAINT identity_providers_tenants_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: identity_providers_tenants identity_providers_tenants_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_providers_tenants
    ADD CONSTRAINT identity_providers_tenants_fk_2 FOREIGN KEY (identity_providers_id) REFERENCES public.identity_providers(id);


--
-- Name: instance instance_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instance
    ADD CONSTRAINT instance_fk_1 FOREIGN KEY (tenant_manager_applications_id) REFERENCES public.applications(id);


--
-- Name: previous_passwords previous_passwords_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.previous_passwords
    ADD CONSTRAINT previous_passwords_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: raw_logins raw_logins_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raw_logins
    ADD CONSTRAINT raw_logins_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: raw_logins raw_logins_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raw_logins
    ADD CONSTRAINT raw_logins_fk_2 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: refresh_tokens refresh_tokens_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: refresh_tokens refresh_tokens_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_fk_2 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: refresh_tokens refresh_tokens_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_fk_3 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: request_frequencies request_frequencies_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request_frequencies
    ADD CONSTRAINT request_frequencies_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: scim_external_id_groups scim_external_id_groups_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scim_external_id_groups
    ADD CONSTRAINT scim_external_id_groups_fk_1 FOREIGN KEY (entities_id) REFERENCES public.entities(id);


--
-- Name: scim_external_id_groups scim_external_id_groups_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scim_external_id_groups
    ADD CONSTRAINT scim_external_id_groups_fk_2 FOREIGN KEY (groups_id) REFERENCES public.groups(id);


--
-- Name: scim_external_id_users scim_external_id_users_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scim_external_id_users
    ADD CONSTRAINT scim_external_id_users_fk_1 FOREIGN KEY (entities_id) REFERENCES public.entities(id);


--
-- Name: scim_external_id_users scim_external_id_users_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scim_external_id_users
    ADD CONSTRAINT scim_external_id_users_fk_2 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: tenants tenants_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_1 FOREIGN KEY (forgot_password_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_10 FOREIGN KEY (access_token_signing_keys_id) REFERENCES public.keys(id);


--
-- Name: tenants tenants_fk_11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_11 FOREIGN KEY (id_token_signing_keys_id) REFERENCES public.keys(id);


--
-- Name: tenants tenants_fk_12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_12 FOREIGN KEY (admin_user_forms_id) REFERENCES public.forms(id);


--
-- Name: tenants tenants_fk_13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_13 FOREIGN KEY (multi_factor_email_message_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_14 FOREIGN KEY (multi_factor_sms_message_templates_id) REFERENCES public.message_templates(id);


--
-- Name: tenants tenants_fk_15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_15 FOREIGN KEY (multi_factor_sms_messengers_id) REFERENCES public.messengers(id);


--
-- Name: tenants tenants_fk_16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_16 FOREIGN KEY (client_credentials_access_token_populate_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: tenants tenants_fk_17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_17 FOREIGN KEY (email_update_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_18 FOREIGN KEY (email_verified_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_19 FOREIGN KEY (login_id_in_use_on_create_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_2 FOREIGN KEY (set_password_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_20 FOREIGN KEY (login_id_in_use_on_update_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_21 FOREIGN KEY (login_new_device_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_22 FOREIGN KEY (login_suspicious_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_23 FOREIGN KEY (password_reset_success_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_24 FOREIGN KEY (password_update_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_25 FOREIGN KEY (two_factor_method_add_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_26; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_26 FOREIGN KEY (two_factor_method_remove_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_27 FOREIGN KEY (ui_ip_access_control_lists_id) REFERENCES public.ip_access_control_lists(id);


--
-- Name: tenants tenants_fk_28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_28 FOREIGN KEY (scim_client_entity_types_id) REFERENCES public.entity_types(id);


--
-- Name: tenants tenants_fk_29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_29 FOREIGN KEY (scim_enterprise_user_request_converter_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: tenants tenants_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_3 FOREIGN KEY (verification_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_30 FOREIGN KEY (scim_enterprise_user_response_converter_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: tenants tenants_fk_31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_31 FOREIGN KEY (scim_group_request_converter_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: tenants tenants_fk_32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_32 FOREIGN KEY (scim_group_response_converter_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: tenants tenants_fk_33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_33 FOREIGN KEY (scim_server_entity_types_id) REFERENCES public.entity_types(id);


--
-- Name: tenants tenants_fk_34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_34 FOREIGN KEY (scim_user_request_converter_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: tenants tenants_fk_35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_35 FOREIGN KEY (scim_user_response_converter_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: tenants tenants_fk_36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_36 FOREIGN KEY (login_validation_lambdas_id) REFERENCES public.lambdas(id);


--
-- Name: tenants tenants_fk_37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_37 FOREIGN KEY (phone_configuration_messengers_id) REFERENCES public.messengers(id);


--
-- Name: tenants tenants_fk_38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_38 FOREIGN KEY (phone_configuration_passwordless_templates_id) REFERENCES public.message_templates(id);


--
-- Name: tenants tenants_fk_39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_39 FOREIGN KEY (phone_configuration_verification_templates_id) REFERENCES public.message_templates(id);


--
-- Name: tenants tenants_fk_4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_4 FOREIGN KEY (passwordless_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_40 FOREIGN KEY (phone_configuration_verification_complete_templates_id) REFERENCES public.message_templates(id);


--
-- Name: tenants tenants_fk_41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_41 FOREIGN KEY (phone_configuration_forgot_password_templates_id) REFERENCES public.message_templates(id);


--
-- Name: tenants tenants_fk_42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_42 FOREIGN KEY (phone_configuration_set_password_templates_id) REFERENCES public.message_templates(id);


--
-- Name: tenants tenants_fk_43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_43 FOREIGN KEY (phone_configuration_identity_update_templates_id) REFERENCES public.message_templates(id);


--
-- Name: tenants tenants_fk_44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_44 FOREIGN KEY (phone_configuration_login_id_in_use_on_create_templates_id) REFERENCES public.message_templates(id);


--
-- Name: tenants tenants_fk_45; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_45 FOREIGN KEY (phone_configuration_login_id_in_use_on_update_templates_id) REFERENCES public.message_templates(id);


--
-- Name: tenants tenants_fk_46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_46 FOREIGN KEY (phone_configuration_login_new_device_templates_id) REFERENCES public.message_templates(id);


--
-- Name: tenants tenants_fk_47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_47 FOREIGN KEY (phone_configuration_login_suspicious_templates_id) REFERENCES public.message_templates(id);


--
-- Name: tenants tenants_fk_48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_48 FOREIGN KEY (phone_configuration_password_reset_success_templates_id) REFERENCES public.message_templates(id);


--
-- Name: tenants tenants_fk_49; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_49 FOREIGN KEY (phone_configuration_password_update_templates_id) REFERENCES public.message_templates(id);


--
-- Name: tenants tenants_fk_5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_5 FOREIGN KEY (confirm_child_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_50 FOREIGN KEY (phone_configuration_two_factor_method_add_templates_id) REFERENCES public.message_templates(id);


--
-- Name: tenants tenants_fk_51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_51 FOREIGN KEY (phone_configuration_two_factor_method_remove_templates_id) REFERENCES public.message_templates(id);


--
-- Name: tenants tenants_fk_6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_6 FOREIGN KEY (family_request_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_7 FOREIGN KEY (parent_registration_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: tenants tenants_fk_8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_8 FOREIGN KEY (failed_authentication_user_actions_id) REFERENCES public.user_actions(id);


--
-- Name: tenants tenants_fk_9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_fk_9 FOREIGN KEY (themes_id) REFERENCES public.themes(id);


--
-- Name: user_action_logs_applications user_action_logs_applications_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_action_logs_applications
    ADD CONSTRAINT user_action_logs_applications_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id) ON DELETE CASCADE;


--
-- Name: user_action_logs_applications user_action_logs_applications_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_action_logs_applications
    ADD CONSTRAINT user_action_logs_applications_fk_2 FOREIGN KEY (user_action_logs_id) REFERENCES public.user_action_logs(id) ON DELETE CASCADE;


--
-- Name: user_action_logs user_action_logs_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_action_logs
    ADD CONSTRAINT user_action_logs_fk_1 FOREIGN KEY (actioner_users_id) REFERENCES public.users(id);


--
-- Name: user_action_logs user_action_logs_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_action_logs
    ADD CONSTRAINT user_action_logs_fk_2 FOREIGN KEY (actionee_users_id) REFERENCES public.users(id);


--
-- Name: user_action_logs user_action_logs_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_action_logs
    ADD CONSTRAINT user_action_logs_fk_3 FOREIGN KEY (user_actions_id) REFERENCES public.user_actions(id);


--
-- Name: user_actions user_actions_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_fk_1 FOREIGN KEY (cancel_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: user_actions user_actions_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_fk_2 FOREIGN KEY (end_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: user_actions user_actions_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_fk_3 FOREIGN KEY (modify_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: user_actions user_actions_fk_4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_actions
    ADD CONSTRAINT user_actions_fk_4 FOREIGN KEY (start_email_templates_id) REFERENCES public.email_templates(id);


--
-- Name: user_comments user_comments_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_comments
    ADD CONSTRAINT user_comments_fk_1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: user_comments user_comments_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_comments
    ADD CONSTRAINT user_comments_fk_2 FOREIGN KEY (commenter_id) REFERENCES public.users(id);


--
-- Name: user_consents_email_plus user_consents_email_plus_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consents_email_plus
    ADD CONSTRAINT user_consents_email_plus_fk_1 FOREIGN KEY (user_consents_id) REFERENCES public.user_consents(id);


--
-- Name: user_consents user_consents_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consents
    ADD CONSTRAINT user_consents_fk_1 FOREIGN KEY (consents_id) REFERENCES public.consents(id);


--
-- Name: user_consents user_consents_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consents
    ADD CONSTRAINT user_consents_fk_2 FOREIGN KEY (giver_users_id) REFERENCES public.users(id);


--
-- Name: user_consents user_consents_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consents
    ADD CONSTRAINT user_consents_fk_3 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: user_registrations_application_roles user_registrations_application_roles_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_registrations_application_roles
    ADD CONSTRAINT user_registrations_application_roles_fk_1 FOREIGN KEY (user_registrations_id) REFERENCES public.user_registrations(id);


--
-- Name: user_registrations_application_roles user_registrations_application_roles_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_registrations_application_roles
    ADD CONSTRAINT user_registrations_application_roles_fk_2 FOREIGN KEY (application_roles_id) REFERENCES public.application_roles(id);


--
-- Name: user_registrations user_registrations_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_registrations
    ADD CONSTRAINT user_registrations_fk_1 FOREIGN KEY (applications_id) REFERENCES public.applications(id);


--
-- Name: user_registrations user_registrations_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_registrations
    ADD CONSTRAINT user_registrations_fk_2 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: users users_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: webauthn_credentials webauthn_credentials_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_fk_1 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- Name: webauthn_credentials webauthn_credentials_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_fk_2 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: webhook_attempt_logs webhook_attempt_logs_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhook_attempt_logs
    ADD CONSTRAINT webhook_attempt_logs_fk_1 FOREIGN KEY (webhook_event_logs_id) REFERENCES public.webhook_event_logs(id);


--
-- Name: webhook_attempt_logs webhook_attempt_logs_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhook_attempt_logs
    ADD CONSTRAINT webhook_attempt_logs_fk_2 FOREIGN KEY (webhooks_id) REFERENCES public.webhooks(id);


--
-- Name: webhooks webhooks_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks
    ADD CONSTRAINT webhooks_fk_1 FOREIGN KEY (ssl_certificate_keys_id) REFERENCES public.keys(id);


--
-- Name: webhooks webhooks_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks
    ADD CONSTRAINT webhooks_fk_2 FOREIGN KEY (signing_keys_id) REFERENCES public.keys(id);


--
-- Name: webhooks_tenants webhooks_tenants_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks_tenants
    ADD CONSTRAINT webhooks_tenants_fk_1 FOREIGN KEY (webhooks_id) REFERENCES public.webhooks(id);


--
-- Name: webhooks_tenants webhooks_tenants_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhooks_tenants
    ADD CONSTRAINT webhooks_tenants_fk_2 FOREIGN KEY (tenants_id) REFERENCES public.tenants(id);


--
-- PostgreSQL database dump complete
--

\unrestrict EP8nRn8kgELKkBMj96IDFUKNJWS0aC9Buax7L9WAti4Mt0H68q4sq7BVd1ae3jA

