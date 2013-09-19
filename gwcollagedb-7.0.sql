--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: action; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE action (
    actionid integer NOT NULL,
    actiontypeid integer NOT NULL,
    name character varying(256) NOT NULL,
    description character varying(512)
);


ALTER TABLE public.action OWNER TO collage;

--
-- Name: action_actionid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE action_actionid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_actionid_seq OWNER TO collage;

--
-- Name: action_actionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE action_actionid_seq OWNED BY action.actionid;


--
-- Name: actionparameter; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE actionparameter (
    actionparameterid integer NOT NULL,
    actionid integer NOT NULL,
    name character varying(128) NOT NULL,
    value text
);


ALTER TABLE public.actionparameter OWNER TO collage;

--
-- Name: actionparameter_actionparameterid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE actionparameter_actionparameterid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actionparameter_actionparameterid_seq OWNER TO collage;

--
-- Name: actionparameter_actionparameterid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE actionparameter_actionparameterid_seq OWNED BY actionparameter.actionparameterid;


--
-- Name: actionproperty; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE actionproperty (
    actionpropertyid integer NOT NULL,
    actionid integer NOT NULL,
    name character varying(128) NOT NULL,
    value text
);


ALTER TABLE public.actionproperty OWNER TO collage;

--
-- Name: actionproperty_actionpropertyid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE actionproperty_actionpropertyid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actionproperty_actionpropertyid_seq OWNER TO collage;

--
-- Name: actionproperty_actionpropertyid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE actionproperty_actionpropertyid_seq OWNED BY actionproperty.actionpropertyid;


--
-- Name: actiontype; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE actiontype (
    actiontypeid integer NOT NULL,
    name character varying(256) NOT NULL,
    classname character varying(256) NOT NULL
);


ALTER TABLE public.actiontype OWNER TO collage;

--
-- Name: actiontype_actiontypeid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE actiontype_actiontypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actiontype_actiontypeid_seq OWNER TO collage;

--
-- Name: actiontype_actiontypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE actiontype_actiontypeid_seq OWNED BY actiontype.actiontypeid;


--
-- Name: applicationaction; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE applicationaction (
    applicationtypeid integer NOT NULL,
    actionid integer NOT NULL
);


ALTER TABLE public.applicationaction OWNER TO collage;

--
-- Name: applicationentityproperty; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE applicationentityproperty (
    applicationentitypropertyid integer NOT NULL,
    applicationtypeid integer NOT NULL,
    entitytypeid integer NOT NULL,
    propertytypeid integer NOT NULL,
    sortorder integer DEFAULT (999)::numeric NOT NULL
);


ALTER TABLE public.applicationentityproperty OWNER TO collage;

--
-- Name: applicationentityproperty_applicationentitypropertyid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE applicationentityproperty_applicationentitypropertyid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.applicationentityproperty_applicationentitypropertyid_seq OWNER TO collage;

--
-- Name: applicationentityproperty_applicationentitypropertyid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE applicationentityproperty_applicationentitypropertyid_seq OWNED BY applicationentityproperty.applicationentitypropertyid;


--
-- Name: applicationtype; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE applicationtype (
    applicationtypeid integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(254),
    statetransitioncriteria character varying(512)
);


ALTER TABLE public.applicationtype OWNER TO collage;

--
-- Name: applicationtype_applicationtypeid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE applicationtype_applicationtypeid_seq
    START WITH 101
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.applicationtype_applicationtypeid_seq OWNER TO collage;

--
-- Name: applicationtype_applicationtypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE applicationtype_applicationtypeid_seq OWNED BY applicationtype.applicationtypeid;


--
-- Name: category; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE category (
    categoryid integer NOT NULL,
    name character varying(254) NOT NULL,
    description character varying(4096),
    entitytypeid integer NOT NULL
);


ALTER TABLE public.category OWNER TO collage;

--
-- Name: category_categoryid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE category_categoryid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_categoryid_seq OWNER TO collage;

--
-- Name: category_categoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE category_categoryid_seq OWNED BY category.categoryid;


