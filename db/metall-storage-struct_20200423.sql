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

