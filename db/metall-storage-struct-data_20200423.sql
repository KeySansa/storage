--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)

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

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: sansa
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO sansa;

--
-- Name: SCHEMA storage; Type: COMMENT; Schema: -; Owner: sansa
--

COMMENT ON SCHEMA storage IS 'Складская схема';


--
-- Name: doc_number; Type: DOMAIN; Schema: public; Owner: sansa
--

CREATE DOMAIN public.doc_number AS bigint NOT NULL;


ALTER DOMAIN public.doc_number OWNER TO sansa;

--
-- Name: DOMAIN doc_number; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON DOMAIN public.doc_number IS 'Номер документа';


--
-- Name: full_name; Type: DOMAIN; Schema: public; Owner: sansa
--

CREATE DOMAIN public.full_name AS character varying(150) NOT NULL;


ALTER DOMAIN public.full_name OWNER TO sansa;

--
-- Name: DOMAIN full_name; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON DOMAIN public.full_name IS 'Полное наименование';


--
-- Name: id; Type: DOMAIN; Schema: public; Owner: sansa
--

CREATE DOMAIN public.id AS bigint;


ALTER DOMAIN public.id OWNER TO sansa;

--
-- Name: DOMAIN id; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON DOMAIN public.id IS 'Домен ссылки на первичный ключ таблицы';


--
-- Name: lquery; Type: SHELL TYPE; Schema: public; Owner: sansa
--

CREATE TYPE public.lquery;


--
-- Name: lquery_in(cstring); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.lquery_in(cstring) RETURNS public.lquery
    LANGUAGE c STRICT
    AS '$libdir/ltree', 'lquery_in';


ALTER FUNCTION public.lquery_in(cstring) OWNER TO sansa;

--
-- Name: lquery_out(public.lquery); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.lquery_out(public.lquery) RETURNS cstring
    LANGUAGE c STRICT
    AS '$libdir/ltree', 'lquery_out';


ALTER FUNCTION public.lquery_out(public.lquery) OWNER TO sansa;

--
-- Name: lquery; Type: TYPE; Schema: public; Owner: sansa
--

CREATE TYPE public.lquery (
    INTERNALLENGTH = variable,
    INPUT = public.lquery_in,
    OUTPUT = public.lquery_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


ALTER TYPE public.lquery OWNER TO sansa;

--
-- Name: ltree; Type: SHELL TYPE; Schema: public; Owner: sansa
--

CREATE TYPE public.ltree;


--
-- Name: ltree_in(cstring); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_in(cstring) RETURNS public.ltree
    LANGUAGE c STRICT
    AS '$libdir/ltree', 'ltree_in';


ALTER FUNCTION public.ltree_in(cstring) OWNER TO sansa;

--
-- Name: ltree_out(public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_out(public.ltree) RETURNS cstring
    LANGUAGE c STRICT
    AS '$libdir/ltree', 'ltree_out';


ALTER FUNCTION public.ltree_out(public.ltree) OWNER TO sansa;

--
-- Name: ltree; Type: TYPE; Schema: public; Owner: sansa
--

CREATE TYPE public.ltree (
    INTERNALLENGTH = variable,
    INPUT = public.ltree_in,
    OUTPUT = public.ltree_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


ALTER TYPE public.ltree OWNER TO sansa;

--
-- Name: ltree_gist; Type: SHELL TYPE; Schema: public; Owner: sansa
--

CREATE TYPE public.ltree_gist;


--
-- Name: ltree_gist_in(cstring); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_gist_in(cstring) RETURNS public.ltree_gist
    LANGUAGE c STRICT
    AS '$libdir/ltree', 'ltree_gist_in';


ALTER FUNCTION public.ltree_gist_in(cstring) OWNER TO sansa;

--
-- Name: ltree_gist_out(public.ltree_gist); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_gist_out(public.ltree_gist) RETURNS cstring
    LANGUAGE c STRICT
    AS '$libdir/ltree', 'ltree_gist_out';


ALTER FUNCTION public.ltree_gist_out(public.ltree_gist) OWNER TO sansa;

--
-- Name: ltree_gist; Type: TYPE; Schema: public; Owner: sansa
--

CREATE TYPE public.ltree_gist (
    INTERNALLENGTH = variable,
    INPUT = public.ltree_gist_in,
    OUTPUT = public.ltree_gist_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.ltree_gist OWNER TO sansa;

--
-- Name: ltxtquery; Type: SHELL TYPE; Schema: public; Owner: sansa
--

CREATE TYPE public.ltxtquery;


--
-- Name: ltxtq_in(cstring); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltxtq_in(cstring) RETURNS public.ltxtquery
    LANGUAGE c STRICT
    AS '$libdir/ltree', 'ltxtq_in';


ALTER FUNCTION public.ltxtq_in(cstring) OWNER TO sansa;

--
-- Name: ltxtq_out(public.ltxtquery); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltxtq_out(public.ltxtquery) RETURNS cstring
    LANGUAGE c STRICT
    AS '$libdir/ltree', 'ltxtq_out';


ALTER FUNCTION public.ltxtq_out(public.ltxtquery) OWNER TO sansa;

--
-- Name: ltxtquery; Type: TYPE; Schema: public; Owner: sansa
--

CREATE TYPE public.ltxtquery (
    INTERNALLENGTH = variable,
    INPUT = public.ltxtq_in,
    OUTPUT = public.ltxtq_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


ALTER TYPE public.ltxtquery OWNER TO sansa;

--
-- Name: short_name; Type: DOMAIN; Schema: public; Owner: sansa
--

CREATE DOMAIN public.short_name AS character varying(60) NOT NULL;


ALTER DOMAIN public.short_name OWNER TO sansa;

--
-- Name: DOMAIN short_name; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON DOMAIN public.short_name IS 'Краткое наименование';


--
-- Name: tablefunc_crosstab_2; Type: TYPE; Schema: public; Owner: sansa
--

CREATE TYPE public.tablefunc_crosstab_2 AS (
	row_name text,
	category_1 text,
	category_2 text
);


ALTER TYPE public.tablefunc_crosstab_2 OWNER TO sansa;

--
-- Name: tablefunc_crosstab_3; Type: TYPE; Schema: public; Owner: sansa
--

CREATE TYPE public.tablefunc_crosstab_3 AS (
	row_name text,
	category_1 text,
	category_2 text,
	category_3 text
);


ALTER TYPE public.tablefunc_crosstab_3 OWNER TO sansa;

--
-- Name: tablefunc_crosstab_4; Type: TYPE; Schema: public; Owner: sansa
--

CREATE TYPE public.tablefunc_crosstab_4 AS (
	row_name text,
	category_1 text,
	category_2 text,
	category_3 text,
	category_4 text
);


ALTER TYPE public.tablefunc_crosstab_4 OWNER TO sansa;

--
-- Name: _lt_q_regex(public.ltree[], public.lquery[]); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._lt_q_regex(public.ltree[], public.lquery[]) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_lt_q_regex';


ALTER FUNCTION public._lt_q_regex(public.ltree[], public.lquery[]) OWNER TO sansa;

--
-- Name: _lt_q_rregex(public.lquery[], public.ltree[]); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._lt_q_rregex(public.lquery[], public.ltree[]) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_lt_q_rregex';


ALTER FUNCTION public._lt_q_rregex(public.lquery[], public.ltree[]) OWNER TO sansa;

--
-- Name: _ltq_extract_regex(public.ltree[], public.lquery); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltq_extract_regex(public.ltree[], public.lquery) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltq_extract_regex';


ALTER FUNCTION public._ltq_extract_regex(public.ltree[], public.lquery) OWNER TO sansa;

--
-- Name: _ltq_regex(public.ltree[], public.lquery); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltq_regex(public.ltree[], public.lquery) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltq_regex';


ALTER FUNCTION public._ltq_regex(public.ltree[], public.lquery) OWNER TO sansa;

--
-- Name: _ltq_rregex(public.lquery, public.ltree[]); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltq_rregex(public.lquery, public.ltree[]) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltq_rregex';


ALTER FUNCTION public._ltq_rregex(public.lquery, public.ltree[]) OWNER TO sansa;

--
-- Name: _ltree_compress(internal); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltree_compress(internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltree_compress';


ALTER FUNCTION public._ltree_compress(internal) OWNER TO sansa;

--
-- Name: _ltree_consistent(internal, internal, smallint, oid, internal); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltree_consistent(internal, internal, smallint, oid, internal) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltree_consistent';


ALTER FUNCTION public._ltree_consistent(internal, internal, smallint, oid, internal) OWNER TO sansa;

--
-- Name: _ltree_extract_isparent(public.ltree[], public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltree_extract_isparent(public.ltree[], public.ltree) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltree_extract_isparent';


ALTER FUNCTION public._ltree_extract_isparent(public.ltree[], public.ltree) OWNER TO sansa;

--
-- Name: _ltree_extract_risparent(public.ltree[], public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltree_extract_risparent(public.ltree[], public.ltree) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltree_extract_risparent';


ALTER FUNCTION public._ltree_extract_risparent(public.ltree[], public.ltree) OWNER TO sansa;

--
-- Name: _ltree_isparent(public.ltree[], public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltree_isparent(public.ltree[], public.ltree) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltree_isparent';


ALTER FUNCTION public._ltree_isparent(public.ltree[], public.ltree) OWNER TO sansa;

--
-- Name: _ltree_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltree_penalty(internal, internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltree_penalty';


ALTER FUNCTION public._ltree_penalty(internal, internal, internal) OWNER TO sansa;

--
-- Name: _ltree_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltree_picksplit(internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltree_picksplit';


ALTER FUNCTION public._ltree_picksplit(internal, internal) OWNER TO sansa;

--
-- Name: _ltree_r_isparent(public.ltree, public.ltree[]); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltree_r_isparent(public.ltree, public.ltree[]) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltree_r_isparent';


ALTER FUNCTION public._ltree_r_isparent(public.ltree, public.ltree[]) OWNER TO sansa;

--
-- Name: _ltree_r_risparent(public.ltree, public.ltree[]); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltree_r_risparent(public.ltree, public.ltree[]) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltree_r_risparent';


ALTER FUNCTION public._ltree_r_risparent(public.ltree, public.ltree[]) OWNER TO sansa;

--
-- Name: _ltree_risparent(public.ltree[], public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltree_risparent(public.ltree[], public.ltree) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltree_risparent';


ALTER FUNCTION public._ltree_risparent(public.ltree[], public.ltree) OWNER TO sansa;

--
-- Name: _ltree_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltree_same(internal, internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltree_same';


ALTER FUNCTION public._ltree_same(internal, internal, internal) OWNER TO sansa;

--
-- Name: _ltree_union(internal, internal); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltree_union(internal, internal) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltree_union';


ALTER FUNCTION public._ltree_union(internal, internal) OWNER TO sansa;

--
-- Name: _ltxtq_exec(public.ltree[], public.ltxtquery); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltxtq_exec(public.ltree[], public.ltxtquery) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltxtq_exec';


ALTER FUNCTION public._ltxtq_exec(public.ltree[], public.ltxtquery) OWNER TO sansa;

--
-- Name: _ltxtq_extract_exec(public.ltree[], public.ltxtquery); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltxtq_extract_exec(public.ltree[], public.ltxtquery) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltxtq_extract_exec';


ALTER FUNCTION public._ltxtq_extract_exec(public.ltree[], public.ltxtquery) OWNER TO sansa;

--
-- Name: _ltxtq_rexec(public.ltxtquery, public.ltree[]); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public._ltxtq_rexec(public.ltxtquery, public.ltree[]) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_ltxtq_rexec';


ALTER FUNCTION public._ltxtq_rexec(public.ltxtquery, public.ltree[]) OWNER TO sansa;

--
-- Name: connectby(text, text, text, text, integer); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.connectby(text, text, text, text, integer) RETURNS SETOF record
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'connectby_text';


ALTER FUNCTION public.connectby(text, text, text, text, integer) OWNER TO sansa;

--
-- Name: connectby(text, text, text, text, integer, text); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.connectby(text, text, text, text, integer, text) RETURNS SETOF record
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'connectby_text';


ALTER FUNCTION public.connectby(text, text, text, text, integer, text) OWNER TO sansa;

--
-- Name: connectby(text, text, text, text, text, integer); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.connectby(text, text, text, text, text, integer) RETURNS SETOF record
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'connectby_text_serial';


ALTER FUNCTION public.connectby(text, text, text, text, text, integer) OWNER TO sansa;

--
-- Name: connectby(text, text, text, text, text, integer, text); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.connectby(text, text, text, text, text, integer, text) RETURNS SETOF record
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'connectby_text_serial';


ALTER FUNCTION public.connectby(text, text, text, text, text, integer, text) OWNER TO sansa;

--
-- Name: crosstab(text); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.crosstab(text) RETURNS SETOF record
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'crosstab';


ALTER FUNCTION public.crosstab(text) OWNER TO sansa;

--
-- Name: crosstab(text, integer); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.crosstab(text, integer) RETURNS SETOF record
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'crosstab';


ALTER FUNCTION public.crosstab(text, integer) OWNER TO sansa;

--
-- Name: crosstab(text, text); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.crosstab(text, text) RETURNS SETOF record
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'crosstab_hash';


ALTER FUNCTION public.crosstab(text, text) OWNER TO sansa;

--
-- Name: crosstab2(text); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.crosstab2(text) RETURNS SETOF public.tablefunc_crosstab_2
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'crosstab';


ALTER FUNCTION public.crosstab2(text) OWNER TO sansa;

--
-- Name: crosstab3(text); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.crosstab3(text) RETURNS SETOF public.tablefunc_crosstab_3
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'crosstab';


ALTER FUNCTION public.crosstab3(text) OWNER TO sansa;

--
-- Name: crosstab4(text); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.crosstab4(text) RETURNS SETOF public.tablefunc_crosstab_4
    LANGUAGE c STABLE STRICT
    AS '$libdir/tablefunc', 'crosstab';


ALTER FUNCTION public.crosstab4(text) OWNER TO sansa;

--
-- Name: ex_get_caption_path(public.id); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ex_get_caption_path(pid public.id) RETURNS text
    LANGUAGE plpgsql
    AS $_$DECLARE

from_path ltree;

sql text;

caps text;

rec record;

BEGIN

sql = 'SELECT path from base_tree WHERE id = '||$1;

EXECUTE sql INTO from_path;

caps = '';

for rec in (select caption from base_tree where path @> from_path order by path) loop

  caps = caps|| '/' ||rec.caption;

end loop;

RETURN caps;

EXCEPTION

WHEN RAISE_EXCEPTION THEN

RAISE NOTICE '%', error;

RETURN FALSE;

END;

$_$;


ALTER FUNCTION public.ex_get_caption_path(pid public.id) OWNER TO sansa;

--
-- Name: ex_is_child(public.id, public.id); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ex_is_child(child_id public.id, parent_id public.id) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$DECLARE

child_path ltree;

parent_path ltree;

sql text;

BEGIN

sql = 'SELECT path from base_tree WHERE id = '||$1;

EXECUTE sql INTO child_path;

sql = 'SELECT path from base_tree WHERE id = '||$2;

EXECUTE sql INTO parent_path;

RETURN (parent_path @> child_path);

EXCEPTION

WHEN RAISE_EXCEPTION THEN

RAISE NOTICE '%', error;

RETURN FALSE;

END;$_$;


ALTER FUNCTION public.ex_is_child(child_id public.id, parent_id public.id) OWNER TO sansa;

--
-- Name: ex_on_modifed(); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ex_on_modifed() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN

NEW.modifed = now();

NEW.modifer = USER;

RETURN NEW;

END;

$$;


ALTER FUNCTION public.ex_on_modifed() OWNER TO sansa;

--
-- Name: FUNCTION ex_on_modifed(); Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON FUNCTION public.ex_on_modifed() IS 'Выполняется по тригеру при изменении записи. Устанавливает поле "modifed" в текущее время, а поле "modifer" - в текущего пользователя';


--
-- Name: ex_on_update_product_tree(); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ex_on_update_product_tree() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

DECLARE

  ch_count integer; --- Число детей

  nid bigint;

  sql text;

BEGIN

  IF (OLD.rstate <> NEW.rstate) THEN

    nid = NEW.id;

    --- При удалении записи удаляем так же все 

    IF (OLD.rstate <> 99) and (NEW.rstate = 99) THEN

      sql = 'SELECT count(*) from products_tree WHERE ex_is_child(id, ' || nid || ') and (id <> ' || nid || ') and (rstate <> 99)';

      EXECUTE sql INTO ch_count;

      IF (ch_count > 0) THEN

        UPDATE products_tree SET rstate = 99 WHERE ex_is_child(id, nid) and (id <> nid) and (rstate <> 99);

      END IF;

      UPDATE products SET rstate = 99 WHERE (parent_id = nid) and (rstate <> 99) ;

    END IF;

    --- При восстановлении записи восстанавливаем всех родителей

    IF (OLD.rstate = 99) and (NEW.rstate <> 99) THEN

      sql = 'SELECT count(*) from products_tree WHERE ex_is_child('|| nid || ', id) and (id <> ' || nid || ') and (rstate = 99)';

      EXECUTE sql INTO ch_count;

      IF (ch_count > 0) THEN

        UPDATE products_tree SET rstate = NEW.rstate WHERE ex_is_child(nid, id) and (id <> nid) and (rstate = 99);

      END IF;

    END IF;

  END IF;

  RETURN NEW;

END;

$$;


ALTER FUNCTION public.ex_on_update_product_tree() OWNER TO sansa;

--
-- Name: FUNCTION ex_on_update_product_tree(); Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON FUNCTION public.ex_on_update_product_tree() IS 'При удалении/восстановлении группы продукции удаляются/восстанавливаются все товары этой подгруппы';


--
-- Name: ex_on_update_products(); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ex_on_update_products() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

DECLARE

  ch_count integer; --- Число детей

  nid bigint;

  sql text;

BEGIN

  IF (OLD.rstate <> NEW.rstate) THEN

    nid = NEW.id;

    --- При удалении товара удаляем так же все рецепты

    IF (OLD.rstate <> 99) and (NEW.rstate = 99) THEN

        UPDATE recipes r SET rstate = 99 WHERE (parent_id = nid) and (rstate <> 99);

    END IF;

    --- При восстановлении записи восстанавливаем всех удаленных родителей

    IF (OLD.rstate = 99) and (NEW.rstate <> 99) THEN

        UPDATE products_tree SET rstate = 0 WHERE (id = NEW.parent_id) and (rstate = 99);

    END IF;

  END IF;

  RETURN NEW;

END;

$$;


ALTER FUNCTION public.ex_on_update_products() OWNER TO sansa;

--
-- Name: get_user_id(); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.get_user_id() RETURNS oid
    LANGUAGE sql
    AS $$

select usesysid from pg_shadow where usename = user;

$$;


ALTER FUNCTION public.get_user_id() OWNER TO sansa;

--
-- Name: FUNCTION get_user_id(); Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON FUNCTION public.get_user_id() IS 'Возвращает код пользователя по его логину';


--
-- Name: index(public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.index(public.ltree, public.ltree) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_index';


ALTER FUNCTION public.index(public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: index(public.ltree, public.ltree, integer); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.index(public.ltree, public.ltree, integer) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_index';


ALTER FUNCTION public.index(public.ltree, public.ltree, integer) OWNER TO sansa;

--
-- Name: lca(public.ltree[]); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.lca(public.ltree[]) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', '_lca';


ALTER FUNCTION public.lca(public.ltree[]) OWNER TO sansa;

--
-- Name: lca(public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.lca(public.ltree, public.ltree) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'lca';


ALTER FUNCTION public.lca(public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: lca(public.ltree, public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.lca(public.ltree, public.ltree, public.ltree) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'lca';


ALTER FUNCTION public.lca(public.ltree, public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: lca(public.ltree, public.ltree, public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.lca(public.ltree, public.ltree, public.ltree, public.ltree) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'lca';


ALTER FUNCTION public.lca(public.ltree, public.ltree, public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: lca(public.ltree, public.ltree, public.ltree, public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.lca(public.ltree, public.ltree, public.ltree, public.ltree, public.ltree) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'lca';


ALTER FUNCTION public.lca(public.ltree, public.ltree, public.ltree, public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: lca(public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.lca(public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'lca';


ALTER FUNCTION public.lca(public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: lca(public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.lca(public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'lca';


ALTER FUNCTION public.lca(public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: lca(public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.lca(public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'lca';


ALTER FUNCTION public.lca(public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: lt_q_regex(public.ltree, public.lquery[]); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.lt_q_regex(public.ltree, public.lquery[]) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'lt_q_regex';


ALTER FUNCTION public.lt_q_regex(public.ltree, public.lquery[]) OWNER TO sansa;

--
-- Name: lt_q_rregex(public.lquery[], public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.lt_q_rregex(public.lquery[], public.ltree) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'lt_q_rregex';


ALTER FUNCTION public.lt_q_rregex(public.lquery[], public.ltree) OWNER TO sansa;

--
-- Name: ltq_regex(public.ltree, public.lquery); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltq_regex(public.ltree, public.lquery) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltq_regex';


ALTER FUNCTION public.ltq_regex(public.ltree, public.lquery) OWNER TO sansa;

--
-- Name: ltq_rregex(public.lquery, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltq_rregex(public.lquery, public.ltree) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltq_rregex';


ALTER FUNCTION public.ltq_rregex(public.lquery, public.ltree) OWNER TO sansa;

--
-- Name: ltree2text(public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree2text(public.ltree) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree2text';


ALTER FUNCTION public.ltree2text(public.ltree) OWNER TO sansa;

--
-- Name: ltree_addltree(public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_addltree(public.ltree, public.ltree) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_addltree';


ALTER FUNCTION public.ltree_addltree(public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: ltree_addtext(public.ltree, text); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_addtext(public.ltree, text) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_addtext';


ALTER FUNCTION public.ltree_addtext(public.ltree, text) OWNER TO sansa;

--
-- Name: ltree_cmp(public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_cmp(public.ltree, public.ltree) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_cmp';


ALTER FUNCTION public.ltree_cmp(public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: ltree_compress(internal); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_compress(internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_compress';


ALTER FUNCTION public.ltree_compress(internal) OWNER TO sansa;

--
-- Name: ltree_consistent(internal, internal, smallint, oid, internal); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_consistent(internal, internal, smallint, oid, internal) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_consistent';


ALTER FUNCTION public.ltree_consistent(internal, internal, smallint, oid, internal) OWNER TO sansa;

--
-- Name: ltree_decompress(internal); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_decompress(internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_decompress';


ALTER FUNCTION public.ltree_decompress(internal) OWNER TO sansa;

--
-- Name: ltree_eq(public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_eq(public.ltree, public.ltree) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_eq';


ALTER FUNCTION public.ltree_eq(public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: ltree_ge(public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_ge(public.ltree, public.ltree) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_ge';


ALTER FUNCTION public.ltree_ge(public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: ltree_gt(public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_gt(public.ltree, public.ltree) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_gt';


ALTER FUNCTION public.ltree_gt(public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: ltree_isparent(public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_isparent(public.ltree, public.ltree) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_isparent';


ALTER FUNCTION public.ltree_isparent(public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: ltree_le(public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_le(public.ltree, public.ltree) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_le';


ALTER FUNCTION public.ltree_le(public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: ltree_lt(public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_lt(public.ltree, public.ltree) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_lt';


ALTER FUNCTION public.ltree_lt(public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: ltree_ne(public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_ne(public.ltree, public.ltree) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_ne';


ALTER FUNCTION public.ltree_ne(public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: ltree_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_penalty(internal, internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_penalty';


ALTER FUNCTION public.ltree_penalty(internal, internal, internal) OWNER TO sansa;

--
-- Name: ltree_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_picksplit(internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_picksplit';


ALTER FUNCTION public.ltree_picksplit(internal, internal) OWNER TO sansa;

--
-- Name: ltree_risparent(public.ltree, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_risparent(public.ltree, public.ltree) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_risparent';


ALTER FUNCTION public.ltree_risparent(public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: ltree_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_same(internal, internal, internal) RETURNS internal
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_same';


ALTER FUNCTION public.ltree_same(internal, internal, internal) OWNER TO sansa;

--
-- Name: ltree_textadd(text, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_textadd(text, public.ltree) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_textadd';


ALTER FUNCTION public.ltree_textadd(text, public.ltree) OWNER TO sansa;

--
-- Name: ltree_union(internal, internal); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltree_union(internal, internal) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltree_union';


ALTER FUNCTION public.ltree_union(internal, internal) OWNER TO sansa;

--
-- Name: ltreeparentsel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltreeparentsel(internal, oid, internal, integer) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltreeparentsel';


ALTER FUNCTION public.ltreeparentsel(internal, oid, internal, integer) OWNER TO sansa;

--
-- Name: ltxtq_exec(public.ltree, public.ltxtquery); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltxtq_exec(public.ltree, public.ltxtquery) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltxtq_exec';


ALTER FUNCTION public.ltxtq_exec(public.ltree, public.ltxtquery) OWNER TO sansa;

--
-- Name: ltxtq_rexec(public.ltxtquery, public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.ltxtq_rexec(public.ltxtquery, public.ltree) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'ltxtq_rexec';


ALTER FUNCTION public.ltxtq_rexec(public.ltxtquery, public.ltree) OWNER TO sansa;

--
-- Name: nlevel(public.ltree); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.nlevel(public.ltree) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'nlevel';


ALTER FUNCTION public.nlevel(public.ltree) OWNER TO sansa;

--
-- Name: normal_rand(integer, double precision, double precision); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.normal_rand(integer, double precision, double precision) RETURNS SETOF double precision
    LANGUAGE c STRICT
    AS '$libdir/tablefunc', 'normal_rand';


ALTER FUNCTION public.normal_rand(integer, double precision, double precision) OWNER TO sansa;

--
-- Name: operations_complex_on_add(); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.operations_complex_on_add() RETURNS trigger
    LANGUAGE plpgsql
    AS $$DECLARE 

  rec_cnt integer;

  prod boolean;

  r RECORD;

  n integer;

BEGIN

SELECT prd FROM customers WHERE id = NEW.sender_id INTO prod;

IF (prod) THEN

  --- Читаем количество записей в рецептах

  SELECT COUNT(*) FROM recipes WHERE recipes.product_id = NEW.product_id INTO rec_cnt;

  prod = (rec_cnt > 0);

END IF;

IF (prod) THEN

  n = 0;

  --- Для каждого компонента рецепта забираем количество по рецепту * кол-во произведенного

  FOR r IN SELECT component_id, volume FROM recipes WHERE recipes.product_id = NEW.product_id LOOP

    --- "Забираем" у отправителя

    INSERT INTO "storage".base_operations	( id, ln, dt, storage_id, subject_id, volume ) 

  		VALUES (NEW.id, 100 + n, NEW.dt, NEW.sender_id, r.component_id, (NEW.inp * r.volume * -1) );

    n = n + 1;

  END LOOP;

  --- "Забираем" у отправителя

  INSERT INTO "storage".base_operations	( id, ln, dt, storage_id, subject_id, volume ) 

	VALUES (NEW.id, 1, NEW.dt, NEW.sender_id, NEW.product_id, 0 );

  --- "Отдаем получателю"

  INSERT INTO "storage".base_operations

    ( id, ln, dt, storage_id, subject_id, volume ) 

    VALUES (NEW.id, 0, NEW.dt, NEW.recipient_id, NEW.product_id, NEW.inp);

ELSE

  --- "Забираем" у отправителя

  INSERT INTO "storage".base_operations	( id, ln, dt, storage_id, subject_id, volume ) 

	VALUES (NEW.id, 1, NEW.dt, NEW.sender_id, NEW.product_id, (NEW.inp * -1) );

  --- "Отдаем получателю"

  INSERT INTO "storage".base_operations

    ( id, ln, dt, storage_id, subject_id, volume ) 

    VALUES (NEW.id, 0, NEW.dt, NEW.recipient_id, NEW.product_id, NEW.inp);

END IF;

  --- "Забираем" у отправителя

  INSERT INTO "storage".base_operations

	( id, ln, dt, storage_id, subject_id, volume ) 

	VALUES (NEW.id, 3, NEW.dt, NEW.sender_id, NEW.product_id, (NEW.out) );

  --- "Отдаем получателю"

  INSERT INTO "storage".base_operations

	( id, ln, dt, storage_id, subject_id, volume ) 

	VALUES (NEW.id, 4, NEW.dt, NEW.recipient_id, NEW.product_id, NEW.out * -1);

  --- "Забираем" у отправителя

  INSERT INTO "storage".base_operations

		( id, ln, dt, storage_id, subject_id, volume ) 

		VALUES (NEW.id, 5, NEW.dt, 9, NEW.product_id, (NEW.rec) );

  --- "Отдаем получателю"

  INSERT INTO "storage".base_operations

	( id, ln, dt, storage_id, subject_id, volume ) 

	VALUES (NEW.id, 6, NEW.dt, NEW.recipient_id, NEW.product_id, NEW.rec * -1);

  return NEW;

END;

$$;


ALTER FUNCTION public.operations_complex_on_add() OWNER TO sansa;

--
-- Name: operations_complex_on_del(); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.operations_complex_on_del() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN

  DELETE FROM storage.base_operations WHERE id = OLD.id;

  return OLD;

END;

$$;


ALTER FUNCTION public.operations_complex_on_del() OWNER TO sansa;

--
-- Name: operations_complex_on_upd(); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.operations_complex_on_upd() RETURNS trigger
    LANGUAGE plpgsql
    AS $$DECLARE 

  rec_cnt integer;

  prod boolean;

  r RECORD;

  n integer;

BEGIN

--- Удаляем полностью существующую операцию

DELETE FROM storage.base_operations WHERE (id = NEW.id);

--- Проверяем, является ли отправитель производственным участком

SELECT prd FROM customers WHERE id = NEW.sender_id INTO prod;

IF (prod) THEN

  --- Читаем количество записей в рецептах

  SELECT COUNT(*) FROM recipes WHERE recipes.product_id = NEW.product_id INTO rec_cnt;

  prod = (rec_cnt > 0);

END IF;

IF (prod) THEN

  n = 0;

  --- Для каждого компонента рецепта забираем количество по рецепту * кол-во произведенного

  FOR r IN SELECT component_id, volume FROM recipes WHERE recipes.product_id = NEW.product_id LOOP

    --- "Забираем" у отправителя

    INSERT INTO "storage".base_operations	( id, ln, dt, storage_id, subject_id, volume ) 

  		VALUES (NEW.id, 100 + n, NEW.dt, NEW.sender_id, r.component_id, (NEW.inp * r.volume * -1) );

    n = n + 1;

  END LOOP;

  --- "Забираем" у отправителя

  INSERT INTO "storage".base_operations	( id, ln, dt, storage_id, subject_id, volume ) 

	VALUES (NEW.id, 1, NEW.dt, NEW.sender_id, NEW.product_id, 0 );

  --- "Отдаем получателю"

  INSERT INTO "storage".base_operations

    ( id, ln, dt, storage_id, subject_id, volume ) 

    VALUES (NEW.id, 0, NEW.dt, NEW.recipient_id, NEW.product_id, NEW.inp);

ELSE

  --- "Забираем" у отправителя

  INSERT INTO "storage".base_operations	( id, ln, dt, storage_id, subject_id, volume ) 

	VALUES (NEW.id, 1, NEW.dt, NEW.sender_id, NEW.product_id, (NEW.inp * -1) );

  --- "Отдаем получателю"

  INSERT INTO "storage".base_operations

    ( id, ln, dt, storage_id, subject_id, volume ) 

    VALUES (NEW.id, 0, NEW.dt, NEW.recipient_id, NEW.product_id, NEW.inp);

END IF;

  --- "Забираем" у отправителя

  INSERT INTO "storage".base_operations

	( id, ln, dt, storage_id, subject_id, volume ) 

	VALUES (NEW.id, 3, NEW.dt, NEW.sender_id, NEW.product_id, (NEW.out) );

  --- "Отдаем получателю"

  INSERT INTO "storage".base_operations

	( id, ln, dt, storage_id, subject_id, volume ) 

	VALUES (NEW.id, 4, NEW.dt, NEW.recipient_id, NEW.product_id, NEW.out * -1);

  --- "Забираем" у отправителя

  INSERT INTO "storage".base_operations

		( id, ln, dt, storage_id, subject_id, volume ) 

		VALUES (NEW.id, 5, NEW.dt, 9, NEW.product_id, (NEW.rec) );

  --- "Отдаем получателю"

  INSERT INTO "storage".base_operations

	( id, ln, dt, storage_id, subject_id, volume ) 

	VALUES (NEW.id, 6, NEW.dt, NEW.recipient_id, NEW.product_id, NEW.rec * -1);

  return NEW;

END;

$$;


ALTER FUNCTION public.operations_complex_on_upd() OWNER TO sansa;

--
-- Name: subltree(public.ltree, integer, integer); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.subltree(public.ltree, integer, integer) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'subltree';


ALTER FUNCTION public.subltree(public.ltree, integer, integer) OWNER TO sansa;

--
-- Name: subpath(public.ltree, integer); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.subpath(public.ltree, integer) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'subpath';


ALTER FUNCTION public.subpath(public.ltree, integer) OWNER TO sansa;

--
-- Name: subpath(public.ltree, integer, integer); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.subpath(public.ltree, integer, integer) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'subpath';


ALTER FUNCTION public.subpath(public.ltree, integer, integer) OWNER TO sansa;

--
-- Name: text2ltree(text); Type: FUNCTION; Schema: public; Owner: sansa
--

CREATE FUNCTION public.text2ltree(text) RETURNS public.ltree
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/ltree', 'text2ltree';


ALTER FUNCTION public.text2ltree(text) OWNER TO sansa;

--
-- Name: ex_create_basic_operation(bigint, date, bigint, bigint, bigint, double precision); Type: FUNCTION; Schema: storage; Owner: sansa
--

CREATE FUNCTION storage.ex_create_basic_operation(operation_id bigint, operation_dt date, sender_id bigint, recipient_id bigint, product_id bigint, vol double precision) RETURNS bigint
    LANGUAGE plpgsql
    AS $$

BEGIN

--- "Забираем" у отправителя

INSERT INTO "storage".base_operations

( id, ln, dt, storage_id, subject_id, volume ) 

VALUES (operation_id, 1, operation_dt, sender_id, product_id, (vol * -1) );

--- "Отдаем получателю"

INSERT INTO "storage".base_operations

( id, ln, dt, storage_id, subject_id, volume ) 

VALUES (operation_id, 0, operation_dt, recipient_id, product_id, vol );

RETURN operation_id;

END;

$$;


ALTER FUNCTION storage.ex_create_basic_operation(operation_id bigint, operation_dt date, sender_id bigint, recipient_id bigint, product_id bigint, vol double precision) OWNER TO sansa;

--
-- Name: FUNCTION ex_create_basic_operation(operation_id bigint, operation_dt date, sender_id bigint, recipient_id bigint, product_id bigint, vol double precision); Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON FUNCTION storage.ex_create_basic_operation(operation_id bigint, operation_dt date, sender_id bigint, recipient_id bigint, product_id bigint, vol double precision) IS 'Создание базовой операции перемещения товара.

Указанное количество товара записывается со знаком "-" для отправителя первой 

операцией, и со знаком "+" для получателя во второй операции.';


--
-- Name: ex_storage_add_operation(public.id, public.id, public.id, public.id, double precision, text); Type: FUNCTION; Schema: storage; Owner: sansa
--

CREATE FUNCTION storage.ex_storage_add_operation(op_id public.id, snd_id public.id, rcp_id public.id, sub_id public.id, vol double precision, comm text) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN

INSERT INTO operations(

    id,

    ln, 

    storage_id, 

    volume, 

    subject_id, 

    "comment"

  )VALUES (

    op_id, 

    0, 

    snd_id,

    (vol) * -1, 

    sub_id,

    comm

  );

INSERT INTO operations(

    id,

    ln, 

    storage_id, 

    volume, 

    subject_id, 

    "comment"

  )VALUES (

    op_id, 

    1, 

    rcp_id,

    vol, 

    sub_id,

    comm

  );

END;$$;


ALTER FUNCTION storage.ex_storage_add_operation(op_id public.id, snd_id public.id, rcp_id public.id, sub_id public.id, vol double precision, comm text) OWNER TO sansa;

--
-- Name: FUNCTION ex_storage_add_operation(op_id public.id, snd_id public.id, rcp_id public.id, sub_id public.id, vol double precision, comm text); Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON FUNCTION storage.ex_storage_add_operation(op_id public.id, snd_id public.id, rcp_id public.id, sub_id public.id, vol double precision, comm text) IS 'Добавление простой операции по складу (от одного другому) в бое привычном виде';


--
-- Name: ex_update_basic_operation(bigint, date, bigint, bigint, bigint, double precision); Type: FUNCTION; Schema: storage; Owner: sansa
--

CREATE FUNCTION storage.ex_update_basic_operation(operation_id bigint, operation_dt date, sender_id bigint, recipient_id bigint, product_id bigint, vol double precision) RETURNS bigint
    LANGUAGE plpgsql
    AS $$BEGIN

  DELETE FROM storage.base_operations WHERE id = operation_id;

RETURN ex_create_basic_operation(operation_id, operation_dt, sender_id, recipient_id, product_id, vol);

END;

$$;


ALTER FUNCTION storage.ex_update_basic_operation(operation_id bigint, operation_dt date, sender_id bigint, recipient_id bigint, product_id bigint, vol double precision) OWNER TO sansa;

--
-- Name: <; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.< (
    FUNCTION = public.ltree_lt,
    LEFTARG = public.ltree,
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.>),
    NEGATOR = OPERATOR(public.>=),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.< (public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: <=; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.<= (
    FUNCTION = public.ltree_le,
    LEFTARG = public.ltree,
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.>=),
    NEGATOR = OPERATOR(public.>),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<= (public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: <>; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.<> (
    FUNCTION = public.ltree_ne,
    LEFTARG = public.ltree,
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.<>),
    NEGATOR = OPERATOR(public.=),
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: <@; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.<@ (
    FUNCTION = public.ltree_risparent,
    LEFTARG = public.ltree,
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.@>),
    RESTRICT = public.ltreeparentsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<@ (public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: <@; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.<@ (
    FUNCTION = public._ltree_r_isparent,
    LEFTARG = public.ltree,
    RIGHTARG = public.ltree[],
    COMMUTATOR = OPERATOR(public.@>),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<@ (public.ltree, public.ltree[]) OWNER TO sansa;

--
-- Name: <@; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.<@ (
    FUNCTION = public._ltree_risparent,
    LEFTARG = public.ltree[],
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.@>),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<@ (public.ltree[], public.ltree) OWNER TO sansa;

--
-- Name: =; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.= (
    FUNCTION = public.ltree_eq,
    LEFTARG = public.ltree,
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.=),
    NEGATOR = OPERATOR(public.<>),
    MERGES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: >; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.> (
    FUNCTION = public.ltree_gt,
    LEFTARG = public.ltree,
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.<),
    NEGATOR = OPERATOR(public.<=),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.> (public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: >=; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.>= (
    FUNCTION = public.ltree_ge,
    LEFTARG = public.ltree,
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.<=),
    NEGATOR = OPERATOR(public.<),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.>= (public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: ?; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.? (
    FUNCTION = public.lt_q_regex,
    LEFTARG = public.ltree,
    RIGHTARG = public.lquery[],
    COMMUTATOR = OPERATOR(public.?),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.? (public.ltree, public.lquery[]) OWNER TO sansa;

--
-- Name: ?; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.? (
    FUNCTION = public.lt_q_rregex,
    LEFTARG = public.lquery[],
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.?),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.? (public.lquery[], public.ltree) OWNER TO sansa;

--
-- Name: ?; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.? (
    FUNCTION = public._lt_q_regex,
    LEFTARG = public.ltree[],
    RIGHTARG = public.lquery[],
    COMMUTATOR = OPERATOR(public.?),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.? (public.ltree[], public.lquery[]) OWNER TO sansa;

--
-- Name: ?; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.? (
    FUNCTION = public._lt_q_rregex,
    LEFTARG = public.lquery[],
    RIGHTARG = public.ltree[],
    COMMUTATOR = OPERATOR(public.?),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.? (public.lquery[], public.ltree[]) OWNER TO sansa;

--
-- Name: ?<@; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.?<@ (
    FUNCTION = public._ltree_extract_risparent,
    LEFTARG = public.ltree[],
    RIGHTARG = public.ltree
);


ALTER OPERATOR public.?<@ (public.ltree[], public.ltree) OWNER TO sansa;

--
-- Name: ?@; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.?@ (
    FUNCTION = public._ltxtq_extract_exec,
    LEFTARG = public.ltree[],
    RIGHTARG = public.ltxtquery
);


ALTER OPERATOR public.?@ (public.ltree[], public.ltxtquery) OWNER TO sansa;

--
-- Name: ?@>; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.?@> (
    FUNCTION = public._ltree_extract_isparent,
    LEFTARG = public.ltree[],
    RIGHTARG = public.ltree
);


ALTER OPERATOR public.?@> (public.ltree[], public.ltree) OWNER TO sansa;

--
-- Name: ?~; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.?~ (
    FUNCTION = public._ltq_extract_regex,
    LEFTARG = public.ltree[],
    RIGHTARG = public.lquery
);


ALTER OPERATOR public.?~ (public.ltree[], public.lquery) OWNER TO sansa;

--
-- Name: @; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.@ (
    FUNCTION = public.ltxtq_exec,
    LEFTARG = public.ltree,
    RIGHTARG = public.ltxtquery,
    COMMUTATOR = OPERATOR(public.@),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (public.ltree, public.ltxtquery) OWNER TO sansa;

--
-- Name: @; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.@ (
    FUNCTION = public.ltxtq_rexec,
    LEFTARG = public.ltxtquery,
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.@),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (public.ltxtquery, public.ltree) OWNER TO sansa;

--
-- Name: @; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.@ (
    FUNCTION = public._ltxtq_exec,
    LEFTARG = public.ltree[],
    RIGHTARG = public.ltxtquery,
    COMMUTATOR = OPERATOR(public.@),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (public.ltree[], public.ltxtquery) OWNER TO sansa;

--
-- Name: @; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.@ (
    FUNCTION = public._ltxtq_rexec,
    LEFTARG = public.ltxtquery,
    RIGHTARG = public.ltree[],
    COMMUTATOR = OPERATOR(public.@),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (public.ltxtquery, public.ltree[]) OWNER TO sansa;

--
-- Name: @>; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.@> (
    FUNCTION = public.ltree_isparent,
    LEFTARG = public.ltree,
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.<@),
    RESTRICT = public.ltreeparentsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@> (public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: @>; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.@> (
    FUNCTION = public._ltree_isparent,
    LEFTARG = public.ltree[],
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.<@),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@> (public.ltree[], public.ltree) OWNER TO sansa;

--
-- Name: @>; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.@> (
    FUNCTION = public._ltree_r_risparent,
    LEFTARG = public.ltree,
    RIGHTARG = public.ltree[],
    COMMUTATOR = OPERATOR(public.<@),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@> (public.ltree, public.ltree[]) OWNER TO sansa;

--
-- Name: ^<@; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^<@ (
    FUNCTION = public.ltree_risparent,
    LEFTARG = public.ltree,
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.^@>),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^<@ (public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: ^<@; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^<@ (
    FUNCTION = public._ltree_r_isparent,
    LEFTARG = public.ltree,
    RIGHTARG = public.ltree[],
    COMMUTATOR = OPERATOR(public.^@>),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^<@ (public.ltree, public.ltree[]) OWNER TO sansa;

--
-- Name: ^<@; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^<@ (
    FUNCTION = public._ltree_risparent,
    LEFTARG = public.ltree[],
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.^@>),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^<@ (public.ltree[], public.ltree) OWNER TO sansa;

--
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^? (
    FUNCTION = public.lt_q_regex,
    LEFTARG = public.ltree,
    RIGHTARG = public.lquery[],
    COMMUTATOR = OPERATOR(public.^?),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^? (public.ltree, public.lquery[]) OWNER TO sansa;

--
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^? (
    FUNCTION = public.lt_q_rregex,
    LEFTARG = public.lquery[],
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.^?),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^? (public.lquery[], public.ltree) OWNER TO sansa;

--
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^? (
    FUNCTION = public._lt_q_regex,
    LEFTARG = public.ltree[],
    RIGHTARG = public.lquery[],
    COMMUTATOR = OPERATOR(public.^?),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^? (public.ltree[], public.lquery[]) OWNER TO sansa;

--
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^? (
    FUNCTION = public._lt_q_rregex,
    LEFTARG = public.lquery[],
    RIGHTARG = public.ltree[],
    COMMUTATOR = OPERATOR(public.^?),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^? (public.lquery[], public.ltree[]) OWNER TO sansa;

--
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^@ (
    FUNCTION = public.ltxtq_exec,
    LEFTARG = public.ltree,
    RIGHTARG = public.ltxtquery,
    COMMUTATOR = OPERATOR(public.^@),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@ (public.ltree, public.ltxtquery) OWNER TO sansa;

--
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^@ (
    FUNCTION = public.ltxtq_rexec,
    LEFTARG = public.ltxtquery,
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.^@),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@ (public.ltxtquery, public.ltree) OWNER TO sansa;

--
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^@ (
    FUNCTION = public._ltxtq_exec,
    LEFTARG = public.ltree[],
    RIGHTARG = public.ltxtquery,
    COMMUTATOR = OPERATOR(public.^@),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@ (public.ltree[], public.ltxtquery) OWNER TO sansa;

--
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^@ (
    FUNCTION = public._ltxtq_rexec,
    LEFTARG = public.ltxtquery,
    RIGHTARG = public.ltree[],
    COMMUTATOR = OPERATOR(public.^@),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@ (public.ltxtquery, public.ltree[]) OWNER TO sansa;

--
-- Name: ^@>; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^@> (
    FUNCTION = public.ltree_isparent,
    LEFTARG = public.ltree,
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.^<@),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@> (public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: ^@>; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^@> (
    FUNCTION = public._ltree_isparent,
    LEFTARG = public.ltree[],
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.^<@),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@> (public.ltree[], public.ltree) OWNER TO sansa;

--
-- Name: ^@>; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^@> (
    FUNCTION = public._ltree_r_risparent,
    LEFTARG = public.ltree,
    RIGHTARG = public.ltree[],
    COMMUTATOR = OPERATOR(public.^<@),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@> (public.ltree, public.ltree[]) OWNER TO sansa;

--
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^~ (
    FUNCTION = public.ltq_regex,
    LEFTARG = public.ltree,
    RIGHTARG = public.lquery,
    COMMUTATOR = OPERATOR(public.^~),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^~ (public.ltree, public.lquery) OWNER TO sansa;

--
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^~ (
    FUNCTION = public.ltq_rregex,
    LEFTARG = public.lquery,
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.^~),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^~ (public.lquery, public.ltree) OWNER TO sansa;

--
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^~ (
    FUNCTION = public._ltq_regex,
    LEFTARG = public.ltree[],
    RIGHTARG = public.lquery,
    COMMUTATOR = OPERATOR(public.^~),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^~ (public.ltree[], public.lquery) OWNER TO sansa;

--
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.^~ (
    FUNCTION = public._ltq_rregex,
    LEFTARG = public.lquery,
    RIGHTARG = public.ltree[],
    COMMUTATOR = OPERATOR(public.^~),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^~ (public.lquery, public.ltree[]) OWNER TO sansa;

--
-- Name: ||; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.|| (
    FUNCTION = public.ltree_addltree,
    LEFTARG = public.ltree,
    RIGHTARG = public.ltree
);


ALTER OPERATOR public.|| (public.ltree, public.ltree) OWNER TO sansa;

--
-- Name: ||; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.|| (
    FUNCTION = public.ltree_addtext,
    LEFTARG = public.ltree,
    RIGHTARG = text
);


ALTER OPERATOR public.|| (public.ltree, text) OWNER TO sansa;

--
-- Name: ||; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.|| (
    FUNCTION = public.ltree_textadd,
    LEFTARG = text,
    RIGHTARG = public.ltree
);


ALTER OPERATOR public.|| (text, public.ltree) OWNER TO sansa;

--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.~ (
    FUNCTION = public.ltq_regex,
    LEFTARG = public.ltree,
    RIGHTARG = public.lquery,
    COMMUTATOR = OPERATOR(public.~),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (public.ltree, public.lquery) OWNER TO sansa;

--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.~ (
    FUNCTION = public.ltq_rregex,
    LEFTARG = public.lquery,
    RIGHTARG = public.ltree,
    COMMUTATOR = OPERATOR(public.~),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (public.lquery, public.ltree) OWNER TO sansa;

--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.~ (
    FUNCTION = public._ltq_regex,
    LEFTARG = public.ltree[],
    RIGHTARG = public.lquery,
    COMMUTATOR = OPERATOR(public.~),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (public.ltree[], public.lquery) OWNER TO sansa;

--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: sansa
--

CREATE OPERATOR public.~ (
    FUNCTION = public._ltq_rregex,
    LEFTARG = public.lquery,
    RIGHTARG = public.ltree[],
    COMMUTATOR = OPERATOR(public.~),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (public.lquery, public.ltree[]) OWNER TO sansa;

--
-- Name: gist__ltree_ops; Type: OPERATOR FAMILY; Schema: public; Owner: postgres
--

CREATE OPERATOR FAMILY public.gist__ltree_ops USING gist;


ALTER OPERATOR FAMILY public.gist__ltree_ops USING gist OWNER TO postgres;

--
-- Name: gist__ltree_ops; Type: OPERATOR CLASS; Schema: public; Owner: sansa
--

CREATE OPERATOR CLASS public.gist__ltree_ops
    DEFAULT FOR TYPE public.ltree[] USING gist FAMILY public.gist__ltree_ops AS
    STORAGE public.ltree_gist ,
    OPERATOR 10 public.<@(public.ltree[],public.ltree) ,
    OPERATOR 11 public.@>(public.ltree,public.ltree[]) ,
    OPERATOR 12 public.~(public.ltree[],public.lquery) ,
    OPERATOR 13 public.~(public.lquery,public.ltree[]) ,
    OPERATOR 14 public.@(public.ltree[],public.ltxtquery) ,
    OPERATOR 15 public.@(public.ltxtquery,public.ltree[]) ,
    OPERATOR 16 public.?(public.ltree[],public.lquery[]) ,
    OPERATOR 17 public.?(public.lquery[],public.ltree[]) ,
    FUNCTION 1 (public.ltree[], public.ltree[]) public._ltree_consistent(internal,internal,smallint,oid,internal) ,
    FUNCTION 2 (public.ltree[], public.ltree[]) public._ltree_union(internal,internal) ,
    FUNCTION 3 (public.ltree[], public.ltree[]) public._ltree_compress(internal) ,
    FUNCTION 4 (public.ltree[], public.ltree[]) public.ltree_decompress(internal) ,
    FUNCTION 5 (public.ltree[], public.ltree[]) public._ltree_penalty(internal,internal,internal) ,
    FUNCTION 6 (public.ltree[], public.ltree[]) public._ltree_picksplit(internal,internal) ,
    FUNCTION 7 (public.ltree[], public.ltree[]) public._ltree_same(internal,internal,internal);


ALTER OPERATOR CLASS public.gist__ltree_ops USING gist OWNER TO sansa;

--
-- Name: gist_ltree_ops; Type: OPERATOR FAMILY; Schema: public; Owner: postgres
--

CREATE OPERATOR FAMILY public.gist_ltree_ops USING gist;


ALTER OPERATOR FAMILY public.gist_ltree_ops USING gist OWNER TO postgres;

--
-- Name: gist_ltree_ops; Type: OPERATOR CLASS; Schema: public; Owner: sansa
--

CREATE OPERATOR CLASS public.gist_ltree_ops
    DEFAULT FOR TYPE public.ltree USING gist FAMILY public.gist_ltree_ops AS
    STORAGE public.ltree_gist ,
    OPERATOR 1 public.<(public.ltree,public.ltree) ,
    OPERATOR 2 public.<=(public.ltree,public.ltree) ,
    OPERATOR 3 public.=(public.ltree,public.ltree) ,
    OPERATOR 4 public.>=(public.ltree,public.ltree) ,
    OPERATOR 5 public.>(public.ltree,public.ltree) ,
    OPERATOR 10 public.@>(public.ltree,public.ltree) ,
    OPERATOR 11 public.<@(public.ltree,public.ltree) ,
    OPERATOR 12 public.~(public.ltree,public.lquery) ,
    OPERATOR 13 public.~(public.lquery,public.ltree) ,
    OPERATOR 14 public.@(public.ltree,public.ltxtquery) ,
    OPERATOR 15 public.@(public.ltxtquery,public.ltree) ,
    OPERATOR 16 public.?(public.ltree,public.lquery[]) ,
    OPERATOR 17 public.?(public.lquery[],public.ltree) ,
    FUNCTION 1 (public.ltree, public.ltree) public.ltree_consistent(internal,internal,smallint,oid,internal) ,
    FUNCTION 2 (public.ltree, public.ltree) public.ltree_union(internal,internal) ,
    FUNCTION 3 (public.ltree, public.ltree) public.ltree_compress(internal) ,
    FUNCTION 4 (public.ltree, public.ltree) public.ltree_decompress(internal) ,
    FUNCTION 5 (public.ltree, public.ltree) public.ltree_penalty(internal,internal,internal) ,
    FUNCTION 6 (public.ltree, public.ltree) public.ltree_picksplit(internal,internal) ,
    FUNCTION 7 (public.ltree, public.ltree) public.ltree_same(internal,internal,internal);


ALTER OPERATOR CLASS public.gist_ltree_ops USING gist OWNER TO sansa;

--
-- Name: ltree_ops; Type: OPERATOR FAMILY; Schema: public; Owner: postgres
--

CREATE OPERATOR FAMILY public.ltree_ops USING btree;


ALTER OPERATOR FAMILY public.ltree_ops USING btree OWNER TO postgres;

--
-- Name: ltree_ops; Type: OPERATOR CLASS; Schema: public; Owner: sansa
--

CREATE OPERATOR CLASS public.ltree_ops
    DEFAULT FOR TYPE public.ltree USING btree FAMILY public.ltree_ops AS
    OPERATOR 1 public.<(public.ltree,public.ltree) ,
    OPERATOR 2 public.<=(public.ltree,public.ltree) ,
    OPERATOR 3 public.=(public.ltree,public.ltree) ,
    OPERATOR 4 public.>=(public.ltree,public.ltree) ,
    OPERATOR 5 public.>(public.ltree,public.ltree) ,
    FUNCTION 1 (public.ltree, public.ltree) public.ltree_cmp(public.ltree,public.ltree);


ALTER OPERATOR CLASS public.ltree_ops USING btree OWNER TO sansa;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: base; Type: TABLE; Schema: public; Owner: sansa
--

CREATE TABLE public.base (
    id bigint NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    creator character varying(64) DEFAULT "current_user"() NOT NULL,
    modifed timestamp without time zone,
    modifer character varying(64),
    rstate integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.base OWNER TO sansa;

--
-- Name: TABLE base; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON TABLE public.base IS 'Базовая таблица';


--
-- Name: COLUMN base.id; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base.id IS 'Первичный ключ таблицы';


--
-- Name: COLUMN base.created; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base.created IS 'Дата и время создания записи';


--
-- Name: COLUMN base.creator; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base.creator IS 'Пользователь, создавший запись';


--
-- Name: COLUMN base.modifed; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base.modifed IS 'Дата и время изменения записи';


--
-- Name: COLUMN base.modifer; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base.modifer IS 'Пользователь, изменивший запись';


--
-- Name: COLUMN base.rstate; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base.rstate IS 'Статус репликации';


--
-- Name: base_id_seq; Type: SEQUENCE; Schema: public; Owner: sansa
--

CREATE SEQUENCE public.base_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_id_seq OWNER TO sansa;

--
-- Name: base_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sansa
--

ALTER SEQUENCE public.base_id_seq OWNED BY public.base.id;


--
-- Name: base_named; Type: TABLE; Schema: public; Owner: sansa
--

CREATE TABLE public.base_named (
    name character varying(200) NOT NULL,
    short_name public.short_name NOT NULL
)
INHERITS (public.base);


ALTER TABLE public.base_named OWNER TO sansa;

--
-- Name: TABLE base_named; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON TABLE public.base_named IS 'Базовый справочник именованых объектов';


--
-- Name: COLUMN base_named.id; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_named.id IS 'Первичный ключ таблицы';


--
-- Name: COLUMN base_named.created; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_named.created IS 'Дата и время создания записи';


--
-- Name: COLUMN base_named.creator; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_named.creator IS 'Пользователь, создавший запись';


--
-- Name: COLUMN base_named.modifed; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_named.modifed IS 'Дата и время изменения записи';


--
-- Name: COLUMN base_named.modifer; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_named.modifer IS 'Пользователь, изменивший запись';


--
-- Name: COLUMN base_named.rstate; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_named.rstate IS 'Статус репликации';


--
-- Name: COLUMN base_named.name; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_named.name IS 'Полное наименование ';


--
-- Name: COLUMN base_named.short_name; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_named.short_name IS 'Краткое наименование';


--
-- Name: base_tree; Type: TABLE; Schema: public; Owner: sansa
--

CREATE TABLE public.base_tree (
    caption public.full_name NOT NULL,
    gstate smallint DEFAULT 0 NOT NULL,
    path public.ltree,
    parent_id public.id,
    CONSTRAINT base_tree_chk_parent_id CHECK ((id <> (parent_id)::bigint))
)
INHERITS (public.base);


ALTER TABLE public.base_tree OWNER TO sansa;

--
-- Name: TABLE base_tree; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON TABLE public.base_tree IS 'Базовая таблица для древовидных справочников';


--
-- Name: COLUMN base_tree.id; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_tree.id IS 'Первичный ключ таблицы';


--
-- Name: COLUMN base_tree.created; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_tree.created IS 'Дата и время создания записи';


--
-- Name: COLUMN base_tree.creator; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_tree.creator IS 'Пользователь, создавший запись';


--
-- Name: COLUMN base_tree.modifed; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_tree.modifed IS 'Дата и время изменения записи';


--
-- Name: COLUMN base_tree.modifer; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_tree.modifer IS 'Пользователь, изменивший запись';


--
-- Name: COLUMN base_tree.rstate; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_tree.rstate IS 'Статус репликации записи';


--
-- Name: COLUMN base_tree.caption; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_tree.caption IS 'Подпись ветки дерева';


--
-- Name: COLUMN base_tree.gstate; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_tree.gstate IS 'Состояние группы. Используется по разному.';


--
-- Name: COLUMN base_tree.path; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_tree.path IS 'Путь в дереве';


--
-- Name: COLUMN base_tree.parent_id; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_tree.parent_id IS 'Код непосредственного родителя';


--
-- Name: base_tree_childs; Type: TABLE; Schema: public; Owner: sansa
--

CREATE TABLE public.base_tree_childs (
    parent_id public.id NOT NULL,
    id bigint DEFAULT nextval('public.base_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.base_tree_childs OWNER TO sansa;

--
-- Name: TABLE base_tree_childs; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON TABLE public.base_tree_childs IS 'Таблица, содержщая только листья деревьев';


--
-- Name: COLUMN base_tree_childs.parent_id; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_tree_childs.parent_id IS 'Указатель на ветку дерева';


--
-- Name: COLUMN base_tree_childs.id; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.base_tree_childs.id IS 'Первичный ключ таблицы';


--
-- Name: customers; Type: TABLE; Schema: public; Owner: sansa
--

CREATE TABLE public.customers (
    payer_id public.id,
    prd boolean DEFAULT false NOT NULL
)
INHERITS (public.base_named, public.base_tree_childs);


ALTER TABLE public.customers OWNER TO sansa;

--
-- Name: TABLE customers; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON TABLE public.customers IS 'Справочник контрагентов';


--
-- Name: COLUMN customers.payer_id; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.customers.payer_id IS 'Код плательщика';


--
-- Name: COLUMN customers.prd; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.customers.prd IS 'Производственный участок';


--
-- Name: customers_tree; Type: TABLE; Schema: public; Owner: sansa
--

CREATE TABLE public.customers_tree (
)
INHERITS (public.base_tree);


ALTER TABLE public.customers_tree OWNER TO sansa;

--
-- Name: TABLE customers_tree; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON TABLE public.customers_tree IS 'Справочник типов контрагенов (дерево группировки)';


--
-- Name: documents; Type: TABLE; Schema: public; Owner: sansa
--

CREATE TABLE public.documents (
    number public.doc_number,
    doc_date date DEFAULT now(),
    print_count integer DEFAULT 0 NOT NULL
)
INHERITS (public.base);


ALTER TABLE public.documents OWNER TO sansa;

--
-- Name: TABLE documents; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON TABLE public.documents IS 'Реестр документов';


--
-- Name: COLUMN documents.number; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.documents.number IS 'Номер документа';


--
-- Name: COLUMN documents.doc_date; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.documents.doc_date IS 'Дата документа';


--
-- Name: COLUMN documents.print_count; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.documents.print_count IS 'Число распечаток документа';


--
-- Name: products; Type: TABLE; Schema: public; Owner: sansa
--

CREATE TABLE public.products (
)
INHERITS (public.base_named, public.base_tree_childs);


ALTER TABLE public.products OWNER TO sansa;

--
-- Name: TABLE products; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON TABLE public.products IS 'Справочник продукции';


--
-- Name: COLUMN products.id; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.products.id IS 'Первичный ключ таблицы';


--
-- Name: COLUMN products.created; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.products.created IS 'Дата и время создания записи';


--
-- Name: COLUMN products.creator; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.products.creator IS 'Код пользователя, создавшего запись';


--
-- Name: COLUMN products.modifed; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.products.modifed IS 'Дата и время изменения записи';


--
-- Name: COLUMN products.modifer; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.products.modifer IS 'Код пользователя, изменившего запись';


--
-- Name: COLUMN products.rstate; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.products.rstate IS 'Статус репликации записи';


--
-- Name: COLUMN products.name; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.products.name IS 'Наименование';


--
-- Name: COLUMN products.short_name; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.products.short_name IS 'Краткое наименование';


--
-- Name: COLUMN products.parent_id; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.products.parent_id IS 'Связь с таблицей products_tree';


--
-- Name: products_tree; Type: TABLE; Schema: public; Owner: sansa
--

CREATE TABLE public.products_tree (
)
INHERITS (public.base_tree);


ALTER TABLE public.products_tree OWNER TO sansa;

--
-- Name: TABLE products_tree; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON TABLE public.products_tree IS 'Справочник типов продукции (дерево группировки)';


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: sansa
--

CREATE TABLE public.recipes (
    component_id bigint,
    volume double precision,
    product_id bigint NOT NULL
)
INHERITS (public.base);


ALTER TABLE public.recipes OWNER TO sansa;

--
-- Name: COLUMN recipes.component_id; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.recipes.component_id IS 'Код компонента ';


--
-- Name: COLUMN recipes.volume; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.recipes.volume IS 'Количество компонента в рецепте';


--
-- Name: COLUMN recipes.product_id; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON COLUMN public.recipes.product_id IS 'Код товара, к которому относится этот рецепт';


--
-- Name: users; Type: TABLE; Schema: public; Owner: sansa
--

CREATE TABLE public.users (
    id character varying(64) NOT NULL,
    info public.full_name
);


ALTER TABLE public.users OWNER TO sansa;

--
-- Name: v_customers; Type: VIEW; Schema: public; Owner: sansa
--

CREATE VIEW public.v_customers AS
 SELECT customers.id,
    customers.created,
    customers.creator,
    customers.modifed,
    customers.modifer,
    customers.rstate,
    customers.name,
    customers.short_name,
    customers.parent_id,
    customers.payer_id,
    customers.prd,
        CASE
            WHEN ((customers.parent_id)::bigint = 2) THEN 'Свой'::text
            ELSE 'Сторонний'::text
        END AS parent
   FROM public.customers;


ALTER TABLE public.v_customers OWNER TO sansa;

--
-- Name: v_recipes; Type: VIEW; Schema: public; Owner: sansa
--

CREATE VIEW public.v_recipes AS
 SELECT r.id,
    r.product_id,
    r.component_id,
    c.name AS component,
    r.volume
   FROM (public.recipes r
     LEFT JOIN public.products c ON ((r.component_id = c.id)));


ALTER TABLE public.v_recipes OWNER TO sansa;

--
-- Name: v_users; Type: VIEW; Schema: public; Owner: sansa
--

CREATE VIEW public.v_users AS
 SELECT s.usesysid,
    s.usename,
    u.info
   FROM (pg_shadow s
     LEFT JOIN public.users u ON ((s.usename = (u.id)::name)));


ALTER TABLE public.v_users OWNER TO sansa;

--
-- Name: base_operations; Type: TABLE; Schema: storage; Owner: sansa
--

CREATE TABLE storage.base_operations (
    id bigint NOT NULL,
    ln integer NOT NULL,
    dt timestamp without time zone NOT NULL,
    storage_id public.id NOT NULL,
    subject_id public.id,
    volume double precision NOT NULL,
    link bigint
);


ALTER TABLE storage.base_operations OWNER TO sansa;

--
-- Name: COLUMN base_operations.link; Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON COLUMN storage.base_operations.link IS 'Ссылка на другую таблицу (комплексные операции)';


--
-- Name: documents; Type: TABLE; Schema: storage; Owner: sansa
--

CREATE TABLE storage.documents (
    id bigint DEFAULT nextval('public.base_id_seq'::regclass)
)
INHERITS (public.documents);


ALTER TABLE storage.documents OWNER TO sansa;

--
-- Name: TABLE documents; Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON TABLE storage.documents IS 'Документы, связанные с операциями по складу';


--
-- Name: operations; Type: TABLE; Schema: storage; Owner: sansa
--

CREATE TABLE storage.operations (
    id bigint NOT NULL,
    ln integer NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    creator integer DEFAULT public.get_user_id() NOT NULL,
    modifed timestamp without time zone,
    modifer integer,
    rstate integer DEFAULT 0 NOT NULL,
    volume double precision NOT NULL,
    storage_id public.id NOT NULL,
    comment character varying(100),
    subject_id public.id NOT NULL,
    CONSTRAINT operatirons_chk_quantity CHECK ((volume <> (0)::double precision))
);


ALTER TABLE storage.operations OWNER TO sansa;

--
-- Name: TABLE operations; Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON TABLE storage.operations IS 'Операции по складу';


--
-- Name: COLUMN operations.id; Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON COLUMN storage.operations.id IS 'Номер операции';


--
-- Name: COLUMN operations.ln; Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON COLUMN storage.operations.ln IS 'Номер позиции внутри операции';


--
-- Name: COLUMN operations.created; Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON COLUMN storage.operations.created IS 'Дата и время создания записи';


--
-- Name: COLUMN operations.creator; Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON COLUMN storage.operations.creator IS 'Код пользователя, создавшего запись';


--
-- Name: COLUMN operations.modifed; Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON COLUMN storage.operations.modifed IS 'Дата и время изменения записи';


--
-- Name: COLUMN operations.modifer; Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON COLUMN storage.operations.modifer IS 'Код пользователя, изменившего запись';


--
-- Name: COLUMN operations.rstate; Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON COLUMN storage.operations.rstate IS 'Статус репликации записи';


--
-- Name: COLUMN operations.volume; Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON COLUMN storage.operations.volume IS 'Количество материала';


--
-- Name: COLUMN operations.storage_id; Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON COLUMN storage.operations.storage_id IS 'Код накопителя, от кого (к кому) прибыл(убыл) товар';


--
-- Name: COLUMN operations.comment; Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON COLUMN storage.operations.comment IS 'Комментарий к операции';


--
-- Name: COLUMN operations.subject_id; Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON COLUMN storage.operations.subject_id IS 'Код объекта, который участвует в операции (компонент или товар)';


--
-- Name: operations_by_doc; Type: TABLE; Schema: storage; Owner: sansa
--

CREATE TABLE storage.operations_by_doc (
    id bigint DEFAULT nextval('public.base_id_seq'::regclass)
)
INHERITS (storage.base_operations, public.base_tree_childs);


ALTER TABLE storage.operations_by_doc OWNER TO sansa;

--
-- Name: operations_complex; Type: TABLE; Schema: storage; Owner: sansa
--

CREATE TABLE storage.operations_complex (
    id integer NOT NULL,
    dt date,
    sender_id public.id NOT NULL,
    recipient_id public.id NOT NULL,
    product_id public.id,
    inp double precision DEFAULT 0 NOT NULL,
    rec double precision DEFAULT 0 NOT NULL,
    "out" double precision DEFAULT 0 NOT NULL
);


ALTER TABLE storage.operations_complex OWNER TO sansa;

--
-- Name: operations_complex_id_seq; Type: SEQUENCE; Schema: storage; Owner: sansa
--

CREATE SEQUENCE storage.operations_complex_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE storage.operations_complex_id_seq OWNER TO sansa;

--
-- Name: operations_complex_id_seq; Type: SEQUENCE OWNED BY; Schema: storage; Owner: sansa
--

ALTER SEQUENCE storage.operations_complex_id_seq OWNED BY storage.operations_complex.id;


--
-- Name: rest_by_storages; Type: VIEW; Schema: storage; Owner: sansa
--

CREATE VIEW storage.rest_by_storages AS
 SELECT o.dt,
    o.storage_id,
    c.name AS storage_name,
    c.parent_id AS storage_parent_id,
    o.subject_id,
    p.name AS subject_name,
    p.parent_id AS subject_parent_id,
    sum(o.volume) AS rest
   FROM ((public.customers c
     LEFT JOIN storage.base_operations o ON (((o.storage_id)::bigint = c.id)))
     LEFT JOIN public.products p ON (((o.subject_id)::bigint = p.id)))
  GROUP BY o.dt, o.storage_id, o.subject_id, c.name, c.parent_id, p.name, p.parent_id
  ORDER BY c.name, p.name;


ALTER TABLE storage.rest_by_storages OWNER TO sansa;

--
-- Name: v_customers_with_groups; Type: VIEW; Schema: storage; Owner: sansa
--

CREATE VIEW storage.v_customers_with_groups AS
 SELECT customers_tree.id,
    customers_tree.rstate,
    (customers_tree.path)::character varying AS path,
    customers_tree.caption,
    (0)::double precision AS volume,
    1 AS gstate
   FROM public.customers_tree
UNION
 SELECT customers.id,
    customers.rstate,
    ((((customers_tree.path)::character varying)::text || '.'::text) || ((customers.id)::character varying)::text) AS path,
    customers.name AS caption,
    (0)::double precision AS volume,
    0 AS gstate
   FROM (public.customers
     JOIN public.customers_tree ON (((customers.parent_id)::bigint = customers_tree.id)));


ALTER TABLE storage.v_customers_with_groups OWNER TO sansa;

--
-- Name: v_op_cmpx; Type: VIEW; Schema: storage; Owner: sansa
--

CREATE VIEW storage.v_op_cmpx AS
 SELECT o.id,
    o.dt,
    o.sender_id,
    s.name AS sender,
    o.recipient_id,
    r.name AS recipient,
    o.product_id,
    p.name AS product,
    o.inp,
    o.rec,
    o."out"
   FROM (((storage.operations_complex o
     JOIN public.customers s ON (((o.sender_id)::bigint = s.id)))
     JOIN public.customers r ON (((o.recipient_id)::bigint = r.id)))
     LEFT JOIN public.products p ON (((o.product_id)::bigint = p.id)));


ALTER TABLE storage.v_op_cmpx OWNER TO sansa;

--
-- Name: v_operations_incoming; Type: VIEW; Schema: storage; Owner: sansa
--

CREATE VIEW storage.v_operations_incoming AS
 SELECT o.id,
    0 AS rstate,
    ((((((st.path)::character varying)::text || '.'::text) || o.storage_id) || '.'::text) || o.id) AS path,
    o.storage_id,
    s.name AS caption,
    o.dt,
    o.subject_id,
    p.name AS product,
    o.volume
   FROM (((storage.base_operations o
     JOIN public.customers s ON (((o.storage_id)::bigint = s.id)))
     JOIN public.products p ON (((o.subject_id)::bigint = p.id)))
     JOIN public.customers_tree st ON (((s.parent_id)::bigint = st.id)))
  WHERE (o.ln = 0);


ALTER TABLE storage.v_operations_incoming OWNER TO sansa;

--
-- Name: v_operations_outgoing; Type: VIEW; Schema: storage; Owner: sansa
--

CREATE VIEW storage.v_operations_outgoing AS
 SELECT o.id,
    0 AS rstate,
    ((((((st.path)::character varying)::text || '.'::text) || o.storage_id) || '.'::text) || o.id) AS path,
    o.storage_id,
    s.name AS caption,
    o.dt,
    o.subject_id,
    p.name AS product,
    o.volume
   FROM (((storage.base_operations o
     JOIN public.customers s ON (((o.storage_id)::bigint = s.id)))
     JOIN public.products p ON (((o.subject_id)::bigint = p.id)))
     JOIN public.customers_tree st ON (((s.parent_id)::bigint = st.id)))
  WHERE (o.ln <> 0);


ALTER TABLE storage.v_operations_outgoing OWNER TO sansa;

--
-- Name: v_operations_complex; Type: VIEW; Schema: storage; Owner: sansa
--

CREATE VIEW storage.v_operations_complex AS
 SELECT i.id,
    i.dt,
    0 AS rstate,
    i.path,
    i.storage_id AS recipient_id,
    i.caption AS recipient,
    o.storage_id AS sender_id,
    o.caption AS sender,
    i.subject_id,
    i.product AS subject,
    i.volume
   FROM (storage.v_operations_incoming i
     LEFT JOIN storage.v_operations_outgoing o ON ((i.id = o.id)));


ALTER TABLE storage.v_operations_complex OWNER TO sansa;

--
-- Name: v_operations_complex_1; Type: VIEW; Schema: storage; Owner: sansa
--

CREATE VIEW storage.v_operations_complex_1 AS
 SELECT i.id,
    i.dt,
    0 AS rstate,
    i.path,
    i.storage_id AS recipient_id,
    i.caption AS recipient,
    o.storage_id AS sender_id,
    o.caption AS sender,
    i.subject_id,
    i.product AS subject,
    i.volume
   FROM (storage.v_operations_outgoing i
     LEFT JOIN storage.v_operations_incoming o ON ((i.id = o.id)));


ALTER TABLE storage.v_operations_complex_1 OWNER TO sansa;

--
-- Name: v_operations; Type: VIEW; Schema: storage; Owner: sansa
--

CREATE VIEW storage.v_operations AS
 SELECT v_operations_complex.id,
    v_operations_complex.dt,
    v_operations_complex.rstate,
    v_operations_complex.path,
    v_operations_complex.recipient_id,
    v_operations_complex.recipient,
    v_operations_complex.sender_id,
    v_operations_complex.sender,
    v_operations_complex.subject_id,
    v_operations_complex.subject,
    v_operations_complex.volume
   FROM storage.v_operations_complex
UNION
 SELECT v_operations_complex_1.id,
    v_operations_complex_1.dt,
    v_operations_complex_1.rstate,
    v_operations_complex_1.path,
    v_operations_complex_1.recipient_id,
    v_operations_complex_1.recipient,
    v_operations_complex_1.sender_id,
    v_operations_complex_1.sender,
    v_operations_complex_1.subject_id,
    v_operations_complex_1.subject,
    v_operations_complex_1.volume
   FROM storage.v_operations_complex_1;


ALTER TABLE storage.v_operations OWNER TO sansa;

--
-- Name: v_operations_all; Type: VIEW; Schema: storage; Owner: sansa
--

CREATE VIEW storage.v_operations_all AS
 SELECT o.id,
    0 AS rstate,
    ((((((st.path)::character varying)::text || '.'::text) || o.storage_id) || '.'::text) || o.id) AS path,
    o.storage_id,
    s.name AS caption,
    o.dt,
    o.subject_id,
    p.name AS product,
    o.volume
   FROM (((storage.base_operations o
     JOIN public.customers s ON (((o.storage_id)::bigint = s.id)))
     JOIN public.products p ON (((o.subject_id)::bigint = p.id)))
     JOIN public.customers_tree st ON (((s.parent_id)::bigint = st.id)));


ALTER TABLE storage.v_operations_all OWNER TO sansa;

--
-- Name: v_operations_complex_list; Type: VIEW; Schema: storage; Owner: sansa
--

CREATE VIEW storage.v_operations_complex_list AS
 SELECT o.id,
    o.dt,
    o.sender_id,
    s.short_name AS ssender,
    s.name AS sender,
    o.recipient_id,
    r.short_name AS srecipient,
    r.name AS recipient,
    o.product_id,
    p.short_name AS sproduct,
    p.name AS product,
    o.inp,
    o.rec,
    o."out"
   FROM (((storage.operations_complex o
     LEFT JOIN public.customers s ON (((o.sender_id)::bigint = s.id)))
     LEFT JOIN public.customers r ON (((o.recipient_id)::bigint = r.id)))
     LEFT JOIN public.products p ON (((o.product_id)::bigint = p.id)));


ALTER TABLE storage.v_operations_complex_list OWNER TO sansa;

--
-- Name: v_operations_list; Type: VIEW; Schema: storage; Owner: sansa
--

CREATE VIEW storage.v_operations_list AS
 SELECT o.id,
    o.ln,
    o.dt,
    o.storage_id,
    s.name AS storage,
    o.subject_id,
    p.name AS product,
    o.volume
   FROM (((storage.base_operations o
     JOIN public.customers s ON (((o.storage_id)::bigint = s.id)))
     JOIN public.products p ON (((o.subject_id)::bigint = p.id)))
     JOIN public.customers_tree st ON (((s.parent_id)::bigint = st.id)))
  ORDER BY o.dt, o.id, o.ln;


ALTER TABLE storage.v_operations_list OWNER TO sansa;

--
-- Name: v_operations_recycling; Type: VIEW; Schema: storage; Owner: sansa
--

CREATE VIEW storage.v_operations_recycling AS
 SELECT i.id,
    i.dt,
    o.storage_id AS sender_id,
    o.caption AS recipient,
    i.subject_id,
    i.product AS subject,
    i.volume
   FROM (storage.v_operations_incoming i
     JOIN storage.v_operations_outgoing o ON ((i.id = o.id)))
  WHERE ((i.storage_id)::bigint = 9);


ALTER TABLE storage.v_operations_recycling OWNER TO sansa;

--
-- Name: v_operations_view; Type: VIEW; Schema: storage; Owner: sansa
--

CREATE VIEW storage.v_operations_view AS
 SELECT v_operations.id,
    0 AS rstate,
    v_operations.path,
    v_operations.sender AS caption,
    v_operations.dt,
    v_operations.subject_id AS parent_id,
    v_operations.subject AS product,
    v_operations.volume
   FROM storage.v_operations;


ALTER TABLE storage.v_operations_view OWNER TO sansa;

--
-- Name: v_rest_by_product; Type: VIEW; Schema: storage; Owner: sansa
--

CREATE VIEW storage.v_rest_by_product AS
 SELECT v_operations_all.product,
    sum(v_operations_all.volume) AS volume
   FROM storage.v_operations_all
  WHERE (v_operations_all.path ~~ '2.%'::text)
  GROUP BY v_operations_all.product;


ALTER TABLE storage.v_rest_by_product OWNER TO sansa;

--
-- Name: VIEW v_rest_by_product; Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON VIEW storage.v_rest_by_product IS 'Остатки по продукции';


--
-- Name: v_rest_by_storages; Type: VIEW; Schema: storage; Owner: sansa
--

CREATE VIEW storage.v_rest_by_storages AS
 SELECT ((o.subject_id)::bigint + 10000) AS id,
    0 AS rstate,
    c.id AS parent_id,
    (((c.path)::text || '.'::text) || ((o.subject_id)::bigint + 10000)) AS path,
    o.product AS caption,
    now() AS dt,
    ''::text AS product,
    sum(COALESCE(o.volume, (0)::double precision)) AS volume
   FROM (storage.v_customers_with_groups c
     LEFT JOIN storage.v_operations_all o ON (((c.path)::public.ltree OPERATOR(public.@>) (o.path)::public.ltree)))
  GROUP BY o.subject_id, c.id, c.caption, c.path, o.product
  ORDER BY c.path;


ALTER TABLE storage.v_rest_by_storages OWNER TO sansa;

--
-- Name: VIEW v_rest_by_storages; Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON VIEW storage.v_rest_by_storages IS 'Остатки продукции по складам';


--
-- Name: v_rest_recycle; Type: VIEW; Schema: storage; Owner: sansa
--

CREATE VIEW storage.v_rest_recycle AS
 SELECT v_operations_complex_list.recipient_id,
    v_operations_complex_list.recipient,
    v_operations_complex_list.product_id,
    v_operations_complex_list.product,
    sum(v_operations_complex_list.rec) AS recycle
   FROM storage.v_operations_complex_list
  WHERE (v_operations_complex_list.rec > (0)::double precision)
  GROUP BY v_operations_complex_list.recipient_id, v_operations_complex_list.recipient, v_operations_complex_list.product_id, v_operations_complex_list.product
  ORDER BY v_operations_complex_list.recipient;


ALTER TABLE storage.v_rest_recycle OWNER TO sansa;

--
-- Name: VIEW v_rest_recycle; Type: COMMENT; Schema: storage; Owner: sansa
--

COMMENT ON VIEW storage.v_rest_recycle IS 'Остатки брака по складам';


--
-- Name: base id; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.base ALTER COLUMN id SET DEFAULT nextval('public.base_id_seq'::regclass);


--
-- Name: base_named id; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.base_named ALTER COLUMN id SET DEFAULT nextval('public.base_id_seq'::regclass);


--
-- Name: base_named created; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.base_named ALTER COLUMN created SET DEFAULT now();


--
-- Name: base_named creator; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.base_named ALTER COLUMN creator SET DEFAULT "current_user"();


--
-- Name: base_named rstate; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.base_named ALTER COLUMN rstate SET DEFAULT 0;


--
-- Name: base_tree id; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.base_tree ALTER COLUMN id SET DEFAULT nextval('public.base_id_seq'::regclass);


--
-- Name: base_tree created; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.base_tree ALTER COLUMN created SET DEFAULT now();


--
-- Name: base_tree creator; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.base_tree ALTER COLUMN creator SET DEFAULT "current_user"();


--
-- Name: base_tree rstate; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.base_tree ALTER COLUMN rstate SET DEFAULT 0;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.base_id_seq'::regclass);


--
-- Name: customers created; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.customers ALTER COLUMN created SET DEFAULT now();


--
-- Name: customers creator; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.customers ALTER COLUMN creator SET DEFAULT "current_user"();


--
-- Name: customers rstate; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.customers ALTER COLUMN rstate SET DEFAULT 0;


--
-- Name: customers_tree id; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.customers_tree ALTER COLUMN id SET DEFAULT nextval('public.base_id_seq'::regclass);


--
-- Name: customers_tree created; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.customers_tree ALTER COLUMN created SET DEFAULT now();


--
-- Name: customers_tree creator; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.customers_tree ALTER COLUMN creator SET DEFAULT "current_user"();


--
-- Name: customers_tree rstate; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.customers_tree ALTER COLUMN rstate SET DEFAULT 0;


--
-- Name: customers_tree gstate; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.customers_tree ALTER COLUMN gstate SET DEFAULT 0;


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.base_id_seq'::regclass);


--
-- Name: documents created; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.documents ALTER COLUMN created SET DEFAULT now();


--
-- Name: documents creator; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.documents ALTER COLUMN creator SET DEFAULT "current_user"();


--
-- Name: documents rstate; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.documents ALTER COLUMN rstate SET DEFAULT 0;


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.base_id_seq'::regclass);


--
-- Name: products created; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.products ALTER COLUMN created SET DEFAULT now();


--
-- Name: products creator; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.products ALTER COLUMN creator SET DEFAULT "current_user"();


--
-- Name: products rstate; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.products ALTER COLUMN rstate SET DEFAULT 0;


--
-- Name: products_tree id; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.products_tree ALTER COLUMN id SET DEFAULT nextval('public.base_id_seq'::regclass);


--
-- Name: products_tree created; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.products_tree ALTER COLUMN created SET DEFAULT now();


--
-- Name: products_tree creator; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.products_tree ALTER COLUMN creator SET DEFAULT "current_user"();


--
-- Name: products_tree rstate; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.products_tree ALTER COLUMN rstate SET DEFAULT 0;


--
-- Name: products_tree gstate; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.products_tree ALTER COLUMN gstate SET DEFAULT 0;


--
-- Name: recipes id; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.base_id_seq'::regclass);


--
-- Name: recipes created; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.recipes ALTER COLUMN created SET DEFAULT now();


--
-- Name: recipes creator; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.recipes ALTER COLUMN creator SET DEFAULT "current_user"();


--
-- Name: recipes rstate; Type: DEFAULT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.recipes ALTER COLUMN rstate SET DEFAULT 0;


--
-- Name: documents created; Type: DEFAULT; Schema: storage; Owner: sansa
--

ALTER TABLE ONLY storage.documents ALTER COLUMN created SET DEFAULT now();


--
-- Name: documents creator; Type: DEFAULT; Schema: storage; Owner: sansa
--

ALTER TABLE ONLY storage.documents ALTER COLUMN creator SET DEFAULT "current_user"();


--
-- Name: documents rstate; Type: DEFAULT; Schema: storage; Owner: sansa
--

ALTER TABLE ONLY storage.documents ALTER COLUMN rstate SET DEFAULT 0;


--
-- Name: documents doc_date; Type: DEFAULT; Schema: storage; Owner: sansa
--

ALTER TABLE ONLY storage.documents ALTER COLUMN doc_date SET DEFAULT now();


--
-- Name: documents print_count; Type: DEFAULT; Schema: storage; Owner: sansa
--

ALTER TABLE ONLY storage.documents ALTER COLUMN print_count SET DEFAULT 0;


--
-- Name: operations_complex id; Type: DEFAULT; Schema: storage; Owner: sansa
--

ALTER TABLE ONLY storage.operations_complex ALTER COLUMN id SET DEFAULT nextval('storage.operations_complex_id_seq'::regclass);


--
-- Data for Name: base; Type: TABLE DATA; Schema: public; Owner: sansa
--



--
-- Data for Name: base_named; Type: TABLE DATA; Schema: public; Owner: sansa
--



--
-- Data for Name: base_tree; Type: TABLE DATA; Schema: public; Owner: sansa
--



--
-- Data for Name: base_tree_childs; Type: TABLE DATA; Schema: public; Owner: sansa
--



--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: sansa
--

INSERT INTO public.customers VALUES (383, '2021-03-03 09:51:10.917074', 'sansa', NULL, NULL, 0, 'млд550', 'млд550', 2, NULL, false);
INSERT INTO public.customers VALUES (384, '2021-03-03 09:51:25.268369', 'sansa', NULL, NULL, 0, 'млд800', 'млд800', 2, NULL, false);
INSERT INTO public.customers VALUES (385, '2021-03-03 09:51:42.052331', 'sansa', NULL, NULL, 0, 'млд800лк', 'млд800лк', 2, NULL, false);
INSERT INTO public.customers VALUES (386, '2021-03-03 09:51:54.883886', 'sansa', NULL, NULL, 0, 'млд280лк', 'млд280лк', 2, NULL, false);
INSERT INTO public.customers VALUES (387, '2021-03-03 09:53:00.497929', 'sansa', NULL, NULL, 0, 'ток1', 'ток1', 2, NULL, false);
INSERT INTO public.customers VALUES (388, '2021-03-03 09:53:10.172196', 'sansa', NULL, NULL, 0, 'ток2', 'ток2', 2, NULL, false);
INSERT INTO public.customers VALUES (389, '2021-03-03 09:53:18.316601', 'sansa', NULL, NULL, 0, 'ток3', 'ток3', 2, NULL, false);
INSERT INTO public.customers VALUES (390, '2021-03-03 09:53:26.680029', 'sansa', NULL, NULL, 0, 'ток4', 'ток4', 2, NULL, false);
INSERT INTO public.customers VALUES (391, '2021-03-03 09:53:33.927451', 'sansa', NULL, NULL, 0, 'ток5', 'ток5', 2, NULL, false);
INSERT INTO public.customers VALUES (382, '2021-03-03 09:50:42.916802', 'sansa', NULL, NULL, 0, 'Склад литье', 'Склад литье', 2, NULL, false);
INSERT INTO public.customers VALUES (445, '2021-03-26 12:12:20.809875', 'sansa', NULL, NULL, 0, 'пресс', 'пресс', 2, NULL, false);
INSERT INTO public.customers VALUES (393, '2021-03-03 09:54:34.033354', 'sansa', NULL, NULL, 0, 'Склад покраска', 'Склад покраска', 2, NULL, false);
INSERT INTO public.customers VALUES (450, '2021-04-07 07:47:58.235816', 'sansa', NULL, NULL, 0, 'пресс ручки', 'пресс ручки', 2, NULL, true);
INSERT INTO public.customers VALUES (392, '2021-03-03 09:54:09.739106', 'sansa', NULL, NULL, 0, 'Склад слесарка', 'Склад слесарка', 2, NULL, true);
INSERT INTO public.customers VALUES (442, '2021-03-26 11:44:21.238975', 'sansa', NULL, NULL, 0, 'Склад ОТК ', 'Склад ОТК', 2, NULL, true);
INSERT INTO public.customers VALUES (448, '2021-04-05 10:00:07.636556', 'sansa', NULL, NULL, 0, '-- не использовать --', '-- не использовать --', 2, NULL, false);
INSERT INTO public.customers VALUES (453, '2021-04-14 13:02:14.24786', 'sansa', NULL, NULL, 0, '_Беко', '_Беко', 3, NULL, false);
INSERT INTO public.customers VALUES (452, '2021-04-13 13:18:50.701957', 'sansa', NULL, NULL, 0, '_Склад Сковородки', '_Склад сковородки', 3, NULL, false);
INSERT INTO public.customers VALUES (455, '2021-04-22 11:43:28.576035', 'sansa', NULL, NULL, 0, 'токарка переделка', 'токарка переделка', 2, NULL, true);
INSERT INTO public.customers VALUES (9, '2021-04-23 10:47:47.937815', 'sansa', NULL, NULL, 0, '-Брак', '-Брак', 3, NULL, false);


--
-- Data for Name: customers_tree; Type: TABLE DATA; Schema: public; Owner: sansa
--

INSERT INTO public.customers_tree VALUES (2, '2011-04-09 13:56:34.002956', 'sansa', NULL, NULL, 0, 'Свои', 0, '2', NULL);
INSERT INTO public.customers_tree VALUES (3, '2011-04-09 13:57:55.687188', 'sansa', NULL, NULL, 0, 'Сторонние', 0, '3', NULL);


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: sansa
--



--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: sansa
--

INSERT INTO public.products VALUES (401, '2021-03-25 08:44:31.940576', 'sansa', NULL, NULL, 0, 'сковорода блинная д240 кокиль', 'бн 240/к', 15);
INSERT INTO public.products VALUES (404, '2021-03-25 08:46:11.820109', 'sansa', NULL, NULL, 0, 'сотейник д280', 'ст 280', 15);
INSERT INTO public.products VALUES (406, '2021-03-25 08:48:19.205009', 'sansa', NULL, NULL, 0, 'сковорода д240 утолщенная', 'ск 240у', 15);
INSERT INTO public.products VALUES (407, '2021-03-25 08:48:57.60127', 'sansa', NULL, NULL, 0, 'сковорода д240 кокиль', 'ск 240к', 15);
INSERT INTO public.products VALUES (398, '2021-03-25 08:42:23.762382', 'sansa', '2021-03-25 08:49:15.835491', 'sansa', 0, 'сковорода д260', 'ск 260', 15);
INSERT INTO public.products VALUES (395, '2021-03-03 09:56:38.969538', 'sansa', '2021-03-25 08:49:25.464236', 'sansa', 0, 'сковорода д240', 'ск 240', 15);
INSERT INTO public.products VALUES (402, '2021-03-25 08:45:06.759451', 'sansa', '2021-03-25 08:49:29.279024', 'sansa', 0, 'сковорода д240 индукционное дно', 'ск 240и', 15);
INSERT INTO public.products VALUES (394, '2021-03-03 09:56:14.699334', 'sansa', '2021-03-25 08:49:33.569371', 'sansa', 0, 'сковорода д220', 'ск 220', 15);
INSERT INTO public.products VALUES (400, '2021-03-25 08:43:41.76902', 'sansa', '2021-03-25 08:49:38.057117', 'sansa', 0, 'сковорода блинная д220', 'бн 220', 15);
INSERT INTO public.products VALUES (408, '2021-03-25 08:50:01.422014', 'sansa', NULL, NULL, 0, 'сковорода блинная д220 индукционное дно', 'бн 220и', 15);
INSERT INTO public.products VALUES (409, '2021-03-25 08:51:00.216614', 'sansa', NULL, NULL, 0, 'казан 5 литра', 'кз 5л', 15);
INSERT INTO public.products VALUES (410, '2021-03-25 08:54:23.229519', 'sansa', '2021-03-25 08:54:41.068741', 'sansa', 0, 'сковорода д280 индукционное дно', 'ск 280и', 15);
INSERT INTO public.products VALUES (411, '2021-03-25 08:55:22.151999', 'sansa', NULL, NULL, 0, 'сковорода блинная д240 с экраном', 'бн 240э', 15);
INSERT INTO public.products VALUES (412, '2021-03-25 09:11:10.613481', 'sansa', NULL, NULL, 0, 'кастрюля 4 литра', 'кс 4л', 15);
INSERT INTO public.products VALUES (413, '2021-03-25 09:11:40.406373', 'sansa', NULL, NULL, 0, 'кастрюля 2литра', 'кс 2л', 15);
INSERT INTO public.products VALUES (414, '2021-03-25 09:12:43.736932', 'sansa', NULL, NULL, 0, 'кастрюля 3литра', 'кс 3л', 15);
INSERT INTO public.products VALUES (415, '2021-03-25 09:13:06.755192', 'sansa', NULL, NULL, 0, 'кастрюля 5 литра', 'кс 5л', 15);
INSERT INTO public.products VALUES (416, '2021-03-25 09:14:36.954414', 'sansa', NULL, NULL, 0, 'кастрюля 3литра индукционное дно', 'кс 3л/и', 15);
INSERT INTO public.products VALUES (417, '2021-03-25 09:15:12.487131', 'sansa', NULL, NULL, 0, 'кастрюля 4литра индукционное дно', 'кс 4л/и', 15);
INSERT INTO public.products VALUES (418, '2021-03-25 09:15:56.665111', 'sansa', NULL, NULL, 0, 'кастрюля 5литра индукционное дно', 'кс 5л/и', 15);
INSERT INTO public.products VALUES (419, '2021-03-25 09:17:16.25361', 'sansa', NULL, NULL, 0, 'ковш 1литр', 'к 1л', 15);
INSERT INTO public.products VALUES (421, '2021-03-25 09:18:03.476389', 'sansa', NULL, NULL, 0, 'ковш 1л индукционное дно', 'к 1л/и', 15);
INSERT INTO public.products VALUES (429, '2021-03-25 09:47:53.517614', 'sansa', NULL, NULL, 0, 'казан 5литра индукционное дно', 'кз 5л/и', 15);
INSERT INTO public.products VALUES (430, '2021-03-25 09:48:45.076396', 'sansa', NULL, NULL, 0, 'крышка казана 5л индукционное дно', 'кр кз 5л/и', 15);
INSERT INTO public.products VALUES (431, '2021-03-25 09:49:08.504229', 'sansa', NULL, NULL, 0, 'крышка казана 5литра', 'кр кз 5л', 15);
INSERT INTO public.products VALUES (432, '2021-03-25 09:51:12.017418', 'sansa', NULL, NULL, 0, 'сковорода д260 утолщенная', 'ск 260/у', 15);
INSERT INTO public.products VALUES (433, '2021-03-25 09:51:48.417819', 'sansa', NULL, NULL, 0, 'сковорода д280 утолщенная', 'ск 280/у', 15);
INSERT INTO public.products VALUES (434, '2021-03-25 09:53:01.589754', 'sansa', NULL, NULL, 0, 'кастрюля 2литра индукционное дно', 'кс 2л/и', 15);
INSERT INTO public.products VALUES (399, '2021-03-25 08:43:00.056223', 'sansa', '2021-03-25 11:35:24.934811', 'sansa', 0, 'сковорода д280', 'ск 280', 15);
INSERT INTO public.products VALUES (423, '2021-03-25 09:19:41.089823', 'sansa', '2021-03-25 11:35:47.457496', 'sansa', 0, 'сковорода-гриль д26*26', 'гр 26*26', 15);
INSERT INTO public.products VALUES (435, '2021-03-25 11:38:06.780724', 'sansa', NULL, NULL, 0, 'Вок 280 индукционное дно с одним гужоном', 'ВОК 280и1', 15);
INSERT INTO public.products VALUES (405, '2021-03-25 08:46:33.121964', 'sansa', '2021-03-25 11:51:28.874858', 'sansa', 0, 'сотейник д280 индукционное дно', 'ст 280 и', 15);
INSERT INTO public.products VALUES (424, '2021-03-25 09:20:42.959168', 'sansa', '2021-03-25 11:52:20.911545', 'sansa', 0, 'сковорода-гриль д26*26 утолщенная', 'гр 26*26 у', 15);
INSERT INTO public.products VALUES (436, '2021-03-25 13:48:05.912783', 'sansa', NULL, NULL, 0, 'Вок 280 с одним гужоном', 'ВОК 280/1', 15);
INSERT INTO public.products VALUES (426, '2021-03-25 09:23:30.24939', 'sansa', '2021-03-26 08:35:11.295702', 'sansa', 0, 'Вок 280 индукционное дно с 2-мя гужонами', 'ВОК 280и2', 15);
INSERT INTO public.products VALUES (441, '2021-03-26 08:35:36.909715', 'sansa', NULL, NULL, 0, 'Вок 280 с двумя гужонами', 'ВОК 280/2', 15);
INSERT INTO public.products VALUES (443, '2021-03-26 11:52:39.957289', 'sansa', '2021-03-26 11:54:10.056525', 'sansa', 0, 'сковорода д260 кокиль', 'ск 260к', 15);
INSERT INTO public.products VALUES (444, '2021-03-26 11:55:59.93816', 'sansa', NULL, NULL, 0, 'сковорода д280 кокиль', 'ск 280к', 15);
INSERT INTO public.products VALUES (403, '2021-03-25 08:45:38.678782', 'sansa', '2021-03-29 09:15:58.240933', 'sansa', 0, 'сковорода д260 индукционное дно', 'ск 260и', 15);
INSERT INTO public.products VALUES (447, '2021-03-29 14:12:01.696779', 'sansa', NULL, NULL, 0, 'шкив 100', 'шк 100', 15);
INSERT INTO public.products VALUES (446, '2021-03-29 14:11:44.969104', 'sansa', '2021-03-29 16:40:40.997625', 'sansa', 0, 'шкив 300', 'шк 300', 15);
INSERT INTO public.products VALUES (449, '2021-04-06 09:00:40.966815', 'sansa', NULL, NULL, 0, 'крестовина', 'крестовина', 15);
INSERT INTO public.products VALUES (451, '2021-04-07 07:48:18.324318', 'sansa', NULL, NULL, 0, 'ручка 40-02', '40-02', 15);
INSERT INTO public.products VALUES (454, '2021-04-21 08:33:32.554729', 'sansa', NULL, NULL, 0, 'ручка 850', 'ручка 850', 15);
INSERT INTO public.products VALUES (456, '2021-04-23 06:41:56.331545', 'sansa', NULL, NULL, 0, 'ручка 690/2', 'ручка 690/2', 15);
INSERT INTO public.products VALUES (457, '2021-04-23 07:14:51.2271', 'sansa', NULL, NULL, 0, 'сковорода 260 млд индукция утолщенная', 'ск 260 млд индукция утолщенная', 15);


--
-- Data for Name: products_tree; Type: TABLE DATA; Schema: public; Owner: sansa
--

INSERT INTO public.products_tree VALUES (15, '2011-04-09 16:29:42.477207', 'sansa', NULL, NULL, 0, 'Изделия', 0, '15', NULL);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: sansa
--

INSERT INTO public.recipes VALUES (397, '2021-03-03 10:16:20.369663', 'sansa', NULL, NULL, 0, 396, 1, 395);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: sansa
--

INSERT INTO public.users VALUES ('sansa', 'Строев С.В.');


--
-- Data for Name: base_operations; Type: TABLE DATA; Schema: storage; Owner: sansa
--

INSERT INTO storage.base_operations VALUES (1359, 1, '2021-03-29 00:00:00', 385, 410, -876, NULL);
INSERT INTO storage.base_operations VALUES (1359, 0, '2021-03-29 00:00:00', 382, 410, 876, NULL);
INSERT INTO storage.base_operations VALUES (1359, 3, '2021-03-29 00:00:00', 385, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1359, 4, '2021-03-29 00:00:00', 382, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1359, 5, '2021-03-29 00:00:00', 9, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1359, 6, '2021-03-29 00:00:00', 382, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1360, 1, '2021-03-29 00:00:00', 384, 399, -1605, NULL);
INSERT INTO storage.base_operations VALUES (1360, 0, '2021-03-29 00:00:00', 382, 399, 1605, NULL);
INSERT INTO storage.base_operations VALUES (1360, 3, '2021-03-29 00:00:00', 384, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1360, 4, '2021-03-29 00:00:00', 382, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1360, 5, '2021-03-29 00:00:00', 9, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1360, 6, '2021-03-29 00:00:00', 382, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1361, 1, '2021-03-29 00:00:00', 382, 410, -980, NULL);
INSERT INTO storage.base_operations VALUES (1361, 0, '2021-03-29 00:00:00', 387, 410, 980, NULL);
INSERT INTO storage.base_operations VALUES (1361, 3, '2021-03-29 00:00:00', 382, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1361, 4, '2021-03-29 00:00:00', 387, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1361, 5, '2021-03-29 00:00:00', 9, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1361, 6, '2021-03-29 00:00:00', 387, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1362, 1, '2021-03-29 00:00:00', 387, 410, -966, NULL);
INSERT INTO storage.base_operations VALUES (1362, 0, '2021-03-29 00:00:00', 445, 410, 966, NULL);
INSERT INTO storage.base_operations VALUES (1362, 3, '2021-03-29 00:00:00', 387, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1362, 4, '2021-03-29 00:00:00', 445, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1362, 5, '2021-03-29 00:00:00', 9, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1362, 6, '2021-03-29 00:00:00', 445, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1363, 1, '2021-03-29 00:00:00', 445, 410, -966, NULL);
INSERT INTO storage.base_operations VALUES (1363, 0, '2021-03-29 00:00:00', 392, 410, 966, NULL);
INSERT INTO storage.base_operations VALUES (1363, 3, '2021-03-29 00:00:00', 445, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1363, 4, '2021-03-29 00:00:00', 392, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1363, 5, '2021-03-29 00:00:00', 9, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1363, 6, '2021-03-29 00:00:00', 392, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1364, -1, '2021-03-29 00:00:00', 442, 408, 984, NULL);
INSERT INTO storage.base_operations VALUES (1365, -1, '2021-03-29 00:00:00', 442, 409, 2459, NULL);
INSERT INTO storage.base_operations VALUES (1366, -1, '2021-03-29 00:00:00', 382, 410, 104, NULL);
INSERT INTO storage.base_operations VALUES (1367, -1, '2021-03-29 00:00:00', 442, 429, 248, NULL);
INSERT INTO storage.base_operations VALUES (1368, -1, '2021-03-29 00:00:00', 442, 415, 293, NULL);
INSERT INTO storage.base_operations VALUES (1369, -1, '2021-03-29 00:00:00', 442, 430, 1124, NULL);
INSERT INTO storage.base_operations VALUES (1370, -1, '2021-03-29 00:00:00', 442, 431, 1373, NULL);
INSERT INTO storage.base_operations VALUES (1371, -1, '2021-03-29 00:00:00', 442, 443, 2134, NULL);
INSERT INTO storage.base_operations VALUES (1372, -1, '2021-03-29 00:00:00', 442, 444, 1881, NULL);
INSERT INTO storage.base_operations VALUES (1373, -1, '2021-03-29 00:00:00', 442, 407, 3182, NULL);
INSERT INTO storage.base_operations VALUES (1374, -1, '2021-03-29 00:00:00', 442, 447, 4495, NULL);
INSERT INTO storage.base_operations VALUES (1375, -1, '2021-03-29 00:00:00', 442, 446, 5941, NULL);
INSERT INTO storage.base_operations VALUES (1376, -1, '2021-03-29 00:00:00', 442, 426, 1865, NULL);
INSERT INTO storage.base_operations VALUES (1377, 1, '2021-03-29 00:00:00', 384, 410, -306, NULL);
INSERT INTO storage.base_operations VALUES (1377, 0, '2021-03-29 00:00:00', 382, 410, 306, NULL);
INSERT INTO storage.base_operations VALUES (1377, 3, '2021-03-29 00:00:00', 384, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1377, 4, '2021-03-29 00:00:00', 382, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1377, 5, '2021-03-29 00:00:00', 9, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1377, 6, '2021-03-29 00:00:00', 382, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1378, 1, '2021-03-29 00:00:00', 382, 410, -306, NULL);
INSERT INTO storage.base_operations VALUES (1378, 0, '2021-03-29 00:00:00', 387, 410, 306, NULL);
INSERT INTO storage.base_operations VALUES (1378, 3, '2021-03-29 00:00:00', 382, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1378, 4, '2021-03-29 00:00:00', 387, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1378, 5, '2021-03-29 00:00:00', 9, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1378, 6, '2021-03-29 00:00:00', 387, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1379, 1, '2021-03-29 00:00:00', 387, 410, -295, NULL);
INSERT INTO storage.base_operations VALUES (1379, 0, '2021-03-29 00:00:00', 392, 410, 295, NULL);
INSERT INTO storage.base_operations VALUES (1379, 3, '2021-03-29 00:00:00', 387, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1379, 4, '2021-03-29 00:00:00', 392, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1379, 5, '2021-03-29 00:00:00', 9, 410, 11, NULL);
INSERT INTO storage.base_operations VALUES (1379, 6, '2021-03-29 00:00:00', 392, 410, -11, NULL);
INSERT INTO storage.base_operations VALUES (1380, 1, '2021-03-29 00:00:00', 382, 399, -303, NULL);
INSERT INTO storage.base_operations VALUES (1380, 0, '2021-03-29 00:00:00', 387, 399, 303, NULL);
INSERT INTO storage.base_operations VALUES (1380, 3, '2021-03-29 00:00:00', 382, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1380, 4, '2021-03-29 00:00:00', 387, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1380, 5, '2021-03-29 00:00:00', 9, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1380, 6, '2021-03-29 00:00:00', 387, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1381, 1, '2021-03-29 00:00:00', 382, 399, -286, NULL);
INSERT INTO storage.base_operations VALUES (1381, 0, '2021-03-29 00:00:00', 387, 399, 286, NULL);
INSERT INTO storage.base_operations VALUES (1381, 3, '2021-03-29 00:00:00', 382, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1381, 4, '2021-03-29 00:00:00', 387, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1381, 5, '2021-03-29 00:00:00', 9, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1381, 6, '2021-03-29 00:00:00', 387, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1382, 1, '2021-03-29 00:00:00', 382, 399, -444, NULL);
INSERT INTO storage.base_operations VALUES (1382, 0, '2021-03-29 00:00:00', 389, 399, 444, NULL);
INSERT INTO storage.base_operations VALUES (1382, 3, '2021-03-29 00:00:00', 382, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1382, 4, '2021-03-29 00:00:00', 389, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1382, 5, '2021-03-29 00:00:00', 9, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1382, 6, '2021-03-29 00:00:00', 389, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1383, 1, '2021-03-29 00:00:00', 382, 426, -572, NULL);
INSERT INTO storage.base_operations VALUES (1383, 0, '2021-03-29 00:00:00', 389, 426, 572, NULL);
INSERT INTO storage.base_operations VALUES (1383, 3, '2021-03-29 00:00:00', 382, 426, 0, NULL);
INSERT INTO storage.base_operations VALUES (1383, 4, '2021-03-29 00:00:00', 389, 426, -0, NULL);
INSERT INTO storage.base_operations VALUES (1383, 5, '2021-03-29 00:00:00', 9, 426, 0, NULL);
INSERT INTO storage.base_operations VALUES (1383, 6, '2021-03-29 00:00:00', 389, 426, -0, NULL);
INSERT INTO storage.base_operations VALUES (1384, -1, '2021-03-29 00:00:00', 389, 426, -572, NULL);
INSERT INTO storage.base_operations VALUES (1385, 1, '2021-03-29 00:00:00', 382, 399, -572, NULL);
INSERT INTO storage.base_operations VALUES (1385, 0, '2021-03-29 00:00:00', 389, 399, 572, NULL);
INSERT INTO storage.base_operations VALUES (1385, 3, '2021-03-29 00:00:00', 382, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1385, 4, '2021-03-29 00:00:00', 389, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1385, 5, '2021-03-29 00:00:00', 9, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1385, 6, '2021-03-29 00:00:00', 389, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1386, -1, '2021-03-29 00:00:00', 382, 426, 572, NULL);
INSERT INTO storage.base_operations VALUES (1387, 1, '2021-03-30 00:00:00', 384, 404, -503, NULL);
INSERT INTO storage.base_operations VALUES (1387, 0, '2021-03-30 00:00:00', 382, 404, 503, NULL);
INSERT INTO storage.base_operations VALUES (1387, 3, '2021-03-30 00:00:00', 384, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1387, 4, '2021-03-30 00:00:00', 382, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1387, 5, '2021-03-30 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1387, 6, '2021-03-30 00:00:00', 382, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1388, 1, '2021-03-30 00:00:00', 389, 399, -952, NULL);
INSERT INTO storage.base_operations VALUES (1388, 0, '2021-03-30 00:00:00', 392, 399, 952, NULL);
INSERT INTO storage.base_operations VALUES (1388, 3, '2021-03-30 00:00:00', 389, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1388, 4, '2021-03-30 00:00:00', 392, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1388, 5, '2021-03-30 00:00:00', 9, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1388, 6, '2021-03-30 00:00:00', 392, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1389, 1, '2021-03-30 00:00:00', 387, 399, -480, NULL);
INSERT INTO storage.base_operations VALUES (1389, 0, '2021-03-30 00:00:00', 392, 399, 480, NULL);
INSERT INTO storage.base_operations VALUES (1389, 3, '2021-03-30 00:00:00', 387, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1389, 4, '2021-03-30 00:00:00', 392, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1389, 5, '2021-03-30 00:00:00', 9, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1389, 6, '2021-03-30 00:00:00', 392, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1390, 1, '2021-03-30 00:00:00', 445, 410, -360, NULL);
INSERT INTO storage.base_operations VALUES (1390, 0, '2021-03-30 00:00:00', 392, 410, 360, NULL);
INSERT INTO storage.base_operations VALUES (1390, 3, '2021-03-30 00:00:00', 445, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1390, 4, '2021-03-30 00:00:00', 392, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1390, 5, '2021-03-30 00:00:00', 9, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1390, 6, '2021-03-30 00:00:00', 392, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1391, 1, '2021-03-30 00:00:00', 445, 410, -433, NULL);
INSERT INTO storage.base_operations VALUES (1391, 0, '2021-03-30 00:00:00', 392, 410, 433, NULL);
INSERT INTO storage.base_operations VALUES (1391, 3, '2021-03-30 00:00:00', 445, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1391, 4, '2021-03-30 00:00:00', 392, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1391, 5, '2021-03-30 00:00:00', 9, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1391, 6, '2021-03-30 00:00:00', 392, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1392, 1, '2021-03-30 00:00:00', 392, 410, -311, NULL);
INSERT INTO storage.base_operations VALUES (1392, 0, '2021-03-30 00:00:00', 442, 410, 311, NULL);
INSERT INTO storage.base_operations VALUES (1392, 3, '2021-03-30 00:00:00', 392, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1392, 4, '2021-03-30 00:00:00', 442, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1392, 5, '2021-03-30 00:00:00', 9, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1392, 6, '2021-03-30 00:00:00', 442, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1393, 1, '2021-03-30 00:00:00', 392, 415, -320, NULL);
INSERT INTO storage.base_operations VALUES (1393, 0, '2021-03-30 00:00:00', 442, 415, 320, NULL);
INSERT INTO storage.base_operations VALUES (1393, 3, '2021-03-30 00:00:00', 392, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1393, 4, '2021-03-30 00:00:00', 442, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1393, 5, '2021-03-30 00:00:00', 9, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1393, 6, '2021-03-30 00:00:00', 442, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1394, 1, '2021-03-30 00:00:00', 392, 430, -800, NULL);
INSERT INTO storage.base_operations VALUES (1394, 0, '2021-03-30 00:00:00', 442, 430, 800, NULL);
INSERT INTO storage.base_operations VALUES (1394, 3, '2021-03-30 00:00:00', 392, 430, 0, NULL);
INSERT INTO storage.base_operations VALUES (1394, 4, '2021-03-30 00:00:00', 442, 430, -0, NULL);
INSERT INTO storage.base_operations VALUES (1394, 5, '2021-03-30 00:00:00', 9, 430, 0, NULL);
INSERT INTO storage.base_operations VALUES (1394, 6, '2021-03-30 00:00:00', 442, 430, -0, NULL);
INSERT INTO storage.base_operations VALUES (1395, 1, '2021-03-30 00:00:00', 392, 431, -179, NULL);
INSERT INTO storage.base_operations VALUES (1395, 0, '2021-03-30 00:00:00', 442, 431, 179, NULL);
INSERT INTO storage.base_operations VALUES (1395, 3, '2021-03-30 00:00:00', 392, 431, 0, NULL);
INSERT INTO storage.base_operations VALUES (1395, 4, '2021-03-30 00:00:00', 442, 431, -0, NULL);
INSERT INTO storage.base_operations VALUES (1395, 5, '2021-03-30 00:00:00', 9, 431, 0, NULL);
INSERT INTO storage.base_operations VALUES (1395, 6, '2021-03-30 00:00:00', 442, 431, -0, NULL);
INSERT INTO storage.base_operations VALUES (1396, 1, '2021-03-30 00:00:00', 392, 398, -387, NULL);
INSERT INTO storage.base_operations VALUES (1396, 0, '2021-03-30 00:00:00', 442, 398, 387, NULL);
INSERT INTO storage.base_operations VALUES (1396, 3, '2021-03-30 00:00:00', 392, 398, 0, NULL);
INSERT INTO storage.base_operations VALUES (1396, 4, '2021-03-30 00:00:00', 442, 398, -0, NULL);
INSERT INTO storage.base_operations VALUES (1396, 5, '2021-03-30 00:00:00', 9, 398, 0, NULL);
INSERT INTO storage.base_operations VALUES (1396, 6, '2021-03-30 00:00:00', 442, 398, -0, NULL);
INSERT INTO storage.base_operations VALUES (1397, 1, '2021-03-30 00:00:00', 392, 430, -243, NULL);
INSERT INTO storage.base_operations VALUES (1397, 0, '2021-03-30 00:00:00', 442, 430, 243, NULL);
INSERT INTO storage.base_operations VALUES (1397, 3, '2021-03-30 00:00:00', 392, 430, 0, NULL);
INSERT INTO storage.base_operations VALUES (1397, 4, '2021-03-30 00:00:00', 442, 430, -0, NULL);
INSERT INTO storage.base_operations VALUES (1397, 5, '2021-03-30 00:00:00', 9, 430, 0, NULL);
INSERT INTO storage.base_operations VALUES (1397, 6, '2021-03-30 00:00:00', 442, 430, -0, NULL);
INSERT INTO storage.base_operations VALUES (1398, 1, '2021-03-30 00:00:00', 392, 412, -279, NULL);
INSERT INTO storage.base_operations VALUES (1398, 0, '2021-03-30 00:00:00', 442, 412, 279, NULL);
INSERT INTO storage.base_operations VALUES (1398, 3, '2021-03-30 00:00:00', 392, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1398, 4, '2021-03-30 00:00:00', 442, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1398, 5, '2021-03-30 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1398, 6, '2021-03-30 00:00:00', 442, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1399, 1, '2021-03-30 00:00:00', 389, 399, -64, NULL);
INSERT INTO storage.base_operations VALUES (1399, 0, '2021-03-30 00:00:00', 442, 399, 64, NULL);
INSERT INTO storage.base_operations VALUES (1399, 3, '2021-03-30 00:00:00', 389, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1399, 4, '2021-03-30 00:00:00', 442, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1399, 5, '2021-03-30 00:00:00', 9, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1399, 6, '2021-03-30 00:00:00', 442, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1400, 1, '2021-03-30 00:00:00', 387, 399, -98, NULL);
INSERT INTO storage.base_operations VALUES (1400, 0, '2021-03-30 00:00:00', 442, 399, 98, NULL);
INSERT INTO storage.base_operations VALUES (1400, 3, '2021-03-30 00:00:00', 387, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1400, 4, '2021-03-30 00:00:00', 442, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1400, 5, '2021-03-30 00:00:00', 9, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1400, 6, '2021-03-30 00:00:00', 442, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1401, 1, '2021-03-30 00:00:00', 391, 415, -190, NULL);
INSERT INTO storage.base_operations VALUES (1401, 0, '2021-03-30 00:00:00', 392, 415, 190, NULL);
INSERT INTO storage.base_operations VALUES (1401, 3, '2021-03-30 00:00:00', 391, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1401, 4, '2021-03-30 00:00:00', 392, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1401, 5, '2021-03-30 00:00:00', 9, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1401, 6, '2021-03-30 00:00:00', 392, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1402, -1, '2021-03-30 00:00:00', 445, 410, 793, NULL);
INSERT INTO storage.base_operations VALUES (1403, -1, '2021-03-30 00:00:00', 392, 412, 279, NULL);
INSERT INTO storage.base_operations VALUES (1404, -1, '2021-03-30 00:00:00', 392, 415, 130, NULL);
INSERT INTO storage.base_operations VALUES (1405, -1, '2021-03-30 00:00:00', 392, 398, 387, NULL);
INSERT INTO storage.base_operations VALUES (1406, -1, '2021-03-30 00:00:00', 391, 415, 190, NULL);
INSERT INTO storage.base_operations VALUES (1407, -1, '2021-03-30 00:00:00', 392, 430, 1043, NULL);
INSERT INTO storage.base_operations VALUES (1408, -1, '2021-03-30 00:00:00', 392, 431, 179, NULL);
INSERT INTO storage.base_operations VALUES (1409, -1, '2021-03-30 00:00:00', 442, 410, 4733, NULL);
INSERT INTO storage.base_operations VALUES (1410, -1, '2021-03-30 00:00:00', 385, 410, 876, NULL);
INSERT INTO storage.base_operations VALUES (1411, 1, '2021-03-30 00:00:00', 442, 410, -5044, NULL);
INSERT INTO storage.base_operations VALUES (1411, 0, '2021-03-30 00:00:00', 393, 410, 5044, NULL);
INSERT INTO storage.base_operations VALUES (1411, 3, '2021-03-30 00:00:00', 442, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1411, 4, '2021-03-30 00:00:00', 393, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1411, 5, '2021-03-30 00:00:00', 9, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1411, 6, '2021-03-30 00:00:00', 393, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1412, 1, '2021-03-30 00:00:00', 391, 415, -241, NULL);
INSERT INTO storage.base_operations VALUES (1412, 0, '2021-03-30 00:00:00', 392, 415, 241, NULL);
INSERT INTO storage.base_operations VALUES (1412, 3, '2021-03-30 00:00:00', 391, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1412, 4, '2021-03-30 00:00:00', 392, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1412, 5, '2021-03-30 00:00:00', 9, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1412, 6, '2021-03-30 00:00:00', 392, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1413, -1, '2021-03-30 00:00:00', 391, 415, 241, NULL);
INSERT INTO storage.base_operations VALUES (1414, 1, '2021-03-31 00:00:00', 384, 404, -848, NULL);
INSERT INTO storage.base_operations VALUES (1414, 0, '2021-03-31 00:00:00', 382, 404, 848, NULL);
INSERT INTO storage.base_operations VALUES (1414, 3, '2021-03-31 00:00:00', 384, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1414, 4, '2021-03-31 00:00:00', 382, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1414, 5, '2021-03-31 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1414, 6, '2021-03-31 00:00:00', 382, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1415, 1, '2021-03-31 00:00:00', 385, 413, -963, NULL);
INSERT INTO storage.base_operations VALUES (1415, 0, '2021-03-31 00:00:00', 382, 413, 963, NULL);
INSERT INTO storage.base_operations VALUES (1415, 3, '2021-03-31 00:00:00', 385, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1415, 4, '2021-03-31 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1415, 5, '2021-03-31 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1415, 6, '2021-03-31 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1416, 1, '2021-03-31 00:00:00', 389, 404, -181, NULL);
INSERT INTO storage.base_operations VALUES (1416, 0, '2021-03-31 00:00:00', 392, 404, 181, NULL);
INSERT INTO storage.base_operations VALUES (1416, 3, '2021-03-31 00:00:00', 389, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1416, 4, '2021-03-31 00:00:00', 392, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1416, 5, '2021-03-31 00:00:00', 9, 404, 1, NULL);
INSERT INTO storage.base_operations VALUES (1416, 6, '2021-03-31 00:00:00', 392, 404, -1, NULL);
INSERT INTO storage.base_operations VALUES (1417, -1, '2021-03-31 00:00:00', 389, 404, 181, NULL);
INSERT INTO storage.base_operations VALUES (1418, 1, '2021-03-31 00:00:00', 391, 415, -240, NULL);
INSERT INTO storage.base_operations VALUES (1418, 0, '2021-03-31 00:00:00', 392, 415, 240, NULL);
INSERT INTO storage.base_operations VALUES (1418, 3, '2021-03-31 00:00:00', 391, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1418, 4, '2021-03-31 00:00:00', 392, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1418, 5, '2021-03-31 00:00:00', 9, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1418, 6, '2021-03-31 00:00:00', 392, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1419, -1, '2021-03-31 00:00:00', 391, 415, 240, NULL);
INSERT INTO storage.base_operations VALUES (1420, 1, '2021-03-31 00:00:00', 391, 415, -242, NULL);
INSERT INTO storage.base_operations VALUES (1420, 0, '2021-03-31 00:00:00', 392, 415, 242, NULL);
INSERT INTO storage.base_operations VALUES (1420, 3, '2021-03-31 00:00:00', 391, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1420, 4, '2021-03-31 00:00:00', 392, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1420, 5, '2021-03-31 00:00:00', 9, 415, 2, NULL);
INSERT INTO storage.base_operations VALUES (1420, 6, '2021-03-31 00:00:00', 392, 415, -2, NULL);
INSERT INTO storage.base_operations VALUES (1421, -1, '2021-03-31 00:00:00', 391, 415, 242, NULL);
INSERT INTO storage.base_operations VALUES (1422, 1, '2021-04-01 00:00:00', 384, 404, -962, NULL);
INSERT INTO storage.base_operations VALUES (1422, 0, '2021-04-01 00:00:00', 382, 404, 962, NULL);
INSERT INTO storage.base_operations VALUES (1422, 3, '2021-04-01 00:00:00', 384, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1422, 4, '2021-04-01 00:00:00', 382, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1422, 5, '2021-04-01 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1422, 6, '2021-04-01 00:00:00', 382, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1423, 1, '2021-04-01 00:00:00', 385, 413, -1300, NULL);
INSERT INTO storage.base_operations VALUES (1423, 0, '2021-04-01 00:00:00', 382, 413, 1300, NULL);
INSERT INTO storage.base_operations VALUES (1423, 3, '2021-04-01 00:00:00', 385, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1423, 4, '2021-04-01 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1423, 5, '2021-04-01 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1423, 6, '2021-04-01 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1424, 1, '2021-04-01 00:00:00', 389, 404, -820, NULL);
INSERT INTO storage.base_operations VALUES (1424, 0, '2021-04-01 00:00:00', 392, 404, 820, NULL);
INSERT INTO storage.base_operations VALUES (1424, 3, '2021-04-01 00:00:00', 389, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1424, 4, '2021-04-01 00:00:00', 392, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1424, 5, '2021-04-01 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1424, 6, '2021-04-01 00:00:00', 392, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1425, 1, '2021-04-01 00:00:00', 391, 415, -252, NULL);
INSERT INTO storage.base_operations VALUES (1425, 0, '2021-04-01 00:00:00', 392, 415, 252, NULL);
INSERT INTO storage.base_operations VALUES (1425, 3, '2021-04-01 00:00:00', 391, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1425, 4, '2021-04-01 00:00:00', 392, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1425, 5, '2021-04-01 00:00:00', 9, 415, 1, NULL);
INSERT INTO storage.base_operations VALUES (1425, 6, '2021-04-01 00:00:00', 392, 415, -1, NULL);
INSERT INTO storage.base_operations VALUES (1426, -1, '2021-04-01 00:00:00', 391, 415, 252, NULL);
INSERT INTO storage.base_operations VALUES (1427, -1, '2021-04-01 00:00:00', 389, 404, 820, NULL);
INSERT INTO storage.base_operations VALUES (1428, 1, '2021-04-01 00:00:00', 391, 415, -240, NULL);
INSERT INTO storage.base_operations VALUES (1428, 0, '2021-04-01 00:00:00', 392, 415, 240, NULL);
INSERT INTO storage.base_operations VALUES (1428, 3, '2021-04-01 00:00:00', 391, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1428, 4, '2021-04-01 00:00:00', 392, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1428, 5, '2021-04-01 00:00:00', 9, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1428, 6, '2021-04-01 00:00:00', 392, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1429, -1, '2021-04-01 00:00:00', 391, 415, 240, NULL);
INSERT INTO storage.base_operations VALUES (1430, 1, '2021-04-01 00:00:00', 392, 430, -19, NULL);
INSERT INTO storage.base_operations VALUES (1430, 0, '2021-04-01 00:00:00', 442, 430, 19, NULL);
INSERT INTO storage.base_operations VALUES (1430, 3, '2021-04-01 00:00:00', 392, 430, 0, NULL);
INSERT INTO storage.base_operations VALUES (1430, 4, '2021-04-01 00:00:00', 442, 430, -0, NULL);
INSERT INTO storage.base_operations VALUES (1430, 5, '2021-04-01 00:00:00', 9, 430, 0, NULL);
INSERT INTO storage.base_operations VALUES (1430, 6, '2021-04-01 00:00:00', 442, 430, -0, NULL);
INSERT INTO storage.base_operations VALUES (1431, -1, '2021-04-01 00:00:00', 392, 430, 19, NULL);
INSERT INTO storage.base_operations VALUES (1432, 1, '2021-04-01 00:00:00', 382, 404, -962, NULL);
INSERT INTO storage.base_operations VALUES (1432, 0, '2021-04-01 00:00:00', 389, 404, 962, NULL);
INSERT INTO storage.base_operations VALUES (1432, 3, '2021-04-01 00:00:00', 382, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1432, 4, '2021-04-01 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1432, 5, '2021-04-01 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1432, 6, '2021-04-01 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1433, 1, '2021-04-01 00:00:00', 391, 415, -219, NULL);
INSERT INTO storage.base_operations VALUES (1433, 0, '2021-04-01 00:00:00', 392, 415, 219, NULL);
INSERT INTO storage.base_operations VALUES (1433, 3, '2021-04-01 00:00:00', 391, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1433, 4, '2021-04-01 00:00:00', 392, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1433, 5, '2021-04-01 00:00:00', 9, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1433, 6, '2021-04-01 00:00:00', 392, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1434, -1, '2021-04-01 00:00:00', 391, 415, 219, NULL);
INSERT INTO storage.base_operations VALUES (1435, 1, '2021-04-01 00:00:00', 389, 404, -350, NULL);
INSERT INTO storage.base_operations VALUES (1435, 0, '2021-04-01 00:00:00', 392, 404, 350, NULL);
INSERT INTO storage.base_operations VALUES (1435, 3, '2021-04-01 00:00:00', 389, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1435, 4, '2021-04-01 00:00:00', 392, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1435, 5, '2021-04-01 00:00:00', 9, 404, 2, NULL);
INSERT INTO storage.base_operations VALUES (1435, 6, '2021-04-01 00:00:00', 392, 404, -2, NULL);
INSERT INTO storage.base_operations VALUES (1436, 1, '2021-04-01 00:00:00', 392, 415, -240, NULL);
INSERT INTO storage.base_operations VALUES (1436, 0, '2021-04-01 00:00:00', 442, 415, 240, NULL);
INSERT INTO storage.base_operations VALUES (1436, 3, '2021-04-01 00:00:00', 392, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1436, 4, '2021-04-01 00:00:00', 442, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1436, 5, '2021-04-01 00:00:00', 9, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1436, 6, '2021-04-01 00:00:00', 442, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1437, 1, '2021-04-01 00:00:00', 382, 413, -360, NULL);
INSERT INTO storage.base_operations VALUES (1437, 0, '2021-04-01 00:00:00', 391, 413, 360, NULL);
INSERT INTO storage.base_operations VALUES (1437, 3, '2021-04-01 00:00:00', 382, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1437, 4, '2021-04-01 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1437, 5, '2021-04-01 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1437, 6, '2021-04-01 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1438, 1, '2021-04-01 00:00:00', 392, 410, -796, NULL);
INSERT INTO storage.base_operations VALUES (1438, 0, '2021-04-01 00:00:00', 442, 410, 796, NULL);
INSERT INTO storage.base_operations VALUES (1438, 3, '2021-04-01 00:00:00', 392, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1438, 4, '2021-04-01 00:00:00', 442, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1438, 5, '2021-04-01 00:00:00', 9, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1438, 6, '2021-04-01 00:00:00', 442, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1439, 1, '2021-04-01 00:00:00', 392, 415, -640, NULL);
INSERT INTO storage.base_operations VALUES (1439, 0, '2021-04-01 00:00:00', 442, 415, 640, NULL);
INSERT INTO storage.base_operations VALUES (1439, 3, '2021-04-01 00:00:00', 392, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1439, 4, '2021-04-01 00:00:00', 442, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1439, 5, '2021-04-01 00:00:00', 9, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1439, 6, '2021-04-01 00:00:00', 442, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1440, 1, '2021-04-01 00:00:00', 392, 399, -1588, NULL);
INSERT INTO storage.base_operations VALUES (1440, 0, '2021-04-01 00:00:00', 442, 399, 1588, NULL);
INSERT INTO storage.base_operations VALUES (1440, 3, '2021-04-01 00:00:00', 392, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1440, 4, '2021-04-01 00:00:00', 442, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1440, 5, '2021-04-01 00:00:00', 9, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1440, 6, '2021-04-01 00:00:00', 442, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1441, 1, '2021-04-01 00:00:00', 392, 404, -960, NULL);
INSERT INTO storage.base_operations VALUES (1441, 0, '2021-04-01 00:00:00', 442, 404, 960, NULL);
INSERT INTO storage.base_operations VALUES (1441, 3, '2021-04-01 00:00:00', 392, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1441, 4, '2021-04-01 00:00:00', 442, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1441, 5, '2021-04-01 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1441, 6, '2021-04-01 00:00:00', 442, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1442, -1, '2021-04-01 00:00:00', 392, 399, 156, NULL);
INSERT INTO storage.base_operations VALUES (1443, 1, '2021-04-01 00:00:00', 392, 415, -320, NULL);
INSERT INTO storage.base_operations VALUES (1443, 0, '2021-04-01 00:00:00', 442, 415, 320, NULL);
INSERT INTO storage.base_operations VALUES (1443, 3, '2021-04-01 00:00:00', 392, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1443, 4, '2021-04-01 00:00:00', 442, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1443, 5, '2021-04-01 00:00:00', 9, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1443, 6, '2021-04-01 00:00:00', 442, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1444, 1, '2021-04-02 00:00:00', 385, 413, -1184, NULL);
INSERT INTO storage.base_operations VALUES (1444, 0, '2021-04-02 00:00:00', 382, 413, 1184, NULL);
INSERT INTO storage.base_operations VALUES (1444, 3, '2021-04-02 00:00:00', 385, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1444, 4, '2021-04-02 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1444, 5, '2021-04-02 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1444, 6, '2021-04-02 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1445, 1, '2021-04-02 00:00:00', 384, 404, -832, NULL);
INSERT INTO storage.base_operations VALUES (1445, 0, '2021-04-02 00:00:00', 382, 404, 832, NULL);
INSERT INTO storage.base_operations VALUES (1445, 3, '2021-04-02 00:00:00', 384, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1445, 4, '2021-04-02 00:00:00', 382, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1445, 5, '2021-04-02 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1445, 6, '2021-04-02 00:00:00', 382, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1446, 1, '2021-04-02 00:00:00', 382, 413, -680, NULL);
INSERT INTO storage.base_operations VALUES (1446, 0, '2021-04-02 00:00:00', 391, 413, 680, NULL);
INSERT INTO storage.base_operations VALUES (1446, 3, '2021-04-02 00:00:00', 382, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1446, 4, '2021-04-02 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1446, 5, '2021-04-02 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1446, 6, '2021-04-02 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1447, 1, '2021-04-02 00:00:00', 391, 413, -359, NULL);
INSERT INTO storage.base_operations VALUES (1447, 0, '2021-04-02 00:00:00', 392, 413, 359, NULL);
INSERT INTO storage.base_operations VALUES (1447, 3, '2021-04-02 00:00:00', 391, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1447, 4, '2021-04-02 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1447, 5, '2021-04-02 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1447, 6, '2021-04-02 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1448, 1, '2021-04-02 00:00:00', 389, 404, -900, NULL);
INSERT INTO storage.base_operations VALUES (1448, 0, '2021-04-02 00:00:00', 442, 404, 900, NULL);
INSERT INTO storage.base_operations VALUES (1448, 3, '2021-04-02 00:00:00', 389, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1448, 4, '2021-04-02 00:00:00', 442, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1448, 5, '2021-04-02 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1448, 6, '2021-04-02 00:00:00', 442, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1449, 1, '2021-04-02 00:00:00', 445, 429, -525, NULL);
INSERT INTO storage.base_operations VALUES (1449, 0, '2021-04-02 00:00:00', 392, 429, 525, NULL);
INSERT INTO storage.base_operations VALUES (1449, 3, '2021-04-02 00:00:00', 445, 429, 0, NULL);
INSERT INTO storage.base_operations VALUES (1449, 4, '2021-04-02 00:00:00', 392, 429, -0, NULL);
INSERT INTO storage.base_operations VALUES (1449, 5, '2021-04-02 00:00:00', 9, 429, 0, NULL);
INSERT INTO storage.base_operations VALUES (1449, 6, '2021-04-02 00:00:00', 392, 429, -0, NULL);
INSERT INTO storage.base_operations VALUES (1450, -1, '2021-04-02 00:00:00', 445, 429, 525, NULL);
INSERT INTO storage.base_operations VALUES (1451, -1, '2021-04-02 00:00:00', 389, 404, 288, NULL);
INSERT INTO storage.base_operations VALUES (1452, 1, '2021-04-02 00:00:00', 392, 415, -279, NULL);
INSERT INTO storage.base_operations VALUES (1452, 0, '2021-04-02 00:00:00', 442, 415, 279, NULL);
INSERT INTO storage.base_operations VALUES (1452, 3, '2021-04-02 00:00:00', 392, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1452, 4, '2021-04-02 00:00:00', 442, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1452, 5, '2021-04-02 00:00:00', 9, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1452, 6, '2021-04-02 00:00:00', 442, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1453, -1, '2021-04-02 00:00:00', 392, 415, 48, NULL);
INSERT INTO storage.base_operations VALUES (1454, 1, '2021-04-02 00:00:00', 391, 413, -682, NULL);
INSERT INTO storage.base_operations VALUES (1454, 0, '2021-04-02 00:00:00', 392, 413, 682, NULL);
INSERT INTO storage.base_operations VALUES (1454, 3, '2021-04-02 00:00:00', 391, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1454, 4, '2021-04-02 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1454, 5, '2021-04-02 00:00:00', 9, 413, 2, NULL);
INSERT INTO storage.base_operations VALUES (1454, 6, '2021-04-02 00:00:00', 392, 413, -2, NULL);
INSERT INTO storage.base_operations VALUES (1455, -1, '2021-04-02 00:00:00', 391, 413, 1, NULL);
INSERT INTO storage.base_operations VALUES (1456, 1, '2021-04-02 00:00:00', 392, 426, -240, NULL);
INSERT INTO storage.base_operations VALUES (1456, 0, '2021-04-02 00:00:00', 442, 426, 240, NULL);
INSERT INTO storage.base_operations VALUES (1456, 3, '2021-04-02 00:00:00', 392, 426, 0, NULL);
INSERT INTO storage.base_operations VALUES (1456, 4, '2021-04-02 00:00:00', 442, 426, -0, NULL);
INSERT INTO storage.base_operations VALUES (1456, 5, '2021-04-02 00:00:00', 9, 426, 0, NULL);
INSERT INTO storage.base_operations VALUES (1456, 6, '2021-04-02 00:00:00', 442, 426, -0, NULL);
INSERT INTO storage.base_operations VALUES (1457, -1, '2021-04-02 00:00:00', 392, 426, 240, NULL);
INSERT INTO storage.base_operations VALUES (1458, 1, '2021-04-02 00:00:00', 392, 415, -698, NULL);
INSERT INTO storage.base_operations VALUES (1458, 0, '2021-04-02 00:00:00', 442, 415, 698, NULL);
INSERT INTO storage.base_operations VALUES (1458, 3, '2021-04-02 00:00:00', 392, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1458, 4, '2021-04-02 00:00:00', 442, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1458, 5, '2021-04-02 00:00:00', 9, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1458, 6, '2021-04-02 00:00:00', 442, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1459, -1, '2021-04-02 00:00:00', 392, 415, 698, NULL);
INSERT INTO storage.base_operations VALUES (1460, 1, '2021-04-02 00:00:00', 442, 407, -3182, NULL);
INSERT INTO storage.base_operations VALUES (1460, 0, '2021-04-02 00:00:00', 393, 407, 3182, NULL);
INSERT INTO storage.base_operations VALUES (1460, 3, '2021-04-02 00:00:00', 442, 407, 0, NULL);
INSERT INTO storage.base_operations VALUES (1460, 4, '2021-04-02 00:00:00', 393, 407, -0, NULL);
INSERT INTO storage.base_operations VALUES (1460, 5, '2021-04-02 00:00:00', 9, 407, 0, NULL);
INSERT INTO storage.base_operations VALUES (1460, 6, '2021-04-02 00:00:00', 393, 407, -0, NULL);
INSERT INTO storage.base_operations VALUES (1461, 1, '2021-04-02 00:00:00', 442, 408, -984, NULL);
INSERT INTO storage.base_operations VALUES (1461, 0, '2021-04-02 00:00:00', 393, 408, 984, NULL);
INSERT INTO storage.base_operations VALUES (1461, 3, '2021-04-02 00:00:00', 442, 408, 0, NULL);
INSERT INTO storage.base_operations VALUES (1461, 4, '2021-04-02 00:00:00', 393, 408, -0, NULL);
INSERT INTO storage.base_operations VALUES (1461, 5, '2021-04-02 00:00:00', 9, 408, 0, NULL);
INSERT INTO storage.base_operations VALUES (1461, 6, '2021-04-02 00:00:00', 393, 408, -0, NULL);
INSERT INTO storage.base_operations VALUES (1462, 1, '2021-04-02 00:00:00', 392, 404, -480, NULL);
INSERT INTO storage.base_operations VALUES (1462, 0, '2021-04-02 00:00:00', 442, 404, 480, NULL);
INSERT INTO storage.base_operations VALUES (1462, 3, '2021-04-02 00:00:00', 392, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1462, 4, '2021-04-02 00:00:00', 442, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1462, 5, '2021-04-02 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1462, 6, '2021-04-02 00:00:00', 442, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1463, 1, '2021-04-02 00:00:00', 392, 415, -147, NULL);
INSERT INTO storage.base_operations VALUES (1463, 0, '2021-04-02 00:00:00', 442, 415, 147, NULL);
INSERT INTO storage.base_operations VALUES (1463, 3, '2021-04-02 00:00:00', 392, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1463, 4, '2021-04-02 00:00:00', 442, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1463, 5, '2021-04-02 00:00:00', 9, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1463, 6, '2021-04-02 00:00:00', 442, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1464, 1, '2021-04-02 00:00:00', 389, 404, -464, NULL);
INSERT INTO storage.base_operations VALUES (1464, 0, '2021-04-02 00:00:00', 392, 404, 464, NULL);
INSERT INTO storage.base_operations VALUES (1464, 3, '2021-04-02 00:00:00', 389, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1464, 4, '2021-04-02 00:00:00', 392, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1464, 5, '2021-04-02 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1464, 6, '2021-04-02 00:00:00', 392, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1465, 1, '2021-04-02 00:00:00', 382, 413, -1722, NULL);
INSERT INTO storage.base_operations VALUES (1465, 0, '2021-04-02 00:00:00', 391, 413, 1722, NULL);
INSERT INTO storage.base_operations VALUES (1465, 3, '2021-04-02 00:00:00', 382, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1465, 4, '2021-04-02 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1465, 5, '2021-04-02 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1465, 6, '2021-04-02 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1466, -1, '2021-04-02 00:00:00', 392, 415, 147, NULL);
INSERT INTO storage.base_operations VALUES (1467, -1, '2021-04-02 00:00:00', 442, 426, 240, NULL);
INSERT INTO storage.base_operations VALUES (1468, 1, '2021-04-02 00:00:00', 382, 404, -464, NULL);
INSERT INTO storage.base_operations VALUES (1468, 0, '2021-04-02 00:00:00', 389, 404, 464, NULL);
INSERT INTO storage.base_operations VALUES (1468, 3, '2021-04-02 00:00:00', 382, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1468, 4, '2021-04-02 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1468, 5, '2021-04-02 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1468, 6, '2021-04-02 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1469, -1, '2021-04-05 00:00:00', 442, 426, -820, NULL);
INSERT INTO storage.base_operations VALUES (1470, -1, '2021-04-05 00:00:00', 442, 415, -254, NULL);
INSERT INTO storage.base_operations VALUES (1471, -1, '2021-04-05 00:00:00', 442, 431, -179, NULL);
INSERT INTO storage.base_operations VALUES (1472, -1, '2021-04-05 00:00:00', 442, 430, -640, NULL);
INSERT INTO storage.base_operations VALUES (1473, -1, '2021-04-05 00:00:00', 442, 399, -159, NULL);
INSERT INTO storage.base_operations VALUES (1474, -1, '2021-04-05 00:00:00', 442, 404, -424, NULL);
INSERT INTO storage.base_operations VALUES (1475, -1, '2021-04-05 00:00:00', 442, 446, 9687, NULL);
INSERT INTO storage.base_operations VALUES (1476, 1, '2021-04-05 00:00:00', 385, 413, -3591, NULL);
INSERT INTO storage.base_operations VALUES (1476, 0, '2021-04-05 00:00:00', 382, 413, 3591, NULL);
INSERT INTO storage.base_operations VALUES (1476, 3, '2021-04-05 00:00:00', 385, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1476, 4, '2021-04-05 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1476, 5, '2021-04-05 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1476, 6, '2021-04-05 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1477, 1, '2021-04-05 00:00:00', 384, 404, -2377, NULL);
INSERT INTO storage.base_operations VALUES (1477, 0, '2021-04-05 00:00:00', 382, 404, 2377, NULL);
INSERT INTO storage.base_operations VALUES (1477, 3, '2021-04-05 00:00:00', 384, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1477, 4, '2021-04-05 00:00:00', 382, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1477, 5, '2021-04-05 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1477, 6, '2021-04-05 00:00:00', 382, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1478, 1, '2021-04-05 00:00:00', 382, 413, -684, NULL);
INSERT INTO storage.base_operations VALUES (1478, 0, '2021-04-05 00:00:00', 391, 413, 684, NULL);
INSERT INTO storage.base_operations VALUES (1478, 3, '2021-04-05 00:00:00', 382, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1478, 4, '2021-04-05 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1478, 5, '2021-04-05 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1478, 6, '2021-04-05 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1479, 1, '2021-04-05 00:00:00', 391, 413, -2405, NULL);
INSERT INTO storage.base_operations VALUES (1479, 0, '2021-04-05 00:00:00', 392, 413, 2405, NULL);
INSERT INTO storage.base_operations VALUES (1479, 3, '2021-04-05 00:00:00', 391, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1479, 4, '2021-04-05 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1479, 5, '2021-04-05 00:00:00', 9, 413, 3, NULL);
INSERT INTO storage.base_operations VALUES (1479, 6, '2021-04-05 00:00:00', 392, 413, -3, NULL);
INSERT INTO storage.base_operations VALUES (1480, 1, '2021-04-05 00:00:00', 382, 404, -432, NULL);
INSERT INTO storage.base_operations VALUES (1480, 0, '2021-04-05 00:00:00', 389, 404, 432, NULL);
INSERT INTO storage.base_operations VALUES (1480, 3, '2021-04-05 00:00:00', 382, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1480, 4, '2021-04-05 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1480, 5, '2021-04-05 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1480, 6, '2021-04-05 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1481, 1, '2021-04-05 00:00:00', 389, 404, -432, NULL);
INSERT INTO storage.base_operations VALUES (1481, 0, '2021-04-05 00:00:00', 392, 404, 432, NULL);
INSERT INTO storage.base_operations VALUES (1481, 3, '2021-04-05 00:00:00', 389, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1481, 4, '2021-04-05 00:00:00', 392, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1481, 5, '2021-04-05 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1481, 6, '2021-04-05 00:00:00', 392, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1482, 1, '2021-04-05 00:00:00', 382, 404, -747, NULL);
INSERT INTO storage.base_operations VALUES (1482, 0, '2021-04-05 00:00:00', 389, 404, 747, NULL);
INSERT INTO storage.base_operations VALUES (1482, 3, '2021-04-05 00:00:00', 382, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1482, 4, '2021-04-05 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1482, 5, '2021-04-05 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1482, 6, '2021-04-05 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1483, 1, '2021-04-05 00:00:00', 382, 413, -500, NULL);
INSERT INTO storage.base_operations VALUES (1483, 0, '2021-04-05 00:00:00', 391, 413, 500, NULL);
INSERT INTO storage.base_operations VALUES (1483, 3, '2021-04-05 00:00:00', 382, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1483, 4, '2021-04-05 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1483, 5, '2021-04-05 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1483, 6, '2021-04-05 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1484, 1, '2021-04-05 00:00:00', 389, 404, -431, NULL);
INSERT INTO storage.base_operations VALUES (1484, 0, '2021-04-05 00:00:00', 392, 404, 431, NULL);
INSERT INTO storage.base_operations VALUES (1484, 3, '2021-04-05 00:00:00', 389, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1484, 4, '2021-04-05 00:00:00', 392, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1484, 5, '2021-04-05 00:00:00', 9, 404, 1, NULL);
INSERT INTO storage.base_operations VALUES (1484, 6, '2021-04-05 00:00:00', 392, 404, -1, NULL);
INSERT INTO storage.base_operations VALUES (1485, 1, '2021-04-05 00:00:00', 393, 407, -3096, NULL);
INSERT INTO storage.base_operations VALUES (1485, 0, '2021-04-05 00:00:00', 448, 407, 3096, NULL);
INSERT INTO storage.base_operations VALUES (1485, 3, '2021-04-05 00:00:00', 393, 407, 0, NULL);
INSERT INTO storage.base_operations VALUES (1485, 4, '2021-04-05 00:00:00', 448, 407, -0, NULL);
INSERT INTO storage.base_operations VALUES (1485, 5, '2021-04-05 00:00:00', 9, 407, 0, NULL);
INSERT INTO storage.base_operations VALUES (1485, 6, '2021-04-05 00:00:00', 448, 407, -0, NULL);
INSERT INTO storage.base_operations VALUES (1486, 1, '2021-04-05 00:00:00', 393, 410, -1713, NULL);
INSERT INTO storage.base_operations VALUES (1486, 0, '2021-04-05 00:00:00', 448, 410, 1713, NULL);
INSERT INTO storage.base_operations VALUES (1486, 3, '2021-04-05 00:00:00', 393, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1486, 4, '2021-04-05 00:00:00', 448, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1486, 5, '2021-04-05 00:00:00', 9, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1486, 6, '2021-04-05 00:00:00', 448, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1487, 1, '2021-04-05 00:00:00', 393, 408, -954, NULL);
INSERT INTO storage.base_operations VALUES (1487, 0, '2021-04-05 00:00:00', 448, 408, 954, NULL);
INSERT INTO storage.base_operations VALUES (1487, 3, '2021-04-05 00:00:00', 393, 408, 0, NULL);
INSERT INTO storage.base_operations VALUES (1487, 4, '2021-04-05 00:00:00', 448, 408, -0, NULL);
INSERT INTO storage.base_operations VALUES (1487, 5, '2021-04-05 00:00:00', 9, 408, 0, NULL);
INSERT INTO storage.base_operations VALUES (1487, 6, '2021-04-05 00:00:00', 448, 408, -0, NULL);
INSERT INTO storage.base_operations VALUES (1488, 1, '2021-04-05 00:00:00', 442, 444, -1881, NULL);
INSERT INTO storage.base_operations VALUES (1488, 0, '2021-04-05 00:00:00', 393, 444, 1881, NULL);
INSERT INTO storage.base_operations VALUES (1488, 3, '2021-04-05 00:00:00', 442, 444, 0, NULL);
INSERT INTO storage.base_operations VALUES (1488, 4, '2021-04-05 00:00:00', 393, 444, -0, NULL);
INSERT INTO storage.base_operations VALUES (1488, 5, '2021-04-05 00:00:00', 9, 444, 0, NULL);
INSERT INTO storage.base_operations VALUES (1488, 6, '2021-04-05 00:00:00', 393, 444, -0, NULL);
INSERT INTO storage.base_operations VALUES (1489, 1, '2021-04-05 00:00:00', 442, 410, -796, NULL);
INSERT INTO storage.base_operations VALUES (1489, 0, '2021-04-05 00:00:00', 393, 410, 796, NULL);
INSERT INTO storage.base_operations VALUES (1489, 3, '2021-04-05 00:00:00', 442, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1489, 4, '2021-04-05 00:00:00', 393, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1489, 5, '2021-04-05 00:00:00', 9, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1489, 6, '2021-04-05 00:00:00', 393, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1490, 1, '2021-04-05 00:00:00', 442, 443, -2134, NULL);
INSERT INTO storage.base_operations VALUES (1490, 0, '2021-04-05 00:00:00', 393, 443, 2134, NULL);
INSERT INTO storage.base_operations VALUES (1490, 3, '2021-04-05 00:00:00', 442, 443, 0, NULL);
INSERT INTO storage.base_operations VALUES (1490, 4, '2021-04-05 00:00:00', 393, 443, -0, NULL);
INSERT INTO storage.base_operations VALUES (1490, 5, '2021-04-05 00:00:00', 9, 443, 0, NULL);
INSERT INTO storage.base_operations VALUES (1490, 6, '2021-04-05 00:00:00', 393, 443, -0, NULL);
INSERT INTO storage.base_operations VALUES (1491, 1, '2021-04-05 00:00:00', 442, 399, -1591, NULL);
INSERT INTO storage.base_operations VALUES (1491, 0, '2021-04-05 00:00:00', 393, 399, 1591, NULL);
INSERT INTO storage.base_operations VALUES (1491, 3, '2021-04-05 00:00:00', 442, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1491, 4, '2021-04-05 00:00:00', 393, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1491, 5, '2021-04-05 00:00:00', 9, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1491, 6, '2021-04-05 00:00:00', 393, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1492, -1, '2021-04-05 00:00:00', 382, 404, -1287, NULL);
INSERT INTO storage.base_operations VALUES (1493, -1, '2021-04-05 00:00:00', 442, 436, 15, NULL);
INSERT INTO storage.base_operations VALUES (1494, 1, '2021-04-06 00:00:00', 393, 410, -3287, NULL);
INSERT INTO storage.base_operations VALUES (1494, 0, '2021-04-06 00:00:00', 448, 410, 3287, NULL);
INSERT INTO storage.base_operations VALUES (1494, 3, '2021-04-06 00:00:00', 393, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1494, 4, '2021-04-06 00:00:00', 448, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1494, 5, '2021-04-06 00:00:00', 9, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1494, 6, '2021-04-06 00:00:00', 448, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1495, 1, '2021-04-06 00:00:00', 382, 404, -800, NULL);
INSERT INTO storage.base_operations VALUES (1495, 0, '2021-04-06 00:00:00', 389, 404, 800, NULL);
INSERT INTO storage.base_operations VALUES (1495, 3, '2021-04-06 00:00:00', 382, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1495, 4, '2021-04-06 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1495, 5, '2021-04-06 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1495, 6, '2021-04-06 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1496, -1, '2021-04-06 00:00:00', 392, 429, 638, NULL);
INSERT INTO storage.base_operations VALUES (1497, -1, '2021-04-06 00:00:00', 442, 426, 342, NULL);
INSERT INTO storage.base_operations VALUES (1498, 1, '2021-04-06 00:00:00', 385, 413, -1114, NULL);
INSERT INTO storage.base_operations VALUES (1498, 0, '2021-04-06 00:00:00', 382, 413, 1114, NULL);
INSERT INTO storage.base_operations VALUES (1498, 3, '2021-04-06 00:00:00', 385, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1498, 4, '2021-04-06 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1498, 5, '2021-04-06 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1498, 6, '2021-04-06 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1499, 1, '2021-04-06 00:00:00', 391, 413, -499, NULL);
INSERT INTO storage.base_operations VALUES (1499, 0, '2021-04-06 00:00:00', 392, 413, 499, NULL);
INSERT INTO storage.base_operations VALUES (1499, 3, '2021-04-06 00:00:00', 391, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1499, 4, '2021-04-06 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1499, 5, '2021-04-06 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1499, 6, '2021-04-06 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1500, 1, '2021-04-06 00:00:00', 389, 404, -1116, NULL);
INSERT INTO storage.base_operations VALUES (1500, 0, '2021-04-06 00:00:00', 392, 404, 1116, NULL);
INSERT INTO storage.base_operations VALUES (1500, 3, '2021-04-06 00:00:00', 389, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1500, 4, '2021-04-06 00:00:00', 392, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1500, 5, '2021-04-06 00:00:00', 9, 404, 1, NULL);
INSERT INTO storage.base_operations VALUES (1500, 6, '2021-04-06 00:00:00', 392, 404, -1, NULL);
INSERT INTO storage.base_operations VALUES (1501, 1, '2021-04-06 00:00:00', 392, 404, -480, NULL);
INSERT INTO storage.base_operations VALUES (1501, 0, '2021-04-06 00:00:00', 442, 404, 480, NULL);
INSERT INTO storage.base_operations VALUES (1501, 3, '2021-04-06 00:00:00', 392, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1501, 4, '2021-04-06 00:00:00', 442, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1501, 5, '2021-04-06 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1501, 6, '2021-04-06 00:00:00', 442, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1502, 1, '2021-04-06 00:00:00', 382, 404, -442, NULL);
INSERT INTO storage.base_operations VALUES (1502, 0, '2021-04-06 00:00:00', 389, 404, 442, NULL);
INSERT INTO storage.base_operations VALUES (1502, 3, '2021-04-06 00:00:00', 382, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1502, 4, '2021-04-06 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1502, 5, '2021-04-06 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1502, 6, '2021-04-06 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1503, 1, '2021-04-06 00:00:00', 382, 413, -552, NULL);
INSERT INTO storage.base_operations VALUES (1503, 0, '2021-04-06 00:00:00', 391, 413, 552, NULL);
INSERT INTO storage.base_operations VALUES (1503, 3, '2021-04-06 00:00:00', 382, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1503, 4, '2021-04-06 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1503, 5, '2021-04-06 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1503, 6, '2021-04-06 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1504, 1, '2021-04-06 00:00:00', 392, 404, -480, NULL);
INSERT INTO storage.base_operations VALUES (1504, 0, '2021-04-06 00:00:00', 442, 404, 480, NULL);
INSERT INTO storage.base_operations VALUES (1504, 3, '2021-04-06 00:00:00', 392, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1504, 4, '2021-04-06 00:00:00', 442, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1504, 5, '2021-04-06 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1504, 6, '2021-04-06 00:00:00', 442, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1505, 1, '2021-04-06 00:00:00', 384, 449, -550, NULL);
INSERT INTO storage.base_operations VALUES (1505, 0, '2021-04-06 00:00:00', 392, 449, 550, NULL);
INSERT INTO storage.base_operations VALUES (1505, 3, '2021-04-06 00:00:00', 384, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1505, 4, '2021-04-06 00:00:00', 392, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1505, 5, '2021-04-06 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1505, 6, '2021-04-06 00:00:00', 392, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1506, 1, '2021-04-06 00:00:00', 392, 449, -120, NULL);
INSERT INTO storage.base_operations VALUES (1506, 0, '2021-04-06 00:00:00', 442, 449, 120, NULL);
INSERT INTO storage.base_operations VALUES (1506, 3, '2021-04-06 00:00:00', 392, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1506, 4, '2021-04-06 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1506, 5, '2021-04-06 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1506, 6, '2021-04-06 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1507, 1, '2021-04-06 00:00:00', 392, 413, -577, NULL);
INSERT INTO storage.base_operations VALUES (1507, 0, '2021-04-06 00:00:00', 442, 413, 577, NULL);
INSERT INTO storage.base_operations VALUES (1507, 3, '2021-04-06 00:00:00', 392, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1507, 4, '2021-04-06 00:00:00', 442, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1507, 5, '2021-04-06 00:00:00', 9, 413, 2, NULL);
INSERT INTO storage.base_operations VALUES (1507, 6, '2021-04-06 00:00:00', 442, 413, -2, NULL);
INSERT INTO storage.base_operations VALUES (1508, 1, '2021-04-06 00:00:00', 392, 449, -120, NULL);
INSERT INTO storage.base_operations VALUES (1508, 0, '2021-04-06 00:00:00', 442, 449, 120, NULL);
INSERT INTO storage.base_operations VALUES (1508, 3, '2021-04-06 00:00:00', 392, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1508, 4, '2021-04-06 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1508, 5, '2021-04-06 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1508, 6, '2021-04-06 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1509, 1, '2021-04-06 00:00:00', 382, 413, -641, NULL);
INSERT INTO storage.base_operations VALUES (1509, 0, '2021-04-06 00:00:00', 391, 413, 641, NULL);
INSERT INTO storage.base_operations VALUES (1509, 3, '2021-04-06 00:00:00', 382, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1509, 4, '2021-04-06 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1509, 5, '2021-04-06 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1509, 6, '2021-04-06 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1510, 1, '2021-04-06 00:00:00', 392, 449, -120, NULL);
INSERT INTO storage.base_operations VALUES (1510, 0, '2021-04-06 00:00:00', 442, 449, 120, NULL);
INSERT INTO storage.base_operations VALUES (1510, 3, '2021-04-06 00:00:00', 392, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1510, 4, '2021-04-06 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1510, 5, '2021-04-06 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1510, 6, '2021-04-06 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1511, 1, '2021-04-06 00:00:00', 391, 413, -552, NULL);
INSERT INTO storage.base_operations VALUES (1511, 0, '2021-04-06 00:00:00', 392, 413, 552, NULL);
INSERT INTO storage.base_operations VALUES (1511, 3, '2021-04-06 00:00:00', 391, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1511, 4, '2021-04-06 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1511, 5, '2021-04-06 00:00:00', 9, 413, 1, NULL);
INSERT INTO storage.base_operations VALUES (1511, 6, '2021-04-06 00:00:00', 392, 413, -1, NULL);
INSERT INTO storage.base_operations VALUES (1512, 1, '2021-04-06 00:00:00', 393, 443, -2114, NULL);
INSERT INTO storage.base_operations VALUES (1512, 0, '2021-04-06 00:00:00', 448, 443, 2114, NULL);
INSERT INTO storage.base_operations VALUES (1512, 3, '2021-04-06 00:00:00', 393, 443, 0, NULL);
INSERT INTO storage.base_operations VALUES (1512, 4, '2021-04-06 00:00:00', 448, 443, -0, NULL);
INSERT INTO storage.base_operations VALUES (1512, 5, '2021-04-06 00:00:00', 9, 443, 0, NULL);
INSERT INTO storage.base_operations VALUES (1512, 6, '2021-04-06 00:00:00', 448, 443, -0, NULL);
INSERT INTO storage.base_operations VALUES (1513, 1, '2021-04-06 00:00:00', 393, 444, -506, NULL);
INSERT INTO storage.base_operations VALUES (1513, 0, '2021-04-06 00:00:00', 448, 444, 506, NULL);
INSERT INTO storage.base_operations VALUES (1513, 3, '2021-04-06 00:00:00', 393, 444, 0, NULL);
INSERT INTO storage.base_operations VALUES (1513, 4, '2021-04-06 00:00:00', 448, 444, -0, NULL);
INSERT INTO storage.base_operations VALUES (1513, 5, '2021-04-06 00:00:00', 9, 444, 0, NULL);
INSERT INTO storage.base_operations VALUES (1513, 6, '2021-04-06 00:00:00', 448, 444, -0, NULL);
INSERT INTO storage.base_operations VALUES (1514, 1, '2021-04-06 00:00:00', 392, 449, -120, NULL);
INSERT INTO storage.base_operations VALUES (1514, 0, '2021-04-06 00:00:00', 442, 449, 120, NULL);
INSERT INTO storage.base_operations VALUES (1514, 3, '2021-04-06 00:00:00', 392, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1514, 4, '2021-04-06 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1514, 5, '2021-04-06 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1514, 6, '2021-04-06 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1515, 1, '2021-04-07 00:00:00', 382, 413, -538, NULL);
INSERT INTO storage.base_operations VALUES (1515, 0, '2021-04-07 00:00:00', 391, 413, 538, NULL);
INSERT INTO storage.base_operations VALUES (1515, 3, '2021-04-07 00:00:00', 382, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1515, 4, '2021-04-07 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1515, 5, '2021-04-07 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1515, 6, '2021-04-07 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1516, 1, '2021-04-07 00:00:00', 382, 404, -388, NULL);
INSERT INTO storage.base_operations VALUES (1516, 0, '2021-04-07 00:00:00', 389, 404, 388, NULL);
INSERT INTO storage.base_operations VALUES (1516, 3, '2021-04-07 00:00:00', 382, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1516, 4, '2021-04-07 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1516, 5, '2021-04-07 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1516, 6, '2021-04-07 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1517, 1, '2021-04-07 00:00:00', 450, 451, -3600, NULL);
INSERT INTO storage.base_operations VALUES (1517, 0, '2021-04-07 00:00:00', 382, 451, 3600, NULL);
INSERT INTO storage.base_operations VALUES (1517, 3, '2021-04-07 00:00:00', 450, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1517, 4, '2021-04-07 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1517, 5, '2021-04-07 00:00:00', 9, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1517, 6, '2021-04-07 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1518, 1, '2021-04-07 00:00:00', 382, 451, -3600, NULL);
INSERT INTO storage.base_operations VALUES (1518, 0, '2021-04-07 00:00:00', 442, 451, 3600, NULL);
INSERT INTO storage.base_operations VALUES (1518, 3, '2021-04-07 00:00:00', 382, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1518, 4, '2021-04-07 00:00:00', 442, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1518, 5, '2021-04-07 00:00:00', 9, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1518, 6, '2021-04-07 00:00:00', 442, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1519, 1, '2021-04-07 00:00:00', 442, 451, -3600, NULL);
INSERT INTO storage.base_operations VALUES (1519, 0, '2021-04-07 00:00:00', 448, 451, 3600, NULL);
INSERT INTO storage.base_operations VALUES (1519, 3, '2021-04-07 00:00:00', 442, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1519, 4, '2021-04-07 00:00:00', 448, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1519, 5, '2021-04-07 00:00:00', 9, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1519, 6, '2021-04-07 00:00:00', 448, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1520, 1, '2021-04-06 00:00:00', 450, 451, -617, NULL);
INSERT INTO storage.base_operations VALUES (1520, 0, '2021-04-06 00:00:00', 382, 451, 617, NULL);
INSERT INTO storage.base_operations VALUES (1520, 3, '2021-04-06 00:00:00', 450, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1520, 4, '2021-04-06 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1520, 5, '2021-04-06 00:00:00', 9, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1520, 6, '2021-04-06 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1521, 1, '2021-04-06 00:00:00', 385, 413, -1154, NULL);
INSERT INTO storage.base_operations VALUES (1521, 0, '2021-04-06 00:00:00', 382, 413, 1154, NULL);
INSERT INTO storage.base_operations VALUES (1521, 3, '2021-04-06 00:00:00', 385, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1521, 4, '2021-04-06 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1521, 5, '2021-04-06 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1521, 6, '2021-04-06 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1522, 1, '2021-04-06 00:00:00', 384, 449, -737, NULL);
INSERT INTO storage.base_operations VALUES (1522, 0, '2021-04-06 00:00:00', 442, 449, 737, NULL);
INSERT INTO storage.base_operations VALUES (1522, 3, '2021-04-06 00:00:00', 384, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1522, 4, '2021-04-06 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1522, 5, '2021-04-06 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1522, 6, '2021-04-06 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1523, 1, '2021-04-06 00:00:00', 391, 413, -641, NULL);
INSERT INTO storage.base_operations VALUES (1523, 0, '2021-04-06 00:00:00', 392, 413, 641, NULL);
INSERT INTO storage.base_operations VALUES (1523, 3, '2021-04-06 00:00:00', 391, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1523, 4, '2021-04-06 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1523, 5, '2021-04-06 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1523, 6, '2021-04-06 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1524, 1, '2021-04-06 00:00:00', 389, 404, -462, NULL);
INSERT INTO storage.base_operations VALUES (1524, 0, '2021-04-06 00:00:00', 392, 404, 462, NULL);
INSERT INTO storage.base_operations VALUES (1524, 3, '2021-04-06 00:00:00', 389, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1524, 4, '2021-04-06 00:00:00', 392, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1524, 5, '2021-04-06 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1524, 6, '2021-04-06 00:00:00', 392, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1525, 1, '2021-04-06 00:00:00', 392, 413, -788, NULL);
INSERT INTO storage.base_operations VALUES (1525, 0, '2021-04-06 00:00:00', 442, 413, 788, NULL);
INSERT INTO storage.base_operations VALUES (1525, 3, '2021-04-06 00:00:00', 392, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1525, 4, '2021-04-06 00:00:00', 442, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1525, 5, '2021-04-06 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1525, 6, '2021-04-06 00:00:00', 442, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1526, 1, '2021-04-06 00:00:00', 392, 404, -329, NULL);
INSERT INTO storage.base_operations VALUES (1526, 0, '2021-04-06 00:00:00', 442, 404, 329, NULL);
INSERT INTO storage.base_operations VALUES (1526, 3, '2021-04-06 00:00:00', 392, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1526, 4, '2021-04-06 00:00:00', 442, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1526, 5, '2021-04-06 00:00:00', 9, 404, 18, NULL);
INSERT INTO storage.base_operations VALUES (1526, 6, '2021-04-06 00:00:00', 442, 404, -18, NULL);
INSERT INTO storage.base_operations VALUES (1527, 1, '2021-04-06 00:00:00', 386, 446, -551, NULL);
INSERT INTO storage.base_operations VALUES (1527, 0, '2021-04-06 00:00:00', 392, 446, 551, NULL);
INSERT INTO storage.base_operations VALUES (1527, 3, '2021-04-06 00:00:00', 386, 446, 0, NULL);
INSERT INTO storage.base_operations VALUES (1527, 4, '2021-04-06 00:00:00', 392, 446, -0, NULL);
INSERT INTO storage.base_operations VALUES (1527, 5, '2021-04-06 00:00:00', 9, 446, 0, NULL);
INSERT INTO storage.base_operations VALUES (1527, 6, '2021-04-06 00:00:00', 392, 446, -0, NULL);
INSERT INTO storage.base_operations VALUES (1528, 1, '2021-04-06 00:00:00', 392, 446, -368, NULL);
INSERT INTO storage.base_operations VALUES (1528, 0, '2021-04-06 00:00:00', 442, 446, 368, NULL);
INSERT INTO storage.base_operations VALUES (1528, 3, '2021-04-06 00:00:00', 392, 446, 0, NULL);
INSERT INTO storage.base_operations VALUES (1528, 4, '2021-04-06 00:00:00', 442, 446, -0, NULL);
INSERT INTO storage.base_operations VALUES (1528, 5, '2021-04-06 00:00:00', 9, 446, 0, NULL);
INSERT INTO storage.base_operations VALUES (1528, 6, '2021-04-06 00:00:00', 442, 446, -0, NULL);
INSERT INTO storage.base_operations VALUES (1529, 1, '2021-04-07 00:00:00', 389, 404, -388, NULL);
INSERT INTO storage.base_operations VALUES (1529, 0, '2021-04-07 00:00:00', 392, 404, 388, NULL);
INSERT INTO storage.base_operations VALUES (1529, 3, '2021-04-07 00:00:00', 389, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1529, 4, '2021-04-07 00:00:00', 392, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1529, 5, '2021-04-07 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1529, 6, '2021-04-07 00:00:00', 392, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1530, -1, '2021-04-06 00:00:00', 389, 404, 20, NULL);
INSERT INTO storage.base_operations VALUES (1531, 1, '2021-04-07 00:00:00', 392, 449, -87, NULL);
INSERT INTO storage.base_operations VALUES (1531, 0, '2021-04-07 00:00:00', 442, 449, 87, NULL);
INSERT INTO storage.base_operations VALUES (1531, 3, '2021-04-07 00:00:00', 392, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1531, 4, '2021-04-07 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1531, 5, '2021-04-07 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1531, 6, '2021-04-07 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1532, 1, '2021-04-07 00:00:00', 392, 446, -182, NULL);
INSERT INTO storage.base_operations VALUES (1532, 0, '2021-04-07 00:00:00', 442, 446, 182, NULL);
INSERT INTO storage.base_operations VALUES (1532, 3, '2021-04-07 00:00:00', 392, 446, 0, NULL);
INSERT INTO storage.base_operations VALUES (1532, 4, '2021-04-07 00:00:00', 442, 446, -0, NULL);
INSERT INTO storage.base_operations VALUES (1532, 5, '2021-04-07 00:00:00', 9, 446, 0, NULL);
INSERT INTO storage.base_operations VALUES (1532, 6, '2021-04-07 00:00:00', 442, 446, -0, NULL);
INSERT INTO storage.base_operations VALUES (1533, -1, '2021-04-07 00:00:00', 392, 449, 17, NULL);
INSERT INTO storage.base_operations VALUES (1534, 1, '2021-04-07 00:00:00', 391, 413, -538, NULL);
INSERT INTO storage.base_operations VALUES (1534, 0, '2021-04-07 00:00:00', 392, 413, 538, NULL);
INSERT INTO storage.base_operations VALUES (1534, 3, '2021-04-07 00:00:00', 391, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1534, 4, '2021-04-07 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1534, 5, '2021-04-07 00:00:00', 9, 413, 1, NULL);
INSERT INTO storage.base_operations VALUES (1534, 6, '2021-04-07 00:00:00', 392, 413, -1, NULL);
INSERT INTO storage.base_operations VALUES (1535, 1, '2021-04-07 00:00:00', 442, 409, -2094, NULL);
INSERT INTO storage.base_operations VALUES (1535, 0, '2021-04-07 00:00:00', 393, 409, 2094, NULL);
INSERT INTO storage.base_operations VALUES (1535, 3, '2021-04-07 00:00:00', 442, 409, 0, NULL);
INSERT INTO storage.base_operations VALUES (1535, 4, '2021-04-07 00:00:00', 393, 409, -0, NULL);
INSERT INTO storage.base_operations VALUES (1535, 5, '2021-04-07 00:00:00', 9, 409, 0, NULL);
INSERT INTO storage.base_operations VALUES (1535, 6, '2021-04-07 00:00:00', 393, 409, -0, NULL);
INSERT INTO storage.base_operations VALUES (1536, 1, '2021-04-07 00:00:00', 392, 413, -600, NULL);
INSERT INTO storage.base_operations VALUES (1536, 0, '2021-04-07 00:00:00', 442, 413, 600, NULL);
INSERT INTO storage.base_operations VALUES (1536, 3, '2021-04-07 00:00:00', 392, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1536, 4, '2021-04-07 00:00:00', 442, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1536, 5, '2021-04-07 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1536, 6, '2021-04-07 00:00:00', 442, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1537, 1, '2021-04-07 00:00:00', 382, 413, -1734, NULL);
INSERT INTO storage.base_operations VALUES (1537, 0, '2021-04-07 00:00:00', 391, 413, 1734, NULL);
INSERT INTO storage.base_operations VALUES (1537, 3, '2021-04-07 00:00:00', 382, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1537, 4, '2021-04-07 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1537, 5, '2021-04-07 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1537, 6, '2021-04-07 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1538, 1, '2021-04-07 00:00:00', 385, 413, -1350, NULL);
INSERT INTO storage.base_operations VALUES (1538, 0, '2021-04-07 00:00:00', 382, 413, 1350, NULL);
INSERT INTO storage.base_operations VALUES (1538, 3, '2021-04-07 00:00:00', 385, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1538, 4, '2021-04-07 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1538, 5, '2021-04-07 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1538, 6, '2021-04-07 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1539, 1, '2021-04-07 00:00:00', 391, 413, -536, NULL);
INSERT INTO storage.base_operations VALUES (1539, 0, '2021-04-07 00:00:00', 392, 413, 536, NULL);
INSERT INTO storage.base_operations VALUES (1539, 3, '2021-04-07 00:00:00', 391, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1539, 4, '2021-04-07 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1539, 5, '2021-04-07 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1539, 6, '2021-04-07 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1540, 1, '2021-04-07 00:00:00', 392, 413, -601, NULL);
INSERT INTO storage.base_operations VALUES (1540, 0, '2021-04-07 00:00:00', 442, 413, 601, NULL);
INSERT INTO storage.base_operations VALUES (1540, 3, '2021-04-07 00:00:00', 392, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1540, 4, '2021-04-07 00:00:00', 442, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1540, 5, '2021-04-07 00:00:00', 9, 413, 3, NULL);
INSERT INTO storage.base_operations VALUES (1540, 6, '2021-04-07 00:00:00', 442, 413, -3, NULL);
INSERT INTO storage.base_operations VALUES (1541, 1, '2021-04-07 00:00:00', 450, 451, -687, NULL);
INSERT INTO storage.base_operations VALUES (1541, 0, '2021-04-07 00:00:00', 382, 451, 687, NULL);
INSERT INTO storage.base_operations VALUES (1541, 3, '2021-04-07 00:00:00', 450, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1541, 4, '2021-04-07 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1541, 5, '2021-04-07 00:00:00', 9, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1541, 6, '2021-04-07 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1542, 1, '2021-04-07 00:00:00', 384, 449, -885, NULL);
INSERT INTO storage.base_operations VALUES (1542, 0, '2021-04-07 00:00:00', 382, 449, 885, NULL);
INSERT INTO storage.base_operations VALUES (1542, 3, '2021-04-07 00:00:00', 384, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1542, 4, '2021-04-07 00:00:00', 382, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1542, 5, '2021-04-07 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1542, 6, '2021-04-07 00:00:00', 382, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1543, 1, '2021-04-07 00:00:00', 382, 449, -885, NULL);
INSERT INTO storage.base_operations VALUES (1543, 0, '2021-04-07 00:00:00', 392, 449, 885, NULL);
INSERT INTO storage.base_operations VALUES (1543, 3, '2021-04-07 00:00:00', 382, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1543, 4, '2021-04-07 00:00:00', 392, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1543, 5, '2021-04-07 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1543, 6, '2021-04-07 00:00:00', 392, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1544, 1, '2021-04-08 00:00:00', 385, 413, -70, NULL);
INSERT INTO storage.base_operations VALUES (1544, 0, '2021-04-08 00:00:00', 382, 413, 70, NULL);
INSERT INTO storage.base_operations VALUES (1544, 3, '2021-04-08 00:00:00', 385, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1544, 4, '2021-04-08 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1544, 5, '2021-04-08 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1544, 6, '2021-04-08 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1545, 1, '2021-04-07 00:00:00', 393, 444, -1367, NULL);
INSERT INTO storage.base_operations VALUES (1545, 0, '2021-04-07 00:00:00', 448, 444, 1367, NULL);
INSERT INTO storage.base_operations VALUES (1545, 3, '2021-04-07 00:00:00', 393, 444, 0, NULL);
INSERT INTO storage.base_operations VALUES (1545, 4, '2021-04-07 00:00:00', 448, 444, -0, NULL);
INSERT INTO storage.base_operations VALUES (1545, 5, '2021-04-07 00:00:00', 9, 444, 0, NULL);
INSERT INTO storage.base_operations VALUES (1545, 6, '2021-04-07 00:00:00', 448, 444, -0, NULL);
INSERT INTO storage.base_operations VALUES (1546, 1, '2021-04-07 00:00:00', 393, 399, -1000, NULL);
INSERT INTO storage.base_operations VALUES (1546, 0, '2021-04-07 00:00:00', 448, 399, 1000, NULL);
INSERT INTO storage.base_operations VALUES (1546, 3, '2021-04-07 00:00:00', 393, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1546, 4, '2021-04-07 00:00:00', 448, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1546, 5, '2021-04-07 00:00:00', 9, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1546, 6, '2021-04-07 00:00:00', 448, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1547, 1, '2021-04-08 00:00:00', 393, 410, -790, NULL);
INSERT INTO storage.base_operations VALUES (1547, 0, '2021-04-08 00:00:00', 448, 410, 790, NULL);
INSERT INTO storage.base_operations VALUES (1547, 3, '2021-04-08 00:00:00', 393, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1547, 4, '2021-04-08 00:00:00', 448, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1547, 5, '2021-04-08 00:00:00', 9, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1547, 6, '2021-04-08 00:00:00', 448, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1548, 1, '2021-04-08 00:00:00', 393, 399, -533, NULL);
INSERT INTO storage.base_operations VALUES (1548, 0, '2021-04-08 00:00:00', 448, 399, 533, NULL);
INSERT INTO storage.base_operations VALUES (1548, 3, '2021-04-08 00:00:00', 393, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1548, 4, '2021-04-08 00:00:00', 448, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1548, 5, '2021-04-08 00:00:00', 9, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1548, 6, '2021-04-08 00:00:00', 448, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1549, 1, '2021-04-08 00:00:00', 442, 431, -1378, NULL);
INSERT INTO storage.base_operations VALUES (1549, 0, '2021-04-08 00:00:00', 393, 431, 1378, NULL);
INSERT INTO storage.base_operations VALUES (1549, 3, '2021-04-08 00:00:00', 442, 431, 0, NULL);
INSERT INTO storage.base_operations VALUES (1549, 4, '2021-04-08 00:00:00', 393, 431, -0, NULL);
INSERT INTO storage.base_operations VALUES (1549, 5, '2021-04-08 00:00:00', 9, 431, 0, NULL);
INSERT INTO storage.base_operations VALUES (1549, 6, '2021-04-08 00:00:00', 393, 431, -0, NULL);
INSERT INTO storage.base_operations VALUES (1550, 1, '2021-04-08 00:00:00', 382, 413, -678, NULL);
INSERT INTO storage.base_operations VALUES (1550, 0, '2021-04-08 00:00:00', 391, 413, 678, NULL);
INSERT INTO storage.base_operations VALUES (1550, 3, '2021-04-08 00:00:00', 382, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1550, 4, '2021-04-08 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1550, 5, '2021-04-08 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1550, 6, '2021-04-08 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1551, 1, '2021-04-08 00:00:00', 382, 413, -70, NULL);
INSERT INTO storage.base_operations VALUES (1551, 0, '2021-04-08 00:00:00', 391, 413, 70, NULL);
INSERT INTO storage.base_operations VALUES (1551, 3, '2021-04-08 00:00:00', 382, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1551, 4, '2021-04-08 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1551, 5, '2021-04-08 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1551, 6, '2021-04-08 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1552, 1, '2021-04-08 00:00:00', 391, 413, -698, NULL);
INSERT INTO storage.base_operations VALUES (1552, 0, '2021-04-08 00:00:00', 392, 413, 698, NULL);
INSERT INTO storage.base_operations VALUES (1552, 3, '2021-04-08 00:00:00', 391, 413, 4, NULL);
INSERT INTO storage.base_operations VALUES (1552, 4, '2021-04-08 00:00:00', 392, 413, -4, NULL);
INSERT INTO storage.base_operations VALUES (1552, 5, '2021-04-08 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1552, 6, '2021-04-08 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1553, 1, '2021-04-08 00:00:00', 392, 449, -600, NULL);
INSERT INTO storage.base_operations VALUES (1553, 0, '2021-04-08 00:00:00', 442, 449, 600, NULL);
INSERT INTO storage.base_operations VALUES (1553, 3, '2021-04-08 00:00:00', 392, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1553, 4, '2021-04-08 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1553, 5, '2021-04-08 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1553, 6, '2021-04-08 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1554, 1, '2021-04-08 00:00:00', 392, 449, -120, NULL);
INSERT INTO storage.base_operations VALUES (1554, 0, '2021-04-08 00:00:00', 442, 449, 120, NULL);
INSERT INTO storage.base_operations VALUES (1554, 3, '2021-04-08 00:00:00', 392, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1554, 4, '2021-04-08 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1554, 5, '2021-04-08 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1554, 6, '2021-04-08 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1555, 1, '2021-04-08 00:00:00', 391, 413, -70, NULL);
INSERT INTO storage.base_operations VALUES (1555, 0, '2021-04-08 00:00:00', 392, 413, 70, NULL);
INSERT INTO storage.base_operations VALUES (1555, 3, '2021-04-08 00:00:00', 391, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1555, 4, '2021-04-08 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1555, 5, '2021-04-08 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1555, 6, '2021-04-08 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1556, 1, '2021-04-08 00:00:00', 382, 413, -672, NULL);
INSERT INTO storage.base_operations VALUES (1556, 0, '2021-04-08 00:00:00', 391, 413, 672, NULL);
INSERT INTO storage.base_operations VALUES (1556, 3, '2021-04-08 00:00:00', 382, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1556, 4, '2021-04-08 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1556, 5, '2021-04-08 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1556, 6, '2021-04-08 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1557, 1, '2021-04-08 00:00:00', 385, 402, -1140, NULL);
INSERT INTO storage.base_operations VALUES (1557, 0, '2021-04-08 00:00:00', 382, 402, 1140, NULL);
INSERT INTO storage.base_operations VALUES (1557, 3, '2021-04-08 00:00:00', 385, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1557, 4, '2021-04-08 00:00:00', 382, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1557, 5, '2021-04-08 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1557, 6, '2021-04-08 00:00:00', 382, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1558, 1, '2021-04-08 00:00:00', 392, 404, -1175, NULL);
INSERT INTO storage.base_operations VALUES (1558, 0, '2021-04-08 00:00:00', 442, 404, 1175, NULL);
INSERT INTO storage.base_operations VALUES (1558, 3, '2021-04-08 00:00:00', 392, 404, 8, NULL);
INSERT INTO storage.base_operations VALUES (1558, 4, '2021-04-08 00:00:00', 442, 404, -8, NULL);
INSERT INTO storage.base_operations VALUES (1558, 5, '2021-04-08 00:00:00', 9, 404, 7, NULL);
INSERT INTO storage.base_operations VALUES (1558, 6, '2021-04-08 00:00:00', 442, 404, -7, NULL);
INSERT INTO storage.base_operations VALUES (1559, 1, '2021-04-08 00:00:00', 391, 413, -678, NULL);
INSERT INTO storage.base_operations VALUES (1559, 0, '2021-04-08 00:00:00', 392, 413, 678, NULL);
INSERT INTO storage.base_operations VALUES (1559, 3, '2021-04-08 00:00:00', 391, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1559, 4, '2021-04-08 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1559, 5, '2021-04-08 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1559, 6, '2021-04-08 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1560, 1, '2021-04-08 00:00:00', 392, 404, -8, NULL);
INSERT INTO storage.base_operations VALUES (1560, 0, '2021-04-08 00:00:00', 389, 404, 8, NULL);
INSERT INTO storage.base_operations VALUES (1560, 3, '2021-04-08 00:00:00', 392, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1560, 4, '2021-04-08 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1560, 5, '2021-04-08 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1560, 6, '2021-04-08 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1561, 1, '2021-04-08 00:00:00', 450, 451, -709, NULL);
INSERT INTO storage.base_operations VALUES (1561, 0, '2021-04-08 00:00:00', 382, 451, 709, NULL);
INSERT INTO storage.base_operations VALUES (1561, 3, '2021-04-08 00:00:00', 450, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1561, 4, '2021-04-08 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1561, 5, '2021-04-08 00:00:00', 9, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1561, 6, '2021-04-08 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1563, 1, '2021-04-05 00:00:00', 382, 404, -432, NULL);
INSERT INTO storage.base_operations VALUES (1563, 0, '2021-04-05 00:00:00', 389, 404, 432, NULL);
INSERT INTO storage.base_operations VALUES (1563, 3, '2021-04-05 00:00:00', 382, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1563, 4, '2021-04-05 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1563, 5, '2021-04-05 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1563, 6, '2021-04-05 00:00:00', 389, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1564, 1, '2021-04-05 00:00:00', 389, 404, -432, NULL);
INSERT INTO storage.base_operations VALUES (1564, 0, '2021-04-05 00:00:00', 392, 404, 432, NULL);
INSERT INTO storage.base_operations VALUES (1564, 3, '2021-04-05 00:00:00', 389, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1564, 4, '2021-04-05 00:00:00', 392, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1564, 5, '2021-04-05 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1564, 6, '2021-04-05 00:00:00', 392, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1565, -1, '2021-04-09 00:00:00', 442, 446, 3341, NULL);
INSERT INTO storage.base_operations VALUES (1566, -1, '2021-04-09 00:00:00', 386, 446, 551, NULL);
INSERT INTO storage.base_operations VALUES (1567, 1, '2021-04-05 00:00:00', 384, 404, -432, NULL);
INSERT INTO storage.base_operations VALUES (1567, 0, '2021-04-05 00:00:00', 382, 404, 432, NULL);
INSERT INTO storage.base_operations VALUES (1567, 3, '2021-04-05 00:00:00', 384, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1567, 4, '2021-04-05 00:00:00', 382, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1567, 5, '2021-04-05 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1567, 6, '2021-04-05 00:00:00', 382, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1568, -1, '2021-04-05 00:00:00', 384, 404, 432, NULL);
INSERT INTO storage.base_operations VALUES (1569, -1, '2021-04-09 00:00:00', 385, 402, 1140, NULL);
INSERT INTO storage.base_operations VALUES (1570, -1, '2021-04-09 00:00:00', 385, 413, 70, NULL);
INSERT INTO storage.base_operations VALUES (1571, -1, '2021-04-09 00:00:00', 385, 413, 10656, NULL);
INSERT INTO storage.base_operations VALUES (1572, 1, '2021-04-09 00:00:00', 392, 449, -480, NULL);
INSERT INTO storage.base_operations VALUES (1572, 0, '2021-04-09 00:00:00', 442, 449, 480, NULL);
INSERT INTO storage.base_operations VALUES (1572, 3, '2021-04-09 00:00:00', 392, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1572, 4, '2021-04-09 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1572, 5, '2021-04-09 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1572, 6, '2021-04-09 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1573, 1, '2021-04-09 00:00:00', 382, 402, -661, NULL);
INSERT INTO storage.base_operations VALUES (1573, 0, '2021-04-09 00:00:00', 389, 402, 661, NULL);
INSERT INTO storage.base_operations VALUES (1573, 3, '2021-04-09 00:00:00', 382, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1573, 4, '2021-04-09 00:00:00', 389, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1573, 5, '2021-04-09 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1573, 6, '2021-04-09 00:00:00', 389, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1574, 1, '2021-04-09 00:00:00', 392, 449, -120, NULL);
INSERT INTO storage.base_operations VALUES (1574, 0, '2021-04-09 00:00:00', 442, 449, 120, NULL);
INSERT INTO storage.base_operations VALUES (1574, 3, '2021-04-09 00:00:00', 392, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1574, 4, '2021-04-09 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1574, 5, '2021-04-09 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1574, 6, '2021-04-09 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1575, 1, '2021-04-09 00:00:00', 392, 449, -120, NULL);
INSERT INTO storage.base_operations VALUES (1575, 0, '2021-04-09 00:00:00', 442, 449, 120, NULL);
INSERT INTO storage.base_operations VALUES (1575, 3, '2021-04-09 00:00:00', 392, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1575, 4, '2021-04-09 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1575, 5, '2021-04-09 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1575, 6, '2021-04-09 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1576, -1, '2021-04-09 00:00:00', 385, 402, 580, NULL);
INSERT INTO storage.base_operations VALUES (1577, 1, '2021-04-09 00:00:00', 385, 402, -580, NULL);
INSERT INTO storage.base_operations VALUES (1577, 0, '2021-04-09 00:00:00', 382, 402, 580, NULL);
INSERT INTO storage.base_operations VALUES (1577, 3, '2021-04-09 00:00:00', 385, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1577, 4, '2021-04-09 00:00:00', 382, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1577, 5, '2021-04-09 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1577, 6, '2021-04-09 00:00:00', 382, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1578, 1, '2021-04-09 00:00:00', 382, 401, -580, NULL);
INSERT INTO storage.base_operations VALUES (1578, 0, '2021-04-09 00:00:00', 389, 401, 580, NULL);
INSERT INTO storage.base_operations VALUES (1578, 3, '2021-04-09 00:00:00', 382, 401, 0, NULL);
INSERT INTO storage.base_operations VALUES (1578, 4, '2021-04-09 00:00:00', 389, 401, -0, NULL);
INSERT INTO storage.base_operations VALUES (1578, 5, '2021-04-09 00:00:00', 9, 401, 0, NULL);
INSERT INTO storage.base_operations VALUES (1578, 6, '2021-04-09 00:00:00', 389, 401, -0, NULL);
INSERT INTO storage.base_operations VALUES (1579, -1, '2021-04-09 00:00:00', 384, 449, 2172, NULL);
INSERT INTO storage.base_operations VALUES (1580, -1, '2021-04-09 00:00:00', 384, 399, 1605, NULL);
INSERT INTO storage.base_operations VALUES (1581, -1, '2021-04-09 00:00:00', 384, 410, 306, NULL);
INSERT INTO storage.base_operations VALUES (1582, -1, '2021-04-09 00:00:00', 384, 404, 5522, NULL);
INSERT INTO storage.base_operations VALUES (1583, -1, '2021-04-09 00:00:00', 450, 451, 5613, NULL);
INSERT INTO storage.base_operations VALUES (1585, -1, '2021-04-09 00:00:00', 442, 431, 5, NULL);
INSERT INTO storage.base_operations VALUES (1591, 1, '2021-04-09 00:00:00', 392, 449, -120, NULL);
INSERT INTO storage.base_operations VALUES (1591, 0, '2021-04-09 00:00:00', 442, 449, 120, NULL);
INSERT INTO storage.base_operations VALUES (1591, 3, '2021-04-09 00:00:00', 392, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1591, 4, '2021-04-09 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1591, 5, '2021-04-09 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1591, 6, '2021-04-09 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1593, 1, '2021-04-12 00:00:00', 442, 415, -2666, NULL);
INSERT INTO storage.base_operations VALUES (1593, 0, '2021-04-12 00:00:00', 393, 415, 2666, NULL);
INSERT INTO storage.base_operations VALUES (1593, 3, '2021-04-12 00:00:00', 442, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1593, 4, '2021-04-12 00:00:00', 393, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1593, 5, '2021-04-12 00:00:00', 9, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1593, 6, '2021-04-12 00:00:00', 393, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1594, 1, '2021-04-12 00:00:00', 442, 426, -1868, NULL);
INSERT INTO storage.base_operations VALUES (1594, 0, '2021-04-12 00:00:00', 393, 426, 1868, NULL);
INSERT INTO storage.base_operations VALUES (1594, 3, '2021-04-12 00:00:00', 442, 426, 0, NULL);
INSERT INTO storage.base_operations VALUES (1594, 4, '2021-04-12 00:00:00', 393, 426, -0, NULL);
INSERT INTO storage.base_operations VALUES (1594, 5, '2021-04-12 00:00:00', 9, 426, 23, NULL);
INSERT INTO storage.base_operations VALUES (1594, 6, '2021-04-12 00:00:00', 393, 426, -23, NULL);
INSERT INTO storage.base_operations VALUES (1595, 1, '2021-04-12 00:00:00', 442, 436, -15, NULL);
INSERT INTO storage.base_operations VALUES (1595, 0, '2021-04-12 00:00:00', 393, 436, 15, NULL);
INSERT INTO storage.base_operations VALUES (1595, 3, '2021-04-12 00:00:00', 442, 436, 0, NULL);
INSERT INTO storage.base_operations VALUES (1595, 4, '2021-04-12 00:00:00', 393, 436, -0, NULL);
INSERT INTO storage.base_operations VALUES (1595, 5, '2021-04-12 00:00:00', 9, 436, 0, NULL);
INSERT INTO storage.base_operations VALUES (1595, 6, '2021-04-12 00:00:00', 393, 436, -0, NULL);
INSERT INTO storage.base_operations VALUES (1597, 1, '2021-04-12 00:00:00', 392, 413, -3, NULL);
INSERT INTO storage.base_operations VALUES (1597, 0, '2021-04-12 00:00:00', 391, 413, 3, NULL);
INSERT INTO storage.base_operations VALUES (1597, 3, '2021-04-12 00:00:00', 392, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1597, 4, '2021-04-12 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1597, 5, '2021-04-12 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1597, 6, '2021-04-12 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1599, 1, '2021-04-12 00:00:00', 391, 413, -1333, NULL);
INSERT INTO storage.base_operations VALUES (1599, 0, '2021-04-12 00:00:00', 392, 413, 1333, NULL);
INSERT INTO storage.base_operations VALUES (1599, 3, '2021-04-12 00:00:00', 391, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1599, 4, '2021-04-12 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1599, 5, '2021-04-12 00:00:00', 9, 413, 3, NULL);
INSERT INTO storage.base_operations VALUES (1599, 6, '2021-04-12 00:00:00', 392, 413, -3, NULL);
INSERT INTO storage.base_operations VALUES (1600, 1, '2021-04-12 00:00:00', 392, 413, -1443, NULL);
INSERT INTO storage.base_operations VALUES (1600, 0, '2021-04-12 00:00:00', 442, 413, 1443, NULL);
INSERT INTO storage.base_operations VALUES (1600, 3, '2021-04-12 00:00:00', 392, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1600, 4, '2021-04-12 00:00:00', 442, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1600, 5, '2021-04-12 00:00:00', 9, 413, 3, NULL);
INSERT INTO storage.base_operations VALUES (1600, 6, '2021-04-12 00:00:00', 442, 413, -3, NULL);
INSERT INTO storage.base_operations VALUES (1601, 1, '2021-04-12 00:00:00', 384, 449, -2875, NULL);
INSERT INTO storage.base_operations VALUES (1601, 0, '2021-04-12 00:00:00', 382, 449, 2875, NULL);
INSERT INTO storage.base_operations VALUES (1601, 3, '2021-04-12 00:00:00', 384, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1601, 4, '2021-04-12 00:00:00', 382, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1601, 5, '2021-04-12 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1601, 6, '2021-04-12 00:00:00', 382, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1602, 1, '2021-04-12 00:00:00', 382, 449, -2875, NULL);
INSERT INTO storage.base_operations VALUES (1602, 0, '2021-04-12 00:00:00', 442, 449, 2875, NULL);
INSERT INTO storage.base_operations VALUES (1602, 3, '2021-04-12 00:00:00', 382, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1602, 4, '2021-04-12 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1602, 5, '2021-04-12 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1602, 6, '2021-04-12 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1603, 1, '2021-04-12 00:00:00', 450, 451, -1263, NULL);
INSERT INTO storage.base_operations VALUES (1603, 0, '2021-04-12 00:00:00', 382, 451, 1263, NULL);
INSERT INTO storage.base_operations VALUES (1603, 3, '2021-04-12 00:00:00', 450, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1603, 4, '2021-04-12 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1603, 5, '2021-04-12 00:00:00', 9, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1603, 6, '2021-04-12 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1604, 1, '2021-04-12 00:00:00', 382, 449, -840, NULL);
INSERT INTO storage.base_operations VALUES (1604, 0, '2021-04-12 00:00:00', 442, 449, 840, NULL);
INSERT INTO storage.base_operations VALUES (1604, 3, '2021-04-12 00:00:00', 382, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1604, 4, '2021-04-12 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1604, 5, '2021-04-12 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1604, 6, '2021-04-12 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1606, 1, '2021-04-12 00:00:00', 385, 402, -40, NULL);
INSERT INTO storage.base_operations VALUES (1606, 0, '2021-04-12 00:00:00', 382, 402, 40, NULL);
INSERT INTO storage.base_operations VALUES (1606, 3, '2021-04-12 00:00:00', 385, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1606, 4, '2021-04-12 00:00:00', 382, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1606, 5, '2021-04-12 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1606, 6, '2021-04-12 00:00:00', 382, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1607, 1, '2021-04-12 00:00:00', 393, 431, -1250, NULL);
INSERT INTO storage.base_operations VALUES (1607, 0, '2021-04-12 00:00:00', 448, 431, 1250, NULL);
INSERT INTO storage.base_operations VALUES (1607, 3, '2021-04-12 00:00:00', 393, 431, 0, NULL);
INSERT INTO storage.base_operations VALUES (1607, 4, '2021-04-12 00:00:00', 448, 431, -0, NULL);
INSERT INTO storage.base_operations VALUES (1607, 5, '2021-04-12 00:00:00', 9, 431, 0, NULL);
INSERT INTO storage.base_operations VALUES (1607, 6, '2021-04-12 00:00:00', 448, 431, -0, NULL);
INSERT INTO storage.base_operations VALUES (1608, 1, '2021-04-12 00:00:00', 382, 402, -728, NULL);
INSERT INTO storage.base_operations VALUES (1608, 0, '2021-04-12 00:00:00', 387, 402, 728, NULL);
INSERT INTO storage.base_operations VALUES (1608, 3, '2021-04-12 00:00:00', 382, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1608, 4, '2021-04-12 00:00:00', 387, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1608, 5, '2021-04-12 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1608, 6, '2021-04-12 00:00:00', 387, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1610, 1, '2021-04-12 00:00:00', 382, 413, -1114, NULL);
INSERT INTO storage.base_operations VALUES (1610, 0, '2021-04-12 00:00:00', 391, 413, 1114, NULL);
INSERT INTO storage.base_operations VALUES (1610, 3, '2021-04-12 00:00:00', 382, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1610, 4, '2021-04-12 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1610, 5, '2021-04-12 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1610, 6, '2021-04-12 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1611, 1, '2021-04-12 00:00:00', 385, 412, -849, NULL);
INSERT INTO storage.base_operations VALUES (1611, 0, '2021-04-12 00:00:00', 382, 412, 849, NULL);
INSERT INTO storage.base_operations VALUES (1611, 3, '2021-04-12 00:00:00', 385, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1611, 4, '2021-04-12 00:00:00', 382, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1611, 5, '2021-04-12 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1611, 6, '2021-04-12 00:00:00', 382, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1612, 1, '2021-04-12 00:00:00', 384, 405, -840, NULL);
INSERT INTO storage.base_operations VALUES (1612, 0, '2021-04-12 00:00:00', 382, 405, 840, NULL);
INSERT INTO storage.base_operations VALUES (1612, 3, '2021-04-12 00:00:00', 384, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1612, 4, '2021-04-12 00:00:00', 382, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1612, 5, '2021-04-12 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1612, 6, '2021-04-12 00:00:00', 382, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1614, 1, '2021-04-12 00:00:00', 392, 413, -2302, NULL);
INSERT INTO storage.base_operations VALUES (1614, 0, '2021-04-12 00:00:00', 442, 413, 2302, NULL);
INSERT INTO storage.base_operations VALUES (1614, 3, '2021-04-12 00:00:00', 392, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1614, 4, '2021-04-12 00:00:00', 442, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1614, 5, '2021-04-12 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1614, 6, '2021-04-12 00:00:00', 442, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1615, 1, '2021-04-12 00:00:00', 391, 413, -1177, NULL);
INSERT INTO storage.base_operations VALUES (1615, 0, '2021-04-12 00:00:00', 392, 413, 1177, NULL);
INSERT INTO storage.base_operations VALUES (1615, 3, '2021-04-12 00:00:00', 391, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1615, 4, '2021-04-12 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1615, 5, '2021-04-12 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1615, 6, '2021-04-12 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1616, 1, '2021-04-12 00:00:00', 392, 404, -870, NULL);
INSERT INTO storage.base_operations VALUES (1616, 0, '2021-04-12 00:00:00', 442, 404, 870, NULL);
INSERT INTO storage.base_operations VALUES (1616, 3, '2021-04-12 00:00:00', 392, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1616, 4, '2021-04-12 00:00:00', 442, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1616, 5, '2021-04-12 00:00:00', 9, 404, 2, NULL);
INSERT INTO storage.base_operations VALUES (1616, 6, '2021-04-12 00:00:00', 442, 404, -2, NULL);
INSERT INTO storage.base_operations VALUES (1617, 1, '2021-04-12 00:00:00', 392, 449, -720, NULL);
INSERT INTO storage.base_operations VALUES (1617, 0, '2021-04-12 00:00:00', 442, 449, 720, NULL);
INSERT INTO storage.base_operations VALUES (1617, 3, '2021-04-12 00:00:00', 392, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1617, 4, '2021-04-12 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1617, 5, '2021-04-12 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1617, 6, '2021-04-12 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1618, 1, '2021-04-13 00:00:00', 450, 451, -624, NULL);
INSERT INTO storage.base_operations VALUES (1618, 0, '2021-04-13 00:00:00', 382, 451, 624, NULL);
INSERT INTO storage.base_operations VALUES (1618, 3, '2021-04-13 00:00:00', 450, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1618, 4, '2021-04-13 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1618, 5, '2021-04-13 00:00:00', 9, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1618, 6, '2021-04-13 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1620, 1, '2021-04-13 00:00:00', 382, 451, -4800, NULL);
INSERT INTO storage.base_operations VALUES (1620, 0, '2021-04-13 00:00:00', 448, 451, 4800, NULL);
INSERT INTO storage.base_operations VALUES (1620, 3, '2021-04-13 00:00:00', 382, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1620, 4, '2021-04-13 00:00:00', 448, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1620, 5, '2021-04-13 00:00:00', 9, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1620, 6, '2021-04-13 00:00:00', 448, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1621, -1, '2021-04-12 00:00:00', 382, 449, 840, NULL);
INSERT INTO storage.base_operations VALUES (1622, -1, '2021-04-12 00:00:00', 382, 451, 900, NULL);
INSERT INTO storage.base_operations VALUES (1623, -1, '2021-04-13 00:00:00', 384, 449, 2875, NULL);
INSERT INTO storage.base_operations VALUES (1624, -1, '2021-04-13 00:00:00', 384, 405, 840, NULL);
INSERT INTO storage.base_operations VALUES (1625, -1, '2021-04-13 00:00:00', 385, 412, 849, NULL);
INSERT INTO storage.base_operations VALUES (1626, -1, '2021-04-12 00:00:00', 385, 402, 3751, NULL);
INSERT INTO storage.base_operations VALUES (1627, -1, '2021-04-13 00:00:00', 450, 451, 1887, NULL);
INSERT INTO storage.base_operations VALUES (1628, 1, '2021-04-13 00:00:00', 382, 413, -781, NULL);
INSERT INTO storage.base_operations VALUES (1628, 0, '2021-04-13 00:00:00', 391, 413, 781, NULL);
INSERT INTO storage.base_operations VALUES (1628, 3, '2021-04-13 00:00:00', 382, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1628, 4, '2021-04-13 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1628, 5, '2021-04-13 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1628, 6, '2021-04-13 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1630, 1, '2021-04-13 00:00:00', 392, 413, -750, NULL);
INSERT INTO storage.base_operations VALUES (1630, 0, '2021-04-13 00:00:00', 442, 413, 750, NULL);
INSERT INTO storage.base_operations VALUES (1630, 3, '2021-04-13 00:00:00', 392, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1630, 4, '2021-04-13 00:00:00', 442, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1630, 5, '2021-04-13 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1630, 6, '2021-04-13 00:00:00', 442, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1632, 1, '2021-04-13 00:00:00', 448, 408, -954, NULL);
INSERT INTO storage.base_operations VALUES (1632, 0, '2021-04-13 00:00:00', 452, 408, 954, NULL);
INSERT INTO storage.base_operations VALUES (1632, 3, '2021-04-13 00:00:00', 448, 408, 0, NULL);
INSERT INTO storage.base_operations VALUES (1632, 4, '2021-04-13 00:00:00', 452, 408, -0, NULL);
INSERT INTO storage.base_operations VALUES (1632, 5, '2021-04-13 00:00:00', 9, 408, 0, NULL);
INSERT INTO storage.base_operations VALUES (1632, 6, '2021-04-13 00:00:00', 452, 408, -0, NULL);
INSERT INTO storage.base_operations VALUES (1633, 1, '2021-04-13 00:00:00', 448, 451, -8400, NULL);
INSERT INTO storage.base_operations VALUES (1633, 0, '2021-04-13 00:00:00', 452, 451, 8400, NULL);
INSERT INTO storage.base_operations VALUES (1633, 3, '2021-04-13 00:00:00', 448, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1633, 4, '2021-04-13 00:00:00', 452, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1633, 5, '2021-04-13 00:00:00', 9, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1633, 6, '2021-04-13 00:00:00', 452, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1634, 1, '2021-04-13 00:00:00', 448, 407, -3096, NULL);
INSERT INTO storage.base_operations VALUES (1634, 0, '2021-04-13 00:00:00', 452, 407, 3096, NULL);
INSERT INTO storage.base_operations VALUES (1634, 3, '2021-04-13 00:00:00', 448, 407, 0, NULL);
INSERT INTO storage.base_operations VALUES (1634, 4, '2021-04-13 00:00:00', 452, 407, -0, NULL);
INSERT INTO storage.base_operations VALUES (1634, 5, '2021-04-13 00:00:00', 9, 407, 0, NULL);
INSERT INTO storage.base_operations VALUES (1634, 6, '2021-04-13 00:00:00', 452, 407, -0, NULL);
INSERT INTO storage.base_operations VALUES (1635, 1, '2021-04-13 00:00:00', 448, 443, -2114, NULL);
INSERT INTO storage.base_operations VALUES (1635, 0, '2021-04-13 00:00:00', 452, 443, 2114, NULL);
INSERT INTO storage.base_operations VALUES (1635, 3, '2021-04-13 00:00:00', 448, 443, 0, NULL);
INSERT INTO storage.base_operations VALUES (1635, 4, '2021-04-13 00:00:00', 452, 443, -0, NULL);
INSERT INTO storage.base_operations VALUES (1635, 5, '2021-04-13 00:00:00', 9, 443, 0, NULL);
INSERT INTO storage.base_operations VALUES (1635, 6, '2021-04-13 00:00:00', 452, 443, -0, NULL);
INSERT INTO storage.base_operations VALUES (1636, 1, '2021-04-13 00:00:00', 448, 399, -1533, NULL);
INSERT INTO storage.base_operations VALUES (1636, 0, '2021-04-13 00:00:00', 452, 399, 1533, NULL);
INSERT INTO storage.base_operations VALUES (1636, 3, '2021-04-13 00:00:00', 448, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1636, 4, '2021-04-13 00:00:00', 452, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1636, 5, '2021-04-13 00:00:00', 9, 399, 0, NULL);
INSERT INTO storage.base_operations VALUES (1636, 6, '2021-04-13 00:00:00', 452, 399, -0, NULL);
INSERT INTO storage.base_operations VALUES (1637, 1, '2021-04-13 00:00:00', 448, 410, -5790, NULL);
INSERT INTO storage.base_operations VALUES (1637, 0, '2021-04-13 00:00:00', 452, 410, 5790, NULL);
INSERT INTO storage.base_operations VALUES (1637, 3, '2021-04-13 00:00:00', 448, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1637, 4, '2021-04-13 00:00:00', 452, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1637, 5, '2021-04-13 00:00:00', 9, 410, 0, NULL);
INSERT INTO storage.base_operations VALUES (1637, 6, '2021-04-13 00:00:00', 452, 410, -0, NULL);
INSERT INTO storage.base_operations VALUES (1638, 1, '2021-04-13 00:00:00', 448, 444, -1873, NULL);
INSERT INTO storage.base_operations VALUES (1638, 0, '2021-04-13 00:00:00', 452, 444, 1873, NULL);
INSERT INTO storage.base_operations VALUES (1638, 3, '2021-04-13 00:00:00', 448, 444, 0, NULL);
INSERT INTO storage.base_operations VALUES (1638, 4, '2021-04-13 00:00:00', 452, 444, -0, NULL);
INSERT INTO storage.base_operations VALUES (1638, 5, '2021-04-13 00:00:00', 9, 444, 0, NULL);
INSERT INTO storage.base_operations VALUES (1638, 6, '2021-04-13 00:00:00', 452, 444, -0, NULL);
INSERT INTO storage.base_operations VALUES (1639, 1, '2021-04-13 00:00:00', 448, 431, -1250, NULL);
INSERT INTO storage.base_operations VALUES (1639, 0, '2021-04-13 00:00:00', 452, 431, 1250, NULL);
INSERT INTO storage.base_operations VALUES (1639, 3, '2021-04-13 00:00:00', 448, 431, 0, NULL);
INSERT INTO storage.base_operations VALUES (1639, 4, '2021-04-13 00:00:00', 452, 431, -0, NULL);
INSERT INTO storage.base_operations VALUES (1639, 5, '2021-04-13 00:00:00', 9, 431, 0, NULL);
INSERT INTO storage.base_operations VALUES (1639, 6, '2021-04-13 00:00:00', 452, 431, -0, NULL);
INSERT INTO storage.base_operations VALUES (1640, 1, '2021-04-13 00:00:00', 385, 412, -400, NULL);
INSERT INTO storage.base_operations VALUES (1640, 0, '2021-04-13 00:00:00', 382, 412, 400, NULL);
INSERT INTO storage.base_operations VALUES (1640, 3, '2021-04-13 00:00:00', 385, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1640, 4, '2021-04-13 00:00:00', 382, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1640, 5, '2021-04-13 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1640, 6, '2021-04-13 00:00:00', 382, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1641, 1, '2021-04-13 00:00:00', 391, 413, -555, NULL);
INSERT INTO storage.base_operations VALUES (1641, 0, '2021-04-13 00:00:00', 392, 413, 555, NULL);
INSERT INTO storage.base_operations VALUES (1641, 3, '2021-04-13 00:00:00', 391, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1641, 4, '2021-04-13 00:00:00', 392, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1641, 5, '2021-04-13 00:00:00', 9, 413, 1, NULL);
INSERT INTO storage.base_operations VALUES (1641, 6, '2021-04-13 00:00:00', 392, 413, -1, NULL);
INSERT INTO storage.base_operations VALUES (1642, 1, '2021-04-13 00:00:00', 392, 449, -120, NULL);
INSERT INTO storage.base_operations VALUES (1642, 0, '2021-04-13 00:00:00', 442, 449, 120, NULL);
INSERT INTO storage.base_operations VALUES (1642, 3, '2021-04-13 00:00:00', 392, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1642, 4, '2021-04-13 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1642, 5, '2021-04-13 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1642, 6, '2021-04-13 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1643, -1, '2021-04-13 00:00:00', 385, 412, 400, NULL);
INSERT INTO storage.base_operations VALUES (1644, 1, '2021-04-13 00:00:00', 385, 412, -649, NULL);
INSERT INTO storage.base_operations VALUES (1644, 0, '2021-04-13 00:00:00', 382, 412, 649, NULL);
INSERT INTO storage.base_operations VALUES (1644, 3, '2021-04-13 00:00:00', 385, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1644, 4, '2021-04-13 00:00:00', 382, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1644, 5, '2021-04-13 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1644, 6, '2021-04-13 00:00:00', 382, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1645, 1, '2021-04-13 00:00:00', 384, 405, -872, NULL);
INSERT INTO storage.base_operations VALUES (1645, 0, '2021-04-13 00:00:00', 382, 405, 872, NULL);
INSERT INTO storage.base_operations VALUES (1645, 3, '2021-04-13 00:00:00', 384, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1645, 4, '2021-04-13 00:00:00', 382, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1645, 5, '2021-04-13 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1645, 6, '2021-04-13 00:00:00', 382, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1646, 1, '2021-04-13 00:00:00', 389, 402, -751, NULL);
INSERT INTO storage.base_operations VALUES (1646, 0, '2021-04-13 00:00:00', 445, 402, 751, NULL);
INSERT INTO storage.base_operations VALUES (1646, 3, '2021-04-13 00:00:00', 389, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1646, 4, '2021-04-13 00:00:00', 445, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1646, 5, '2021-04-13 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1646, 6, '2021-04-13 00:00:00', 445, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1647, 1, '2021-04-13 00:00:00', 392, 413, -1428, NULL);
INSERT INTO storage.base_operations VALUES (1647, 0, '2021-04-13 00:00:00', 442, 413, 1428, NULL);
INSERT INTO storage.base_operations VALUES (1647, 3, '2021-04-13 00:00:00', 392, 413, 16, NULL);
INSERT INTO storage.base_operations VALUES (1647, 4, '2021-04-13 00:00:00', 442, 413, -16, NULL);
INSERT INTO storage.base_operations VALUES (1647, 5, '2021-04-13 00:00:00', 9, 413, 11, NULL);
INSERT INTO storage.base_operations VALUES (1647, 6, '2021-04-13 00:00:00', 442, 413, -11, NULL);
INSERT INTO storage.base_operations VALUES (1648, 1, '2021-04-13 00:00:00', 392, 413, -16, NULL);
INSERT INTO storage.base_operations VALUES (1648, 0, '2021-04-13 00:00:00', 391, 413, 16, NULL);
INSERT INTO storage.base_operations VALUES (1648, 3, '2021-04-13 00:00:00', 392, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1648, 4, '2021-04-13 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1648, 5, '2021-04-13 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1648, 6, '2021-04-13 00:00:00', 391, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1649, 1, '2021-04-13 00:00:00', 450, 451, -722, NULL);
INSERT INTO storage.base_operations VALUES (1649, 0, '2021-04-13 00:00:00', 392, 451, 722, NULL);
INSERT INTO storage.base_operations VALUES (1649, 3, '2021-04-13 00:00:00', 450, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1649, 4, '2021-04-13 00:00:00', 392, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1649, 5, '2021-04-13 00:00:00', 9, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1649, 6, '2021-04-13 00:00:00', 392, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1650, 1, '2021-04-13 00:00:00', 392, 449, -120, NULL);
INSERT INTO storage.base_operations VALUES (1650, 0, '2021-04-13 00:00:00', 442, 449, 120, NULL);
INSERT INTO storage.base_operations VALUES (1650, 3, '2021-04-13 00:00:00', 392, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1650, 4, '2021-04-13 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1650, 5, '2021-04-13 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1650, 6, '2021-04-13 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1651, 1, '2021-04-13 00:00:00', 393, 409, -1113, NULL);
INSERT INTO storage.base_operations VALUES (1651, 0, '2021-04-13 00:00:00', 452, 409, 1113, NULL);
INSERT INTO storage.base_operations VALUES (1651, 3, '2021-04-13 00:00:00', 393, 409, 0, NULL);
INSERT INTO storage.base_operations VALUES (1651, 4, '2021-04-13 00:00:00', 452, 409, -0, NULL);
INSERT INTO storage.base_operations VALUES (1651, 5, '2021-04-13 00:00:00', 9, 409, 0, NULL);
INSERT INTO storage.base_operations VALUES (1651, 6, '2021-04-13 00:00:00', 452, 409, -0, NULL);
INSERT INTO storage.base_operations VALUES (1652, 1, '2021-04-13 00:00:00', 393, 426, -1845, NULL);
INSERT INTO storage.base_operations VALUES (1652, 0, '2021-04-13 00:00:00', 452, 426, 1845, NULL);
INSERT INTO storage.base_operations VALUES (1652, 3, '2021-04-13 00:00:00', 393, 426, 0, NULL);
INSERT INTO storage.base_operations VALUES (1652, 4, '2021-04-13 00:00:00', 452, 426, -0, NULL);
INSERT INTO storage.base_operations VALUES (1652, 5, '2021-04-13 00:00:00', 9, 426, 0, NULL);
INSERT INTO storage.base_operations VALUES (1652, 6, '2021-04-13 00:00:00', 452, 426, -0, NULL);
INSERT INTO storage.base_operations VALUES (1653, -1, '2021-04-13 00:00:00', 384, 405, 872, NULL);
INSERT INTO storage.base_operations VALUES (1654, -1, '2021-04-13 00:00:00', 385, 412, 649, NULL);
INSERT INTO storage.base_operations VALUES (1655, -1, '2021-04-13 00:00:00', 450, 451, 722, NULL);
INSERT INTO storage.base_operations VALUES (1657, 1, '2021-04-14 00:00:00', 392, 449, -720, NULL);
INSERT INTO storage.base_operations VALUES (1657, 0, '2021-04-14 00:00:00', 442, 449, 720, NULL);
INSERT INTO storage.base_operations VALUES (1657, 3, '2021-04-14 00:00:00', 392, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1657, 4, '2021-04-14 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1657, 5, '2021-04-14 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1657, 6, '2021-04-14 00:00:00', 442, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1658, -1, '2021-04-11 00:00:00', 384, 449, 713, NULL);
INSERT INTO storage.base_operations VALUES (1659, 1, '2021-04-12 00:00:00', 384, 449, -713, NULL);
INSERT INTO storage.base_operations VALUES (1659, 0, '2021-04-12 00:00:00', 392, 449, 713, NULL);
INSERT INTO storage.base_operations VALUES (1659, 3, '2021-04-12 00:00:00', 384, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1659, 4, '2021-04-12 00:00:00', 392, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1659, 5, '2021-04-12 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1659, 6, '2021-04-12 00:00:00', 392, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1605, 1, '2021-04-12 00:00:00', 387, 402, -661, NULL);
INSERT INTO storage.base_operations VALUES (1605, 0, '2021-04-12 00:00:00', 445, 402, 661, NULL);
INSERT INTO storage.base_operations VALUES (1605, 3, '2021-04-12 00:00:00', 387, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1605, 4, '2021-04-12 00:00:00', 445, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1605, 5, '2021-04-12 00:00:00', 9, 402, 3, NULL);
INSERT INTO storage.base_operations VALUES (1605, 6, '2021-04-12 00:00:00', 445, 402, -3, NULL);
INSERT INTO storage.base_operations VALUES (1629, 1, '2021-04-13 00:00:00', 389, 402, -731, NULL);
INSERT INTO storage.base_operations VALUES (1629, 0, '2021-04-13 00:00:00', 445, 402, 731, NULL);
INSERT INTO storage.base_operations VALUES (1629, 3, '2021-04-13 00:00:00', 389, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1629, 4, '2021-04-13 00:00:00', 445, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1629, 5, '2021-04-13 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1629, 6, '2021-04-13 00:00:00', 445, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1661, 1, '2021-04-14 00:00:00', 382, 405, -396, NULL);
INSERT INTO storage.base_operations VALUES (1661, 0, '2021-04-14 00:00:00', 388, 405, 396, NULL);
INSERT INTO storage.base_operations VALUES (1661, 3, '2021-04-14 00:00:00', 382, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1661, 4, '2021-04-14 00:00:00', 388, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1661, 5, '2021-04-14 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1661, 6, '2021-04-14 00:00:00', 388, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1619, 1, '2021-04-13 00:00:00', 382, 402, -1208, NULL);
INSERT INTO storage.base_operations VALUES (1619, 0, '2021-04-13 00:00:00', 389, 402, 1208, NULL);
INSERT INTO storage.base_operations VALUES (1619, 3, '2021-04-13 00:00:00', 382, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1619, 4, '2021-04-13 00:00:00', 389, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1619, 5, '2021-04-13 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1619, 6, '2021-04-13 00:00:00', 389, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1592, 1, '2021-04-12 00:00:00', 382, 402, -683, NULL);
INSERT INTO storage.base_operations VALUES (1592, 0, '2021-04-12 00:00:00', 387, 402, 683, NULL);
INSERT INTO storage.base_operations VALUES (1592, 3, '2021-04-12 00:00:00', 382, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1592, 4, '2021-04-12 00:00:00', 387, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1592, 5, '2021-04-12 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1592, 6, '2021-04-12 00:00:00', 387, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1662, 1, '2021-04-15 00:00:00', 387, 402, -750, NULL);
INSERT INTO storage.base_operations VALUES (1662, 0, '2021-04-15 00:00:00', 445, 402, 750, NULL);
INSERT INTO storage.base_operations VALUES (1662, 3, '2021-04-15 00:00:00', 387, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1662, 4, '2021-04-15 00:00:00', 445, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1662, 5, '2021-04-15 00:00:00', 9, 402, 6, NULL);
INSERT INTO storage.base_operations VALUES (1662, 6, '2021-04-15 00:00:00', 445, 402, -6, NULL);
INSERT INTO storage.base_operations VALUES (1663, 1, '2021-04-15 00:00:00', 442, 446, -4230, NULL);
INSERT INTO storage.base_operations VALUES (1663, 0, '2021-04-15 00:00:00', 453, 446, 4230, NULL);
INSERT INTO storage.base_operations VALUES (1663, 3, '2021-04-15 00:00:00', 442, 446, 0, NULL);
INSERT INTO storage.base_operations VALUES (1663, 4, '2021-04-15 00:00:00', 453, 446, -0, NULL);
INSERT INTO storage.base_operations VALUES (1663, 5, '2021-04-15 00:00:00', 9, 446, 0, NULL);
INSERT INTO storage.base_operations VALUES (1663, 6, '2021-04-15 00:00:00', 453, 446, -0, NULL);
INSERT INTO storage.base_operations VALUES (1664, 1, '2021-04-15 00:00:00', 389, 402, -727, NULL);
INSERT INTO storage.base_operations VALUES (1664, 0, '2021-04-15 00:00:00', 445, 402, 727, NULL);
INSERT INTO storage.base_operations VALUES (1664, 3, '2021-04-15 00:00:00', 389, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1664, 4, '2021-04-15 00:00:00', 445, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1664, 5, '2021-04-15 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1664, 6, '2021-04-15 00:00:00', 445, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1665, 1, '2021-04-14 00:00:00', 392, 413, -575, NULL);
INSERT INTO storage.base_operations VALUES (1665, 0, '2021-04-14 00:00:00', 442, 413, 575, NULL);
INSERT INTO storage.base_operations VALUES (1665, 3, '2021-04-14 00:00:00', 392, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1665, 4, '2021-04-14 00:00:00', 442, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1665, 5, '2021-04-14 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1665, 6, '2021-04-14 00:00:00', 442, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1666, 1, '2021-04-14 00:00:00', 392, 412, -279, NULL);
INSERT INTO storage.base_operations VALUES (1666, 0, '2021-04-14 00:00:00', 442, 412, 279, NULL);
INSERT INTO storage.base_operations VALUES (1666, 3, '2021-04-14 00:00:00', 392, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1666, 4, '2021-04-14 00:00:00', 442, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1666, 5, '2021-04-14 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1666, 6, '2021-04-14 00:00:00', 442, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1667, 1, '2021-04-14 00:00:00', 392, 415, -6, NULL);
INSERT INTO storage.base_operations VALUES (1667, 0, '2021-04-14 00:00:00', 382, 415, 6, NULL);
INSERT INTO storage.base_operations VALUES (1667, 3, '2021-04-14 00:00:00', 392, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1667, 4, '2021-04-14 00:00:00', 382, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1667, 5, '2021-04-14 00:00:00', 9, 415, 6, NULL);
INSERT INTO storage.base_operations VALUES (1667, 6, '2021-04-14 00:00:00', 382, 415, -6, NULL);
INSERT INTO storage.base_operations VALUES (1668, 1, '2021-04-14 00:00:00', 382, 405, -412, NULL);
INSERT INTO storage.base_operations VALUES (1668, 0, '2021-04-14 00:00:00', 388, 405, 412, NULL);
INSERT INTO storage.base_operations VALUES (1668, 3, '2021-04-14 00:00:00', 382, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1668, 4, '2021-04-14 00:00:00', 388, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1668, 5, '2021-04-14 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1668, 6, '2021-04-14 00:00:00', 388, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1669, 1, '2021-04-14 00:00:00', 382, 412, -400, NULL);
INSERT INTO storage.base_operations VALUES (1669, 0, '2021-04-14 00:00:00', 387, 412, 400, NULL);
INSERT INTO storage.base_operations VALUES (1669, 3, '2021-04-14 00:00:00', 382, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1669, 4, '2021-04-14 00:00:00', 387, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1669, 5, '2021-04-14 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1669, 6, '2021-04-14 00:00:00', 387, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1670, 1, '2021-04-14 00:00:00', 385, 412, -1085, NULL);
INSERT INTO storage.base_operations VALUES (1670, 0, '2021-04-14 00:00:00', 382, 412, 1085, NULL);
INSERT INTO storage.base_operations VALUES (1670, 3, '2021-04-14 00:00:00', 385, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1670, 4, '2021-04-14 00:00:00', 382, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1670, 5, '2021-04-14 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1670, 6, '2021-04-14 00:00:00', 382, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1671, 1, '2021-04-14 00:00:00', 384, 405, -806, NULL);
INSERT INTO storage.base_operations VALUES (1671, 0, '2021-04-14 00:00:00', 382, 405, 806, NULL);
INSERT INTO storage.base_operations VALUES (1671, 3, '2021-04-14 00:00:00', 384, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1671, 4, '2021-04-14 00:00:00', 382, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1671, 5, '2021-04-14 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1671, 6, '2021-04-14 00:00:00', 382, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1673, 1, '2021-04-14 00:00:00', 388, 405, -575, NULL);
INSERT INTO storage.base_operations VALUES (1673, 0, '2021-04-14 00:00:00', 445, 405, 575, NULL);
INSERT INTO storage.base_operations VALUES (1673, 3, '2021-04-14 00:00:00', 388, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1673, 4, '2021-04-14 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1673, 5, '2021-04-14 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1673, 6, '2021-04-14 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1676, 1, '2021-04-15 00:00:00', 392, 404, -326, NULL);
INSERT INTO storage.base_operations VALUES (1676, 0, '2021-04-15 00:00:00', 442, 404, 326, NULL);
INSERT INTO storage.base_operations VALUES (1676, 3, '2021-04-15 00:00:00', 392, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1676, 4, '2021-04-15 00:00:00', 442, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1676, 5, '2021-04-15 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1676, 6, '2021-04-15 00:00:00', 442, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1677, 1, '2021-04-15 00:00:00', 382, 412, -300, NULL);
INSERT INTO storage.base_operations VALUES (1677, 0, '2021-04-15 00:00:00', 390, 412, 300, NULL);
INSERT INTO storage.base_operations VALUES (1677, 3, '2021-04-15 00:00:00', 382, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1677, 4, '2021-04-15 00:00:00', 390, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1677, 5, '2021-04-15 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1677, 6, '2021-04-15 00:00:00', 390, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1678, 1, '2021-04-15 00:00:00', 382, 405, -444, NULL);
INSERT INTO storage.base_operations VALUES (1678, 0, '2021-04-15 00:00:00', 388, 405, 444, NULL);
INSERT INTO storage.base_operations VALUES (1678, 3, '2021-04-15 00:00:00', 382, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1678, 4, '2021-04-15 00:00:00', 388, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1678, 5, '2021-04-15 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1678, 6, '2021-04-15 00:00:00', 388, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1679, 1, '2021-04-15 00:00:00', 392, 413, -1662, NULL);
INSERT INTO storage.base_operations VALUES (1679, 0, '2021-04-15 00:00:00', 442, 413, 1662, NULL);
INSERT INTO storage.base_operations VALUES (1679, 3, '2021-04-15 00:00:00', 392, 413, 3, NULL);
INSERT INTO storage.base_operations VALUES (1679, 4, '2021-04-15 00:00:00', 442, 413, -3, NULL);
INSERT INTO storage.base_operations VALUES (1679, 5, '2021-04-15 00:00:00', 9, 413, 2, NULL);
INSERT INTO storage.base_operations VALUES (1679, 6, '2021-04-15 00:00:00', 442, 413, -2, NULL);
INSERT INTO storage.base_operations VALUES (1680, 1, '2021-04-15 00:00:00', 388, 405, -412, NULL);
INSERT INTO storage.base_operations VALUES (1680, 0, '2021-04-15 00:00:00', 445, 405, 412, NULL);
INSERT INTO storage.base_operations VALUES (1680, 3, '2021-04-15 00:00:00', 388, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1680, 4, '2021-04-15 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1680, 5, '2021-04-15 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1680, 6, '2021-04-15 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1675, 1, '2021-04-14 00:00:00', 450, 451, -712, NULL);
INSERT INTO storage.base_operations VALUES (1675, 0, '2021-04-14 00:00:00', 382, 451, 712, NULL);
INSERT INTO storage.base_operations VALUES (1675, 3, '2021-04-14 00:00:00', 450, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1675, 4, '2021-04-14 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1675, 5, '2021-04-14 00:00:00', 9, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1675, 6, '2021-04-14 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1609, 1, '2021-04-12 00:00:00', 382, 402, -979, NULL);
INSERT INTO storage.base_operations VALUES (1609, 0, '2021-04-12 00:00:00', 389, 402, 979, NULL);
INSERT INTO storage.base_operations VALUES (1609, 3, '2021-04-12 00:00:00', 382, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1609, 4, '2021-04-12 00:00:00', 389, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1609, 5, '2021-04-12 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1609, 6, '2021-04-12 00:00:00', 389, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1682, 1, '2021-04-15 00:00:00', 442, 449, -2967, NULL);
INSERT INTO storage.base_operations VALUES (1682, 0, '2021-04-15 00:00:00', 453, 449, 2967, NULL);
INSERT INTO storage.base_operations VALUES (1682, 3, '2021-04-15 00:00:00', 442, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1682, 4, '2021-04-15 00:00:00', 453, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1682, 5, '2021-04-15 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1682, 6, '2021-04-15 00:00:00', 453, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1590, 1, '2021-04-09 00:00:00', 384, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1590, 0, '2021-04-09 00:00:00', 392, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1590, 3, '2021-04-09 00:00:00', 384, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1590, 4, '2021-04-09 00:00:00', 392, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1590, 5, '2021-04-09 00:00:00', 9, 449, 0, NULL);
INSERT INTO storage.base_operations VALUES (1590, 6, '2021-04-09 00:00:00', 392, 449, -0, NULL);
INSERT INTO storage.base_operations VALUES (1684, -1, '2021-04-16 00:00:00', 442, 449, -2736, NULL);
INSERT INTO storage.base_operations VALUES (1685, 1, '2021-04-15 00:00:00', 382, 412, -478, NULL);
INSERT INTO storage.base_operations VALUES (1685, 0, '2021-04-15 00:00:00', 390, 412, 478, NULL);
INSERT INTO storage.base_operations VALUES (1685, 3, '2021-04-15 00:00:00', 382, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1685, 4, '2021-04-15 00:00:00', 390, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1685, 5, '2021-04-15 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1685, 6, '2021-04-15 00:00:00', 390, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1686, 1, '2021-04-15 00:00:00', 382, 405, -785, NULL);
INSERT INTO storage.base_operations VALUES (1686, 0, '2021-04-15 00:00:00', 388, 405, 785, NULL);
INSERT INTO storage.base_operations VALUES (1686, 3, '2021-04-15 00:00:00', 382, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1686, 4, '2021-04-15 00:00:00', 388, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1686, 5, '2021-04-15 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1686, 6, '2021-04-15 00:00:00', 388, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1687, 1, '2021-04-15 00:00:00', 385, 417, -361, NULL);
INSERT INTO storage.base_operations VALUES (1687, 0, '2021-04-15 00:00:00', 382, 417, 361, NULL);
INSERT INTO storage.base_operations VALUES (1687, 3, '2021-04-15 00:00:00', 385, 417, 0, NULL);
INSERT INTO storage.base_operations VALUES (1687, 4, '2021-04-15 00:00:00', 382, 417, -0, NULL);
INSERT INTO storage.base_operations VALUES (1687, 5, '2021-04-15 00:00:00', 9, 417, 0, NULL);
INSERT INTO storage.base_operations VALUES (1687, 6, '2021-04-15 00:00:00', 382, 417, -0, NULL);
INSERT INTO storage.base_operations VALUES (1689, 1, '2021-04-15 00:00:00', 384, 405, -882, NULL);
INSERT INTO storage.base_operations VALUES (1689, 0, '2021-04-15 00:00:00', 382, 405, 882, NULL);
INSERT INTO storage.base_operations VALUES (1689, 3, '2021-04-15 00:00:00', 384, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1689, 4, '2021-04-15 00:00:00', 382, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1689, 5, '2021-04-15 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1689, 6, '2021-04-15 00:00:00', 382, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1690, 1, '2021-04-15 00:00:00', 388, 405, -768, NULL);
INSERT INTO storage.base_operations VALUES (1690, 0, '2021-04-15 00:00:00', 445, 405, 768, NULL);
INSERT INTO storage.base_operations VALUES (1690, 3, '2021-04-15 00:00:00', 388, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1690, 4, '2021-04-15 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1690, 5, '2021-04-15 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1690, 6, '2021-04-15 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1692, 1, '2021-04-16 00:00:00', 385, 417, -104, NULL);
INSERT INTO storage.base_operations VALUES (1692, 0, '2021-04-16 00:00:00', 382, 417, 104, NULL);
INSERT INTO storage.base_operations VALUES (1692, 3, '2021-04-16 00:00:00', 385, 417, 0, NULL);
INSERT INTO storage.base_operations VALUES (1692, 4, '2021-04-16 00:00:00', 382, 417, -0, NULL);
INSERT INTO storage.base_operations VALUES (1692, 5, '2021-04-16 00:00:00', 9, 417, 0, NULL);
INSERT INTO storage.base_operations VALUES (1692, 6, '2021-04-16 00:00:00', 382, 417, -0, NULL);
INSERT INTO storage.base_operations VALUES (1694, 1, '2021-04-16 00:00:00', 392, 429, -959, NULL);
INSERT INTO storage.base_operations VALUES (1694, 0, '2021-04-16 00:00:00', 442, 429, 959, NULL);
INSERT INTO storage.base_operations VALUES (1694, 3, '2021-04-16 00:00:00', 392, 429, 0, NULL);
INSERT INTO storage.base_operations VALUES (1694, 4, '2021-04-16 00:00:00', 442, 429, -0, NULL);
INSERT INTO storage.base_operations VALUES (1694, 5, '2021-04-16 00:00:00', 9, 429, 0, NULL);
INSERT INTO storage.base_operations VALUES (1694, 6, '2021-04-16 00:00:00', 442, 429, -0, NULL);
INSERT INTO storage.base_operations VALUES (1698, -1, '2021-04-16 00:00:00', 450, 451, 1371, NULL);
INSERT INTO storage.base_operations VALUES (1699, 1, '2021-04-15 00:00:00', 450, 451, -659, NULL);
INSERT INTO storage.base_operations VALUES (1699, 0, '2021-04-15 00:00:00', 382, 451, 659, NULL);
INSERT INTO storage.base_operations VALUES (1699, 3, '2021-04-15 00:00:00', 450, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1699, 4, '2021-04-15 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1699, 5, '2021-04-15 00:00:00', 9, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1699, 6, '2021-04-15 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1700, 1, '2021-04-16 00:00:00', 392, 429, -220, NULL);
INSERT INTO storage.base_operations VALUES (1700, 0, '2021-04-16 00:00:00', 442, 429, 220, NULL);
INSERT INTO storage.base_operations VALUES (1700, 3, '2021-04-16 00:00:00', 392, 429, 4, NULL);
INSERT INTO storage.base_operations VALUES (1700, 4, '2021-04-16 00:00:00', 442, 429, -4, NULL);
INSERT INTO storage.base_operations VALUES (1700, 5, '2021-04-16 00:00:00', 9, 429, 7, NULL);
INSERT INTO storage.base_operations VALUES (1700, 6, '2021-04-16 00:00:00', 442, 429, -7, NULL);
INSERT INTO storage.base_operations VALUES (1691, 1, '2021-04-15 00:00:00', 390, 412, -648, NULL);
INSERT INTO storage.base_operations VALUES (1691, 0, '2021-04-15 00:00:00', 392, 412, 648, NULL);
INSERT INTO storage.base_operations VALUES (1691, 3, '2021-04-15 00:00:00', 390, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1691, 4, '2021-04-15 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1691, 5, '2021-04-15 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1691, 6, '2021-04-15 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1701, 1, '2021-04-15 00:00:00', 393, 415, -2318, NULL);
INSERT INTO storage.base_operations VALUES (1701, 0, '2021-04-15 00:00:00', 452, 415, 2318, NULL);
INSERT INTO storage.base_operations VALUES (1701, 3, '2021-04-15 00:00:00', 393, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1701, 4, '2021-04-15 00:00:00', 452, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1701, 5, '2021-04-15 00:00:00', 9, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1701, 6, '2021-04-15 00:00:00', 452, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1702, 1, '2021-04-15 00:00:00', 393, 409, -959, NULL);
INSERT INTO storage.base_operations VALUES (1702, 0, '2021-04-15 00:00:00', 452, 409, 959, NULL);
INSERT INTO storage.base_operations VALUES (1702, 3, '2021-04-15 00:00:00', 393, 409, 0, NULL);
INSERT INTO storage.base_operations VALUES (1702, 4, '2021-04-15 00:00:00', 452, 409, -0, NULL);
INSERT INTO storage.base_operations VALUES (1702, 5, '2021-04-15 00:00:00', 9, 409, 0, NULL);
INSERT INTO storage.base_operations VALUES (1702, 6, '2021-04-15 00:00:00', 452, 409, -0, NULL);
INSERT INTO storage.base_operations VALUES (1703, 1, '2021-04-15 00:00:00', 393, 436, -12, NULL);
INSERT INTO storage.base_operations VALUES (1703, 0, '2021-04-15 00:00:00', 452, 436, 12, NULL);
INSERT INTO storage.base_operations VALUES (1703, 3, '2021-04-15 00:00:00', 393, 436, 0, NULL);
INSERT INTO storage.base_operations VALUES (1703, 4, '2021-04-15 00:00:00', 452, 436, -0, NULL);
INSERT INTO storage.base_operations VALUES (1703, 5, '2021-04-15 00:00:00', 9, 436, 0, NULL);
INSERT INTO storage.base_operations VALUES (1703, 6, '2021-04-15 00:00:00', 452, 436, -0, NULL);
INSERT INTO storage.base_operations VALUES (1704, 1, '2021-04-15 00:00:00', 385, 417, -294, NULL);
INSERT INTO storage.base_operations VALUES (1704, 0, '2021-04-15 00:00:00', 382, 417, 294, NULL);
INSERT INTO storage.base_operations VALUES (1704, 3, '2021-04-15 00:00:00', 385, 417, 0, NULL);
INSERT INTO storage.base_operations VALUES (1704, 4, '2021-04-15 00:00:00', 382, 417, -0, NULL);
INSERT INTO storage.base_operations VALUES (1704, 5, '2021-04-15 00:00:00', 9, 417, 0, NULL);
INSERT INTO storage.base_operations VALUES (1704, 6, '2021-04-15 00:00:00', 382, 417, -0, NULL);
INSERT INTO storage.base_operations VALUES (1705, -1, '2021-04-15 00:00:00', 385, 417, 294, NULL);
INSERT INTO storage.base_operations VALUES (1681, 1, '2021-04-15 00:00:00', 385, 412, -348, NULL);
INSERT INTO storage.base_operations VALUES (1681, 0, '2021-04-15 00:00:00', 382, 412, 348, NULL);
INSERT INTO storage.base_operations VALUES (1681, 3, '2021-04-15 00:00:00', 385, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1681, 4, '2021-04-15 00:00:00', 382, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1681, 5, '2021-04-15 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1681, 6, '2021-04-15 00:00:00', 382, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1688, 1, '2021-04-15 00:00:00', 385, 417, -300, NULL);
INSERT INTO storage.base_operations VALUES (1688, 0, '2021-04-15 00:00:00', 382, 417, 300, NULL);
INSERT INTO storage.base_operations VALUES (1688, 3, '2021-04-15 00:00:00', 385, 417, 0, NULL);
INSERT INTO storage.base_operations VALUES (1688, 4, '2021-04-15 00:00:00', 382, 417, -0, NULL);
INSERT INTO storage.base_operations VALUES (1688, 5, '2021-04-15 00:00:00', 9, 417, 0, NULL);
INSERT INTO storage.base_operations VALUES (1688, 6, '2021-04-15 00:00:00', 382, 417, -0, NULL);
INSERT INTO storage.base_operations VALUES (1706, -1, '2021-04-15 00:00:00', 385, 417, 765, NULL);
INSERT INTO storage.base_operations VALUES (1707, -1, '2021-04-15 00:00:00', 385, 412, 1433, NULL);
INSERT INTO storage.base_operations VALUES (1693, 1, '2021-04-16 00:00:00', 387, 412, -200, NULL);
INSERT INTO storage.base_operations VALUES (1693, 0, '2021-04-16 00:00:00', 392, 412, 200, NULL);
INSERT INTO storage.base_operations VALUES (1693, 3, '2021-04-16 00:00:00', 387, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1693, 4, '2021-04-16 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1693, 5, '2021-04-16 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1693, 6, '2021-04-16 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1708, 1, '2021-04-16 00:00:00', 387, 412, -200, NULL);
INSERT INTO storage.base_operations VALUES (1708, 0, '2021-04-16 00:00:00', 390, 412, 200, NULL);
INSERT INTO storage.base_operations VALUES (1708, 3, '2021-04-16 00:00:00', 387, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1708, 4, '2021-04-16 00:00:00', 390, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1708, 5, '2021-04-16 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1708, 6, '2021-04-16 00:00:00', 390, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1598, 1, '2021-04-12 00:00:00', 385, 402, -3711, NULL);
INSERT INTO storage.base_operations VALUES (1598, 0, '2021-04-12 00:00:00', 382, 402, 3711, NULL);
INSERT INTO storage.base_operations VALUES (1598, 3, '2021-04-12 00:00:00', 385, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1598, 4, '2021-04-12 00:00:00', 382, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1598, 5, '2021-04-12 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1598, 6, '2021-04-12 00:00:00', 382, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1587, 1, '2021-04-09 00:00:00', 382, 402, -1212, NULL);
INSERT INTO storage.base_operations VALUES (1587, 0, '2021-04-09 00:00:00', 389, 402, 1212, NULL);
INSERT INTO storage.base_operations VALUES (1587, 3, '2021-04-09 00:00:00', 382, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1587, 4, '2021-04-09 00:00:00', 389, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1587, 5, '2021-04-09 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1587, 6, '2021-04-09 00:00:00', 389, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1613, 1, '2021-04-12 00:00:00', 389, 402, -1851, NULL);
INSERT INTO storage.base_operations VALUES (1613, 0, '2021-04-12 00:00:00', 445, 402, 1851, NULL);
INSERT INTO storage.base_operations VALUES (1613, 3, '2021-04-12 00:00:00', 389, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1613, 4, '2021-04-12 00:00:00', 445, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1613, 5, '2021-04-12 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1613, 6, '2021-04-12 00:00:00', 445, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1709, -1, '2021-04-16 00:00:00', 392, 449, 1642, NULL);
INSERT INTO storage.base_operations VALUES (1710, 1, '2021-04-15 00:00:00', 442, 404, -5443, NULL);
INSERT INTO storage.base_operations VALUES (1710, 0, '2021-04-15 00:00:00', 393, 404, 5443, NULL);
INSERT INTO storage.base_operations VALUES (1710, 3, '2021-04-15 00:00:00', 442, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1710, 4, '2021-04-15 00:00:00', 393, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1710, 5, '2021-04-15 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1710, 6, '2021-04-15 00:00:00', 393, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1714, -1, '2021-04-16 00:00:00', 384, 405, 1688, NULL);
INSERT INTO storage.base_operations VALUES (1715, 1, '2021-04-16 00:00:00', 382, 405, -1363, NULL);
INSERT INTO storage.base_operations VALUES (1715, 0, '2021-04-16 00:00:00', 388, 405, 1363, NULL);
INSERT INTO storage.base_operations VALUES (1715, 3, '2021-04-16 00:00:00', 382, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1715, 4, '2021-04-16 00:00:00', 388, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1715, 5, '2021-04-16 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1715, 6, '2021-04-16 00:00:00', 388, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1716, 1, '2021-04-16 00:00:00', 382, 412, -1415, NULL);
INSERT INTO storage.base_operations VALUES (1716, 0, '2021-04-16 00:00:00', 390, 412, 1415, NULL);
INSERT INTO storage.base_operations VALUES (1716, 3, '2021-04-16 00:00:00', 382, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1716, 4, '2021-04-16 00:00:00', 390, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1716, 5, '2021-04-16 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1716, 6, '2021-04-16 00:00:00', 390, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1717, 1, '2021-04-16 00:00:00', 388, 405, -460, NULL);
INSERT INTO storage.base_operations VALUES (1717, 0, '2021-04-16 00:00:00', 445, 405, 460, NULL);
INSERT INTO storage.base_operations VALUES (1717, 3, '2021-04-16 00:00:00', 388, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1717, 4, '2021-04-16 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1717, 5, '2021-04-16 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1717, 6, '2021-04-16 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1719, -1, '2021-04-18 00:00:00', 384, 405, 2684, NULL);
INSERT INTO storage.base_operations VALUES (1720, -1, '2021-04-18 00:00:00', 385, 424, 3394, NULL);
INSERT INTO storage.base_operations VALUES (1721, 1, '2021-04-18 00:00:00', 385, 424, -3394, NULL);
INSERT INTO storage.base_operations VALUES (1721, 0, '2021-04-18 00:00:00', 382, 424, 3394, NULL);
INSERT INTO storage.base_operations VALUES (1721, 3, '2021-04-18 00:00:00', 385, 424, 0, NULL);
INSERT INTO storage.base_operations VALUES (1721, 4, '2021-04-18 00:00:00', 382, 424, -0, NULL);
INSERT INTO storage.base_operations VALUES (1721, 5, '2021-04-18 00:00:00', 9, 424, 0, NULL);
INSERT INTO storage.base_operations VALUES (1721, 6, '2021-04-18 00:00:00', 382, 424, -0, NULL);
INSERT INTO storage.base_operations VALUES (1722, 1, '2021-04-18 00:00:00', 384, 405, -2684, NULL);
INSERT INTO storage.base_operations VALUES (1722, 0, '2021-04-18 00:00:00', 382, 405, 2684, NULL);
INSERT INTO storage.base_operations VALUES (1722, 3, '2021-04-18 00:00:00', 384, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1722, 4, '2021-04-18 00:00:00', 382, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1722, 5, '2021-04-18 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1722, 6, '2021-04-18 00:00:00', 382, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1723, 1, '2021-04-18 00:00:00', 390, 412, -190, NULL);
INSERT INTO storage.base_operations VALUES (1723, 0, '2021-04-18 00:00:00', 392, 412, 190, NULL);
INSERT INTO storage.base_operations VALUES (1723, 3, '2021-04-18 00:00:00', 390, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1723, 4, '2021-04-18 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1723, 5, '2021-04-18 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1723, 6, '2021-04-18 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1724, 1, '2021-04-18 00:00:00', 388, 405, -1374, NULL);
INSERT INTO storage.base_operations VALUES (1724, 0, '2021-04-18 00:00:00', 445, 405, 1374, NULL);
INSERT INTO storage.base_operations VALUES (1724, 3, '2021-04-18 00:00:00', 388, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1724, 4, '2021-04-18 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1724, 5, '2021-04-18 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1724, 6, '2021-04-18 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1725, 1, '2021-04-18 00:00:00', 392, 412, -848, NULL);
INSERT INTO storage.base_operations VALUES (1725, 0, '2021-04-18 00:00:00', 442, 412, 848, NULL);
INSERT INTO storage.base_operations VALUES (1725, 3, '2021-04-18 00:00:00', 392, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1725, 4, '2021-04-18 00:00:00', 442, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1725, 5, '2021-04-18 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1725, 6, '2021-04-18 00:00:00', 442, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1726, 1, '2021-04-19 00:00:00', 382, 451, -3600, NULL);
INSERT INTO storage.base_operations VALUES (1726, 0, '2021-04-19 00:00:00', 452, 451, 3600, NULL);
INSERT INTO storage.base_operations VALUES (1726, 3, '2021-04-19 00:00:00', 382, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1726, 4, '2021-04-19 00:00:00', 452, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1726, 5, '2021-04-19 00:00:00', 9, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1726, 6, '2021-04-19 00:00:00', 452, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1727, 1, '2021-04-18 00:00:00', 442, 413, -4473, NULL);
INSERT INTO storage.base_operations VALUES (1727, 0, '2021-04-18 00:00:00', 393, 413, 4473, NULL);
INSERT INTO storage.base_operations VALUES (1727, 3, '2021-04-18 00:00:00', 442, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1727, 4, '2021-04-18 00:00:00', 393, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1727, 5, '2021-04-18 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1727, 6, '2021-04-18 00:00:00', 393, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1728, 1, '2021-04-19 00:00:00', 382, 405, -2684, NULL);
INSERT INTO storage.base_operations VALUES (1728, 0, '2021-04-19 00:00:00', 388, 405, 2684, NULL);
INSERT INTO storage.base_operations VALUES (1728, 3, '2021-04-19 00:00:00', 382, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1728, 4, '2021-04-19 00:00:00', 388, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1728, 5, '2021-04-19 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1728, 6, '2021-04-19 00:00:00', 388, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1730, -1, '2021-04-18 00:00:00', 450, 451, 1221, NULL);
INSERT INTO storage.base_operations VALUES (1731, -1, '2021-04-19 00:00:00', 450, 451, 1008, NULL);
INSERT INTO storage.base_operations VALUES (1732, 1, '2021-04-19 00:00:00', 450, 451, -2229, NULL);
INSERT INTO storage.base_operations VALUES (1732, 0, '2021-04-19 00:00:00', 382, 451, 2229, NULL);
INSERT INTO storage.base_operations VALUES (1732, 3, '2021-04-19 00:00:00', 450, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1732, 4, '2021-04-19 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1732, 5, '2021-04-19 00:00:00', 9, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1732, 6, '2021-04-19 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1733, 1, '2021-04-08 00:00:00', 442, 409, -110, NULL);
INSERT INTO storage.base_operations VALUES (1733, 0, '2021-04-08 00:00:00', 393, 409, 110, NULL);
INSERT INTO storage.base_operations VALUES (1733, 3, '2021-04-08 00:00:00', 442, 409, 0, NULL);
INSERT INTO storage.base_operations VALUES (1733, 4, '2021-04-08 00:00:00', 393, 409, -0, NULL);
INSERT INTO storage.base_operations VALUES (1733, 5, '2021-04-08 00:00:00', 9, 409, 0, NULL);
INSERT INTO storage.base_operations VALUES (1733, 6, '2021-04-08 00:00:00', 393, 409, -0, NULL);
INSERT INTO storage.base_operations VALUES (1734, -1, '2021-04-13 00:00:00', 393, 415, 293, NULL);
INSERT INTO storage.base_operations VALUES (1736, 1, '2021-04-16 00:00:00', 393, 415, -585, NULL);
INSERT INTO storage.base_operations VALUES (1736, 0, '2021-04-16 00:00:00', 452, 415, 585, NULL);
INSERT INTO storage.base_operations VALUES (1736, 3, '2021-04-16 00:00:00', 393, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1736, 4, '2021-04-16 00:00:00', 452, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1736, 5, '2021-04-16 00:00:00', 9, 415, 0, NULL);
INSERT INTO storage.base_operations VALUES (1736, 6, '2021-04-16 00:00:00', 452, 415, -0, NULL);
INSERT INTO storage.base_operations VALUES (1737, 1, '2021-04-16 00:00:00', 393, 404, -180, NULL);
INSERT INTO storage.base_operations VALUES (1737, 0, '2021-04-16 00:00:00', 452, 404, 180, NULL);
INSERT INTO storage.base_operations VALUES (1737, 3, '2021-04-16 00:00:00', 393, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1737, 4, '2021-04-16 00:00:00', 452, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1737, 5, '2021-04-16 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1737, 6, '2021-04-16 00:00:00', 452, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1738, -1, '2021-04-19 00:00:00', 385, 424, 300, NULL);
INSERT INTO storage.base_operations VALUES (1739, 1, '2021-04-19 00:00:00', 385, 424, -300, NULL);
INSERT INTO storage.base_operations VALUES (1739, 0, '2021-04-19 00:00:00', 382, 424, 300, NULL);
INSERT INTO storage.base_operations VALUES (1739, 3, '2021-04-19 00:00:00', 385, 424, 0, NULL);
INSERT INTO storage.base_operations VALUES (1739, 4, '2021-04-19 00:00:00', 382, 424, -0, NULL);
INSERT INTO storage.base_operations VALUES (1739, 5, '2021-04-19 00:00:00', 9, 424, 0, NULL);
INSERT INTO storage.base_operations VALUES (1739, 6, '2021-04-19 00:00:00', 382, 424, -0, NULL);
INSERT INTO storage.base_operations VALUES (1740, 1, '2021-04-19 00:00:00', 390, 412, -431, NULL);
INSERT INTO storage.base_operations VALUES (1740, 0, '2021-04-19 00:00:00', 392, 412, 431, NULL);
INSERT INTO storage.base_operations VALUES (1740, 3, '2021-04-19 00:00:00', 390, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1740, 4, '2021-04-19 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1740, 5, '2021-04-19 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1740, 6, '2021-04-19 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1735, 1, '2021-04-16 00:00:00', 393, 409, -132, NULL);
INSERT INTO storage.base_operations VALUES (1735, 0, '2021-04-16 00:00:00', 452, 409, 132, NULL);
INSERT INTO storage.base_operations VALUES (1735, 3, '2021-04-16 00:00:00', 393, 409, 0, NULL);
INSERT INTO storage.base_operations VALUES (1735, 4, '2021-04-16 00:00:00', 452, 409, -0, NULL);
INSERT INTO storage.base_operations VALUES (1735, 5, '2021-04-16 00:00:00', 9, 409, 0, NULL);
INSERT INTO storage.base_operations VALUES (1735, 6, '2021-04-16 00:00:00', 452, 409, -0, NULL);
INSERT INTO storage.base_operations VALUES (1741, 1, '2021-04-19 00:00:00', 390, 412, -240, NULL);
INSERT INTO storage.base_operations VALUES (1741, 0, '2021-04-19 00:00:00', 392, 412, 240, NULL);
INSERT INTO storage.base_operations VALUES (1741, 3, '2021-04-19 00:00:00', 390, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1741, 4, '2021-04-19 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1741, 5, '2021-04-19 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1741, 6, '2021-04-19 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1742, 1, '2021-04-19 00:00:00', 382, 412, -738, NULL);
INSERT INTO storage.base_operations VALUES (1742, 0, '2021-04-19 00:00:00', 390, 412, 738, NULL);
INSERT INTO storage.base_operations VALUES (1742, 3, '2021-04-19 00:00:00', 382, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1742, 4, '2021-04-19 00:00:00', 390, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1742, 5, '2021-04-19 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1742, 6, '2021-04-19 00:00:00', 390, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1743, 1, '2021-04-19 00:00:00', 382, 417, -759, NULL);
INSERT INTO storage.base_operations VALUES (1743, 0, '2021-04-19 00:00:00', 390, 417, 759, NULL);
INSERT INTO storage.base_operations VALUES (1743, 3, '2021-04-19 00:00:00', 382, 417, 0, NULL);
INSERT INTO storage.base_operations VALUES (1743, 4, '2021-04-19 00:00:00', 390, 417, -0, NULL);
INSERT INTO storage.base_operations VALUES (1743, 5, '2021-04-19 00:00:00', 9, 417, 0, NULL);
INSERT INTO storage.base_operations VALUES (1743, 6, '2021-04-19 00:00:00', 390, 417, -0, NULL);
INSERT INTO storage.base_operations VALUES (1744, -1, '2021-04-19 00:00:00', 382, 401, 580, NULL);
INSERT INTO storage.base_operations VALUES (1745, -1, '2021-04-19 00:00:00', 389, 401, -580, NULL);
INSERT INTO storage.base_operations VALUES (1746, 1, '2021-04-19 00:00:00', 393, 431, -62, NULL);
INSERT INTO storage.base_operations VALUES (1746, 0, '2021-04-19 00:00:00', 452, 431, 62, NULL);
INSERT INTO storage.base_operations VALUES (1746, 3, '2021-04-19 00:00:00', 393, 431, 0, NULL);
INSERT INTO storage.base_operations VALUES (1746, 4, '2021-04-19 00:00:00', 452, 431, -0, NULL);
INSERT INTO storage.base_operations VALUES (1746, 5, '2021-04-19 00:00:00', 9, 431, 0, NULL);
INSERT INTO storage.base_operations VALUES (1746, 6, '2021-04-19 00:00:00', 452, 431, -0, NULL);
INSERT INTO storage.base_operations VALUES (1747, 1, '2021-04-19 00:00:00', 393, 404, -1020, NULL);
INSERT INTO storage.base_operations VALUES (1747, 0, '2021-04-19 00:00:00', 452, 404, 1020, NULL);
INSERT INTO storage.base_operations VALUES (1747, 3, '2021-04-19 00:00:00', 393, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1747, 4, '2021-04-19 00:00:00', 452, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1747, 5, '2021-04-19 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1747, 6, '2021-04-19 00:00:00', 452, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1748, 1, '2021-04-19 00:00:00', 390, 412, -360, NULL);
INSERT INTO storage.base_operations VALUES (1748, 0, '2021-04-19 00:00:00', 392, 412, 360, NULL);
INSERT INTO storage.base_operations VALUES (1748, 3, '2021-04-19 00:00:00', 390, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1748, 4, '2021-04-19 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1748, 5, '2021-04-19 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1748, 6, '2021-04-19 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1749, 1, '2021-04-19 00:00:00', 388, 405, -418, NULL);
INSERT INTO storage.base_operations VALUES (1749, 0, '2021-04-19 00:00:00', 445, 405, 418, NULL);
INSERT INTO storage.base_operations VALUES (1749, 3, '2021-04-19 00:00:00', 388, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1749, 4, '2021-04-19 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1749, 5, '2021-04-19 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1749, 6, '2021-04-19 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1750, -1, '2021-04-19 00:00:00', 384, 403, 320, NULL);
INSERT INTO storage.base_operations VALUES (1751, -1, '2021-04-19 00:00:00', 450, 451, 222, NULL);
INSERT INTO storage.base_operations VALUES (1752, 1, '2021-04-19 00:00:00', 384, 403, -320, NULL);
INSERT INTO storage.base_operations VALUES (1752, 0, '2021-04-19 00:00:00', 382, 403, 320, NULL);
INSERT INTO storage.base_operations VALUES (1752, 3, '2021-04-19 00:00:00', 384, 403, 0, NULL);
INSERT INTO storage.base_operations VALUES (1752, 4, '2021-04-19 00:00:00', 382, 403, -0, NULL);
INSERT INTO storage.base_operations VALUES (1752, 5, '2021-04-19 00:00:00', 9, 403, 0, NULL);
INSERT INTO storage.base_operations VALUES (1752, 6, '2021-04-19 00:00:00', 382, 403, -0, NULL);
INSERT INTO storage.base_operations VALUES (1753, 1, '2021-04-19 00:00:00', 450, 451, -222, NULL);
INSERT INTO storage.base_operations VALUES (1753, 0, '2021-04-19 00:00:00', 382, 451, 222, NULL);
INSERT INTO storage.base_operations VALUES (1753, 3, '2021-04-19 00:00:00', 450, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1753, 4, '2021-04-19 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1753, 5, '2021-04-19 00:00:00', 9, 451, 0, NULL);
INSERT INTO storage.base_operations VALUES (1753, 6, '2021-04-19 00:00:00', 382, 451, -0, NULL);
INSERT INTO storage.base_operations VALUES (1754, 1, '2021-04-20 00:00:00', 388, 405, -484, NULL);
INSERT INTO storage.base_operations VALUES (1754, 0, '2021-04-20 00:00:00', 445, 405, 484, NULL);
INSERT INTO storage.base_operations VALUES (1754, 3, '2021-04-20 00:00:00', 388, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1754, 4, '2021-04-20 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1754, 5, '2021-04-20 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1754, 6, '2021-04-20 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1755, 1, '2021-04-20 00:00:00', 390, 412, -351, NULL);
INSERT INTO storage.base_operations VALUES (1755, 0, '2021-04-20 00:00:00', 392, 412, 351, NULL);
INSERT INTO storage.base_operations VALUES (1755, 3, '2021-04-20 00:00:00', 390, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1755, 4, '2021-04-20 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1755, 5, '2021-04-20 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1755, 6, '2021-04-20 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1756, 1, '2021-04-20 00:00:00', 445, 402, -482, NULL);
INSERT INTO storage.base_operations VALUES (1756, 0, '2021-04-20 00:00:00', 392, 402, 482, NULL);
INSERT INTO storage.base_operations VALUES (1756, 3, '2021-04-20 00:00:00', 445, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1756, 4, '2021-04-20 00:00:00', 392, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1756, 5, '2021-04-20 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1756, 6, '2021-04-20 00:00:00', 392, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1757, 1, '2021-04-19 00:00:00', 442, 413, -2262, NULL);
INSERT INTO storage.base_operations VALUES (1757, 0, '2021-04-19 00:00:00', 393, 413, 2262, NULL);
INSERT INTO storage.base_operations VALUES (1757, 3, '2021-04-19 00:00:00', 442, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1757, 4, '2021-04-19 00:00:00', 393, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1757, 5, '2021-04-19 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1757, 6, '2021-04-19 00:00:00', 393, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1758, 1, '2021-04-20 00:00:00', 382, 417, -300, NULL);
INSERT INTO storage.base_operations VALUES (1758, 0, '2021-04-20 00:00:00', 390, 417, 300, NULL);
INSERT INTO storage.base_operations VALUES (1758, 3, '2021-04-20 00:00:00', 382, 417, 0, NULL);
INSERT INTO storage.base_operations VALUES (1758, 4, '2021-04-20 00:00:00', 390, 417, -0, NULL);
INSERT INTO storage.base_operations VALUES (1758, 5, '2021-04-20 00:00:00', 9, 417, 0, NULL);
INSERT INTO storage.base_operations VALUES (1758, 6, '2021-04-20 00:00:00', 390, 417, -0, NULL);
INSERT INTO storage.base_operations VALUES (1759, 1, '2021-04-20 00:00:00', 390, 412, -189, NULL);
INSERT INTO storage.base_operations VALUES (1759, 0, '2021-04-20 00:00:00', 392, 412, 189, NULL);
INSERT INTO storage.base_operations VALUES (1759, 3, '2021-04-20 00:00:00', 390, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1759, 4, '2021-04-20 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1759, 5, '2021-04-20 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1759, 6, '2021-04-20 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1760, 1, '2021-04-20 00:00:00', 393, 404, -1320, NULL);
INSERT INTO storage.base_operations VALUES (1760, 0, '2021-04-20 00:00:00', 452, 404, 1320, NULL);
INSERT INTO storage.base_operations VALUES (1760, 3, '2021-04-20 00:00:00', 393, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1760, 4, '2021-04-20 00:00:00', 452, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1760, 5, '2021-04-20 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1760, 6, '2021-04-20 00:00:00', 452, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1761, 1, '2021-04-20 00:00:00', 393, 404, -60, NULL);
INSERT INTO storage.base_operations VALUES (1761, 0, '2021-04-20 00:00:00', 452, 404, 60, NULL);
INSERT INTO storage.base_operations VALUES (1761, 3, '2021-04-20 00:00:00', 393, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1761, 4, '2021-04-20 00:00:00', 452, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1761, 5, '2021-04-20 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1761, 6, '2021-04-20 00:00:00', 452, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1762, 1, '2021-04-20 00:00:00', 445, 402, -481, NULL);
INSERT INTO storage.base_operations VALUES (1762, 0, '2021-04-20 00:00:00', 392, 402, 481, NULL);
INSERT INTO storage.base_operations VALUES (1762, 3, '2021-04-20 00:00:00', 445, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1762, 4, '2021-04-20 00:00:00', 392, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1762, 5, '2021-04-20 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1762, 6, '2021-04-20 00:00:00', 392, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1763, 1, '2021-04-20 00:00:00', 388, 405, -492, NULL);
INSERT INTO storage.base_operations VALUES (1763, 0, '2021-04-20 00:00:00', 445, 405, 492, NULL);
INSERT INTO storage.base_operations VALUES (1763, 3, '2021-04-20 00:00:00', 388, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1763, 4, '2021-04-20 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1763, 5, '2021-04-20 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1763, 6, '2021-04-20 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1764, 1, '2021-04-20 00:00:00', 392, 412, -1051, NULL);
INSERT INTO storage.base_operations VALUES (1764, 0, '2021-04-20 00:00:00', 442, 412, 1051, NULL);
INSERT INTO storage.base_operations VALUES (1764, 3, '2021-04-20 00:00:00', 392, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1764, 4, '2021-04-20 00:00:00', 442, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1764, 5, '2021-04-20 00:00:00', 9, 412, 1, NULL);
INSERT INTO storage.base_operations VALUES (1764, 6, '2021-04-20 00:00:00', 442, 412, -1, NULL);
INSERT INTO storage.base_operations VALUES (1765, -1, '2021-04-20 00:00:00', 385, 414, 293, NULL);
INSERT INTO storage.base_operations VALUES (1766, -1, '2021-04-21 00:00:00', 385, 414, 842, NULL);
INSERT INTO storage.base_operations VALUES (1767, -1, '2021-04-20 00:00:00', 384, 403, 410, NULL);
INSERT INTO storage.base_operations VALUES (1768, 1, '2021-04-20 00:00:00', 442, 413, -50, NULL);
INSERT INTO storage.base_operations VALUES (1768, 0, '2021-04-20 00:00:00', 393, 413, 50, NULL);
INSERT INTO storage.base_operations VALUES (1768, 3, '2021-04-20 00:00:00', 442, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1768, 4, '2021-04-20 00:00:00', 393, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1768, 5, '2021-04-20 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1768, 6, '2021-04-20 00:00:00', 393, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1770, 1, '2021-04-20 00:00:00', 384, 403, -410, NULL);
INSERT INTO storage.base_operations VALUES (1770, 0, '2021-04-20 00:00:00', 382, 403, 410, NULL);
INSERT INTO storage.base_operations VALUES (1770, 3, '2021-04-20 00:00:00', 384, 403, 0, NULL);
INSERT INTO storage.base_operations VALUES (1770, 4, '2021-04-20 00:00:00', 382, 403, -0, NULL);
INSERT INTO storage.base_operations VALUES (1770, 5, '2021-04-20 00:00:00', 9, 403, 0, NULL);
INSERT INTO storage.base_operations VALUES (1770, 6, '2021-04-20 00:00:00', 382, 403, -0, NULL);
INSERT INTO storage.base_operations VALUES (1771, 1, '2021-04-20 00:00:00', 392, 412, -709, NULL);
INSERT INTO storage.base_operations VALUES (1771, 0, '2021-04-20 00:00:00', 442, 412, 709, NULL);
INSERT INTO storage.base_operations VALUES (1771, 3, '2021-04-20 00:00:00', 392, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1771, 4, '2021-04-20 00:00:00', 442, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1771, 5, '2021-04-20 00:00:00', 9, 412, 2, NULL);
INSERT INTO storage.base_operations VALUES (1771, 6, '2021-04-20 00:00:00', 442, 412, -2, NULL);
INSERT INTO storage.base_operations VALUES (1772, 1, '2021-04-20 00:00:00', 388, 405, -383, NULL);
INSERT INTO storage.base_operations VALUES (1772, 0, '2021-04-20 00:00:00', 445, 405, 383, NULL);
INSERT INTO storage.base_operations VALUES (1772, 3, '2021-04-20 00:00:00', 388, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1772, 4, '2021-04-20 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1772, 5, '2021-04-20 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1772, 6, '2021-04-20 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1773, 1, '2021-04-20 00:00:00', 392, 402, -80, NULL);
INSERT INTO storage.base_operations VALUES (1773, 0, '2021-04-20 00:00:00', 442, 402, 80, NULL);
INSERT INTO storage.base_operations VALUES (1773, 3, '2021-04-20 00:00:00', 392, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1773, 4, '2021-04-20 00:00:00', 442, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1773, 5, '2021-04-20 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1773, 6, '2021-04-20 00:00:00', 442, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1774, 1, '2021-04-20 00:00:00', 445, 402, -469, NULL);
INSERT INTO storage.base_operations VALUES (1774, 0, '2021-04-20 00:00:00', 392, 402, 469, NULL);
INSERT INTO storage.base_operations VALUES (1774, 3, '2021-04-20 00:00:00', 445, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1774, 4, '2021-04-20 00:00:00', 392, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1774, 5, '2021-04-20 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1774, 6, '2021-04-20 00:00:00', 392, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1775, 1, '2021-04-21 00:00:00', 445, 402, -525, NULL);
INSERT INTO storage.base_operations VALUES (1775, 0, '2021-04-21 00:00:00', 392, 402, 525, NULL);
INSERT INTO storage.base_operations VALUES (1775, 3, '2021-04-21 00:00:00', 445, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1775, 4, '2021-04-21 00:00:00', 392, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1775, 5, '2021-04-21 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1775, 6, '2021-04-21 00:00:00', 392, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1776, -1, '2021-04-20 00:00:00', 450, 454, 22, NULL);
INSERT INTO storage.base_operations VALUES (1777, 1, '2021-04-20 00:00:00', 450, 454, -22, NULL);
INSERT INTO storage.base_operations VALUES (1777, 0, '2021-04-20 00:00:00', 382, 454, 22, NULL);
INSERT INTO storage.base_operations VALUES (1777, 3, '2021-04-20 00:00:00', 450, 454, 0, NULL);
INSERT INTO storage.base_operations VALUES (1777, 4, '2021-04-20 00:00:00', 382, 454, -0, NULL);
INSERT INTO storage.base_operations VALUES (1777, 5, '2021-04-20 00:00:00', 9, 454, 0, NULL);
INSERT INTO storage.base_operations VALUES (1777, 6, '2021-04-20 00:00:00', 382, 454, -0, NULL);
INSERT INTO storage.base_operations VALUES (1778, -1, '2021-04-20 00:00:00', 382, 414, 1165, NULL);
INSERT INTO storage.base_operations VALUES (1779, -1, '2021-04-20 00:00:00', 382, 414, -1135, NULL);
INSERT INTO storage.base_operations VALUES (1780, -1, '2021-04-20 00:00:00', 385, 414, 30, NULL);
INSERT INTO storage.base_operations VALUES (1781, 1, '2021-04-20 00:00:00', 385, 414, -1135, NULL);
INSERT INTO storage.base_operations VALUES (1781, 0, '2021-04-20 00:00:00', 382, 414, 1135, NULL);
INSERT INTO storage.base_operations VALUES (1781, 3, '2021-04-20 00:00:00', 385, 414, 0, NULL);
INSERT INTO storage.base_operations VALUES (1781, 4, '2021-04-20 00:00:00', 382, 414, -0, NULL);
INSERT INTO storage.base_operations VALUES (1781, 5, '2021-04-20 00:00:00', 9, 414, 0, NULL);
INSERT INTO storage.base_operations VALUES (1781, 6, '2021-04-20 00:00:00', 382, 414, -0, NULL);
INSERT INTO storage.base_operations VALUES (1782, -1, '2021-04-20 00:00:00', 382, 414, -30, NULL);
INSERT INTO storage.base_operations VALUES (1783, -1, '2021-04-20 00:00:00', 384, 403, -50, NULL);
INSERT INTO storage.base_operations VALUES (1784, -1, '2021-04-20 00:00:00', 382, 403, -50, NULL);
INSERT INTO storage.base_operations VALUES (1785, 1, '2021-04-20 00:00:00', 442, 413, -1796, NULL);
INSERT INTO storage.base_operations VALUES (1785, 0, '2021-04-20 00:00:00', 393, 413, 1796, NULL);
INSERT INTO storage.base_operations VALUES (1785, 3, '2021-04-20 00:00:00', 442, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1785, 4, '2021-04-20 00:00:00', 393, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1785, 5, '2021-04-20 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1785, 6, '2021-04-20 00:00:00', 393, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1786, -1, '2021-04-20 00:00:00', 385, 414, -30, NULL);
INSERT INTO storage.base_operations VALUES (1787, -1, '2021-04-20 00:00:00', 384, 403, 50, NULL);
INSERT INTO storage.base_operations VALUES (1788, 1, '2021-04-21 00:00:00', 388, 405, -445, NULL);
INSERT INTO storage.base_operations VALUES (1788, 0, '2021-04-21 00:00:00', 445, 405, 445, NULL);
INSERT INTO storage.base_operations VALUES (1788, 3, '2021-04-21 00:00:00', 388, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1788, 4, '2021-04-21 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1788, 5, '2021-04-21 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1788, 6, '2021-04-21 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1789, 1, '2021-04-21 00:00:00', 390, 412, -198, NULL);
INSERT INTO storage.base_operations VALUES (1789, 0, '2021-04-21 00:00:00', 392, 412, 198, NULL);
INSERT INTO storage.base_operations VALUES (1789, 3, '2021-04-21 00:00:00', 390, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1789, 4, '2021-04-21 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1789, 5, '2021-04-21 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1789, 6, '2021-04-21 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1790, 1, '2021-04-21 00:00:00', 445, 402, -485, NULL);
INSERT INTO storage.base_operations VALUES (1790, 0, '2021-04-21 00:00:00', 392, 402, 485, NULL);
INSERT INTO storage.base_operations VALUES (1790, 3, '2021-04-21 00:00:00', 445, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1790, 4, '2021-04-21 00:00:00', 392, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1790, 5, '2021-04-21 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1790, 6, '2021-04-21 00:00:00', 392, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1791, 1, '2021-04-21 00:00:00', 382, 403, -680, NULL);
INSERT INTO storage.base_operations VALUES (1791, 0, '2021-04-21 00:00:00', 387, 403, 680, NULL);
INSERT INTO storage.base_operations VALUES (1791, 3, '2021-04-21 00:00:00', 382, 403, 0, NULL);
INSERT INTO storage.base_operations VALUES (1791, 4, '2021-04-21 00:00:00', 387, 403, -0, NULL);
INSERT INTO storage.base_operations VALUES (1791, 5, '2021-04-21 00:00:00', 9, 403, 0, NULL);
INSERT INTO storage.base_operations VALUES (1791, 6, '2021-04-21 00:00:00', 387, 403, -0, NULL);
INSERT INTO storage.base_operations VALUES (1792, 1, '2021-04-21 00:00:00', 382, 424, -3694, NULL);
INSERT INTO storage.base_operations VALUES (1792, 0, '2021-04-21 00:00:00', 388, 424, 3694, NULL);
INSERT INTO storage.base_operations VALUES (1792, 3, '2021-04-21 00:00:00', 382, 424, 0, NULL);
INSERT INTO storage.base_operations VALUES (1792, 4, '2021-04-21 00:00:00', 388, 424, -0, NULL);
INSERT INTO storage.base_operations VALUES (1792, 5, '2021-04-21 00:00:00', 9, 424, 0, NULL);
INSERT INTO storage.base_operations VALUES (1792, 6, '2021-04-21 00:00:00', 388, 424, -0, NULL);
INSERT INTO storage.base_operations VALUES (1793, 1, '2021-04-21 00:00:00', 445, 402, -480, NULL);
INSERT INTO storage.base_operations VALUES (1793, 0, '2021-04-21 00:00:00', 392, 402, 480, NULL);
INSERT INTO storage.base_operations VALUES (1793, 3, '2021-04-21 00:00:00', 445, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1793, 4, '2021-04-21 00:00:00', 392, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1793, 5, '2021-04-21 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1793, 6, '2021-04-21 00:00:00', 392, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1794, 1, '2021-04-21 00:00:00', 393, 404, -1257, NULL);
INSERT INTO storage.base_operations VALUES (1794, 0, '2021-04-21 00:00:00', 452, 404, 1257, NULL);
INSERT INTO storage.base_operations VALUES (1794, 3, '2021-04-21 00:00:00', 393, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1794, 4, '2021-04-21 00:00:00', 452, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1794, 5, '2021-04-21 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1794, 6, '2021-04-21 00:00:00', 452, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1795, 1, '2021-04-21 00:00:00', 392, 402, -1681, NULL);
INSERT INTO storage.base_operations VALUES (1795, 0, '2021-04-21 00:00:00', 442, 402, 1681, NULL);
INSERT INTO storage.base_operations VALUES (1795, 3, '2021-04-21 00:00:00', 392, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1795, 4, '2021-04-21 00:00:00', 442, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1795, 5, '2021-04-21 00:00:00', 9, 402, 28, NULL);
INSERT INTO storage.base_operations VALUES (1795, 6, '2021-04-21 00:00:00', 442, 402, -28, NULL);
INSERT INTO storage.base_operations VALUES (1796, 1, '2021-04-21 00:00:00', 442, 412, -2579, NULL);
INSERT INTO storage.base_operations VALUES (1796, 0, '2021-04-21 00:00:00', 393, 412, 2579, NULL);
INSERT INTO storage.base_operations VALUES (1796, 3, '2021-04-21 00:00:00', 442, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1796, 4, '2021-04-21 00:00:00', 393, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1796, 5, '2021-04-21 00:00:00', 9, 412, 25, NULL);
INSERT INTO storage.base_operations VALUES (1796, 6, '2021-04-21 00:00:00', 393, 412, -25, NULL);
INSERT INTO storage.base_operations VALUES (1797, 1, '2021-04-21 00:00:00', 445, 402, -560, NULL);
INSERT INTO storage.base_operations VALUES (1797, 0, '2021-04-21 00:00:00', 392, 402, 560, NULL);
INSERT INTO storage.base_operations VALUES (1797, 3, '2021-04-21 00:00:00', 445, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1797, 4, '2021-04-21 00:00:00', 392, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1797, 5, '2021-04-21 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1797, 6, '2021-04-21 00:00:00', 392, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1798, 1, '2021-04-21 00:00:00', 390, 412, -300, NULL);
INSERT INTO storage.base_operations VALUES (1798, 0, '2021-04-21 00:00:00', 392, 412, 300, NULL);
INSERT INTO storage.base_operations VALUES (1798, 3, '2021-04-21 00:00:00', 390, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1798, 4, '2021-04-21 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1798, 5, '2021-04-21 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1798, 6, '2021-04-21 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1799, -1, '2021-04-21 00:00:00', 384, 403, 753, NULL);
INSERT INTO storage.base_operations VALUES (1800, -1, '2021-04-21 00:00:00', 385, 414, 177, NULL);
INSERT INTO storage.base_operations VALUES (1801, 1, '2021-04-21 00:00:00', 384, 403, -753, NULL);
INSERT INTO storage.base_operations VALUES (1801, 0, '2021-04-21 00:00:00', 382, 403, 753, NULL);
INSERT INTO storage.base_operations VALUES (1801, 3, '2021-04-21 00:00:00', 384, 403, 0, NULL);
INSERT INTO storage.base_operations VALUES (1801, 4, '2021-04-21 00:00:00', 382, 403, -0, NULL);
INSERT INTO storage.base_operations VALUES (1801, 5, '2021-04-21 00:00:00', 9, 403, 0, NULL);
INSERT INTO storage.base_operations VALUES (1801, 6, '2021-04-21 00:00:00', 382, 403, -0, NULL);
INSERT INTO storage.base_operations VALUES (1802, 1, '2021-04-21 00:00:00', 385, 414, -177, NULL);
INSERT INTO storage.base_operations VALUES (1802, 0, '2021-04-21 00:00:00', 382, 414, 177, NULL);
INSERT INTO storage.base_operations VALUES (1802, 3, '2021-04-21 00:00:00', 385, 414, 0, NULL);
INSERT INTO storage.base_operations VALUES (1802, 4, '2021-04-21 00:00:00', 382, 414, -0, NULL);
INSERT INTO storage.base_operations VALUES (1802, 5, '2021-04-21 00:00:00', 9, 414, 0, NULL);
INSERT INTO storage.base_operations VALUES (1802, 6, '2021-04-21 00:00:00', 382, 414, -0, NULL);
INSERT INTO storage.base_operations VALUES (1803, 1, '2021-04-22 00:00:00', 442, 413, -1381, NULL);
INSERT INTO storage.base_operations VALUES (1803, 0, '2021-04-22 00:00:00', 393, 413, 1381, NULL);
INSERT INTO storage.base_operations VALUES (1803, 3, '2021-04-22 00:00:00', 442, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1803, 4, '2021-04-22 00:00:00', 393, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1803, 5, '2021-04-22 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1803, 6, '2021-04-22 00:00:00', 393, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1804, 1, '2021-04-22 00:00:00', 442, 413, -86, NULL);
INSERT INTO storage.base_operations VALUES (1804, 0, '2021-04-22 00:00:00', 393, 413, 86, NULL);
INSERT INTO storage.base_operations VALUES (1804, 3, '2021-04-22 00:00:00', 442, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1804, 4, '2021-04-22 00:00:00', 393, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1804, 5, '2021-04-22 00:00:00', 9, 413, 6, NULL);
INSERT INTO storage.base_operations VALUES (1804, 6, '2021-04-22 00:00:00', 393, 413, -6, NULL);
INSERT INTO storage.base_operations VALUES (1805, 1, '2021-04-22 00:00:00', 388, 405, -462, NULL);
INSERT INTO storage.base_operations VALUES (1805, 0, '2021-04-22 00:00:00', 445, 405, 462, NULL);
INSERT INTO storage.base_operations VALUES (1805, 3, '2021-04-22 00:00:00', 388, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1805, 4, '2021-04-22 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1805, 5, '2021-04-22 00:00:00', 9, 405, 0, NULL);
INSERT INTO storage.base_operations VALUES (1805, 6, '2021-04-22 00:00:00', 445, 405, -0, NULL);
INSERT INTO storage.base_operations VALUES (1806, 1, '2021-04-22 00:00:00', 392, 402, -1157, NULL);
INSERT INTO storage.base_operations VALUES (1806, 0, '2021-04-22 00:00:00', 442, 402, 1157, NULL);
INSERT INTO storage.base_operations VALUES (1806, 3, '2021-04-22 00:00:00', 392, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1806, 4, '2021-04-22 00:00:00', 442, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1806, 5, '2021-04-22 00:00:00', 9, 402, 6, NULL);
INSERT INTO storage.base_operations VALUES (1806, 6, '2021-04-22 00:00:00', 442, 402, -6, NULL);
INSERT INTO storage.base_operations VALUES (1807, 1, '2021-04-22 00:00:00', 392, 402, -10, NULL);
INSERT INTO storage.base_operations VALUES (1807, 0, '2021-04-22 00:00:00', 455, 402, 10, NULL);
INSERT INTO storage.base_operations VALUES (1807, 3, '2021-04-22 00:00:00', 392, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1807, 4, '2021-04-22 00:00:00', 455, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1807, 5, '2021-04-22 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1807, 6, '2021-04-22 00:00:00', 455, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1808, 1, '2021-04-22 00:00:00', 445, 402, -799, NULL);
INSERT INTO storage.base_operations VALUES (1808, 0, '2021-04-22 00:00:00', 392, 402, 799, NULL);
INSERT INTO storage.base_operations VALUES (1808, 3, '2021-04-22 00:00:00', 445, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1808, 4, '2021-04-22 00:00:00', 392, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1808, 5, '2021-04-22 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1808, 6, '2021-04-22 00:00:00', 392, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1809, 1, '2021-04-22 00:00:00', 390, 412, -220, NULL);
INSERT INTO storage.base_operations VALUES (1809, 0, '2021-04-22 00:00:00', 392, 412, 220, NULL);
INSERT INTO storage.base_operations VALUES (1809, 3, '2021-04-22 00:00:00', 390, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1809, 4, '2021-04-22 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1809, 5, '2021-04-22 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1809, 6, '2021-04-22 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1810, -1, '2021-04-22 00:00:00', 385, 414, 79, NULL);
INSERT INTO storage.base_operations VALUES (1811, 1, '2021-04-22 00:00:00', 385, 414, -79, NULL);
INSERT INTO storage.base_operations VALUES (1811, 0, '2021-04-22 00:00:00', 382, 414, 79, NULL);
INSERT INTO storage.base_operations VALUES (1811, 3, '2021-04-22 00:00:00', 385, 414, 0, NULL);
INSERT INTO storage.base_operations VALUES (1811, 4, '2021-04-22 00:00:00', 382, 414, -0, NULL);
INSERT INTO storage.base_operations VALUES (1811, 5, '2021-04-22 00:00:00', 9, 414, 0, NULL);
INSERT INTO storage.base_operations VALUES (1811, 6, '2021-04-22 00:00:00', 382, 414, -0, NULL);
INSERT INTO storage.base_operations VALUES (1812, 1, '2021-04-22 00:00:00', 393, 404, -1011, NULL);
INSERT INTO storage.base_operations VALUES (1812, 0, '2021-04-22 00:00:00', 452, 404, 1011, NULL);
INSERT INTO storage.base_operations VALUES (1812, 3, '2021-04-22 00:00:00', 393, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1812, 4, '2021-04-22 00:00:00', 452, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1812, 5, '2021-04-22 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1812, 6, '2021-04-22 00:00:00', 452, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1813, -1, '2021-04-22 00:00:00', 384, 403, 251, NULL);
INSERT INTO storage.base_operations VALUES (1814, 1, '2021-04-22 00:00:00', 384, 403, -251, NULL);
INSERT INTO storage.base_operations VALUES (1814, 0, '2021-04-22 00:00:00', 382, 403, 251, NULL);
INSERT INTO storage.base_operations VALUES (1814, 3, '2021-04-22 00:00:00', 384, 403, 0, NULL);
INSERT INTO storage.base_operations VALUES (1814, 4, '2021-04-22 00:00:00', 382, 403, -0, NULL);
INSERT INTO storage.base_operations VALUES (1814, 5, '2021-04-22 00:00:00', 9, 403, 0, NULL);
INSERT INTO storage.base_operations VALUES (1814, 6, '2021-04-22 00:00:00', 382, 403, -0, NULL);
INSERT INTO storage.base_operations VALUES (1815, 1, '2021-04-22 00:00:00', 389, 404, -8, NULL);
INSERT INTO storage.base_operations VALUES (1815, 0, '2021-04-22 00:00:00', 455, 404, 8, NULL);
INSERT INTO storage.base_operations VALUES (1815, 3, '2021-04-22 00:00:00', 389, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1815, 4, '2021-04-22 00:00:00', 455, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1815, 5, '2021-04-22 00:00:00', 9, 404, 0, NULL);
INSERT INTO storage.base_operations VALUES (1815, 6, '2021-04-22 00:00:00', 455, 404, -0, NULL);
INSERT INTO storage.base_operations VALUES (1816, 1, '2021-04-22 00:00:00', 391, 413, -27, NULL);
INSERT INTO storage.base_operations VALUES (1816, 0, '2021-04-22 00:00:00', 455, 413, 27, NULL);
INSERT INTO storage.base_operations VALUES (1816, 3, '2021-04-22 00:00:00', 391, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1816, 4, '2021-04-22 00:00:00', 455, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1816, 5, '2021-04-22 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1816, 6, '2021-04-22 00:00:00', 455, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1817, 1, '2021-04-22 00:00:00', 445, 402, -1080, NULL);
INSERT INTO storage.base_operations VALUES (1817, 0, '2021-04-22 00:00:00', 392, 402, 1080, NULL);
INSERT INTO storage.base_operations VALUES (1817, 3, '2021-04-22 00:00:00', 445, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1817, 4, '2021-04-22 00:00:00', 392, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1817, 5, '2021-04-22 00:00:00', 9, 402, 51, NULL);
INSERT INTO storage.base_operations VALUES (1817, 6, '2021-04-22 00:00:00', 392, 402, -51, NULL);
INSERT INTO storage.base_operations VALUES (1818, 1, '2021-04-22 00:00:00', 390, 417, -653, NULL);
INSERT INTO storage.base_operations VALUES (1818, 0, '2021-04-22 00:00:00', 445, 417, 653, NULL);
INSERT INTO storage.base_operations VALUES (1818, 3, '2021-04-22 00:00:00', 390, 417, 0, NULL);
INSERT INTO storage.base_operations VALUES (1818, 4, '2021-04-22 00:00:00', 445, 417, -0, NULL);
INSERT INTO storage.base_operations VALUES (1818, 5, '2021-04-22 00:00:00', 9, 417, 0, NULL);
INSERT INTO storage.base_operations VALUES (1818, 6, '2021-04-22 00:00:00', 445, 417, -0, NULL);
INSERT INTO storage.base_operations VALUES (1819, 1, '2021-04-22 00:00:00', 392, 402, -1151, NULL);
INSERT INTO storage.base_operations VALUES (1819, 0, '2021-04-22 00:00:00', 442, 402, 1151, NULL);
INSERT INTO storage.base_operations VALUES (1819, 3, '2021-04-22 00:00:00', 392, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1819, 4, '2021-04-22 00:00:00', 442, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1819, 5, '2021-04-22 00:00:00', 9, 402, 5, NULL);
INSERT INTO storage.base_operations VALUES (1819, 6, '2021-04-22 00:00:00', 442, 402, -5, NULL);
INSERT INTO storage.base_operations VALUES (1820, 1, '2021-04-22 00:00:00', 392, 402, -6, NULL);
INSERT INTO storage.base_operations VALUES (1820, 0, '2021-04-22 00:00:00', 455, 402, 6, NULL);
INSERT INTO storage.base_operations VALUES (1820, 3, '2021-04-22 00:00:00', 392, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1820, 4, '2021-04-22 00:00:00', 455, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1820, 5, '2021-04-22 00:00:00', 9, 402, 0, NULL);
INSERT INTO storage.base_operations VALUES (1820, 6, '2021-04-22 00:00:00', 455, 402, -0, NULL);
INSERT INTO storage.base_operations VALUES (1821, 1, '2021-04-22 00:00:00', 387, 403, -480, NULL);
INSERT INTO storage.base_operations VALUES (1821, 0, '2021-04-22 00:00:00', 445, 403, 480, NULL);
INSERT INTO storage.base_operations VALUES (1821, 3, '2021-04-22 00:00:00', 387, 403, 0, NULL);
INSERT INTO storage.base_operations VALUES (1821, 4, '2021-04-22 00:00:00', 445, 403, -0, NULL);
INSERT INTO storage.base_operations VALUES (1821, 5, '2021-04-22 00:00:00', 9, 403, 0, NULL);
INSERT INTO storage.base_operations VALUES (1821, 6, '2021-04-22 00:00:00', 445, 403, -0, NULL);
INSERT INTO storage.base_operations VALUES (1823, -1, '2021-04-22 00:00:00', 384, 403, 656, NULL);
INSERT INTO storage.base_operations VALUES (1824, -1, '2021-04-22 00:00:00', 450, 456, 664, NULL);
INSERT INTO storage.base_operations VALUES (1825, 1, '2021-04-22 00:00:00', 384, 403, -656, NULL);
INSERT INTO storage.base_operations VALUES (1825, 0, '2021-04-22 00:00:00', 382, 403, 656, NULL);
INSERT INTO storage.base_operations VALUES (1825, 3, '2021-04-22 00:00:00', 384, 403, 0, NULL);
INSERT INTO storage.base_operations VALUES (1825, 4, '2021-04-22 00:00:00', 382, 403, -0, NULL);
INSERT INTO storage.base_operations VALUES (1825, 5, '2021-04-22 00:00:00', 9, 403, 0, NULL);
INSERT INTO storage.base_operations VALUES (1825, 6, '2021-04-22 00:00:00', 382, 403, -0, NULL);
INSERT INTO storage.base_operations VALUES (1826, 1, '2021-04-22 00:00:00', 450, 456, -664, NULL);
INSERT INTO storage.base_operations VALUES (1826, 0, '2021-04-22 00:00:00', 382, 456, 664, NULL);
INSERT INTO storage.base_operations VALUES (1826, 3, '2021-04-22 00:00:00', 450, 456, 0, NULL);
INSERT INTO storage.base_operations VALUES (1826, 4, '2021-04-22 00:00:00', 382, 456, -0, NULL);
INSERT INTO storage.base_operations VALUES (1826, 5, '2021-04-22 00:00:00', 9, 456, 0, NULL);
INSERT INTO storage.base_operations VALUES (1826, 6, '2021-04-22 00:00:00', 382, 456, -0, NULL);
INSERT INTO storage.base_operations VALUES (1827, -1, '2021-04-22 00:00:00', 385, 457, 621, NULL);
INSERT INTO storage.base_operations VALUES (1828, 1, '2021-04-22 00:00:00', 385, 457, -621, NULL);
INSERT INTO storage.base_operations VALUES (1828, 0, '2021-04-22 00:00:00', 382, 457, 621, NULL);
INSERT INTO storage.base_operations VALUES (1828, 3, '2021-04-22 00:00:00', 385, 457, 0, NULL);
INSERT INTO storage.base_operations VALUES (1828, 4, '2021-04-22 00:00:00', 382, 457, -0, NULL);
INSERT INTO storage.base_operations VALUES (1828, 5, '2021-04-22 00:00:00', 9, 457, 0, NULL);
INSERT INTO storage.base_operations VALUES (1828, 6, '2021-04-22 00:00:00', 382, 457, -0, NULL);
INSERT INTO storage.base_operations VALUES (1822, 1, '2021-04-22 00:00:00', 392, 412, -440, NULL);
INSERT INTO storage.base_operations VALUES (1822, 0, '2021-04-22 00:00:00', 442, 412, 440, NULL);
INSERT INTO storage.base_operations VALUES (1822, 3, '2021-04-22 00:00:00', 392, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1822, 4, '2021-04-22 00:00:00', 442, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1822, 5, '2021-04-22 00:00:00', 9, 412, 3, NULL);
INSERT INTO storage.base_operations VALUES (1822, 6, '2021-04-22 00:00:00', 442, 412, -3, NULL);
INSERT INTO storage.base_operations VALUES (1829, 1, '2021-04-23 00:00:00', 390, 412, -4, NULL);
INSERT INTO storage.base_operations VALUES (1829, 0, '2021-04-23 00:00:00', 392, 412, 4, NULL);
INSERT INTO storage.base_operations VALUES (1829, 3, '2021-04-23 00:00:00', 390, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1829, 4, '2021-04-23 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1829, 5, '2021-04-23 00:00:00', 9, 412, 0, NULL);
INSERT INTO storage.base_operations VALUES (1829, 6, '2021-04-23 00:00:00', 392, 412, -0, NULL);
INSERT INTO storage.base_operations VALUES (1830, 1, '2021-04-23 00:00:00', 390, 417, -406, NULL);
INSERT INTO storage.base_operations VALUES (1830, 0, '2021-04-23 00:00:00', 445, 417, 406, NULL);
INSERT INTO storage.base_operations VALUES (1830, 3, '2021-04-23 00:00:00', 390, 417, 0, NULL);
INSERT INTO storage.base_operations VALUES (1830, 4, '2021-04-23 00:00:00', 445, 417, -0, NULL);
INSERT INTO storage.base_operations VALUES (1830, 5, '2021-04-23 00:00:00', 9, 417, 0, NULL);
INSERT INTO storage.base_operations VALUES (1830, 6, '2021-04-23 00:00:00', 445, 417, -0, NULL);
INSERT INTO storage.base_operations VALUES (1831, 1, '2021-04-23 00:00:00', 382, 403, -907, NULL);
INSERT INTO storage.base_operations VALUES (1831, 0, '2021-04-23 00:00:00', 387, 403, 907, NULL);
INSERT INTO storage.base_operations VALUES (1831, 3, '2021-04-23 00:00:00', 382, 403, 0, NULL);
INSERT INTO storage.base_operations VALUES (1831, 4, '2021-04-23 00:00:00', 387, 403, -0, NULL);
INSERT INTO storage.base_operations VALUES (1831, 5, '2021-04-23 00:00:00', 9, 403, 0, NULL);
INSERT INTO storage.base_operations VALUES (1831, 6, '2021-04-23 00:00:00', 387, 403, -0, NULL);
INSERT INTO storage.base_operations VALUES (1832, -1, '2021-04-22 00:00:00', 385, 413, 61, NULL);
INSERT INTO storage.base_operations VALUES (1833, 1, '2021-04-22 00:00:00', 385, 413, -61, NULL);
INSERT INTO storage.base_operations VALUES (1833, 0, '2021-04-22 00:00:00', 382, 413, 61, NULL);
INSERT INTO storage.base_operations VALUES (1833, 3, '2021-04-22 00:00:00', 385, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1833, 4, '2021-04-22 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1833, 5, '2021-04-22 00:00:00', 9, 413, 0, NULL);
INSERT INTO storage.base_operations VALUES (1833, 6, '2021-04-22 00:00:00', 382, 413, -0, NULL);
INSERT INTO storage.base_operations VALUES (1834, 1, '2021-04-23 00:00:00', 392, 416, -4, NULL);
INSERT INTO storage.base_operations VALUES (1834, 0, '2021-04-23 00:00:00', 442, 416, 4, NULL);
INSERT INTO storage.base_operations VALUES (1834, 3, '2021-04-23 00:00:00', 392, 416, 0, NULL);
INSERT INTO storage.base_operations VALUES (1834, 4, '2021-04-23 00:00:00', 442, 416, -0, NULL);
INSERT INTO storage.base_operations VALUES (1834, 5, '2021-04-23 00:00:00', 9, 416, 0, NULL);
INSERT INTO storage.base_operations VALUES (1834, 6, '2021-04-23 00:00:00', 442, 416, -0, NULL);


--
-- Data for Name: documents; Type: TABLE DATA; Schema: storage; Owner: sansa
--



--
-- Data for Name: operations; Type: TABLE DATA; Schema: storage; Owner: sansa
--



--
-- Data for Name: operations_by_doc; Type: TABLE DATA; Schema: storage; Owner: sansa
--



--
-- Data for Name: operations_complex; Type: TABLE DATA; Schema: storage; Owner: sansa
--

INSERT INTO storage.operations_complex VALUES (1359, '2021-03-29', 385, 382, 410, 876, 0, 0);
INSERT INTO storage.operations_complex VALUES (1360, '2021-03-29', 384, 382, 399, 1605, 0, 0);
INSERT INTO storage.operations_complex VALUES (1361, '2021-03-29', 382, 387, 410, 980, 0, 0);
INSERT INTO storage.operations_complex VALUES (1362, '2021-03-29', 387, 445, 410, 966, 0, 0);
INSERT INTO storage.operations_complex VALUES (1363, '2021-03-29', 445, 392, 410, 966, 0, 0);
INSERT INTO storage.operations_complex VALUES (1377, '2021-03-29', 384, 382, 410, 306, 0, 0);
INSERT INTO storage.operations_complex VALUES (1378, '2021-03-29', 382, 387, 410, 306, 0, 0);
INSERT INTO storage.operations_complex VALUES (1379, '2021-03-29', 387, 392, 410, 295, 11, 0);
INSERT INTO storage.operations_complex VALUES (1380, '2021-03-29', 382, 387, 399, 303, 0, 0);
INSERT INTO storage.operations_complex VALUES (1381, '2021-03-29', 382, 387, 399, 286, 0, 0);
INSERT INTO storage.operations_complex VALUES (1382, '2021-03-29', 382, 389, 399, 444, 0, 0);
INSERT INTO storage.operations_complex VALUES (1383, '2021-03-29', 382, 389, 426, 572, 0, 0);
INSERT INTO storage.operations_complex VALUES (1385, '2021-03-29', 382, 389, 399, 572, 0, 0);
INSERT INTO storage.operations_complex VALUES (1387, '2021-03-30', 384, 382, 404, 503, 0, 0);
INSERT INTO storage.operations_complex VALUES (1388, '2021-03-30', 389, 392, 399, 952, 0, 0);
INSERT INTO storage.operations_complex VALUES (1389, '2021-03-30', 387, 392, 399, 480, 0, 0);
INSERT INTO storage.operations_complex VALUES (1390, '2021-03-30', 445, 392, 410, 360, 0, 0);
INSERT INTO storage.operations_complex VALUES (1391, '2021-03-30', 445, 392, 410, 433, 0, 0);
INSERT INTO storage.operations_complex VALUES (1392, '2021-03-30', 392, 442, 410, 311, 0, 0);
INSERT INTO storage.operations_complex VALUES (1393, '2021-03-30', 392, 442, 415, 320, 0, 0);
INSERT INTO storage.operations_complex VALUES (1394, '2021-03-30', 392, 442, 430, 800, 0, 0);
INSERT INTO storage.operations_complex VALUES (1395, '2021-03-30', 392, 442, 431, 179, 0, 0);
INSERT INTO storage.operations_complex VALUES (1396, '2021-03-30', 392, 442, 398, 387, 0, 0);
INSERT INTO storage.operations_complex VALUES (1397, '2021-03-30', 392, 442, 430, 243, 0, 0);
INSERT INTO storage.operations_complex VALUES (1398, '2021-03-30', 392, 442, 412, 279, 0, 0);
INSERT INTO storage.operations_complex VALUES (1399, '2021-03-30', 389, 442, 399, 64, 0, 0);
INSERT INTO storage.operations_complex VALUES (1400, '2021-03-30', 387, 442, 399, 98, 0, 0);
INSERT INTO storage.operations_complex VALUES (1401, '2021-03-30', 391, 392, 415, 190, 0, 0);
INSERT INTO storage.operations_complex VALUES (1411, '2021-03-30', 442, 393, 410, 5044, 0, 0);
INSERT INTO storage.operations_complex VALUES (1412, '2021-03-30', 391, 392, 415, 241, 0, 0);
INSERT INTO storage.operations_complex VALUES (1414, '2021-03-31', 384, 382, 404, 848, 0, 0);
INSERT INTO storage.operations_complex VALUES (1415, '2021-03-31', 385, 382, 413, 963, 0, 0);
INSERT INTO storage.operations_complex VALUES (1416, '2021-03-31', 389, 392, 404, 181, 1, 0);
INSERT INTO storage.operations_complex VALUES (1418, '2021-03-31', 391, 392, 415, 240, 0, 0);
INSERT INTO storage.operations_complex VALUES (1420, '2021-03-31', 391, 392, 415, 242, 2, 0);
INSERT INTO storage.operations_complex VALUES (1422, '2021-04-01', 384, 382, 404, 962, 0, 0);
INSERT INTO storage.operations_complex VALUES (1423, '2021-04-01', 385, 382, 413, 1300, 0, 0);
INSERT INTO storage.operations_complex VALUES (1424, '2021-04-01', 389, 392, 404, 820, 0, 0);
INSERT INTO storage.operations_complex VALUES (1425, '2021-04-01', 391, 392, 415, 252, 1, 0);
INSERT INTO storage.operations_complex VALUES (1428, '2021-04-01', 391, 392, 415, 240, 0, 0);
INSERT INTO storage.operations_complex VALUES (1430, '2021-04-01', 392, 442, 430, 19, 0, 0);
INSERT INTO storage.operations_complex VALUES (1432, '2021-04-01', 382, 389, 404, 962, 0, 0);
INSERT INTO storage.operations_complex VALUES (1433, '2021-04-01', 391, 392, 415, 219, 0, 0);
INSERT INTO storage.operations_complex VALUES (1435, '2021-04-01', 389, 392, 404, 350, 2, 0);
INSERT INTO storage.operations_complex VALUES (1436, '2021-04-01', 392, 442, 415, 240, 0, 0);
INSERT INTO storage.operations_complex VALUES (1437, '2021-04-01', 382, 391, 413, 360, 0, 0);
INSERT INTO storage.operations_complex VALUES (1438, '2021-04-01', 392, 442, 410, 796, 0, 0);
INSERT INTO storage.operations_complex VALUES (1439, '2021-04-01', 392, 442, 415, 640, 0, 0);
INSERT INTO storage.operations_complex VALUES (1440, '2021-04-01', 392, 442, 399, 1588, 0, 0);
INSERT INTO storage.operations_complex VALUES (1441, '2021-04-01', 392, 442, 404, 960, 0, 0);
INSERT INTO storage.operations_complex VALUES (1443, '2021-04-01', 392, 442, 415, 320, 0, 0);
INSERT INTO storage.operations_complex VALUES (1444, '2021-04-02', 385, 382, 413, 1184, 0, 0);
INSERT INTO storage.operations_complex VALUES (1445, '2021-04-02', 384, 382, 404, 832, 0, 0);
INSERT INTO storage.operations_complex VALUES (1446, '2021-04-02', 382, 391, 413, 680, 0, 0);
INSERT INTO storage.operations_complex VALUES (1447, '2021-04-02', 391, 392, 413, 359, 0, 0);
INSERT INTO storage.operations_complex VALUES (1448, '2021-04-02', 389, 442, 404, 900, 0, 0);
INSERT INTO storage.operations_complex VALUES (1449, '2021-04-02', 445, 392, 429, 525, 0, 0);
INSERT INTO storage.operations_complex VALUES (1452, '2021-04-02', 392, 442, 415, 279, 0, 0);
INSERT INTO storage.operations_complex VALUES (1454, '2021-04-02', 391, 392, 413, 682, 2, 0);
INSERT INTO storage.operations_complex VALUES (1456, '2021-04-02', 392, 442, 426, 240, 0, 0);
INSERT INTO storage.operations_complex VALUES (1458, '2021-04-02', 392, 442, 415, 698, 0, 0);
INSERT INTO storage.operations_complex VALUES (1460, '2021-04-02', 442, 393, 407, 3182, 0, 0);
INSERT INTO storage.operations_complex VALUES (1461, '2021-04-02', 442, 393, 408, 984, 0, 0);
INSERT INTO storage.operations_complex VALUES (1462, '2021-04-02', 392, 442, 404, 480, 0, 0);
INSERT INTO storage.operations_complex VALUES (1463, '2021-04-02', 392, 442, 415, 147, 0, 0);
INSERT INTO storage.operations_complex VALUES (1464, '2021-04-02', 389, 392, 404, 464, 0, 0);
INSERT INTO storage.operations_complex VALUES (1465, '2021-04-02', 382, 391, 413, 1722, 0, 0);
INSERT INTO storage.operations_complex VALUES (1468, '2021-04-02', 382, 389, 404, 464, 0, 0);
INSERT INTO storage.operations_complex VALUES (1476, '2021-04-05', 385, 382, 413, 3591, 0, 0);
INSERT INTO storage.operations_complex VALUES (1477, '2021-04-05', 384, 382, 404, 2377, 0, 0);
INSERT INTO storage.operations_complex VALUES (1478, '2021-04-05', 382, 391, 413, 684, 0, 0);
INSERT INTO storage.operations_complex VALUES (1479, '2021-04-05', 391, 392, 413, 2405, 3, 0);
INSERT INTO storage.operations_complex VALUES (1480, '2021-04-05', 382, 389, 404, 432, 0, 0);
INSERT INTO storage.operations_complex VALUES (1481, '2021-04-05', 389, 392, 404, 432, 0, 0);
INSERT INTO storage.operations_complex VALUES (1482, '2021-04-05', 382, 389, 404, 747, 0, 0);
INSERT INTO storage.operations_complex VALUES (1483, '2021-04-05', 382, 391, 413, 500, 0, 0);
INSERT INTO storage.operations_complex VALUES (1484, '2021-04-05', 389, 392, 404, 431, 1, 0);
INSERT INTO storage.operations_complex VALUES (1485, '2021-04-05', 393, 448, 407, 3096, 0, 0);
INSERT INTO storage.operations_complex VALUES (1486, '2021-04-05', 393, 448, 410, 1713, 0, 0);
INSERT INTO storage.operations_complex VALUES (1487, '2021-04-05', 393, 448, 408, 954, 0, 0);
INSERT INTO storage.operations_complex VALUES (1488, '2021-04-05', 442, 393, 444, 1881, 0, 0);
INSERT INTO storage.operations_complex VALUES (1489, '2021-04-05', 442, 393, 410, 796, 0, 0);
INSERT INTO storage.operations_complex VALUES (1490, '2021-04-05', 442, 393, 443, 2134, 0, 0);
INSERT INTO storage.operations_complex VALUES (1491, '2021-04-05', 442, 393, 399, 1591, 0, 0);
INSERT INTO storage.operations_complex VALUES (1494, '2021-04-06', 393, 448, 410, 3287, 0, 0);
INSERT INTO storage.operations_complex VALUES (1495, '2021-04-06', 382, 389, 404, 800, 0, 0);
INSERT INTO storage.operations_complex VALUES (1498, '2021-04-06', 385, 382, 413, 1114, 0, 0);
INSERT INTO storage.operations_complex VALUES (1499, '2021-04-06', 391, 392, 413, 499, 0, 0);
INSERT INTO storage.operations_complex VALUES (1500, '2021-04-06', 389, 392, 404, 1116, 1, 0);
INSERT INTO storage.operations_complex VALUES (1501, '2021-04-06', 392, 442, 404, 480, 0, 0);
INSERT INTO storage.operations_complex VALUES (1502, '2021-04-06', 382, 389, 404, 442, 0, 0);
INSERT INTO storage.operations_complex VALUES (1503, '2021-04-06', 382, 391, 413, 552, 0, 0);
INSERT INTO storage.operations_complex VALUES (1504, '2021-04-06', 392, 442, 404, 480, 0, 0);
INSERT INTO storage.operations_complex VALUES (1505, '2021-04-06', 384, 392, 449, 550, 0, 0);
INSERT INTO storage.operations_complex VALUES (1506, '2021-04-06', 392, 442, 449, 120, 0, 0);
INSERT INTO storage.operations_complex VALUES (1507, '2021-04-06', 392, 442, 413, 577, 2, 0);
INSERT INTO storage.operations_complex VALUES (1508, '2021-04-06', 392, 442, 449, 120, 0, 0);
INSERT INTO storage.operations_complex VALUES (1509, '2021-04-06', 382, 391, 413, 641, 0, 0);
INSERT INTO storage.operations_complex VALUES (1510, '2021-04-06', 392, 442, 449, 120, 0, 0);
INSERT INTO storage.operations_complex VALUES (1511, '2021-04-06', 391, 392, 413, 552, 1, 0);
INSERT INTO storage.operations_complex VALUES (1512, '2021-04-06', 393, 448, 443, 2114, 0, 0);
INSERT INTO storage.operations_complex VALUES (1513, '2021-04-06', 393, 448, 444, 506, 0, 0);
INSERT INTO storage.operations_complex VALUES (1514, '2021-04-06', 392, 442, 449, 120, 0, 0);
INSERT INTO storage.operations_complex VALUES (1515, '2021-04-07', 382, 391, 413, 538, 0, 0);
INSERT INTO storage.operations_complex VALUES (1516, '2021-04-07', 382, 389, 404, 388, 0, 0);
INSERT INTO storage.operations_complex VALUES (1517, '2021-04-07', 450, 382, 451, 3600, 0, 0);
INSERT INTO storage.operations_complex VALUES (1518, '2021-04-07', 382, 442, 451, 3600, 0, 0);
INSERT INTO storage.operations_complex VALUES (1519, '2021-04-07', 442, 448, 451, 3600, 0, 0);
INSERT INTO storage.operations_complex VALUES (1520, '2021-04-06', 450, 382, 451, 617, 0, 0);
INSERT INTO storage.operations_complex VALUES (1521, '2021-04-06', 385, 382, 413, 1154, 0, 0);
INSERT INTO storage.operations_complex VALUES (1522, '2021-04-06', 384, 442, 449, 737, 0, 0);
INSERT INTO storage.operations_complex VALUES (1523, '2021-04-06', 391, 392, 413, 641, 0, 0);
INSERT INTO storage.operations_complex VALUES (1524, '2021-04-06', 389, 392, 404, 462, 0, 0);
INSERT INTO storage.operations_complex VALUES (1525, '2021-04-06', 392, 442, 413, 788, 0, 0);
INSERT INTO storage.operations_complex VALUES (1526, '2021-04-06', 392, 442, 404, 329, 18, 0);
INSERT INTO storage.operations_complex VALUES (1527, '2021-04-06', 386, 392, 446, 551, 0, 0);
INSERT INTO storage.operations_complex VALUES (1528, '2021-04-06', 392, 442, 446, 368, 0, 0);
INSERT INTO storage.operations_complex VALUES (1529, '2021-04-07', 389, 392, 404, 388, 0, 0);
INSERT INTO storage.operations_complex VALUES (1531, '2021-04-07', 392, 442, 449, 87, 0, 0);
INSERT INTO storage.operations_complex VALUES (1532, '2021-04-07', 392, 442, 446, 182, 0, 0);
INSERT INTO storage.operations_complex VALUES (1534, '2021-04-07', 391, 392, 413, 538, 1, 0);
INSERT INTO storage.operations_complex VALUES (1535, '2021-04-07', 442, 393, 409, 2094, 0, 0);
INSERT INTO storage.operations_complex VALUES (1536, '2021-04-07', 392, 442, 413, 600, 0, 0);
INSERT INTO storage.operations_complex VALUES (1537, '2021-04-07', 382, 391, 413, 1734, 0, 0);
INSERT INTO storage.operations_complex VALUES (1538, '2021-04-07', 385, 382, 413, 1350, 0, 0);
INSERT INTO storage.operations_complex VALUES (1539, '2021-04-07', 391, 392, 413, 536, 0, 0);
INSERT INTO storage.operations_complex VALUES (1540, '2021-04-07', 392, 442, 413, 601, 3, 0);
INSERT INTO storage.operations_complex VALUES (1541, '2021-04-07', 450, 382, 451, 687, 0, 0);
INSERT INTO storage.operations_complex VALUES (1542, '2021-04-07', 384, 382, 449, 885, 0, 0);
INSERT INTO storage.operations_complex VALUES (1543, '2021-04-07', 382, 392, 449, 885, 0, 0);
INSERT INTO storage.operations_complex VALUES (1544, '2021-04-08', 385, 382, 413, 70, 0, 0);
INSERT INTO storage.operations_complex VALUES (1545, '2021-04-07', 393, 448, 444, 1367, 0, 0);
INSERT INTO storage.operations_complex VALUES (1546, '2021-04-07', 393, 448, 399, 1000, 0, 0);
INSERT INTO storage.operations_complex VALUES (1547, '2021-04-08', 393, 448, 410, 790, 0, 0);
INSERT INTO storage.operations_complex VALUES (1548, '2021-04-08', 393, 448, 399, 533, 0, 0);
INSERT INTO storage.operations_complex VALUES (1549, '2021-04-08', 442, 393, 431, 1378, 0, 0);
INSERT INTO storage.operations_complex VALUES (1550, '2021-04-08', 382, 391, 413, 678, 0, 0);
INSERT INTO storage.operations_complex VALUES (1551, '2021-04-08', 382, 391, 413, 70, 0, 0);
INSERT INTO storage.operations_complex VALUES (1552, '2021-04-08', 391, 392, 413, 698, 0, 4);
INSERT INTO storage.operations_complex VALUES (1553, '2021-04-08', 392, 442, 449, 600, 0, 0);
INSERT INTO storage.operations_complex VALUES (1554, '2021-04-08', 392, 442, 449, 120, 0, 0);
INSERT INTO storage.operations_complex VALUES (1555, '2021-04-08', 391, 392, 413, 70, 0, 0);
INSERT INTO storage.operations_complex VALUES (1556, '2021-04-08', 382, 391, 413, 672, 0, 0);
INSERT INTO storage.operations_complex VALUES (1557, '2021-04-08', 385, 382, 402, 1140, 0, 0);
INSERT INTO storage.operations_complex VALUES (1558, '2021-04-08', 392, 442, 404, 1175, 7, 8);
INSERT INTO storage.operations_complex VALUES (1559, '2021-04-08', 391, 392, 413, 678, 0, 0);
INSERT INTO storage.operations_complex VALUES (1560, '2021-04-08', 392, 389, 404, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (1561, '2021-04-08', 450, 382, 451, 709, 0, 0);
INSERT INTO storage.operations_complex VALUES (1563, '2021-04-05', 382, 389, 404, 432, 0, 0);
INSERT INTO storage.operations_complex VALUES (1564, '2021-04-05', 389, 392, 404, 432, 0, 0);
INSERT INTO storage.operations_complex VALUES (1567, '2021-04-05', 384, 382, 404, 432, 0, 0);
INSERT INTO storage.operations_complex VALUES (1572, '2021-04-09', 392, 442, 449, 480, 0, 0);
INSERT INTO storage.operations_complex VALUES (1573, '2021-04-09', 382, 389, 402, 661, 0, 0);
INSERT INTO storage.operations_complex VALUES (1574, '2021-04-09', 392, 442, 449, 120, 0, 0);
INSERT INTO storage.operations_complex VALUES (1575, '2021-04-09', 392, 442, 449, 120, 0, 0);
INSERT INTO storage.operations_complex VALUES (1577, '2021-04-09', 385, 382, 402, 580, 0, 0);
INSERT INTO storage.operations_complex VALUES (1578, '2021-04-09', 382, 389, 401, 580, 0, 0);
INSERT INTO storage.operations_complex VALUES (1591, '2021-04-09', 392, 442, 449, 120, 0, 0);
INSERT INTO storage.operations_complex VALUES (1593, '2021-04-12', 442, 393, 415, 2666, 0, 0);
INSERT INTO storage.operations_complex VALUES (1594, '2021-04-12', 442, 393, 426, 1868, 23, 0);
INSERT INTO storage.operations_complex VALUES (1595, '2021-04-12', 442, 393, 436, 15, 0, 0);
INSERT INTO storage.operations_complex VALUES (1597, '2021-04-12', 392, 391, 413, 3, 0, 0);
INSERT INTO storage.operations_complex VALUES (1599, '2021-04-12', 391, 392, 413, 1333, 3, 0);
INSERT INTO storage.operations_complex VALUES (1600, '2021-04-12', 392, 442, 413, 1443, 3, 0);
INSERT INTO storage.operations_complex VALUES (1601, '2021-04-12', 384, 382, 449, 2875, 0, 0);
INSERT INTO storage.operations_complex VALUES (1602, '2021-04-12', 382, 442, 449, 2875, 0, 0);
INSERT INTO storage.operations_complex VALUES (1603, '2021-04-12', 450, 382, 451, 1263, 0, 0);
INSERT INTO storage.operations_complex VALUES (1604, '2021-04-12', 382, 442, 449, 840, 0, 0);
INSERT INTO storage.operations_complex VALUES (1606, '2021-04-12', 385, 382, 402, 40, 0, 0);
INSERT INTO storage.operations_complex VALUES (1607, '2021-04-12', 393, 448, 431, 1250, 0, 0);
INSERT INTO storage.operations_complex VALUES (1608, '2021-04-12', 382, 387, 402, 728, 0, 0);
INSERT INTO storage.operations_complex VALUES (1610, '2021-04-12', 382, 391, 413, 1114, 0, 0);
INSERT INTO storage.operations_complex VALUES (1611, '2021-04-12', 385, 382, 412, 849, 0, 0);
INSERT INTO storage.operations_complex VALUES (1612, '2021-04-12', 384, 382, 405, 840, 0, 0);
INSERT INTO storage.operations_complex VALUES (1614, '2021-04-12', 392, 442, 413, 2302, 0, 0);
INSERT INTO storage.operations_complex VALUES (1615, '2021-04-12', 391, 392, 413, 1177, 0, 0);
INSERT INTO storage.operations_complex VALUES (1616, '2021-04-12', 392, 442, 404, 870, 2, 0);
INSERT INTO storage.operations_complex VALUES (1617, '2021-04-12', 392, 442, 449, 720, 0, 0);
INSERT INTO storage.operations_complex VALUES (1618, '2021-04-13', 450, 382, 451, 624, 0, 0);
INSERT INTO storage.operations_complex VALUES (1620, '2021-04-13', 382, 448, 451, 4800, 0, 0);
INSERT INTO storage.operations_complex VALUES (1628, '2021-04-13', 382, 391, 413, 781, 0, 0);
INSERT INTO storage.operations_complex VALUES (1630, '2021-04-13', 392, 442, 413, 750, 0, 0);
INSERT INTO storage.operations_complex VALUES (1605, '2021-04-12', 387, 445, 402, 661, 3, 0);
INSERT INTO storage.operations_complex VALUES (1629, '2021-04-13', 389, 445, 402, 731, 0, 0);
INSERT INTO storage.operations_complex VALUES (1619, '2021-04-13', 382, 389, 402, 1208, 0, 0);
INSERT INTO storage.operations_complex VALUES (1613, '2021-04-12', 389, 445, 402, 1851, 0, 0);
INSERT INTO storage.operations_complex VALUES (1609, '2021-04-12', 382, 389, 402, 979, 0, 0);
INSERT INTO storage.operations_complex VALUES (1590, '2021-04-09', 384, 392, 449, 0, 0, 0);
INSERT INTO storage.operations_complex VALUES (1587, '2021-04-09', 382, 389, 402, 1212, 0, 0);
INSERT INTO storage.operations_complex VALUES (1598, '2021-04-12', 385, 382, 402, 3711, 0, 0);
INSERT INTO storage.operations_complex VALUES (1632, '2021-04-13', 448, 452, 408, 954, 0, 0);
INSERT INTO storage.operations_complex VALUES (1633, '2021-04-13', 448, 452, 451, 8400, 0, 0);
INSERT INTO storage.operations_complex VALUES (1634, '2021-04-13', 448, 452, 407, 3096, 0, 0);
INSERT INTO storage.operations_complex VALUES (1635, '2021-04-13', 448, 452, 443, 2114, 0, 0);
INSERT INTO storage.operations_complex VALUES (1636, '2021-04-13', 448, 452, 399, 1533, 0, 0);
INSERT INTO storage.operations_complex VALUES (1637, '2021-04-13', 448, 452, 410, 5790, 0, 0);
INSERT INTO storage.operations_complex VALUES (1638, '2021-04-13', 448, 452, 444, 1873, 0, 0);
INSERT INTO storage.operations_complex VALUES (1639, '2021-04-13', 448, 452, 431, 1250, 0, 0);
INSERT INTO storage.operations_complex VALUES (1640, '2021-04-13', 385, 382, 412, 400, 0, 0);
INSERT INTO storage.operations_complex VALUES (1641, '2021-04-13', 391, 392, 413, 555, 1, 0);
INSERT INTO storage.operations_complex VALUES (1642, '2021-04-13', 392, 442, 449, 120, 0, 0);
INSERT INTO storage.operations_complex VALUES (1644, '2021-04-13', 385, 382, 412, 649, 0, 0);
INSERT INTO storage.operations_complex VALUES (1645, '2021-04-13', 384, 382, 405, 872, 0, 0);
INSERT INTO storage.operations_complex VALUES (1646, '2021-04-13', 389, 445, 402, 751, 0, 0);
INSERT INTO storage.operations_complex VALUES (1647, '2021-04-13', 392, 442, 413, 1428, 11, 16);
INSERT INTO storage.operations_complex VALUES (1648, '2021-04-13', 392, 391, 413, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (1649, '2021-04-13', 450, 392, 451, 722, 0, 0);
INSERT INTO storage.operations_complex VALUES (1650, '2021-04-13', 392, 442, 449, 120, 0, 0);
INSERT INTO storage.operations_complex VALUES (1651, '2021-04-13', 393, 452, 409, 1113, 0, 0);
INSERT INTO storage.operations_complex VALUES (1652, '2021-04-13', 393, 452, 426, 1845, 0, 0);
INSERT INTO storage.operations_complex VALUES (1657, '2021-04-14', 392, 442, 449, 720, 0, 0);
INSERT INTO storage.operations_complex VALUES (1659, '2021-04-12', 384, 392, 449, 713, 0, 0);
INSERT INTO storage.operations_complex VALUES (1722, '2021-04-18', 384, 382, 405, 2684, 0, 0);
INSERT INTO storage.operations_complex VALUES (1723, '2021-04-18', 390, 392, 412, 190, 0, 0);
INSERT INTO storage.operations_complex VALUES (1724, '2021-04-18', 388, 445, 405, 1374, 0, 0);
INSERT INTO storage.operations_complex VALUES (1725, '2021-04-18', 392, 442, 412, 848, 0, 0);
INSERT INTO storage.operations_complex VALUES (1661, '2021-04-14', 382, 388, 405, 396, 0, 0);
INSERT INTO storage.operations_complex VALUES (1592, '2021-04-12', 382, 387, 402, 683, 0, 0);
INSERT INTO storage.operations_complex VALUES (1662, '2021-04-15', 387, 445, 402, 750, 6, 0);
INSERT INTO storage.operations_complex VALUES (1726, '2021-04-19', 382, 452, 451, 3600, 0, 0);
INSERT INTO storage.operations_complex VALUES (1663, '2021-04-15', 442, 453, 446, 4230, 0, 0);
INSERT INTO storage.operations_complex VALUES (1664, '2021-04-15', 389, 445, 402, 727, 0, 0);
INSERT INTO storage.operations_complex VALUES (1665, '2021-04-14', 392, 442, 413, 575, 0, 0);
INSERT INTO storage.operations_complex VALUES (1666, '2021-04-14', 392, 442, 412, 279, 0, 0);
INSERT INTO storage.operations_complex VALUES (1667, '2021-04-14', 392, 382, 415, 6, 6, 0);
INSERT INTO storage.operations_complex VALUES (1668, '2021-04-14', 382, 388, 405, 412, 0, 0);
INSERT INTO storage.operations_complex VALUES (1669, '2021-04-14', 382, 387, 412, 400, 0, 0);
INSERT INTO storage.operations_complex VALUES (1670, '2021-04-14', 385, 382, 412, 1085, 0, 0);
INSERT INTO storage.operations_complex VALUES (1671, '2021-04-14', 384, 382, 405, 806, 0, 0);
INSERT INTO storage.operations_complex VALUES (1673, '2021-04-14', 388, 445, 405, 575, 0, 0);
INSERT INTO storage.operations_complex VALUES (1676, '2021-04-15', 392, 442, 404, 326, 0, 0);
INSERT INTO storage.operations_complex VALUES (1677, '2021-04-15', 382, 390, 412, 300, 0, 0);
INSERT INTO storage.operations_complex VALUES (1678, '2021-04-15', 382, 388, 405, 444, 0, 0);
INSERT INTO storage.operations_complex VALUES (1679, '2021-04-15', 392, 442, 413, 1662, 2, 3);
INSERT INTO storage.operations_complex VALUES (1680, '2021-04-15', 388, 445, 405, 412, 0, 0);
INSERT INTO storage.operations_complex VALUES (1675, '2021-04-14', 450, 382, 451, 712, 0, 0);
INSERT INTO storage.operations_complex VALUES (1682, '2021-04-15', 442, 453, 449, 2967, 0, 0);
INSERT INTO storage.operations_complex VALUES (1727, '2021-04-18', 442, 393, 413, 4473, 0, 0);
INSERT INTO storage.operations_complex VALUES (1685, '2021-04-15', 382, 390, 412, 478, 0, 0);
INSERT INTO storage.operations_complex VALUES (1686, '2021-04-15', 382, 388, 405, 785, 0, 0);
INSERT INTO storage.operations_complex VALUES (1687, '2021-04-15', 385, 382, 417, 361, 0, 0);
INSERT INTO storage.operations_complex VALUES (1689, '2021-04-15', 384, 382, 405, 882, 0, 0);
INSERT INTO storage.operations_complex VALUES (1690, '2021-04-15', 388, 445, 405, 768, 0, 0);
INSERT INTO storage.operations_complex VALUES (1692, '2021-04-16', 385, 382, 417, 104, 0, 0);
INSERT INTO storage.operations_complex VALUES (1694, '2021-04-16', 392, 442, 429, 959, 0, 0);
INSERT INTO storage.operations_complex VALUES (1728, '2021-04-19', 382, 388, 405, 2684, 0, 0);
INSERT INTO storage.operations_complex VALUES (1699, '2021-04-15', 450, 382, 451, 659, 0, 0);
INSERT INTO storage.operations_complex VALUES (1700, '2021-04-16', 392, 442, 429, 220, 7, 4);
INSERT INTO storage.operations_complex VALUES (1691, '2021-04-15', 390, 392, 412, 648, 0, 0);
INSERT INTO storage.operations_complex VALUES (1701, '2021-04-15', 393, 452, 415, 2318, 0, 0);
INSERT INTO storage.operations_complex VALUES (1702, '2021-04-15', 393, 452, 409, 959, 0, 0);
INSERT INTO storage.operations_complex VALUES (1703, '2021-04-15', 393, 452, 436, 12, 0, 0);
INSERT INTO storage.operations_complex VALUES (1704, '2021-04-15', 385, 382, 417, 294, 0, 0);
INSERT INTO storage.operations_complex VALUES (1681, '2021-04-15', 385, 382, 412, 348, 0, 0);
INSERT INTO storage.operations_complex VALUES (1688, '2021-04-15', 385, 382, 417, 300, 0, 0);
INSERT INTO storage.operations_complex VALUES (1732, '2021-04-19', 450, 382, 451, 2229, 0, 0);
INSERT INTO storage.operations_complex VALUES (1693, '2021-04-16', 387, 392, 412, 200, 0, 0);
INSERT INTO storage.operations_complex VALUES (1708, '2021-04-16', 387, 390, 412, 200, 0, 0);
INSERT INTO storage.operations_complex VALUES (1710, '2021-04-15', 442, 393, 404, 5443, 0, 0);
INSERT INTO storage.operations_complex VALUES (1715, '2021-04-16', 382, 388, 405, 1363, 0, 0);
INSERT INTO storage.operations_complex VALUES (1716, '2021-04-16', 382, 390, 412, 1415, 0, 0);
INSERT INTO storage.operations_complex VALUES (1717, '2021-04-16', 388, 445, 405, 460, 0, 0);
INSERT INTO storage.operations_complex VALUES (1721, '2021-04-18', 385, 382, 424, 3394, 0, 0);
INSERT INTO storage.operations_complex VALUES (1733, '2021-04-08', 442, 393, 409, 110, 0, 0);
INSERT INTO storage.operations_complex VALUES (1736, '2021-04-16', 393, 452, 415, 585, 0, 0);
INSERT INTO storage.operations_complex VALUES (1737, '2021-04-16', 393, 452, 404, 180, 0, 0);
INSERT INTO storage.operations_complex VALUES (1739, '2021-04-19', 385, 382, 424, 300, 0, 0);
INSERT INTO storage.operations_complex VALUES (1740, '2021-04-19', 390, 392, 412, 431, 0, 0);
INSERT INTO storage.operations_complex VALUES (1735, '2021-04-16', 393, 452, 409, 132, 0, 0);
INSERT INTO storage.operations_complex VALUES (1741, '2021-04-19', 390, 392, 412, 240, 0, 0);
INSERT INTO storage.operations_complex VALUES (1742, '2021-04-19', 382, 390, 412, 738, 0, 0);
INSERT INTO storage.operations_complex VALUES (1743, '2021-04-19', 382, 390, 417, 759, 0, 0);
INSERT INTO storage.operations_complex VALUES (1746, '2021-04-19', 393, 452, 431, 62, 0, 0);
INSERT INTO storage.operations_complex VALUES (1747, '2021-04-19', 393, 452, 404, 1020, 0, 0);
INSERT INTO storage.operations_complex VALUES (1748, '2021-04-19', 390, 392, 412, 360, 0, 0);
INSERT INTO storage.operations_complex VALUES (1749, '2021-04-19', 388, 445, 405, 418, 0, 0);
INSERT INTO storage.operations_complex VALUES (1752, '2021-04-19', 384, 382, 403, 320, 0, 0);
INSERT INTO storage.operations_complex VALUES (1753, '2021-04-19', 450, 382, 451, 222, 0, 0);
INSERT INTO storage.operations_complex VALUES (1754, '2021-04-20', 388, 445, 405, 484, 0, 0);
INSERT INTO storage.operations_complex VALUES (1755, '2021-04-20', 390, 392, 412, 351, 0, 0);
INSERT INTO storage.operations_complex VALUES (1756, '2021-04-20', 445, 392, 402, 482, 0, 0);
INSERT INTO storage.operations_complex VALUES (1757, '2021-04-19', 442, 393, 413, 2262, 0, 0);
INSERT INTO storage.operations_complex VALUES (1758, '2021-04-20', 382, 390, 417, 300, 0, 0);
INSERT INTO storage.operations_complex VALUES (1759, '2021-04-20', 390, 392, 412, 189, 0, 0);
INSERT INTO storage.operations_complex VALUES (1760, '2021-04-20', 393, 452, 404, 1320, 0, 0);
INSERT INTO storage.operations_complex VALUES (1761, '2021-04-20', 393, 452, 404, 60, 0, 0);
INSERT INTO storage.operations_complex VALUES (1762, '2021-04-20', 445, 392, 402, 481, 0, 0);
INSERT INTO storage.operations_complex VALUES (1763, '2021-04-20', 388, 445, 405, 492, 0, 0);
INSERT INTO storage.operations_complex VALUES (1764, '2021-04-20', 392, 442, 412, 1051, 1, 0);
INSERT INTO storage.operations_complex VALUES (1768, '2021-04-20', 442, 393, 413, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (1770, '2021-04-20', 384, 382, 403, 410, 0, 0);
INSERT INTO storage.operations_complex VALUES (1771, '2021-04-20', 392, 442, 412, 709, 2, 0);
INSERT INTO storage.operations_complex VALUES (1772, '2021-04-20', 388, 445, 405, 383, 0, 0);
INSERT INTO storage.operations_complex VALUES (1773, '2021-04-20', 392, 442, 402, 80, 0, 0);
INSERT INTO storage.operations_complex VALUES (1774, '2021-04-20', 445, 392, 402, 469, 0, 0);
INSERT INTO storage.operations_complex VALUES (1775, '2021-04-21', 445, 392, 402, 525, 0, 0);
INSERT INTO storage.operations_complex VALUES (1777, '2021-04-20', 450, 382, 454, 22, 0, 0);
INSERT INTO storage.operations_complex VALUES (1769, '2021-04-20', 385, 382, 414, 1165, 30, 0);
INSERT INTO storage.operations_complex VALUES (1781, '2021-04-20', 385, 382, 414, 1135, 0, 0);
INSERT INTO storage.operations_complex VALUES (1785, '2021-04-20', 442, 393, 413, 1796, 0, 0);
INSERT INTO storage.operations_complex VALUES (1788, '2021-04-21', 388, 445, 405, 445, 0, 0);
INSERT INTO storage.operations_complex VALUES (1789, '2021-04-21', 390, 392, 412, 198, 0, 0);
INSERT INTO storage.operations_complex VALUES (1790, '2021-04-21', 445, 392, 402, 485, 0, 0);
INSERT INTO storage.operations_complex VALUES (1791, '2021-04-21', 382, 387, 403, 680, 0, 0);
INSERT INTO storage.operations_complex VALUES (1792, '2021-04-21', 382, 388, 424, 3694, 0, 0);
INSERT INTO storage.operations_complex VALUES (1793, '2021-04-21', 445, 392, 402, 480, 0, 0);
INSERT INTO storage.operations_complex VALUES (1794, '2021-04-21', 393, 452, 404, 1257, 0, 0);
INSERT INTO storage.operations_complex VALUES (1795, '2021-04-21', 392, 442, 402, 1681, 28, 0);
INSERT INTO storage.operations_complex VALUES (1796, '2021-04-21', 442, 393, 412, 2579, 25, 0);
INSERT INTO storage.operations_complex VALUES (1797, '2021-04-21', 445, 392, 402, 560, 0, 0);
INSERT INTO storage.operations_complex VALUES (1798, '2021-04-21', 390, 392, 412, 300, 0, 0);
INSERT INTO storage.operations_complex VALUES (1801, '2021-04-21', 384, 382, 403, 753, 0, 0);
INSERT INTO storage.operations_complex VALUES (1802, '2021-04-21', 385, 382, 414, 177, 0, 0);
INSERT INTO storage.operations_complex VALUES (1803, '2021-04-22', 442, 393, 413, 1381, 0, 0);
INSERT INTO storage.operations_complex VALUES (1804, '2021-04-22', 442, 393, 413, 86, 6, 0);
INSERT INTO storage.operations_complex VALUES (1805, '2021-04-22', 388, 445, 405, 462, 0, 0);
INSERT INTO storage.operations_complex VALUES (1806, '2021-04-22', 392, 442, 402, 1157, 6, 0);
INSERT INTO storage.operations_complex VALUES (1807, '2021-04-22', 392, 455, 402, 10, 0, 0);
INSERT INTO storage.operations_complex VALUES (1808, '2021-04-22', 445, 392, 402, 799, 0, 0);
INSERT INTO storage.operations_complex VALUES (1809, '2021-04-22', 390, 392, 412, 220, 0, 0);
INSERT INTO storage.operations_complex VALUES (1811, '2021-04-22', 385, 382, 414, 79, 0, 0);
INSERT INTO storage.operations_complex VALUES (1812, '2021-04-22', 393, 452, 404, 1011, 0, 0);
INSERT INTO storage.operations_complex VALUES (1814, '2021-04-22', 384, 382, 403, 251, 0, 0);
INSERT INTO storage.operations_complex VALUES (1815, '2021-04-22', 389, 455, 404, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (1816, '2021-04-22', 391, 455, 413, 27, 0, 0);
INSERT INTO storage.operations_complex VALUES (1817, '2021-04-22', 445, 392, 402, 1080, 51, 0);
INSERT INTO storage.operations_complex VALUES (1818, '2021-04-22', 390, 445, 417, 653, 0, 0);
INSERT INTO storage.operations_complex VALUES (1819, '2021-04-22', 392, 442, 402, 1151, 5, 0);
INSERT INTO storage.operations_complex VALUES (1820, '2021-04-22', 392, 455, 402, 6, 0, 0);
INSERT INTO storage.operations_complex VALUES (1821, '2021-04-22', 387, 445, 403, 480, 0, 0);
INSERT INTO storage.operations_complex VALUES (1825, '2021-04-22', 384, 382, 403, 656, 0, 0);
INSERT INTO storage.operations_complex VALUES (1826, '2021-04-22', 450, 382, 456, 664, 0, 0);
INSERT INTO storage.operations_complex VALUES (1828, '2021-04-22', 385, 382, 457, 621, 0, 0);
INSERT INTO storage.operations_complex VALUES (1822, '2021-04-22', 392, 442, 412, 440, 3, 0);
INSERT INTO storage.operations_complex VALUES (1829, '2021-04-23', 390, 392, 412, 4, 0, 0);
INSERT INTO storage.operations_complex VALUES (1830, '2021-04-23', 390, 445, 417, 406, 0, 0);
INSERT INTO storage.operations_complex VALUES (1831, '2021-04-23', 382, 387, 403, 907, 0, 0);
INSERT INTO storage.operations_complex VALUES (1833, '2021-04-22', 385, 382, 413, 61, 0, 0);
INSERT INTO storage.operations_complex VALUES (1834, '2021-04-23', 392, 442, 416, 4, 0, 0);


--
-- Name: base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sansa
--

SELECT pg_catalog.setval('public.base_id_seq', 457, true);


--
-- Name: operations_complex_id_seq; Type: SEQUENCE SET; Schema: storage; Owner: sansa
--

SELECT pg_catalog.setval('storage.operations_complex_id_seq', 1834, true);


--
-- Name: base_named base_named_pk_id; Type: CONSTRAINT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.base_named
    ADD CONSTRAINT base_named_pk_id PRIMARY KEY (id);


--
-- Name: base base_pk_id; Type: CONSTRAINT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_pk_id PRIMARY KEY (id);


--
-- Name: base_tree_childs base_tree_childs_pk; Type: CONSTRAINT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.base_tree_childs
    ADD CONSTRAINT base_tree_childs_pk PRIMARY KEY (parent_id);


--
-- Name: base_tree base_tree_pk; Type: CONSTRAINT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.base_tree
    ADD CONSTRAINT base_tree_pk PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: customers_tree customers_tree_path_key; Type: CONSTRAINT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.customers_tree
    ADD CONSTRAINT customers_tree_path_key UNIQUE (path);


--
-- Name: customers_tree customers_tree_pkey; Type: CONSTRAINT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.customers_tree
    ADD CONSTRAINT customers_tree_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products_tree products_tree_pkey; Type: CONSTRAINT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.products_tree
    ADD CONSTRAINT products_tree_pkey PRIMARY KEY (id);


--
-- Name: products_tree products_tree_unq_path; Type: CONSTRAINT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.products_tree
    ADD CONSTRAINT products_tree_unq_path UNIQUE (path);


--
-- Name: products products_unq_short_name; Type: CONSTRAINT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_unq_short_name UNIQUE (short_name, parent_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: base_operations base_operations_pk; Type: CONSTRAINT; Schema: storage; Owner: sansa
--

ALTER TABLE ONLY storage.base_operations
    ADD CONSTRAINT base_operations_pk PRIMARY KEY (id, ln);


--
-- Name: operations_complex operations_complex_pkey; Type: CONSTRAINT; Schema: storage; Owner: sansa
--

ALTER TABLE ONLY storage.operations_complex
    ADD CONSTRAINT operations_complex_pkey PRIMARY KEY (id);


--
-- Name: operations operatirons_idx_pkey; Type: CONSTRAINT; Schema: storage; Owner: sansa
--

ALTER TABLE ONLY storage.operations
    ADD CONSTRAINT operatirons_idx_pkey PRIMARY KEY (id, ln);


--
-- Name: base_idx_created; Type: INDEX; Schema: public; Owner: sansa
--

CREATE INDEX base_idx_created ON public.base USING btree (created);


--
-- Name: base_idx_creator; Type: INDEX; Schema: public; Owner: sansa
--

CREATE INDEX base_idx_creator ON public.base USING btree (creator);


--
-- Name: base_idx_modifed; Type: INDEX; Schema: public; Owner: sansa
--

CREATE INDEX base_idx_modifed ON public.base USING btree (modifed);


--
-- Name: base_idx_modifer; Type: INDEX; Schema: public; Owner: sansa
--

CREATE INDEX base_idx_modifer ON public.base USING btree (modifer);


--
-- Name: base_idx_rstate; Type: INDEX; Schema: public; Owner: sansa
--

CREATE INDEX base_idx_rstate ON public.base USING btree (rstate);


--
-- Name: base_named_idx_rstate; Type: INDEX; Schema: public; Owner: sansa
--

CREATE INDEX base_named_idx_rstate ON public.base_named USING btree (rstate);


--
-- Name: customers_idx_parent; Type: INDEX; Schema: public; Owner: sansa
--

CREATE INDEX customers_idx_parent ON public.customers USING btree (payer_id);


--
-- Name: documents_idx_rstate; Type: INDEX; Schema: public; Owner: sansa
--

CREATE INDEX documents_idx_rstate ON public.documents USING btree (rstate);


--
-- Name: pabe_tree_idx_path; Type: INDEX; Schema: public; Owner: sansa
--

CREATE INDEX pabe_tree_idx_path ON public.base_tree USING gist (path);


--
-- Name: products_idx_parent; Type: INDEX; Schema: public; Owner: sansa
--

CREATE INDEX products_idx_parent ON public.products USING btree (parent_id);


--
-- Name: products_idx_rstate; Type: INDEX; Schema: public; Owner: sansa
--

CREATE INDEX products_idx_rstate ON public.products USING btree (rstate);


--
-- Name: products_tree_idx_path; Type: INDEX; Schema: public; Owner: sansa
--

CREATE INDEX products_tree_idx_path ON public.products_tree USING gist (path);


--
-- Name: operations_idx_object; Type: INDEX; Schema: storage; Owner: sansa
--

CREATE INDEX operations_idx_object ON storage.operations USING btree (subject_id);


--
-- Name: operations_idx_storage; Type: INDEX; Schema: storage; Owner: sansa
--

CREATE INDEX operations_idx_storage ON storage.operations USING btree (storage_id);


--
-- Name: base_named base_named_on_upd; Type: TRIGGER; Schema: public; Owner: sansa
--

CREATE TRIGGER base_named_on_upd BEFORE UPDATE ON public.base_named FOR EACH ROW EXECUTE FUNCTION public.ex_on_modifed();


--
-- Name: TRIGGER base_named_on_upd ON base_named; Type: COMMENT; Schema: public; Owner: sansa
--

COMMENT ON TRIGGER base_named_on_upd ON public.base_named IS 'При обновлении изменяем modifer и modifed';


--
-- Name: base base_tr_on_modifed; Type: TRIGGER; Schema: public; Owner: sansa
--

CREATE TRIGGER base_tr_on_modifed BEFORE UPDATE ON public.base FOR EACH ROW EXECUTE FUNCTION public.ex_on_modifed();


--
-- Name: products on_modifed; Type: TRIGGER; Schema: public; Owner: sansa
--

CREATE TRIGGER on_modifed BEFORE UPDATE ON public.products FOR EACH ROW EXECUTE FUNCTION public.ex_on_modifed();


--
-- Name: products_tree on_modifed; Type: TRIGGER; Schema: public; Owner: sansa
--

CREATE TRIGGER on_modifed BEFORE UPDATE ON public.products_tree FOR EACH ROW EXECUTE FUNCTION public.ex_on_modifed();


--
-- Name: products on_modifed1; Type: TRIGGER; Schema: public; Owner: sansa
--

CREATE TRIGGER on_modifed1 BEFORE UPDATE ON public.products FOR EACH ROW EXECUTE FUNCTION public.ex_on_update_products();


--
-- Name: products_tree on_modifed_delete; Type: TRIGGER; Schema: public; Owner: sansa
--

CREATE TRIGGER on_modifed_delete BEFORE UPDATE ON public.products_tree FOR EACH ROW EXECUTE FUNCTION public.ex_on_update_product_tree();


--
-- Name: operations_complex operations_complex_tr_add; Type: TRIGGER; Schema: storage; Owner: sansa
--

CREATE TRIGGER operations_complex_tr_add AFTER INSERT ON storage.operations_complex FOR EACH ROW EXECUTE FUNCTION public.operations_complex_on_add();


--
-- Name: operations_complex operations_complex_tr_del; Type: TRIGGER; Schema: storage; Owner: sansa
--

CREATE TRIGGER operations_complex_tr_del AFTER DELETE ON storage.operations_complex FOR EACH ROW EXECUTE FUNCTION public.operations_complex_on_del();


--
-- Name: operations_complex operations_complex_tr_upd; Type: TRIGGER; Schema: storage; Owner: sansa
--

CREATE TRIGGER operations_complex_tr_upd AFTER UPDATE ON storage.operations_complex FOR EACH ROW EXECUTE FUNCTION public.operations_complex_on_upd();


--
-- Name: operations operatirons_tr_on_modifed; Type: TRIGGER; Schema: storage; Owner: sansa
--

CREATE TRIGGER operatirons_tr_on_modifed BEFORE UPDATE ON storage.operations FOR EACH ROW EXECUTE FUNCTION public.ex_on_modifed();


--
-- Name: base_tree_childs base_tree_childs_fk_tree; Type: FK CONSTRAINT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.base_tree_childs
    ADD CONSTRAINT base_tree_childs_fk_tree FOREIGN KEY (parent_id) REFERENCES public.base_tree(id) MATCH FULL;


--
-- Name: base_tree base_tree_fk_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.base_tree
    ADD CONSTRAINT base_tree_fk_parent_id FOREIGN KEY (parent_id) REFERENCES public.base_tree(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: products products_fk_tree; Type: FK CONSTRAINT; Schema: public; Owner: sansa
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_fk_tree FOREIGN KEY (parent_id) REFERENCES public.products_tree(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: base_operations base_operations_fk_storage_id; Type: FK CONSTRAINT; Schema: storage; Owner: sansa
--

ALTER TABLE ONLY storage.base_operations
    ADD CONSTRAINT base_operations_fk_storage_id FOREIGN KEY (storage_id) REFERENCES public.customers(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: operations_by_doc operations_by_doc_fk_document; Type: FK CONSTRAINT; Schema: storage; Owner: sansa
--

ALTER TABLE ONLY storage.operations_by_doc
    ADD CONSTRAINT operations_by_doc_fk_document FOREIGN KEY (parent_id) REFERENCES public.documents(id);


--
-- Name: operations operations_sender; Type: FK CONSTRAINT; Schema: storage; Owner: sansa
--

ALTER TABLE ONLY storage.operations
    ADD CONSTRAINT operations_sender FOREIGN KEY (storage_id) REFERENCES public.customers(id);


--
-- Name: operations operatirons_fk_object; Type: FK CONSTRAINT; Schema: storage; Owner: sansa
--

ALTER TABLE ONLY storage.operations
    ADD CONSTRAINT operatirons_fk_object FOREIGN KEY (subject_id) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