--
-- Name: categoryentity; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE categoryentity (
    categoryentityid integer NOT NULL,
    objectid integer DEFAULT 0 NOT NULL,
    categoryid integer DEFAULT 0 NOT NULL,
    entitytypeid integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.categoryentity OWNER TO collage;

--
-- Name: categoryentity_categoryentityid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE categoryentity_categoryentityid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoryentity_categoryentityid_seq OWNER TO collage;

--
-- Name: categoryentity_categoryentityid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE categoryentity_categoryentityid_seq OWNED BY categoryentity.categoryentityid;


--
-- Name: categoryhierarchy; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE categoryhierarchy (
    categoryid integer DEFAULT 0 NOT NULL,
    parentid integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.categoryhierarchy OWNER TO collage;

--
-- Name: checktype; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE checktype (
    checktypeid integer NOT NULL,
    name character varying(254) NOT NULL,
    description character varying(254)
);


ALTER TABLE public.checktype OWNER TO collage;

--
-- Name: checktype_checktypeid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE checktype_checktypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checktype_checktypeid_seq OWNER TO collage;

--
-- Name: checktype_checktypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE checktype_checktypeid_seq OWNED BY checktype.checktypeid;


--
-- Name: component; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE component (
    componentid integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(254)
);


ALTER TABLE public.component OWNER TO collage;

--
-- Name: component_componentid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE component_componentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.component_componentid_seq OWNER TO collage;

--
-- Name: component_componentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE component_componentid_seq OWNED BY component.componentid;


--
-- Name: consolidationcriteria; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE consolidationcriteria (
    consolidationcriteriaid integer NOT NULL,
    name character varying(254) NOT NULL,
    criteria character varying(512) NOT NULL
);


ALTER TABLE public.consolidationcriteria OWNER TO collage;

--
-- Name: consolidationcriteria_consolidationcriteriaid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE consolidationcriteria_consolidationcriteriaid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consolidationcriteria_consolidationcriteriaid_seq OWNER TO collage;

--
-- Name: consolidationcriteria_consolidationcriteriaid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE consolidationcriteria_consolidationcriteriaid_seq OWNED BY consolidationcriteria.consolidationcriteriaid;


--
-- Name: device; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE device (
    deviceid integer NOT NULL,
    displayname character varying(254),
    identification character varying(128) NOT NULL,
    description character varying(254)
);


ALTER TABLE public.device OWNER TO collage;

--
-- Name: device_deviceid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE device_deviceid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_deviceid_seq OWNER TO collage;

--
-- Name: device_deviceid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE device_deviceid_seq OWNED BY device.deviceid;


--
-- Name: deviceparent; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE deviceparent (
    deviceid integer NOT NULL,
    parentid integer NOT NULL
);


ALTER TABLE public.deviceparent OWNER TO collage;

--
-- Name: entity; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE entity (
    entityid integer NOT NULL,
    name character varying(254) NOT NULL,
    description character varying(254) NOT NULL,
    class character varying(254) NOT NULL,
    applicationtypeid integer NOT NULL
);


ALTER TABLE public.entity OWNER TO collage;

--
-- Name: entity_entityid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE entity_entityid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entity_entityid_seq OWNER TO collage;

--
-- Name: entity_entityid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE entity_entityid_seq OWNED BY entity.entityid;


--
-- Name: entityproperty; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE entityproperty (
    entitytypeid integer NOT NULL,
    objectid integer NOT NULL,
    propertytypeid integer NOT NULL,
    valuestring character varying(4096),
    valuedate timestamp without time zone,
    valueboolean boolean,
    valueinteger integer,
    valuelong bigint,
    valuedouble double precision,
    lasteditedon timestamp without time zone DEFAULT now() NOT NULL,
    createdon timestamp without time zone NOT NULL
);


ALTER TABLE public.entityproperty OWNER TO collage;

--
-- Name: entitytype; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE entitytype (
    entitytypeid integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(254),
    islogicalentity boolean DEFAULT false NOT NULL,
    isapplicationtypesupported boolean DEFAULT false NOT NULL
);


ALTER TABLE public.entitytype OWNER TO collage;

--
-- Name: entitytype_entitytypeid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE entitytype_entitytypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entitytype_entitytypeid_seq OWNER TO collage;

--
-- Name: entitytype_entitytypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE entitytype_entitytypeid_seq OWNED BY entitytype.entitytypeid;


--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1000
    INCREMENT BY 1
    MINVALUE 1000
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- Name: host; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE host (
    hostid integer NOT NULL,
    deviceid integer NOT NULL,
    hostname character varying(254) NOT NULL,
    description character varying(4096),
    applicationtypeid integer,
    agentid character varying(128)
);


ALTER TABLE public.host OWNER TO collage;

--
-- Name: host_hostid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE host_hostid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.host_hostid_seq OWNER TO collage;

--
-- Name: host_hostid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE host_hostid_seq OWNED BY host.hostid;


--
-- Name: hostgroup; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE hostgroup (
    hostgroupid integer NOT NULL,
    name character varying(254) NOT NULL,
    description character varying(4096),
    applicationtypeid integer,
    alias character varying(254),
    agentid character varying(128)
);


ALTER TABLE public.hostgroup OWNER TO collage;

--
-- Name: hostgroup_hostgroupid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE hostgroup_hostgroupid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hostgroup_hostgroupid_seq OWNER TO collage;

--
-- Name: hostgroup_hostgroupid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE hostgroup_hostgroupid_seq OWNED BY hostgroup.hostgroupid;


--
-- Name: hostgroupcollection; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE hostgroupcollection (
    hostid integer NOT NULL,
    hostgroupid integer NOT NULL
);


ALTER TABLE public.hostgroupcollection OWNER TO collage;

--
-- Name: hoststatus; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE hoststatus (
    hoststatusid integer NOT NULL,
    applicationtypeid integer NOT NULL,
    monitorstatusid integer NOT NULL,
    lastchecktime timestamp without time zone,
    checktypeid integer,
    statetypeid integer,
    nextchecktime timestamp without time zone
);


ALTER TABLE public.hoststatus OWNER TO collage;

--
-- Name: hoststatusproperty; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE hoststatusproperty (
    hoststatusid integer NOT NULL,
    propertytypeid integer NOT NULL,
    valuestring character varying(32768),
    valuedate timestamp without time zone,
    valueboolean boolean,
    valueinteger integer,
    valuelong bigint,
    valuedouble double precision,
    lasteditedon timestamp without time zone DEFAULT now() NOT NULL,
    createdon timestamp without time zone NOT NULL
);


ALTER TABLE public.hoststatusproperty OWNER TO collage;

--
-- Name: logmessage; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE logmessage (
    logmessageid integer NOT NULL,
    applicationtypeid integer NOT NULL,
    deviceid integer NOT NULL,
    hoststatusid integer,
    servicestatusid integer,
    textmessage character varying(4096) NOT NULL,
    msgcount integer DEFAULT (1)::numeric NOT NULL,
    firstinsertdate timestamp without time zone NOT NULL,
    lastinsertdate timestamp without time zone NOT NULL,
    reportdate timestamp without time zone NOT NULL,
    monitorstatusid integer,
    severityid integer NOT NULL,
    applicationseverityid integer NOT NULL,
    priorityid integer NOT NULL,
    typeruleid integer NOT NULL,
    componentid integer NOT NULL,
    operationstatusid integer NOT NULL,
    isstatechanged boolean DEFAULT false NOT NULL,
    consolidationhash integer DEFAULT 0 NOT NULL,
    statelesshash integer DEFAULT 0 NOT NULL,
    statetransitionhash integer
);


ALTER TABLE public.logmessage OWNER TO collage;

--
-- Name: logmessage_logmessageid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE logmessage_logmessageid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logmessage_logmessageid_seq OWNER TO collage;

--
-- Name: logmessage_logmessageid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE logmessage_logmessageid_seq OWNED BY logmessage.logmessageid;


--
-- Name: logmessageproperty; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE logmessageproperty (
    logmessageid integer NOT NULL,
    propertytypeid integer NOT NULL,
    valuestring character varying(4096),
    valuedate timestamp without time zone,
    valueboolean boolean,
    valueinteger integer,
    valuelong bigint,
    valuedouble double precision,
    lasteditedon timestamp without time zone DEFAULT now() NOT NULL,
    createdon timestamp without time zone NOT NULL
);


ALTER TABLE public.logmessageproperty OWNER TO collage;

--
-- Name: logperformancedata; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE logperformancedata (
    logperformancedataid integer NOT NULL,
    servicestatusid integer NOT NULL,
    lastchecktime timestamp without time zone NOT NULL,
    maximum double precision DEFAULT 0,
    minimum double precision DEFAULT 0,
    average double precision DEFAULT 0,
    measurementpoints integer DEFAULT 0,
    performancedatalabelid integer
);


ALTER TABLE public.logperformancedata OWNER TO collage;

--
-- Name: logperformancedata_logperformancedataid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE logperformancedata_logperformancedataid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logperformancedata_logperformancedataid_seq OWNER TO collage;

--
-- Name: logperformancedata_logperformancedataid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE logperformancedata_logperformancedataid_seq OWNED BY logperformancedata.logperformancedataid;


--
-- Name: messagefilter; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE messagefilter (
    messagefilterid integer NOT NULL,
    name character varying(254) NOT NULL,
    regexpresion character varying(512) NOT NULL,
    ischangeseveritytostatistic boolean DEFAULT false
);


ALTER TABLE public.messagefilter OWNER TO collage;

--
-- Name: messagefilter_messagefilterid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE messagefilter_messagefilterid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messagefilter_messagefilterid_seq OWNER TO collage;

--
-- Name: messagefilter_messagefilterid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE messagefilter_messagefilterid_seq OWNED BY messagefilter.messagefilterid;


--
-- Name: monitorlist; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE monitorlist (
    monitorserverid integer NOT NULL,
    deviceid integer NOT NULL
);


ALTER TABLE public.monitorlist OWNER TO collage;

--
-- Name: monitorserver; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE monitorserver (
    monitorserverid integer NOT NULL,
    monitorservername character varying(254) NOT NULL,
    ip character varying(128) NOT NULL,
    description character varying(254)
);


ALTER TABLE public.monitorserver OWNER TO collage;

--
-- Name: monitorserver_monitorserverid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE monitorserver_monitorserverid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.monitorserver_monitorserverid_seq OWNER TO collage;

--
-- Name: monitorserver_monitorserverid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE monitorserver_monitorserverid_seq OWNED BY monitorserver.monitorserverid;


--
-- Name: monitorstatus; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE monitorstatus (
    monitorstatusid integer NOT NULL,
    name character varying(254) NOT NULL,
    description character varying(254)
);


ALTER TABLE public.monitorstatus OWNER TO collage;

--
-- Name: monitorstatus_monitorstatusid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE monitorstatus_monitorstatusid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.monitorstatus_monitorstatusid_seq OWNER TO collage;

--
-- Name: monitorstatus_monitorstatusid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE monitorstatus_monitorstatusid_seq OWNED BY monitorstatus.monitorstatusid;


--
-- Name: network_service_notifications; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE network_service_notifications (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT ('now'::text)::timestamp(0) with time zone,
    guid integer,
    type character varying(20),
    title character varying(255) DEFAULT ''::character varying,
    critical integer,
    description text DEFAULT ''::text,
    webpage_url text DEFAULT ''::text,
    webpage_url_description text DEFAULT ''::text,
    update_md5 character varying(255) DEFAULT ''::character varying,
    update_url character varying(255) DEFAULT ''::character varying,
    update_cmd_switch character varying(255) DEFAULT ''::character varying,
    update_instruction text DEFAULT ''::text,
    update_size integer,
    update_type character varying(255) DEFAULT ''::character varying,
    update_os character varying(255) DEFAULT ''::character varying,
    is_read integer DEFAULT 0,
    is_archived integer DEFAULT 0
);


ALTER TABLE public.network_service_notifications OWNER TO collage;

--
-- Name: network_service_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE network_service_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.network_service_notifications_id_seq OWNER TO collage;

--
-- Name: network_service_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE network_service_notifications_id_seq OWNED BY network_service_notifications.id;


--
-- Name: network_service_short_news; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE network_service_short_news (
    id integer NOT NULL,
    status integer,
    title character varying(255) DEFAULT ''::character varying,
    message text DEFAULT ''::text,
    url character varying(255) DEFAULT ''::character varying,
    url_description text DEFAULT ''::text,
    is_archived integer DEFAULT 0
);


ALTER TABLE public.network_service_short_news OWNER TO collage;

--
-- Name: network_service_short_news_id_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE network_service_short_news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.network_service_short_news_id_seq OWNER TO collage;

--
-- Name: network_service_short_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE network_service_short_news_id_seq OWNED BY network_service_short_news.id;


--
-- Name: network_service_status; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE network_service_status (
    id integer NOT NULL,
    last_checked timestamp without time zone
);


ALTER TABLE public.network_service_status OWNER TO collage;

--
-- Name: network_service_status_id_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE network_service_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.network_service_status_id_seq OWNER TO collage;

--
-- Name: network_service_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE network_service_status_id_seq OWNED BY network_service_status.id;


--
-- Name: operationstatus; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE operationstatus (
    operationstatusid integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(254)
);


ALTER TABLE public.operationstatus OWNER TO collage;

--
-- Name: operationstatus_operationstatusid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE operationstatus_operationstatusid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operationstatus_operationstatusid_seq OWNER TO collage;

--
-- Name: operationstatus_operationstatusid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE operationstatus_operationstatusid_seq OWNED BY operationstatus.operationstatusid;


--
-- Name: performancedatalabel; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE performancedatalabel (
    performancedatalabelid integer NOT NULL,
    performancename character varying(254),
    servicedisplayname character varying(128),
    metriclabel character varying(128),
    unit character varying(64)
);


ALTER TABLE public.performancedatalabel OWNER TO collage;

--
-- Name: performancedatalabel_performancedatalabelid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE performancedatalabel_performancedatalabelid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.performancedatalabel_performancedatalabelid_seq OWNER TO collage;

--
-- Name: performancedatalabel_performancedatalabelid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE performancedatalabel_performancedatalabelid_seq OWNED BY performancedatalabel.performancedatalabelid;


--
-- Name: plugin; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE plugin (
    pluginid integer NOT NULL,
    name character varying(128) NOT NULL,
    url character varying(254),
    platformid integer NOT NULL,
    dependencies character varying(254),
    lastupdatetimestamp timestamp without time zone DEFAULT now() NOT NULL,
    checksum character varying(254) NOT NULL,
    lastupdatedby character varying(254)
);


ALTER TABLE public.plugin OWNER TO collage;

--
-- Name: plugin_pluginid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE plugin_pluginid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plugin_pluginid_seq OWNER TO collage;

--
-- Name: plugin_pluginid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE plugin_pluginid_seq OWNED BY plugin.pluginid;


--
-- Name: pluginplatform; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE pluginplatform (
    platformid integer NOT NULL,
    name character varying(128) NOT NULL,
    arch integer NOT NULL,
    description character varying(254)
);


ALTER TABLE public.pluginplatform OWNER TO collage;

--
-- Name: pluginplatform_platformid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE pluginplatform_platformid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pluginplatform_platformid_seq OWNER TO collage;

--
-- Name: pluginplatform_platformid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE pluginplatform_platformid_seq OWNED BY pluginplatform.platformid;


--
-- Name: priority; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE priority (
    priorityid integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(254)
);


ALTER TABLE public.priority OWNER TO collage;

--
-- Name: priority_priorityid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE priority_priorityid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.priority_priorityid_seq OWNER TO collage;

--
-- Name: priority_priorityid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE priority_priorityid_seq OWNED BY priority.priorityid;


--
-- Name: propertytype; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE propertytype (
    propertytypeid integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(254),
    isdate boolean DEFAULT false,
    isboolean boolean DEFAULT false,
    isstring boolean DEFAULT false,
    isinteger boolean DEFAULT false,
    islong boolean DEFAULT false,
    isdouble boolean DEFAULT false,
    isvisible boolean DEFAULT true
);


ALTER TABLE public.propertytype OWNER TO collage;

--
-- Name: propertytype_propertytypeid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE propertytype_propertytypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.propertytype_propertytypeid_seq OWNER TO collage;

--
-- Name: propertytype_propertytypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE propertytype_propertytypeid_seq OWNED BY propertytype.propertytypeid;


--
-- Name: schemainfo; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE schemainfo (
    name character varying(254),
    value character varying(254)
);


ALTER TABLE public.schemainfo OWNER TO collage;

--
-- Name: servicestatus; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE servicestatus (
    servicestatusid integer NOT NULL,
    applicationtypeid integer NOT NULL,
    servicedescription character varying(254) NOT NULL,
    hostid integer NOT NULL,
    monitorstatusid integer NOT NULL,
    lastchecktime timestamp without time zone,
    nextchecktime timestamp without time zone,
    laststatechange timestamp without time zone,
    lasthardstateid integer NOT NULL,
    statetypeid integer NOT NULL,
    checktypeid integer NOT NULL,
    metrictype character varying(254),
    domain character varying(254),
    agentid character varying(128)
);


ALTER TABLE public.servicestatus OWNER TO collage;

--
-- Name: servicestatus_servicestatusid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE servicestatus_servicestatusid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.servicestatus_servicestatusid_seq OWNER TO collage;

--
-- Name: servicestatus_servicestatusid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE servicestatus_servicestatusid_seq OWNED BY servicestatus.servicestatusid;


--
-- Name: servicestatusproperty; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE servicestatusproperty (
    servicestatusid integer NOT NULL,
    propertytypeid integer NOT NULL,
    valuestring character varying(16384),
    valuedate timestamp without time zone,
    valueboolean boolean,
    valueinteger integer,
    valuelong bigint,
    valuedouble double precision,
    lasteditedon timestamp without time zone DEFAULT now() NOT NULL,
    createdon timestamp without time zone NOT NULL
);


ALTER TABLE public.servicestatusproperty OWNER TO collage;

--
-- Name: severity; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE severity (
    severityid integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(254)
);


ALTER TABLE public.severity OWNER TO collage;

--
-- Name: severity_severityid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE severity_severityid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.severity_severityid_seq OWNER TO collage;

--
-- Name: severity_severityid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE severity_severityid_seq OWNED BY severity.severityid;


--
-- Name: statetype; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE statetype (
    statetypeid integer NOT NULL,
    name character varying(254) NOT NULL,
    description character varying(254)
);


ALTER TABLE public.statetype OWNER TO collage;

--
-- Name: statetype_statetypeid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE statetype_statetypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statetype_statetypeid_seq OWNER TO collage;

--
-- Name: statetype_statetypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE statetype_statetypeid_seq OWNED BY statetype.statetypeid;


--
-- Name: typerule; Type: TABLE; Schema: public; Owner: collage; Tablespace: 
--

CREATE TABLE typerule (
    typeruleid integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(254)
);


ALTER TABLE public.typerule OWNER TO collage;

--
-- Name: typerule_typeruleid_seq; Type: SEQUENCE; Schema: public; Owner: collage
--

CREATE SEQUENCE typerule_typeruleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.typerule_typeruleid_seq OWNER TO collage;

--
-- Name: typerule_typeruleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collage
--

ALTER SEQUENCE typerule_typeruleid_seq OWNED BY typerule.typeruleid;


--
-- Name: actionid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY action ALTER COLUMN actionid SET DEFAULT nextval('action_actionid_seq'::regclass);


--
-- Name: actionparameterid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY actionparameter ALTER COLUMN actionparameterid SET DEFAULT nextval('actionparameter_actionparameterid_seq'::regclass);


--
-- Name: actionpropertyid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY actionproperty ALTER COLUMN actionpropertyid SET DEFAULT nextval('actionproperty_actionpropertyid_seq'::regclass);


--
-- Name: actiontypeid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY actiontype ALTER COLUMN actiontypeid SET DEFAULT nextval('actiontype_actiontypeid_seq'::regclass);


--
-- Name: applicationentitypropertyid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY applicationentityproperty ALTER COLUMN applicationentitypropertyid SET DEFAULT nextval('applicationentityproperty_applicationentitypropertyid_seq'::regclass);


--
-- Name: applicationtypeid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY applicationtype ALTER COLUMN applicationtypeid SET DEFAULT nextval('applicationtype_applicationtypeid_seq'::regclass);


--
-- Name: categoryid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY category ALTER COLUMN categoryid SET DEFAULT nextval('category_categoryid_seq'::regclass);


--
-- Name: categoryentityid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY categoryentity ALTER COLUMN categoryentityid SET DEFAULT nextval('categoryentity_categoryentityid_seq'::regclass);


--
-- Name: checktypeid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY checktype ALTER COLUMN checktypeid SET DEFAULT nextval('checktype_checktypeid_seq'::regclass);


--
-- Name: componentid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY component ALTER COLUMN componentid SET DEFAULT nextval('component_componentid_seq'::regclass);


--
-- Name: consolidationcriteriaid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY consolidationcriteria ALTER COLUMN consolidationcriteriaid SET DEFAULT nextval('consolidationcriteria_consolidationcriteriaid_seq'::regclass);


--
-- Name: deviceid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY device ALTER COLUMN deviceid SET DEFAULT nextval('device_deviceid_seq'::regclass);


--
-- Name: entityid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY entity ALTER COLUMN entityid SET DEFAULT nextval('entity_entityid_seq'::regclass);


--
-- Name: entitytypeid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY entitytype ALTER COLUMN entitytypeid SET DEFAULT nextval('entitytype_entitytypeid_seq'::regclass);


--
-- Name: hostid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY host ALTER COLUMN hostid SET DEFAULT nextval('host_hostid_seq'::regclass);


--
-- Name: hostgroupid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY hostgroup ALTER COLUMN hostgroupid SET DEFAULT nextval('hostgroup_hostgroupid_seq'::regclass);


--
-- Name: logmessageid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY logmessage ALTER COLUMN logmessageid SET DEFAULT nextval('logmessage_logmessageid_seq'::regclass);


--
-- Name: logperformancedataid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY logperformancedata ALTER COLUMN logperformancedataid SET DEFAULT nextval('logperformancedata_logperformancedataid_seq'::regclass);


--
-- Name: messagefilterid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY messagefilter ALTER COLUMN messagefilterid SET DEFAULT nextval('messagefilter_messagefilterid_seq'::regclass);


--
-- Name: monitorserverid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY monitorserver ALTER COLUMN monitorserverid SET DEFAULT nextval('monitorserver_monitorserverid_seq'::regclass);


--
-- Name: monitorstatusid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY monitorstatus ALTER COLUMN monitorstatusid SET DEFAULT nextval('monitorstatus_monitorstatusid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY network_service_notifications ALTER COLUMN id SET DEFAULT nextval('network_service_notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY network_service_short_news ALTER COLUMN id SET DEFAULT nextval('network_service_short_news_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY network_service_status ALTER COLUMN id SET DEFAULT nextval('network_service_status_id_seq'::regclass);


--
-- Name: operationstatusid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY operationstatus ALTER COLUMN operationstatusid SET DEFAULT nextval('operationstatus_operationstatusid_seq'::regclass);


--
-- Name: performancedatalabelid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY performancedatalabel ALTER COLUMN performancedatalabelid SET DEFAULT nextval('performancedatalabel_performancedatalabelid_seq'::regclass);


--
-- Name: pluginid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY plugin ALTER COLUMN pluginid SET DEFAULT nextval('plugin_pluginid_seq'::regclass);


--
-- Name: platformid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY pluginplatform ALTER COLUMN platformid SET DEFAULT nextval('pluginplatform_platformid_seq'::regclass);


--
-- Name: priorityid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY priority ALTER COLUMN priorityid SET DEFAULT nextval('priority_priorityid_seq'::regclass);


--
-- Name: propertytypeid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY propertytype ALTER COLUMN propertytypeid SET DEFAULT nextval('propertytype_propertytypeid_seq'::regclass);


--
-- Name: servicestatusid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY servicestatus ALTER COLUMN servicestatusid SET DEFAULT nextval('servicestatus_servicestatusid_seq'::regclass);


--
-- Name: severityid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY severity ALTER COLUMN severityid SET DEFAULT nextval('severity_severityid_seq'::regclass);


--
-- Name: statetypeid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY statetype ALTER COLUMN statetypeid SET DEFAULT nextval('statetype_statetypeid_seq'::regclass);


--
-- Name: typeruleid; Type: DEFAULT; Schema: public; Owner: collage
--

ALTER TABLE ONLY typerule ALTER COLUMN typeruleid SET DEFAULT nextval('typerule_typeruleid_seq'::regclass);


--
-- Data for Name: action; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY action (actionid, actiontypeid, name, description) FROM stdin;
1	4	Nagios Acknowledge	Acknowledge Nagios Log Message
2	1	Accept Log Message	Update Log Message Operation Status To Accepted
3	1	Close Log Message	Update Log Message Operation Status To Closed
4	1	Notify Log Message	Update Log Message Operation Status To Notified
5	1	Open Log Message	Update Log Message Operation Status To Open
6	2	Register Agent	Invoke a script for the selected message
7	2	Register Agent by Profile	Invoke a script for the selected message
8	2	Noma Notify For Host	Invoke a script for the selected message
9	2	Noma Notify For Service	Invoke a script for the selected message
10	5	Submit Passive Check	Submit a passive check for this service
\.


--
-- Name: action_actionid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('action_actionid_seq', 10, true);


--
-- Data for Name: actionparameter; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY actionparameter (actionparameterid, actionid, name, value) FROM stdin;
1	6	agent-type	agent-type
2	6	host-name	host-name
3	6	host-ip	host-ip
4	6	host-mac	host-mac
5	6	operating-system	operating-system
6	6	host-characteristic	host-characteristic
7	7	agent-type	agent-type
8	7	host-name	host-name
9	7	host-ip	host-ip
10	7	host-mac	host-mac
11	7	operating-system	operating-system
12	7	host-profile-name	host-profile-name
13	7	service-profile-name	service-profile-name
14	8	-c	-c
15	8	notifyType	notifyType
16	8	-s	-s
17	8	hoststate	hoststate
18	8	-H	-H
19	8	hostname	hostname
20	8	-G	-G
21	8	hostgroupnames	hostgroupnames
22	8	-n	-n
23	8	notificationtype	notificationtype
24	8	-i	-i
25	8	hostaddress	hostaddress
26	8	-o	-o
27	8	hostoutput	hostoutput
28	8	-t	-t
29	8	shortdatetime	shortdatetime
30	8	-u	-u
31	8	hostnotificationid	hostnotificationid
32	8	-A	-A
33	8	notificationauthoralias	notificationauthoralias
34	8	-C	-C
35	8	notificationcomment	notificationcomment
36	8	-R	-R
37	8	notificationrecipients	notificationrecipients
38	9	-c	-c
39	9	notifyType	notifyType
40	9	-s	-s
41	9	servicestate	servicestate
42	9	-H	-H
43	9	hostname	hostname
44	9	-G	-G
45	9	hostgroupnames	hostgroupnames
46	9	-E	-E
47	9	servicegroupnames	servicegroupnames
48	9	-S	-S
49	9	servicedescription	servicedescription
50	9	-o	-o
51	9	serviceoutput	serviceoutput
52	9	-n	-n
53	9	notificationtype	notificationtype
54	9	-a	-a
55	9	hostalias	hostalias
56	9	-i	-i
57	9	hostaddress	hostaddress
58	9	-t	-t
59	9	shortdatetime	shortdatetime
60	9	-u	-u
61	9	servicenotificationid	servicenotificationid
62	9	-A	-A
63	9	notificationauthoralias	notificationauthoralias
64	9	-C	-C
65	9	notificationcomment	notificationcomment
66	9	-R	-R
67	9	notificationrecipients	notificationrecipients
68	10	nsca_host	nsca_host
69	10	user	user
70	10	comment	comment
71	10	host	host
72	10	service	service
73	10	state	state
\.


--
-- Name: actionparameter_actionparameterid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('actionparameter_actionparameterid_seq', 73, true);


--
-- Data for Name: actionproperty; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY actionproperty (actionpropertyid, actionid, name, value) FROM stdin;
1	1	NagiosCommandFile	/usr/local/groundwork/nagios/var/spool/nagios.cmd
2	2	OperationStatus	ACCEPTED
3	3	OperationStatus	CLOSED
4	4	OperationStatus	NOTIFIED
5	5	OperationStatus	OPEN
6	6	Script	/usr/local/groundwork/foundation/scripts/registerAgent.pl
7	7	Script	/usr/local/groundwork/foundation/scripts/registerAgentByProfile.pl
8	8	Script	/usr/local/groundwork/noma/notifier/alert_via_noma.pl
9	9	Script	/usr/local/groundwork/noma/notifier/alert_via_noma.pl
10	10	Script	/usr/local/groundwork/foundation/scripts/reset_passive_check.sh
\.


--
-- Name: actionproperty_actionpropertyid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('actionproperty_actionpropertyid_seq', 10, true);


--
-- Data for Name: actiontype; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY actiontype (actiontypeid, name, classname) FROM stdin;
1	LOG_MESSAGE_OPERATION_STATUS	org.groundwork.foundation.bs.actions.UpdateOperationStatusAction
2	SCRIPT_ACTION	org.groundwork.foundation.bs.actions.ShellScriptAction
3	HTTP_REQUEST_ACTION	org.groundwork.foundation.bs.actions.HttpRequestAction
4	NAGIOS_ACKNOWLEDGE_ACTION	org.groundwork.foundation.bs.actions.NagiosAcknowledgeAction
5	PASSIVE_CHECK_ACTION	org.groundwork.foundation.bs.actions.ShellScriptAction
\.


--
-- Name: actiontype_actiontypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('actiontype_actiontypeid_seq', 5, true);


--
-- Data for Name: applicationaction; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY applicationaction (applicationtypeid, actionid) FROM stdin;
1	2
1	3
1	4
1	5
100	1
101	6
101	7
102	8
102	9
106	10
107	10
\.


--
-- Data for Name: applicationentityproperty; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY applicationentityproperty (applicationentitypropertyid, applicationtypeid, entitytypeid, propertytypeid, sortorder) FROM stdin;
1	100	1	1	1
2	100	1	2	4
3	100	1	3	5
4	100	1	4	6
5	100	1	5	7
6	100	1	6	8
7	100	1	7	9
8	100	1	8	10
9	100	1	9	11
10	100	1	10	12
11	100	1	11	13
12	100	1	12	14
13	100	1	13	15
14	100	1	14	16
15	100	1	15	17
16	100	1	16	18
17	100	1	17	19
18	100	1	34	20
19	100	1	25	20
20	100	1	26	21
21	100	1	35	22
22	100	1	38	23
23	100	1	39	24
24	100	1	40	25
25	100	1	43	26
26	100	1	44	27
27	100	1	47	28
28	100	1	48	29
29	100	1	51	72
30	100	1	52	74
31	100	1	53	75
32	100	2	1	30
33	100	2	18	31
34	100	2	10	33
35	100	2	19	34
36	100	2	11	35
37	100	2	20	37
38	100	2	21	39
39	100	2	22	40
40	100	2	23	41
41	100	2	24	42
42	100	2	7	43
43	100	2	8	44
44	100	2	9	45
45	100	2	25	46
46	100	2	26	47
47	100	2	12	48
48	100	2	27	49
49	100	2	14	50
50	100	2	15	51
51	100	2	16	52
52	100	2	17	53
53	100	2	28	54
54	100	2	34	55
55	100	2	40	56
56	100	2	43	57
57	100	2	44	58
58	100	2	47	67
59	100	2	48	68
60	100	2	41	69
61	100	2	42	70
62	100	2	50	71
63	100	2	51	73
64	100	2	53	76
65	100	3	29	59
66	100	3	30	60
67	100	3	31	61
68	100	3	32	62
69	100	3	33	63
70	100	3	36	65
71	100	3	37	66
72	200	1	1	80
73	200	2	1	81
74	200	1	3	82
75	200	2	53	83
76	103	1	1	85
77	103	2	1	86
78	103	1	3	87
79	103	2	53	88
80	1	4	54	1
81	1	4	55	2
82	1	4	56	3
83	106	3	57	1
84	106	3	58	2
85	106	3	59	3
86	106	3	60	4
87	106	3	61	5
88	106	3	62	6
89	106	3	63	7
90	106	3	48	8
91	107	3	57	1
92	107	3	31	2
93	107	3	33	3
94	107	3	63	4
95	107	3	48	5
\.


--
-- Name: applicationentityproperty_applicationentitypropertyid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('applicationentityproperty_applicationentitypropertyid_seq', 95, true);


--
-- Data for Name: applicationtype; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY applicationtype (applicationtypeid, name, description, statetransitioncriteria) FROM stdin;
1	SYSTEM	Properties that exist regardless of the Application being monitored	Device
100	NAGIOS	System monitored by Nagios	Device;Host;ServiceDescription
200	VEMA	Virtual Environment Monitor Agent	Device;Host;ServiceDescription
101	GDMA	System monitored by GDMA	Device;Host;ServiceDescription
102	NOMA	NoMa Notification	Device;Host;ServiceDescription
103	CHRHEV	Cloud Hub for Red Hat Virtualization	Device;Host;ServiceDescription
104	ARCHIVE	Archiving related messages	Device;Host
105	BSM	Business Service Monitoring	Device;Host
106	SNMPTRAP	SNMP Trap application	Device;Event_OID_numeric
107	SYSLOG	SYSLOG application	Device
\.


--
-- Name: applicationtype_applicationtypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('applicationtype_applicationtypeid_seq', 107, true);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY category (categoryid, name, description, entitytypeid) FROM stdin;
1	group-warning	\N	23
2	group-ok	\N	23
3	group-critical	\N	23
4	group-pending	\N	23
5	group-all	\N	23
6	group-unknown	\N	23
\.


--
-- Name: category_categoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('category_categoryid_seq', 6, true);


--
-- Data for Name: categoryentity; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY categoryentity (categoryentityid, objectid, categoryid, entitytypeid) FROM stdin;
2	22	1	2
5	22	5	2
1	25	4	2
6	23	6	2
3	27	3	2
4	28	2	2
7	31	2	2
8	24	4	2
9	29	3	2
10	26	1	2
12	30	6	2
11	23	5	2
13	24	5	2
14	25	5	2
15	26	5	2
16	27	5	2
17	28	5	2
18	29	5	2
19	30	5	2
20	31	5	2
\.


--
-- Name: categoryentity_categoryentityid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('categoryentity_categoryentityid_seq', 20, true);


--
-- Data for Name: categoryhierarchy; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY categoryhierarchy (categoryid, parentid) FROM stdin;
\.


--
-- Data for Name: checktype; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY checktype (checktypeid, name, description) FROM stdin;
1	ACTIVE	Active Check
2	PASSIVE	Passive Check
\.


--
-- Name: checktype_checktypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('checktype_checktypeid_seq', 2, true);


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY component (componentid, name, description) FROM stdin;
1	SNMP	SNMP Component
2	MQ	MessageQueue component
3	JMSLISTENER	JMSListener component
4	UNDEFINED	Undefined component
\.


--
-- Name: component_componentid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('component_componentid_seq', 4, true);


--
-- Data for Name: consolidationcriteria; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY consolidationcriteria (consolidationcriteriaid, name, criteria) FROM stdin;
1	NAGIOSEVENT	Device;MonitorStatus;OperationStatus;SubComponent;ErrorType
2	SYSTEM	OperationStatus;Device;MonitorStatus;ApplicationType;TextMessage
3	SNMPTRAP	OperationStatus;Device;ipaddress;MonitorStatus;Event_OID_numeric;Event_Name;Category;Variable_Bindings
4	SYSLOG	OperationStatus;Device;MonitorStatus;ipaddress;ErrorType;SubComponent
\.


--
-- Name: consolidationcriteria_consolidationcriteriaid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('consolidationcriteria_consolidationcriteriaid_seq', 4, true);


--
-- Data for Name: device; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY device (deviceid, displayname, identification, description) FROM stdin;
1	127.0.0.1	127.0.0.1	Device localhost
2	host-up-warning	127.0.1.1	\N
3	host-up-unknown	127.0.1.3	\N
4	host-down-pending	240.0.1.4	\N
5	host-up-pending	127.0.1.4	\N
6	host-down-warning	240.0.1.1	\N
7	host-down-critical	240.0.1.2	\N
8	host-up-ok	127.0.1.0	\N
9	host-up-critical	127.0.1.2	\N
10	host-down-unknown	240.0.1.3	\N
11	host-down-ok	240.0.1.0	\N
\.


--
-- Name: device_deviceid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('device_deviceid_seq', 11, true);


--
-- Data for Name: deviceparent; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY deviceparent (deviceid, parentid) FROM stdin;
\.


--
-- Data for Name: entity; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY entity (entityid, name, description, class, applicationtypeid) FROM stdin;
\.


--
-- Name: entity_entityid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('entity_entityid_seq', 1, false);


--
-- Data for Name: entityproperty; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY entityproperty (entitytypeid, objectid, propertytypeid, valuestring, valuedate, valueboolean, valueinteger, valuelong, valuedouble, lasteditedon, createdon) FROM stdin;
\.


--
-- Data for Name: entitytype; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY entitytype (entitytypeid, name, description, islogicalentity, isapplicationtypesupported) FROM stdin;
1	HOST_STATUS	com.groundwork.collage.model.impl.HostStatus	f	f
2	SERVICE_STATUS	com.groundwork.collage.model.impl.ServiceStatus	f	f
3	LOG_MESSAGE	com.groundwork.collage.model.impl.LogMessage	f	f
4	DEVICE	com.groundwork.collage.model.impl.Device	f	f
5	HOST	com.groundwork.collage.model.impl.Host	f	f
6	HOSTGROUP	com.groundwork.collage.model.impl.HostGroup	f	f
7	APPLICATION_TYPE	com.groundwork.collage.model.impl.ApplicationType	f	f
8	CATEGORY	com.groundwork.collage.model.impl.Category	f	f
9	CHECK_TYPE	com.groundwork.collage.model.impl.CheckType	f	f
10	COMPONENT	com.groundwork.collage.model.impl.Component	f	f
11	MONITOR_STATUS	com.groundwork.collage.model.impl.MonitorStatus	f	f
12	OPERATION_STATUS	com.groundwork.collage.model.impl.OperationStatus	f	f
13	PRIORITY	com.groundwork.collage.model.impl.Priority	f	f
14	SEVERITY	com.groundwork.collage.model.impl.Severity	f	f
15	STATE_TYPE	com.groundwork.collage.model.impl.StateType	f	f
16	TYPE_RULE	com.groundwork.collage.model.impl.TypeRule	f	f
17	MONITOR_SERVER	com.groundwork.collage.model.impl.MonitorServer	f	f
18	LOG_MESSAGE_STATISTICS	com.groundwork.collage.model.impl.LogMessageStatistic	t	f
19	HOST_STATISTICS	com.groundwork.collage.model.impl.HostStatistic	t	f
20	SERVICE_STATISTICS	com.groundwork.collage.model.impl.ServiceStatistic	t	f
21	HOST_STATE_TRANSITIONS	com.groundwork.collage.model.impl.HostStateTransition	t	f
22	SERVICE_STATE_TRANSITIONS	com.groundwork.collage.model.impl.ServiceStateTransition	t	f
23	SERVICE_GROUP	com.groundwork.collage.model.impl.ServiceGroup	t	f
\.


--
-- Name: entitytype_entitytypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('entitytype_entitytypeid_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 1000, false);


--
-- Data for Name: host; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY host (hostid, deviceid, hostname, description, applicationtypeid, agentid) FROM stdin;
2	2	host-up-warning	host-up-warning	100	\N
3	3	host-up-unknown	host-up-unknown	100	\N
4	4	host-down-pending	host-down-pending	100	\N
5	5	host-up-pending	host-up-pending	100	\N
6	6	host-down-warning	host-down-warning	100	\N
7	7	host-down-critical	host-down-critical	100	\N
8	8	host-up-ok	host-up-ok	100	\N
9	9	host-up-critical	host-up-critical	100	\N
10	10	host-down-unknown	host-down-unknown	100	\N
11	11	host-down-ok	host-down-ok	100	\N
1	1	localhost	localhost	100	\N
\.


--
-- Name: host_hostid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('host_hostid_seq', 11, true);


--
-- Data for Name: hostgroup; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY hostgroup (hostgroupid, name, description, applicationtypeid, alias, agentid) FROM stdin;
2	hosts down	\N	100	hosts down	\N
3	hosts ok	\N	100	hosts ok	\N
4	hosts critical	\N	100	hosts critical	\N
5	hosts unknown	\N	100	hosts unknown	\N
6	hosts pending	\N	100	hosts pending	\N
7	hosts all	\N	100	all-hosts	\N
8	hosts up	\N	100	hosts up	\N
9	hosts warning	\N	100	hosts warning	\N
1	Linux Servers	 	100	Linux Servers	\N
\.


--
-- Name: hostgroup_hostgroupid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('hostgroup_hostgroupid_seq', 9, true);


--
-- Data for Name: hostgroupcollection; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY hostgroupcollection (hostid, hostgroupid) FROM stdin;
1	1
11	2
10	2
7	2
11	3
4	2
6	2
8	3
8	8
5	8
2	8
3	8
9	8
7	4
9	4
10	5
3	5
11	7
10	7
8	7
7	7
5	7
2	7
4	7
3	7
9	7
6	7
5	6
4	6
2	9
6	9
\.


--
-- Data for Name: hoststatus; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY hoststatus (hoststatusid, applicationtypeid, monitorstatusid, lastchecktime, checktypeid, statetypeid, nextchecktime) FROM stdin;
1	100	1	2013-09-03 20:15:25	1	2	2013-09-03 20:15:25
4	100	5	\N	\N	2	\N
5	100	5	\N	\N	2	\N
3	100	1	2013-09-03 20:25:47	\N	2	2013-09-03 20:25:47
7	100	8	2013-09-03 20:27:37	\N	2	2013-09-03 20:27:47
6	100	8	2013-09-03 20:27:47	\N	2	2013-09-03 20:27:57
9	100	1	2013-09-03 20:28:57	\N	2	2013-09-03 20:28:57
2	100	1	2013-09-03 20:29:17	\N	2	2013-09-03 20:29:17
11	100	8	2013-09-03 20:31:17	\N	2	2013-09-03 20:31:27
8	100	1	2013-09-03 20:32:27	\N	2	2013-09-03 20:32:27
10	100	8	2013-09-03 20:34:27	\N	2	2013-09-03 20:34:37
\.


--
-- Data for Name: hoststatusproperty; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY hoststatusproperty (hoststatusid, propertytypeid, valuestring, valuedate, valueboolean, valueinteger, valuelong, valuedouble, lasteditedon, createdon) FROM stdin;
1	35	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.267	2013-09-03 09:44:47.267
1	25	\N	\N	\N	\N	\N	0	2013-09-03 09:44:47.205	2013-09-03 09:44:47.205
1	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.306	2013-09-03 09:44:47.306
1	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:47.313	2013-09-03 09:44:47.313
1	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:47.315	2013-09-03 09:44:47.315
1	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.307	2013-09-03 09:44:47.307
1	44	\N	\N	\N	\N	10	\N	2013-09-03 09:44:47.302	2013-09-03 09:44:47.302
1	3	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.301	2013-09-03 09:44:47.301
1	2	\N	2013-09-03 09:43:51	\N	\N	\N	\N	2013-09-03 09:44:47.309	2013-09-03 09:44:47.309
1	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.305	2013-09-03 09:44:47.305
1	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.308	2013-09-03 09:44:47.308
1	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.315	2013-09-03 09:44:47.315
1	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:47.314	2013-09-03 09:44:47.314
1	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:47.305	2013-09-03 09:44:47.305
1	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.314	2013-09-03 09:44:47.314
7	53	rta=0.000ms;3000.000;5000.000;0; pl=100%;80;100;; rtmax=0.000ms;;;; rtmin=0.000ms;;;;	\N	\N	\N	\N	\N	2013-09-03 20:25:51.041	2013-09-03 20:25:51.041
5	14	\N	\N	\N	\N	\N	0	2013-09-03 20:21:50.786	2013-09-03 20:21:50.786
5	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:50.783	2013-09-03 20:21:50.783
5	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.784	2013-09-03 20:21:50.784
7	1	CRITICAL - 240.0.1.2: rta nan, lost 100%	\N	\N	\N	\N	\N	2013-09-03 20:25:51.04	2013-09-03 20:25:51.04
3	53	rta=0.052ms;3000.000;5000.000;0; pl=0%;80;100;; rtmax=0.052ms;;;; rtmin=0.052ms;;;;	\N	\N	\N	\N	\N	2013-09-03 20:26:21.112	2013-09-03 20:26:21.112
3	1	OK - 127.0.1.3: rta 0.052ms, lost 0%	\N	\N	\N	\N	\N	2013-09-03 20:26:21.112	2013-09-03 20:26:21.112
1	49	Load Average;;http://localhost:80/nms-cacti/graph_image.php?local_graph_id=2&rra_id=0&view_type=tree&gwuid=guest!!Logged in Users;;http://localhost:80/nms-cacti/graph_image.php?local_graph_id=3&rra_id=0&view_type=tree&gwuid=guest!!Memory Usage;;http://localhost:80/nms-cacti/graph_image.php?local_graph_id=1&rra_id=0&view_type=tree&gwuid=guest!!Processes;;http://localhost:80/nms-cacti/graph_image.php?local_graph_id=4&rra_id=0&view_type=tree&gwuid=guest	\N	\N	\N	\N	\N	2013-09-03 20:10:01.638	2013-09-03 20:10:01.638
1	1	OK - 127.0.0.1: rta 0.316ms, lost 0%	\N	\N	\N	\N	\N	2013-09-03 09:44:47.305	2013-09-03 09:44:47.305
1	26	\N	\N	\N	\N	\N	9	2013-09-03 09:44:47.301	2013-09-03 09:44:47.301
1	53	rta=0.316ms;3000.000;5000.000;0; pl=0%;80;100;; rtmax=0.316ms;;;; rtmin=0.316ms;;;;	\N	\N	\N	\N	\N	2013-09-03 09:44:47.306	2013-09-03 09:44:47.306
2	39	host-up-warning	\N	\N	\N	\N	\N	2013-09-03 20:21:39.784	2013-09-03 20:21:39.784
3	26	\N	\N	\N	\N	\N	6	2013-09-03 20:21:50.731	2013-09-03 20:21:50.731
3	39	host-up-unknown	\N	\N	\N	\N	\N	2013-09-03 20:21:39.856	2013-09-03 20:21:39.856
10	1	CRITICAL - 240.0.1.3: rta nan, lost 100%	\N	\N	\N	\N	\N	2013-09-03 20:32:36.501	2013-09-03 20:32:36.501
4	39	host-down-pending	\N	\N	\N	\N	\N	2013-09-03 20:21:39.866	2013-09-03 20:21:39.866
7	25	\N	\N	\N	\N	\N	554	2013-09-03 20:21:50.804	2013-09-03 20:21:50.804
5	39	host-up-pending	\N	\N	\N	\N	\N	2013-09-03 20:21:39.878	2013-09-03 20:21:39.878
11	53	rta=0.000ms;3000.000;5000.000;0; pl=100%;80;100;; rtmax=0.000ms;;;; rtmin=0.000ms;;;;	\N	\N	\N	\N	\N	2013-09-03 20:29:21.28	2013-09-03 20:29:21.28
6	39	host-down-warning	\N	\N	\N	\N	\N	2013-09-03 20:21:39.887	2013-09-03 20:21:39.887
11	1	CRITICAL - 240.0.1.0: rta nan, lost 100%	\N	\N	\N	\N	\N	2013-09-03 20:29:21.279	2013-09-03 20:29:21.279
7	39	host-down-critical	\N	\N	\N	\N	\N	2013-09-03 20:21:39.899	2013-09-03 20:21:39.899
2	26	\N	\N	\N	\N	\N	3	2013-09-03 20:21:50.705	2013-09-03 20:21:50.705
8	39	host-up-ok	\N	\N	\N	\N	\N	2013-09-03 20:21:39.91	2013-09-03 20:21:39.91
10	53	rta=0.000ms;3000.000;5000.000;0; pl=100%;80;100;; rtmax=0.000ms;;;; rtmin=0.000ms;;;;	\N	\N	\N	\N	\N	2013-09-03 20:32:36.502	2013-09-03 20:32:36.502
9	39	host-up-critical	\N	\N	\N	\N	\N	2013-09-03 20:21:39.921	2013-09-03 20:21:39.921
10	39	host-down-unknown	\N	\N	\N	\N	\N	2013-09-03 20:21:39.933	2013-09-03 20:21:39.933
11	39	host-down-ok	\N	\N	\N	\N	\N	2013-09-03 20:21:39.945	2013-09-03 20:21:39.945
1	39	Linux Server #1	\N	\N	\N	\N	\N	2013-09-03 20:21:49.006	2013-09-03 20:21:49.006
2	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.711	2013-09-03 20:21:50.711
2	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.706	2013-09-03 20:21:50.706
2	43	\N	\N	\N	\N	1	\N	2013-09-03 20:21:50.709	2013-09-03 20:21:50.709
2	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:50.712	2013-09-03 20:21:50.712
2	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.705	2013-09-03 20:21:50.705
2	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.711	2013-09-03 20:21:50.711
2	25	\N	\N	\N	\N	\N	0	2013-09-03 20:21:50.703	2013-09-03 20:21:50.703
2	35	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.704	2013-09-03 20:21:50.704
2	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.706	2013-09-03 20:21:50.706
2	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:50.706	2013-09-03 20:21:50.706
2	14	\N	\N	\N	\N	\N	0	2013-09-03 20:21:50.709	2013-09-03 20:21:50.709
2	3	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.704	2013-09-03 20:21:50.704
2	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.705	2013-09-03 20:21:50.705
2	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.707	2013-09-03 20:21:50.707
3	14	\N	\N	\N	\N	\N	0	2013-09-03 20:21:50.735	2013-09-03 20:21:50.735
3	35	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.73	2013-09-03 20:21:50.73
3	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.735	2013-09-03 20:21:50.735
3	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.736	2013-09-03 20:21:50.736
3	43	\N	\N	\N	\N	1	\N	2013-09-03 20:21:50.735	2013-09-03 20:21:50.735
3	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.732	2013-09-03 20:21:50.732
3	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:50.732	2013-09-03 20:21:50.732
3	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:50.737	2013-09-03 20:21:50.737
3	25	\N	\N	\N	\N	\N	0	2013-09-03 20:21:50.729	2013-09-03 20:21:50.729
3	3	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.731	2013-09-03 20:21:50.731
3	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.733	2013-09-03 20:21:50.733
3	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.731	2013-09-03 20:21:50.731
3	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.733	2013-09-03 20:21:50.733
3	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.733	2013-09-03 20:21:50.733
4	14	\N	\N	\N	\N	\N	0	2013-09-03 20:21:50.757	2013-09-03 20:21:50.757
4	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.758	2013-09-03 20:21:50.758
4	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.757	2013-09-03 20:21:50.757
4	35	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.752	2013-09-03 20:21:50.752
4	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.755	2013-09-03 20:21:50.755
4	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:50.754	2013-09-03 20:21:50.754
4	26	\N	\N	\N	\N	\N	0	2013-09-03 20:21:50.753	2013-09-03 20:21:50.753
4	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.755	2013-09-03 20:21:50.755
4	43	\N	\N	\N	\N	1	\N	2013-09-03 20:21:50.757	2013-09-03 20:21:50.757
4	3	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.752	2013-09-03 20:21:50.752
4	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.754	2013-09-03 20:21:50.754
4	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.755	2013-09-03 20:21:50.755
4	25	\N	\N	\N	\N	\N	0	2013-09-03 20:21:50.751	2013-09-03 20:21:50.751
4	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.754	2013-09-03 20:21:50.754
4	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:50.759	2013-09-03 20:21:50.759
5	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.787	2013-09-03 20:21:50.787
5	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:50.788	2013-09-03 20:21:50.788
5	26	\N	\N	\N	\N	\N	0	2013-09-03 20:21:50.782	2013-09-03 20:21:50.782
5	35	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.781	2013-09-03 20:21:50.781
5	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.784	2013-09-03 20:21:50.784
5	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.788	2013-09-03 20:21:50.788
5	25	\N	\N	\N	\N	\N	0	2013-09-03 20:21:50.78	2013-09-03 20:21:50.78
5	43	\N	\N	\N	\N	1	\N	2013-09-03 20:21:50.786	2013-09-03 20:21:50.786
5	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.784	2013-09-03 20:21:50.784
5	3	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.781	2013-09-03 20:21:50.781
5	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.782	2013-09-03 20:21:50.782
5	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.783	2013-09-03 20:21:50.783
7	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.806	2013-09-03 20:21:50.806
7	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:50.812	2013-09-03 20:21:50.812
7	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.807	2013-09-03 20:21:50.807
7	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.808	2013-09-03 20:21:50.808
7	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.81	2013-09-03 20:21:50.81
7	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.811	2013-09-03 20:21:50.811
7	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:50.806	2013-09-03 20:21:50.806
7	3	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.805	2013-09-03 20:21:50.805
7	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.806	2013-09-03 20:21:50.806
7	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.807	2013-09-03 20:21:50.807
7	35	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.804	2013-09-03 20:21:50.804
7	43	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.809	2013-09-03 20:21:50.809
6	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.832	2013-09-03 20:21:50.832
6	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.832	2013-09-03 20:21:50.832
6	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.835	2013-09-03 20:21:50.835
6	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.829	2013-09-03 20:21:50.829
6	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:50.835	2013-09-03 20:21:50.835
6	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:50.83	2013-09-03 20:21:50.83
6	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.831	2013-09-03 20:21:50.831
6	3	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.828	2013-09-03 20:21:50.828
6	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.834	2013-09-03 20:21:50.834
6	35	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.828	2013-09-03 20:21:50.828
6	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.829	2013-09-03 20:21:50.829
7	14	\N	\N	\N	\N	\N	5.99000000000000021	2013-09-03 20:21:50.81	2013-09-03 20:21:50.81
8	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.863	2013-09-03 20:21:50.863
8	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:50.868	2013-09-03 20:21:50.868
8	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.862	2013-09-03 20:21:50.862
8	3	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.851	2013-09-03 20:21:50.851
8	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.855	2013-09-03 20:21:50.855
8	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.854	2013-09-03 20:21:50.854
8	14	\N	\N	\N	\N	\N	0	2013-09-03 20:21:50.862	2013-09-03 20:21:50.862
8	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.853	2013-09-03 20:21:50.853
8	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.852	2013-09-03 20:21:50.852
8	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:50.853	2013-09-03 20:21:50.853
8	35	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.851	2013-09-03 20:21:50.851
8	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.853	2013-09-03 20:21:50.853
8	25	\N	\N	\N	\N	\N	0	2013-09-03 20:21:50.85	2013-09-03 20:21:50.85
8	43	\N	\N	\N	\N	1	\N	2013-09-03 20:21:50.861	2013-09-03 20:21:50.861
6	53	rta=0.000ms;3000.000;5000.000;0; pl=100%;80;100;; rtmax=0.000ms;;;; rtmin=0.000ms;;;;	\N	\N	\N	\N	\N	2013-09-03 20:26:06.044	2013-09-03 20:26:06.044
10	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:50.903	2013-09-03 20:21:50.903
10	3	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.902	2013-09-03 20:21:50.902
10	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.903	2013-09-03 20:21:50.903
10	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:50.908	2013-09-03 20:21:50.908
10	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.902	2013-09-03 20:21:50.902
10	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.904	2013-09-03 20:21:50.904
10	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.904	2013-09-03 20:21:50.904
10	35	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.9	2013-09-03 20:21:50.9
10	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.907	2013-09-03 20:21:50.907
10	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.904	2013-09-03 20:21:50.904
10	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.908	2013-09-03 20:21:50.908
6	1	CRITICAL - 240.0.1.1: rta nan, lost 100%	\N	\N	\N	\N	\N	2013-09-03 20:26:06.043	2013-09-03 20:26:06.043
9	25	\N	\N	\N	\N	\N	0	2013-09-03 20:21:50.922	2013-09-03 20:21:50.922
9	3	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.923	2013-09-03 20:21:50.923
9	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.925	2013-09-03 20:21:50.925
9	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:50.925	2013-09-03 20:21:50.925
9	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.929	2013-09-03 20:21:50.929
9	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:50.929	2013-09-03 20:21:50.929
9	35	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.923	2013-09-03 20:21:50.923
9	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.925	2013-09-03 20:21:50.925
9	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.926	2013-09-03 20:21:50.926
9	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.928	2013-09-03 20:21:50.928
9	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.923	2013-09-03 20:21:50.923
9	14	\N	\N	\N	\N	\N	0	2013-09-03 20:21:50.928	2013-09-03 20:21:50.928
9	43	\N	\N	\N	\N	1	\N	2013-09-03 20:21:50.928	2013-09-03 20:21:50.928
9	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.927	2013-09-03 20:21:50.927
7	26	\N	\N	\N	\N	\N	10006	2013-09-03 20:21:50.805	2013-09-03 20:21:50.805
11	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.949	2013-09-03 20:21:50.949
11	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.946	2013-09-03 20:21:50.946
11	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.946	2013-09-03 20:21:50.946
11	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:50.951	2013-09-03 20:21:50.951
11	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.95	2013-09-03 20:21:50.95
11	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.948	2013-09-03 20:21:50.948
11	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.951	2013-09-03 20:21:50.951
11	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:50.947	2013-09-03 20:21:50.947
11	35	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.945	2013-09-03 20:21:50.945
11	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.948	2013-09-03 20:21:50.948
11	3	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.945	2013-09-03 20:21:50.945
6	25	\N	\N	\N	\N	\N	565	2013-09-03 20:21:50.827	2013-09-03 20:21:50.827
11	43	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.95	2013-09-03 20:21:50.95
11	25	\N	\N	\N	\N	\N	737	2013-09-03 20:21:50.944	2013-09-03 20:21:50.944
11	14	\N	\N	\N	\N	\N	5.99000000000000021	2013-09-03 20:21:50.95	2013-09-03 20:21:50.95
6	43	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.833	2013-09-03 20:21:50.833
6	26	\N	\N	\N	\N	\N	10004	2013-09-03 20:21:50.829	2013-09-03 20:21:50.829
6	14	\N	\N	\N	\N	\N	5.99000000000000021	2013-09-03 20:21:50.833	2013-09-03 20:21:50.833
9	1	OK - 127.0.1.2: rta 0.068ms, lost 0%	\N	\N	\N	\N	\N	2013-09-03 20:29:36.326	2013-09-03 20:29:36.326
9	53	rta=0.068ms;3000.000;5000.000;0; pl=0%;80;100;; rtmax=0.068ms;;;; rtmin=0.068ms;;;;	\N	\N	\N	\N	\N	2013-09-03 20:29:36.327	2013-09-03 20:29:36.327
9	26	\N	\N	\N	\N	\N	6	2013-09-03 20:21:50.923	2013-09-03 20:21:50.923
11	26	\N	\N	\N	\N	\N	10005	2013-09-03 20:21:50.946	2013-09-03 20:21:50.946
8	53	rta=0.052ms;3000.000;5000.000;0; pl=0%;80;100;; rtmax=0.052ms;;;; rtmin=0.052ms;;;;	\N	\N	\N	\N	\N	2013-09-03 20:33:06.535	2013-09-03 20:33:06.535
8	1	OK - 127.0.1.0: rta 0.052ms, lost 0%	\N	\N	\N	\N	\N	2013-09-03 20:33:06.535	2013-09-03 20:33:06.535
8	26	\N	\N	\N	\N	\N	3	2013-09-03 20:21:50.852	2013-09-03 20:21:50.852
10	26	\N	\N	\N	\N	\N	10004	2013-09-03 20:21:50.902	2013-09-03 20:21:50.902
10	43	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.905	2013-09-03 20:21:50.905
10	25	\N	\N	\N	\N	\N	937	2013-09-03 20:21:50.9	2013-09-03 20:21:50.9
10	14	\N	\N	\N	\N	\N	5.99000000000000021	2013-09-03 20:21:50.906	2013-09-03 20:21:50.906
4	2	\N	2013-09-03 20:37:36	\N	\N	\N	\N	2013-09-03 20:21:39.865	2013-09-03 20:21:39.865
5	2	\N	2013-09-03 20:37:36	\N	\N	\N	\N	2013-09-03 20:21:39.877	2013-09-03 20:21:39.877
7	2	\N	2013-09-03 20:27:47	\N	\N	\N	\N	2013-09-03 20:21:39.898	2013-09-03 20:21:39.898
6	2	\N	2013-09-03 20:27:57	\N	\N	\N	\N	2013-09-03 20:21:39.886	2013-09-03 20:21:39.886
11	2	\N	2013-09-03 20:31:27	\N	\N	\N	\N	2013-09-03 20:21:39.944	2013-09-03 20:21:39.944
8	2	\N	2013-09-03 20:32:18	\N	\N	\N	\N	2013-09-03 20:21:39.909	2013-09-03 20:21:39.909
9	2	\N	2013-09-03 20:28:51	\N	\N	\N	\N	2013-09-03 20:21:39.92	2013-09-03 20:21:39.92
2	2	\N	2013-09-03 20:29:12	\N	\N	\N	\N	2013-09-03 20:21:39.782	2013-09-03 20:21:39.782
2	1	OK - 127.0.1.1: rta 0.269ms, lost 0%	\N	\N	\N	\N	\N	2013-09-03 20:29:51.319	2013-09-03 20:29:51.319
2	53	rta=0.269ms;3000.000;5000.000;0; pl=0%;80;100;; rtmax=0.269ms;;;; rtmin=0.269ms;;;;	\N	\N	\N	\N	\N	2013-09-03 20:29:51.321	2013-09-03 20:29:51.321
10	2	\N	2013-09-03 20:34:37	\N	\N	\N	\N	2013-09-03 20:21:39.932	2013-09-03 20:21:39.932
3	2	\N	2013-09-03 20:25:45	\N	\N	\N	\N	2013-09-03 20:21:39.853	2013-09-03 20:21:39.853
\.


--
-- Data for Name: logmessage; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY logmessage (logmessageid, applicationtypeid, deviceid, hoststatusid, servicestatusid, textmessage, msgcount, firstinsertdate, lastinsertdate, reportdate, monitorstatusid, severityid, applicationseverityid, priorityid, typeruleid, componentid, operationstatusid, isstatechanged, consolidationhash, statelesshash, statetransitionhash) FROM stdin;
4	100	1	1	3	OK - total %CPU for process nagios : 0.0	1	2013-09-03 09:44:48	2013-09-03 09:44:48	2013-09-03 09:45:17.354	2	9	9	1	6	4	1	f	0	0	1440976122
5	100	1	1	4	OK - total %CPU for process perl : 8.5	1	2013-09-03 09:45:17	2013-09-03 09:45:17	2013-09-03 09:45:47.384	2	9	9	1	6	4	1	f	0	0	-1245362768
6	100	1	1	5	OK - total %CPU for process syslog-ng : 0.0	1	2013-09-03 09:45:45	2013-09-03 09:45:45	2013-09-03 09:46:17.391	2	9	9	1	6	4	1	f	0	0	497650638
8	100	1	1	7	DISK OK - free space: / 5425 MB (66% inode=83%):	1	2013-09-03 09:46:14	2013-09-03 09:46:14	2013-09-03 09:46:47.303	2	9	9	1	6	4	1	f	0	0	1774429434
9	100	1	1	8	OK - load average: 2.14, 1.68, 0.75	1	2013-09-03 09:46:43	2013-09-03 09:46:43	2013-09-03 09:47:17.334	2	9	9	1	6	4	1	f	0	0	-794399632
10	100	1	1	10	OK - total %MEM for process httpd : 1.5	1	2013-09-03 09:47:11	2013-09-03 09:47:11	2013-09-03 09:47:32.348	2	9	9	1	6	4	1	f	0	0	-1354294104
12	100	1	1	12	OK - total %MEM for process nagios : 0.0	1	2013-09-03 09:48:08	2013-09-03 09:48:08	2013-09-03 09:48:32.394	2	9	9	1	6	4	1	f	0	0	1120390189
13	100	1	1	13	OK - total %MEM for process perl : 12.0	1	2013-09-03 09:48:37	2013-09-03 09:48:37	2013-09-03 09:49:02.448	2	9	9	1	6	4	1	f	0	0	1896199587
14	100	1	1	14	OK - total %MEM for process syslog-ng : 0.0	1	2013-09-03 09:49:05	2013-09-03 09:49:05	2013-09-03 09:49:32.477	2	9	9	1	6	4	1	f	0	0	1929386939
15	100	1	1	9	Memory OK - 58.4% (1565372 kB) used	1	2013-09-03 09:49:34	2013-09-03 09:49:34	2013-09-03 09:50:02.494	2	9	9	1	6	4	1	f	0	0	1105897995
16	100	1	1	15	OK: Nagios latency: Min=0.000, Max=0.932, Avg=0.401	1	2013-09-03 09:50:03	2013-09-03 09:50:03	2013-09-03 09:50:32.554	2	9	9	1	6	4	1	f	0	0	942609474
17	100	1	1	17	NAGIOS OK: 2 processes, status log updated 7 seconds ago	1	2013-09-03 09:51:00	2013-09-03 09:51:00	2013-09-03 09:51:17.523	2	9	9	1	6	4	1	f	0	0	-1963246253
18	100	1	1	18	SWAP OK - 100% free (924 MB out of 927 MB)	1	2013-09-03 09:51:28	2013-09-03 09:51:28	2013-09-03 09:51:47.574	2	9	9	1	6	4	1	f	0	0	-794183395
19	100	1	1	6	USERS OK - 0 users currently logged in	1	2013-09-03 09:51:57	2013-09-03 09:51:57	2013-09-03 09:52:17.618	2	9	9	1	6	4	1	f	0	0	1151850430
20	100	1	1	16	PROCS CRITICAL: 0 processes with args 'groundwork/foundation/container/lib/jboss'	1	2013-09-03 09:52:33	2013-09-03 09:52:33	2013-09-03 09:52:35.681	20	8	8	1	6	4	1	f	1689064959	1837841632	165730441
21	100	1	1	19	TCP OK - 0.000 second response time on port 4913	1	2013-09-03 09:52:25	2013-09-03 09:52:25	2013-09-03 09:52:47.617	2	9	9	1	6	4	1	f	0	0	-33523121
22	100	1	1	20	HTTP OK: HTTP/1.1 200 OK - 1267 bytes in 0.001 second response time	1	2013-09-03 09:52:54	2013-09-03 09:52:54	2013-09-03 09:53:17.661	2	9	9	1	6	4	1	f	0	0	-709099812
23	100	1	1	21	TCP OK - 0.000 second response time on port 5667	1	2013-09-03 09:53:23	2013-09-03 09:53:23	2013-09-03 09:53:47.614	2	9	9	1	6	4	1	f	0	0	-708922569
29	100	1	1	2	OK - total %CPU for process java : 18.7	1	2013-09-03 20:14:05	2013-09-03 20:14:05	2013-09-03 20:14:07.198	2	9	9	1	6	4	1	f	-1623958278	2141641750	-1245545245
7	100	1	1	2	CRITICAL - total %CPU for process java : 68.3	1	2013-09-03 09:46:23	2013-09-03 09:46:23	2013-09-03 09:46:25.564	20	8	8	1	6	4	4	t	-1672380329	2141641750	-1245545245
11	100	1	1	11	OK - total %MEM for process java : 40.1	1	2013-09-03 09:47:40	2013-09-03 09:47:40	2013-09-03 09:48:02.416	2	9	9	1	6	4	4	f	0	0	1896017110
1	1	1	\N	\N	JMS Queue is initialized and all incoming messages are routed through the persistence store.	2	2013-09-03 09:44:36	2013-09-03 20:03:23	2013-09-03 20:03:25.346	2	9	9	1	6	4	1	f	1898696635	1978529951	1505998205
25	100	1	1	11	WARNING - total %MEM for process java : 42.4	1	2013-09-03 09:59:43	2013-09-03 09:59:43	2013-09-03 09:59:45.826	9	4	4	1	6	4	4	t	1697323873	-1671876861	1896017110
28	100	1	1	11	OK - total %MEM for process java : 39.6	1	2013-09-03 20:05:25	2013-09-03 20:05:25	2013-09-03 20:05:27.108	2	9	9	1	6	4	4	t	-1142509593	-1671876861	1896017110
24	100	1	1	2	OK - total %CPU for process java : 20.3	1	2013-09-03 09:56:23	2013-09-03 09:56:23	2013-09-03 09:56:25.663	2	9	9	1	6	4	4	t	-1623958278	2141641750	-1245545245
26	100	1	1	11	WARNING: process java not running !	1	2013-09-03 15:39:42	2013-09-03 15:39:42	2013-09-03 20:03:31.869	3	10	10	1	6	4	4	t	-1423918477	-1671876861	1896017110
27	100	1	1	2	CRITICAL - total %CPU for process java : 84.4	1	2013-09-03 20:04:05	2013-09-03 20:04:05	2013-09-03 20:04:07.175	20	8	8	1	6	4	4	t	-1672380329	2141641750	-1245545245
30	100	1	1	11	WARNING - total %MEM for process java : 41.3	1	2013-09-03 20:17:25	2013-09-03 20:17:25	2013-09-03 20:17:27.253	9	4	4	1	6	4	1	f	1697323873	-1671876861	1896017110
31	1	1	\N	\N	Foundation-Monarch synch process completed. It might take up to 30 sec. for changes to show up in the status pages.	1	2013-09-03 20:21:48	2013-09-03 20:21:48	2013-09-03 20:21:49.127	2	9	9	1	6	4	1	f	818390582	-1585726254	\N
3	1	1	\N	\N	Foundation-Nagios status check process started.	3	2013-09-03 09:44:46	2013-09-03 20:21:50	2013-09-03 20:21:50.493	2	9	9	1	6	4	1	f	-399862680	-197314300	\N
2	1	1	\N	\N	Foundation-Nagios log check process started.	5	2013-09-03 09:44:45	2013-09-03 20:21:58	2013-09-03 20:21:58.396	2	9	9	1	6	4	1	f	956809038	-985874382	\N
33	100	3	3	\N	OK - 127.0.1.3: rta 0.052ms, lost 0%	1	2013-09-03 20:25:47	2013-09-03 20:25:47	2013-09-03 20:26:21.1	1	9	9	1	6	4	1	f	0	0	1218596637
35	100	3	3	23	UNKNOWN	1	2013-09-03 20:27:47	2013-09-03 20:27:47	2013-09-03 20:27:48.657	3	10	10	1	6	4	1	f	1645025201	-892810981	835693996
32	100	7	7	27	CRITICAL	1	2013-09-03 20:26:07	2013-09-03 20:26:07	2013-09-03 20:26:08.633	20	8	8	1	6	4	4	f	-1898659796	181457643	1564996478
36	100	7	7	\N	CRITICAL - 240.0.1.2: rta nan, lost 100%	1	2013-09-03 20:27:47	2013-09-03 20:27:47	2013-09-03 20:27:48.715	21	8	8	1	6	4	1	f	235033388	-1925074422	-1265143684
34	100	6	6	26	WARNING	1	2013-09-03 20:26:27	2013-09-03 20:26:27	2013-09-03 20:26:28.932	9	4	4	1	6	4	4	f	-1091749284	1376891052	300640865
37	100	6	6	\N	CRITICAL - 240.0.1.1: rta nan, lost 100%	1	2013-09-03 20:27:57	2013-09-03 20:27:57	2013-09-03 20:27:58.618	21	8	8	1	6	4	1	f	-530275752	-1904351174	-1030306560
40	100	2	2	\N	OK - 127.0.1.1: rta 0.269ms, lost 0%	1	2013-09-03 20:29:17	2013-09-03 20:29:17	2013-09-03 20:29:51.318	1	9	9	1	6	4	1	f	0	0	-646015311
41	100	9	9	29	CRITICAL	1	2013-09-03 20:30:57	2013-09-03 20:30:57	2013-09-03 20:30:58.672	20	8	8	1	6	4	1	f	1821013981	-1471764900	-1897994449
42	100	2	2	22	WARNING	1	2013-09-03 20:31:17	2013-09-03 20:31:17	2013-09-03 20:31:18.667	9	4	4	1	6	4	1	f	69009757	426426525	-415679854
38	100	11	11	31	OK	1	2013-09-03 20:28:30	2013-09-03 20:28:30	2013-09-03 20:29:06.208	2	9	9	1	6	4	4	f	0	0	1476372896
44	100	8	8	28	OK	1	2013-09-03 20:32:18	2013-09-03 20:32:18	2013-09-03 20:32:51.478	2	9	9	1	6	4	4	f	0	0	2001323857
39	100	9	9	\N	OK - 127.0.1.2: rta 0.068ms, lost 0%	1	2013-09-03 20:28:57	2013-09-03 20:28:57	2013-09-03 20:29:36.282	1	9	9	1	6	4	1	f	0	0	-39235285
43	100	11	11	\N	CRITICAL - 240.0.1.0: rta nan, lost 100%	1	2013-09-03 20:31:27	2013-09-03 20:31:27	2013-09-03 20:31:28.76	21	8	8	1	6	4	1	f	1091996519	917854149	-630905993
45	100	8	8	\N	OK - 127.0.1.0: rta 0.052ms, lost 0%	1	2013-09-03 20:32:27	2013-09-03 20:32:27	2013-09-03 20:33:06.517	1	9	9	1	6	4	1	f	0	0	2132384486
46	100	10	10	30	UNKNOWN	1	2013-09-03 20:33:07	2013-09-03 20:33:07	2013-09-03 20:33:08.654	3	10	10	1	6	4	4	f	1094146992	68542890	2084120059
47	100	10	10	\N	CRITICAL - 240.0.1.3: rta nan, lost 100%	1	2013-09-03 20:34:37	2013-09-03 20:34:37	2013-09-03 20:34:38.666	21	8	8	1	6	4	1	f	361336388	-343612634	-138770964
\.


--
-- Name: logmessage_logmessageid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('logmessage_logmessageid_seq', 47, true);


--
-- Data for Name: logmessageproperty; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY logmessageproperty (logmessageid, propertytypeid, valuestring, valuedate, valueboolean, valueinteger, valuelong, valuedouble, lasteditedon, createdon) FROM stdin;
4	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:45:17.354	2013-09-03 09:45:17.354
4	31	localhost:local_cpu_nagios	\N	\N	\N	\N	\N	2013-09-03 09:45:17.354	2013-09-03 09:45:17.354
5	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:45:47.384	2013-09-03 09:45:47.384
5	31	localhost:local_cpu_perl	\N	\N	\N	\N	\N	2013-09-03 09:45:47.384	2013-09-03 09:45:47.384
6	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:46:17.391	2013-09-03 09:46:17.391
6	31	localhost:local_cpu_syslog-ng	\N	\N	\N	\N	\N	2013-09-03 09:46:17.391	2013-09-03 09:46:17.391
7	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:46:25.564	2013-09-03 09:46:25.564
7	31	localhost:local_cpu_java	\N	\N	\N	\N	\N	2013-09-03 09:46:25.564	2013-09-03 09:46:25.564
8	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:46:47.303	2013-09-03 09:46:47.303
8	31	localhost:local_disk_root	\N	\N	\N	\N	\N	2013-09-03 09:46:47.303	2013-09-03 09:46:47.303
9	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:47:17.334	2013-09-03 09:47:17.334
9	31	localhost:local_load	\N	\N	\N	\N	\N	2013-09-03 09:47:17.334	2013-09-03 09:47:17.334
10	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:47:32.349	2013-09-03 09:47:32.349
10	31	localhost:local_mem_httpd	\N	\N	\N	\N	\N	2013-09-03 09:47:32.349	2013-09-03 09:47:32.349
11	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:48:02.416	2013-09-03 09:48:02.416
11	31	localhost:local_mem_java	\N	\N	\N	\N	\N	2013-09-03 09:48:02.416	2013-09-03 09:48:02.416
12	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:48:32.394	2013-09-03 09:48:32.394
12	31	localhost:local_mem_nagios	\N	\N	\N	\N	\N	2013-09-03 09:48:32.394	2013-09-03 09:48:32.394
13	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:49:02.448	2013-09-03 09:49:02.448
13	31	localhost:local_mem_perl	\N	\N	\N	\N	\N	2013-09-03 09:49:02.448	2013-09-03 09:49:02.448
14	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:49:32.478	2013-09-03 09:49:32.478
14	31	localhost:local_mem_syslog-ng	\N	\N	\N	\N	\N	2013-09-03 09:49:32.478	2013-09-03 09:49:32.478
15	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:50:02.494	2013-09-03 09:50:02.494
15	31	localhost:local_memory	\N	\N	\N	\N	\N	2013-09-03 09:50:02.494	2013-09-03 09:50:02.494
16	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:50:32.56	2013-09-03 09:50:32.56
16	31	localhost:local_nagios_latency	\N	\N	\N	\N	\N	2013-09-03 09:50:32.56	2013-09-03 09:50:32.56
17	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:51:17.523	2013-09-03 09:51:17.523
17	31	localhost:local_process_nagios	\N	\N	\N	\N	\N	2013-09-03 09:51:17.523	2013-09-03 09:51:17.523
18	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:51:47.574	2013-09-03 09:51:47.574
18	31	localhost:local_swap	\N	\N	\N	\N	\N	2013-09-03 09:51:47.574	2013-09-03 09:51:47.574
19	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:52:17.618	2013-09-03 09:52:17.618
19	31	localhost:local_users	\N	\N	\N	\N	\N	2013-09-03 09:52:17.618	2013-09-03 09:52:17.618
20	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:52:35.681	2013-09-03 09:52:35.681
20	31	localhost:local_process_gw_listener	\N	\N	\N	\N	\N	2013-09-03 09:52:35.681	2013-09-03 09:52:35.681
21	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:52:47.618	2013-09-03 09:52:47.617
21	31	localhost:tcp_gw_listener	\N	\N	\N	\N	\N	2013-09-03 09:52:47.618	2013-09-03 09:52:47.618
22	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:53:17.662	2013-09-03 09:53:17.662
22	31	localhost:tcp_http	\N	\N	\N	\N	\N	2013-09-03 09:53:17.662	2013-09-03 09:53:17.662
23	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:53:47.614	2013-09-03 09:53:47.614
23	31	localhost:tcp_nsca	\N	\N	\N	\N	\N	2013-09-03 09:53:47.614	2013-09-03 09:53:47.614
24	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:56:25.663	2013-09-03 09:56:25.663
24	31	localhost:local_cpu_java	\N	\N	\N	\N	\N	2013-09-03 09:56:25.663	2013-09-03 09:56:25.663
25	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 09:59:45.826	2013-09-03 09:59:45.826
25	31	localhost:local_mem_java	\N	\N	\N	\N	\N	2013-09-03 09:59:45.826	2013-09-03 09:59:45.826
26	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 20:03:31.973	2013-09-03 20:03:31.973
26	31	localhost:local_mem_java	\N	\N	\N	\N	\N	2013-09-03 20:03:32.108	2013-09-03 20:03:32.108
27	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 20:04:07.175	2013-09-03 20:04:07.175
27	31	localhost:local_cpu_java	\N	\N	\N	\N	\N	2013-09-03 20:04:07.175	2013-09-03 20:04:07.175
28	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 20:05:27.109	2013-09-03 20:05:27.109
28	31	localhost:local_mem_java	\N	\N	\N	\N	\N	2013-09-03 20:05:27.109	2013-09-03 20:05:27.109
29	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 20:14:07.199	2013-09-03 20:14:07.199
29	31	localhost:local_cpu_java	\N	\N	\N	\N	\N	2013-09-03 20:14:07.199	2013-09-03 20:14:07.199
30	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 20:17:27.253	2013-09-03 20:17:27.253
30	31	localhost:local_mem_java	\N	\N	\N	\N	\N	2013-09-03 20:17:27.253	2013-09-03 20:17:27.253
32	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 20:26:08.635	2013-09-03 20:26:08.635
32	31	host-down-critical:test-critical	\N	\N	\N	\N	\N	2013-09-03 20:26:08.635	2013-09-03 20:26:08.635
33	33	HOST ALERT	\N	\N	\N	\N	\N	2013-09-03 20:26:21.1	2013-09-03 20:26:21.1
33	31	host-up-unknown	\N	\N	\N	\N	\N	2013-09-03 20:26:21.101	2013-09-03 20:26:21.101
34	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 20:26:28.932	2013-09-03 20:26:28.932
34	31	host-down-warning:test-warning	\N	\N	\N	\N	\N	2013-09-03 20:26:28.932	2013-09-03 20:26:28.932
35	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 20:27:48.657	2013-09-03 20:27:48.657
35	31	host-up-unknown:test-unknown	\N	\N	\N	\N	\N	2013-09-03 20:27:48.657	2013-09-03 20:27:48.657
36	33	HOST ALERT	\N	\N	\N	\N	\N	2013-09-03 20:27:48.715	2013-09-03 20:27:48.715
36	31	host-down-critical	\N	\N	\N	\N	\N	2013-09-03 20:27:48.715	2013-09-03 20:27:48.715
37	33	HOST ALERT	\N	\N	\N	\N	\N	2013-09-03 20:27:58.618	2013-09-03 20:27:58.618
37	31	host-down-warning	\N	\N	\N	\N	\N	2013-09-03 20:27:58.618	2013-09-03 20:27:58.618
38	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 20:29:06.208	2013-09-03 20:29:06.208
38	31	host-down-ok:test-ok	\N	\N	\N	\N	\N	2013-09-03 20:29:06.208	2013-09-03 20:29:06.208
39	33	HOST ALERT	\N	\N	\N	\N	\N	2013-09-03 20:29:36.282	2013-09-03 20:29:36.282
39	31	host-up-critical	\N	\N	\N	\N	\N	2013-09-03 20:29:36.282	2013-09-03 20:29:36.282
40	33	HOST ALERT	\N	\N	\N	\N	\N	2013-09-03 20:29:51.318	2013-09-03 20:29:51.318
40	31	host-up-warning	\N	\N	\N	\N	\N	2013-09-03 20:29:51.318	2013-09-03 20:29:51.318
41	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 20:30:58.673	2013-09-03 20:30:58.673
41	31	host-up-critical:test-critical	\N	\N	\N	\N	\N	2013-09-03 20:30:58.673	2013-09-03 20:30:58.673
42	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 20:31:18.667	2013-09-03 20:31:18.667
42	31	host-up-warning:test-warning	\N	\N	\N	\N	\N	2013-09-03 20:31:18.667	2013-09-03 20:31:18.667
43	33	HOST ALERT	\N	\N	\N	\N	\N	2013-09-03 20:31:28.76	2013-09-03 20:31:28.76
43	31	host-down-ok	\N	\N	\N	\N	\N	2013-09-03 20:31:28.76	2013-09-03 20:31:28.76
44	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 20:32:51.478	2013-09-03 20:32:51.478
44	31	host-up-ok:test-ok	\N	\N	\N	\N	\N	2013-09-03 20:32:51.478	2013-09-03 20:32:51.478
45	33	HOST ALERT	\N	\N	\N	\N	\N	2013-09-03 20:33:06.517	2013-09-03 20:33:06.517
45	31	host-up-ok	\N	\N	\N	\N	\N	2013-09-03 20:33:06.517	2013-09-03 20:33:06.517
46	33	SERVICE ALERT	\N	\N	\N	\N	\N	2013-09-03 20:33:08.654	2013-09-03 20:33:08.654
46	31	host-down-unknown:test-unknown	\N	\N	\N	\N	\N	2013-09-03 20:33:08.654	2013-09-03 20:33:08.654
47	33	HOST ALERT	\N	\N	\N	\N	\N	2013-09-03 20:34:38.666	2013-09-03 20:34:38.666
47	31	host-down-unknown	\N	\N	\N	\N	\N	2013-09-03 20:34:38.666	2013-09-03 20:34:38.666
\.


--
-- Data for Name: logperformancedata; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY logperformancedata (logperformancedataid, servicestatusid, lastchecktime, maximum, minimum, average, measurementpoints, performancedatalabelid) FROM stdin;
\.


--
-- Name: logperformancedata_logperformancedataid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('logperformancedata_logperformancedataid_seq', 1, false);


--
-- Data for Name: messagefilter; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY messagefilter (messagefilterid, name, regexpresion, ischangeseveritytostatistic) FROM stdin;
\.


--
-- Name: messagefilter_messagefilterid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('messagefilter_messagefilterid_seq', 1, false);


--
-- Data for Name: monitorlist; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY monitorlist (monitorserverid, deviceid) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
\.


--
-- Data for Name: monitorserver; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY monitorserver (monitorserverid, monitorservername, ip, description) FROM stdin;
1	localhost	127.0.0.1	Default Monitor Server
\.


--
-- Name: monitorserver_monitorserverid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('monitorserver_monitorserverid_seq', 1, true);


--
-- Data for Name: monitorstatus; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY monitorstatus (monitorstatusid, name, description) FROM stdin;
1	UP	UP
2	OK	OK
3	UNKNOWN	UNKNOWN
4	SCHEDULED CRITICAL	SCHEDULED CRITICAL
5	PENDING	PENDING
6	SCHEDULED DOWN	SCHEDULED DOWN
7	UNREACHABLE	UNREACHABLE
8	UNSCHEDULED DOWN	UNSCHEDULED DOWN
9	WARNING	WARNING
10	UNSCHEDULED CRITICAL	UNSCHEDULED CRITICAL
11	ACKNOWLEDGEMENT (WARNING)	ACKNOWLEDGEMENT (WARNING)
12	ACKNOWLEDGEMENT (CRITICAL)	ACKNOWLEDGEMENT (CRITICAL)
13	ACKNOWLEDGEMENT (DOWN)	ACKNOWLEDGEMENT (DOWN)
14	ACKNOWLEDGEMENT (UP)	ACKNOWLEDGEMENT (UP)
15	ACKNOWLEDGEMENT (OK)	ACKNOWLEDGEMENT (OK)
16	ACKNOWLEDGEMENT (UNREACHABLE)	ACKNOWLEDGEMENT (UNREACHABLE)
17	ACKNOWLEDGEMENT (UNKNOWN)	ACKNOWLEDGEMENT (UNKNOWN)
18	ACKNOWLEDGEMENT (PENDING)	ACKNOWLEDGEMENT (PENDING)
19	ACKNOWLEDGEMENT (MAINTENANCE)	ACKNOWLEDGEMENT (MAINTENANCE)
20	CRITICAL	CRITICAL
21	DOWN	DOWN
22	MAINTENANCE	MAINTENANCE
23	SUSPENDED	Virtual Environment specific Host status
\.


--
-- Name: monitorstatus_monitorstatusid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('monitorstatus_monitorstatusid_seq', 23, true);


--
-- Data for Name: network_service_notifications; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY network_service_notifications (id, created_at, guid, type, title, critical, description, webpage_url, webpage_url_description, update_md5, update_url, update_cmd_switch, update_instruction, update_size, update_type, update_os, is_read, is_archived) FROM stdin;
\.


--
-- Name: network_service_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('network_service_notifications_id_seq', 1, false);


--
-- Data for Name: network_service_short_news; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY network_service_short_news (id, status, title, message, url, url_description, is_archived) FROM stdin;
\.


--
-- Name: network_service_short_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('network_service_short_news_id_seq', 1, false);


--
-- Data for Name: network_service_status; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY network_service_status (id, last_checked) FROM stdin;
1	2013-09-03 20:03:49
\.


--
-- Name: network_service_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('network_service_status_id_seq', 1, false);


--
-- Data for Name: operationstatus; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY operationstatus (operationstatusid, name, description) FROM stdin;
1	OPEN	Status OPEN
2	CLOSED	Status CLOSED
3	NOTIFIED	Status NOTIFIED
4	ACCEPTED	Status accepted
\.


--
-- Name: operationstatus_operationstatusid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('operationstatus_operationstatusid_seq', 4, true);


--
-- Data for Name: performancedatalabel; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY performancedatalabel (performancedatalabelid, performancename, servicedisplayname, metriclabel, unit) FROM stdin;
1	Current Load_load1	Load average last minute	Load factor	load
2	Current Load_load5	Load average last 5 minutes	Load factor	load
3	Current Load_load15	Load average last 15 minutes	Load factor	load
4	Current Users_users	Users on System	users	users
5	Root Partition_/	Used space on Root partition	Percentage used	%
6	icmp_ping_alive_rta	Ping round trip average	rta	ms
7	icmp_ping_alive_pl	Process load	pl	%
8	http_alive_time	Web Server time	time	sec
9	http_alive_size	Web Server size	size	kb
\.


--
-- Name: performancedatalabel_performancedatalabelid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('performancedatalabel_performancedatalabelid_seq', 9, true);


--
-- Data for Name: plugin; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY plugin (pluginid, name, url, platformid, dependencies, lastupdatetimestamp, checksum, lastupdatedby) FROM stdin;
\.


--
-- Name: plugin_pluginid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('plugin_pluginid_seq', 1, false);


--
-- Data for Name: pluginplatform; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY pluginplatform (platformid, name, arch, description) FROM stdin;
1	Multiplatform	32	Multiplatform 32 bit
2	Multiplatform	64	Multiplatform 64 bit
3	AIX-PowerPC	32	AIX PowerPC 32 bit
4	AIX-PowerPC	64	AIX PowerPC 64 bit
5	Linux-Intel	32	Linux Intel 32 bit
6	Linux-Intel	64	Linux Intel 64 bit
7	Solaris-Intel	32	Solaris Intel 32 bit
8	Solaris-Intel	64	Solaris Intel 64 bit
9	Solaris-SPARC	32	Solaris SPARC 32 bit
10	Solaris-SPARC	64	Solaris SPARC 64 bit
11	Windows-Intel	32	Windows Intel 32 bit
12	Windows-Intel	64	Windows Intel 64 bit
\.


--
-- Name: pluginplatform_platformid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('pluginplatform_platformid_seq', 12, true);


--
-- Data for Name: priority; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY priority (priorityid, name, description) FROM stdin;
1	1	Lowest Priority in a scale from 1 -10
2	2	Low priority in a scale from 1 -10
3	3	Low priority in a scale from 1 -10
4	4	Low priority in a scale from 1 -10
5	5	Medium priority in a scale from 1 -10
6	6	Medium priority in a scale from 1 -10
7	7	Medium-High priority in a scale from 1 -10
8	8	Medium-High priority in a scale from 1 -10
9	9	High priority in a scale from 1 -10
10	10	Highest priority in a scale from 1 -10
\.


--
-- Name: priority_priorityid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('priority_priorityid_seq', 10, true);


--
-- Data for Name: propertytype; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY propertytype (propertytypeid, name, description, isdate, isboolean, isstring, isinteger, islong, isdouble, isvisible) FROM stdin;
1	LastPluginOutput	Last output received	f	f	t	f	f	f	t
2	LastStateChange	The time of the last change of state	t	f	f	f	f	f	t
3	isAcknowledged	Has the current state been acknowledged?	f	t	f	f	f	f	t
4	TimeUp	The amount of time that the host has been UP	f	f	f	f	t	f	t
5	TimeDown	The amount of time that the host has been DOWN	f	f	f	f	t	f	t
6	TimeUnreachable	The amount of time that the host has been UNREACHABLE	f	f	f	f	t	f	t
7	LastNotificationTime	The time of the last notification	t	f	f	f	f	f	t
8	CurrentNotificationNumber	The count of notifications	f	f	f	t	f	f	t
9	isNotificationsEnabled		f	t	f	f	f	f	t
10	isChecksEnabled		f	t	f	f	f	f	t
11	isEventHandlersEnabled		f	t	f	f	f	f	t
12	isFlapDetectionEnabled		f	t	f	f	f	f	t
13	isHostFlapping		f	t	f	f	f	f	t
14	PercentStateChange		f	f	f	f	f	t	t
15	ScheduledDowntimeDepth		f	f	f	t	f	f	t
16	isFailurePredictionEnabled		f	t	f	f	f	f	t
17	isProcessPerformanceData		f	t	f	f	f	f	t
18	RetryNumber	The number of times an attempt has been made to contact the service	f	f	f	t	f	f	t
19	isAcceptPassiveChecks		f	t	f	f	f	f	t
20	isProblemAcknowledged		f	t	f	f	f	f	t
21	TimeOK	The amount of time that the entity has had a status of OK	f	f	f	f	t	f	t
22	TimeUnknown	The amount of time that the entity has had a status of UNKNOWN	f	f	f	f	t	f	t
23	TimeWarning	The amount of time that the entity has had a status of WARNING	f	f	f	f	t	f	t
24	TimeCritical	The amount of time that the entity has had a status of CRITICAL	f	f	f	f	t	f	t
25	Latency		f	f	f	f	f	t	t
26	ExecutionTime		f	f	f	f	f	t	t
27	isServiceFlapping		f	t	f	f	f	f	t
28	isObsessOverService		f	t	f	f	f	f	t
29	ApplicationName		f	f	t	f	f	f	t
30	ApplicationCode		f	f	t	f	f	f	t
31	SubComponent		f	f	t	f	f	f	t
32	LoggerName		f	f	t	f	f	f	t
33	ErrorType		f	f	t	f	f	f	t
34	30DayMovingAvg		f	f	f	f	f	t	t
35	isPassiveChecksEnabled	Nagios 2.0	f	t	f	f	f	f	t
36	AcknowledgedBy		f	f	t	f	f	f	t
37	AcknowledgeComment		f	f	t	f	f	f	t
38	Parent	List of parent hosts separated by commas	f	f	t	f	f	f	t
39	Alias	Host Alias information	f	f	t	f	f	f	t
40	RRDPath	fully qualified path to RRD image	f	f	t	f	f	f	t
41	RRDLabel	Label for Graph	f	f	t	f	f	f	t
42	RRDCommand	Custom RRD command	f	f	t	f	f	f	t
43	CurrentAttempt	Current attempt running check	f	f	f	f	t	f	t
44	MaxAttempts	Max attempts configured	f	f	f	f	t	f	t
45	isObsessOverHost		f	f	f	t	f	f	t
46	ServiceDependencies		f	f	t	f	f	f	t
47	ExtendedInfo		f	f	t	f	f	f	t
48	Comments	Host or Service Comments in XML format	f	f	t	f	f	f	t
49	CactiRRDCommand	Cacti RRD Command	f	f	t	f	f	f	t
50	RemoteRRDCommand	Remote RRD Command	f	f	t	f	f	f	t
51	Notes	Configuration Notes field	f	f	t	f	f	f	t
52	DeactivationTime	The time when the host was deactivated	f	f	t	f	f	f	t
53	PerformanceData	The last Nagios performance data	f	f	t	f	f	f	t
54	Location	Last output received	f	f	t	f	f	f	t
55	ContactPerson	Last output received	f	f	t	f	f	f	t
56	ContactNumber	Last output received	f	f	t	f	f	f	t
57	ipaddress	ipdddress of snmp device	f	f	t	f	f	f	t
58	Event_OID_numeric	Event_OID_numeric	f	f	t	f	f	f	t
59	Event_OID_symbolic	Event_OID_symbolic of snmp device	f	f	t	f	f	f	t
60	Event_Name	Event_Name	f	f	t	f	f	f	t
61	Category	Category of snmp device	f	f	t	f	f	f	t
62	Variable_Bindings	Variable_Bindings	f	f	t	f	f	f	t
63	UpdatedBy	UpdatedBy	f	f	t	f	f	f	t
\.


--
-- Name: propertytype_propertytypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('propertytype_propertytypeid_seq', 63, true);


--
-- Data for Name: schemainfo; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY schemainfo (name, value) FROM stdin;
Schema Version	7.0.0
Schema created	2
CurrentSchemaVersion	7.0.0
AvailabilityUpdateInterval	60
AvailabilityDataPoints	720
\.


--
-- Data for Name: servicestatus; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY servicestatus (servicestatusid, applicationtypeid, servicedescription, hostid, monitorstatusid, lastchecktime, nextchecktime, laststatechange, lasthardstateid, statetypeid, checktypeid, metrictype, domain, agentid) FROM stdin;
26	100	test-warning	6	9	2013-09-03 20:26:24	2013-09-03 20:36:24	2013-09-03 20:26:51.176	5	2	1	\N	\N	\N
14	100	local_mem_syslog-ng	1	2	2013-09-03 20:26:47	2013-09-03 20:36:47	2013-09-03 20:27:36.215	5	2	1	\N	\N	\N
6	100	local_users	1	2	2013-09-03 20:29:39	2013-09-03 20:39:39	2013-09-03 20:30:36.355	5	2	1	\N	\N	\N
20	100	tcp_http	1	2	2013-09-03 20:30:36	2013-09-03 20:40:36	2013-09-03 20:36:36.813	5	2	1	\N	\N	\N
19	100	tcp_gw_listener	1	2	2013-09-03 20:30:07	2013-09-03 20:40:07	2013-09-03 20:36:36.87	5	2	1	\N	\N	\N
28	100	test-ok	8	2	2013-09-03 20:32:18	2013-09-03 20:42:18	2013-09-03 20:32:51.515	5	2	1	\N	\N	\N
11	100	local_mem_java	1	9	2013-09-03 20:27:22	2013-09-03 20:37:22	2013-09-03 20:36:36.886	5	2	1	\N	\N	\N
13	100	local_mem_perl	1	2	2013-09-03 20:26:19	2013-09-03 20:36:19	2013-09-03 20:36:36.894	5	2	1	\N	\N	\N
9	100	local_memory	1	2	2013-09-03 20:27:16	2013-09-03 20:37:16	2013-09-03 20:36:36.901	5	2	1	\N	\N	\N
27	100	test-critical	7	10	2013-09-03 20:36:03	2013-09-03 20:46:03	2013-09-03 20:36:36.996	5	2	1	\N	\N	\N
16	100	local_process_gw_listener	1	10	2013-09-03 20:28:13	2013-09-03 20:38:13	2013-09-03 20:29:06.305	5	2	1	\N	\N	\N
17	100	local_process_nagios	1	2	2013-09-03 20:28:42	2013-09-03 20:38:42	2013-09-03 20:29:06.339	5	2	1	\N	\N	\N
30	100	test-unknown	10	3	2013-09-03 20:32:57	2013-09-03 20:42:57	2013-09-03 20:33:36.771	5	2	1	\N	\N	\N
25	100	test-pending	5	5	\N	\N	2013-09-03 20:37:36.889	5	2	1	\N	\N	\N
31	100	test-ok	11	2	2013-09-03 20:28:30	2013-09-03 20:38:30	2013-09-03 20:29:06.438	5	2	1	\N	\N	\N
29	100	test-critical	9	10	2013-09-03 20:30:51	2013-09-03 20:40:51	2013-09-03 20:31:21.452	5	2	1	\N	\N	\N
10	100	local_mem_httpd	1	2	2013-09-03 20:34:53	2013-09-03 20:44:53	2013-09-03 20:36:36.823	5	2	1	\N	\N	\N
18	100	local_swap	1	2	2013-09-03 20:29:10	2013-09-03 20:39:10	2013-09-03 20:30:36.385	5	2	1	\N	\N	\N
2	100	local_cpu_java	1	2	2013-09-03 20:34:02	2013-09-03 20:44:02	2013-09-03 20:36:36.832	5	2	1	\N	\N	\N
1	100	local_cpu_httpd	1	2	2013-09-03 20:31:33	2013-09-03 20:41:33	2013-09-03 20:36:36.84	5	2	1	\N	\N	\N
3	100	local_cpu_nagios	1	2	2013-09-03 20:32:30	2013-09-03 20:42:30	2013-09-03 20:33:36.645	5	2	1	\N	\N	\N
12	100	local_mem_nagios	1	2	2013-09-03 20:35:50	2013-09-03 20:45:50	2013-09-03 20:36:36.847	5	2	1	\N	\N	\N
21	100	tcp_nsca	1	2	2013-09-03 20:31:05	2013-09-03 20:41:05	2013-09-03 20:36:36.856	5	2	1	\N	\N	\N
4	100	local_cpu_perl	1	2	2013-09-03 20:32:59	2013-09-03 20:42:59	2013-09-03 20:36:36.863	5	2	1	\N	\N	\N
7	100	local_disk_root	1	2	2013-09-03 20:33:56	2013-09-03 20:43:56	2013-09-03 20:36:36.878	5	2	1	\N	\N	\N
8	100	local_load	1	2	2013-09-03 20:34:25	2013-09-03 20:44:25	2013-09-03 20:36:36.919	5	2	1	\N	\N	\N
15	100	local_nagios_latency	1	2	2013-09-03 20:27:45	2013-09-03 20:37:45	2013-09-03 20:36:36.975	5	2	1	\N	\N	\N
24	100	test-pending	4	5	\N	\N	2013-09-03 20:37:36.882	5	2	1	\N	\N	\N
22	100	test-warning	2	9	2013-09-03 20:31:12	2013-09-03 20:41:12	2013-09-03 20:31:36.446	5	2	1	\N	\N	\N
5	100	local_cpu_syslog-ng	1	2	2013-09-03 20:33:27	2013-09-03 20:43:27	2013-09-03 20:35:06.672	5	2	1	\N	\N	\N
23	100	test-unknown	3	3	2013-09-03 20:27:45	2013-09-03 20:37:45	2013-09-03 20:28:06.223	5	2	1	\N	\N	\N
\.


--
-- Name: servicestatus_servicestatusid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('servicestatus_servicestatusid_seq', 31, true);


--
-- Data for Name: servicestatusproperty; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY servicestatusproperty (servicestatusid, propertytypeid, valuestring, valuedate, valueboolean, valueinteger, valuelong, valuedouble, lasteditedon, createdon) FROM stdin;
6	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.432	2013-09-03 09:44:47.432
6	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.432	2013-09-03 09:44:47.432
6	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.432	2013-09-03 09:44:47.432
6	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:47.432	2013-09-03 09:44:47.432
6	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.432	2013-09-03 09:44:47.432
6	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:47.441	2013-09-03 09:44:47.441
6	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:47.432	2013-09-03 09:44:47.432
6	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.432	2013-09-03 09:44:47.432
6	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.432	2013-09-03 09:44:47.432
6	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:47.432	2013-09-03 09:44:47.432
6	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.432	2013-09-03 09:44:47.432
6	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.432	2013-09-03 09:44:47.432
6	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:47.432	2013-09-03 09:44:47.432
16	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:47.565	2013-09-03 09:44:47.565
16	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.566	2013-09-03 09:44:47.566
16	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.566	2013-09-03 09:44:47.566
16	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.566	2013-09-03 09:44:47.566
16	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.565	2013-09-03 09:44:47.565
16	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.565	2013-09-03 09:44:47.565
16	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:47.566	2013-09-03 09:44:47.566
22	20	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.968	2013-09-03 20:21:50.968
16	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.566	2013-09-03 09:44:47.566
16	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.565	2013-09-03 09:44:47.565
22	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.968	2013-09-03 20:21:50.968
16	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:47.565	2013-09-03 09:44:47.565
16	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.565	2013-09-03 09:44:47.565
20	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.659	2013-09-03 09:44:47.659
20	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.659	2013-09-03 09:44:47.659
20	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:47.659	2013-09-03 09:44:47.659
20	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:47.66	2013-09-03 09:44:47.66
20	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.659	2013-09-03 09:44:47.659
20	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:47.659	2013-09-03 09:44:47.659
20	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.66	2013-09-03 09:44:47.66
20	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:47.659	2013-09-03 09:44:47.659
22	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.968	2013-09-03 20:21:50.968
20	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.659	2013-09-03 09:44:47.659
20	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.659	2013-09-03 09:44:47.659
20	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.66	2013-09-03 09:44:47.66
20	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:47.659	2013-09-03 09:44:47.659
20	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.659	2013-09-03 09:44:47.659
10	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:47.716	2013-09-03 09:44:47.716
10	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.716	2013-09-03 09:44:47.716
10	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:47.717	2013-09-03 09:44:47.717
10	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:47.716	2013-09-03 09:44:47.716
22	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.969	2013-09-03 20:21:50.969
10	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.716	2013-09-03 09:44:47.716
10	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.716	2013-09-03 09:44:47.716
10	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.716	2013-09-03 09:44:47.716
10	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.716	2013-09-03 09:44:47.716
10	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:47.717	2013-09-03 09:44:47.717
10	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.717	2013-09-03 09:44:47.717
10	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.716	2013-09-03 09:44:47.716
10	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.717	2013-09-03 09:44:47.717
10	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:47.716	2013-09-03 09:44:47.716
14	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.79	2013-09-03 09:44:47.79
14	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.789	2013-09-03 09:44:47.789
14	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:47.789	2013-09-03 09:44:47.789
22	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:50.968	2013-09-03 20:21:50.968
14	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.789	2013-09-03 09:44:47.789
14	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.789	2013-09-03 09:44:47.789
14	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:47.79	2013-09-03 09:44:47.79
14	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.789	2013-09-03 09:44:47.789
22	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.969	2013-09-03 20:21:50.969
14	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.789	2013-09-03 09:44:47.789
14	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:47.789	2013-09-03 09:44:47.789
14	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:47.789	2013-09-03 09:44:47.789
14	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.789	2013-09-03 09:44:47.789
14	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:47.789	2013-09-03 09:44:47.789
14	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.79	2013-09-03 09:44:47.79
2	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.88	2013-09-03 09:44:47.88
2	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.879	2013-09-03 09:44:47.879
22	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.968	2013-09-03 20:21:50.968
22	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.968	2013-09-03 20:21:50.968
22	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.969	2013-09-03 20:21:50.969
2	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.879	2013-09-03 09:44:47.879
2	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:47.884	2013-09-03 09:44:47.884
22	19	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.968	2013-09-03 20:21:50.968
2	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:47.879	2013-09-03 09:44:47.879
2	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.88	2013-09-03 09:44:47.88
2	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.878	2013-09-03 09:44:47.878
22	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:50.969	2013-09-03 20:21:50.969
2	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.879	2013-09-03 09:44:47.879
2	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:47.879	2013-09-03 09:44:47.879
2	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.879	2013-09-03 09:44:47.879
2	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.879	2013-09-03 09:44:47.879
3	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:47.947	2013-09-03 09:44:47.947
3	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.948	2013-09-03 09:44:47.948
3	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.948	2013-09-03 09:44:47.948
3	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.947	2013-09-03 09:44:47.947
3	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:47.947	2013-09-03 09:44:47.947
3	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.947	2013-09-03 09:44:47.947
3	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:47.947	2013-09-03 09:44:47.947
3	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:47.948	2013-09-03 09:44:47.948
23	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.988	2013-09-03 20:21:50.988
3	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.947	2013-09-03 09:44:47.947
3	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.947	2013-09-03 09:44:47.947
3	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:47.947	2013-09-03 09:44:47.947
3	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.947	2013-09-03 09:44:47.947
3	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.947	2013-09-03 09:44:47.947
1	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.994	2013-09-03 09:44:47.994
23	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.988	2013-09-03 20:21:50.988
1	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:47.994	2013-09-03 09:44:47.994
1	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:47.995	2013-09-03 09:44:47.995
1	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.994	2013-09-03 09:44:47.994
1	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:47.994	2013-09-03 09:44:47.994
23	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.988	2013-09-03 20:21:50.988
1	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.994	2013-09-03 09:44:47.994
1	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.994	2013-09-03 09:44:47.994
1	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.994	2013-09-03 09:44:47.994
16	43	\N	\N	\N	\N	3	\N	2013-09-03 09:44:47.566	2013-09-03 09:44:47.566
1	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:47.994	2013-09-03 09:44:47.994
1	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:47.995	2013-09-03 09:44:47.995
1	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:47.994	2013-09-03 09:44:47.994
1	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:47.994	2013-09-03 09:44:47.994
1	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:47.994	2013-09-03 09:44:47.994
17	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:48.122	2013-09-03 09:44:48.122
17	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:48.121	2013-09-03 09:44:48.121
17	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:48.122	2013-09-03 09:44:48.122
17	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:48.121	2013-09-03 09:44:48.121
17	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:48.122	2013-09-03 09:44:48.122
17	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:48.122	2013-09-03 09:44:48.122
17	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:48.122	2013-09-03 09:44:48.122
17	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:48.122	2013-09-03 09:44:48.122
17	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:48.122	2013-09-03 09:44:48.122
17	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:48.121	2013-09-03 09:44:48.121
17	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:48.122	2013-09-03 09:44:48.122
17	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:48.122	2013-09-03 09:44:48.122
17	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:48.121	2013-09-03 09:44:48.121
18	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:48.174	2013-09-03 09:44:48.174
18	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:48.174	2013-09-03 09:44:48.174
18	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:48.173	2013-09-03 09:44:48.173
18	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:48.171	2013-09-03 09:44:48.171
18	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:48.174	2013-09-03 09:44:48.174
18	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:48.171	2013-09-03 09:44:48.171
18	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:48.173	2013-09-03 09:44:48.173
18	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:48.174	2013-09-03 09:44:48.174
18	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:48.174	2013-09-03 09:44:48.174
18	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:48.173	2013-09-03 09:44:48.173
18	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:48.174	2013-09-03 09:44:48.174
18	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:48.173	2013-09-03 09:44:48.173
18	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:48.174	2013-09-03 09:44:48.174
12	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:48.308	2013-09-03 09:44:48.308
12	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:48.308	2013-09-03 09:44:48.308
12	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:48.308	2013-09-03 09:44:48.308
12	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:48.308	2013-09-03 09:44:48.308
12	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:48.308	2013-09-03 09:44:48.308
12	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:48.308	2013-09-03 09:44:48.308
12	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:48.308	2013-09-03 09:44:48.308
12	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:48.309	2013-09-03 09:44:48.309
12	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:48.308	2013-09-03 09:44:48.308
12	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:48.308	2013-09-03 09:44:48.308
12	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:48.308	2013-09-03 09:44:48.308
23	19	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.988	2013-09-03 20:21:50.988
12	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:48.308	2013-09-03 09:44:48.308
12	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:48.308	2013-09-03 09:44:48.308
23	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:50.989	2013-09-03 20:21:50.989
21	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:48.404	2013-09-03 09:44:48.404
21	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:48.404	2013-09-03 09:44:48.404
21	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:48.404	2013-09-03 09:44:48.404
21	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:48.404	2013-09-03 09:44:48.404
21	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:48.404	2013-09-03 09:44:48.404
21	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:48.404	2013-09-03 09:44:48.404
21	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:48.404	2013-09-03 09:44:48.404
21	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:48.404	2013-09-03 09:44:48.404
21	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:48.404	2013-09-03 09:44:48.404
21	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:48.404	2013-09-03 09:44:48.404
23	20	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.988	2013-09-03 20:21:50.988
21	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:48.404	2013-09-03 09:44:48.404
21	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:48.405	2013-09-03 09:44:48.405
21	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:48.404	2013-09-03 09:44:48.404
23	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:50.988	2013-09-03 20:21:50.988
4	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.235	2013-09-03 09:44:49.235
4	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:49.235	2013-09-03 09:44:49.235
4	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.235	2013-09-03 09:44:49.235
4	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:49.235	2013-09-03 09:44:49.235
4	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:49.235	2013-09-03 09:44:49.235
4	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:49.235	2013-09-03 09:44:49.235
23	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:50.988	2013-09-03 20:21:50.988
4	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.235	2013-09-03 09:44:49.235
4	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.235	2013-09-03 09:44:49.235
4	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:49.235	2013-09-03 09:44:49.235
4	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.235	2013-09-03 09:44:49.235
4	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:49.235	2013-09-03 09:44:49.235
4	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:49.235	2013-09-03 09:44:49.235
4	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.234	2013-09-03 09:44:49.234
19	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:49.345	2013-09-03 09:44:49.345
19	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.344	2013-09-03 09:44:49.344
19	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:49.345	2013-09-03 09:44:49.345
19	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:49.345	2013-09-03 09:44:49.345
23	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.988	2013-09-03 20:21:50.988
19	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.345	2013-09-03 09:44:49.345
19	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:49.345	2013-09-03 09:44:49.345
19	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:49.344	2013-09-03 09:44:49.344
19	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.344	2013-09-03 09:44:49.344
19	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.345	2013-09-03 09:44:49.345
19	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:49.345	2013-09-03 09:44:49.345
19	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:49.345	2013-09-03 09:44:49.345
19	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.344	2013-09-03 09:44:49.344
19	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.345	2013-09-03 09:44:49.345
13	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.614	2013-09-03 09:44:49.614
13	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:49.614	2013-09-03 09:44:49.614
13	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:49.614	2013-09-03 09:44:49.614
13	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.614	2013-09-03 09:44:49.614
13	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:49.614	2013-09-03 09:44:49.614
13	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.614	2013-09-03 09:44:49.614
13	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:49.614	2013-09-03 09:44:49.614
23	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:50.988	2013-09-03 20:21:50.988
13	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:49.614	2013-09-03 09:44:49.614
13	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.613	2013-09-03 09:44:49.613
13	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.614	2013-09-03 09:44:49.614
13	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.613	2013-09-03 09:44:49.613
23	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:50.988	2013-09-03 20:21:50.988
13	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:49.614	2013-09-03 09:44:49.614
13	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:49.613	2013-09-03 09:44:49.613
8	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.776	2013-09-03 09:44:49.776
8	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:49.779	2013-09-03 09:44:49.779
8	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:49.776	2013-09-03 09:44:49.776
8	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.776	2013-09-03 09:44:49.776
8	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:49.765	2013-09-03 09:44:49.765
8	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:49.776	2013-09-03 09:44:49.776
8	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.764	2013-09-03 09:44:49.764
8	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:49.764	2013-09-03 09:44:49.764
8	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:49.765	2013-09-03 09:44:49.765
24	26	\N	\N	\N	\N	\N	0	2013-09-03 20:21:51.005	2013-09-03 20:21:51.005
8	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.765	2013-09-03 09:44:49.765
5	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:48.061	2013-09-03 09:44:48.061
5	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:48.06	2013-09-03 09:44:48.06
5	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:48.061	2013-09-03 09:44:48.061
5	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:48.061	2013-09-03 09:44:48.061
5	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:48.061	2013-09-03 09:44:48.061
27	14	\N	\N	\N	\N	\N	6.12000000000000011	2013-09-03 20:21:51.389	2013-09-03 20:21:51.389
5	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:48.06	2013-09-03 09:44:48.06
5	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:48.06	2013-09-03 09:44:48.06
5	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:48.061	2013-09-03 09:44:48.061
5	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:48.06	2013-09-03 09:44:48.06
27	25	\N	\N	\N	\N	\N	18	2013-09-03 20:21:51.388	2013-09-03 20:21:51.388
5	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:48.061	2013-09-03 09:44:48.061
5	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:48.061	2013-09-03 09:44:48.061
5	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:48.06	2013-09-03 09:44:48.06
5	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:48.06	2013-09-03 09:44:48.06
7	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:49.449	2013-09-03 09:44:49.449
7	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:49.45	2013-09-03 09:44:49.45
7	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:49.449	2013-09-03 09:44:49.449
7	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.449	2013-09-03 09:44:49.449
7	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.449	2013-09-03 09:44:49.449
7	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:49.449	2013-09-03 09:44:49.449
7	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:49.45	2013-09-03 09:44:49.45
7	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.45	2013-09-03 09:44:49.45
7	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:49.449	2013-09-03 09:44:49.449
7	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.449	2013-09-03 09:44:49.449
7	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.449	2013-09-03 09:44:49.449
7	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:49.449	2013-09-03 09:44:49.449
7	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.449	2013-09-03 09:44:49.449
11	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.538	2013-09-03 09:44:49.538
11	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:49.537	2013-09-03 09:44:49.537
11	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.537	2013-09-03 09:44:49.537
11	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:49.538	2013-09-03 09:44:49.538
11	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.537	2013-09-03 09:44:49.537
11	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:49.538	2013-09-03 09:44:49.538
11	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.537	2013-09-03 09:44:49.537
11	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.537	2013-09-03 09:44:49.537
11	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.538	2013-09-03 09:44:49.538
11	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:49.537	2013-09-03 09:44:49.537
11	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:49.537	2013-09-03 09:44:49.537
9	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.699	2013-09-03 09:44:49.699
9	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.699	2013-09-03 09:44:49.699
9	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:49.7	2013-09-03 09:44:49.7
9	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.699	2013-09-03 09:44:49.699
9	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.701	2013-09-03 09:44:49.701
9	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:49.701	2013-09-03 09:44:49.701
9	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.701	2013-09-03 09:44:49.701
9	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:49.701	2013-09-03 09:44:49.701
9	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:49.701	2013-09-03 09:44:49.701
9	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:49.699	2013-09-03 09:44:49.699
9	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:49.701	2013-09-03 09:44:49.701
9	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:49.701	2013-09-03 09:44:49.701
9	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.701	2013-09-03 09:44:49.701
11	43	\N	\N	\N	\N	3	\N	2013-09-03 09:44:49.538	2013-09-03 09:44:49.538
24	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:51.005	2013-09-03 20:21:51.005
24	10	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.006	2013-09-03 20:21:51.006
24	25	\N	\N	\N	\N	\N	0	2013-09-03 20:21:51.005	2013-09-03 20:21:51.005
24	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:51.006	2013-09-03 20:21:51.006
24	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.006	2013-09-03 20:21:51.006
24	20	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.005	2013-09-03 20:21:51.005
24	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:51.006	2013-09-03 20:21:51.006
24	19	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.005	2013-09-03 20:21:51.005
24	14	\N	\N	\N	\N	\N	0	2013-09-03 20:21:51.006	2013-09-03 20:21:51.006
24	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:51.006	2013-09-03 20:21:51.006
24	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:51.005	2013-09-03 20:21:51.005
24	43	\N	\N	\N	\N	1	\N	2013-09-03 20:21:51.006	2013-09-03 20:21:51.006
24	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.006	2013-09-03 20:21:51.006
24	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.005	2013-09-03 20:21:51.005
25	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.357	2013-09-03 20:21:51.357
25	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.358	2013-09-03 20:21:51.358
25	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.358	2013-09-03 20:21:51.358
25	14	\N	\N	\N	\N	\N	0	2013-09-03 20:21:51.358	2013-09-03 20:21:51.358
25	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:51.358	2013-09-03 20:21:51.358
25	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:51.358	2013-09-03 20:21:51.358
25	26	\N	\N	\N	\N	\N	0	2013-09-03 20:21:51.357	2013-09-03 20:21:51.357
25	10	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.357	2013-09-03 20:21:51.357
25	19	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.357	2013-09-03 20:21:51.357
25	43	\N	\N	\N	\N	1	\N	2013-09-03 20:21:51.358	2013-09-03 20:21:51.358
25	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:51.358	2013-09-03 20:21:51.358
25	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:51.357	2013-09-03 20:21:51.357
25	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:51.357	2013-09-03 20:21:51.357
25	20	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.357	2013-09-03 20:21:51.357
25	25	\N	\N	\N	\N	\N	0	2013-09-03 20:21:51.357	2013-09-03 20:21:51.357
27	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:51.389	2013-09-03 20:21:51.389
27	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.389	2013-09-03 20:21:51.389
27	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.389	2013-09-03 20:21:51.389
27	19	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.389	2013-09-03 20:21:51.389
27	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:51.389	2013-09-03 20:21:51.389
27	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.389	2013-09-03 20:21:51.389
27	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:51.389	2013-09-03 20:21:51.389
27	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:51.389	2013-09-03 20:21:51.389
27	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:51.389	2013-09-03 20:21:51.389
27	20	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.389	2013-09-03 20:21:51.389
27	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.389	2013-09-03 20:21:51.389
27	43	\N	\N	\N	\N	2	\N	2013-09-03 20:21:51.389	2013-09-03 20:21:51.389
27	26	\N	\N	\N	\N	\N	15	2013-09-03 20:21:51.389	2013-09-03 20:21:51.389
8	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.764	2013-09-03 09:44:49.764
8	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:49.776	2013-09-03 09:44:49.776
8	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.764	2013-09-03 09:44:49.764
15	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:49.861	2013-09-03 09:44:49.861
15	8	\N	\N	\N	0	\N	\N	2013-09-03 09:44:49.861	2013-09-03 09:44:49.861
15	11	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.861	2013-09-03 09:44:49.861
15	7	\N	\N	\N	\N	\N	\N	2013-09-03 09:44:49.864	2013-09-03 09:44:49.864
15	19	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.86	2013-09-03 09:44:49.86
15	48	 	\N	\N	\N	\N	\N	2013-09-03 09:44:49.861	2013-09-03 09:44:49.861
15	20	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.86	2013-09-03 09:44:49.86
15	10	\N	\N	t	\N	\N	\N	2013-09-03 09:44:49.861	2013-09-03 09:44:49.861
15	44	\N	\N	\N	\N	3	\N	2013-09-03 09:44:49.861	2013-09-03 09:44:49.861
15	9	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.861	2013-09-03 09:44:49.861
15	12	\N	\N	f	\N	\N	\N	2013-09-03 09:44:49.861	2013-09-03 09:44:49.861
15	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:49.861	2013-09-03 09:44:49.861
15	15	\N	\N	\N	0	\N	\N	2013-09-03 09:44:49.861	2013-09-03 09:44:49.861
3	53	%CPU=0.0;40;50	\N	\N	\N	\N	\N	2013-09-03 09:45:17.704	2013-09-03 09:45:17.704
3	1	OK - total %CPU for process nagios : 0.0	\N	\N	\N	\N	\N	2013-09-03 09:45:17.704	2013-09-03 09:45:17.704
26	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:51.419	2013-09-03 20:21:51.419
26	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.419	2013-09-03 20:21:51.419
26	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.419	2013-09-03 20:21:51.419
26	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.419	2013-09-03 20:21:51.419
26	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:51.419	2013-09-03 20:21:51.419
26	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:51.419	2013-09-03 20:21:51.419
5	1	OK - total %CPU for process syslog-ng : 0.0	\N	\N	\N	\N	\N	2013-09-03 09:46:17.52	2013-09-03 09:46:17.52
5	53	%CPU=0.0;40;50	\N	\N	\N	\N	\N	2013-09-03 09:46:17.521	2013-09-03 09:46:17.521
26	19	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.418	2013-09-03 20:21:51.418
26	20	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.419	2013-09-03 20:21:51.419
26	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:51.419	2013-09-03 20:21:51.419
26	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:51.419	2013-09-03 20:21:51.419
26	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.419	2013-09-03 20:21:51.419
28	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:51.439	2013-09-03 20:21:51.439
28	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:51.439	2013-09-03 20:21:51.439
28	19	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.439	2013-09-03 20:21:51.439
28	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:51.44	2013-09-03 20:21:51.44
28	20	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.439	2013-09-03 20:21:51.439
1	40	/usr/local/groundwork/rrd/localhost_local_cpu_httpd.rrd	\N	\N	\N	\N	\N	2013-09-03 09:48:25.719	2013-09-03 09:48:25.719
1	42	rrdtool graph -   DEF:a="/usr/local/groundwork/rrd/localhost_local_cpu_httpd.rrd":CPU:AVERAGE   DEF:w="/usr/local/groundwork/rrd/localhost_local_cpu_httpd.rrd":CPU_wn:AVERAGE   DEF:c="/usr/local/groundwork/rrd/localhost_local_cpu_httpd.rrd":CPU_cr:AVERAGE   CDEF:cdefa=a   CDEF:cdefb=a,0.99,*   AREA:cdefa#7D1B7E:"Process CPU Utilization"   GPRINT:cdefa:LAST:Current=%.2lf   GPRINT:cdefa:MIN:min=%.2lf   GPRINT:cdefa:AVERAGE:avg=%.2lf   GPRINT:cdefa:MAX:max="%.2lf\\l"   AREA:cdefb#571B7E:   CDEF:cdefw=w  CDEF:cdefc=c   CDEF:cdefm=cdefc,1.01,*   LINE2:cdefw#FFFF00:"Warning Threshold\\:"   GPRINT:cdefw:LAST:"%.2lf"   LINE2:cdefc#FF0033:"Critical Threshold\\:"   GPRINT:cdefc:LAST:"%.2lf\\l"   COMMENT:"Service\\: local_cpu_httpd"  CDEF:cdefws=a,cdefw,GT,a,0,IF AREA:cdefws#FFFF00 CDEF:cdefcs=a,cdefc,GT,a,0,IF AREA:cdefcs#FF0033  CDEF:cdefwt=a,cdefw,GT,cdefw,0,IF LINE:cdefwt#000000 CDEF:cdefct=a,cdefc,GT,cdefc,0,IF LINE:cdefct#000000  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y --height 120 --rigid -u 100 -l 0	\N	\N	\N	\N	\N	2013-09-03 09:48:25.719	2013-09-03 09:48:25.719
1	41	CPU Utilization	\N	\N	\N	\N	\N	2013-09-03 09:48:25.719	2013-09-03 09:48:25.719
1	50	 	\N	\N	\N	\N	\N	2013-09-03 09:48:25.719	2013-09-03 09:48:25.719
2	41	CPU Utilization	\N	\N	\N	\N	\N	2013-09-03 09:48:25.732	2013-09-03 09:48:25.732
2	42	rrdtool graph -   DEF:a="/usr/local/groundwork/rrd/localhost_local_cpu_java.rrd":CPU:AVERAGE   DEF:w="/usr/local/groundwork/rrd/localhost_local_cpu_java.rrd":CPU_wn:AVERAGE   DEF:c="/usr/local/groundwork/rrd/localhost_local_cpu_java.rrd":CPU_cr:AVERAGE   CDEF:cdefa=a   CDEF:cdefb=a,0.99,*   AREA:cdefa#7D1B7E:"Process CPU Utilization"   GPRINT:cdefa:LAST:Current=%.2lf   GPRINT:cdefa:MIN:min=%.2lf   GPRINT:cdefa:AVERAGE:avg=%.2lf   GPRINT:cdefa:MAX:max="%.2lf\\l"   AREA:cdefb#571B7E:   CDEF:cdefw=w  CDEF:cdefc=c   CDEF:cdefm=cdefc,1.01,*   LINE2:cdefw#FFFF00:"Warning Threshold\\:"   GPRINT:cdefw:LAST:"%.2lf"   LINE2:cdefc#FF0033:"Critical Threshold\\:"   GPRINT:cdefc:LAST:"%.2lf\\l"   COMMENT:"Service\\: local_cpu_java"  CDEF:cdefws=a,cdefw,GT,a,0,IF AREA:cdefws#FFFF00 CDEF:cdefcs=a,cdefc,GT,a,0,IF AREA:cdefcs#FF0033  CDEF:cdefwt=a,cdefw,GT,cdefw,0,IF LINE:cdefwt#000000 CDEF:cdefct=a,cdefc,GT,cdefc,0,IF LINE:cdefct#000000  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y --height 120 --rigid -u 100 -l 0	\N	\N	\N	\N	\N	2013-09-03 09:48:25.732	2013-09-03 09:48:25.732
2	40	/usr/local/groundwork/rrd/localhost_local_cpu_java.rrd	\N	\N	\N	\N	\N	2013-09-03 09:48:25.732	2013-09-03 09:48:25.732
2	50	 	\N	\N	\N	\N	\N	2013-09-03 09:48:25.732	2013-09-03 09:48:25.732
3	42	rrdtool graph -   DEF:a="/usr/local/groundwork/rrd/localhost_local_cpu_nagios.rrd":CPU:AVERAGE   DEF:w="/usr/local/groundwork/rrd/localhost_local_cpu_nagios.rrd":CPU_wn:AVERAGE   DEF:c="/usr/local/groundwork/rrd/localhost_local_cpu_nagios.rrd":CPU_cr:AVERAGE   CDEF:cdefa=a   CDEF:cdefb=a,0.99,*   AREA:cdefa#7D1B7E:"Process CPU Utilization"   GPRINT:cdefa:LAST:Current=%.2lf   GPRINT:cdefa:MIN:min=%.2lf   GPRINT:cdefa:AVERAGE:avg=%.2lf   GPRINT:cdefa:MAX:max="%.2lf\\l"   AREA:cdefb#571B7E:   CDEF:cdefw=w  CDEF:cdefc=c   CDEF:cdefm=cdefc,1.01,*   LINE2:cdefw#FFFF00:"Warning Threshold\\:"   GPRINT:cdefw:LAST:"%.2lf"   LINE2:cdefc#FF0033:"Critical Threshold\\:"   GPRINT:cdefc:LAST:"%.2lf\\l"   COMMENT:"Service\\: local_cpu_nagios"  CDEF:cdefws=a,cdefw,GT,a,0,IF AREA:cdefws#FFFF00 CDEF:cdefcs=a,cdefc,GT,a,0,IF AREA:cdefcs#FF0033  CDEF:cdefwt=a,cdefw,GT,cdefw,0,IF LINE:cdefwt#000000 CDEF:cdefct=a,cdefc,GT,cdefc,0,IF LINE:cdefct#000000  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y --height 120 --rigid -u 100 -l 0	\N	\N	\N	\N	\N	2013-09-03 09:48:25.745	2013-09-03 09:48:25.745
3	41	CPU Utilization	\N	\N	\N	\N	\N	2013-09-03 09:48:25.745	2013-09-03 09:48:25.745
3	50	 	\N	\N	\N	\N	\N	2013-09-03 09:48:25.745	2013-09-03 09:48:25.745
3	40	/usr/local/groundwork/rrd/localhost_local_cpu_nagios.rrd	\N	\N	\N	\N	\N	2013-09-03 09:48:25.745	2013-09-03 09:48:25.745
4	50	 	\N	\N	\N	\N	\N	2013-09-03 09:48:25.758	2013-09-03 09:48:25.758
4	41	CPU Utilization	\N	\N	\N	\N	\N	2013-09-03 09:48:25.758	2013-09-03 09:48:25.758
4	40	/usr/local/groundwork/rrd/localhost_local_cpu_perl.rrd	\N	\N	\N	\N	\N	2013-09-03 09:48:25.758	2013-09-03 09:48:25.758
12	53	%MEM=0.0;20;30	\N	\N	\N	\N	\N	2013-09-03 09:48:32.478	2013-09-03 09:48:32.478
12	1	OK - total %MEM for process nagios : 0.0	\N	\N	\N	\N	\N	2013-09-03 09:48:32.478	2013-09-03 09:48:32.478
28	14	\N	\N	\N	\N	\N	0	2013-09-03 20:21:51.439	2013-09-03 20:21:51.439
18	41	Swap Utilization	\N	\N	\N	\N	\N	2013-09-03 09:53:26.034	2013-09-03 09:53:26.034
28	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.439	2013-09-03 20:21:51.439
28	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.439	2013-09-03 20:21:51.439
4	42	rrdtool graph -   DEF:a="/usr/local/groundwork/rrd/localhost_local_cpu_perl.rrd":CPU:AVERAGE   DEF:w="/usr/local/groundwork/rrd/localhost_local_cpu_perl.rrd":CPU_wn:AVERAGE   DEF:c="/usr/local/groundwork/rrd/localhost_local_cpu_perl.rrd":CPU_cr:AVERAGE   CDEF:cdefa=a   CDEF:cdefb=a,0.99,*   AREA:cdefa#7D1B7E:"Process CPU Utilization"   GPRINT:cdefa:LAST:Current=%.2lf   GPRINT:cdefa:MIN:min=%.2lf   GPRINT:cdefa:AVERAGE:avg=%.2lf   GPRINT:cdefa:MAX:max="%.2lf\\l"   AREA:cdefb#571B7E:   CDEF:cdefw=w  CDEF:cdefc=c   CDEF:cdefm=cdefc,1.01,*   LINE2:cdefw#FFFF00:"Warning Threshold\\:"   GPRINT:cdefw:LAST:"%.2lf"   LINE2:cdefc#FF0033:"Critical Threshold\\:"   GPRINT:cdefc:LAST:"%.2lf\\l"   COMMENT:"Service\\: local_cpu_perl"  CDEF:cdefws=a,cdefw,GT,a,0,IF AREA:cdefws#FFFF00 CDEF:cdefcs=a,cdefc,GT,a,0,IF AREA:cdefcs#FF0033  CDEF:cdefwt=a,cdefw,GT,cdefw,0,IF LINE:cdefwt#000000 CDEF:cdefct=a,cdefc,GT,cdefc,0,IF LINE:cdefct#000000  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y --height 120 --rigid -u 100 -l 0	\N	\N	\N	\N	\N	2013-09-03 09:48:25.758	2013-09-03 09:48:25.758
5	42	rrdtool graph -   DEF:a="/usr/local/groundwork/rrd/localhost_local_cpu_syslog-ng.rrd":CPU:AVERAGE   DEF:w="/usr/local/groundwork/rrd/localhost_local_cpu_syslog-ng.rrd":CPU_wn:AVERAGE   DEF:c="/usr/local/groundwork/rrd/localhost_local_cpu_syslog-ng.rrd":CPU_cr:AVERAGE   CDEF:cdefa=a   CDEF:cdefb=a,0.99,*   AREA:cdefa#7D1B7E:"Process CPU Utilization"   GPRINT:cdefa:LAST:Current=%.2lf   GPRINT:cdefa:MIN:min=%.2lf   GPRINT:cdefa:AVERAGE:avg=%.2lf   GPRINT:cdefa:MAX:max="%.2lf\\l"   AREA:cdefb#571B7E:   CDEF:cdefw=w  CDEF:cdefc=c   CDEF:cdefm=cdefc,1.01,*   LINE2:cdefw#FFFF00:"Warning Threshold\\:"   GPRINT:cdefw:LAST:"%.2lf"   LINE2:cdefc#FF0033:"Critical Threshold\\:"   GPRINT:cdefc:LAST:"%.2lf\\l"   COMMENT:"Service\\: local_cpu_syslog-ng"  CDEF:cdefws=a,cdefw,GT,a,0,IF AREA:cdefws#FFFF00 CDEF:cdefcs=a,cdefc,GT,a,0,IF AREA:cdefcs#FF0033  CDEF:cdefwt=a,cdefw,GT,cdefw,0,IF LINE:cdefwt#000000 CDEF:cdefct=a,cdefc,GT,cdefc,0,IF LINE:cdefct#000000  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y --height 120 --rigid -u 100 -l 0	\N	\N	\N	\N	\N	2013-09-03 09:48:25.771	2013-09-03 09:48:25.771
5	41	CPU Utilization	\N	\N	\N	\N	\N	2013-09-03 09:48:25.771	2013-09-03 09:48:25.771
5	50	 	\N	\N	\N	\N	\N	2013-09-03 09:48:25.771	2013-09-03 09:48:25.771
5	40	/usr/local/groundwork/rrd/localhost_local_cpu_syslog-ng.rrd	\N	\N	\N	\N	\N	2013-09-03 09:48:25.771	2013-09-03 09:48:25.771
7	40	/usr/local/groundwork/rrd/localhost_local_disk_root.rrd	\N	\N	\N	\N	\N	2013-09-03 09:48:25.786	2013-09-03 09:48:25.786
7	42	rrdtool graph -   DEF:a="/usr/local/groundwork/rrd/localhost_local_disk_root.rrd":root:AVERAGE   DEF:w="/usr/local/groundwork/rrd/localhost_local_disk_root.rrd":root_wn:AVERAGE  DEF:c="/usr/local/groundwork/rrd/localhost_local_disk_root.rrd":root_cr:AVERAGE  DEF:m="/usr/local/groundwork/rrd/localhost_local_disk_root.rrd":root_mx:AVERAGE  CDEF:cdefa=a,m,/,100,*   CDEF:cdefb=a,0.99,*  CDEF:cdefw=w  CDEF:cdefc=c  CDEF:cdefm=m    AREA:a#C35617:"Space Used\\: "  LINE:cdefa#FFCC00:  GPRINT:a:LAST:"%.2lf MB\\l"  LINE2:cdefw#FFFF00:"Warning Threshold\\:"  GPRINT:cdefw:AVERAGE:"%.2lf"   LINE2:cdefc#FF0033:"Critical Threshold\\:"   GPRINT:cdefc:AVERAGE:"%.2lf\\l"   GPRINT:cdefa:AVERAGE:"Percentage Space Used"=%.2lf  GPRINT:cdefm:AVERAGE:"Maximum Capacity"=%.2lf  CDEF:cdefws=a,cdefw,GT,a,0,IF  AREA:cdefws#FFFF00  CDEF:cdefcs=a,cdefc,GT,a,0,IF  AREA:cdefcs#FF0033  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y  -l 0	\N	\N	\N	\N	\N	2013-09-03 09:48:25.785	2013-09-03 09:48:25.785
7	41	Disk Utilization	\N	\N	\N	\N	\N	2013-09-03 09:48:25.785	2013-09-03 09:48:25.785
7	50	 	\N	\N	\N	\N	\N	2013-09-03 09:48:25.786	2013-09-03 09:48:25.785
8	40	/usr/local/groundwork/rrd/localhost_local_load.rrd	\N	\N	\N	\N	\N	2013-09-03 09:48:25.799	2013-09-03 09:48:25.799
8	50	 	\N	\N	\N	\N	\N	2013-09-03 09:48:25.799	2013-09-03 09:48:25.799
8	42	rrdtool graph - --imgformat=PNG --slope-mode   DEF:a=/usr/local/groundwork/rrd/localhost_local_load.rrd:load1:AVERAGE   DEF:aw="/usr/local/groundwork/rrd/localhost_local_load.rrd":load1_wn:AVERAGE  DEF:ac="/usr/local/groundwork/rrd/localhost_local_load.rrd":load1_cr:AVERAGE  DEF:b=/usr/local/groundwork/rrd/localhost_local_load.rrd:load5:AVERAGE   DEF:bw="/usr/local/groundwork/rrd/localhost_local_load.rrd":load5_wn:AVERAGE  DEF:bc="/usr/local/groundwork/rrd/localhost_local_load.rrd":load5_cr:AVERAGE  DEF:c=/usr/local/groundwork/rrd/localhost_local_load.rrd:load15:AVERAGE  DEF:cw="/usr/local/groundwork/rrd/localhost_local_load.rrd":load15_wn:AVERAGE  DEF:cc="/usr/local/groundwork/rrd/localhost_local_load.rrd":load15_cr:AVERAGE  CDEF:cdefa=a   CDEF:cdefb=b   CDEF:cdefc=c   AREA:cdefa#FF6600:"One Minute Load Average" GPRINT:cdefa:MIN:min=%.2lf  GPRINT:cdefa:AVERAGE:avg=%.2lf    GPRINT:cdefa:MAX:"max=%.2lf\\l"  LINE:aw#FFCC33:"1 min avg Warning Threshold"   GPRINT:aw:LAST:"%.1lf"  LINE:ac#FF0000:"1 min avg Critical Threshold"  GPRINT:ac:LAST:"%.1lf\\l"  LINE2:cdefb#3300FF:"Five Minute Load Average"  GPRINT:cdefb:MIN:min=%.2lf  GPRINT:cdefb:AVERAGE:avg=%.2lf  GPRINT:cdefb:MAX:"max=%.2lf\\l"   LINE:bw#6666CC:"5 min avg Warning Threshold"  GPRINT:bw:LAST:"%.1lf"  LINE:bc#CC0000:"5 min avg Critical Threshold"  GPRINT:bc:LAST:"%.1lf\\l"  LINE3:cdefc#999999:"Fifteen Minute Load Average"     GPRINT:cdefc:MIN:min=%.2lf  GPRINT:cdefc:AVERAGE:avg=%.2lf   GPRINT:cdefc:MAX:"max=%.2lf\\l"   LINE:cw#CCCC99:"15 min avg Warning Threshold"  GPRINT:cw:LAST:"%.1lf"  LINE:cc#990000:"15 min avg Critical Threshold"  GPRINT:cc:LAST:"%.1lf\\l"  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF-Y --height 120	\N	\N	\N	\N	\N	2013-09-03 09:48:25.799	2013-09-03 09:48:25.799
8	41	Load Averages	\N	\N	\N	\N	\N	2013-09-03 09:48:25.799	2013-09-03 09:48:25.799
10	42	rrdtool graph -   DEF:a="/usr/local/groundwork/rrd/localhost_local_mem_httpd.rrd":MEM:AVERAGE   DEF:w="/usr/local/groundwork/rrd/localhost_local_mem_httpd.rrd":MEM_wn:AVERAGE   DEF:c="/usr/local/groundwork/rrd/localhost_local_mem_httpd.rrd":MEM_cr:AVERAGE   CDEF:cdefa=a  CDEF:cdefb=a,0.99,*   CDEF:cdefw=w   CDEF:cdefc=c   CDEF:cdefm=c,1.05,*  AREA:a#33FFFF   AREA:cdefb#3399FF:"Memory Utilized\\:"   GPRINT:a:LAST:"%.2lf Percent"  GPRINT:cdefa:MIN:min=%.2lf  GPRINT:cdefa:AVERAGE:avg=%.2lf  GPRINT:cdefa:MAX:max="%.2lf\\l"   LINE2:cdefw#FFFF00:"Warning Threshold\\:"   GPRINT:cdefw:LAST:"%.2lf"   LINE2:cdefc#FF0033:"Critical Threshold\\:"   GPRINT:cdefc:LAST:"%.2lf\\l"    COMMENT:"Service\\: local_mem_httpd"  CDEF:cdefws=a,cdefw,GT,a,0,IF AREA:cdefws#FFFF00 CDEF:cdefcs=a,cdefc,GT,a,0,IF AREA:cdefcs#FF0033  CDEF:cdefwt=a,cdefw,GT,cdefw,0,IF LINE:cdefwt#000000 CDEF:cdefct=a,cdefc,GT,cdefc,0,IF LINE:cdefct#000000  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y -u 100 -l 0 --rigid	\N	\N	\N	\N	\N	2013-09-03 09:48:25.821	2013-09-03 09:48:25.821
10	50	 	\N	\N	\N	\N	\N	2013-09-03 09:48:25.821	2013-09-03 09:48:25.821
10	41	Memory Utilization	\N	\N	\N	\N	\N	2013-09-03 09:48:25.821	2013-09-03 09:48:25.821
10	40	/usr/local/groundwork/rrd/localhost_local_mem_httpd.rrd	\N	\N	\N	\N	\N	2013-09-03 09:48:25.821	2013-09-03 09:48:25.821
11	41	Memory Utilization	\N	\N	\N	\N	\N	2013-09-03 09:48:25.835	2013-09-03 09:48:25.835
28	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.439	2013-09-03 20:21:51.439
28	43	\N	\N	\N	\N	1	\N	2013-09-03 20:21:51.439	2013-09-03 20:21:51.439
28	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.439	2013-09-03 20:21:51.439
28	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:51.439	2013-09-03 20:21:51.439
28	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:51.439	2013-09-03 20:21:51.439
30	19	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.461	2013-09-03 20:21:51.461
30	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.461	2013-09-03 20:21:51.461
30	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:51.461	2013-09-03 20:21:51.461
30	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:51.461	2013-09-03 20:21:51.461
30	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.461	2013-09-03 20:21:51.461
30	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.461	2013-09-03 20:21:51.461
11	42	rrdtool graph -   DEF:a="/usr/local/groundwork/rrd/localhost_local_mem_java.rrd":MEM:AVERAGE   DEF:w="/usr/local/groundwork/rrd/localhost_local_mem_java.rrd":MEM_wn:AVERAGE   DEF:c="/usr/local/groundwork/rrd/localhost_local_mem_java.rrd":MEM_cr:AVERAGE   CDEF:cdefa=a  CDEF:cdefb=a,0.99,*   CDEF:cdefw=w   CDEF:cdefc=c   CDEF:cdefm=c,1.05,*  AREA:a#33FFFF   AREA:cdefb#3399FF:"Memory Utilized\\:"   GPRINT:a:LAST:"%.2lf Percent"  GPRINT:cdefa:MIN:min=%.2lf  GPRINT:cdefa:AVERAGE:avg=%.2lf  GPRINT:cdefa:MAX:max="%.2lf\\l"   LINE2:cdefw#FFFF00:"Warning Threshold\\:"   GPRINT:cdefw:LAST:"%.2lf"   LINE2:cdefc#FF0033:"Critical Threshold\\:"   GPRINT:cdefc:LAST:"%.2lf\\l"    COMMENT:"Service\\: local_mem_java"  CDEF:cdefws=a,cdefw,GT,a,0,IF AREA:cdefws#FFFF00 CDEF:cdefcs=a,cdefc,GT,a,0,IF AREA:cdefcs#FF0033  CDEF:cdefwt=a,cdefw,GT,cdefw,0,IF LINE:cdefwt#000000 CDEF:cdefct=a,cdefc,GT,cdefc,0,IF LINE:cdefct#000000  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y -u 100 -l 0 --rigid	\N	\N	\N	\N	\N	2013-09-03 09:48:25.835	2013-09-03 09:48:25.835
11	40	/usr/local/groundwork/rrd/localhost_local_mem_java.rrd	\N	\N	\N	\N	\N	2013-09-03 09:48:25.835	2013-09-03 09:48:25.835
11	50	 	\N	\N	\N	\N	\N	2013-09-03 09:48:25.835	2013-09-03 09:48:25.835
12	41	Memory Utilization	\N	\N	\N	\N	\N	2013-09-03 09:48:25.853	2013-09-03 09:48:25.853
12	42	rrdtool graph -   DEF:a="/usr/local/groundwork/rrd/localhost_local_mem_nagios.rrd":MEM:AVERAGE   DEF:w="/usr/local/groundwork/rrd/localhost_local_mem_nagios.rrd":MEM_wn:AVERAGE   DEF:c="/usr/local/groundwork/rrd/localhost_local_mem_nagios.rrd":MEM_cr:AVERAGE   CDEF:cdefa=a  CDEF:cdefb=a,0.99,*   CDEF:cdefw=w   CDEF:cdefc=c   CDEF:cdefm=c,1.05,*  AREA:a#33FFFF   AREA:cdefb#3399FF:"Memory Utilized\\:"   GPRINT:a:LAST:"%.2lf Percent"  GPRINT:cdefa:MIN:min=%.2lf  GPRINT:cdefa:AVERAGE:avg=%.2lf  GPRINT:cdefa:MAX:max="%.2lf\\l"   LINE2:cdefw#FFFF00:"Warning Threshold\\:"   GPRINT:cdefw:LAST:"%.2lf"   LINE2:cdefc#FF0033:"Critical Threshold\\:"   GPRINT:cdefc:LAST:"%.2lf\\l"    COMMENT:"Service\\: local_mem_nagios"  CDEF:cdefws=a,cdefw,GT,a,0,IF AREA:cdefws#FFFF00 CDEF:cdefcs=a,cdefc,GT,a,0,IF AREA:cdefcs#FF0033  CDEF:cdefwt=a,cdefw,GT,cdefw,0,IF LINE:cdefwt#000000 CDEF:cdefct=a,cdefc,GT,cdefc,0,IF LINE:cdefct#000000  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y -u 100 -l 0 --rigid	\N	\N	\N	\N	\N	2013-09-03 09:48:25.853	2013-09-03 09:48:25.853
12	40	/usr/local/groundwork/rrd/localhost_local_mem_nagios.rrd	\N	\N	\N	\N	\N	2013-09-03 09:48:25.853	2013-09-03 09:48:25.853
12	50	 	\N	\N	\N	\N	\N	2013-09-03 09:48:25.853	2013-09-03 09:48:25.853
14	1	OK - total %MEM for process syslog-ng : 0.0	\N	\N	\N	\N	\N	2013-09-03 09:49:32.513	2013-09-03 09:49:32.513
14	53	%MEM=0.0;20;30	\N	\N	\N	\N	\N	2013-09-03 09:49:32.513	2013-09-03 09:49:32.513
6	53	users=1;5;20;0	\N	\N	\N	\N	\N	2013-09-03 09:52:17.637	2013-09-03 09:52:17.637
6	1	USERS OK - 1 users currently logged in	\N	\N	\N	\N	\N	2013-09-03 09:52:17.637	2013-09-03 09:52:17.637
20	1	HTTP OK: HTTP/1.1 200 OK - 1267 bytes in 0.001 second response time	\N	\N	\N	\N	\N	2013-09-03 09:53:17.654	2013-09-03 09:53:17.654
19	1	TCP OK - 0.000 second response time on port 4913	\N	\N	\N	\N	\N	2013-09-03 09:52:47.659	2013-09-03 09:52:47.659
16	1	PROCS CRITICAL: 0 processes with args 'groundwork/foundation/container/lib/jboss'	\N	\N	\N	\N	\N	2013-09-03 09:50:47.575	2013-09-03 09:50:47.575
13	41	Memory Utilization	\N	\N	\N	\N	\N	2013-09-03 09:53:25.919	2013-09-03 09:53:25.919
13	40	/usr/local/groundwork/rrd/localhost_local_mem_perl.rrd	\N	\N	\N	\N	\N	2013-09-03 09:53:25.919	2013-09-03 09:53:25.919
13	50	 	\N	\N	\N	\N	\N	2013-09-03 09:53:25.919	2013-09-03 09:53:25.919
13	42	rrdtool graph -   DEF:a="/usr/local/groundwork/rrd/localhost_local_mem_perl.rrd":MEM:AVERAGE   DEF:w="/usr/local/groundwork/rrd/localhost_local_mem_perl.rrd":MEM_wn:AVERAGE   DEF:c="/usr/local/groundwork/rrd/localhost_local_mem_perl.rrd":MEM_cr:AVERAGE   CDEF:cdefa=a  CDEF:cdefb=a,0.99,*   CDEF:cdefw=w   CDEF:cdefc=c   CDEF:cdefm=c,1.05,*  AREA:a#33FFFF   AREA:cdefb#3399FF:"Memory Utilized\\:"   GPRINT:a:LAST:"%.2lf Percent"  GPRINT:cdefa:MIN:min=%.2lf  GPRINT:cdefa:AVERAGE:avg=%.2lf  GPRINT:cdefa:MAX:max="%.2lf\\l"   LINE2:cdefw#FFFF00:"Warning Threshold\\:"   GPRINT:cdefw:LAST:"%.2lf"   LINE2:cdefc#FF0033:"Critical Threshold\\:"   GPRINT:cdefc:LAST:"%.2lf\\l"    COMMENT:"Service\\: local_mem_perl"  CDEF:cdefws=a,cdefw,GT,a,0,IF AREA:cdefws#FFFF00 CDEF:cdefcs=a,cdefc,GT,a,0,IF AREA:cdefcs#FF0033  CDEF:cdefwt=a,cdefw,GT,cdefw,0,IF LINE:cdefwt#000000 CDEF:cdefct=a,cdefc,GT,cdefc,0,IF LINE:cdefct#000000  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y -u 100 -l 0 --rigid	\N	\N	\N	\N	\N	2013-09-03 09:53:25.919	2013-09-03 09:53:25.919
14	41	Memory Utilization	\N	\N	\N	\N	\N	2013-09-03 09:53:25.935	2013-09-03 09:53:25.935
14	42	rrdtool graph -   DEF:a="/usr/local/groundwork/rrd/localhost_local_mem_syslog-ng.rrd":MEM:AVERAGE   DEF:w="/usr/local/groundwork/rrd/localhost_local_mem_syslog-ng.rrd":MEM_wn:AVERAGE   DEF:c="/usr/local/groundwork/rrd/localhost_local_mem_syslog-ng.rrd":MEM_cr:AVERAGE   CDEF:cdefa=a  CDEF:cdefb=a,0.99,*   CDEF:cdefw=w   CDEF:cdefc=c   CDEF:cdefm=c,1.05,*  AREA:a#33FFFF   AREA:cdefb#3399FF:"Memory Utilized\\:"   GPRINT:a:LAST:"%.2lf Percent"  GPRINT:cdefa:MIN:min=%.2lf  GPRINT:cdefa:AVERAGE:avg=%.2lf  GPRINT:cdefa:MAX:max="%.2lf\\l"   LINE2:cdefw#FFFF00:"Warning Threshold\\:"   GPRINT:cdefw:LAST:"%.2lf"   LINE2:cdefc#FF0033:"Critical Threshold\\:"   GPRINT:cdefc:LAST:"%.2lf\\l"    COMMENT:"Service\\: local_mem_syslog-ng"  CDEF:cdefws=a,cdefw,GT,a,0,IF AREA:cdefws#FFFF00 CDEF:cdefcs=a,cdefc,GT,a,0,IF AREA:cdefcs#FF0033  CDEF:cdefwt=a,cdefw,GT,cdefw,0,IF LINE:cdefwt#000000 CDEF:cdefct=a,cdefc,GT,cdefc,0,IF LINE:cdefct#000000  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y -u 100 -l 0 --rigid	\N	\N	\N	\N	\N	2013-09-03 09:53:25.935	2013-09-03 09:53:25.935
14	40	/usr/local/groundwork/rrd/localhost_local_mem_syslog-ng.rrd	\N	\N	\N	\N	\N	2013-09-03 09:53:25.935	2013-09-03 09:53:25.935
14	50	 	\N	\N	\N	\N	\N	2013-09-03 09:53:25.935	2013-09-03 09:53:25.935
9	40	/usr/local/groundwork/rrd/localhost_local_memory.rrd	\N	\N	\N	\N	\N	2013-09-03 09:53:25.95	2013-09-03 09:53:25.95
17	50	 	\N	\N	\N	\N	\N	2013-09-03 09:53:26.022	2013-09-03 09:53:26.022
17	40	/usr/local/groundwork/rrd/localhost_local_process_nagios.rrd	\N	\N	\N	\N	\N	2013-09-03 09:53:26.022	2013-09-03 09:53:26.022
17	41	Process Count	\N	\N	\N	\N	\N	2013-09-03 09:53:26.022	2013-09-03 09:53:26.022
17	42	rrdtool graph - DEF:a="/usr/local/groundwork/rrd/localhost_local_process_nagios.rrd":number:AVERAGE CDEF:cdefa=a AREA:cdefa#0000FF:"Number of Processes" GPRINT:cdefa:MIN:min=%.2lf GPRINT:cdefa:AVERAGE:avg=%.2lf GPRINT:cdefa:MAX:max=%.2lf  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y --height 120 -l 0	\N	\N	\N	\N	\N	2013-09-03 09:53:26.022	2013-09-03 09:53:26.022
18	40	/usr/local/groundwork/rrd/localhost_local_swap.rrd	\N	\N	\N	\N	\N	2013-09-03 09:53:26.034	2013-09-03 09:53:26.034
18	1	SWAP OK - 100% free (927 MB out of 927 MB)	\N	\N	\N	\N	\N	2013-09-03 09:51:47.619	2013-09-03 09:51:47.619
18	53	swap=927MB;185;92;0;927	\N	\N	\N	\N	\N	2013-09-03 09:51:47.62	2013-09-03 09:51:47.62
30	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:51.461	2013-09-03 20:21:51.461
30	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:51.461	2013-09-03 20:21:51.461
30	20	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.461	2013-09-03 20:21:51.461
30	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.461	2013-09-03 20:21:51.461
9	42	rrdtool graph -   DEF:a="/usr/local/groundwork/rrd/localhost_local_memory.rrd":pct:AVERAGE   DEF:w="/usr/local/groundwork/rrd/localhost_local_memory.rrd":pct_wn:AVERAGE   DEF:c="/usr/local/groundwork/rrd/localhost_local_memory.rrd":pct_cr:AVERAGE   CDEF:cdefa=a  CDEF:cdefb=a,0.99,*   CDEF:cdefw=w   CDEF:cdefc=c   CDEF:cdefm=c,1.05,*  AREA:a#33FFFF   AREA:cdefb#3399FF:"Memory Utilized\\:"   GPRINT:a:LAST:"%.2lf Percent"  GPRINT:cdefa:MIN:min=%.2lf  GPRINT:cdefa:AVERAGE:avg=%.2lf  GPRINT:cdefa:MAX:max="%.2lf\\l"   LINE2:cdefw#FFFF00:"Warning Threshold\\:"   GPRINT:cdefw:LAST:"%.2lf"   LINE2:cdefc#FF0033:"Critical Threshold\\:"   GPRINT:cdefc:LAST:"%.2lf\\l"    COMMENT:"Service\\: local_memory"  CDEF:cdefws=a,cdefw,GT,a,0,IF AREA:cdefws#FFFF00 CDEF:cdefcs=a,cdefc,GT,a,0,IF AREA:cdefcs#FF0033  CDEF:cdefwt=a,cdefw,GT,cdefw,0,IF LINE:cdefwt#000000 CDEF:cdefct=a,cdefc,GT,cdefc,0,IF LINE:cdefct#000000  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y -u 100 -l 0 --rigid	\N	\N	\N	\N	\N	2013-09-03 09:53:25.95	2013-09-03 09:53:25.95
9	41	Memory Utilization	\N	\N	\N	\N	\N	2013-09-03 09:53:25.95	2013-09-03 09:53:25.95
9	50	 	\N	\N	\N	\N	\N	2013-09-03 09:53:25.95	2013-09-03 09:53:25.95
15	50	 	\N	\N	\N	\N	\N	2013-09-03 09:53:25.962	2013-09-03 09:53:25.962
15	41	Nagios Service Check Latency in Seconds	\N	\N	\N	\N	\N	2013-09-03 09:53:25.962	2013-09-03 09:53:25.962
15	40	/usr/local/groundwork/rrd/localhost_local_nagios_latency.rrd	\N	\N	\N	\N	\N	2013-09-03 09:53:25.962	2013-09-03 09:53:25.962
15	42	rrdtool graph -   DEF:a="/usr/local/groundwork/rrd/localhost_local_nagios_latency.rrd":min:AVERAGE   DEF:b="/usr/local/groundwork/rrd/localhost_local_nagios_latency.rrd":max:AVERAGE   DEF:c="/usr/local/groundwork/rrd/localhost_local_nagios_latency.rrd":avg:AVERAGE   CDEF:cdefa=a  CDEF:cdefb=b    CDEF:cdefc=c   AREA:cdefb#66FFFF:"Maximum Latency\\: "  GPRINT:cdefb:LAST:"%.2lf sec"  GPRINT:cdefb:MIN:min=%.2lf   GPRINT:cdefb:AVERAGE:avg=%.2lf     GPRINT:cdefb:MAX:max="%.2lf\\l"   LINE:cdefb#999999  AREA:cdefc#006699:"Average Latency\\: "   GPRINT:c:LAST:"%.2lf sec"  GPRINT:cdefc:MIN:min=%.2lf   GPRINT:cdefc:AVERAGE:avg=%.2lf     GPRINT:cdefc:MAX:max="%.2lf\\l"    LINE:cdefc#999999  AREA:a#333366:"Minimum Latency\\: "   GPRINT:a:LAST:"%.2lf sec"  GPRINT:cdefa:MIN:min=%.2lf   GPRINT:cdefa:AVERAGE:avg=%.2lf     GPRINT:cdefa:MAX:max="%.2lf\\l"   LINE:cdefa#999999   -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y -l 0	\N	\N	\N	\N	\N	2013-09-03 09:53:25.962	2013-09-03 09:53:25.962
16	42	rrdtool graph - DEF:a="/usr/local/groundwork/rrd/localhost_local_process_gw_listener.rrd":number:AVERAGE CDEF:cdefa=a AREA:cdefa#0000FF:"Number of Processes" GPRINT:cdefa:MIN:min=%.2lf GPRINT:cdefa:AVERAGE:avg=%.2lf GPRINT:cdefa:MAX:max=%.2lf  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y --height 120 -l 0	\N	\N	\N	\N	\N	2013-09-03 09:53:25.984	2013-09-03 09:53:25.984
16	40	/usr/local/groundwork/rrd/localhost_local_process_gw_listener.rrd	\N	\N	\N	\N	\N	2013-09-03 09:53:25.984	2013-09-03 09:53:25.984
16	50	 	\N	\N	\N	\N	\N	2013-09-03 09:53:25.984	2013-09-03 09:53:25.984
16	41	Process Count	\N	\N	\N	\N	\N	2013-09-03 09:53:25.984	2013-09-03 09:53:25.984
30	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:51.461	2013-09-03 20:21:51.461
29	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:51.479	2013-09-03 20:21:51.479
29	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.479	2013-09-03 20:21:51.479
29	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:51.478	2013-09-03 20:21:51.478
29	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.479	2013-09-03 20:21:51.479
29	20	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.478	2013-09-03 20:21:51.478
29	19	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.478	2013-09-03 20:21:51.478
29	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:51.479	2013-09-03 20:21:51.479
29	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:51.479	2013-09-03 20:21:51.479
29	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:51.479	2013-09-03 20:21:51.479
29	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.478	2013-09-03 20:21:51.478
29	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.479	2013-09-03 20:21:51.479
31	20	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.495	2013-09-03 20:21:51.495
31	10	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.496	2013-09-03 20:21:51.496
31	43	\N	\N	\N	\N	1	\N	2013-09-03 20:21:51.496	2013-09-03 20:21:51.496
31	9	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.495	2013-09-03 20:21:51.495
31	8	\N	\N	\N	0	\N	\N	2013-09-03 20:21:51.496	2013-09-03 20:21:51.496
31	7	\N	\N	\N	\N	\N	\N	2013-09-03 20:21:51.496	2013-09-03 20:21:51.496
31	44	\N	\N	\N	\N	3	\N	2013-09-03 20:21:51.495	2013-09-03 20:21:51.495
31	48	 	\N	\N	\N	\N	\N	2013-09-03 20:21:51.496	2013-09-03 20:21:51.496
31	12	\N	\N	f	\N	\N	\N	2013-09-03 20:21:51.496	2013-09-03 20:21:51.496
31	14	\N	\N	\N	\N	\N	0	2013-09-03 20:21:51.496	2013-09-03 20:21:51.496
31	11	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.496	2013-09-03 20:21:51.496
31	19	\N	\N	t	\N	\N	\N	2013-09-03 20:21:51.495	2013-09-03 20:21:51.495
31	15	\N	\N	\N	0	\N	\N	2013-09-03 20:21:51.496	2013-09-03 20:21:51.496
17	1	NAGIOS OK: 3 processes, status log updated 5 seconds ago	\N	\N	\N	\N	\N	2013-09-03 09:51:17.553	2013-09-03 09:51:17.553
11	25	\N	\N	\N	\N	\N	542	2013-09-03 09:44:49.537	2013-09-03 09:44:49.537
11	14	\N	\N	\N	\N	\N	17.9600000000000009	2013-09-03 09:44:49.538	2013-09-03 09:44:49.538
11	26	\N	\N	\N	\N	\N	69	2013-09-03 09:44:49.537	2013-09-03 09:44:49.537
31	1	OK	\N	\N	\N	\N	\N	2013-09-03 20:29:06.44	2013-09-03 20:29:06.44
31	25	\N	\N	\N	\N	\N	603	2013-09-03 20:21:51.495	2013-09-03 20:21:51.495
31	26	\N	\N	\N	\N	\N	3	2013-09-03 20:21:51.495	2013-09-03 20:21:51.495
29	1	CRITICAL	\N	\N	\N	\N	\N	2013-09-03 20:29:21.347	2013-09-03 20:29:21.347
29	26	\N	\N	\N	\N	\N	5	2013-09-03 20:21:51.478	2013-09-03 20:21:51.478
29	25	\N	\N	\N	\N	\N	715	2013-09-03 20:21:51.478	2013-09-03 20:21:51.478
29	14	\N	\N	\N	\N	\N	6.25	2013-09-03 20:21:51.479	2013-09-03 20:21:51.479
29	43	\N	\N	\N	\N	3	\N	2013-09-03 20:21:51.479	2013-09-03 20:21:51.479
3	26	\N	\N	\N	\N	\N	115	2013-09-03 09:44:47.947	2013-09-03 09:44:47.947
4	1	OK - total %CPU for process perl : 0.7	\N	\N	\N	\N	\N	2013-09-03 09:45:47.903	2013-09-03 09:45:47.903
4	53	%CPU=0.7;40;50	\N	\N	\N	\N	\N	2013-09-03 09:45:47.903	2013-09-03 09:45:47.903
4	26	\N	\N	\N	\N	\N	482	2013-09-03 09:44:49.235	2013-09-03 09:44:49.235
4	25	\N	\N	\N	\N	\N	851	2013-09-03 09:44:49.234	2013-09-03 09:44:49.234
30	14	\N	\N	\N	\N	\N	6.25	2013-09-03 20:21:51.461	2013-09-03 20:21:51.461
30	43	\N	\N	\N	\N	2	\N	2013-09-03 20:21:51.461	2013-09-03 20:21:51.461
5	26	\N	\N	\N	\N	\N	66	2013-09-03 09:44:48.06	2013-09-03 09:44:48.06
5	25	\N	\N	\N	\N	\N	876	2013-09-03 09:44:48.06	2013-09-03 09:44:48.06
7	25	\N	\N	\N	\N	\N	911	2013-09-03 09:44:49.449	2013-09-03 09:44:49.449
7	26	\N	\N	\N	\N	\N	3	2013-09-03 09:44:49.449	2013-09-03 09:44:49.449
18	42	rrdtool graph -   DEF:a="/usr/local/groundwork/rrd/localhost_local_swap.rrd":swap:AVERAGE   DEF:w="/usr/local/groundwork/rrd/localhost_local_swap.rrd":swap_wn:AVERAGE   DEF:c="/usr/local/groundwork/rrd/localhost_local_swap.rrd":swap_cr:AVERAGE   DEF:m="/usr/local/groundwork/rrd/localhost_local_swap.rrd":swap_mx:AVERAGE   CDEF:cdefa=a,m,/,100,*   CDEF:cdefw=w  CDEF:cdefc=c  CDEF:cdefm=m   AREA:a#9900FF:"Swap Free\\: "   LINE2:a#6600FF:   GPRINT:a:LAST:"%.2lf MB\\l"   CDEF:cdefws=a,cdefw,LT,a,0,IF  AREA:cdefws#FFFF00  CDEF:cdefcs=a,cdefc,LT,a,0,IF  AREA:cdefcs#FF0033   LINE2:cdefw#FFFF00:"Warning Threshold\\:"   GPRINT:cdefw:AVERAGE:"%.2lf"   LINE2:cdefc#FF0033:"Critical Threshold\\:"   GPRINT:cdefc:AVERAGE:"%.2lf\\l"   GPRINT:cdefa:AVERAGE:"Percentage Swap Free"=%.2lf   GPRINT:cdefm:AVERAGE:"Total Swap Space=%.2lf"   -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y -l 0	\N	\N	\N	\N	\N	2013-09-03 09:53:26.034	2013-09-03 09:53:26.034
18	50	 	\N	\N	\N	\N	\N	2013-09-03 09:53:26.034	2013-09-03 09:53:26.034
6	40	/usr/local/groundwork/rrd/localhost_local_users.rrd	\N	\N	\N	\N	\N	2013-09-03 09:53:26.048	2013-09-03 09:53:26.048
6	50	 	\N	\N	\N	\N	\N	2013-09-03 09:53:26.048	2013-09-03 09:53:26.048
6	41	Current Users	\N	\N	\N	\N	\N	2013-09-03 09:53:26.048	2013-09-03 09:53:26.048
6	42	rrdtool graph - --imgformat=PNG --slope-mode DEF:a=/usr/local/groundwork/rrd/localhost_local_users.rrd:users:AVERAGE  CDEF:cdefa=a  AREA:cdefa#0033CC:"Number of logged in users" -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF-Y --height 120	\N	\N	\N	\N	\N	2013-09-03 09:53:26.048	2013-09-03 09:53:26.048
19	41	Foundation Listener Response Time	\N	\N	\N	\N	\N	2013-09-03 09:53:26.06	2013-09-03 09:53:26.06
19	50	 	\N	\N	\N	\N	\N	2013-09-03 09:53:26.06	2013-09-03 09:53:26.06
19	42	rrdtool graph -   DEF:a="/usr/local/groundwork/rrd/localhost_tcp_gw_listener.rrd":time:AVERAGE  DEF:w="/usr/local/groundwork/rrd/localhost_tcp_gw_listener.rrd":time_wn:AVERAGE  DEF:c="/usr/local/groundwork/rrd/localhost_tcp_gw_listener.rrd":time_cr:AVERAGE  CDEF:cdefa=a CDEF:cdefb=a,0.99,*  CDEF:cdefw=w  CDEF:cdefc=c   AREA:a#33FFFF  AREA:cdefb#00CF00:"Response Time\\:"  GPRINT:a:LAST:"%.4lf Seconds"    GPRINT:a:MIN:min=%.2lf  GPRINT:a:AVERAGE:avg=%.2lf  GPRINT:a:MAX:max="%.2lf\\l"  LINE2:cdefw#FFFF00:"Warning Threshold\\:"  GPRINT:cdefw:LAST:"%.2lf"  LINE2:cdefc#FF0033:"Critical Threshold\\:"  GPRINT:cdefc:LAST:"%.2lf\\l"    COMMENT:"Host\\: localhost\\l" COMMENT:"Service\\: tcp_gw_listener"  CDEF:cdefws=a,cdefw,GT,a,0,IF AREA:cdefws#FFFF00 CDEF:cdefcs=a,cdefc,GT,a,0,IF AREA:cdefcs#FF0033  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y -l 0	\N	\N	\N	\N	\N	2013-09-03 09:53:26.06	2013-09-03 09:53:26.06
19	40	/usr/local/groundwork/rrd/localhost_tcp_gw_listener.rrd	\N	\N	\N	\N	\N	2013-09-03 09:53:26.06	2013-09-03 09:53:26.06
20	40	/usr/local/groundwork/rrd/localhost_tcp_http.rrd	\N	\N	\N	\N	\N	2013-09-03 09:53:26.073	2013-09-03 09:53:26.073
20	42	rrdtool graph -   DEF:a="/usr/local/groundwork/rrd/localhost_tcp_http.rrd":time:AVERAGE  DEF:w="/usr/local/groundwork/rrd/localhost_tcp_http.rrd":time_wn:AVERAGE  DEF:c="/usr/local/groundwork/rrd/localhost_tcp_http.rrd":time_cr:AVERAGE  CDEF:cdefa=a CDEF:cdefb=a,0.99,*  CDEF:cdefw=w  CDEF:cdefc=c   AREA:a#33FFFF  AREA:cdefb#00CF00:"Response Time\\:"  GPRINT:a:LAST:"%.4lf Seconds"    GPRINT:a:MIN:min=%.2lf  GPRINT:a:AVERAGE:avg=%.2lf  GPRINT:a:MAX:max="%.2lf\\l"  LINE2:cdefw#FFFF00:"Warning Threshold\\:"  GPRINT:cdefw:LAST:"%.2lf"  LINE2:cdefc#FF0033:"Critical Threshold\\:"  GPRINT:cdefc:LAST:"%.2lf\\l"    COMMENT:"Host\\: localhost\\l" COMMENT:"Service\\: tcp_http"  CDEF:cdefws=a,cdefw,GT,a,0,IF AREA:cdefws#FFFF00 CDEF:cdefcs=a,cdefc,GT,a,0,IF AREA:cdefcs#FF0033  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y -l 0	\N	\N	\N	\N	\N	2013-09-03 09:53:26.073	2013-09-03 09:53:26.073
20	50	 	\N	\N	\N	\N	\N	2013-09-03 09:53:26.073	2013-09-03 09:53:26.073
20	41	HTTP Response Time	\N	\N	\N	\N	\N	2013-09-03 09:53:26.073	2013-09-03 09:53:26.073
1	53	%CPU=0.0;40;50	\N	\N	\N	\N	\N	2013-09-03 09:44:47.994	2013-09-03 09:44:47.994
10	1	OK - total %MEM for process httpd : 2.5	\N	\N	\N	\N	\N	2013-09-03 09:47:32.391	2013-09-03 09:47:32.391
10	53	%MEM=2.5;20;30	\N	\N	\N	\N	\N	2013-09-03 09:47:32.392	2013-09-03 09:47:32.392
27	1	CRITICAL	\N	\N	\N	\N	\N	2013-09-03 20:25:36.099	2013-09-03 20:25:36.099
26	1	WARNING	\N	\N	\N	\N	\N	2013-09-03 20:25:51.174	2013-09-03 20:25:51.174
26	25	\N	\N	\N	\N	\N	444	2013-09-03 20:21:51.418	2013-09-03 20:21:51.418
26	26	\N	\N	\N	\N	\N	10	2013-09-03 20:21:51.419	2013-09-03 20:21:51.419
1	1	OK - total %CPU for process httpd : 0.0	\N	\N	\N	\N	\N	2013-09-03 09:44:47.994	2013-09-03 09:44:47.994
2	43	\N	\N	\N	\N	1	\N	2013-09-03 09:44:47.879	2013-09-03 09:44:47.879
23	14	\N	\N	\N	\N	\N	6.25	2013-09-03 20:21:50.988	2013-09-03 20:21:50.988
22	1	WARNING	\N	\N	\N	\N	\N	2013-09-03 20:29:36.345	2013-09-03 20:29:36.345
21	41	NSCA Response Time	\N	\N	\N	\N	\N	2013-09-03 09:58:25.964	2013-09-03 09:58:25.964
21	50	 	\N	\N	\N	\N	\N	2013-09-03 09:58:25.964	2013-09-03 09:58:25.964
21	42	rrdtool graph -   DEF:a="/usr/local/groundwork/rrd/localhost_tcp_nsca.rrd":time:AVERAGE  DEF:w="/usr/local/groundwork/rrd/localhost_tcp_nsca.rrd":time_wn:AVERAGE  DEF:c="/usr/local/groundwork/rrd/localhost_tcp_nsca.rrd":time_cr:AVERAGE  CDEF:cdefa=a CDEF:cdefb=a,0.99,*  CDEF:cdefw=w CDEF:cdefc=c  AREA:a#33FFFF AREA:cdefb#00CF00:"Response Time\\:"  GPRINT:a:LAST:"%.4lf Seconds"    GPRINT:a:MIN:min=%.4lf  GPRINT:a:AVERAGE:avg=%.4lf  GPRINT:a:MAX:max="%.4lf\\l"  LINE2:cdefw#FFFF00:"Warning Threshold\\:"  GPRINT:cdefw:LAST:"%.2lf"  LINE2:cdefc#FF0033:"Critical Threshold\\:"  GPRINT:cdefc:LAST:"%.2lf\\l"    COMMENT:"Host\\: localhost\\l" COMMENT:"Service\\: tcp_nsca"  CDEF:cdefws=a,cdefw,GT,a,0,IF AREA:cdefws#FFFF00 CDEF:cdefcs=a,cdefc,GT,a,0,IF AREA:cdefcs#FF0033  -c BACK#FFFFFF -c CANVAS#FFFFFF -c GRID#C0C0C0 -c MGRID#404040 -c ARROW#FFFFFF -Y -l 0	\N	\N	\N	\N	\N	2013-09-03 09:58:25.964	2013-09-03 09:58:25.964
21	40	/usr/local/groundwork/rrd/localhost_tcp_nsca.rrd	\N	\N	\N	\N	\N	2013-09-03 09:58:25.965	2013-09-03 09:58:25.965
22	26	\N	\N	\N	\N	\N	3	2013-09-03 20:21:50.968	2013-09-03 20:21:50.968
19	53	time=0.000367s;5.000000;9.000000;0.000000;10.000000	\N	\N	\N	\N	\N	2013-09-03 09:52:47.659	2013-09-03 09:52:47.659
22	14	\N	\N	\N	\N	\N	6.25	2013-09-03 20:21:50.969	2013-09-03 20:21:50.969
22	25	\N	\N	\N	\N	\N	734	2013-09-03 20:21:50.968	2013-09-03 20:21:50.968
22	43	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.969	2013-09-03 20:21:50.969
21	53	time=0.001566s;5.000000;9.000000;0.000000;10.000000	\N	\N	\N	\N	\N	2013-09-03 09:53:47.612	2013-09-03 09:53:47.612
21	25	\N	\N	\N	\N	\N	727	2013-09-03 09:44:48.404	2013-09-03 09:44:48.404
7	53	/=2886MB;7285;7713;0;8571	\N	\N	\N	\N	\N	2013-09-03 09:46:47.464	2013-09-03 09:46:47.464
8	26	\N	\N	\N	\N	\N	6	2013-09-03 09:44:49.764	2013-09-03 09:44:49.764
10	25	\N	\N	\N	\N	\N	960	2013-09-03 09:44:47.716	2013-09-03 09:44:47.716
10	26	\N	\N	\N	\N	\N	155	2013-09-03 09:44:47.716	2013-09-03 09:44:47.716
12	26	\N	\N	\N	\N	\N	67	2013-09-03 09:44:48.308	2013-09-03 09:44:48.308
12	25	\N	\N	\N	\N	\N	8	2013-09-03 09:44:48.308	2013-09-03 09:44:48.308
2	1	OK - total %CPU for process java : 11.4	\N	\N	\N	\N	\N	2013-09-03 09:44:47.879	2013-09-03 09:44:47.879
2	53	%CPU=11.4;40;50	\N	\N	\N	\N	\N	2013-09-03 09:44:47.879	2013-09-03 09:44:47.879
23	1	UNKNOWN	\N	\N	\N	\N	\N	2013-09-03 20:26:06.152	2013-09-03 20:26:06.152
26	14	\N	\N	\N	\N	\N	6.25	2013-09-03 20:21:51.419	2013-09-03 20:21:51.419
26	43	\N	\N	\N	\N	2	\N	2013-09-03 20:21:51.419	2013-09-03 20:21:51.419
23	26	\N	\N	\N	\N	\N	12	2013-09-03 20:21:50.988	2013-09-03 20:21:50.988
23	25	\N	\N	\N	\N	\N	562	2013-09-03 20:21:50.988	2013-09-03 20:21:50.988
20	53	time=0.000802s;3.000000;5.000000;0.000000 size=1267B;;;0	\N	\N	\N	\N	\N	2013-09-03 09:53:17.654	2013-09-03 09:53:17.654
20	25	\N	\N	\N	\N	\N	703	2013-09-03 09:44:47.659	2013-09-03 09:44:47.659
20	26	\N	\N	\N	\N	\N	4	2013-09-03 09:44:47.659	2013-09-03 09:44:47.659
1	26	\N	\N	\N	\N	\N	195	2013-09-03 09:44:47.994	2013-09-03 09:44:47.994
1	25	\N	\N	\N	\N	\N	753	2013-09-03 09:44:47.993	2013-09-03 09:44:47.993
30	1	UNKNOWN	\N	\N	\N	\N	\N	2013-09-03 20:32:36.538	2013-09-03 20:32:36.538
3	25	\N	\N	\N	\N	\N	827	2013-09-03 09:44:47.947	2013-09-03 09:44:47.947
30	25	\N	\N	\N	\N	\N	849	2013-09-03 20:21:51.461	2013-09-03 20:21:51.461
30	26	\N	\N	\N	\N	\N	6	2013-09-03 20:21:51.461	2013-09-03 20:21:51.461
2	14	\N	\N	\N	\N	\N	11.8399999999999999	2013-09-03 09:44:47.879	2013-09-03 09:44:47.879
2	26	\N	\N	\N	\N	\N	67	2013-09-03 09:44:47.879	2013-09-03 09:44:47.879
2	25	\N	\N	\N	\N	\N	917	2013-09-03 09:44:47.878	2013-09-03 09:44:47.878
7	1	DISK OK - free space: / 5249 MB (64% inode=83%):	\N	\N	\N	\N	\N	2013-09-03 09:46:47.464	2013-09-03 09:46:47.464
14	26	\N	\N	\N	\N	\N	77	2013-09-03 09:44:47.789	2013-09-03 09:44:47.789
14	25	\N	\N	\N	\N	\N	507	2013-09-03 09:44:47.789	2013-09-03 09:44:47.789
13	1	OK - total %MEM for process perl : 11.6	\N	\N	\N	\N	\N	2013-09-03 09:49:02.655	2013-09-03 09:49:02.655
13	53	%MEM=11.6;20;30	\N	\N	\N	\N	\N	2013-09-03 09:49:02.656	2013-09-03 09:49:02.656
13	25	\N	\N	\N	\N	\N	440	2013-09-03 09:44:49.613	2013-09-03 09:44:49.613
13	26	\N	\N	\N	\N	\N	448	2013-09-03 09:44:49.613	2013-09-03 09:44:49.613
9	25	\N	\N	\N	\N	\N	535	2013-09-03 09:44:49.699	2013-09-03 09:44:49.699
9	26	\N	\N	\N	\N	\N	13	2013-09-03 09:44:49.699	2013-09-03 09:44:49.699
9	1	Memory OK - 67.0% (1795164 kB) used	\N	\N	\N	\N	\N	2013-09-03 09:50:02.616	2013-09-03 09:50:02.616
9	53	pct=67.0;95;99;0;100	\N	\N	\N	\N	\N	2013-09-03 09:50:02.616	2013-09-03 09:50:02.616
23	43	\N	\N	\N	\N	3	\N	2013-09-03 20:21:50.988	2013-09-03 20:21:50.988
16	26	\N	\N	\N	\N	\N	28	2013-09-03 09:44:47.565	2013-09-03 09:44:47.565
16	25	\N	\N	\N	\N	\N	585	2013-09-03 09:44:47.565	2013-09-03 09:44:47.565
17	25	\N	\N	\N	\N	\N	617	2013-09-03 09:44:48.121	2013-09-03 09:44:48.121
17	26	\N	\N	\N	\N	\N	17	2013-09-03 09:44:48.121	2013-09-03 09:44:48.121
11	53	%MEM=44.7;40;50	\N	\N	\N	\N	\N	2013-09-03 09:48:02.549	2013-09-03 09:48:02.549
11	1	WARNING - total %MEM for process java : 44.7	\N	\N	\N	\N	\N	2013-09-03 09:48:02.549	2013-09-03 09:48:02.549
15	25	\N	\N	\N	\N	\N	561	2013-09-03 09:44:49.86	2013-09-03 09:44:49.86
15	1	OK: Nagios latency: Min=0.000, Max=0.939, Avg=0.436	\N	\N	\N	\N	\N	2013-09-03 09:50:32.856	2013-09-03 09:50:32.856
15	53	Min=0.000;;;; Max=0.939;;;; Avg=0.436;300;900;;	\N	\N	\N	\N	\N	2013-09-03 09:50:32.856	2013-09-03 09:50:32.856
15	26	\N	\N	\N	\N	\N	37	2013-09-03 09:44:49.86	2013-09-03 09:44:49.86
6	25	\N	\N	\N	\N	\N	669	2013-09-03 09:44:47.432	2013-09-03 09:44:47.432
6	26	\N	\N	\N	\N	\N	5	2013-09-03 09:44:47.432	2013-09-03 09:44:47.432
18	26	\N	\N	\N	\N	\N	3	2013-09-03 09:44:48.173	2013-09-03 09:44:48.173
16	14	\N	\N	\N	\N	\N	0	2013-09-03 09:44:47.566	2013-09-03 09:44:47.566
18	25	\N	\N	\N	\N	\N	640	2013-09-03 09:44:48.171	2013-09-03 09:44:48.171
19	26	\N	\N	\N	\N	\N	4	2013-09-03 09:44:49.344	2013-09-03 09:44:49.344
19	25	\N	\N	\N	\N	\N	687	2013-09-03 09:44:49.344	2013-09-03 09:44:49.344
21	1	TCP OK - 0.002 second response time on port 5667	\N	\N	\N	\N	\N	2013-09-03 09:53:47.612	2013-09-03 09:53:47.612
21	26	\N	\N	\N	\N	\N	8	2013-09-03 09:44:48.404	2013-09-03 09:44:48.404
28	1	OK	\N	\N	\N	\N	\N	2013-09-03 20:32:51.517	2013-09-03 20:32:51.517
28	25	\N	\N	\N	\N	\N	817	2013-09-03 20:21:51.439	2013-09-03 20:21:51.439
28	26	\N	\N	\N	\N	\N	4	2013-09-03 20:21:51.439	2013-09-03 20:21:51.439
8	25	\N	\N	\N	\N	\N	934	2013-09-03 09:44:49.764	2013-09-03 09:44:49.764
8	53	load1=0.350;5.000;10.000;0; load5=0.360;4.000;8.000;0; load15=0.290;3.000;6.000;0;	\N	\N	\N	\N	\N	2013-09-03 09:47:17.587	2013-09-03 09:47:17.587
8	1	OK - load average: 0.35, 0.36, 0.29	\N	\N	\N	\N	\N	2013-09-03 09:47:17.586	2013-09-03 09:47:17.586
\.


--
-- Data for Name: severity; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY severity (severityid, name, description) FROM stdin;
1	FATAL	Severity FATAL
2	HIGH	Severity HIGH
3	LOW	Severity LOW
4	WARNING	Severity WARNING
5	PERFORMANCE	Severity PERFORMANCE
6	STATISTIC	Severity STATISTIC
7	SERIOUS	Severity SERIOUS
8	CRITICAL	GroundWork Severity CRITICAL. Also MIB standard
9	OK	GroundWork Severity OK
10	UNKNOWN	GroundWork Severity UNKNOWN
11	NORMAL	Standard MIB type for Severity
12	MAJOR	Standard MIB type for MonitorStatus
13	MINOR	Standard MIB type for MonitorStatus
14	INFORMATIONAL	Standard MIB type
15	UP	Severity UP
16	DOWN	Severity DOWN
17	UNREACHABLE	Severity unreachable
18	ACKNOWLEDGEMENT (WARNING)	ACKNOWLEDGEMENT (WARNING)
19	ACKNOWLEDGEMENT (CRITICAL)	ACKNOWLEDGEMENT (CRITICAL)
20	ACKNOWLEDGEMENT (DOWN)	ACKNOWLEDGEMENT (DOWN)
21	ACKNOWLEDGEMENT (UP)	ACKNOWLEDGEMENT (UP)
22	ACKNOWLEDGEMENT (OK)	ACKNOWLEDGEMENT (OK)
23	ACKNOWLEDGEMENT (UNREACHABLE)	ACKNOWLEDGEMENT (UNREACHABLE)
24	ACKNOWLEDGEMENT (UNKNOWN)	ACKNOWLEDGEMENT (UNKNOWN)
25	ACKNOWLEDGEMENT (PENDING)	ACKNOWLEDGEMENT (PENDING)
26	ACKNOWLEDGEMENT (MAINTENANCE)	ACKNOWLEDGEMENT (MAINTENANCE)
\.


--
-- Name: severity_severityid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('severity_severityid_seq', 26, true);


--
-- Data for Name: statetype; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY statetype (statetypeid, name, description) FROM stdin;
1	SOFT	State Soft
2	HARD	State Hard
3	UNKNOWN	State UNKNOWN
\.


--
-- Name: statetype_statetypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('statetype_statetypeid_seq', 3, true);


--
-- Data for Name: typerule; Type: TABLE DATA; Schema: public; Owner: collage
--

COPY typerule (typeruleid, name, description) FROM stdin;
1	NETWORK	Network
2	HARDWARE	Hardware
3	SERVICE	Service
4	APPLICATION	Application
5	FILTERED	Message filtered by GroundWork-Bridge
6	UNDEFINED	Undefined type
7	NAGIOS_LOG	NAGIOS_LOG type
8	ACKNOWLEDGE	ACKNOWLEDGE type
9	UNACKNOWLEDGE	UNACKNOWLEDGE type
\.


--
-- Name: typerule_typeruleid_seq; Type: SEQUENCE SET; Schema: public; Owner: collage
--

SELECT pg_catalog.setval('typerule_typeruleid_seq', 9, true);


--
-- Name: action_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY action
    ADD CONSTRAINT action_name_key UNIQUE (name);


--
-- Name: action_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY action
    ADD CONSTRAINT action_pkey PRIMARY KEY (actionid);


--
-- Name: actionparameter_actionid_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY actionparameter
    ADD CONSTRAINT actionparameter_actionid_name_key UNIQUE (actionid, name);


--
-- Name: actionparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY actionparameter
    ADD CONSTRAINT actionparameter_pkey PRIMARY KEY (actionparameterid);


--
-- Name: actionproperty_actionid_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY actionproperty
    ADD CONSTRAINT actionproperty_actionid_name_key UNIQUE (actionid, name);


--
-- Name: actionproperty_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY actionproperty
    ADD CONSTRAINT actionproperty_pkey PRIMARY KEY (actionpropertyid);


--
-- Name: actiontype_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY actiontype
    ADD CONSTRAINT actiontype_name_key UNIQUE (name);


--
-- Name: actiontype_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY actiontype
    ADD CONSTRAINT actiontype_pkey PRIMARY KEY (actiontypeid);


--
-- Name: applicationaction_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY applicationaction
    ADD CONSTRAINT applicationaction_pkey PRIMARY KEY (applicationtypeid, actionid);


--
-- Name: applicationentityproperty_applicationtypeid_entitytypeid_pr_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY applicationentityproperty
    ADD CONSTRAINT applicationentityproperty_applicationtypeid_entitytypeid_pr_key UNIQUE (applicationtypeid, entitytypeid, propertytypeid);


--
-- Name: applicationentityproperty_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY applicationentityproperty
    ADD CONSTRAINT applicationentityproperty_pkey PRIMARY KEY (applicationentitypropertyid);


--
-- Name: applicationtype_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY applicationtype
    ADD CONSTRAINT applicationtype_name_key UNIQUE (name);


--
-- Name: applicationtype_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY applicationtype
    ADD CONSTRAINT applicationtype_pkey PRIMARY KEY (applicationtypeid);


--
-- Name: category_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_name_key UNIQUE (name);


--
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (categoryid);


--
-- Name: categoryentity_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY categoryentity
    ADD CONSTRAINT categoryentity_pkey PRIMARY KEY (categoryentityid);


--
-- Name: categoryhierarchy_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY categoryhierarchy
    ADD CONSTRAINT categoryhierarchy_pkey PRIMARY KEY (categoryid, parentid);


--
-- Name: checktype_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY checktype
    ADD CONSTRAINT checktype_name_key UNIQUE (name);


--
-- Name: checktype_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY checktype
    ADD CONSTRAINT checktype_pkey PRIMARY KEY (checktypeid);


--
-- Name: component_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY component
    ADD CONSTRAINT component_name_key UNIQUE (name);


--
-- Name: component_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY component
    ADD CONSTRAINT component_pkey PRIMARY KEY (componentid);


--
-- Name: consolidationcriteria_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY consolidationcriteria
    ADD CONSTRAINT consolidationcriteria_name_key UNIQUE (name);


--
-- Name: consolidationcriteria_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY consolidationcriteria
    ADD CONSTRAINT consolidationcriteria_pkey PRIMARY KEY (consolidationcriteriaid);


--
-- Name: device_identification_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY device
    ADD CONSTRAINT device_identification_key UNIQUE (identification);


--
-- Name: device_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY device
    ADD CONSTRAINT device_pkey PRIMARY KEY (deviceid);


--
-- Name: deviceparent_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY deviceparent
    ADD CONSTRAINT deviceparent_pkey PRIMARY KEY (deviceid, parentid);


--
-- Name: entity_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY entity
    ADD CONSTRAINT entity_pkey PRIMARY KEY (entityid);


--
-- Name: entityproperty_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY entityproperty
    ADD CONSTRAINT entityproperty_pkey PRIMARY KEY (entitytypeid, objectid, propertytypeid);


--
-- Name: entitytype_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY entitytype
    ADD CONSTRAINT entitytype_name_key UNIQUE (name);


--
-- Name: entitytype_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY entitytype
    ADD CONSTRAINT entitytype_pkey PRIMARY KEY (entitytypeid);


--
-- Name: host_hostname_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY host
    ADD CONSTRAINT host_hostname_key UNIQUE (hostname);


--
-- Name: host_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY host
    ADD CONSTRAINT host_pkey PRIMARY KEY (hostid);


--
-- Name: hostgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY hostgroup
    ADD CONSTRAINT hostgroup_name_key UNIQUE (name);


--
-- Name: hostgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY hostgroup
    ADD CONSTRAINT hostgroup_pkey PRIMARY KEY (hostgroupid);


--
-- Name: hostgroupcollection_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY hostgroupcollection
    ADD CONSTRAINT hostgroupcollection_pkey PRIMARY KEY (hostid, hostgroupid);


--
-- Name: hoststatus_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY hoststatus
    ADD CONSTRAINT hoststatus_pkey PRIMARY KEY (hoststatusid);


--
-- Name: hoststatusproperty_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY hoststatusproperty
    ADD CONSTRAINT hoststatusproperty_pkey PRIMARY KEY (hoststatusid, propertytypeid);


--
-- Name: logmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY logmessage
    ADD CONSTRAINT logmessage_pkey PRIMARY KEY (logmessageid);


--
-- Name: logmessageproperty_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY logmessageproperty
    ADD CONSTRAINT logmessageproperty_pkey PRIMARY KEY (logmessageid, propertytypeid);


--
-- Name: logperformancedata_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY logperformancedata
    ADD CONSTRAINT logperformancedata_pkey PRIMARY KEY (logperformancedataid);


--
-- Name: messagefilter_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY messagefilter
    ADD CONSTRAINT messagefilter_name_key UNIQUE (name);


--
-- Name: messagefilter_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY messagefilter
    ADD CONSTRAINT messagefilter_pkey PRIMARY KEY (messagefilterid);


--
-- Name: monitorlist_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY monitorlist
    ADD CONSTRAINT monitorlist_pkey PRIMARY KEY (monitorserverid, deviceid);


--
-- Name: monitorserver_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY monitorserver
    ADD CONSTRAINT monitorserver_pkey PRIMARY KEY (monitorserverid);


--
-- Name: monitorstatus_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY monitorstatus
    ADD CONSTRAINT monitorstatus_name_key UNIQUE (name);


--
-- Name: monitorstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY monitorstatus
    ADD CONSTRAINT monitorstatus_pkey PRIMARY KEY (monitorstatusid);


--
-- Name: network_service_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY network_service_notifications
    ADD CONSTRAINT network_service_notifications_pkey PRIMARY KEY (id);


--
-- Name: network_service_short_news_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY network_service_short_news
    ADD CONSTRAINT network_service_short_news_pkey PRIMARY KEY (id);


--
-- Name: network_service_status_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY network_service_status
    ADD CONSTRAINT network_service_status_pkey PRIMARY KEY (id);


--
-- Name: operationstatus_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY operationstatus
    ADD CONSTRAINT operationstatus_name_key UNIQUE (name);


--
-- Name: operationstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY operationstatus
    ADD CONSTRAINT operationstatus_pkey PRIMARY KEY (operationstatusid);


--
-- Name: performancedatalabel_performancename_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY performancedatalabel
    ADD CONSTRAINT performancedatalabel_performancename_key UNIQUE (performancename);


--
-- Name: performancedatalabel_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY performancedatalabel
    ADD CONSTRAINT performancedatalabel_pkey PRIMARY KEY (performancedatalabelid);


--
-- Name: plugin_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY plugin
    ADD CONSTRAINT plugin_pkey PRIMARY KEY (pluginid);


--
-- Name: plugin_platformid_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY plugin
    ADD CONSTRAINT plugin_platformid_name_key UNIQUE (platformid, name);


--
-- Name: pluginplatform_name_arch_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY pluginplatform
    ADD CONSTRAINT pluginplatform_name_arch_key UNIQUE (name, arch);


--
-- Name: pluginplatform_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY pluginplatform
    ADD CONSTRAINT pluginplatform_pkey PRIMARY KEY (platformid);


--
-- Name: priority_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY priority
    ADD CONSTRAINT priority_name_key UNIQUE (name);


--
-- Name: priority_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY priority
    ADD CONSTRAINT priority_pkey PRIMARY KEY (priorityid);


--
-- Name: propertytype_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY propertytype
    ADD CONSTRAINT propertytype_name_key UNIQUE (name);


--
-- Name: propertytype_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY propertytype
    ADD CONSTRAINT propertytype_pkey PRIMARY KEY (propertytypeid);


--
-- Name: servicestatus_hostid_servicedescription_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY servicestatus
    ADD CONSTRAINT servicestatus_hostid_servicedescription_key UNIQUE (hostid, servicedescription);


--
-- Name: servicestatus_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY servicestatus
    ADD CONSTRAINT servicestatus_pkey PRIMARY KEY (servicestatusid);


--
-- Name: servicestatusproperty_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY servicestatusproperty
    ADD CONSTRAINT servicestatusproperty_pkey PRIMARY KEY (servicestatusid, propertytypeid);


--
-- Name: severity_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY severity
    ADD CONSTRAINT severity_name_key UNIQUE (name);


--
-- Name: severity_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY severity
    ADD CONSTRAINT severity_pkey PRIMARY KEY (severityid);


--
-- Name: statetype_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY statetype
    ADD CONSTRAINT statetype_name_key UNIQUE (name);


--
-- Name: statetype_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY statetype
    ADD CONSTRAINT statetype_pkey PRIMARY KEY (statetypeid);


--
-- Name: typerule_name_key; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY typerule
    ADD CONSTRAINT typerule_name_key UNIQUE (name);


--
-- Name: typerule_pkey; Type: CONSTRAINT; Schema: public; Owner: collage; Tablespace: 
--

ALTER TABLE ONLY typerule
    ADD CONSTRAINT typerule_pkey PRIMARY KEY (typeruleid);


--
-- Name: action_actiontypeid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX action_actiontypeid ON action USING btree (actiontypeid);


--
-- Name: action_idx_action_name; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX action_idx_action_name ON action USING btree (name);


--
-- Name: applicationaction_actionid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX applicationaction_actionid ON applicationaction USING btree (actionid);


--
-- Name: applicationentityproperty_entitytypeid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX applicationentityproperty_entitytypeid ON applicationentityproperty USING btree (entitytypeid);


--
-- Name: applicationentityproperty_propertytypeid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX applicationentityproperty_propertytypeid ON applicationentityproperty USING btree (propertytypeid);


--
-- Name: category_entitytypeid_ibfk1_1; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX category_entitytypeid_ibfk1_1 ON category USING btree (entitytypeid);


--
-- Name: categoryentity_categoryid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX categoryentity_categoryid ON categoryentity USING btree (categoryid);


--
-- Name: categoryentity_entitytypeid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX categoryentity_entitytypeid ON categoryentity USING btree (entitytypeid);


--
-- Name: categoryhierarchy_parentid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX categoryhierarchy_parentid ON categoryhierarchy USING btree (parentid);


--
-- Name: deviceparent_parentid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX deviceparent_parentid ON deviceparent USING btree (parentid);


--
-- Name: entity_applicationtypeid_ibfk1_1; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX entity_applicationtypeid_ibfk1_1 ON entity USING btree (applicationtypeid);


--
-- Name: entityproperty_propertytypeid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX entityproperty_propertytypeid ON entityproperty USING btree (propertytypeid);


--
-- Name: host_applicationtypeid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX host_applicationtypeid ON host USING btree (applicationtypeid);


--
-- Name: host_deviceid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX host_deviceid ON host USING btree (deviceid);


--
-- Name: hostgroup_applicationtypeid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX hostgroup_applicationtypeid ON hostgroup USING btree (applicationtypeid);


--
-- Name: hostgroupcollection_hostgroupid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX hostgroupcollection_hostgroupid ON hostgroupcollection USING btree (hostgroupid);


--
-- Name: hoststatus_checktypeid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX hoststatus_checktypeid ON hoststatus USING btree (checktypeid);


--
-- Name: hoststatus_monitorstatusid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX hoststatus_monitorstatusid ON hoststatus USING btree (monitorstatusid);


--
-- Name: hoststatus_statetypeid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX hoststatus_statetypeid ON hoststatus USING btree (statetypeid);


--
-- Name: hoststatusproperty_propertytypeid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX hoststatusproperty_propertytypeid ON hoststatusproperty USING btree (propertytypeid);


--
-- Name: logmessage_applicationseverityid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessage_applicationseverityid ON logmessage USING btree (applicationseverityid);


--
-- Name: logmessage_applicationtypeid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessage_applicationtypeid ON logmessage USING btree (applicationtypeid);


--
-- Name: logmessage_componentid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessage_componentid ON logmessage USING btree (componentid);


--
-- Name: logmessage_deviceid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessage_deviceid ON logmessage USING btree (deviceid);


--
-- Name: logmessage_fk_logmessage_hoststatusid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessage_fk_logmessage_hoststatusid ON logmessage USING btree (hoststatusid);


--
-- Name: logmessage_fk_logmessage_servicestatusid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessage_fk_logmessage_servicestatusid ON logmessage USING btree (servicestatusid);


--
-- Name: logmessage_idx_logmessage_consolidationhash; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessage_idx_logmessage_consolidationhash ON logmessage USING btree (consolidationhash);


--
-- Name: logmessage_idx_logmessage_firstinsertdate; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessage_idx_logmessage_firstinsertdate ON logmessage USING btree (firstinsertdate);


--
-- Name: logmessage_idx_logmessage_lastinsertdate; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessage_idx_logmessage_lastinsertdate ON logmessage USING btree (lastinsertdate);


--
-- Name: logmessage_idx_logmessage_reportdate; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessage_idx_logmessage_reportdate ON logmessage USING btree (reportdate);


--
-- Name: logmessage_idx_logmessage_statelesshash; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessage_idx_logmessage_statelesshash ON logmessage USING btree (statelesshash);


--
-- Name: logmessage_idx_logmessage_statetransitionhash; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessage_idx_logmessage_statetransitionhash ON logmessage USING btree (statetransitionhash);


--
-- Name: logmessage_monitorstatusid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessage_monitorstatusid ON logmessage USING btree (monitorstatusid);


--
-- Name: logmessage_operationstatusid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessage_operationstatusid ON logmessage USING btree (operationstatusid);


--
-- Name: logmessage_priorityid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessage_priorityid ON logmessage USING btree (priorityid);


--
-- Name: logmessage_severityid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessage_severityid ON logmessage USING btree (severityid);


--
-- Name: logmessage_typeruleid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessage_typeruleid ON logmessage USING btree (typeruleid);


--
-- Name: logmessageproperty_propertytypeid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logmessageproperty_propertytypeid ON logmessageproperty USING btree (propertytypeid);


--
-- Name: logperformancedata_performancedatalabelid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logperformancedata_performancedatalabelid ON logperformancedata USING btree (performancedatalabelid);


--
-- Name: logperformancedata_servicestatusid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX logperformancedata_servicestatusid ON logperformancedata USING btree (servicestatusid);


--
-- Name: monitorlist_deviceid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX monitorlist_deviceid ON monitorlist USING btree (deviceid);


--
-- Name: servicestatus_applicationtypeid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX servicestatus_applicationtypeid ON servicestatus USING btree (applicationtypeid);


--
-- Name: servicestatus_checktypeid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX servicestatus_checktypeid ON servicestatus USING btree (checktypeid);


--
-- Name: servicestatus_lasthardstateid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX servicestatus_lasthardstateid ON servicestatus USING btree (lasthardstateid);


--
-- Name: servicestatus_monitorstatusid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX servicestatus_monitorstatusid ON servicestatus USING btree (monitorstatusid);


--
-- Name: servicestatus_statetypeid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX servicestatus_statetypeid ON servicestatus USING btree (statetypeid);


--
-- Name: servicestatusproperty_propertytypeid; Type: INDEX; Schema: public; Owner: collage; Tablespace: 
--

CREATE INDEX servicestatusproperty_propertytypeid ON servicestatusproperty USING btree (propertytypeid);


--
-- Name: action_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY action
    ADD CONSTRAINT action_ibfk_1 FOREIGN KEY (actiontypeid) REFERENCES actiontype(actiontypeid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: actionparameter_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY actionparameter
    ADD CONSTRAINT actionparameter_ibfk_1 FOREIGN KEY (actionid) REFERENCES action(actionid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: actionproperty_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY actionproperty
    ADD CONSTRAINT actionproperty_ibfk_1 FOREIGN KEY (actionid) REFERENCES action(actionid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: applicationaction_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY applicationaction
    ADD CONSTRAINT applicationaction_ibfk_1 FOREIGN KEY (applicationtypeid) REFERENCES applicationtype(applicationtypeid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: applicationaction_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY applicationaction
    ADD CONSTRAINT applicationaction_ibfk_2 FOREIGN KEY (actionid) REFERENCES action(actionid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: applicationentityproperty_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY applicationentityproperty
    ADD CONSTRAINT applicationentityproperty_ibfk_1 FOREIGN KEY (applicationtypeid) REFERENCES applicationtype(applicationtypeid) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: applicationentityproperty_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY applicationentityproperty
    ADD CONSTRAINT applicationentityproperty_ibfk_2 FOREIGN KEY (entitytypeid) REFERENCES entitytype(entitytypeid) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: applicationentityproperty_ibfk_3; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY applicationentityproperty
    ADD CONSTRAINT applicationentityproperty_ibfk_3 FOREIGN KEY (propertytypeid) REFERENCES propertytype(propertytypeid) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: applicationtypeid_ibfk1_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY entity
    ADD CONSTRAINT applicationtypeid_ibfk1_1 FOREIGN KEY (applicationtypeid) REFERENCES applicationtype(applicationtypeid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: categoryentity_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY categoryentity
    ADD CONSTRAINT categoryentity_ibfk_1 FOREIGN KEY (categoryid) REFERENCES category(categoryid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: categoryentity_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY categoryentity
    ADD CONSTRAINT categoryentity_ibfk_2 FOREIGN KEY (entitytypeid) REFERENCES entitytype(entitytypeid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: categoryhierarchy_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY categoryhierarchy
    ADD CONSTRAINT categoryhierarchy_ibfk_1 FOREIGN KEY (parentid) REFERENCES category(categoryid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: categoryhierarchy_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY categoryhierarchy
    ADD CONSTRAINT categoryhierarchy_ibfk_2 FOREIGN KEY (categoryid) REFERENCES category(categoryid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: deviceparent_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY deviceparent
    ADD CONSTRAINT deviceparent_ibfk_1 FOREIGN KEY (deviceid) REFERENCES device(deviceid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: deviceparent_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY deviceparent
    ADD CONSTRAINT deviceparent_ibfk_2 FOREIGN KEY (parentid) REFERENCES device(deviceid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: entityproperty_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY entityproperty
    ADD CONSTRAINT entityproperty_ibfk_1 FOREIGN KEY (entitytypeid) REFERENCES entitytype(entitytypeid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: entityproperty_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY entityproperty
    ADD CONSTRAINT entityproperty_ibfk_2 FOREIGN KEY (propertytypeid) REFERENCES propertytype(propertytypeid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: entitytypeid_ibfk1_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY category
    ADD CONSTRAINT entitytypeid_ibfk1_1 FOREIGN KEY (entitytypeid) REFERENCES entitytype(entitytypeid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: fk_logmessage_hoststatusid; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY logmessage
    ADD CONSTRAINT fk_logmessage_hoststatusid FOREIGN KEY (hoststatusid) REFERENCES hoststatus(hoststatusid) ON UPDATE RESTRICT ON DELETE SET NULL;


--
-- Name: fk_logmessage_servicestatusid; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY logmessage
    ADD CONSTRAINT fk_logmessage_servicestatusid FOREIGN KEY (servicestatusid) REFERENCES servicestatus(servicestatusid) ON UPDATE RESTRICT ON DELETE SET NULL;


--
-- Name: host_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY host
    ADD CONSTRAINT host_ibfk_1 FOREIGN KEY (deviceid) REFERENCES device(deviceid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: host_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY host
    ADD CONSTRAINT host_ibfk_2 FOREIGN KEY (applicationtypeid) REFERENCES applicationtype(applicationtypeid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: hostgroup_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY hostgroup
    ADD CONSTRAINT hostgroup_ibfk_1 FOREIGN KEY (applicationtypeid) REFERENCES applicationtype(applicationtypeid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: hostgroupcollection_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY hostgroupcollection
    ADD CONSTRAINT hostgroupcollection_ibfk_1 FOREIGN KEY (hostid) REFERENCES host(hostid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: hostgroupcollection_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY hostgroupcollection
    ADD CONSTRAINT hostgroupcollection_ibfk_2 FOREIGN KEY (hostgroupid) REFERENCES hostgroup(hostgroupid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: hoststatus_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY hoststatus
    ADD CONSTRAINT hoststatus_ibfk_1 FOREIGN KEY (hoststatusid) REFERENCES host(hostid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: hoststatus_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY hoststatus
    ADD CONSTRAINT hoststatus_ibfk_2 FOREIGN KEY (monitorstatusid) REFERENCES monitorstatus(monitorstatusid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: hoststatus_ibfk_3; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY hoststatus
    ADD CONSTRAINT hoststatus_ibfk_3 FOREIGN KEY (checktypeid) REFERENCES checktype(checktypeid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: hoststatus_ibfk_4; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY hoststatus
    ADD CONSTRAINT hoststatus_ibfk_4 FOREIGN KEY (statetypeid) REFERENCES statetype(statetypeid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: hoststatusproperty_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY hoststatusproperty
    ADD CONSTRAINT hoststatusproperty_ibfk_1 FOREIGN KEY (hoststatusid) REFERENCES hoststatus(hoststatusid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: hoststatusproperty_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY hoststatusproperty
    ADD CONSTRAINT hoststatusproperty_ibfk_2 FOREIGN KEY (propertytypeid) REFERENCES propertytype(propertytypeid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: logmessage_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY logmessage
    ADD CONSTRAINT logmessage_ibfk_1 FOREIGN KEY (applicationtypeid) REFERENCES applicationtype(applicationtypeid) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: logmessage_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY logmessage
    ADD CONSTRAINT logmessage_ibfk_2 FOREIGN KEY (deviceid) REFERENCES device(deviceid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: logmessage_ibfk_3; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY logmessage
    ADD CONSTRAINT logmessage_ibfk_3 FOREIGN KEY (monitorstatusid) REFERENCES monitorstatus(monitorstatusid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: logmessage_ibfk_4; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY logmessage
    ADD CONSTRAINT logmessage_ibfk_4 FOREIGN KEY (severityid) REFERENCES severity(severityid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: logmessage_ibfk_5; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY logmessage
    ADD CONSTRAINT logmessage_ibfk_5 FOREIGN KEY (applicationseverityid) REFERENCES severity(severityid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: logmessage_ibfk_6; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY logmessage
    ADD CONSTRAINT logmessage_ibfk_6 FOREIGN KEY (priorityid) REFERENCES priority(priorityid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: logmessage_ibfk_7; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY logmessage
    ADD CONSTRAINT logmessage_ibfk_7 FOREIGN KEY (typeruleid) REFERENCES typerule(typeruleid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: logmessage_ibfk_8; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY logmessage
    ADD CONSTRAINT logmessage_ibfk_8 FOREIGN KEY (componentid) REFERENCES component(componentid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: logmessage_ibfk_9; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY logmessage
    ADD CONSTRAINT logmessage_ibfk_9 FOREIGN KEY (operationstatusid) REFERENCES operationstatus(operationstatusid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: logmessageproperty_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY logmessageproperty
    ADD CONSTRAINT logmessageproperty_ibfk_1 FOREIGN KEY (logmessageid) REFERENCES logmessage(logmessageid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: logmessageproperty_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY logmessageproperty
    ADD CONSTRAINT logmessageproperty_ibfk_2 FOREIGN KEY (propertytypeid) REFERENCES propertytype(propertytypeid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: logperformancedata_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY logperformancedata
    ADD CONSTRAINT logperformancedata_ibfk_1 FOREIGN KEY (servicestatusid) REFERENCES servicestatus(servicestatusid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: logperformancedata_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY logperformancedata
    ADD CONSTRAINT logperformancedata_ibfk_2 FOREIGN KEY (performancedatalabelid) REFERENCES performancedatalabel(performancedatalabelid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: monitorlist_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY monitorlist
    ADD CONSTRAINT monitorlist_ibfk_1 FOREIGN KEY (monitorserverid) REFERENCES monitorserver(monitorserverid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: monitorlist_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY monitorlist
    ADD CONSTRAINT monitorlist_ibfk_2 FOREIGN KEY (deviceid) REFERENCES device(deviceid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: plugin_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY plugin
    ADD CONSTRAINT plugin_ibfk_1 FOREIGN KEY (platformid) REFERENCES pluginplatform(platformid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: servicestatus_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY servicestatus
    ADD CONSTRAINT servicestatus_ibfk_1 FOREIGN KEY (applicationtypeid) REFERENCES applicationtype(applicationtypeid) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: servicestatus_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY servicestatus
    ADD CONSTRAINT servicestatus_ibfk_2 FOREIGN KEY (hostid) REFERENCES host(hostid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: servicestatus_ibfk_3; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY servicestatus
    ADD CONSTRAINT servicestatus_ibfk_3 FOREIGN KEY (statetypeid) REFERENCES statetype(statetypeid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: servicestatus_ibfk_4; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY servicestatus
    ADD CONSTRAINT servicestatus_ibfk_4 FOREIGN KEY (checktypeid) REFERENCES checktype(checktypeid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: servicestatus_ibfk_5; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY servicestatus
    ADD CONSTRAINT servicestatus_ibfk_5 FOREIGN KEY (lasthardstateid) REFERENCES monitorstatus(monitorstatusid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: servicestatus_ibfk_6; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY servicestatus
    ADD CONSTRAINT servicestatus_ibfk_6 FOREIGN KEY (monitorstatusid) REFERENCES monitorstatus(monitorstatusid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: servicestatusproperty_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY servicestatusproperty
    ADD CONSTRAINT servicestatusproperty_ibfk_1 FOREIGN KEY (servicestatusid) REFERENCES servicestatus(servicestatusid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: servicestatusproperty_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: collage
--

ALTER TABLE ONLY servicestatusproperty
    ADD CONSTRAINT servicestatusproperty_ibfk_2 FOREIGN KEY (propertytypeid) REFERENCES propertytype(propertytypeid) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO collage;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: network_service_notifications; Type: ACL; Schema: public; Owner: collage
--

REVOKE ALL ON TABLE network_service_notifications FROM PUBLIC;
REVOKE ALL ON TABLE network_service_notifications FROM collage;
GRANT ALL ON TABLE network_service_notifications TO collage;


--
-- Name: network_service_short_news; Type: ACL; Schema: public; Owner: collage
--

REVOKE ALL ON TABLE network_service_short_news FROM PUBLIC;
REVOKE ALL ON TABLE network_service_short_news FROM collage;
GRANT ALL ON TABLE network_service_short_news TO collage;


--
-- Name: network_service_status; Type: ACL; Schema: public; Owner: collage
--

REVOKE ALL ON TABLE network_service_status FROM PUBLIC;
REVOKE ALL ON TABLE network_service_status FROM collage;
GRANT ALL ON TABLE network_service_status TO collage;


--
-- PostgreSQL database dump complete
--

