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
    FUNCTION = public._lt_q_rregex,
    LEFTARG = public.lquery[],
    RIGHTARG = public.ltree[],
    COMMUTATOR = OPERATOR(public.?),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.? (public.lquery[], public.ltree[]) OWNER TO sansa;

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
    FUNCTION = public._ltxtq_rexec,
    LEFTARG = public.ltxtquery,
    RIGHTARG = public.ltree[],
    COMMUTATOR = OPERATOR(public.@),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (public.ltxtquery, public.ltree[]) OWNER TO sansa;

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
    FUNCTION = public._lt_q_rregex,
    LEFTARG = public.lquery[],
    RIGHTARG = public.ltree[],
    COMMUTATOR = OPERATOR(public.^?),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^? (public.lquery[], public.ltree[]) OWNER TO sansa;

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
    FUNCTION = public._ltxtq_rexec,
    LEFTARG = public.ltxtquery,
    RIGHTARG = public.ltree[],
    COMMUTATOR = OPERATOR(public.^@),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@ (public.ltxtquery, public.ltree[]) OWNER TO sansa;

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
    FUNCTION = public._ltq_rregex,
    LEFTARG = public.lquery,
    RIGHTARG = public.ltree[],
    COMMUTATOR = OPERATOR(public.^~),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^~ (public.lquery, public.ltree[]) OWNER TO sansa;

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
    FUNCTION = public._ltq_rregex,
    LEFTARG = public.lquery,
    RIGHTARG = public.ltree[],
    COMMUTATOR = OPERATOR(public.~),
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (public.lquery, public.ltree[]) OWNER TO sansa;

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

INSERT INTO public.customers VALUES (8, '2011-04-09 16:11:02.727157', 'sansa', NULL, NULL, 0, 'заготовки', 'Склад заготовок', 2, 8, false);
INSERT INTO public.customers VALUES (9, '2011-04-09 16:27:41.10148', 'sansa', NULL, NULL, 0, 'Брак', 'Брак', 2, 9, false);
INSERT INTO public.customers VALUES (11, '2011-04-09 16:28:44.230523', 'sansa', NULL, NULL, 0, 'Готовые', 'Готовые изделия', 2, 11, false);
INSERT INTO public.customers VALUES (12, '2011-04-09 16:29:12.697481', 'sansa', NULL, NULL, 0, 'Комплектующие', 'Склад комплектующих', 2, 12, true);
INSERT INTO public.customers VALUES (30, '2011-04-09 16:44:25.802738', 'sansa', NULL, NULL, 0, 'Пресс', 'Пресс', 2, 30, false);
INSERT INTO public.customers VALUES (33, '2011-04-09 16:45:07.949263', 'sansa', NULL, NULL, 0, 'Плавильный участок', 'Плавка', 2, 33, false);
INSERT INTO public.customers VALUES (37, '2011-04-09 17:07:36.866996', 'sansa', NULL, NULL, 0, 'Токарь', 'Токарь', 2, 37, false);
INSERT INTO public.customers VALUES (38, '2011-04-09 17:08:54.860562', 'sansa', NULL, NULL, 0, 'Слесарь', 'Слесарная обработка', 2, 38, false);
INSERT INTO public.customers VALUES (35, '2011-04-09 17:07:04.658017', 'sansa', NULL, NULL, 0, 'Кокильный участок', 'Кокильный участок', 2, 35, false);
INSERT INTO public.customers VALUES (61, '2011-04-10 12:52:40.476998', 'sansa', NULL, NULL, 0, 'Сверление', 'Сверление', 2, 61, false);
INSERT INTO public.customers VALUES (62, '2011-04-10 12:53:17.0907', 'sansa', NULL, NULL, 0, 'отк', 'Контроль качества заготовок', 2, 62, false);
INSERT INTO public.customers VALUES (353, '2011-06-27 17:29:56.29465', 'sansa', NULL, NULL, 0, 'ООО "М-Технология"', 'ООО "М-Технология"', 3, NULL, false);
INSERT INTO public.customers VALUES (354, '2011-06-27 17:30:31.105787', 'sansa', NULL, NULL, 0, 'Лужники', 'Лужники', 3, NULL, false);
INSERT INTO public.customers VALUES (355, '2011-06-28 12:11:53.983619', 'sansa', NULL, NULL, 0, 'ООО "Хорошо"', 'ООО "Хорошо"', 3, NULL, false);
INSERT INTO public.customers VALUES (83, '2011-04-26 11:16:42.781978', 'sansa', NULL, NULL, 0, 'Склад', 'Склад отливок', 2, NULL, false);
INSERT INTO public.customers VALUES (356, '2011-06-28 12:29:13.303044', 'sansa', NULL, NULL, 0, 'офис', 'офис', 3, NULL, false);
INSERT INTO public.customers VALUES (358, '2011-06-28 12:29:55.279391', 'sansa', NULL, NULL, 0, 'садовод', 'садовод', 3, NULL, false);
INSERT INTO public.customers VALUES (359, '2011-06-28 12:30:23.209509', 'sansa', NULL, NULL, 0, 'ООО "Посуда опт"', 'ООО "Посуда опт"', 3, NULL, false);
INSERT INTO public.customers VALUES (146, '2011-04-29 15:44:24.136486', 'sansa', NULL, NULL, 0, 'ООО "СпецТорг"', 'ООО "СпецТорг"', 3, NULL, false);
INSERT INTO public.customers VALUES (147, '2011-05-03 18:50:21.034515', 'sansa', NULL, NULL, 0, 'ООО "ПоварЛюкс"', 'ООО "ПоварЛюкс"', 3, NULL, false);
INSERT INTO public.customers VALUES (360, '2011-06-28 12:31:08.367148', 'sansa', NULL, NULL, 0, 'ООО "Тарасовка"', 'ООО "Тарасовка"', 3, NULL, false);
INSERT INTO public.customers VALUES (361, '2011-06-28 12:31:22.954246', 'sansa', NULL, NULL, 0, 'рынок Алексей', 'рынок Алексей', 3, NULL, false);
INSERT INTO public.customers VALUES (362, '2011-06-28 12:31:46.669116', 'sansa', NULL, NULL, 0, 'иванчишен', 'иванчишен', 3, NULL, false);
INSERT INTO public.customers VALUES (368, '2011-07-05 10:17:41.203745', 'sansa', NULL, NULL, 0, 'сергеевцев', 'сергеевцев', 3, NULL, false);
INSERT INTO public.customers VALUES (369, '2011-07-06 19:24:30.749191', 'sansa', NULL, NULL, 0, 'технадзор', 'технадзор', 3, NULL, false);
INSERT INTO public.customers VALUES (370, '2011-07-06 19:24:46.817973', 'sansa', NULL, NULL, 0, '222', '222', 2, NULL, false);
INSERT INTO public.customers VALUES (371, '2011-07-08 13:15:07.065673', 'sansa', NULL, NULL, 0, 'завод делфин', 'завод делфин', 3, NULL, false);
INSERT INTO public.customers VALUES (372, '2011-07-08 13:16:07.15934', 'sansa', NULL, NULL, 0, 'никитин д.п.', 'никитин д.п.', 3, NULL, false);
INSERT INTO public.customers VALUES (373, '2011-07-08 13:22:13.503732', 'sansa', NULL, NULL, 0, 'ООО "Техносервис"', 'ООО "Техносервис"', 3, NULL, false);
INSERT INTO public.customers VALUES (374, '2011-07-08 15:28:20.57646', 'sansa', NULL, NULL, 0, 'ОАО "Мособлпроммонтаж"', 'ОАО "Мособлпроммонтаж"', 3, NULL, false);
INSERT INTO public.customers VALUES (375, '2011-07-08 16:06:30.066525', 'sansa', NULL, NULL, 0, 'Булавин', 'Булавин', 3, NULL, false);
INSERT INTO public.customers VALUES (376, '2011-07-08 16:06:43.523172', 'sansa', NULL, NULL, 0, 'Кузькин', 'Кузькин', 3, NULL, false);
INSERT INTO public.customers VALUES (377, '2011-07-08 16:07:07.575009', 'sansa', NULL, NULL, 0, 'Безант-С', 'Безант-С', 3, NULL, false);
INSERT INTO public.customers VALUES (378, '2011-07-08 16:45:39.989749', 'sansa', NULL, NULL, 0, 'Клюев', 'Клюев', 3, NULL, false);
INSERT INTO public.customers VALUES (379, '2011-07-08 17:09:48.715774', 'sansa', NULL, NULL, 0, 'литейка', 'литейка', 3, NULL, false);
INSERT INTO public.customers VALUES (380, '2011-07-08 17:22:15.667544', 'sansa', NULL, NULL, 0, 'СП Андрей', 'СП Андрей', 3, NULL, false);


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

INSERT INTO public.products VALUES (233, '2011-06-23 14:51:51.503756', 'sansa', '2011-06-23 14:52:08.496511', 'sansa', 0, '4Пр11', 'кастрюля 5л сканди со ст-ой кр-о1', 15);
INSERT INTO public.products VALUES (84, '2011-04-26 11:18:03.678504', 'sansa', '2011-04-29 16:25:26.483403', 'sansa', 0, 'д220', 'д220', 15);
INSERT INTO public.products VALUES (85, '2011-04-26 11:18:27.90764', 'sansa', '2011-04-29 16:25:17.914427', 'sansa', 0, 'д240', 'д240', 15);
INSERT INTO public.products VALUES (86, '2011-04-26 11:18:49.596234', 'sansa', '2011-04-29 16:25:11.599507', 'sansa', 0, 'д260', 'д260', 15);
INSERT INTO public.products VALUES (87, '2011-04-26 11:19:00.697977', 'sansa', '2011-04-29 16:25:03.638547', 'sansa', 0, 'д280', 'д280', 15);
INSERT INTO public.products VALUES (91, '2011-04-26 13:31:59.030497', 'sansa', '2011-04-29 16:18:17.60402', 'sansa', 0, 'д280ск', 'Scandia D280', 15);
INSERT INTO public.products VALUES (90, '2011-04-26 13:31:30.598743', 'sansa', '2011-04-29 16:19:50.807897', 'sansa', 0, 'д260ск', 'Scandia D260', 15);
INSERT INTO public.products VALUES (89, '2011-04-26 13:30:59.78293', 'sansa', '2011-04-29 16:20:16.602324', 'sansa', 0, 'д240ск', 'Scandia D240', 15);
INSERT INTO public.products VALUES (88, '2011-04-26 13:27:25.466172', 'sansa', '2011-04-29 16:20:42.422246', 'sansa', 0, 'д220ск', 'Scandia D220', 15);
INSERT INTO public.products VALUES (94, '2011-04-26 13:33:31.611827', 'sansa', '2011-04-29 16:19:30.362078', 'sansa', 0, 'д260скк', 'Scandia D260 с крышкой', 15);
INSERT INTO public.products VALUES (92, '2011-04-26 13:33:01.666179', 'sansa', '2011-04-29 16:20:31.351378', 'sansa', 0, 'д220скк', 'Scandia D220 с крышкой', 15);
INSERT INTO public.products VALUES (93, '2011-04-26 13:33:13.980038', 'sansa', '2011-04-29 16:20:03.091449', 'sansa', 0, 'д240скк', 'Scandia D240 с крышкой', 15);
INSERT INTO public.products VALUES (95, '2011-04-26 13:34:24.384402', 'sansa', '2011-04-29 16:55:53.666272', 'sansa', 0, 'д220мк', 'Matrix D220', 15);
INSERT INTO public.products VALUES (96, '2011-04-26 13:34:36.91603', 'sansa', '2011-04-29 16:22:50.227865', 'sansa', 0, 'д240мк', 'Matrix D240', 15);
INSERT INTO public.products VALUES (97, '2011-04-26 13:39:21.530929', 'sansa', '2011-04-29 16:21:53.76501', 'sansa', 0, 'д260мк', 'Matrix D260', 15);
INSERT INTO public.products VALUES (98, '2011-04-26 13:39:39.018528', 'sansa', '2011-04-29 16:21:22.103166', 'sansa', 0, 'д280мк', 'Matrix D280', 15);
INSERT INTO public.products VALUES (99, '2011-04-26 13:40:09.794895', 'sansa', '2011-04-29 16:23:03.296311', 'sansa', 0, 'д240мк', 'Matrix D220 с крышкой', 15);
INSERT INTO public.products VALUES (100, '2011-04-26 13:40:30.734707', 'sansa', '2011-04-29 16:22:15.63703', 'sansa', 0, 'д240мкк', 'Matrix D240 с крышкой', 15);
INSERT INTO public.products VALUES (101, '2011-04-26 13:50:55.90004', 'sansa', '2011-04-29 16:21:44.09576', 'sansa', 0, 'д260мкк', 'Matrix D260 с крышкой', 15);
INSERT INTO public.products VALUES (102, '2011-04-26 13:51:10.947334', 'sansa', '2011-04-29 16:21:32.196004', 'sansa', 0, 'д280мкк', 'Matrix D280 с крышкой', 15);
INSERT INTO public.products VALUES (103, '2011-04-26 13:51:49.94876', 'sansa', '2011-04-29 16:18:05.998241', 'sansa', 0, 'д280ск кр', 'Scandia D280 с крышкой', 15);
INSERT INTO public.products VALUES (112, '2011-04-26 13:54:23.485179', 'sansa', '2011-04-29 16:54:04.269537', 'sansa', 0, 'кс200', 'Крышка стеклянная D200', 15);
INSERT INTO public.products VALUES (113, '2011-04-26 13:54:33.908806', 'sansa', '2011-04-29 16:53:56.519048', 'sansa', 0, 'кс220', 'Крышка стеклянная D220', 15);
INSERT INTO public.products VALUES (114, '2011-04-26 13:54:43.693693', 'sansa', '2011-04-29 16:53:45.871412', 'sansa', 0, 'кс240', 'Крышка стеклянная D240', 15);
INSERT INTO public.products VALUES (115, '2011-04-26 13:54:54.753627', 'sansa', '2011-04-29 16:53:39.1998', 'sansa', 0, 'кс260', 'Крышка стеклянная D260', 15);
INSERT INTO public.products VALUES (116, '2011-04-26 13:55:06.238047', 'sansa', '2011-04-29 16:53:32.071064', 'sansa', 0, 'кс280', 'Крышка стеклянная D280', 15);
INSERT INTO public.products VALUES (111, '2011-04-26 13:54:07.236486', 'sansa', '2011-04-29 16:51:44.012926', 'sansa', 0, 'д280бк', 'D280 с крышкой', 15);
INSERT INTO public.products VALUES (107, '2011-04-26 13:52:44.820252', 'sansa', '2011-04-29 16:51:54.528656', 'sansa', 0, 'д280б', 'D280', 15);
INSERT INTO public.products VALUES (110, '2011-04-26 13:53:55.422871', 'sansa', '2011-04-29 16:52:20.632353', 'sansa', 0, 'д260бк', 'D260 с крышкой', 15);
INSERT INTO public.products VALUES (106, '2011-04-26 13:52:32.389016', 'sansa', '2011-04-29 16:52:31.787029', 'sansa', 0, 'д260б', 'D260', 15);
INSERT INTO public.products VALUES (109, '2011-04-26 13:53:40.398892', 'sansa', '2011-04-29 16:52:44.885499', 'sansa', 0, 'д240бк', 'D240 с крышкой', 15);
INSERT INTO public.products VALUES (105, '2011-04-26 13:52:16.873731', 'sansa', '2011-04-29 16:52:53.295206', 'sansa', 0, 'д240б', 'D240', 15);
INSERT INTO public.products VALUES (108, '2011-04-26 13:53:29.550573', 'sansa', '2011-04-29 16:53:02.550494', 'sansa', 0, 'д220бк', 'D220 с крышкой', 15);
INSERT INTO public.products VALUES (104, '2011-04-26 13:52:08.173768', 'sansa', '2011-04-29 16:53:11.15526', 'sansa', 0, 'д220б', 'D220', 15);
INSERT INTO public.products VALUES (117, '2011-04-26 13:56:00.057291', 'sansa', '2011-04-29 16:56:54.916575', 'sansa', 0, 'к3к', 'Кастрюля 3л с крышкой-сковородой', 15);
INSERT INTO public.products VALUES (118, '2011-04-26 13:56:10.80715', 'sansa', '2011-04-29 16:56:35.223949', 'sansa', 0, 'к5к', 'Кастрюля 5л с крышкой-сковородой', 15);
INSERT INTO public.products VALUES (119, '2011-04-26 13:56:21.397782', 'sansa', '2011-04-29 16:56:22.057077', 'sansa', 0, 'к3ск', 'Кастрюля 3л со стеклянной крышкой', 15);
INSERT INTO public.products VALUES (120, '2011-04-26 13:56:30.851884', 'sansa', '2011-04-29 16:55:19.952527', 'sansa', 0, 'к5ск', 'Кастрюля 5л со стеклянной крышкой', 15);
INSERT INTO public.products VALUES (121, '2011-04-26 13:57:10.128101', 'sansa', NULL, NULL, 0, 'Ручка 1', 'Ручка 1', 15);
INSERT INTO public.products VALUES (125, '2011-04-26 13:57:54.174267', 'sansa', NULL, NULL, 0, 'Винт', 'Винт', 15);
INSERT INTO public.products VALUES (126, '2011-04-26 13:58:30.227548', 'sansa', NULL, NULL, 0, 'Экран 1', 'Экран 1', 15);
INSERT INTO public.products VALUES (144, '2011-04-29 15:40:53.509731', 'sansa', '2011-04-29 16:57:20.559028', 'sansa', 0, 'Литники кг', 'Литники', 15);
INSERT INTO public.products VALUES (145, '2011-04-29 15:41:21.219141', 'sansa', '2011-04-29 16:57:27.243635', 'sansa', 0, 'стружка кг', 'стружка, кг', 15);
INSERT INTO public.products VALUES (141, '2011-04-29 14:50:20.196968', 'sansa', '2011-05-25 13:49:37.720163', 'sansa', 0, 'к5', 'Кастрюля 5л', 15);
INSERT INTO public.products VALUES (140, '2011-04-29 14:46:18.289513', 'sansa', '2011-05-25 14:27:29.690746', 'sansa', 0, 'к3', 'Кастрюля 3л', 15);
INSERT INTO public.products VALUES (192, '2011-06-17 17:34:40.83331', 'sansa', '2011-06-17 17:37:10.783273', 'sansa', 0, '1Пр11', 'кастрюля 3л сканди с кр-ой ск-ой ', 15);
INSERT INTO public.products VALUES (143, '2011-04-29 14:55:04.718283', 'sansa', '2011-05-25 13:49:13.777543', 'sansa', 0, 'кк5', 'Крышка кастрюли 5л', 15);
INSERT INTO public.products VALUES (142, '2011-04-29 14:52:23.054567', 'sansa', '2011-05-25 13:49:22.85533', 'sansa', 0, 'кк3', 'Крышка кастрюли 3л', 15);
INSERT INTO public.products VALUES (174, '2011-06-14 11:45:46.595101', 'sansa', NULL, NULL, 0, 'д240*40', 'д240*40', 15);
INSERT INTO public.products VALUES (175, '2011-06-14 11:46:06.416797', 'sansa', NULL, NULL, 0, 'д260*40', 'д260*40', 15);
INSERT INTO public.products VALUES (181, '2011-06-17 17:00:47.785499', 'sansa', NULL, NULL, 0, '2Пр10', 'сковорода ф240 сканди', 15);
INSERT INTO public.products VALUES (176, '2011-06-17 16:48:17.185835', 'sansa', '2011-06-17 17:01:27.573807', 'sansa', 0, '1Пр10', 'сковорода ф220 сканди', 15);
INSERT INTO public.products VALUES (186, '2011-06-17 17:28:12.024486', 'sansa', NULL, NULL, 0, '5Пр10', 'сковорода ф220 сканди ск', 15);
INSERT INTO public.products VALUES (205, '2011-06-17 18:02:43.337866', 'sansa', NULL, NULL, 0, '6Пр10', 'сковорода ф240 сканди ск', 15);
INSERT INTO public.products VALUES (195, '2011-06-17 17:55:11.657401', 'sansa', '2011-06-17 17:55:40.193388', 'sansa', 0, '3Пр10', 'сковорода ф260 сканди', 15);
INSERT INTO public.products VALUES (210, '2011-06-17 18:06:02.955274', 'sansa', NULL, NULL, 0, '7Пр10', 'сковорода ф260 сканди ск', 15);
INSERT INTO public.products VALUES (217, '2011-06-17 18:09:32.747316', 'sansa', NULL, NULL, 0, '8Пр10', 'сковорода ф280 сканди ск', 15);
INSERT INTO public.products VALUES (224, '2011-06-20 11:27:01.599544', 'sansa', '2011-06-20 11:27:23.539049', 'sansa', 0, '2Пр11', 'кастрюля 3л сканди со ст-ой крышкой', 15);
INSERT INTO public.products VALUES (230, '2011-06-23 14:44:40.252381', 'sansa', '2011-06-23 14:48:09.813657', 'sansa', 0, '3Пр11', 'кастрюля 5л сканди с кр-ой ск-ой', 15);
INSERT INTO public.products VALUES (200, '2011-06-17 17:59:30.24011', 'sansa', '2011-06-23 16:08:32.382382', 'sansa', 0, '4Пр10', 'сковорода ф280 сканди', 15);
INSERT INTO public.products VALUES (228, '2011-06-20 17:41:10.901274', 'sansa', '2011-06-23 16:54:50.025194', 'sansa', 0, 'д200скб', 'блинная сковорода ф200 сканди', 15);
INSERT INTO public.products VALUES (236, '2011-06-23 14:59:53.224786', 'sansa', NULL, NULL, 0, '9Пр10', 'сковорода ф220 матрикс', 15);
INSERT INTO public.products VALUES (241, '2011-06-23 15:02:00.695195', 'sansa', NULL, NULL, 0, '10Пр10', 'сковорода ф240 матрикс', 15);
INSERT INTO public.products VALUES (246, '2011-06-23 15:03:20.756883', 'sansa', NULL, NULL, 0, '11Пр10', 'сковорода ф260 матрикс', 15);
INSERT INTO public.products VALUES (251, '2011-06-23 15:04:37.110203', 'sansa', NULL, NULL, 0, '12Пр10', 'сковорода ф280 матрикс', 15);
INSERT INTO public.products VALUES (256, '2011-06-23 15:05:39.049634', 'sansa', '2011-06-23 15:08:42.365542', 'sansa', 0, '13Пр10', 'сковорода ф220 матрикс с крышкой', 15);
INSERT INTO public.products VALUES (262, '2011-06-23 15:10:40.399992', 'sansa', NULL, NULL, 0, '14Пр10', 'сковорода ф240 матрикс с крышкой', 15);
INSERT INTO public.products VALUES (268, '2011-06-23 15:12:46.448902', 'sansa', NULL, NULL, 0, '15Пр10', 'сковорода ф260 матрикс с крышкой', 15);
INSERT INTO public.products VALUES (274, '2011-06-23 15:14:06.922368', 'sansa', NULL, NULL, 0, '16Пр10', 'сковорода ф280 матрикс с крышкой', 15);
INSERT INTO public.products VALUES (280, '2011-06-23 15:15:15.010183', 'sansa', NULL, NULL, 0, '1А10', 'сковорода ф220 ', 15);
INSERT INTO public.products VALUES (285, '2011-06-23 15:16:41.907877', 'sansa', NULL, NULL, 0, '2А10', 'сковорода ф240', 15);
INSERT INTO public.products VALUES (290, '2011-06-23 15:18:00.137394', 'sansa', NULL, NULL, 0, '3А10', 'сковорода ф260', 15);
INSERT INTO public.products VALUES (295, '2011-06-23 15:19:17.813638', 'sansa', NULL, NULL, 0, '4А10', 'сковорода ф280', 15);
INSERT INTO public.products VALUES (300, '2011-06-23 15:21:47.986262', 'sansa', NULL, NULL, 0, '5А10', 'сковорода ф220 с крышкой', 15);
INSERT INTO public.products VALUES (306, '2011-06-23 15:23:56.743537', 'sansa', NULL, NULL, 0, '6А10', 'сковорода ф240 с крышкой', 15);
INSERT INTO public.products VALUES (312, '2011-06-23 15:25:06.990705', 'sansa', NULL, NULL, 0, '7А10', 'сковорода ф260 с крышкой', 15);
INSERT INTO public.products VALUES (318, '2011-06-23 15:28:08.849071', 'sansa', NULL, NULL, 0, '9А11', 'кастрюля 3л алюм.литая с кр-ой ск-ой', 15);
INSERT INTO public.products VALUES (321, '2011-06-23 15:30:15.602795', 'sansa', NULL, NULL, 0, '11А11', 'кастрюля 5л алюм.литая с кр-ой ск-ой', 15);
INSERT INTO public.products VALUES (324, '2011-06-23 15:32:19.429205', 'sansa', NULL, NULL, 0, '10А11', 'кастрюля 3л алюм.литая со ст-ой кр-ой', 15);
INSERT INTO public.products VALUES (327, '2011-06-23 15:33:27.739177', 'sansa', NULL, NULL, 0, '12А11', 'кастрюля 5л алюм.литая со ст-ой кр-ой', 15);
INSERT INTO public.products VALUES (330, '2011-06-23 15:58:35.394353', 'sansa', NULL, NULL, 0, 'кк5ск', 'крышка кастрюли 5л сканди', 15);
INSERT INTO public.products VALUES (331, '2011-06-23 15:58:58.120557', 'sansa', NULL, NULL, 0, 'кк3ск', 'крышка кастрюли 3л сканди', 15);
INSERT INTO public.products VALUES (334, '2011-06-23 16:28:48.988479', 'sansa', '2011-06-23 16:38:30.814334', 'sansa', 0, 'Экран2', 'экран2', 15);
INSERT INTO public.products VALUES (335, '2011-06-23 16:29:04.509327', 'sansa', '2011-06-23 16:51:12.725696', 'sansa', 0, 'Ручка2', 'ручка2', 15);
INSERT INTO public.products VALUES (333, '2011-06-23 16:28:24.444343', 'sansa', '2011-06-23 16:31:46.909136', 'sansa', 0, '11Пр11', 'сковорода блинная ф200 сканди', 15);
INSERT INTO public.products VALUES (347, '2011-06-23 16:58:36.279082', 'sansa', NULL, NULL, 0, '12Пр11', 'сковорода блинная ф240 сканди', 15);
INSERT INTO public.products VALUES (351, '2011-06-23 16:59:57.747572', 'sansa', NULL, NULL, 0, 'д240скб', 'блинная сковорода ф240 сканди', 15);
INSERT INTO public.products VALUES (381, '2011-07-12 18:02:46.663843', 'sansa', NULL, NULL, 0, 'оля', 'оля', 15);


--
-- Data for Name: products_tree; Type: TABLE DATA; Schema: public; Owner: sansa
--

INSERT INTO public.products_tree VALUES (15, '2011-04-09 16:29:42.477207', 'sansa', NULL, NULL, 0, 'Изделия', 0, '15', NULL);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: sansa
--

INSERT INTO public.recipes VALUES (248, '2011-06-23 15:03:53.62478', 'sansa', NULL, NULL, 0, 125, 1, 246);
INSERT INTO public.recipes VALUES (128, '2011-04-26 16:07:39.203642', 'sansa', NULL, NULL, 0, 84, 1, 88);
INSERT INTO public.recipes VALUES (129, '2011-04-26 16:08:04.340959', 'sansa', NULL, NULL, 0, 84, 1, 92);
INSERT INTO public.recipes VALUES (130, '2011-04-26 16:08:19.346798', 'sansa', NULL, NULL, 0, 113, 1, 92);
INSERT INTO public.recipes VALUES (131, '2011-04-26 16:08:40.865301', 'sansa', NULL, NULL, 0, 125, 1, 92);
INSERT INTO public.recipes VALUES (132, '2011-04-26 16:10:47.198363', 'sansa', NULL, NULL, 0, 121, 1, 92);
INSERT INTO public.recipes VALUES (133, '2011-04-26 16:11:11.415606', 'sansa', NULL, NULL, 0, 126, 1, 92);
INSERT INTO public.recipes VALUES (136, '2011-04-26 16:12:52.744307', 'sansa', NULL, NULL, 0, 125, 1, 89);
INSERT INTO public.recipes VALUES (137, '2011-04-26 16:13:50.60266', 'sansa', NULL, NULL, 0, 125, 1, 88);
INSERT INTO public.recipes VALUES (138, '2011-04-26 16:26:31.037716', 'sansa', NULL, NULL, 0, 121, 1, 88);
INSERT INTO public.recipes VALUES (139, '2011-04-26 16:27:54.552068', 'sansa', NULL, NULL, 0, 125, 1, 98);
INSERT INTO public.recipes VALUES (148, '2011-05-25 12:55:04.251803', 'sansa', NULL, NULL, 0, 125, 1, 108);
INSERT INTO public.recipes VALUES (149, '2011-05-25 12:55:43.667652', 'sansa', NULL, NULL, 0, 126, 1, 108);
INSERT INTO public.recipes VALUES (150, '2011-05-25 12:56:18.163961', 'sansa', NULL, NULL, 0, 84, 1, 108);
INSERT INTO public.recipes VALUES (151, '2011-05-25 12:56:46.83906', 'sansa', NULL, NULL, 0, 113, 1, 108);
INSERT INTO public.recipes VALUES (152, '2011-05-25 12:57:15.692411', 'sansa', NULL, NULL, 0, 121, 1, 108);
INSERT INTO public.recipes VALUES (153, '2011-05-25 13:13:05.123915', 'sansa', NULL, NULL, 0, 89, 1, 89);
INSERT INTO public.recipes VALUES (155, '2011-05-25 13:15:29.343845', 'sansa', NULL, NULL, 0, 121, 1, 89);
INSERT INTO public.recipes VALUES (156, '2011-05-25 13:16:05.88231', 'sansa', NULL, NULL, 0, 126, 1, 89);
INSERT INTO public.recipes VALUES (157, '2011-05-25 13:17:07.24231', 'sansa', NULL, NULL, 0, 125, 1, 93);
INSERT INTO public.recipes VALUES (158, '2011-05-25 13:19:17.224971', 'sansa', NULL, NULL, 0, 88, 1, 93);
INSERT INTO public.recipes VALUES (159, '2011-05-25 13:19:57.91124', 'sansa', NULL, NULL, 0, 121, 1, 93);
INSERT INTO public.recipes VALUES (160, '2011-05-25 14:29:08.877545', 'sansa', NULL, NULL, 0, 125, 1, 103);
INSERT INTO public.recipes VALUES (161, '2011-05-25 14:29:40.170701', 'sansa', NULL, NULL, 0, 91, 1, 103);
INSERT INTO public.recipes VALUES (162, '2011-05-25 14:30:14.57264', 'sansa', NULL, NULL, 0, 126, 1, 103);
INSERT INTO public.recipes VALUES (163, '2011-05-25 14:30:35.191983', 'sansa', NULL, NULL, 0, 121, 1, 103);
INSERT INTO public.recipes VALUES (164, '2011-05-25 14:31:03.463265', 'sansa', NULL, NULL, 0, 116, 1, 103);
INSERT INTO public.recipes VALUES (165, '2011-05-25 14:34:11.905221', 'sansa', NULL, NULL, 0, 125, 1, 91);
INSERT INTO public.recipes VALUES (166, '2011-05-25 14:34:50.407689', 'sansa', NULL, NULL, 0, 91, 1, 91);
INSERT INTO public.recipes VALUES (167, '2011-05-25 14:35:20.182901', 'sansa', NULL, NULL, 0, 121, 1, 91);
INSERT INTO public.recipes VALUES (168, '2011-05-25 14:35:36.474506', 'sansa', NULL, NULL, 0, 126, 1, 91);
INSERT INTO public.recipes VALUES (169, '2011-05-25 14:35:59.101759', 'sansa', NULL, NULL, 0, 125, 1, 102);
INSERT INTO public.recipes VALUES (170, '2011-05-25 14:40:55.419081', 'sansa', NULL, NULL, 0, 98, 1, 102);
INSERT INTO public.recipes VALUES (171, '2011-05-25 14:41:11.944174', 'sansa', NULL, NULL, 0, 121, 1, 102);
INSERT INTO public.recipes VALUES (172, '2011-05-25 14:41:52.184569', 'sansa', NULL, NULL, 0, 116, 1, 102);
INSERT INTO public.recipes VALUES (173, '2011-05-25 15:03:13.692901', 'sansa', NULL, NULL, 0, 126, 1, 102);
INSERT INTO public.recipes VALUES (177, '2011-06-17 16:49:09.277685', 'sansa', NULL, NULL, 0, 88, 1, 176);
INSERT INTO public.recipes VALUES (178, '2011-06-17 16:50:08.890893', 'sansa', NULL, NULL, 0, 126, 1, 176);
INSERT INTO public.recipes VALUES (179, '2011-06-17 16:50:53.820513', 'sansa', NULL, NULL, 0, 121, 1, 176);
INSERT INTO public.recipes VALUES (180, '2011-06-17 16:51:18.32193', 'sansa', NULL, NULL, 0, 125, 1, 176);
INSERT INTO public.recipes VALUES (182, '2011-06-17 17:02:23.593222', 'sansa', NULL, NULL, 0, 125, 1, 181);
INSERT INTO public.recipes VALUES (183, '2011-06-17 17:02:42.171971', 'sansa', NULL, NULL, 0, 126, 1, 181);
INSERT INTO public.recipes VALUES (184, '2011-06-17 17:02:59.497047', 'sansa', NULL, NULL, 0, 89, 1, 181);
INSERT INTO public.recipes VALUES (185, '2011-06-17 17:03:21.585507', 'sansa', NULL, NULL, 0, 121, 1, 181);
INSERT INTO public.recipes VALUES (187, '2011-06-17 17:30:37.62535', 'sansa', NULL, NULL, 0, 88, 1, 186);
INSERT INTO public.recipes VALUES (188, '2011-06-17 17:31:51.950077', 'sansa', NULL, NULL, 0, 113, 1, 186);
INSERT INTO public.recipes VALUES (189, '2011-06-17 17:32:30.900262', 'sansa', NULL, NULL, 0, 121, 1, 186);
INSERT INTO public.recipes VALUES (190, '2011-06-17 17:32:46.257545', 'sansa', NULL, NULL, 0, 126, 1, 186);
INSERT INTO public.recipes VALUES (191, '2011-06-17 17:33:04.10365', 'sansa', NULL, NULL, 0, 125, 1, 186);
INSERT INTO public.recipes VALUES (193, '2011-06-17 17:50:12.523299', 'sansa', NULL, NULL, 0, 119, 1, 192);
INSERT INTO public.recipes VALUES (194, '2011-06-17 17:52:29.337527', 'sansa', NULL, NULL, 0, 331, 1, 192);
INSERT INTO public.recipes VALUES (196, '2011-06-17 17:56:38.489535', 'sansa', NULL, NULL, 0, 90, 1, 195);
INSERT INTO public.recipes VALUES (197, '2011-06-17 17:57:12.614295', 'sansa', NULL, NULL, 0, 125, 1, 195);
INSERT INTO public.recipes VALUES (198, '2011-06-17 17:57:34.18532', 'sansa', NULL, NULL, 0, 121, 1, 195);
INSERT INTO public.recipes VALUES (199, '2011-06-17 17:57:52.440233', 'sansa', NULL, NULL, 0, 126, 1, 195);
INSERT INTO public.recipes VALUES (201, '2011-06-17 18:00:00.788693', 'sansa', NULL, NULL, 0, 91, 1, 200);
INSERT INTO public.recipes VALUES (202, '2011-06-17 18:00:19.535044', 'sansa', NULL, NULL, 0, 125, 1, 200);
INSERT INTO public.recipes VALUES (203, '2011-06-17 18:00:34.193597', 'sansa', NULL, NULL, 0, 126, 1, 200);
INSERT INTO public.recipes VALUES (204, '2011-06-17 18:00:48.840006', 'sansa', NULL, NULL, 0, 121, 1, 200);
INSERT INTO public.recipes VALUES (206, '2011-06-17 18:03:25.279319', 'sansa', NULL, NULL, 0, 89, 1, 205);
INSERT INTO public.recipes VALUES (231, '2011-06-23 14:50:01.864775', 'sansa', NULL, NULL, 0, 141, 1, 230);
INSERT INTO public.recipes VALUES (207, '2011-06-17 18:04:49.293921', 'sansa', NULL, NULL, 0, 125, 1, 205);
INSERT INTO public.recipes VALUES (208, '2011-06-17 18:05:02.802621', 'sansa', NULL, NULL, 0, 126, 1, 205);
INSERT INTO public.recipes VALUES (209, '2011-06-17 18:05:18.12559', 'sansa', NULL, NULL, 0, 121, 1, 205);
INSERT INTO public.recipes VALUES (211, '2011-06-17 18:06:51.373261', 'sansa', NULL, NULL, 0, 114, 1, 205);
INSERT INTO public.recipes VALUES (212, '2011-06-17 18:07:21.43863', 'sansa', NULL, NULL, 0, 90, 1, 210);
INSERT INTO public.recipes VALUES (213, '2011-06-17 18:07:42.413816', 'sansa', NULL, NULL, 0, 115, 1, 210);
INSERT INTO public.recipes VALUES (214, '2011-06-17 18:07:57.708314', 'sansa', NULL, NULL, 0, 125, 1, 210);
INSERT INTO public.recipes VALUES (215, '2011-06-17 18:08:18.404421', 'sansa', NULL, NULL, 0, 121, 1, 210);
INSERT INTO public.recipes VALUES (216, '2011-06-17 18:08:35.135581', 'sansa', NULL, NULL, 0, 126, 1, 210);
INSERT INTO public.recipes VALUES (218, '2011-06-17 18:10:26.026745', 'sansa', NULL, NULL, 0, 91, 1, 217);
INSERT INTO public.recipes VALUES (219, '2011-06-17 18:25:57.985031', 'sansa', NULL, NULL, 0, 125, 1, 217);
INSERT INTO public.recipes VALUES (220, '2011-06-17 18:26:16.974692', 'sansa', NULL, NULL, 0, 126, 1, 217);
INSERT INTO public.recipes VALUES (221, '2011-06-17 18:26:52.645409', 'sansa', NULL, NULL, 0, 121, 1, 217);
INSERT INTO public.recipes VALUES (222, '2011-06-17 18:27:28.761782', 'sansa', NULL, NULL, 0, 116, 1, 217);
INSERT INTO public.recipes VALUES (225, '2011-06-20 11:28:15.558564', 'sansa', NULL, NULL, 0, 112, 1, 224);
INSERT INTO public.recipes VALUES (232, '2011-06-23 14:50:26.011873', 'sansa', NULL, NULL, 0, 330, 1, 230);
INSERT INTO public.recipes VALUES (234, '2011-06-23 14:52:34.049741', 'sansa', NULL, NULL, 0, 141, 1, 233);
INSERT INTO public.recipes VALUES (235, '2011-06-23 14:52:51.555147', 'sansa', NULL, NULL, 0, 114, 1, 233);
INSERT INTO public.recipes VALUES (237, '2011-06-23 15:00:35.059155', 'sansa', NULL, NULL, 0, 95, 1, 236);
INSERT INTO public.recipes VALUES (238, '2011-06-23 15:01:02.992115', 'sansa', NULL, NULL, 0, 125, 1, 236);
INSERT INTO public.recipes VALUES (239, '2011-06-23 15:01:09.664633', 'sansa', NULL, NULL, 0, 126, 1, 236);
INSERT INTO public.recipes VALUES (240, '2011-06-23 15:01:17.554065', 'sansa', NULL, NULL, 0, 121, 1, 236);
INSERT INTO public.recipes VALUES (242, '2011-06-23 15:02:19.204521', 'sansa', NULL, NULL, 0, 99, 1, 241);
INSERT INTO public.recipes VALUES (243, '2011-06-23 15:02:25.276821', 'sansa', NULL, NULL, 0, 121, 1, 241);
INSERT INTO public.recipes VALUES (244, '2011-06-23 15:02:28.577814', 'sansa', NULL, NULL, 0, 125, 1, 241);
INSERT INTO public.recipes VALUES (245, '2011-06-23 15:02:33.648758', 'sansa', NULL, NULL, 0, 126, 1, 241);
INSERT INTO public.recipes VALUES (247, '2011-06-23 15:03:49.711415', 'sansa', NULL, NULL, 0, 97, 1, 246);
INSERT INTO public.recipes VALUES (249, '2011-06-23 15:03:58.304722', 'sansa', NULL, NULL, 0, 126, 1, 246);
INSERT INTO public.recipes VALUES (250, '2011-06-23 15:04:03.415815', 'sansa', NULL, NULL, 0, 121, 1, 246);
INSERT INTO public.recipes VALUES (252, '2011-06-23 15:04:50.521465', 'sansa', NULL, NULL, 0, 91, 1, 251);
INSERT INTO public.recipes VALUES (253, '2011-06-23 15:04:57.662774', 'sansa', NULL, NULL, 0, 126, 1, 251);
INSERT INTO public.recipes VALUES (254, '2011-06-23 15:05:01.802317', 'sansa', NULL, NULL, 0, 125, 1, 251);
INSERT INTO public.recipes VALUES (255, '2011-06-23 15:05:05.962034', 'sansa', NULL, NULL, 0, 121, 1, 251);
INSERT INTO public.recipes VALUES (257, '2011-06-23 15:06:25.36397', 'sansa', NULL, NULL, 0, 95, 1, 256);
INSERT INTO public.recipes VALUES (258, '2011-06-23 15:06:30.409233', 'sansa', NULL, NULL, 0, 126, 1, 256);
INSERT INTO public.recipes VALUES (259, '2011-06-23 15:06:35.563419', 'sansa', NULL, NULL, 0, 121, 1, 256);
INSERT INTO public.recipes VALUES (260, '2011-06-23 15:06:38.876092', 'sansa', NULL, NULL, 0, 125, 1, 256);
INSERT INTO public.recipes VALUES (261, '2011-06-23 15:09:43.527393', 'sansa', NULL, NULL, 0, 113, 1, 256);
INSERT INTO public.recipes VALUES (263, '2011-06-23 15:10:52.569795', 'sansa', NULL, NULL, 0, 125, 1, 262);
INSERT INTO public.recipes VALUES (264, '2011-06-23 15:11:15.808779', 'sansa', NULL, NULL, 0, 99, 1, 262);
INSERT INTO public.recipes VALUES (265, '2011-06-23 15:11:28.331316', 'sansa', NULL, NULL, 0, 114, 1, 262);
INSERT INTO public.recipes VALUES (266, '2011-06-23 15:11:45.130878', 'sansa', NULL, NULL, 0, 126, 1, 262);
INSERT INTO public.recipes VALUES (267, '2011-06-23 15:11:54.172808', 'sansa', NULL, NULL, 0, 121, 1, 262);
INSERT INTO public.recipes VALUES (269, '2011-06-23 15:13:09.166937', 'sansa', NULL, NULL, 0, 97, 1, 268);
INSERT INTO public.recipes VALUES (270, '2011-06-23 15:13:15.990411', 'sansa', NULL, NULL, 0, 115, 1, 268);
INSERT INTO public.recipes VALUES (271, '2011-06-23 15:13:22.778778', 'sansa', NULL, NULL, 0, 125, 1, 268);
INSERT INTO public.recipes VALUES (272, '2011-06-23 15:13:30.043956', 'sansa', NULL, NULL, 0, 126, 1, 268);
INSERT INTO public.recipes VALUES (273, '2011-06-23 15:13:33.864857', 'sansa', NULL, NULL, 0, 121, 1, 268);
INSERT INTO public.recipes VALUES (275, '2011-06-23 15:14:22.278555', 'sansa', NULL, NULL, 0, 98, 1, 274);
INSERT INTO public.recipes VALUES (276, '2011-06-23 15:14:29.415259', 'sansa', NULL, NULL, 0, 116, 1, 274);
INSERT INTO public.recipes VALUES (277, '2011-06-23 15:14:34.888971', 'sansa', NULL, NULL, 0, 125, 1, 274);
INSERT INTO public.recipes VALUES (278, '2011-06-23 15:14:38.582992', 'sansa', NULL, NULL, 0, 126, 1, 274);
INSERT INTO public.recipes VALUES (279, '2011-06-23 15:14:42.026449', 'sansa', NULL, NULL, 0, 121, 1, 274);
INSERT INTO public.recipes VALUES (281, '2011-06-23 15:15:33.046283', 'sansa', NULL, NULL, 0, 84, 1, 280);
INSERT INTO public.recipes VALUES (282, '2011-06-23 15:15:40.147041', 'sansa', NULL, NULL, 0, 125, 1, 280);
INSERT INTO public.recipes VALUES (283, '2011-06-23 15:15:44.647277', 'sansa', NULL, NULL, 0, 126, 1, 280);
INSERT INTO public.recipes VALUES (284, '2011-06-23 15:15:48.702532', 'sansa', NULL, NULL, 0, 121, 1, 280);
INSERT INTO public.recipes VALUES (286, '2011-06-23 15:17:11.987875', 'sansa', NULL, NULL, 0, 85, 1, 285);
INSERT INTO public.recipes VALUES (287, '2011-06-23 15:17:15.332496', 'sansa', NULL, NULL, 0, 125, 1, 285);
INSERT INTO public.recipes VALUES (288, '2011-06-23 15:17:19.224354', 'sansa', NULL, NULL, 0, 126, 1, 285);
INSERT INTO public.recipes VALUES (289, '2011-06-23 15:17:24.431901', 'sansa', NULL, NULL, 0, 121, 1, 285);
INSERT INTO public.recipes VALUES (291, '2011-06-23 15:18:45.961611', 'sansa', NULL, NULL, 0, 86, 1, 290);
INSERT INTO public.recipes VALUES (292, '2011-06-23 15:18:49.828153', 'sansa', NULL, NULL, 0, 125, 1, 290);
INSERT INTO public.recipes VALUES (293, '2011-06-23 15:18:53.204256', 'sansa', NULL, NULL, 0, 121, 1, 290);
INSERT INTO public.recipes VALUES (294, '2011-06-23 15:18:56.326284', 'sansa', NULL, NULL, 0, 126, 1, 290);
INSERT INTO public.recipes VALUES (296, '2011-06-23 15:19:35.588504', 'sansa', NULL, NULL, 0, 87, 1, 295);
INSERT INTO public.recipes VALUES (297, '2011-06-23 15:19:47.87941', 'sansa', NULL, NULL, 0, 125, 1, 295);
INSERT INTO public.recipes VALUES (298, '2011-06-23 15:19:52.076561', 'sansa', NULL, NULL, 0, 121, 1, 295);
INSERT INTO public.recipes VALUES (299, '2011-06-23 15:19:55.624434', 'sansa', NULL, NULL, 0, 126, 1, 295);
INSERT INTO public.recipes VALUES (301, '2011-06-23 15:22:39.812625', 'sansa', NULL, NULL, 0, 84, 1, 300);
INSERT INTO public.recipes VALUES (302, '2011-06-23 15:22:50.181919', 'sansa', NULL, NULL, 0, 113, 1, 300);
INSERT INTO public.recipes VALUES (303, '2011-06-23 15:22:53.987475', 'sansa', NULL, NULL, 0, 125, 1, 300);
INSERT INTO public.recipes VALUES (304, '2011-06-23 15:22:58.644498', 'sansa', NULL, NULL, 0, 121, 1, 300);
INSERT INTO public.recipes VALUES (305, '2011-06-23 15:23:06.716603', 'sansa', NULL, NULL, 0, 126, 1, 300);
INSERT INTO public.recipes VALUES (307, '2011-06-23 15:24:08.539841', 'sansa', NULL, NULL, 0, 85, 1, 306);
INSERT INTO public.recipes VALUES (308, '2011-06-23 15:24:15.965922', 'sansa', NULL, NULL, 0, 114, 1, 306);
INSERT INTO public.recipes VALUES (309, '2011-06-23 15:24:20.691197', 'sansa', NULL, NULL, 0, 125, 1, 306);
INSERT INTO public.recipes VALUES (310, '2011-06-23 15:24:24.399279', 'sansa', NULL, NULL, 0, 121, 1, 306);
INSERT INTO public.recipes VALUES (311, '2011-06-23 15:24:27.875324', 'sansa', NULL, NULL, 0, 126, 1, 306);
INSERT INTO public.recipes VALUES (313, '2011-06-23 15:25:28.328762', 'sansa', NULL, NULL, 0, 86, 1, 312);
INSERT INTO public.recipes VALUES (314, '2011-06-23 15:25:35.240561', 'sansa', NULL, NULL, 0, 125, 1, 312);
INSERT INTO public.recipes VALUES (315, '2011-06-23 15:25:42.257805', 'sansa', NULL, NULL, 0, 115, 1, 312);
INSERT INTO public.recipes VALUES (316, '2011-06-23 15:25:48.104912', 'sansa', NULL, NULL, 0, 121, 1, 312);
INSERT INTO public.recipes VALUES (317, '2011-06-23 15:25:52.438622', 'sansa', NULL, NULL, 0, 126, 1, 312);
INSERT INTO public.recipes VALUES (319, '2011-06-23 15:28:52.93174', 'sansa', NULL, NULL, 0, 140, 1, 318);
INSERT INTO public.recipes VALUES (320, '2011-06-23 15:29:13.030026', 'sansa', NULL, NULL, 0, 142, 1, 318);
INSERT INTO public.recipes VALUES (322, '2011-06-23 15:30:35.379034', 'sansa', NULL, NULL, 0, 141, 1, 321);
INSERT INTO public.recipes VALUES (323, '2011-06-23 15:30:45.225373', 'sansa', NULL, NULL, 0, 143, 1, 321);
INSERT INTO public.recipes VALUES (325, '2011-06-23 15:32:32.889745', 'sansa', NULL, NULL, 0, 140, 1, 324);
INSERT INTO public.recipes VALUES (326, '2011-06-23 15:32:43.216042', 'sansa', NULL, NULL, 0, 112, 1, 324);
INSERT INTO public.recipes VALUES (328, '2011-06-23 15:33:40.896231', 'sansa', NULL, NULL, 0, 141, 1, 327);
INSERT INTO public.recipes VALUES (329, '2011-06-23 15:33:50.223663', 'sansa', NULL, NULL, 0, 114, 1, 327);
INSERT INTO public.recipes VALUES (226, '2011-06-20 11:29:18.280502', 'sansa', NULL, NULL, 0, 119, 1, 224);
INSERT INTO public.recipes VALUES (336, '2011-06-23 16:30:23.943812', 'sansa', NULL, NULL, 0, 125, 1, 333);
INSERT INTO public.recipes VALUES (340, '2011-06-23 16:37:42.978787', 'sansa', NULL, NULL, 0, 334, 1, 333);
INSERT INTO public.recipes VALUES (341, '2011-06-23 16:37:48.805991', 'sansa', NULL, NULL, 0, 335, 1, 333);
INSERT INTO public.recipes VALUES (346, '2011-06-23 16:57:54.589906', 'sansa', NULL, NULL, 0, 228, 1, 333);
INSERT INTO public.recipes VALUES (348, '2011-06-23 16:59:20.285661', 'sansa', NULL, NULL, 0, 125, 1, 347);
INSERT INTO public.recipes VALUES (349, '2011-06-23 16:59:26.056415', 'sansa', NULL, NULL, 0, 334, 1, 347);
INSERT INTO public.recipes VALUES (350, '2011-06-23 16:59:30.222893', 'sansa', NULL, NULL, 0, 335, 1, 347);
INSERT INTO public.recipes VALUES (352, '2011-06-23 17:02:00.639847', 'sansa', NULL, NULL, 0, 351, 1, 347);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: sansa
--

INSERT INTO public.users VALUES ('sansa', 'Строев С.В.');


--
-- Data for Name: base_operations; Type: TABLE DATA; Schema: storage; Owner: sansa
--

INSERT INTO storage.base_operations VALUES (112, 1, '2011-04-20 00:00:00', 35, 143, -119, NULL);
INSERT INTO storage.base_operations VALUES (112, 0, '2011-04-20 00:00:00', 83, 143, 119, NULL);
INSERT INTO storage.base_operations VALUES (112, 3, '2011-04-20 00:00:00', 35, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (112, 4, '2011-04-20 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (112, 5, '2011-04-20 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (112, 6, '2011-04-20 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (272, 1, '2011-04-26 00:00:00', 38, 141, -161, NULL);
INSERT INTO storage.base_operations VALUES (272, 0, '2011-04-26 00:00:00', 62, 141, 161, NULL);
INSERT INTO storage.base_operations VALUES (272, 3, '2011-04-26 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (272, 4, '2011-04-26 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (272, 5, '2011-04-26 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (453, 5, '2011-05-26 00:00:00', 9, 175, 1, NULL);
INSERT INTO storage.base_operations VALUES (81, 1, '2011-04-19 00:00:00', 38, 87, -208, NULL);
INSERT INTO storage.base_operations VALUES (81, 0, '2011-04-19 00:00:00', 8, 87, 208, NULL);
INSERT INTO storage.base_operations VALUES (81, 3, '2011-04-19 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (81, 4, '2011-04-19 00:00:00', 8, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (81, 5, '2011-04-19 00:00:00', 9, 87, 2, NULL);
INSERT INTO storage.base_operations VALUES (81, 6, '2011-04-19 00:00:00', 8, 87, -2, NULL);
INSERT INTO storage.base_operations VALUES (113, 1, '2011-04-20 00:00:00', 35, 143, -240, NULL);
INSERT INTO storage.base_operations VALUES (113, 0, '2011-04-20 00:00:00', 83, 143, 240, NULL);
INSERT INTO storage.base_operations VALUES (113, 3, '2011-04-20 00:00:00', 35, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (113, 4, '2011-04-20 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (113, 5, '2011-04-20 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (453, 6, '2011-05-26 00:00:00', 37, 175, -1, NULL);
INSERT INTO storage.base_operations VALUES (203, 1, '2011-05-03 00:00:00', 30, 141, -161, NULL);
INSERT INTO storage.base_operations VALUES (203, 0, '2011-05-03 00:00:00', 38, 141, 161, NULL);
INSERT INTO storage.base_operations VALUES (203, 3, '2011-05-03 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (203, 4, '2011-05-03 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (203, 5, '2011-05-03 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (203, 6, '2011-05-03 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (87, 1, '2011-04-19 00:00:00', 83, 140, -70, NULL);
INSERT INTO storage.base_operations VALUES (87, 0, '2011-04-19 00:00:00', 30, 140, 70, NULL);
INSERT INTO storage.base_operations VALUES (87, 3, '2011-04-19 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (87, 4, '2011-04-19 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (87, 5, '2011-04-19 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (87, 6, '2011-04-19 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (89, 1, '2011-04-19 00:00:00', 83, 143, -97, NULL);
INSERT INTO storage.base_operations VALUES (89, 0, '2011-04-19 00:00:00', 30, 143, 97, NULL);
INSERT INTO storage.base_operations VALUES (89, 3, '2011-04-19 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (89, 4, '2011-04-19 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (89, 5, '2011-04-19 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (89, 6, '2011-04-19 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (1298, 1, '2011-08-02 00:00:00', 83, 381, -131, NULL);
INSERT INTO storage.base_operations VALUES (1298, 0, '2011-08-02 00:00:00', 30, 381, 131, NULL);
INSERT INTO storage.base_operations VALUES (1298, 3, '2011-08-02 00:00:00', 83, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1298, 4, '2011-08-02 00:00:00', 30, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1298, 5, '2011-08-02 00:00:00', 9, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1298, 6, '2011-08-02 00:00:00', 30, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1299, 1, '2011-08-02 00:00:00', 30, 381, -131, NULL);
INSERT INTO storage.base_operations VALUES (1299, 0, '2011-08-02 00:00:00', 61, 381, 131, NULL);
INSERT INTO storage.base_operations VALUES (1299, 3, '2011-08-02 00:00:00', 30, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1299, 4, '2011-08-02 00:00:00', 61, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1299, 5, '2011-08-02 00:00:00', 9, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1299, 6, '2011-08-02 00:00:00', 61, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1300, 1, '2011-08-02 00:00:00', 61, 381, -131, NULL);
INSERT INTO storage.base_operations VALUES (1300, 0, '2011-08-02 00:00:00', 37, 381, 131, NULL);
INSERT INTO storage.base_operations VALUES (1300, 3, '2011-08-02 00:00:00', 61, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1300, 4, '2011-08-02 00:00:00', 37, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1300, 5, '2011-08-02 00:00:00', 9, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1300, 6, '2011-08-02 00:00:00', 37, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (108, 1, '2011-04-20 00:00:00', 83, 143, -152, NULL);
INSERT INTO storage.base_operations VALUES (108, 0, '2011-04-20 00:00:00', 30, 143, 152, NULL);
INSERT INTO storage.base_operations VALUES (108, 3, '2011-04-20 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (108, 4, '2011-04-20 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (108, 5, '2011-04-20 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (108, 6, '2011-04-20 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (1301, 1, '2011-08-02 00:00:00', 37, 381, -131, NULL);
INSERT INTO storage.base_operations VALUES (1301, 0, '2011-08-02 00:00:00', 38, 381, 131, NULL);
INSERT INTO storage.base_operations VALUES (1301, 3, '2011-08-02 00:00:00', 37, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1301, 4, '2011-08-02 00:00:00', 38, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1301, 5, '2011-08-02 00:00:00', 9, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1301, 6, '2011-08-02 00:00:00', 38, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (110, 1, '2011-04-20 00:00:00', 35, 140, -89, NULL);
INSERT INTO storage.base_operations VALUES (110, 0, '2011-04-20 00:00:00', 83, 140, 89, NULL);
INSERT INTO storage.base_operations VALUES (110, 3, '2011-04-20 00:00:00', 35, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (110, 4, '2011-04-20 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (110, 5, '2011-04-20 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (110, 6, '2011-04-20 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (47, 1, '2011-04-19 00:00:00', 83, 141, -21, NULL);
INSERT INTO storage.base_operations VALUES (47, 0, '2011-04-19 00:00:00', 30, 141, 21, NULL);
INSERT INTO storage.base_operations VALUES (47, 3, '2011-04-19 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (47, 4, '2011-04-19 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (47, 5, '2011-04-19 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (47, 6, '2011-04-19 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (1302, 1, '2011-08-02 00:00:00', 35, 381, -63, NULL);
INSERT INTO storage.base_operations VALUES (1302, 0, '2011-08-02 00:00:00', 83, 381, 63, NULL);
INSERT INTO storage.base_operations VALUES (1302, 3, '2011-08-02 00:00:00', 35, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1302, 4, '2011-08-02 00:00:00', 83, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1302, 5, '2011-08-02 00:00:00', 9, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1302, 6, '2011-08-02 00:00:00', 83, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1303, 1, '2011-08-02 00:00:00', 83, 381, -63, NULL);
INSERT INTO storage.base_operations VALUES (1303, 0, '2011-08-02 00:00:00', 30, 381, 63, NULL);
INSERT INTO storage.base_operations VALUES (1303, 3, '2011-08-02 00:00:00', 83, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1303, 4, '2011-08-02 00:00:00', 30, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1303, 5, '2011-08-02 00:00:00', 9, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (272, 6, '2011-04-26 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (365, 1, '2011-05-14 00:00:00', 61, 85, -177, NULL);
INSERT INTO storage.base_operations VALUES (365, 0, '2011-05-14 00:00:00', 38, 85, 177, NULL);
INSERT INTO storage.base_operations VALUES (365, 3, '2011-05-14 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (365, 4, '2011-05-14 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (365, 5, '2011-05-14 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (83, 1, '2011-04-19 00:00:00', 35, 143, -97, NULL);
INSERT INTO storage.base_operations VALUES (83, 0, '2011-04-19 00:00:00', 83, 143, 97, NULL);
INSERT INTO storage.base_operations VALUES (83, 3, '2011-04-19 00:00:00', 35, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (83, 4, '2011-04-19 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (83, 5, '2011-04-19 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (83, 6, '2011-04-19 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (111, 1, '2011-04-20 00:00:00', 35, 140, -68, NULL);
INSERT INTO storage.base_operations VALUES (111, 0, '2011-04-20 00:00:00', 83, 140, 68, NULL);
INSERT INTO storage.base_operations VALUES (111, 3, '2011-04-20 00:00:00', 35, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (111, 4, '2011-04-20 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (111, 5, '2011-04-20 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (111, 6, '2011-04-20 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (84, 1, '2011-04-19 00:00:00', 35, 140, -70, NULL);
INSERT INTO storage.base_operations VALUES (84, 0, '2011-04-19 00:00:00', 83, 140, 70, NULL);
INSERT INTO storage.base_operations VALUES (84, 3, '2011-04-19 00:00:00', 35, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (84, 4, '2011-04-19 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (84, 5, '2011-04-19 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (53, 0, '2011-04-09 00:00:00', 35, 20, 100, NULL);
INSERT INTO storage.base_operations VALUES (53, 1, '2011-04-09 00:00:00', 33, 20, -100, NULL);
INSERT INTO storage.base_operations VALUES (54, 1, '2011-04-09 00:00:00', 35, 20, -50, NULL);
INSERT INTO storage.base_operations VALUES (54, 0, '2011-04-09 00:00:00', 33, 20, 50, NULL);
INSERT INTO storage.base_operations VALUES (55, 1, '2011-04-09 00:00:00', 35, 20, -25, NULL);
INSERT INTO storage.base_operations VALUES (55, 0, '2011-04-09 00:00:00', 30, 20, 25, NULL);
INSERT INTO storage.base_operations VALUES (56, 1, '2011-04-09 00:00:00', 37, 20, -20, NULL);
INSERT INTO storage.base_operations VALUES (56, 0, '2011-04-09 00:00:00', 38, 20, 20, NULL);
INSERT INTO storage.base_operations VALUES (58, 1, '2011-04-09 00:00:00', 35, -1, -2, NULL);
INSERT INTO storage.base_operations VALUES (58, 0, '2011-04-09 00:00:00', 9, -1, 2, NULL);
INSERT INTO storage.base_operations VALUES (59, 1, '2011-04-09 00:00:00', 35, 20, -2, NULL);
INSERT INTO storage.base_operations VALUES (59, 0, '2011-04-09 00:00:00', 9, 20, 2, NULL);
INSERT INTO storage.base_operations VALUES (60, 1, '2011-04-09 00:00:00', 33, 16, -500, NULL);
INSERT INTO storage.base_operations VALUES (60, 0, '2011-04-09 00:00:00', 9, 16, 500, NULL);
INSERT INTO storage.base_operations VALUES (63, 1, '2011-04-10 00:00:00', 9, -1, -1, NULL);
INSERT INTO storage.base_operations VALUES (63, 0, '2011-04-10 00:00:00', 9, -1, 1, NULL);
INSERT INTO storage.base_operations VALUES (64, 1, '2011-04-10 00:00:00', 37, 20, -1, NULL);
INSERT INTO storage.base_operations VALUES (64, 0, '2011-04-10 00:00:00', 9, 20, 1, NULL);
INSERT INTO storage.base_operations VALUES (66, 1, '2011-04-10 00:00:00', 38, 21, -200, NULL);
INSERT INTO storage.base_operations VALUES (66, 0, '2011-04-10 00:00:00', 30, 21, 200, NULL);
INSERT INTO storage.base_operations VALUES (84, 6, '2011-04-19 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (85, 1, '2011-04-19 00:00:00', 35, 142, -36, NULL);
INSERT INTO storage.base_operations VALUES (85, 0, '2011-04-19 00:00:00', 83, 142, 36, NULL);
INSERT INTO storage.base_operations VALUES (85, 3, '2011-04-19 00:00:00', 35, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (85, 4, '2011-04-19 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (85, 5, '2011-04-19 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (85, 6, '2011-04-19 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (88, 1, '2011-04-19 00:00:00', 83, 141, -24, NULL);
INSERT INTO storage.base_operations VALUES (88, 0, '2011-04-19 00:00:00', 30, 141, 24, NULL);
INSERT INTO storage.base_operations VALUES (88, 3, '2011-04-19 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (88, 4, '2011-04-19 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (88, 5, '2011-04-19 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (88, 6, '2011-04-19 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (113, 6, '2011-04-20 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (365, 6, '2011-05-14 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (283, 1, '2011-04-24 00:00:00', 35, 140, -58, NULL);
INSERT INTO storage.base_operations VALUES (283, 0, '2011-04-24 00:00:00', 83, 140, 58, NULL);
INSERT INTO storage.base_operations VALUES (283, 3, '2011-04-24 00:00:00', 35, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (283, 4, '2011-04-24 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (105, 1, '2011-04-20 00:00:00', 35, 142, -191, NULL);
INSERT INTO storage.base_operations VALUES (105, 0, '2011-04-20 00:00:00', 83, 142, 191, NULL);
INSERT INTO storage.base_operations VALUES (105, 3, '2011-04-20 00:00:00', 35, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (105, 4, '2011-04-20 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (105, 5, '2011-04-20 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (105, 6, '2011-04-20 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (116, 1, '2011-04-20 00:00:00', 83, 140, -157, NULL);
INSERT INTO storage.base_operations VALUES (116, 0, '2011-04-20 00:00:00', 30, 140, 157, NULL);
INSERT INTO storage.base_operations VALUES (116, 3, '2011-04-20 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (116, 4, '2011-04-20 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (116, 5, '2011-04-20 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (116, 6, '2011-04-20 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (232, 1, '2011-04-27 00:00:00', 8, 143, -200, NULL);
INSERT INTO storage.base_operations VALUES (232, 0, '2011-04-27 00:00:00', 147, 143, 200, NULL);
INSERT INTO storage.base_operations VALUES (232, 3, '2011-04-27 00:00:00', 8, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (232, 4, '2011-04-27 00:00:00', 147, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (106, 1, '2011-04-20 00:00:00', 35, 142, -153, NULL);
INSERT INTO storage.base_operations VALUES (106, 0, '2011-04-20 00:00:00', 83, 142, 153, NULL);
INSERT INTO storage.base_operations VALUES (106, 3, '2011-04-20 00:00:00', 35, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (106, 4, '2011-04-20 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (106, 5, '2011-04-20 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (106, 6, '2011-04-20 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (46, 1, '2011-04-19 00:00:00', 83, 140, -109, NULL);
INSERT INTO storage.base_operations VALUES (46, 0, '2011-04-19 00:00:00', 30, 140, 109, NULL);
INSERT INTO storage.base_operations VALUES (46, 3, '2011-04-19 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (46, 4, '2011-04-19 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (46, 5, '2011-04-19 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (46, 6, '2011-04-19 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (48, 1, '2011-04-19 00:00:00', 83, 143, -111, NULL);
INSERT INTO storage.base_operations VALUES (48, 0, '2011-04-19 00:00:00', 30, 143, 111, NULL);
INSERT INTO storage.base_operations VALUES (48, 3, '2011-04-19 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (48, 4, '2011-04-19 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (48, 5, '2011-04-19 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (48, 6, '2011-04-19 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (1303, 6, '2011-08-02 00:00:00', 30, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1304, 1, '2011-08-02 00:00:00', 30, 381, -63, NULL);
INSERT INTO storage.base_operations VALUES (1304, 0, '2011-08-02 00:00:00', 61, 381, 63, NULL);
INSERT INTO storage.base_operations VALUES (1304, 3, '2011-08-02 00:00:00', 30, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1304, 4, '2011-08-02 00:00:00', 61, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1304, 5, '2011-08-02 00:00:00', 9, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1304, 6, '2011-08-02 00:00:00', 61, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1305, 1, '2011-08-02 00:00:00', 61, 381, -63, NULL);
INSERT INTO storage.base_operations VALUES (1305, 0, '2011-08-02 00:00:00', 37, 381, 63, NULL);
INSERT INTO storage.base_operations VALUES (1305, 3, '2011-08-02 00:00:00', 61, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1305, 4, '2011-08-02 00:00:00', 37, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1305, 5, '2011-08-02 00:00:00', 9, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1305, 6, '2011-08-02 00:00:00', 37, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1306, 1, '2011-08-02 00:00:00', 37, 381, -63, NULL);
INSERT INTO storage.base_operations VALUES (1306, 0, '2011-08-02 00:00:00', 38, 381, 63, NULL);
INSERT INTO storage.base_operations VALUES (1306, 3, '2011-08-02 00:00:00', 37, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1306, 4, '2011-08-02 00:00:00', 38, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1306, 5, '2011-08-02 00:00:00', 9, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1306, 6, '2011-08-02 00:00:00', 38, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1307, 1, '2011-08-02 00:00:00', 38, 381, -285, NULL);
INSERT INTO storage.base_operations VALUES (1307, 0, '2011-08-02 00:00:00', 62, 381, 285, NULL);
INSERT INTO storage.base_operations VALUES (1307, 3, '2011-08-02 00:00:00', 38, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1307, 4, '2011-08-02 00:00:00', 62, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1307, 5, '2011-08-02 00:00:00', 9, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1307, 6, '2011-08-02 00:00:00', 62, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1308, 1, '2011-08-02 00:00:00', 62, 381, -285, NULL);
INSERT INTO storage.base_operations VALUES (1308, 0, '2011-08-02 00:00:00', 8, 381, 285, NULL);
INSERT INTO storage.base_operations VALUES (1308, 3, '2011-08-02 00:00:00', 62, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1308, 4, '2011-08-02 00:00:00', 8, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1308, 5, '2011-08-02 00:00:00', 9, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (86, 1, '2011-04-19 00:00:00', 38, 144, -2217, NULL);
INSERT INTO storage.base_operations VALUES (86, 0, '2011-04-19 00:00:00', 33, 144, 2217, NULL);
INSERT INTO storage.base_operations VALUES (86, 3, '2011-04-19 00:00:00', 38, 144, 0, NULL);
INSERT INTO storage.base_operations VALUES (86, 4, '2011-04-19 00:00:00', 33, 144, 0, NULL);
INSERT INTO storage.base_operations VALUES (86, 5, '2011-04-19 00:00:00', 9, 144, 0, NULL);
INSERT INTO storage.base_operations VALUES (86, 6, '2011-04-19 00:00:00', 33, 144, 0, NULL);
INSERT INTO storage.base_operations VALUES (132, 1, '2011-04-21 00:00:00', 35, 143, -120, NULL);
INSERT INTO storage.base_operations VALUES (132, 0, '2011-04-21 00:00:00', 83, 143, 120, NULL);
INSERT INTO storage.base_operations VALUES (132, 3, '2011-04-21 00:00:00', 35, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (132, 4, '2011-04-21 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (132, 5, '2011-04-21 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (132, 6, '2011-04-21 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (103, 1, '2011-04-20 00:00:00', 35, 140, -56, NULL);
INSERT INTO storage.base_operations VALUES (103, 0, '2011-04-20 00:00:00', 83, 140, 56, NULL);
INSERT INTO storage.base_operations VALUES (103, 3, '2011-04-20 00:00:00', 35, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (103, 4, '2011-04-20 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (103, 5, '2011-04-20 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (103, 6, '2011-04-20 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (104, 1, '2011-04-20 00:00:00', 35, 143, -152, NULL);
INSERT INTO storage.base_operations VALUES (104, 0, '2011-04-20 00:00:00', 83, 143, 152, NULL);
INSERT INTO storage.base_operations VALUES (104, 3, '2011-04-20 00:00:00', 35, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (104, 4, '2011-04-20 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (104, 5, '2011-04-20 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (104, 6, '2011-04-20 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (107, 1, '2011-04-20 00:00:00', 83, 140, -56, NULL);
INSERT INTO storage.base_operations VALUES (107, 0, '2011-04-20 00:00:00', 30, 140, 56, NULL);
INSERT INTO storage.base_operations VALUES (107, 3, '2011-04-20 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (107, 4, '2011-04-20 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (107, 5, '2011-04-20 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (107, 6, '2011-04-20 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (109, 1, '2011-04-20 00:00:00', 38, 86, -562, NULL);
INSERT INTO storage.base_operations VALUES (109, 0, '2011-04-20 00:00:00', 8, 86, 562, NULL);
INSERT INTO storage.base_operations VALUES (109, 3, '2011-04-20 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (109, 4, '2011-04-20 00:00:00', 8, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (109, 5, '2011-04-20 00:00:00', 9, 86, 2, NULL);
INSERT INTO storage.base_operations VALUES (109, 6, '2011-04-20 00:00:00', 8, 86, -2, NULL);
INSERT INTO storage.base_operations VALUES (204, 1, '2011-04-26 00:00:00', 62, 141, -201, NULL);
INSERT INTO storage.base_operations VALUES (204, 0, '2011-04-26 00:00:00', 8, 141, 201, NULL);
INSERT INTO storage.base_operations VALUES (204, 3, '2011-04-26 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (204, 4, '2011-04-26 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (204, 5, '2011-04-26 00:00:00', 9, 141, 1, NULL);
INSERT INTO storage.base_operations VALUES (204, 6, '2011-04-26 00:00:00', 8, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (114, 1, '2011-04-20 00:00:00', 35, 142, -170, NULL);
INSERT INTO storage.base_operations VALUES (114, 0, '2011-04-20 00:00:00', 83, 142, 170, NULL);
INSERT INTO storage.base_operations VALUES (114, 3, '2011-04-20 00:00:00', 35, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (114, 4, '2011-04-20 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (114, 5, '2011-04-20 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (114, 6, '2011-04-20 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (117, 1, '2011-04-20 00:00:00', 83, 143, -359, NULL);
INSERT INTO storage.base_operations VALUES (117, 0, '2011-04-20 00:00:00', 30, 143, 359, NULL);
INSERT INTO storage.base_operations VALUES (117, 3, '2011-04-20 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (117, 4, '2011-04-20 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (117, 5, '2011-04-20 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (117, 6, '2011-04-20 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (119, 1, '2011-04-20 00:00:00', 38, 84, -251, NULL);
INSERT INTO storage.base_operations VALUES (119, 0, '2011-04-20 00:00:00', 8, 84, 251, NULL);
INSERT INTO storage.base_operations VALUES (119, 3, '2011-04-20 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (119, 4, '2011-04-20 00:00:00', 8, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (119, 5, '2011-04-20 00:00:00', 9, 84, 1, NULL);
INSERT INTO storage.base_operations VALUES (119, 6, '2011-04-20 00:00:00', 8, 84, -1, NULL);
INSERT INTO storage.base_operations VALUES (120, 1, '2011-04-20 00:00:00', 38, 85, -505, NULL);
INSERT INTO storage.base_operations VALUES (120, 0, '2011-04-20 00:00:00', 8, 85, 505, NULL);
INSERT INTO storage.base_operations VALUES (120, 3, '2011-04-20 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (120, 4, '2011-04-20 00:00:00', 8, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (120, 5, '2011-04-20 00:00:00', 9, 85, 5, NULL);
INSERT INTO storage.base_operations VALUES (120, 6, '2011-04-20 00:00:00', 8, 85, -5, NULL);
INSERT INTO storage.base_operations VALUES (158, 1, '2011-04-23 00:00:00', 30, 143, -116, NULL);
INSERT INTO storage.base_operations VALUES (158, 0, '2011-04-23 00:00:00', 37, 143, 116, NULL);
INSERT INTO storage.base_operations VALUES (158, 3, '2011-04-23 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (158, 4, '2011-04-23 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (158, 5, '2011-04-23 00:00:00', 9, 143, 4, NULL);
INSERT INTO storage.base_operations VALUES (158, 6, '2011-04-23 00:00:00', 37, 143, -4, NULL);
INSERT INTO storage.base_operations VALUES (366, 1, '2011-05-14 00:00:00', 61, 84, -140, NULL);
INSERT INTO storage.base_operations VALUES (366, 0, '2011-05-14 00:00:00', 38, 84, 140, NULL);
INSERT INTO storage.base_operations VALUES (366, 3, '2011-05-14 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (366, 4, '2011-05-14 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (366, 5, '2011-05-14 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (366, 6, '2011-05-14 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (122, 1, '2011-04-21 00:00:00', 35, 140, -86, NULL);
INSERT INTO storage.base_operations VALUES (122, 0, '2011-04-21 00:00:00', 83, 140, 86, NULL);
INSERT INTO storage.base_operations VALUES (122, 3, '2011-04-21 00:00:00', 35, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (122, 4, '2011-04-21 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (122, 5, '2011-04-21 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (122, 6, '2011-04-21 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (123, 1, '2011-04-21 00:00:00', 35, 142, -197, NULL);
INSERT INTO storage.base_operations VALUES (123, 0, '2011-04-21 00:00:00', 83, 142, 197, NULL);
INSERT INTO storage.base_operations VALUES (123, 3, '2011-04-21 00:00:00', 35, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (123, 4, '2011-04-21 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (123, 5, '2011-04-21 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (123, 6, '2011-04-21 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (124, 1, '2011-04-21 00:00:00', 35, 143, -260, NULL);
INSERT INTO storage.base_operations VALUES (124, 0, '2011-04-21 00:00:00', 83, 143, 260, NULL);
INSERT INTO storage.base_operations VALUES (124, 3, '2011-04-21 00:00:00', 35, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (124, 4, '2011-04-21 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (124, 5, '2011-04-21 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (124, 6, '2011-04-21 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (134, 1, '2011-04-22 00:00:00', 83, 140, -80, NULL);
INSERT INTO storage.base_operations VALUES (134, 0, '2011-04-22 00:00:00', 30, 140, 80, NULL);
INSERT INTO storage.base_operations VALUES (134, 3, '2011-04-22 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (134, 4, '2011-04-22 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (134, 5, '2011-04-22 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (134, 6, '2011-04-22 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (135, 1, '2011-04-22 00:00:00', 83, 141, -22, NULL);
INSERT INTO storage.base_operations VALUES (135, 0, '2011-04-22 00:00:00', 30, 141, 22, NULL);
INSERT INTO storage.base_operations VALUES (135, 3, '2011-04-22 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (135, 4, '2011-04-22 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (135, 5, '2011-04-22 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (125, 1, '2011-04-21 00:00:00', 83, 140, -86, NULL);
INSERT INTO storage.base_operations VALUES (125, 0, '2011-04-21 00:00:00', 30, 140, 86, NULL);
INSERT INTO storage.base_operations VALUES (125, 3, '2011-04-21 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (125, 4, '2011-04-21 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (125, 5, '2011-04-21 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (125, 6, '2011-04-21 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (126, 1, '2011-04-21 00:00:00', 83, 143, -260, NULL);
INSERT INTO storage.base_operations VALUES (126, 0, '2011-04-21 00:00:00', 30, 143, 260, NULL);
INSERT INTO storage.base_operations VALUES (126, 3, '2011-04-21 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (126, 4, '2011-04-21 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (126, 5, '2011-04-21 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (126, 6, '2011-04-21 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (135, 6, '2011-04-22 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (136, 1, '2011-04-22 00:00:00', 83, 143, -120, NULL);
INSERT INTO storage.base_operations VALUES (136, 0, '2011-04-22 00:00:00', 30, 143, 120, NULL);
INSERT INTO storage.base_operations VALUES (136, 3, '2011-04-22 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (136, 4, '2011-04-22 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (136, 5, '2011-04-22 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (283, 5, '2011-04-24 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (136, 6, '2011-04-22 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (162, 1, '2011-04-23 00:00:00', 38, 85, -310, NULL);
INSERT INTO storage.base_operations VALUES (162, 0, '2011-04-23 00:00:00', 8, 85, 310, NULL);
INSERT INTO storage.base_operations VALUES (162, 3, '2011-04-23 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (162, 4, '2011-04-23 00:00:00', 8, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (283, 6, '2011-04-24 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (275, 1, '2011-04-24 00:00:00', 35, 141, -79, NULL);
INSERT INTO storage.base_operations VALUES (275, 0, '2011-04-24 00:00:00', 83, 141, 79, NULL);
INSERT INTO storage.base_operations VALUES (275, 3, '2011-04-24 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (275, 4, '2011-04-24 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (275, 5, '2011-04-24 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (275, 6, '2011-04-24 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (320, 1, '2011-05-12 00:00:00', 62, 140, -60, NULL);
INSERT INTO storage.base_operations VALUES (284, 1, '2011-04-24 00:00:00', 83, 141, -36, NULL);
INSERT INTO storage.base_operations VALUES (320, 0, '2011-05-12 00:00:00', 8, 140, 60, NULL);
INSERT INTO storage.base_operations VALUES (320, 3, '2011-05-12 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (320, 4, '2011-05-12 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (320, 5, '2011-05-12 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (129, 1, '2011-04-21 00:00:00', 35, 140, -80, NULL);
INSERT INTO storage.base_operations VALUES (129, 0, '2011-04-21 00:00:00', 83, 140, 80, NULL);
INSERT INTO storage.base_operations VALUES (129, 3, '2011-04-21 00:00:00', 35, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (129, 4, '2011-04-21 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (129, 5, '2011-04-21 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (129, 6, '2011-04-21 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (130, 1, '2011-04-21 00:00:00', 35, 141, -22, NULL);
INSERT INTO storage.base_operations VALUES (130, 0, '2011-04-21 00:00:00', 83, 141, 22, NULL);
INSERT INTO storage.base_operations VALUES (130, 3, '2011-04-21 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (130, 4, '2011-04-21 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (130, 5, '2011-04-21 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (130, 6, '2011-04-21 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (131, 1, '2011-04-21 00:00:00', 35, 142, -174, NULL);
INSERT INTO storage.base_operations VALUES (131, 0, '2011-04-21 00:00:00', 83, 142, 174, NULL);
INSERT INTO storage.base_operations VALUES (131, 3, '2011-04-21 00:00:00', 35, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (131, 4, '2011-04-21 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (131, 5, '2011-04-21 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (131, 6, '2011-04-21 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (274, 1, '2011-04-25 00:00:00', 61, 85, -100, NULL);
INSERT INTO storage.base_operations VALUES (274, 0, '2011-04-25 00:00:00', 38, 85, 100, NULL);
INSERT INTO storage.base_operations VALUES (274, 3, '2011-04-25 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (274, 4, '2011-04-25 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (274, 5, '2011-04-25 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (274, 6, '2011-04-25 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (313, 1, '2011-05-12 00:00:00', 30, 140, -152, NULL);
INSERT INTO storage.base_operations VALUES (313, 0, '2011-05-12 00:00:00', 37, 140, 152, NULL);
INSERT INTO storage.base_operations VALUES (313, 3, '2011-05-12 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (313, 4, '2011-05-12 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (313, 5, '2011-05-12 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (313, 6, '2011-05-12 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (279, 1, '2011-04-24 00:00:00', 35, 141, -36, NULL);
INSERT INTO storage.base_operations VALUES (279, 0, '2011-04-24 00:00:00', 83, 141, 36, NULL);
INSERT INTO storage.base_operations VALUES (279, 3, '2011-04-24 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (279, 4, '2011-04-24 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (279, 5, '2011-04-24 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (279, 6, '2011-04-24 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (276, 1, '2011-04-24 00:00:00', 35, 142, -116, NULL);
INSERT INTO storage.base_operations VALUES (276, 0, '2011-04-24 00:00:00', 83, 142, 116, NULL);
INSERT INTO storage.base_operations VALUES (276, 3, '2011-04-24 00:00:00', 35, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (276, 4, '2011-04-24 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (276, 5, '2011-04-24 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (276, 6, '2011-04-24 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (367, 1, '2011-05-14 00:00:00', 61, 85, -154, NULL);
INSERT INTO storage.base_operations VALUES (367, 0, '2011-05-14 00:00:00', 38, 85, 154, NULL);
INSERT INTO storage.base_operations VALUES (367, 3, '2011-05-14 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (367, 4, '2011-05-14 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (1308, 6, '2011-08-02 00:00:00', 8, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (284, 0, '2011-04-24 00:00:00', 30, 141, 36, NULL);
INSERT INTO storage.base_operations VALUES (284, 3, '2011-04-24 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (284, 4, '2011-04-24 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (284, 5, '2011-04-24 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (284, 6, '2011-04-24 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (141, 1, '2011-04-22 00:00:00', 38, 85, -252, NULL);
INSERT INTO storage.base_operations VALUES (141, 0, '2011-04-22 00:00:00', 8, 85, 252, NULL);
INSERT INTO storage.base_operations VALUES (141, 3, '2011-04-22 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (141, 4, '2011-04-22 00:00:00', 8, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (141, 5, '2011-04-22 00:00:00', 9, 85, 2, NULL);
INSERT INTO storage.base_operations VALUES (141, 6, '2011-04-22 00:00:00', 8, 85, -2, NULL);
INSERT INTO storage.base_operations VALUES (142, 1, '2011-04-22 00:00:00', 38, 86, -701, NULL);
INSERT INTO storage.base_operations VALUES (142, 0, '2011-04-22 00:00:00', 8, 86, 701, NULL);
INSERT INTO storage.base_operations VALUES (142, 3, '2011-04-22 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (142, 4, '2011-04-22 00:00:00', 8, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (142, 5, '2011-04-22 00:00:00', 9, 86, 11, NULL);
INSERT INTO storage.base_operations VALUES (142, 6, '2011-04-22 00:00:00', 8, 86, -11, NULL);
INSERT INTO storage.base_operations VALUES (144, 1, '2011-04-22 00:00:00', 35, 140, -66, NULL);
INSERT INTO storage.base_operations VALUES (144, 0, '2011-04-22 00:00:00', 83, 140, 66, NULL);
INSERT INTO storage.base_operations VALUES (144, 3, '2011-04-22 00:00:00', 35, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (144, 4, '2011-04-22 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (144, 5, '2011-04-22 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (144, 6, '2011-04-22 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (145, 1, '2011-04-22 00:00:00', 35, 141, -72, NULL);
INSERT INTO storage.base_operations VALUES (145, 0, '2011-04-22 00:00:00', 83, 141, 72, NULL);
INSERT INTO storage.base_operations VALUES (145, 3, '2011-04-22 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (145, 4, '2011-04-22 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (145, 5, '2011-04-22 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (145, 6, '2011-04-22 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (146, 1, '2011-04-22 00:00:00', 35, 142, -177, NULL);
INSERT INTO storage.base_operations VALUES (146, 0, '2011-04-22 00:00:00', 83, 142, 177, NULL);
INSERT INTO storage.base_operations VALUES (146, 3, '2011-04-22 00:00:00', 35, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (146, 4, '2011-04-22 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (146, 5, '2011-04-22 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (146, 6, '2011-04-22 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (147, 1, '2011-04-22 00:00:00', 35, 143, -170, NULL);
INSERT INTO storage.base_operations VALUES (147, 0, '2011-04-22 00:00:00', 83, 143, 170, NULL);
INSERT INTO storage.base_operations VALUES (147, 3, '2011-04-22 00:00:00', 35, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (147, 4, '2011-04-22 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (147, 5, '2011-04-22 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (147, 6, '2011-04-22 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (149, 1, '2011-04-22 00:00:00', 35, 140, -116, NULL);
INSERT INTO storage.base_operations VALUES (149, 0, '2011-04-22 00:00:00', 83, 140, 116, NULL);
INSERT INTO storage.base_operations VALUES (149, 3, '2011-04-22 00:00:00', 35, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (149, 4, '2011-04-22 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (149, 5, '2011-04-22 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (149, 6, '2011-04-22 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (151, 1, '2011-04-22 00:00:00', 35, 141, -60, NULL);
INSERT INTO storage.base_operations VALUES (151, 0, '2011-04-22 00:00:00', 83, 141, 60, NULL);
INSERT INTO storage.base_operations VALUES (151, 3, '2011-04-22 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (151, 4, '2011-04-22 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (151, 5, '2011-04-22 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (151, 6, '2011-04-22 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (150, 1, '2011-04-22 00:00:00', 35, 142, -137, NULL);
INSERT INTO storage.base_operations VALUES (150, 0, '2011-04-22 00:00:00', 83, 142, 137, NULL);
INSERT INTO storage.base_operations VALUES (150, 3, '2011-04-22 00:00:00', 35, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (150, 4, '2011-04-22 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (150, 5, '2011-04-22 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (150, 6, '2011-04-22 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (152, 1, '2011-04-22 00:00:00', 35, 143, -139, NULL);
INSERT INTO storage.base_operations VALUES (152, 0, '2011-04-22 00:00:00', 83, 143, 139, NULL);
INSERT INTO storage.base_operations VALUES (152, 3, '2011-04-22 00:00:00', 35, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (152, 4, '2011-04-22 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (152, 5, '2011-04-22 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (152, 6, '2011-04-22 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (192, 1, '2011-04-25 00:00:00', 83, 140, -16, NULL);
INSERT INTO storage.base_operations VALUES (192, 0, '2011-04-25 00:00:00', 30, 140, 16, NULL);
INSERT INTO storage.base_operations VALUES (192, 3, '2011-04-25 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (192, 4, '2011-04-25 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (192, 5, '2011-04-25 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (192, 6, '2011-04-25 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (230, 1, '2011-04-21 00:00:00', 8, 85, -1000, NULL);
INSERT INTO storage.base_operations VALUES (230, 0, '2011-04-21 00:00:00', 147, 85, 1000, NULL);
INSERT INTO storage.base_operations VALUES (230, 3, '2011-04-21 00:00:00', 8, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (230, 4, '2011-04-21 00:00:00', 147, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (230, 5, '2011-04-21 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (154, 1, '2011-04-22 00:00:00', 83, 140, -182, NULL);
INSERT INTO storage.base_operations VALUES (154, 0, '2011-04-22 00:00:00', 30, 140, 182, NULL);
INSERT INTO storage.base_operations VALUES (154, 3, '2011-04-22 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (154, 4, '2011-04-22 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (154, 5, '2011-04-22 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (154, 6, '2011-04-22 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (155, 1, '2011-04-22 00:00:00', 83, 141, -132, NULL);
INSERT INTO storage.base_operations VALUES (155, 0, '2011-04-22 00:00:00', 30, 141, 132, NULL);
INSERT INTO storage.base_operations VALUES (155, 3, '2011-04-22 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (155, 4, '2011-04-22 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (155, 5, '2011-04-22 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (155, 6, '2011-04-22 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (230, 6, '2011-04-21 00:00:00', 147, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (367, 5, '2011-05-14 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (367, 6, '2011-05-14 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (613, 1, '2011-06-07 00:00:00', 30, 143, -97, NULL);
INSERT INTO storage.base_operations VALUES (613, 0, '2011-06-07 00:00:00', 37, 143, 97, NULL);
INSERT INTO storage.base_operations VALUES (613, 3, '2011-06-07 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (157, 1, '2011-04-22 00:00:00', 83, 143, -309, NULL);
INSERT INTO storage.base_operations VALUES (157, 0, '2011-04-22 00:00:00', 30, 143, 309, NULL);
INSERT INTO storage.base_operations VALUES (157, 3, '2011-04-22 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (157, 4, '2011-04-22 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (157, 5, '2011-04-22 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (157, 6, '2011-04-22 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (1292, 1, '2011-08-01 00:00:00', 35, 381, -92, NULL);
INSERT INTO storage.base_operations VALUES (162, 5, '2011-04-23 00:00:00', 9, 85, 8, NULL);
INSERT INTO storage.base_operations VALUES (162, 6, '2011-04-23 00:00:00', 8, 85, -8, NULL);
INSERT INTO storage.base_operations VALUES (163, 1, '2011-04-23 00:00:00', 38, 86, -507, NULL);
INSERT INTO storage.base_operations VALUES (163, 0, '2011-04-23 00:00:00', 8, 86, 507, NULL);
INSERT INTO storage.base_operations VALUES (163, 3, '2011-04-23 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (163, 4, '2011-04-23 00:00:00', 8, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (163, 5, '2011-04-23 00:00:00', 9, 86, 7, NULL);
INSERT INTO storage.base_operations VALUES (163, 6, '2011-04-23 00:00:00', 8, 86, -7, NULL);
INSERT INTO storage.base_operations VALUES (232, 5, '2011-04-27 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (197, 1, '2011-05-25 00:00:00', 61, 85, -100, NULL);
INSERT INTO storage.base_operations VALUES (197, 0, '2011-05-25 00:00:00', 38, 85, 100, NULL);
INSERT INTO storage.base_operations VALUES (197, 3, '2011-05-25 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (197, 4, '2011-05-25 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (197, 5, '2011-05-25 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (197, 6, '2011-05-25 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (232, 6, '2011-04-27 00:00:00', 147, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (238, -1, '2011-04-18 00:00:00', 37, 140, 2035, NULL);
INSERT INTO storage.base_operations VALUES (244, -1, '2011-04-18 00:00:00', 38, 87, 208, NULL);
INSERT INTO storage.base_operations VALUES (1292, 0, '2011-08-01 00:00:00', 83, 381, 92, NULL);
INSERT INTO storage.base_operations VALUES (256, -1, '2011-04-18 00:00:00', 12, 98, 665, NULL);
INSERT INTO storage.base_operations VALUES (165, 1, '2011-04-23 00:00:00', 35, 140, -55, NULL);
INSERT INTO storage.base_operations VALUES (165, 0, '2011-04-23 00:00:00', 83, 140, 55, NULL);
INSERT INTO storage.base_operations VALUES (165, 3, '2011-04-23 00:00:00', 35, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (165, 4, '2011-04-23 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (165, 5, '2011-04-23 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (165, 6, '2011-04-23 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (166, 1, '2011-04-23 00:00:00', 35, 141, -33, NULL);
INSERT INTO storage.base_operations VALUES (166, 0, '2011-04-23 00:00:00', 83, 141, 33, NULL);
INSERT INTO storage.base_operations VALUES (166, 3, '2011-04-23 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (166, 4, '2011-04-23 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (166, 5, '2011-04-23 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (166, 6, '2011-04-23 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (1292, 3, '2011-08-01 00:00:00', 35, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (198, 1, '2011-04-25 00:00:00', 35, 84, -108, NULL);
INSERT INTO storage.base_operations VALUES (198, 0, '2011-04-25 00:00:00', 83, 84, 108, NULL);
INSERT INTO storage.base_operations VALUES (198, 3, '2011-04-25 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (198, 4, '2011-04-25 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (198, 5, '2011-04-25 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (167, 1, '2011-04-23 00:00:00', 35, 142, -99, NULL);
INSERT INTO storage.base_operations VALUES (167, 0, '2011-04-23 00:00:00', 83, 142, 99, NULL);
INSERT INTO storage.base_operations VALUES (167, 3, '2011-04-23 00:00:00', 35, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (167, 4, '2011-04-23 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (167, 5, '2011-04-23 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (167, 6, '2011-04-23 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (198, 6, '2011-04-25 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (201, 1, '2011-04-25 00:00:00', 35, 141, -117, NULL);
INSERT INTO storage.base_operations VALUES (201, 0, '2011-04-25 00:00:00', 83, 141, 117, NULL);
INSERT INTO storage.base_operations VALUES (201, 3, '2011-04-25 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (201, 4, '2011-04-25 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (201, 5, '2011-04-25 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (168, 1, '2011-04-23 00:00:00', 35, 143, -71, NULL);
INSERT INTO storage.base_operations VALUES (168, 0, '2011-04-23 00:00:00', 83, 143, 71, NULL);
INSERT INTO storage.base_operations VALUES (168, 3, '2011-04-23 00:00:00', 35, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (168, 4, '2011-04-23 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (168, 5, '2011-04-23 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (168, 6, '2011-04-23 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (201, 6, '2011-04-25 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (1292, 4, '2011-08-01 00:00:00', 83, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1292, 5, '2011-08-01 00:00:00', 9, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1292, 6, '2011-08-01 00:00:00', 83, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1291, 1, '2011-08-01 00:00:00', 35, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (182, 1, '2011-04-25 00:00:00', 83, 85, -100, NULL);
INSERT INTO storage.base_operations VALUES (182, 0, '2011-04-25 00:00:00', 30, 85, 100, NULL);
INSERT INTO storage.base_operations VALUES (182, 3, '2011-04-25 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (182, 4, '2011-04-25 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (182, 5, '2011-04-25 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (182, 6, '2011-04-25 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (194, 1, '2011-04-25 00:00:00', 30, 85, -100, NULL);
INSERT INTO storage.base_operations VALUES (194, 0, '2011-04-25 00:00:00', 37, 85, 100, NULL);
INSERT INTO storage.base_operations VALUES (169, 1, '2011-04-23 00:00:00', 83, 140, -55, NULL);
INSERT INTO storage.base_operations VALUES (169, 0, '2011-04-23 00:00:00', 30, 140, 55, NULL);
INSERT INTO storage.base_operations VALUES (169, 3, '2011-04-23 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (169, 4, '2011-04-23 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (169, 5, '2011-04-23 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (169, 6, '2011-04-23 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (170, 1, '2011-04-23 00:00:00', 83, 141, -33, NULL);
INSERT INTO storage.base_operations VALUES (170, 0, '2011-04-23 00:00:00', 30, 141, 33, NULL);
INSERT INTO storage.base_operations VALUES (170, 3, '2011-04-23 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (170, 4, '2011-04-23 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (170, 5, '2011-04-23 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (170, 6, '2011-04-23 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (171, 1, '2011-04-23 00:00:00', 83, 143, -71, NULL);
INSERT INTO storage.base_operations VALUES (171, 0, '2011-04-23 00:00:00', 30, 143, 71, NULL);
INSERT INTO storage.base_operations VALUES (171, 3, '2011-04-23 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (171, 4, '2011-04-23 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (171, 5, '2011-04-23 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (171, 6, '2011-04-23 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (194, 3, '2011-04-25 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (194, 4, '2011-04-25 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (194, 5, '2011-04-25 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (194, 6, '2011-04-25 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (196, 1, '2011-04-25 00:00:00', 37, 85, -100, NULL);
INSERT INTO storage.base_operations VALUES (196, 0, '2011-04-25 00:00:00', 61, 85, 100, NULL);
INSERT INTO storage.base_operations VALUES (196, 3, '2011-04-25 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (196, 4, '2011-04-25 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (196, 5, '2011-04-25 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (196, 6, '2011-04-25 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (231, 1, '2011-04-21 00:00:00', 8, 87, -1000, NULL);
INSERT INTO storage.base_operations VALUES (231, 0, '2011-04-21 00:00:00', 147, 87, 1000, NULL);
INSERT INTO storage.base_operations VALUES (173, 1, '2011-04-23 00:00:00', 30, 143, -48, NULL);
INSERT INTO storage.base_operations VALUES (173, 0, '2011-04-23 00:00:00', 37, 143, 48, NULL);
INSERT INTO storage.base_operations VALUES (173, 3, '2011-04-23 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (173, 4, '2011-04-23 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (173, 5, '2011-04-23 00:00:00', 9, 143, 2, NULL);
INSERT INTO storage.base_operations VALUES (173, 6, '2011-04-23 00:00:00', 37, 143, -2, NULL);
INSERT INTO storage.base_operations VALUES (231, 3, '2011-04-21 00:00:00', 8, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (231, 4, '2011-04-21 00:00:00', 147, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (231, 5, '2011-04-21 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (231, 6, '2011-04-21 00:00:00', 147, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (233, 1, '2011-04-27 00:00:00', 8, 141, -200, NULL);
INSERT INTO storage.base_operations VALUES (233, 0, '2011-04-27 00:00:00', 147, 141, 200, NULL);
INSERT INTO storage.base_operations VALUES (233, 3, '2011-04-27 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (233, 4, '2011-04-27 00:00:00', 147, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (233, 5, '2011-04-27 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (233, 6, '2011-04-27 00:00:00', 147, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (199, 1, '2011-04-25 00:00:00', 35, 85, -131, NULL);
INSERT INTO storage.base_operations VALUES (199, 0, '2011-04-25 00:00:00', 83, 85, 131, NULL);
INSERT INTO storage.base_operations VALUES (199, 3, '2011-04-25 00:00:00', 35, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (199, 4, '2011-04-25 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (199, 5, '2011-04-25 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (199, 6, '2011-04-25 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (239, -1, '2011-04-18 00:00:00', 37, 141, 1060, NULL);
INSERT INTO storage.base_operations VALUES (245, -1, '2011-04-18 00:00:00', 8, 84, 1250, NULL);
INSERT INTO storage.base_operations VALUES (450, 1, '2011-05-26 00:00:00', 83, 174, -94, NULL);
INSERT INTO storage.base_operations VALUES (257, 1, '2011-04-25 00:00:00', 35, 140, -64, NULL);
INSERT INTO storage.base_operations VALUES (257, 0, '2011-04-25 00:00:00', 83, 140, 64, NULL);
INSERT INTO storage.base_operations VALUES (613, 4, '2011-06-07 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (450, 0, '2011-05-26 00:00:00', 30, 174, 94, NULL);
INSERT INTO storage.base_operations VALUES (613, 5, '2011-06-07 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (437, 1, '2011-05-21 00:00:00', 62, 141, -20, NULL);
INSERT INTO storage.base_operations VALUES (437, 0, '2011-05-21 00:00:00', 38, 141, 20, NULL);
INSERT INTO storage.base_operations VALUES (437, 3, '2011-05-21 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (437, 4, '2011-05-21 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (174, 1, '2011-04-24 00:00:00', 35, 140, -100, NULL);
INSERT INTO storage.base_operations VALUES (174, 0, '2011-04-24 00:00:00', 83, 140, 100, NULL);
INSERT INTO storage.base_operations VALUES (174, 3, '2011-04-24 00:00:00', 35, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (174, 4, '2011-04-24 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (174, 5, '2011-04-24 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (174, 6, '2011-04-24 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (175, 1, '2011-04-24 00:00:00', 35, 141, -44, NULL);
INSERT INTO storage.base_operations VALUES (175, 0, '2011-04-24 00:00:00', 83, 141, 44, NULL);
INSERT INTO storage.base_operations VALUES (175, 3, '2011-04-24 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (175, 4, '2011-04-24 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (175, 5, '2011-04-24 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (175, 6, '2011-04-24 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (176, 1, '2011-04-24 00:00:00', 35, 142, -245, NULL);
INSERT INTO storage.base_operations VALUES (176, 0, '2011-04-24 00:00:00', 83, 142, 245, NULL);
INSERT INTO storage.base_operations VALUES (176, 3, '2011-04-24 00:00:00', 35, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (176, 4, '2011-04-24 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (176, 5, '2011-04-24 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (176, 6, '2011-04-24 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (177, 1, '2011-04-24 00:00:00', 35, 143, -177, NULL);
INSERT INTO storage.base_operations VALUES (177, 0, '2011-04-24 00:00:00', 83, 143, 177, NULL);
INSERT INTO storage.base_operations VALUES (177, 3, '2011-04-24 00:00:00', 35, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (177, 4, '2011-04-24 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (177, 5, '2011-04-24 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (177, 6, '2011-04-24 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (314, 1, '2011-05-12 00:00:00', 30, 140, -150, NULL);
INSERT INTO storage.base_operations VALUES (314, 0, '2011-05-12 00:00:00', 37, 140, 150, NULL);
INSERT INTO storage.base_operations VALUES (314, 3, '2011-05-12 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (314, 4, '2011-05-12 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (314, 5, '2011-05-12 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (314, 6, '2011-05-12 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (195, 1, '2011-04-25 00:00:00', 30, 143, -20, NULL);
INSERT INTO storage.base_operations VALUES (195, 0, '2011-04-25 00:00:00', 37, 143, 20, NULL);
INSERT INTO storage.base_operations VALUES (195, 3, '2011-04-25 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (195, 4, '2011-04-25 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (195, 5, '2011-04-25 00:00:00', 9, 143, 5, NULL);
INSERT INTO storage.base_operations VALUES (195, 6, '2011-04-25 00:00:00', 37, 143, -5, NULL);
INSERT INTO storage.base_operations VALUES (234, -1, '2011-04-18 00:00:00', 30, 84, 30, NULL);
INSERT INTO storage.base_operations VALUES (240, -1, '2011-04-18 00:00:00', 37, 143, 1901, NULL);
INSERT INTO storage.base_operations VALUES (246, -1, '2011-04-18 00:00:00', 8, 85, 2524, NULL);
INSERT INTO storage.base_operations VALUES (450, 3, '2011-05-26 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (128, 1, '2011-04-21 00:00:00', 38, 86, -425, NULL);
INSERT INTO storage.base_operations VALUES (128, 0, '2011-04-21 00:00:00', 62, 86, 425, NULL);
INSERT INTO storage.base_operations VALUES (179, 1, '2011-04-25 00:00:00', 83, 140, -190, NULL);
INSERT INTO storage.base_operations VALUES (179, 0, '2011-04-25 00:00:00', 30, 140, 190, NULL);
INSERT INTO storage.base_operations VALUES (179, 3, '2011-04-25 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (179, 4, '2011-04-25 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (179, 5, '2011-04-25 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (179, 6, '2011-04-25 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (180, 1, '2011-04-25 00:00:00', 83, 141, -123, NULL);
INSERT INTO storage.base_operations VALUES (180, 0, '2011-04-25 00:00:00', 30, 141, 123, NULL);
INSERT INTO storage.base_operations VALUES (180, 3, '2011-04-25 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (180, 4, '2011-04-25 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (180, 5, '2011-04-25 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (180, 6, '2011-04-25 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (181, 1, '2011-04-25 00:00:00', 83, 143, -316, NULL);
INSERT INTO storage.base_operations VALUES (181, 0, '2011-04-25 00:00:00', 30, 143, 316, NULL);
INSERT INTO storage.base_operations VALUES (181, 3, '2011-04-25 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (181, 4, '2011-04-25 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (181, 5, '2011-04-25 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (181, 6, '2011-04-25 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (280, 1, '2011-04-24 00:00:00', 35, 142, -74, NULL);
INSERT INTO storage.base_operations VALUES (280, 0, '2011-04-24 00:00:00', 83, 142, 74, NULL);
INSERT INTO storage.base_operations VALUES (183, 1, '2011-04-25 00:00:00', 30, 141, -54, NULL);
INSERT INTO storage.base_operations VALUES (183, 0, '2011-04-25 00:00:00', 37, 141, 54, NULL);
INSERT INTO storage.base_operations VALUES (183, 3, '2011-04-25 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (183, 4, '2011-04-25 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (183, 5, '2011-04-25 00:00:00', 9, 141, 5, NULL);
INSERT INTO storage.base_operations VALUES (183, 6, '2011-04-25 00:00:00', 37, 141, -5, NULL);
INSERT INTO storage.base_operations VALUES (280, 3, '2011-04-24 00:00:00', 35, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (280, 4, '2011-04-24 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (280, 5, '2011-04-24 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (280, 6, '2011-04-24 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (277, 1, '2011-04-24 00:00:00', 35, 143, -139, NULL);
INSERT INTO storage.base_operations VALUES (277, 0, '2011-04-24 00:00:00', 83, 143, 139, NULL);
INSERT INTO storage.base_operations VALUES (277, 3, '2011-04-24 00:00:00', 35, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (277, 4, '2011-04-24 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (277, 5, '2011-04-24 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (277, 6, '2011-04-24 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (200, 1, '2011-04-25 00:00:00', 35, 140, -12, NULL);
INSERT INTO storage.base_operations VALUES (200, 0, '2011-04-25 00:00:00', 83, 140, 12, NULL);
INSERT INTO storage.base_operations VALUES (286, 1, '2011-04-24 00:00:00', 83, 140, -58, NULL);
INSERT INTO storage.base_operations VALUES (286, 0, '2011-04-24 00:00:00', 30, 140, 58, NULL);
INSERT INTO storage.base_operations VALUES (286, 3, '2011-04-24 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (286, 4, '2011-04-24 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (286, 5, '2011-04-24 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (200, 3, '2011-04-25 00:00:00', 35, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (200, 4, '2011-04-25 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (200, 5, '2011-04-25 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (200, 6, '2011-04-25 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (186, 1, '2011-04-25 00:00:00', 38, 84, -81, NULL);
INSERT INTO storage.base_operations VALUES (186, 0, '2011-04-25 00:00:00', 8, 84, 81, NULL);
INSERT INTO storage.base_operations VALUES (186, 3, '2011-04-25 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (186, 4, '2011-04-25 00:00:00', 8, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (186, 5, '2011-04-25 00:00:00', 9, 84, 6, NULL);
INSERT INTO storage.base_operations VALUES (186, 6, '2011-04-25 00:00:00', 8, 84, -6, NULL);
INSERT INTO storage.base_operations VALUES (187, 1, '2011-04-25 00:00:00', 38, 86, -1013, NULL);
INSERT INTO storage.base_operations VALUES (187, 0, '2011-04-25 00:00:00', 8, 86, 1013, NULL);
INSERT INTO storage.base_operations VALUES (187, 3, '2011-04-25 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (187, 4, '2011-04-25 00:00:00', 8, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (187, 5, '2011-04-25 00:00:00', 9, 86, 13, NULL);
INSERT INTO storage.base_operations VALUES (187, 6, '2011-04-25 00:00:00', 8, 86, -13, NULL);
INSERT INTO storage.base_operations VALUES (189, 1, '2011-04-25 00:00:00', 35, 85, -100, NULL);
INSERT INTO storage.base_operations VALUES (189, 0, '2011-04-25 00:00:00', 83, 85, 100, NULL);
INSERT INTO storage.base_operations VALUES (189, 3, '2011-04-25 00:00:00', 35, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (189, 4, '2011-04-25 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (189, 5, '2011-04-25 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (189, 6, '2011-04-25 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (190, 1, '2011-04-25 00:00:00', 35, 140, -16, NULL);
INSERT INTO storage.base_operations VALUES (190, 0, '2011-04-25 00:00:00', 83, 140, 16, NULL);
INSERT INTO storage.base_operations VALUES (190, 3, '2011-04-25 00:00:00', 35, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (190, 4, '2011-04-25 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (190, 5, '2011-04-25 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (190, 6, '2011-04-25 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (191, 1, '2011-04-25 00:00:00', 35, 141, -4, NULL);
INSERT INTO storage.base_operations VALUES (191, 0, '2011-04-25 00:00:00', 83, 141, 4, NULL);
INSERT INTO storage.base_operations VALUES (191, 3, '2011-04-25 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (191, 4, '2011-04-25 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (191, 5, '2011-04-25 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (191, 6, '2011-04-25 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (368, 1, '2011-05-14 00:00:00', 38, 84, -250, NULL);
INSERT INTO storage.base_operations VALUES (368, 0, '2011-05-14 00:00:00', 62, 84, 250, NULL);
INSERT INTO storage.base_operations VALUES (368, 3, '2011-05-14 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (368, 4, '2011-05-14 00:00:00', 62, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (368, 5, '2011-05-14 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (450, 4, '2011-05-26 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (205, 1, '2011-04-26 00:00:00', 35, 84, -69, NULL);
INSERT INTO storage.base_operations VALUES (205, 0, '2011-04-26 00:00:00', 83, 84, 69, NULL);
INSERT INTO storage.base_operations VALUES (205, 3, '2011-04-26 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (205, 4, '2011-04-26 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (205, 5, '2011-04-26 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (205, 6, '2011-04-26 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (206, 1, '2011-04-26 00:00:00', 35, 85, -174, NULL);
INSERT INTO storage.base_operations VALUES (206, 0, '2011-04-26 00:00:00', 83, 85, 174, NULL);
INSERT INTO storage.base_operations VALUES (206, 3, '2011-04-26 00:00:00', 35, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (206, 4, '2011-04-26 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (206, 5, '2011-04-26 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (206, 6, '2011-04-26 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (207, 1, '2011-04-26 00:00:00', 35, 140, -77, NULL);
INSERT INTO storage.base_operations VALUES (207, 0, '2011-04-26 00:00:00', 83, 140, 77, NULL);
INSERT INTO storage.base_operations VALUES (207, 3, '2011-04-26 00:00:00', 35, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (207, 4, '2011-04-26 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (207, 5, '2011-04-26 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (207, 6, '2011-04-26 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (208, 1, '2011-04-26 00:00:00', 35, 141, -138, NULL);
INSERT INTO storage.base_operations VALUES (208, 0, '2011-04-26 00:00:00', 83, 141, 138, NULL);
INSERT INTO storage.base_operations VALUES (208, 3, '2011-04-26 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (208, 4, '2011-04-26 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (208, 5, '2011-04-26 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (208, 6, '2011-04-26 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (235, -1, '2011-04-18 00:00:00', 30, 140, 109, NULL);
INSERT INTO storage.base_operations VALUES (241, -1, '2011-04-18 00:00:00', 38, 84, 332, NULL);
INSERT INTO storage.base_operations VALUES (247, -1, '2011-04-18 00:00:00', 8, 86, 1080, NULL);
INSERT INTO storage.base_operations VALUES (1291, 0, '2011-08-01 00:00:00', 83, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (128, 3, '2011-04-21 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (128, 4, '2011-04-21 00:00:00', 62, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (209, 1, '2011-04-27 00:00:00', 38, 141, -205, NULL);
INSERT INTO storage.base_operations VALUES (209, 0, '2011-04-27 00:00:00', 8, 141, 205, NULL);
INSERT INTO storage.base_operations VALUES (209, 3, '2011-04-27 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (209, 4, '2011-04-27 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (209, 5, '2011-04-27 00:00:00', 9, 141, 5, NULL);
INSERT INTO storage.base_operations VALUES (209, 6, '2011-04-27 00:00:00', 8, 141, -5, NULL);
INSERT INTO storage.base_operations VALUES (128, 5, '2011-04-21 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (128, 6, '2011-04-21 00:00:00', 62, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (257, 3, '2011-04-25 00:00:00', 35, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (257, 4, '2011-04-25 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (257, 5, '2011-04-25 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (257, 6, '2011-04-25 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (317, 1, '2011-05-12 00:00:00', 38, 140, -230, NULL);
INSERT INTO storage.base_operations VALUES (259, 1, '2011-04-26 00:00:00', 83, 84, -108, NULL);
INSERT INTO storage.base_operations VALUES (259, 0, '2011-04-26 00:00:00', 30, 84, 108, NULL);
INSERT INTO storage.base_operations VALUES (259, 3, '2011-04-26 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (259, 4, '2011-04-26 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (259, 5, '2011-04-26 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (259, 6, '2011-04-26 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (262, 1, '2011-04-26 00:00:00', 83, 141, -131, NULL);
INSERT INTO storage.base_operations VALUES (262, 0, '2011-04-26 00:00:00', 30, 141, 131, NULL);
INSERT INTO storage.base_operations VALUES (262, 3, '2011-04-26 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (262, 4, '2011-04-26 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (262, 5, '2011-04-26 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (262, 6, '2011-04-26 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (210, 1, '2011-04-27 00:00:00', 35, 84, -11, NULL);
INSERT INTO storage.base_operations VALUES (210, 0, '2011-04-27 00:00:00', 83, 84, 11, NULL);
INSERT INTO storage.base_operations VALUES (210, 3, '2011-04-27 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (210, 4, '2011-04-27 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (210, 5, '2011-04-27 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (210, 6, '2011-04-27 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (211, 1, '2011-04-27 00:00:00', 35, 85, -115, NULL);
INSERT INTO storage.base_operations VALUES (211, 0, '2011-04-27 00:00:00', 83, 85, 115, NULL);
INSERT INTO storage.base_operations VALUES (211, 3, '2011-04-27 00:00:00', 35, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (211, 4, '2011-04-27 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (211, 5, '2011-04-27 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (211, 6, '2011-04-27 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (212, 1, '2011-04-27 00:00:00', 35, 140, -31, NULL);
INSERT INTO storage.base_operations VALUES (212, 0, '2011-04-27 00:00:00', 83, 140, 31, NULL);
INSERT INTO storage.base_operations VALUES (212, 3, '2011-04-27 00:00:00', 35, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (212, 4, '2011-04-27 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (212, 5, '2011-04-27 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (212, 6, '2011-04-27 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (213, 1, '2011-04-27 00:00:00', 35, 141, -85, NULL);
INSERT INTO storage.base_operations VALUES (213, 0, '2011-04-27 00:00:00', 83, 141, 85, NULL);
INSERT INTO storage.base_operations VALUES (213, 3, '2011-04-27 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (213, 4, '2011-04-27 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (213, 5, '2011-04-27 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (213, 6, '2011-04-27 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (263, 1, '2011-04-26 00:00:00', 30, 84, -108, NULL);
INSERT INTO storage.base_operations VALUES (263, 0, '2011-04-26 00:00:00', 37, 84, 108, NULL);
INSERT INTO storage.base_operations VALUES (263, 3, '2011-04-26 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (263, 4, '2011-04-26 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (263, 5, '2011-04-26 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (263, 6, '2011-04-26 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (281, 1, '2011-04-24 00:00:00', 35, 143, -85, NULL);
INSERT INTO storage.base_operations VALUES (281, 0, '2011-04-24 00:00:00', 83, 143, 85, NULL);
INSERT INTO storage.base_operations VALUES (281, 3, '2011-04-24 00:00:00', 35, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (281, 4, '2011-04-24 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (281, 5, '2011-04-24 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (281, 6, '2011-04-24 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (368, 6, '2011-05-14 00:00:00', 62, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (214, 1, '2011-04-27 00:00:00', 83, 84, -178, NULL);
INSERT INTO storage.base_operations VALUES (214, 0, '2011-04-27 00:00:00', 30, 84, 178, NULL);
INSERT INTO storage.base_operations VALUES (214, 3, '2011-04-27 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (214, 4, '2011-04-27 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (214, 5, '2011-04-27 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (214, 6, '2011-04-27 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (215, 1, '2011-04-27 00:00:00', 83, 85, -419, NULL);
INSERT INTO storage.base_operations VALUES (215, 0, '2011-04-27 00:00:00', 30, 85, 419, NULL);
INSERT INTO storage.base_operations VALUES (215, 3, '2011-04-27 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (215, 4, '2011-04-27 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (215, 5, '2011-04-27 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (215, 6, '2011-04-27 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (601, 1, '2011-06-06 00:00:00', 35, 174, -212, NULL);
INSERT INTO storage.base_operations VALUES (601, 0, '2011-06-06 00:00:00', 83, 174, 212, NULL);
INSERT INTO storage.base_operations VALUES (370, 1, '2011-05-15 00:00:00', 35, 84, -165, NULL);
INSERT INTO storage.base_operations VALUES (450, 5, '2011-05-26 00:00:00', 9, 174, 2, NULL);
INSERT INTO storage.base_operations VALUES (236, -1, '2011-04-18 00:00:00', 30, 142, 1574, NULL);
INSERT INTO storage.base_operations VALUES (242, -1, '2011-04-18 00:00:00', 38, 85, 1067, NULL);
INSERT INTO storage.base_operations VALUES (248, -1, '2011-04-18 00:00:00', 8, 87, 3633, NULL);
INSERT INTO storage.base_operations VALUES (127, 1, '2011-04-21 00:00:00', 37, 141, -113, NULL);
INSERT INTO storage.base_operations VALUES (127, 0, '2011-04-21 00:00:00', 38, 141, 113, NULL);
INSERT INTO storage.base_operations VALUES (127, 3, '2011-04-21 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (216, 1, '2011-04-27 00:00:00', 30, 84, -178, NULL);
INSERT INTO storage.base_operations VALUES (216, 0, '2011-04-27 00:00:00', 37, 84, 178, NULL);
INSERT INTO storage.base_operations VALUES (216, 3, '2011-04-27 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (216, 4, '2011-04-27 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (216, 5, '2011-04-27 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (216, 6, '2011-04-27 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (217, 1, '2011-04-27 00:00:00', 30, 85, -300, NULL);
INSERT INTO storage.base_operations VALUES (217, 0, '2011-04-27 00:00:00', 37, 85, 300, NULL);
INSERT INTO storage.base_operations VALUES (217, 3, '2011-04-27 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (217, 4, '2011-04-27 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (217, 5, '2011-04-27 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (217, 6, '2011-04-27 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (127, 4, '2011-04-21 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (127, 5, '2011-04-21 00:00:00', 9, 141, 13, NULL);
INSERT INTO storage.base_operations VALUES (127, 6, '2011-04-21 00:00:00', 38, 141, -13, NULL);
INSERT INTO storage.base_operations VALUES (258, 1, '2011-04-25 00:00:00', 35, 141, -131, NULL);
INSERT INTO storage.base_operations VALUES (258, 0, '2011-04-25 00:00:00', 83, 141, 131, NULL);
INSERT INTO storage.base_operations VALUES (258, 3, '2011-04-25 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (258, 4, '2011-04-25 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (258, 5, '2011-04-25 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (258, 6, '2011-04-25 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (218, 1, '2011-04-27 00:00:00', 37, 84, -178, NULL);
INSERT INTO storage.base_operations VALUES (218, 0, '2011-04-27 00:00:00', 61, 84, 178, NULL);
INSERT INTO storage.base_operations VALUES (218, 3, '2011-04-27 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (218, 4, '2011-04-27 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (218, 5, '2011-04-27 00:00:00', 9, 84, 8, NULL);
INSERT INTO storage.base_operations VALUES (218, 6, '2011-04-27 00:00:00', 61, 84, -8, NULL);
INSERT INTO storage.base_operations VALUES (219, 1, '2011-04-27 00:00:00', 37, 85, -300, NULL);
INSERT INTO storage.base_operations VALUES (219, 0, '2011-04-27 00:00:00', 61, 85, 300, NULL);
INSERT INTO storage.base_operations VALUES (219, 3, '2011-04-27 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (219, 4, '2011-04-27 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (219, 5, '2011-04-27 00:00:00', 9, 85, 5, NULL);
INSERT INTO storage.base_operations VALUES (219, 6, '2011-04-27 00:00:00', 61, 85, -5, NULL);
INSERT INTO storage.base_operations VALUES (260, 1, '2011-04-26 00:00:00', 83, 85, -131, NULL);
INSERT INTO storage.base_operations VALUES (260, 0, '2011-04-26 00:00:00', 30, 85, 131, NULL);
INSERT INTO storage.base_operations VALUES (260, 3, '2011-04-26 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (260, 4, '2011-04-26 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (260, 5, '2011-04-26 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (260, 6, '2011-04-26 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (220, 1, '2011-04-28 00:00:00', 83, 140, -120, NULL);
INSERT INTO storage.base_operations VALUES (220, 0, '2011-04-28 00:00:00', 30, 140, 120, NULL);
INSERT INTO storage.base_operations VALUES (220, 3, '2011-04-28 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (220, 4, '2011-04-28 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (220, 5, '2011-04-28 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (220, 6, '2011-04-28 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (221, 1, '2011-04-28 00:00:00', 83, 141, -340, NULL);
INSERT INTO storage.base_operations VALUES (221, 0, '2011-04-28 00:00:00', 30, 141, 340, NULL);
INSERT INTO storage.base_operations VALUES (221, 3, '2011-04-28 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (221, 4, '2011-04-28 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (221, 5, '2011-04-28 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (221, 6, '2011-04-28 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (264, 1, '2011-04-26 00:00:00', 30, 85, -131, NULL);
INSERT INTO storage.base_operations VALUES (264, 0, '2011-04-26 00:00:00', 37, 85, 131, NULL);
INSERT INTO storage.base_operations VALUES (264, 3, '2011-04-26 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (222, 1, '2011-04-28 00:00:00', 30, 85, -119, NULL);
INSERT INTO storage.base_operations VALUES (222, 0, '2011-04-28 00:00:00', 37, 85, 119, NULL);
INSERT INTO storage.base_operations VALUES (222, 3, '2011-04-28 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (222, 4, '2011-04-28 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (222, 5, '2011-04-28 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (222, 6, '2011-04-28 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (264, 4, '2011-04-26 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (264, 5, '2011-04-26 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (264, 6, '2011-04-26 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (266, 1, '2011-04-26 00:00:00', 37, 85, -131, NULL);
INSERT INTO storage.base_operations VALUES (266, 0, '2011-04-26 00:00:00', 61, 85, 131, NULL);
INSERT INTO storage.base_operations VALUES (266, 3, '2011-04-26 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (266, 4, '2011-04-26 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (266, 5, '2011-04-26 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (266, 6, '2011-04-26 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (267, 1, '2011-04-26 00:00:00', 61, 85, -131, NULL);
INSERT INTO storage.base_operations VALUES (267, 0, '2011-04-26 00:00:00', 38, 85, 131, NULL);
INSERT INTO storage.base_operations VALUES (267, 3, '2011-04-26 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (267, 4, '2011-04-26 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (601, 3, '2011-06-06 00:00:00', 35, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (601, 4, '2011-06-06 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (223, 1, '2011-04-28 00:00:00', 37, 85, -119, NULL);
INSERT INTO storage.base_operations VALUES (223, 0, '2011-04-28 00:00:00', 61, 85, 119, NULL);
INSERT INTO storage.base_operations VALUES (223, 3, '2011-04-28 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (223, 4, '2011-04-28 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (223, 5, '2011-04-28 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (223, 6, '2011-04-28 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (317, 0, '2011-05-12 00:00:00', 62, 140, 230, NULL);
INSERT INTO storage.base_operations VALUES (317, 3, '2011-05-12 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (317, 4, '2011-05-12 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (317, 5, '2011-05-12 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (237, -1, '2011-04-18 00:00:00', 30, 143, 111, NULL);
INSERT INTO storage.base_operations VALUES (243, -1, '2011-04-18 00:00:00', 38, 86, 3245, NULL);
INSERT INTO storage.base_operations VALUES (224, 1, '2011-04-28 00:00:00', 61, 85, -119, NULL);
INSERT INTO storage.base_operations VALUES (224, 0, '2011-04-28 00:00:00', 38, 85, 119, NULL);
INSERT INTO storage.base_operations VALUES (224, 3, '2011-04-28 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (224, 4, '2011-04-28 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (224, 5, '2011-04-28 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (224, 6, '2011-04-28 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (249, -1, '2011-04-18 00:00:00', 12, 88, 214, NULL);
INSERT INTO storage.base_operations VALUES (450, 6, '2011-05-26 00:00:00', 30, 174, -2, NULL);
INSERT INTO storage.base_operations VALUES (317, 6, '2011-05-12 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (601, 5, '2011-06-06 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (282, 1, '2011-04-24 00:00:00', 35, 140, -90, NULL);
INSERT INTO storage.base_operations VALUES (282, 0, '2011-04-24 00:00:00', 83, 140, 90, NULL);
INSERT INTO storage.base_operations VALUES (282, 3, '2011-04-24 00:00:00', 35, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (282, 4, '2011-04-24 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (282, 5, '2011-04-24 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (282, 6, '2011-04-24 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (320, 6, '2011-05-12 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (1291, 3, '2011-08-01 00:00:00', 35, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (225, 1, '2011-04-28 00:00:00', 38, 84, -278, NULL);
INSERT INTO storage.base_operations VALUES (225, 0, '2011-04-28 00:00:00', 8, 84, 278, NULL);
INSERT INTO storage.base_operations VALUES (225, 3, '2011-04-28 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (225, 4, '2011-04-28 00:00:00', 8, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (225, 5, '2011-04-28 00:00:00', 9, 84, 8, NULL);
INSERT INTO storage.base_operations VALUES (225, 6, '2011-04-28 00:00:00', 8, 84, -8, NULL);
INSERT INTO storage.base_operations VALUES (226, 1, '2011-04-28 00:00:00', 38, 85, -414, NULL);
INSERT INTO storage.base_operations VALUES (226, 0, '2011-04-28 00:00:00', 8, 85, 414, NULL);
INSERT INTO storage.base_operations VALUES (226, 3, '2011-04-28 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (226, 4, '2011-04-28 00:00:00', 8, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (226, 5, '2011-04-28 00:00:00', 9, 85, 4, NULL);
INSERT INTO storage.base_operations VALUES (226, 6, '2011-04-28 00:00:00', 8, 85, -4, NULL);
INSERT INTO storage.base_operations VALUES (286, 6, '2011-04-24 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (285, 1, '2011-04-24 00:00:00', 83, 143, -85, NULL);
INSERT INTO storage.base_operations VALUES (285, 0, '2011-04-24 00:00:00', 30, 143, 85, NULL);
INSERT INTO storage.base_operations VALUES (227, 1, '2011-04-30 00:00:00', 83, 142, -1080, NULL);
INSERT INTO storage.base_operations VALUES (227, 0, '2011-04-30 00:00:00', 30, 142, 1080, NULL);
INSERT INTO storage.base_operations VALUES (227, 3, '2011-04-30 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (227, 4, '2011-04-30 00:00:00', 30, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (227, 5, '2011-04-30 00:00:00', 9, 142, 22, NULL);
INSERT INTO storage.base_operations VALUES (227, 6, '2011-04-30 00:00:00', 30, 142, -22, NULL);
INSERT INTO storage.base_operations VALUES (285, 3, '2011-04-24 00:00:00', 83, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (285, 4, '2011-04-24 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (261, 1, '2011-04-26 00:00:00', 83, 140, -64, NULL);
INSERT INTO storage.base_operations VALUES (261, 0, '2011-04-26 00:00:00', 30, 140, 64, NULL);
INSERT INTO storage.base_operations VALUES (261, 3, '2011-04-26 00:00:00', 83, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (261, 4, '2011-04-26 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (261, 5, '2011-04-26 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (261, 6, '2011-04-26 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (285, 5, '2011-04-24 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (285, 6, '2011-04-24 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (265, 1, '2011-04-26 00:00:00', 37, 84, -108, NULL);
INSERT INTO storage.base_operations VALUES (265, 0, '2011-04-26 00:00:00', 61, 84, 108, NULL);
INSERT INTO storage.base_operations VALUES (265, 3, '2011-04-26 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (265, 4, '2011-04-26 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (265, 5, '2011-04-26 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (265, 6, '2011-04-26 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (267, 5, '2011-04-26 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (267, 6, '2011-04-26 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (268, 1, '2011-04-26 00:00:00', 38, 85, -231, NULL);
INSERT INTO storage.base_operations VALUES (268, 0, '2011-04-26 00:00:00', 8, 85, 231, NULL);
INSERT INTO storage.base_operations VALUES (268, 3, '2011-04-26 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (268, 4, '2011-04-26 00:00:00', 8, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (268, 5, '2011-04-26 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (268, 6, '2011-04-26 00:00:00', 8, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (269, 1, '2011-04-26 00:00:00', 38, 141, -40, NULL);
INSERT INTO storage.base_operations VALUES (269, 0, '2011-04-26 00:00:00', 62, 141, 40, NULL);
INSERT INTO storage.base_operations VALUES (269, 3, '2011-04-26 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (269, 4, '2011-04-26 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (269, 5, '2011-04-26 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (269, 6, '2011-04-26 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (270, 1, '2011-04-26 00:00:00', 35, 84, -98, NULL);
INSERT INTO storage.base_operations VALUES (270, 0, '2011-04-26 00:00:00', 83, 84, 98, NULL);
INSERT INTO storage.base_operations VALUES (270, 3, '2011-04-26 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (270, 4, '2011-04-26 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (270, 5, '2011-04-26 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (270, 6, '2011-04-26 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (271, 1, '2011-04-26 00:00:00', 35, 85, -130, NULL);
INSERT INTO storage.base_operations VALUES (271, 0, '2011-04-26 00:00:00', 83, 85, 130, NULL);
INSERT INTO storage.base_operations VALUES (271, 3, '2011-04-26 00:00:00', 35, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (271, 4, '2011-04-26 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (271, 5, '2011-04-26 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (271, 6, '2011-04-26 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (315, 1, '2011-05-12 00:00:00', 37, 140, -80, NULL);
INSERT INTO storage.base_operations VALUES (287, 1, '2011-04-24 00:00:00', 30, 141, -34, NULL);
INSERT INTO storage.base_operations VALUES (287, 0, '2011-04-24 00:00:00', 37, 141, 34, NULL);
INSERT INTO storage.base_operations VALUES (287, 3, '2011-04-24 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (287, 4, '2011-04-24 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (287, 5, '2011-04-24 00:00:00', 9, 141, 6, NULL);
INSERT INTO storage.base_operations VALUES (287, 6, '2011-04-24 00:00:00', 37, 141, -6, NULL);
INSERT INTO storage.base_operations VALUES (288, 1, '2011-04-24 00:00:00', 30, 143, -43, NULL);
INSERT INTO storage.base_operations VALUES (288, 0, '2011-04-24 00:00:00', 37, 143, 43, NULL);
INSERT INTO storage.base_operations VALUES (288, 3, '2011-04-24 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (288, 4, '2011-04-24 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (288, 5, '2011-04-24 00:00:00', 9, 143, 2, NULL);
INSERT INTO storage.base_operations VALUES (288, 6, '2011-04-24 00:00:00', 37, 143, -2, NULL);
INSERT INTO storage.base_operations VALUES (315, 0, '2011-05-12 00:00:00', 38, 140, 80, NULL);
INSERT INTO storage.base_operations VALUES (315, 3, '2011-05-12 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (315, 4, '2011-05-12 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (315, 5, '2011-05-12 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (315, 6, '2011-05-12 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (318, 1, '2011-05-12 00:00:00', 38, 140, -60, NULL);
INSERT INTO storage.base_operations VALUES (318, 0, '2011-05-12 00:00:00', 62, 140, 60, NULL);
INSERT INTO storage.base_operations VALUES (318, 3, '2011-05-12 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (289, 1, '2011-04-24 00:00:00', 38, 84, -81, NULL);
INSERT INTO storage.base_operations VALUES (289, 0, '2011-04-24 00:00:00', 62, 84, 81, NULL);
INSERT INTO storage.base_operations VALUES (289, 3, '2011-04-24 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (289, 4, '2011-04-24 00:00:00', 62, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (289, 5, '2011-04-24 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (289, 6, '2011-04-24 00:00:00', 62, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (290, 1, '2011-04-24 00:00:00', 38, 86, -588, NULL);
INSERT INTO storage.base_operations VALUES (290, 0, '2011-04-24 00:00:00', 62, 86, 588, NULL);
INSERT INTO storage.base_operations VALUES (290, 3, '2011-04-24 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (290, 4, '2011-04-24 00:00:00', 62, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (290, 5, '2011-04-24 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (290, 6, '2011-04-24 00:00:00', 62, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (292, 1, '2011-05-02 00:00:00', 83, 142, -905, NULL);
INSERT INTO storage.base_operations VALUES (292, 0, '2011-05-02 00:00:00', 30, 142, 905, NULL);
INSERT INTO storage.base_operations VALUES (292, 3, '2011-05-02 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (292, 4, '2011-05-02 00:00:00', 30, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (292, 5, '2011-05-02 00:00:00', 9, 142, 10, NULL);
INSERT INTO storage.base_operations VALUES (292, 6, '2011-05-02 00:00:00', 30, 142, -10, NULL);
INSERT INTO storage.base_operations VALUES (291, 1, '2011-05-01 00:00:00', 83, 142, -900, NULL);
INSERT INTO storage.base_operations VALUES (291, 0, '2011-05-01 00:00:00', 30, 142, 900, NULL);
INSERT INTO storage.base_operations VALUES (291, 3, '2011-05-01 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (291, 4, '2011-05-01 00:00:00', 30, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (291, 5, '2011-05-01 00:00:00', 9, 142, 9, NULL);
INSERT INTO storage.base_operations VALUES (291, 6, '2011-05-01 00:00:00', 30, 142, -9, NULL);
INSERT INTO storage.base_operations VALUES (293, 1, '2011-05-03 00:00:00', 83, 142, -395, NULL);
INSERT INTO storage.base_operations VALUES (293, 0, '2011-05-03 00:00:00', 30, 142, 395, NULL);
INSERT INTO storage.base_operations VALUES (293, 3, '2011-05-03 00:00:00', 83, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (293, 4, '2011-05-03 00:00:00', 30, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (293, 5, '2011-05-03 00:00:00', 9, 142, 5, NULL);
INSERT INTO storage.base_operations VALUES (293, 6, '2011-05-03 00:00:00', 30, 142, -5, NULL);
INSERT INTO storage.base_operations VALUES (294, 1, '2011-05-10 00:00:00', 30, 140, -98, NULL);
INSERT INTO storage.base_operations VALUES (294, 0, '2011-05-10 00:00:00', 37, 140, 98, NULL);
INSERT INTO storage.base_operations VALUES (294, 3, '2011-05-10 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (294, 4, '2011-05-10 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (294, 5, '2011-05-10 00:00:00', 9, 140, 2, NULL);
INSERT INTO storage.base_operations VALUES (294, 6, '2011-05-10 00:00:00', 37, 140, -2, NULL);
INSERT INTO storage.base_operations VALUES (295, 1, '2011-05-11 00:00:00', 30, 140, -88, NULL);
INSERT INTO storage.base_operations VALUES (295, 0, '2011-05-11 00:00:00', 37, 140, 88, NULL);
INSERT INTO storage.base_operations VALUES (295, 3, '2011-05-11 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (295, 4, '2011-05-11 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (295, 5, '2011-05-11 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (295, 6, '2011-05-11 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (296, 1, '2011-05-11 00:00:00', 30, 142, -55, NULL);
INSERT INTO storage.base_operations VALUES (296, 0, '2011-05-11 00:00:00', 37, 142, 55, NULL);
INSERT INTO storage.base_operations VALUES (296, 3, '2011-05-11 00:00:00', 30, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (296, 4, '2011-05-11 00:00:00', 37, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (296, 5, '2011-05-11 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (296, 6, '2011-05-11 00:00:00', 37, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (297, 1, '2011-05-11 00:00:00', 37, 140, -100, NULL);
INSERT INTO storage.base_operations VALUES (297, 0, '2011-05-11 00:00:00', 38, 140, 100, NULL);
INSERT INTO storage.base_operations VALUES (297, 3, '2011-05-11 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (297, 4, '2011-05-11 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (297, 5, '2011-05-11 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (297, 6, '2011-05-11 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (298, 1, '2011-05-11 00:00:00', 37, 142, -55, NULL);
INSERT INTO storage.base_operations VALUES (298, 0, '2011-05-11 00:00:00', 38, 142, 55, NULL);
INSERT INTO storage.base_operations VALUES (298, 3, '2011-05-11 00:00:00', 37, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (298, 4, '2011-05-11 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (298, 5, '2011-05-11 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (298, 6, '2011-05-11 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (299, 1, '2011-05-11 00:00:00', 38, 140, -100, NULL);
INSERT INTO storage.base_operations VALUES (299, 0, '2011-05-11 00:00:00', 62, 140, 100, NULL);
INSERT INTO storage.base_operations VALUES (299, 3, '2011-05-11 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (299, 4, '2011-05-11 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (299, 5, '2011-05-11 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (299, 6, '2011-05-11 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (300, 1, '2011-05-11 00:00:00', 38, 142, -55, NULL);
INSERT INTO storage.base_operations VALUES (300, 0, '2011-05-11 00:00:00', 62, 142, 55, NULL);
INSERT INTO storage.base_operations VALUES (300, 3, '2011-05-11 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (300, 4, '2011-05-11 00:00:00', 62, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (300, 5, '2011-05-11 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (300, 6, '2011-05-11 00:00:00', 62, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (316, 1, '2011-05-12 00:00:00', 37, 140, -60, NULL);
INSERT INTO storage.base_operations VALUES (316, 0, '2011-05-12 00:00:00', 38, 140, 60, NULL);
INSERT INTO storage.base_operations VALUES (316, 3, '2011-05-12 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (316, 4, '2011-05-12 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (316, 5, '2011-05-12 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (316, 6, '2011-05-12 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (318, 4, '2011-05-12 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (318, 5, '2011-05-12 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (301, 1, '2011-05-11 00:00:00', 62, 140, -50, NULL);
INSERT INTO storage.base_operations VALUES (301, 0, '2011-05-11 00:00:00', 8, 140, 50, NULL);
INSERT INTO storage.base_operations VALUES (301, 3, '2011-05-11 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (301, 4, '2011-05-11 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (301, 5, '2011-05-11 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (301, 6, '2011-05-11 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (302, 1, '2011-05-11 00:00:00', 62, 142, -50, NULL);
INSERT INTO storage.base_operations VALUES (302, 0, '2011-05-11 00:00:00', 8, 142, 50, NULL);
INSERT INTO storage.base_operations VALUES (302, 3, '2011-05-11 00:00:00', 62, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (302, 4, '2011-05-11 00:00:00', 8, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (302, 5, '2011-05-11 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (302, 6, '2011-05-11 00:00:00', 8, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (318, 6, '2011-05-12 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (319, 1, '2011-05-12 00:00:00', 62, 140, -230, NULL);
INSERT INTO storage.base_operations VALUES (319, 0, '2011-05-12 00:00:00', 8, 140, 230, NULL);
INSERT INTO storage.base_operations VALUES (319, 3, '2011-05-12 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (319, 4, '2011-05-12 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (319, 5, '2011-05-12 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (319, 6, '2011-05-12 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (432, 1, '2011-05-21 00:00:00', 30, 141, -80, NULL);
INSERT INTO storage.base_operations VALUES (432, 0, '2011-05-21 00:00:00', 37, 141, 80, NULL);
INSERT INTO storage.base_operations VALUES (432, 3, '2011-05-21 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (432, 4, '2011-05-21 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (432, 5, '2011-05-21 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (432, 6, '2011-05-21 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (370, 0, '2011-05-15 00:00:00', 83, 84, 165, NULL);
INSERT INTO storage.base_operations VALUES (370, 3, '2011-05-15 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (370, 4, '2011-05-15 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (370, 5, '2011-05-15 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (370, 6, '2011-05-15 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (304, 1, '2011-05-11 00:00:00', 30, 140, -140, NULL);
INSERT INTO storage.base_operations VALUES (304, 0, '2011-05-11 00:00:00', 37, 140, 140, NULL);
INSERT INTO storage.base_operations VALUES (304, 3, '2011-05-11 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (304, 4, '2011-05-11 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (304, 5, '2011-05-11 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (304, 6, '2011-05-11 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (381, 1, '2011-05-15 00:00:00', 37, 84, -100, NULL);
INSERT INTO storage.base_operations VALUES (381, 0, '2011-05-15 00:00:00', 61, 84, 100, NULL);
INSERT INTO storage.base_operations VALUES (381, 3, '2011-05-15 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (381, 4, '2011-05-15 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (306, 1, '2011-05-11 00:00:00', 37, 140, -100, NULL);
INSERT INTO storage.base_operations VALUES (306, 0, '2011-05-11 00:00:00', 38, 140, 100, NULL);
INSERT INTO storage.base_operations VALUES (306, 3, '2011-05-11 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (306, 4, '2011-05-11 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (306, 5, '2011-05-11 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (306, 6, '2011-05-11 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (381, 5, '2011-05-15 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (381, 6, '2011-05-15 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (384, 1, '2011-05-15 00:00:00', 61, 85, -64, NULL);
INSERT INTO storage.base_operations VALUES (384, 0, '2011-05-15 00:00:00', 38, 85, 64, NULL);
INSERT INTO storage.base_operations VALUES (384, 3, '2011-05-15 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (307, 1, '2011-05-12 00:00:00', 35, 84, -101, NULL);
INSERT INTO storage.base_operations VALUES (307, 0, '2011-05-12 00:00:00', 83, 84, 101, NULL);
INSERT INTO storage.base_operations VALUES (307, 3, '2011-05-12 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (307, 4, '2011-05-12 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (307, 5, '2011-05-12 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (307, 6, '2011-05-12 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (308, 1, '2011-05-12 00:00:00', 35, 85, -119, NULL);
INSERT INTO storage.base_operations VALUES (308, 0, '2011-05-12 00:00:00', 83, 85, 119, NULL);
INSERT INTO storage.base_operations VALUES (308, 3, '2011-05-12 00:00:00', 35, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (308, 4, '2011-05-12 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (308, 5, '2011-05-12 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (308, 6, '2011-05-12 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (309, 1, '2011-05-12 00:00:00', 35, 141, -67, NULL);
INSERT INTO storage.base_operations VALUES (309, 0, '2011-05-12 00:00:00', 83, 141, 67, NULL);
INSERT INTO storage.base_operations VALUES (309, 3, '2011-05-12 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (309, 4, '2011-05-12 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (309, 5, '2011-05-12 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (309, 6, '2011-05-12 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (310, 1, '2011-05-12 00:00:00', 35, 84, -101, NULL);
INSERT INTO storage.base_operations VALUES (310, 0, '2011-05-12 00:00:00', 83, 84, 101, NULL);
INSERT INTO storage.base_operations VALUES (310, 3, '2011-05-12 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (310, 4, '2011-05-12 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (310, 5, '2011-05-12 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (310, 6, '2011-05-12 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (311, 1, '2011-05-12 00:00:00', 35, 85, -66, NULL);
INSERT INTO storage.base_operations VALUES (311, 0, '2011-05-12 00:00:00', 83, 85, 66, NULL);
INSERT INTO storage.base_operations VALUES (311, 3, '2011-05-12 00:00:00', 35, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (311, 4, '2011-05-12 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (311, 5, '2011-05-12 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (311, 6, '2011-05-12 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (312, 1, '2011-05-12 00:00:00', 35, 141, -90, NULL);
INSERT INTO storage.base_operations VALUES (312, 0, '2011-05-12 00:00:00', 83, 141, 90, NULL);
INSERT INTO storage.base_operations VALUES (312, 3, '2011-05-12 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (312, 4, '2011-05-12 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (312, 5, '2011-05-12 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (312, 6, '2011-05-12 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (369, 1, '2011-05-14 00:00:00', 62, 84, -250, NULL);
INSERT INTO storage.base_operations VALUES (369, 0, '2011-05-14 00:00:00', 8, 84, 250, NULL);
INSERT INTO storage.base_operations VALUES (369, 3, '2011-05-14 00:00:00', 62, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (369, 4, '2011-05-14 00:00:00', 8, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (369, 5, '2011-05-14 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (369, 6, '2011-05-14 00:00:00', 8, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (433, 1, '2011-05-21 00:00:00', 30, 141, -121, NULL);
INSERT INTO storage.base_operations VALUES (433, 0, '2011-05-21 00:00:00', 37, 141, 121, NULL);
INSERT INTO storage.base_operations VALUES (433, 3, '2011-05-21 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (433, 4, '2011-05-21 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (433, 5, '2011-05-21 00:00:00', 9, 141, 1, NULL);
INSERT INTO storage.base_operations VALUES (433, 6, '2011-05-21 00:00:00', 37, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (371, 1, '2011-05-15 00:00:00', 35, 85, -138, NULL);
INSERT INTO storage.base_operations VALUES (371, 0, '2011-05-15 00:00:00', 83, 85, 138, NULL);
INSERT INTO storage.base_operations VALUES (371, 3, '2011-05-15 00:00:00', 35, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (371, 4, '2011-05-15 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (371, 5, '2011-05-15 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (322, 1, '2011-05-13 00:00:00', 35, 85, -89, NULL);
INSERT INTO storage.base_operations VALUES (322, 0, '2011-05-13 00:00:00', 83, 85, 89, NULL);
INSERT INTO storage.base_operations VALUES (322, 3, '2011-05-13 00:00:00', 35, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (322, 4, '2011-05-13 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (322, 5, '2011-05-13 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (322, 6, '2011-05-13 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (323, 1, '2011-05-13 00:00:00', 35, 141, -100, NULL);
INSERT INTO storage.base_operations VALUES (323, 0, '2011-05-13 00:00:00', 83, 141, 100, NULL);
INSERT INTO storage.base_operations VALUES (323, 3, '2011-05-13 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (323, 4, '2011-05-13 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (323, 5, '2011-05-13 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (323, 6, '2011-05-13 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (324, 1, '2011-05-13 00:00:00', 35, 84, -109, NULL);
INSERT INTO storage.base_operations VALUES (324, 0, '2011-05-13 00:00:00', 83, 84, 109, NULL);
INSERT INTO storage.base_operations VALUES (324, 3, '2011-05-13 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (324, 4, '2011-05-13 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (324, 5, '2011-05-13 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (324, 6, '2011-05-13 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (325, 1, '2011-05-13 00:00:00', 35, 85, -90, NULL);
INSERT INTO storage.base_operations VALUES (325, 0, '2011-05-13 00:00:00', 83, 85, 90, NULL);
INSERT INTO storage.base_operations VALUES (325, 3, '2011-05-13 00:00:00', 35, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (325, 4, '2011-05-13 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (325, 5, '2011-05-13 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (325, 6, '2011-05-13 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (326, 1, '2011-05-13 00:00:00', 35, 141, -87, NULL);
INSERT INTO storage.base_operations VALUES (326, 0, '2011-05-13 00:00:00', 83, 141, 87, NULL);
INSERT INTO storage.base_operations VALUES (326, 3, '2011-05-13 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (326, 4, '2011-05-13 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (326, 5, '2011-05-13 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (326, 6, '2011-05-13 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (371, 6, '2011-05-15 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (376, 1, '2011-05-15 00:00:00', 83, 84, -100, NULL);
INSERT INTO storage.base_operations VALUES (376, 0, '2011-05-15 00:00:00', 30, 84, 100, NULL);
INSERT INTO storage.base_operations VALUES (376, 3, '2011-05-15 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (376, 4, '2011-05-15 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (376, 5, '2011-05-15 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (376, 6, '2011-05-15 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (379, 1, '2011-05-15 00:00:00', 30, 84, -100, NULL);
INSERT INTO storage.base_operations VALUES (379, 0, '2011-05-15 00:00:00', 37, 84, 100, NULL);
INSERT INTO storage.base_operations VALUES (379, 3, '2011-05-15 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (379, 4, '2011-05-15 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (379, 5, '2011-05-15 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (379, 6, '2011-05-15 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (382, 1, '2011-05-15 00:00:00', 37, 85, -64, NULL);
INSERT INTO storage.base_operations VALUES (382, 0, '2011-05-15 00:00:00', 61, 85, 64, NULL);
INSERT INTO storage.base_operations VALUES (382, 3, '2011-05-15 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (382, 4, '2011-05-15 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (382, 5, '2011-05-15 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (382, 6, '2011-05-15 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (384, 4, '2011-05-15 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (384, 5, '2011-05-15 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (384, 6, '2011-05-15 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (437, 5, '2011-05-21 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (437, 6, '2011-05-21 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (327, 1, '2011-05-13 00:00:00', 83, 84, -202, NULL);
INSERT INTO storage.base_operations VALUES (327, 0, '2011-05-13 00:00:00', 30, 84, 202, NULL);
INSERT INTO storage.base_operations VALUES (327, 3, '2011-05-13 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (327, 4, '2011-05-13 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (327, 5, '2011-05-13 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (327, 6, '2011-05-13 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (328, 1, '2011-05-13 00:00:00', 83, 85, -184, NULL);
INSERT INTO storage.base_operations VALUES (328, 0, '2011-05-13 00:00:00', 30, 85, 184, NULL);
INSERT INTO storage.base_operations VALUES (328, 3, '2011-05-13 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (328, 4, '2011-05-13 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (328, 5, '2011-05-13 00:00:00', 9, 85, 1, NULL);
INSERT INTO storage.base_operations VALUES (328, 6, '2011-05-13 00:00:00', 30, 85, -1, NULL);
INSERT INTO storage.base_operations VALUES (329, 1, '2011-05-13 00:00:00', 83, 141, -156, NULL);
INSERT INTO storage.base_operations VALUES (329, 0, '2011-05-13 00:00:00', 30, 141, 156, NULL);
INSERT INTO storage.base_operations VALUES (329, 3, '2011-05-13 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (329, 4, '2011-05-13 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (329, 5, '2011-05-13 00:00:00', 9, 141, 1, NULL);
INSERT INTO storage.base_operations VALUES (329, 6, '2011-05-13 00:00:00', 30, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (439, 1, '2011-05-22 00:00:00', 30, 141, -60, NULL);
INSERT INTO storage.base_operations VALUES (439, 0, '2011-05-22 00:00:00', 37, 141, 60, NULL);
INSERT INTO storage.base_operations VALUES (439, 3, '2011-05-22 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (439, 4, '2011-05-22 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (439, 5, '2011-05-22 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (439, 6, '2011-05-22 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (601, 6, '2011-06-06 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (613, 6, '2011-06-07 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (602, 1, '2011-06-06 00:00:00', 35, 175, -154, NULL);
INSERT INTO storage.base_operations VALUES (602, 0, '2011-06-06 00:00:00', 83, 175, 154, NULL);
INSERT INTO storage.base_operations VALUES (602, 3, '2011-06-06 00:00:00', 35, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (602, 4, '2011-06-06 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (602, 5, '2011-06-06 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (331, 1, '2011-05-13 00:00:00', 30, 84, -102, NULL);
INSERT INTO storage.base_operations VALUES (331, 0, '2011-05-13 00:00:00', 37, 84, 102, NULL);
INSERT INTO storage.base_operations VALUES (331, 3, '2011-05-13 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (331, 4, '2011-05-13 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (331, 5, '2011-05-13 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (331, 6, '2011-05-13 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (332, 1, '2011-05-13 00:00:00', 30, 85, -184, NULL);
INSERT INTO storage.base_operations VALUES (332, 0, '2011-05-13 00:00:00', 37, 85, 184, NULL);
INSERT INTO storage.base_operations VALUES (332, 3, '2011-05-13 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (332, 4, '2011-05-13 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (332, 5, '2011-05-13 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (332, 6, '2011-05-13 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (333, 1, '2011-05-13 00:00:00', 30, 84, -100, NULL);
INSERT INTO storage.base_operations VALUES (333, 0, '2011-05-13 00:00:00', 37, 84, 100, NULL);
INSERT INTO storage.base_operations VALUES (333, 3, '2011-05-13 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (333, 4, '2011-05-13 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (333, 5, '2011-05-13 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (333, 6, '2011-05-13 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (372, 1, '2011-05-15 00:00:00', 35, 84, -150, NULL);
INSERT INTO storage.base_operations VALUES (372, 0, '2011-05-15 00:00:00', 83, 84, 150, NULL);
INSERT INTO storage.base_operations VALUES (372, 3, '2011-05-15 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (372, 4, '2011-05-15 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (372, 5, '2011-05-15 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (372, 6, '2011-05-15 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (375, 1, '2011-05-15 00:00:00', 35, 141, -148, NULL);
INSERT INTO storage.base_operations VALUES (375, 0, '2011-05-15 00:00:00', 83, 141, 148, NULL);
INSERT INTO storage.base_operations VALUES (375, 3, '2011-05-15 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (375, 4, '2011-05-15 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (375, 5, '2011-05-15 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (375, 6, '2011-05-15 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (377, 1, '2011-05-15 00:00:00', 83, 85, -116, NULL);
INSERT INTO storage.base_operations VALUES (377, 0, '2011-05-15 00:00:00', 30, 85, 116, NULL);
INSERT INTO storage.base_operations VALUES (377, 3, '2011-05-15 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (377, 4, '2011-05-15 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (377, 5, '2011-05-15 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (377, 6, '2011-05-15 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (334, 1, '2011-05-13 00:00:00', 37, 84, -202, NULL);
INSERT INTO storage.base_operations VALUES (334, 0, '2011-05-13 00:00:00', 61, 84, 202, NULL);
INSERT INTO storage.base_operations VALUES (334, 3, '2011-05-13 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (334, 4, '2011-05-13 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (334, 5, '2011-05-13 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (334, 6, '2011-05-13 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (335, 1, '2011-05-13 00:00:00', 37, 85, -184, NULL);
INSERT INTO storage.base_operations VALUES (335, 0, '2011-05-13 00:00:00', 61, 85, 184, NULL);
INSERT INTO storage.base_operations VALUES (335, 3, '2011-05-13 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (335, 4, '2011-05-13 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (335, 5, '2011-05-13 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (335, 6, '2011-05-13 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (380, 1, '2011-05-15 00:00:00', 30, 85, -64, NULL);
INSERT INTO storage.base_operations VALUES (380, 0, '2011-05-15 00:00:00', 37, 85, 64, NULL);
INSERT INTO storage.base_operations VALUES (380, 3, '2011-05-15 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (380, 4, '2011-05-15 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (380, 5, '2011-05-15 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (380, 6, '2011-05-15 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (337, 1, '2011-05-13 00:00:00', 61, 85, -184, NULL);
INSERT INTO storage.base_operations VALUES (337, 0, '2011-05-13 00:00:00', 38, 85, 184, NULL);
INSERT INTO storage.base_operations VALUES (337, 3, '2011-05-13 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (337, 4, '2011-05-13 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (337, 5, '2011-05-13 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (337, 6, '2011-05-13 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (338, 1, '2011-05-13 00:00:00', 61, 84, -202, NULL);
INSERT INTO storage.base_operations VALUES (338, 0, '2011-05-13 00:00:00', 38, 84, 202, NULL);
INSERT INTO storage.base_operations VALUES (338, 3, '2011-05-13 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (338, 4, '2011-05-13 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (338, 5, '2011-05-13 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (338, 6, '2011-05-13 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (339, 1, '2011-05-13 00:00:00', 38, 85, -184, NULL);
INSERT INTO storage.base_operations VALUES (339, 0, '2011-05-13 00:00:00', 62, 85, 184, NULL);
INSERT INTO storage.base_operations VALUES (339, 3, '2011-05-13 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (339, 4, '2011-05-13 00:00:00', 62, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (339, 5, '2011-05-13 00:00:00', 9, 85, 9, NULL);
INSERT INTO storage.base_operations VALUES (339, 6, '2011-05-13 00:00:00', 62, 85, -9, NULL);
INSERT INTO storage.base_operations VALUES (386, 1, '2011-05-15 00:00:00', 62, 84, -250, NULL);
INSERT INTO storage.base_operations VALUES (386, 0, '2011-05-15 00:00:00', 8, 84, 250, NULL);
INSERT INTO storage.base_operations VALUES (386, 3, '2011-05-15 00:00:00', 62, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (386, 4, '2011-05-15 00:00:00', 8, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (386, 5, '2011-05-15 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (340, 1, '2011-05-13 00:00:00', 62, 85, -175, NULL);
INSERT INTO storage.base_operations VALUES (340, 0, '2011-05-13 00:00:00', 8, 85, 175, NULL);
INSERT INTO storage.base_operations VALUES (340, 3, '2011-05-13 00:00:00', 62, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (340, 4, '2011-05-13 00:00:00', 8, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (340, 5, '2011-05-13 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (340, 6, '2011-05-13 00:00:00', 8, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (321, 1, '2011-05-13 00:00:00', 35, 84, -58, NULL);
INSERT INTO storage.base_operations VALUES (321, 0, '2011-05-13 00:00:00', 83, 84, 58, NULL);
INSERT INTO storage.base_operations VALUES (321, 3, '2011-05-13 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (321, 4, '2011-05-13 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (321, 5, '2011-05-13 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (321, 6, '2011-05-13 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (602, 6, '2011-06-06 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (693, 1, '2011-06-09 00:00:00', 62, 175, -250, NULL);
INSERT INTO storage.base_operations VALUES (693, 0, '2011-06-09 00:00:00', 8, 175, 250, NULL);
INSERT INTO storage.base_operations VALUES (693, 3, '2011-06-09 00:00:00', 62, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (693, 4, '2011-06-09 00:00:00', 8, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (693, 5, '2011-06-09 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (373, 1, '2011-05-15 00:00:00', 35, 85, -116, NULL);
INSERT INTO storage.base_operations VALUES (373, 0, '2011-05-15 00:00:00', 83, 85, 116, NULL);
INSERT INTO storage.base_operations VALUES (373, 3, '2011-05-15 00:00:00', 35, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (373, 4, '2011-05-15 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (341, 1, '2011-05-14 00:00:00', 35, 84, -140, NULL);
INSERT INTO storage.base_operations VALUES (341, 0, '2011-05-14 00:00:00', 83, 84, 140, NULL);
INSERT INTO storage.base_operations VALUES (341, 3, '2011-05-14 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (341, 4, '2011-05-14 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (341, 5, '2011-05-14 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (341, 6, '2011-05-14 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (342, 1, '2011-05-14 00:00:00', 35, 85, -154, NULL);
INSERT INTO storage.base_operations VALUES (342, 0, '2011-05-14 00:00:00', 83, 85, 154, NULL);
INSERT INTO storage.base_operations VALUES (342, 3, '2011-05-14 00:00:00', 35, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (342, 4, '2011-05-14 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (342, 5, '2011-05-14 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (342, 6, '2011-05-14 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (343, 1, '2011-05-14 00:00:00', 35, 141, -90, NULL);
INSERT INTO storage.base_operations VALUES (343, 0, '2011-05-14 00:00:00', 83, 141, 90, NULL);
INSERT INTO storage.base_operations VALUES (343, 3, '2011-05-14 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (343, 4, '2011-05-14 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (343, 5, '2011-05-14 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (343, 6, '2011-05-14 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (344, 1, '2011-05-14 00:00:00', 35, 84, -100, NULL);
INSERT INTO storage.base_operations VALUES (344, 0, '2011-05-14 00:00:00', 83, 84, 100, NULL);
INSERT INTO storage.base_operations VALUES (344, 3, '2011-05-14 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (344, 4, '2011-05-14 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (344, 5, '2011-05-14 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (344, 6, '2011-05-14 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (345, 1, '2011-05-14 00:00:00', 35, 85, -64, NULL);
INSERT INTO storage.base_operations VALUES (345, 0, '2011-05-14 00:00:00', 83, 85, 64, NULL);
INSERT INTO storage.base_operations VALUES (345, 3, '2011-05-14 00:00:00', 35, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (345, 4, '2011-05-14 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (345, 5, '2011-05-14 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (345, 6, '2011-05-14 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (346, 1, '2011-05-14 00:00:00', 35, 141, -76, NULL);
INSERT INTO storage.base_operations VALUES (346, 0, '2011-05-14 00:00:00', 83, 141, 76, NULL);
INSERT INTO storage.base_operations VALUES (346, 3, '2011-05-14 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (346, 4, '2011-05-14 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (346, 5, '2011-05-14 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (346, 6, '2011-05-14 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (373, 5, '2011-05-15 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (373, 6, '2011-05-15 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (378, 1, '2011-05-15 00:00:00', 83, 141, -76, NULL);
INSERT INTO storage.base_operations VALUES (378, 0, '2011-05-15 00:00:00', 30, 141, 76, NULL);
INSERT INTO storage.base_operations VALUES (378, 3, '2011-05-15 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (378, 4, '2011-05-15 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (378, 5, '2011-05-15 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (378, 6, '2011-05-15 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (385, 1, '2011-05-15 00:00:00', 38, 84, -100, NULL);
INSERT INTO storage.base_operations VALUES (385, 0, '2011-05-15 00:00:00', 62, 84, 100, NULL);
INSERT INTO storage.base_operations VALUES (385, 3, '2011-05-15 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (385, 4, '2011-05-15 00:00:00', 62, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (385, 5, '2011-05-15 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (353, 1, '2011-05-14 00:00:00', 83, 84, -167, NULL);
INSERT INTO storage.base_operations VALUES (353, 0, '2011-05-14 00:00:00', 30, 84, 167, NULL);
INSERT INTO storage.base_operations VALUES (353, 3, '2011-05-14 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (353, 4, '2011-05-14 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (353, 5, '2011-05-14 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (353, 6, '2011-05-14 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (348, 1, '2011-05-14 00:00:00', 83, 85, -177, NULL);
INSERT INTO storage.base_operations VALUES (348, 0, '2011-05-14 00:00:00', 30, 85, 177, NULL);
INSERT INTO storage.base_operations VALUES (348, 3, '2011-05-14 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (348, 4, '2011-05-14 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (348, 5, '2011-05-14 00:00:00', 9, 85, 2, NULL);
INSERT INTO storage.base_operations VALUES (348, 6, '2011-05-14 00:00:00', 30, 85, -2, NULL);
INSERT INTO storage.base_operations VALUES (349, 1, '2011-05-14 00:00:00', 83, 141, -186, NULL);
INSERT INTO storage.base_operations VALUES (349, 0, '2011-05-14 00:00:00', 30, 141, 186, NULL);
INSERT INTO storage.base_operations VALUES (349, 3, '2011-05-14 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (349, 4, '2011-05-14 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (349, 5, '2011-05-14 00:00:00', 9, 141, 1, NULL);
INSERT INTO storage.base_operations VALUES (349, 6, '2011-05-14 00:00:00', 30, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (350, 1, '2011-05-14 00:00:00', 83, 84, -140, NULL);
INSERT INTO storage.base_operations VALUES (350, 0, '2011-05-14 00:00:00', 30, 84, 140, NULL);
INSERT INTO storage.base_operations VALUES (350, 3, '2011-05-14 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (350, 4, '2011-05-14 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (350, 5, '2011-05-14 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (350, 6, '2011-05-14 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (351, 1, '2011-05-14 00:00:00', 83, 85, -154, NULL);
INSERT INTO storage.base_operations VALUES (351, 0, '2011-05-14 00:00:00', 30, 85, 154, NULL);
INSERT INTO storage.base_operations VALUES (351, 3, '2011-05-14 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (351, 4, '2011-05-14 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (351, 5, '2011-05-14 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (351, 6, '2011-05-14 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (352, 1, '2011-05-14 00:00:00', 83, 141, -90, NULL);
INSERT INTO storage.base_operations VALUES (352, 0, '2011-05-14 00:00:00', 30, 141, 90, NULL);
INSERT INTO storage.base_operations VALUES (352, 3, '2011-05-14 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (352, 4, '2011-05-14 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (352, 5, '2011-05-14 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (352, 6, '2011-05-14 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (434, 1, '2011-05-21 00:00:00', 37, 140, -154, NULL);
INSERT INTO storage.base_operations VALUES (434, 0, '2011-05-21 00:00:00', 38, 140, 154, NULL);
INSERT INTO storage.base_operations VALUES (434, 3, '2011-05-21 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (434, 4, '2011-05-21 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (434, 5, '2011-05-21 00:00:00', 9, 140, 9, NULL);
INSERT INTO storage.base_operations VALUES (434, 6, '2011-05-21 00:00:00', 38, 140, -9, NULL);
INSERT INTO storage.base_operations VALUES (374, 1, '2011-05-15 00:00:00', 35, 141, -139, NULL);
INSERT INTO storage.base_operations VALUES (374, 0, '2011-05-15 00:00:00', 83, 141, 139, NULL);
INSERT INTO storage.base_operations VALUES (374, 3, '2011-05-15 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (374, 4, '2011-05-15 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (374, 5, '2011-05-15 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (354, 1, '2011-05-14 00:00:00', 30, 84, -167, NULL);
INSERT INTO storage.base_operations VALUES (354, 0, '2011-05-14 00:00:00', 37, 84, 167, NULL);
INSERT INTO storage.base_operations VALUES (354, 3, '2011-05-14 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (354, 4, '2011-05-14 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (354, 5, '2011-05-14 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (354, 6, '2011-05-14 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (355, 1, '2011-05-14 00:00:00', 30, 85, -177, NULL);
INSERT INTO storage.base_operations VALUES (355, 0, '2011-05-14 00:00:00', 37, 85, 177, NULL);
INSERT INTO storage.base_operations VALUES (355, 3, '2011-05-14 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (355, 4, '2011-05-14 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (355, 5, '2011-05-14 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (355, 6, '2011-05-14 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (356, 1, '2011-05-14 00:00:00', 30, 84, -140, NULL);
INSERT INTO storage.base_operations VALUES (356, 0, '2011-05-14 00:00:00', 37, 84, 140, NULL);
INSERT INTO storage.base_operations VALUES (356, 3, '2011-05-14 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (356, 4, '2011-05-14 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (356, 5, '2011-05-14 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (356, 6, '2011-05-14 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (357, 1, '2011-05-14 00:00:00', 30, 85, -154, NULL);
INSERT INTO storage.base_operations VALUES (357, 0, '2011-05-14 00:00:00', 37, 85, 154, NULL);
INSERT INTO storage.base_operations VALUES (357, 3, '2011-05-14 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (357, 4, '2011-05-14 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (357, 5, '2011-05-14 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (357, 6, '2011-05-14 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (358, 1, '2011-05-14 00:00:00', 30, 140, -60, NULL);
INSERT INTO storage.base_operations VALUES (358, 0, '2011-05-14 00:00:00', 37, 140, 60, NULL);
INSERT INTO storage.base_operations VALUES (358, 3, '2011-05-14 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (358, 4, '2011-05-14 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (358, 5, '2011-05-14 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (358, 6, '2011-05-14 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (374, 6, '2011-05-15 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (604, 1, '2011-06-06 00:00:00', 83, 174, -212, NULL);
INSERT INTO storage.base_operations VALUES (604, 0, '2011-06-06 00:00:00', 30, 174, 212, NULL);
INSERT INTO storage.base_operations VALUES (604, 3, '2011-06-06 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (604, 4, '2011-06-06 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (604, 5, '2011-06-06 00:00:00', 9, 174, 2, NULL);
INSERT INTO storage.base_operations VALUES (440, 1, '2011-05-22 00:00:00', 30, 143, -73, NULL);
INSERT INTO storage.base_operations VALUES (440, 0, '2011-05-22 00:00:00', 37, 143, 73, NULL);
INSERT INTO storage.base_operations VALUES (440, 3, '2011-05-22 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (383, 1, '2011-05-15 00:00:00', 61, 84, -100, NULL);
INSERT INTO storage.base_operations VALUES (383, 0, '2011-05-15 00:00:00', 38, 84, 100, NULL);
INSERT INTO storage.base_operations VALUES (383, 3, '2011-05-15 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (383, 4, '2011-05-15 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (383, 5, '2011-05-15 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (383, 6, '2011-05-15 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (385, 6, '2011-05-15 00:00:00', 62, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (386, 6, '2011-05-15 00:00:00', 8, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (362, 1, '2011-05-14 00:00:00', 37, 85, -154, NULL);
INSERT INTO storage.base_operations VALUES (362, 0, '2011-05-14 00:00:00', 38, 85, 154, NULL);
INSERT INTO storage.base_operations VALUES (362, 3, '2011-05-14 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (362, 4, '2011-05-14 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (362, 5, '2011-05-14 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (362, 6, '2011-05-14 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (359, 1, '2011-05-14 00:00:00', 37, 84, -167, NULL);
INSERT INTO storage.base_operations VALUES (359, 0, '2011-05-14 00:00:00', 61, 84, 167, NULL);
INSERT INTO storage.base_operations VALUES (359, 3, '2011-05-14 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (359, 4, '2011-05-14 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (359, 5, '2011-05-14 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (359, 6, '2011-05-14 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (360, 1, '2011-05-14 00:00:00', 37, 85, -177, NULL);
INSERT INTO storage.base_operations VALUES (360, 0, '2011-05-14 00:00:00', 61, 85, 177, NULL);
INSERT INTO storage.base_operations VALUES (360, 3, '2011-05-14 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (360, 4, '2011-05-14 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (360, 5, '2011-05-14 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (360, 6, '2011-05-14 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (361, 1, '2011-05-14 00:00:00', 37, 84, -140, NULL);
INSERT INTO storage.base_operations VALUES (361, 0, '2011-05-14 00:00:00', 61, 84, 140, NULL);
INSERT INTO storage.base_operations VALUES (361, 3, '2011-05-14 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (361, 4, '2011-05-14 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (361, 5, '2011-05-14 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (361, 6, '2011-05-14 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (363, 1, '2011-05-14 00:00:00', 37, 85, -154, NULL);
INSERT INTO storage.base_operations VALUES (363, 0, '2011-05-14 00:00:00', 61, 85, 154, NULL);
INSERT INTO storage.base_operations VALUES (363, 3, '2011-05-14 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (363, 4, '2011-05-14 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (363, 5, '2011-05-14 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (363, 6, '2011-05-14 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (364, 1, '2011-05-14 00:00:00', 61, 84, -167, NULL);
INSERT INTO storage.base_operations VALUES (364, 0, '2011-05-14 00:00:00', 38, 84, 167, NULL);
INSERT INTO storage.base_operations VALUES (364, 3, '2011-05-14 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (364, 4, '2011-05-14 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (364, 5, '2011-05-14 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (364, 6, '2011-05-14 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (435, 1, '2011-05-21 00:00:00', 37, 141, -10, NULL);
INSERT INTO storage.base_operations VALUES (435, 0, '2011-05-21 00:00:00', 38, 141, 10, NULL);
INSERT INTO storage.base_operations VALUES (435, 3, '2011-05-21 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (435, 4, '2011-05-21 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (435, 5, '2011-05-21 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (435, 6, '2011-05-21 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (438, 1, '2011-05-21 00:00:00', 38, 141, -20, NULL);
INSERT INTO storage.base_operations VALUES (438, 0, '2011-05-21 00:00:00', 8, 141, 20, NULL);
INSERT INTO storage.base_operations VALUES (438, 3, '2011-05-21 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (438, 4, '2011-05-21 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (438, 5, '2011-05-21 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (438, 6, '2011-05-21 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (440, 4, '2011-05-22 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (440, 5, '2011-05-22 00:00:00', 9, 143, 2, NULL);
INSERT INTO storage.base_operations VALUES (440, 6, '2011-05-22 00:00:00', 37, 143, -2, NULL);
INSERT INTO storage.base_operations VALUES (387, 1, '2011-05-16 00:00:00', 35, 84, -214, NULL);
INSERT INTO storage.base_operations VALUES (387, 0, '2011-05-16 00:00:00', 83, 84, 214, NULL);
INSERT INTO storage.base_operations VALUES (387, 3, '2011-05-16 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (387, 4, '2011-05-16 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (387, 5, '2011-05-16 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (387, 6, '2011-05-16 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (388, 1, '2011-05-16 00:00:00', 35, 85, -149, NULL);
INSERT INTO storage.base_operations VALUES (388, 0, '2011-05-16 00:00:00', 83, 85, 149, NULL);
INSERT INTO storage.base_operations VALUES (388, 3, '2011-05-16 00:00:00', 35, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (388, 4, '2011-05-16 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (388, 5, '2011-05-16 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (388, 6, '2011-05-16 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (389, 1, '2011-05-16 00:00:00', 35, 141, -170, NULL);
INSERT INTO storage.base_operations VALUES (389, 0, '2011-05-16 00:00:00', 83, 141, 170, NULL);
INSERT INTO storage.base_operations VALUES (389, 3, '2011-05-16 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (389, 4, '2011-05-16 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (389, 5, '2011-05-16 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (389, 6, '2011-05-16 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (390, 1, '2011-05-16 00:00:00', 35, 84, -151, NULL);
INSERT INTO storage.base_operations VALUES (390, 0, '2011-05-16 00:00:00', 83, 84, 151, NULL);
INSERT INTO storage.base_operations VALUES (390, 3, '2011-05-16 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (390, 4, '2011-05-16 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (390, 5, '2011-05-16 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (390, 6, '2011-05-16 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (391, 1, '2011-05-16 00:00:00', 35, 85, -95, NULL);
INSERT INTO storage.base_operations VALUES (391, 0, '2011-05-16 00:00:00', 83, 85, 95, NULL);
INSERT INTO storage.base_operations VALUES (391, 3, '2011-05-16 00:00:00', 35, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (391, 4, '2011-05-16 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (391, 5, '2011-05-16 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (391, 6, '2011-05-16 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (392, 1, '2011-05-16 00:00:00', 35, 141, -66, NULL);
INSERT INTO storage.base_operations VALUES (392, 0, '2011-05-16 00:00:00', 83, 141, 66, NULL);
INSERT INTO storage.base_operations VALUES (392, 3, '2011-05-16 00:00:00', 35, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (392, 4, '2011-05-16 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (392, 5, '2011-05-16 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (392, 6, '2011-05-16 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (393, 1, '2011-05-16 00:00:00', 83, 84, -315, NULL);
INSERT INTO storage.base_operations VALUES (393, 0, '2011-05-16 00:00:00', 30, 84, 315, NULL);
INSERT INTO storage.base_operations VALUES (393, 3, '2011-05-16 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (393, 4, '2011-05-16 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (393, 5, '2011-05-16 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (393, 6, '2011-05-16 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (394, 1, '2011-05-16 00:00:00', 83, 85, -254, NULL);
INSERT INTO storage.base_operations VALUES (394, 0, '2011-05-16 00:00:00', 30, 85, 254, NULL);
INSERT INTO storage.base_operations VALUES (394, 3, '2011-05-16 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (394, 4, '2011-05-16 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (394, 5, '2011-05-16 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (394, 6, '2011-05-16 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (395, 1, '2011-05-16 00:00:00', 83, 141, -139, NULL);
INSERT INTO storage.base_operations VALUES (395, 0, '2011-05-16 00:00:00', 30, 141, 139, NULL);
INSERT INTO storage.base_operations VALUES (395, 3, '2011-05-16 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (395, 4, '2011-05-16 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (395, 5, '2011-05-16 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (395, 6, '2011-05-16 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (396, 1, '2011-05-16 00:00:00', 83, 84, -214, NULL);
INSERT INTO storage.base_operations VALUES (396, 0, '2011-05-16 00:00:00', 30, 84, 214, NULL);
INSERT INTO storage.base_operations VALUES (396, 3, '2011-05-16 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (396, 4, '2011-05-16 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (396, 5, '2011-05-16 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (396, 6, '2011-05-16 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (397, 1, '2011-05-16 00:00:00', 83, 141, -318, NULL);
INSERT INTO storage.base_operations VALUES (397, 0, '2011-05-16 00:00:00', 30, 141, 318, NULL);
INSERT INTO storage.base_operations VALUES (397, 3, '2011-05-16 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (397, 4, '2011-05-16 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (397, 5, '2011-05-16 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (397, 6, '2011-05-16 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (398, 1, '2011-05-16 00:00:00', 30, 84, -315, NULL);
INSERT INTO storage.base_operations VALUES (398, 0, '2011-05-16 00:00:00', 37, 84, 315, NULL);
INSERT INTO storage.base_operations VALUES (398, 3, '2011-05-16 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (398, 4, '2011-05-16 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (398, 5, '2011-05-16 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (398, 6, '2011-05-16 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (399, 1, '2011-05-16 00:00:00', 37, 84, -315, NULL);
INSERT INTO storage.base_operations VALUES (399, 0, '2011-05-16 00:00:00', 61, 84, 315, NULL);
INSERT INTO storage.base_operations VALUES (399, 3, '2011-05-16 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (399, 4, '2011-05-16 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (399, 5, '2011-05-16 00:00:00', 9, 84, 2, NULL);
INSERT INTO storage.base_operations VALUES (399, 6, '2011-05-16 00:00:00', 61, 84, -2, NULL);
INSERT INTO storage.base_operations VALUES (604, 6, '2011-06-06 00:00:00', 30, 174, -2, NULL);
INSERT INTO storage.base_operations VALUES (402, 1, '2011-05-16 00:00:00', 30, 85, -254, NULL);
INSERT INTO storage.base_operations VALUES (402, 0, '2011-05-16 00:00:00', 61, 85, 254, NULL);
INSERT INTO storage.base_operations VALUES (402, 3, '2011-05-16 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (402, 4, '2011-05-16 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (402, 5, '2011-05-16 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (402, 6, '2011-05-16 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (403, 1, '2011-05-16 00:00:00', 30, 84, -214, NULL);
INSERT INTO storage.base_operations VALUES (403, 0, '2011-05-16 00:00:00', 61, 84, 214, NULL);
INSERT INTO storage.base_operations VALUES (403, 3, '2011-05-16 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (403, 4, '2011-05-16 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (403, 5, '2011-05-16 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (403, 6, '2011-05-16 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (693, 6, '2011-06-09 00:00:00', 8, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (678, 1, '2011-06-20 00:00:00', 37, 174, -484, NULL);
INSERT INTO storage.base_operations VALUES (678, 0, '2011-06-20 00:00:00', 38, 174, 484, NULL);
INSERT INTO storage.base_operations VALUES (678, 3, '2011-06-20 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (678, 4, '2011-06-20 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (678, 5, '2011-06-20 00:00:00', 9, 174, 8, NULL);
INSERT INTO storage.base_operations VALUES (678, 6, '2011-06-20 00:00:00', 38, 174, -8, NULL);
INSERT INTO storage.base_operations VALUES (704, 1, '2011-05-18 00:00:00', 8, 85, -1000, NULL);
INSERT INTO storage.base_operations VALUES (451, 1, '2011-05-26 00:00:00', 83, 175, -169, NULL);
INSERT INTO storage.base_operations VALUES (404, 1, '2011-05-16 00:00:00', 61, 84, -313, NULL);
INSERT INTO storage.base_operations VALUES (404, 0, '2011-05-16 00:00:00', 38, 84, 313, NULL);
INSERT INTO storage.base_operations VALUES (404, 3, '2011-05-16 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (404, 4, '2011-05-16 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (404, 5, '2011-05-16 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (404, 6, '2011-05-16 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (405, 1, '2011-05-16 00:00:00', 61, 85, -254, NULL);
INSERT INTO storage.base_operations VALUES (405, 0, '2011-05-16 00:00:00', 38, 85, 254, NULL);
INSERT INTO storage.base_operations VALUES (405, 3, '2011-05-16 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (405, 4, '2011-05-16 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (405, 5, '2011-05-16 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (405, 6, '2011-05-16 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (406, 1, '2011-05-16 00:00:00', 83, 144, -846, NULL);
INSERT INTO storage.base_operations VALUES (406, 0, '2011-05-16 00:00:00', 33, 144, 846, NULL);
INSERT INTO storage.base_operations VALUES (406, 3, '2011-05-16 00:00:00', 83, 144, 0, NULL);
INSERT INTO storage.base_operations VALUES (406, 4, '2011-05-16 00:00:00', 33, 144, 0, NULL);
INSERT INTO storage.base_operations VALUES (406, 5, '2011-05-16 00:00:00', 9, 144, 0, NULL);
INSERT INTO storage.base_operations VALUES (406, 6, '2011-05-16 00:00:00', 33, 144, 0, NULL);
INSERT INTO storage.base_operations VALUES (407, 1, '2011-05-16 00:00:00', 83, 144, -941, NULL);
INSERT INTO storage.base_operations VALUES (407, 0, '2011-05-16 00:00:00', 33, 144, 941, NULL);
INSERT INTO storage.base_operations VALUES (407, 3, '2011-05-16 00:00:00', 83, 144, 0, NULL);
INSERT INTO storage.base_operations VALUES (407, 4, '2011-05-16 00:00:00', 33, 144, 0, NULL);
INSERT INTO storage.base_operations VALUES (407, 5, '2011-05-16 00:00:00', 9, 144, 0, NULL);
INSERT INTO storage.base_operations VALUES (407, 6, '2011-05-16 00:00:00', 33, 144, 0, NULL);
INSERT INTO storage.base_operations VALUES (408, 1, '2011-05-16 00:00:00', 83, 144, -888, NULL);
INSERT INTO storage.base_operations VALUES (408, 0, '2011-05-16 00:00:00', 33, 144, 888, NULL);
INSERT INTO storage.base_operations VALUES (408, 3, '2011-05-16 00:00:00', 83, 144, 0, NULL);
INSERT INTO storage.base_operations VALUES (408, 4, '2011-05-16 00:00:00', 33, 144, 0, NULL);
INSERT INTO storage.base_operations VALUES (408, 5, '2011-05-16 00:00:00', 9, 144, 0, NULL);
INSERT INTO storage.base_operations VALUES (408, 6, '2011-05-16 00:00:00', 33, 144, 0, NULL);
INSERT INTO storage.base_operations VALUES (409, 1, '2011-05-17 00:00:00', 83, 84, -151, NULL);
INSERT INTO storage.base_operations VALUES (409, 0, '2011-05-17 00:00:00', 30, 84, 151, NULL);
INSERT INTO storage.base_operations VALUES (409, 3, '2011-05-17 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (409, 4, '2011-05-17 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (409, 5, '2011-05-17 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (409, 6, '2011-05-17 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (410, 1, '2011-05-17 00:00:00', 83, 85, -242, NULL);
INSERT INTO storage.base_operations VALUES (410, 0, '2011-05-17 00:00:00', 30, 85, 242, NULL);
INSERT INTO storage.base_operations VALUES (410, 3, '2011-05-17 00:00:00', 83, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (410, 4, '2011-05-17 00:00:00', 30, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (410, 5, '2011-05-17 00:00:00', 9, 85, 2, NULL);
INSERT INTO storage.base_operations VALUES (410, 6, '2011-05-17 00:00:00', 30, 85, -2, NULL);
INSERT INTO storage.base_operations VALUES (411, 1, '2011-05-17 00:00:00', 83, 141, -66, NULL);
INSERT INTO storage.base_operations VALUES (411, 0, '2011-05-17 00:00:00', 30, 141, 66, NULL);
INSERT INTO storage.base_operations VALUES (411, 3, '2011-05-17 00:00:00', 83, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (411, 4, '2011-05-17 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (411, 5, '2011-05-17 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (411, 6, '2011-05-17 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (412, 1, '2011-05-17 00:00:00', 30, 84, -365, NULL);
INSERT INTO storage.base_operations VALUES (412, 0, '2011-05-17 00:00:00', 37, 84, 365, NULL);
INSERT INTO storage.base_operations VALUES (412, 3, '2011-05-17 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (412, 4, '2011-05-17 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (412, 5, '2011-05-17 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (412, 6, '2011-05-17 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (413, 1, '2011-05-17 00:00:00', 30, 140, -120, NULL);
INSERT INTO storage.base_operations VALUES (413, 0, '2011-05-17 00:00:00', 37, 140, 120, NULL);
INSERT INTO storage.base_operations VALUES (413, 3, '2011-05-17 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (413, 4, '2011-05-17 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (413, 5, '2011-05-17 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (413, 6, '2011-05-17 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (414, 1, '2011-05-17 00:00:00', 37, 84, -151, NULL);
INSERT INTO storage.base_operations VALUES (414, 0, '2011-05-17 00:00:00', 61, 84, 151, NULL);
INSERT INTO storage.base_operations VALUES (414, 3, '2011-05-17 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (414, 4, '2011-05-17 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (414, 5, '2011-05-17 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (414, 6, '2011-05-17 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (415, 1, '2011-05-17 00:00:00', 37, 85, -239, NULL);
INSERT INTO storage.base_operations VALUES (415, 0, '2011-05-17 00:00:00', 61, 85, 239, NULL);
INSERT INTO storage.base_operations VALUES (415, 3, '2011-05-17 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (415, 4, '2011-05-17 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (415, 5, '2011-05-17 00:00:00', 9, 85, 3, NULL);
INSERT INTO storage.base_operations VALUES (415, 6, '2011-05-17 00:00:00', 61, 85, -3, NULL);
INSERT INTO storage.base_operations VALUES (436, 1, '2011-05-21 00:00:00', 37, 141, -120, NULL);
INSERT INTO storage.base_operations VALUES (416, 1, '2011-05-17 00:00:00', 61, 84, -367, NULL);
INSERT INTO storage.base_operations VALUES (416, 0, '2011-05-17 00:00:00', 38, 84, 367, NULL);
INSERT INTO storage.base_operations VALUES (416, 3, '2011-05-17 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (416, 4, '2011-05-17 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (416, 5, '2011-05-17 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (416, 6, '2011-05-17 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (436, 0, '2011-05-21 00:00:00', 62, 141, 120, NULL);
INSERT INTO storage.base_operations VALUES (436, 3, '2011-05-21 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (436, 4, '2011-05-21 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (436, 5, '2011-05-21 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (436, 6, '2011-05-21 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (607, 1, '2011-06-06 00:00:00', 30, 175, -533, NULL);
INSERT INTO storage.base_operations VALUES (417, 1, '2011-05-17 00:00:00', 38, 84, -789, NULL);
INSERT INTO storage.base_operations VALUES (417, 0, '2011-05-17 00:00:00', 62, 84, 789, NULL);
INSERT INTO storage.base_operations VALUES (417, 3, '2011-05-17 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (417, 4, '2011-05-17 00:00:00', 62, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (417, 5, '2011-05-17 00:00:00', 9, 84, 2, NULL);
INSERT INTO storage.base_operations VALUES (417, 6, '2011-05-17 00:00:00', 62, 84, -2, NULL);
INSERT INTO storage.base_operations VALUES (607, 0, '2011-06-06 00:00:00', 61, 175, 533, NULL);
INSERT INTO storage.base_operations VALUES (1159, 100, '2011-07-08 00:00:00', 12, 84, -56, NULL);
INSERT INTO storage.base_operations VALUES (1159, 101, '2011-07-08 00:00:00', 12, 125, -56, NULL);
INSERT INTO storage.base_operations VALUES (1159, 102, '2011-07-08 00:00:00', 12, 126, -56, NULL);
INSERT INTO storage.base_operations VALUES (451, 0, '2011-05-26 00:00:00', 30, 175, 169, NULL);
INSERT INTO storage.base_operations VALUES (418, 1, '2011-05-17 00:00:00', 62, 84, -787, NULL);
INSERT INTO storage.base_operations VALUES (418, 0, '2011-05-17 00:00:00', 8, 84, 787, NULL);
INSERT INTO storage.base_operations VALUES (418, 3, '2011-05-17 00:00:00', 62, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (418, 4, '2011-05-17 00:00:00', 8, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (418, 5, '2011-05-17 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (418, 6, '2011-05-17 00:00:00', 8, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (419, 1, '2011-05-17 00:00:00', 61, 85, -493, NULL);
INSERT INTO storage.base_operations VALUES (419, 0, '2011-05-17 00:00:00', 37, 85, 493, NULL);
INSERT INTO storage.base_operations VALUES (419, 3, '2011-05-17 00:00:00', 61, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (419, 4, '2011-05-17 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (419, 5, '2011-05-17 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (419, 6, '2011-05-17 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (420, 1, '2011-05-17 00:00:00', 37, 85, -254, NULL);
INSERT INTO storage.base_operations VALUES (420, 0, '2011-05-17 00:00:00', 38, 85, 254, NULL);
INSERT INTO storage.base_operations VALUES (420, 3, '2011-05-17 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (420, 4, '2011-05-17 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (420, 5, '2011-05-17 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (420, 6, '2011-05-17 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (444, 1, '2011-06-01 00:00:00', 35, 174, -126, NULL);
INSERT INTO storage.base_operations VALUES (444, 0, '2011-06-01 00:00:00', 83, 174, 126, NULL);
INSERT INTO storage.base_operations VALUES (444, 3, '2011-06-01 00:00:00', 35, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (444, 4, '2011-06-01 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (421, 1, '2011-05-20 00:00:00', 30, 141, -50, NULL);
INSERT INTO storage.base_operations VALUES (421, 0, '2011-05-20 00:00:00', 37, 141, 50, NULL);
INSERT INTO storage.base_operations VALUES (421, 3, '2011-05-20 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (421, 4, '2011-05-20 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (421, 5, '2011-05-20 00:00:00', 9, 141, 1, NULL);
INSERT INTO storage.base_operations VALUES (421, 6, '2011-05-20 00:00:00', 37, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (422, 1, '2011-05-20 00:00:00', 30, 141, -90, NULL);
INSERT INTO storage.base_operations VALUES (422, 0, '2011-05-20 00:00:00', 37, 141, 90, NULL);
INSERT INTO storage.base_operations VALUES (422, 3, '2011-05-20 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (422, 4, '2011-05-20 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (422, 5, '2011-05-20 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (422, 6, '2011-05-20 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (423, 1, '2011-05-20 00:00:00', 37, 85, -498, NULL);
INSERT INTO storage.base_operations VALUES (423, 0, '2011-05-20 00:00:00', 38, 85, 498, NULL);
INSERT INTO storage.base_operations VALUES (423, 3, '2011-05-20 00:00:00', 37, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (423, 4, '2011-05-20 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (423, 5, '2011-05-20 00:00:00', 9, 85, 5, NULL);
INSERT INTO storage.base_operations VALUES (423, 6, '2011-05-20 00:00:00', 38, 85, -5, NULL);
INSERT INTO storage.base_operations VALUES (424, 1, '2011-05-20 00:00:00', 37, 140, -50, NULL);
INSERT INTO storage.base_operations VALUES (424, 0, '2011-05-20 00:00:00', 38, 140, 50, NULL);
INSERT INTO storage.base_operations VALUES (424, 3, '2011-05-20 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (424, 4, '2011-05-20 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (424, 5, '2011-05-20 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (424, 6, '2011-05-20 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (425, 1, '2011-05-20 00:00:00', 37, 141, -10, NULL);
INSERT INTO storage.base_operations VALUES (425, 0, '2011-05-20 00:00:00', 38, 141, 10, NULL);
INSERT INTO storage.base_operations VALUES (425, 3, '2011-05-20 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (425, 4, '2011-05-20 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (425, 5, '2011-05-20 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (425, 6, '2011-05-20 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (426, 1, '2011-05-20 00:00:00', 38, 85, -493, NULL);
INSERT INTO storage.base_operations VALUES (426, 0, '2011-05-20 00:00:00', 62, 85, 493, NULL);
INSERT INTO storage.base_operations VALUES (426, 3, '2011-05-20 00:00:00', 38, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (426, 4, '2011-05-20 00:00:00', 62, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (426, 5, '2011-05-20 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (426, 6, '2011-05-20 00:00:00', 62, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (427, 1, '2011-05-20 00:00:00', 38, 140, -50, NULL);
INSERT INTO storage.base_operations VALUES (427, 0, '2011-05-20 00:00:00', 62, 140, 50, NULL);
INSERT INTO storage.base_operations VALUES (427, 3, '2011-05-20 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (427, 4, '2011-05-20 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (427, 5, '2011-05-20 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (427, 6, '2011-05-20 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (428, 1, '2011-05-20 00:00:00', 38, 141, -10, NULL);
INSERT INTO storage.base_operations VALUES (428, 0, '2011-05-20 00:00:00', 62, 141, 10, NULL);
INSERT INTO storage.base_operations VALUES (428, 3, '2011-05-20 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (428, 4, '2011-05-20 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (428, 5, '2011-05-20 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (428, 6, '2011-05-20 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (1159, 103, '2011-07-08 00:00:00', 12, 121, -56, NULL);
INSERT INTO storage.base_operations VALUES (1159, 1, '2011-07-08 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1159, 0, '2011-07-08 00:00:00', 146, 280, 56, NULL);
INSERT INTO storage.base_operations VALUES (1064, 100, '2011-06-15 00:00:00', 12, 141, -6, NULL);
INSERT INTO storage.base_operations VALUES (1064, 101, '2011-06-15 00:00:00', 12, 330, -6, NULL);
INSERT INTO storage.base_operations VALUES (1064, 1, '2011-06-15 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (607, 3, '2011-06-06 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (429, 1, '2011-05-20 00:00:00', 62, 85, -493, NULL);
INSERT INTO storage.base_operations VALUES (429, 0, '2011-05-20 00:00:00', 8, 85, 493, NULL);
INSERT INTO storage.base_operations VALUES (429, 3, '2011-05-20 00:00:00', 62, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (429, 4, '2011-05-20 00:00:00', 8, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (429, 5, '2011-05-20 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (429, 6, '2011-05-20 00:00:00', 8, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (430, 1, '2011-05-20 00:00:00', 62, 140, -50, NULL);
INSERT INTO storage.base_operations VALUES (430, 0, '2011-05-20 00:00:00', 8, 140, 50, NULL);
INSERT INTO storage.base_operations VALUES (430, 3, '2011-05-20 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (430, 4, '2011-05-20 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (430, 5, '2011-05-20 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (430, 6, '2011-05-20 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (431, 1, '2011-05-20 00:00:00', 62, 141, -10, NULL);
INSERT INTO storage.base_operations VALUES (431, 0, '2011-05-20 00:00:00', 8, 141, 10, NULL);
INSERT INTO storage.base_operations VALUES (431, 3, '2011-05-20 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (431, 4, '2011-05-20 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (431, 5, '2011-05-20 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (431, 6, '2011-05-20 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (607, 4, '2011-06-06 00:00:00', 61, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (451, 3, '2011-05-26 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (451, 4, '2011-05-26 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (451, 5, '2011-05-26 00:00:00', 9, 175, 3, NULL);
INSERT INTO storage.base_operations VALUES (451, 6, '2011-05-26 00:00:00', 30, 175, -3, NULL);
INSERT INTO storage.base_operations VALUES (441, 1, '2011-05-22 00:00:00', 37, 141, -73, NULL);
INSERT INTO storage.base_operations VALUES (441, 0, '2011-05-22 00:00:00', 38, 141, 73, NULL);
INSERT INTO storage.base_operations VALUES (441, 3, '2011-05-22 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (441, 4, '2011-05-22 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (441, 5, '2011-05-22 00:00:00', 9, 141, 2, NULL);
INSERT INTO storage.base_operations VALUES (441, 6, '2011-05-22 00:00:00', 38, 141, -2, NULL);
INSERT INTO storage.base_operations VALUES (442, 1, '2011-05-22 00:00:00', 38, 141, -71, NULL);
INSERT INTO storage.base_operations VALUES (442, 0, '2011-05-22 00:00:00', 62, 141, 71, NULL);
INSERT INTO storage.base_operations VALUES (442, 3, '2011-05-22 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (442, 4, '2011-05-22 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (442, 5, '2011-05-22 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (442, 6, '2011-05-22 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (443, 1, '2011-05-22 00:00:00', 62, 141, -71, NULL);
INSERT INTO storage.base_operations VALUES (443, 0, '2011-05-22 00:00:00', 8, 141, 71, NULL);
INSERT INTO storage.base_operations VALUES (443, 3, '2011-05-22 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (443, 4, '2011-05-22 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (443, 5, '2011-05-22 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (443, 6, '2011-05-22 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (452, 1, '2011-05-26 00:00:00', 30, 174, -92, NULL);
INSERT INTO storage.base_operations VALUES (452, 0, '2011-05-26 00:00:00', 37, 174, 92, NULL);
INSERT INTO storage.base_operations VALUES (452, 3, '2011-05-26 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (452, 4, '2011-05-26 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (452, 5, '2011-05-26 00:00:00', 9, 174, 1, NULL);
INSERT INTO storage.base_operations VALUES (452, 6, '2011-05-26 00:00:00', 37, 174, -1, NULL);
INSERT INTO storage.base_operations VALUES (444, 5, '2011-06-01 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (444, 6, '2011-06-01 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (445, 1, '2011-06-01 00:00:00', 35, 175, -154, NULL);
INSERT INTO storage.base_operations VALUES (445, 0, '2011-06-01 00:00:00', 83, 175, 154, NULL);
INSERT INTO storage.base_operations VALUES (445, 3, '2011-06-01 00:00:00', 35, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (445, 4, '2011-06-01 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (445, 5, '2011-06-01 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (445, 6, '2011-06-01 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (453, 1, '2011-05-26 00:00:00', 30, 175, -166, NULL);
INSERT INTO storage.base_operations VALUES (453, 0, '2011-05-26 00:00:00', 37, 175, 166, NULL);
INSERT INTO storage.base_operations VALUES (529, 1, '2011-06-03 00:00:00', 37, 175, -420, NULL);
INSERT INTO storage.base_operations VALUES (529, 0, '2011-06-03 00:00:00', 38, 175, 420, NULL);
INSERT INTO storage.base_operations VALUES (529, 3, '2011-06-03 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (529, 4, '2011-06-03 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (529, 5, '2011-06-03 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (529, 6, '2011-06-03 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (1291, 4, '2011-08-01 00:00:00', 83, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (446, 1, '2011-06-01 00:00:00', 83, 174, -264, NULL);
INSERT INTO storage.base_operations VALUES (446, 0, '2011-06-01 00:00:00', 30, 174, 264, NULL);
INSERT INTO storage.base_operations VALUES (446, 3, '2011-06-01 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (446, 4, '2011-06-01 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (446, 5, '2011-06-01 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (446, 6, '2011-06-01 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (447, 1, '2011-06-01 00:00:00', 83, 175, -304, NULL);
INSERT INTO storage.base_operations VALUES (447, 0, '2011-06-01 00:00:00', 30, 175, 304, NULL);
INSERT INTO storage.base_operations VALUES (447, 3, '2011-06-01 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (447, 4, '2011-06-01 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (447, 5, '2011-06-01 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (447, 6, '2011-06-01 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (448, 1, '2011-05-26 00:00:00', 35, 174, -94, NULL);
INSERT INTO storage.base_operations VALUES (448, 0, '2011-05-26 00:00:00', 83, 174, 94, NULL);
INSERT INTO storage.base_operations VALUES (448, 3, '2011-05-26 00:00:00', 35, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (448, 4, '2011-05-26 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (448, 5, '2011-05-26 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (448, 6, '2011-05-26 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (449, 1, '2011-05-26 00:00:00', 35, 175, -169, NULL);
INSERT INTO storage.base_operations VALUES (449, 0, '2011-05-26 00:00:00', 83, 175, 169, NULL);
INSERT INTO storage.base_operations VALUES (449, 3, '2011-05-26 00:00:00', 35, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (449, 4, '2011-05-26 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (449, 5, '2011-05-26 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (449, 6, '2011-05-26 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (1159, 3, '2011-07-08 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1159, 4, '2011-07-08 00:00:00', 146, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1159, 5, '2011-07-08 00:00:00', 9, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1159, 6, '2011-07-08 00:00:00', 146, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (453, 3, '2011-05-26 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (453, 4, '2011-05-26 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (607, 5, '2011-06-06 00:00:00', 9, 175, 8, NULL);
INSERT INTO storage.base_operations VALUES (607, 6, '2011-06-06 00:00:00', 61, 175, -8, NULL);
INSERT INTO storage.base_operations VALUES (1289, 1, '2011-07-06 00:00:00', 38, 87, -356, NULL);
INSERT INTO storage.base_operations VALUES (1289, 0, '2011-07-06 00:00:00', 62, 87, 356, NULL);
INSERT INTO storage.base_operations VALUES (1289, 3, '2011-07-06 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1289, 4, '2011-07-06 00:00:00', 62, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1289, 5, '2011-07-06 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1289, 6, '2011-07-06 00:00:00', 62, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1290, 1, '2011-07-06 00:00:00', 62, 87, -356, NULL);
INSERT INTO storage.base_operations VALUES (1290, 0, '2011-07-06 00:00:00', 8, 87, 356, NULL);
INSERT INTO storage.base_operations VALUES (1290, 3, '2011-07-06 00:00:00', 62, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1290, 4, '2011-07-06 00:00:00', 8, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1290, 5, '2011-07-06 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1290, 6, '2011-07-06 00:00:00', 8, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (638, 1, '2011-06-10 00:00:00', 30, 175, -466, NULL);
INSERT INTO storage.base_operations VALUES (1064, 0, '2011-06-15 00:00:00', 373, 230, 6, NULL);
INSERT INTO storage.base_operations VALUES (638, 0, '2011-06-10 00:00:00', 61, 175, 466, NULL);
INSERT INTO storage.base_operations VALUES (638, 3, '2011-06-10 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (638, 4, '2011-06-10 00:00:00', 61, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (638, 5, '2011-06-10 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (638, 6, '2011-06-10 00:00:00', 61, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (456, 1, '2011-05-26 00:00:00', 38, 174, -91, NULL);
INSERT INTO storage.base_operations VALUES (456, 0, '2011-05-26 00:00:00', 62, 174, 91, NULL);
INSERT INTO storage.base_operations VALUES (1064, 3, '2011-06-15 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (947, 1, '2011-06-23 00:00:00', 38, 140, -140, NULL);
INSERT INTO storage.base_operations VALUES (947, 0, '2011-06-23 00:00:00', 62, 140, 140, NULL);
INSERT INTO storage.base_operations VALUES (454, 1, '2011-05-26 00:00:00', 37, 174, -91, NULL);
INSERT INTO storage.base_operations VALUES (454, 0, '2011-05-26 00:00:00', 38, 174, 91, NULL);
INSERT INTO storage.base_operations VALUES (454, 3, '2011-05-26 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (454, 4, '2011-05-26 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (454, 5, '2011-05-26 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (454, 6, '2011-05-26 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (455, 1, '2011-05-26 00:00:00', 37, 175, -165, NULL);
INSERT INTO storage.base_operations VALUES (455, 0, '2011-05-26 00:00:00', 38, 175, 165, NULL);
INSERT INTO storage.base_operations VALUES (455, 3, '2011-05-26 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (455, 4, '2011-05-26 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (455, 5, '2011-05-26 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (455, 6, '2011-05-26 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (947, 3, '2011-06-23 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (947, 4, '2011-06-23 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (947, 5, '2011-06-23 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (947, 6, '2011-06-23 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (805, 100, '2011-06-29 00:00:00', 12, 86, -2, NULL);
INSERT INTO storage.base_operations VALUES (805, 101, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (805, 102, '2011-06-29 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (805, 103, '2011-06-29 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (805, 1, '2011-06-29 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (805, 0, '2011-06-29 00:00:00', 356, 290, 2, NULL);
INSERT INTO storage.base_operations VALUES (805, 3, '2011-06-29 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (805, 4, '2011-06-29 00:00:00', 356, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (805, 5, '2011-06-29 00:00:00', 9, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (805, 6, '2011-06-29 00:00:00', 356, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1064, 4, '2011-06-15 00:00:00', 373, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1064, 5, '2011-06-15 00:00:00', 9, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1064, 6, '2011-06-15 00:00:00', 373, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (968, 1, '2011-06-28 00:00:00', 38, 140, -116, NULL);
INSERT INTO storage.base_operations VALUES (968, 0, '2011-06-28 00:00:00', 62, 140, 116, NULL);
INSERT INTO storage.base_operations VALUES (460, 1, '2011-05-28 00:00:00', 37, 141, -61, NULL);
INSERT INTO storage.base_operations VALUES (460, 0, '2011-05-28 00:00:00', 38, 141, 61, NULL);
INSERT INTO storage.base_operations VALUES (460, 3, '2011-05-28 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (460, 4, '2011-05-28 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (460, 5, '2011-05-28 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (460, 6, '2011-05-28 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (461, 1, '2011-05-28 00:00:00', 38, 141, -61, NULL);
INSERT INTO storage.base_operations VALUES (461, 0, '2011-05-28 00:00:00', 62, 141, 61, NULL);
INSERT INTO storage.base_operations VALUES (461, 3, '2011-05-28 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (461, 4, '2011-05-28 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (461, 5, '2011-05-28 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (461, 6, '2011-05-28 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (462, 1, '2011-05-28 00:00:00', 62, 141, -61, NULL);
INSERT INTO storage.base_operations VALUES (462, 0, '2011-05-28 00:00:00', 8, 141, 61, NULL);
INSERT INTO storage.base_operations VALUES (462, 3, '2011-05-28 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (462, 4, '2011-05-28 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (462, 5, '2011-05-28 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (462, 6, '2011-05-28 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (464, 1, '2011-05-29 00:00:00', 37, 141, -70, NULL);
INSERT INTO storage.base_operations VALUES (464, 0, '2011-05-29 00:00:00', 38, 141, 70, NULL);
INSERT INTO storage.base_operations VALUES (464, 3, '2011-05-29 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (464, 4, '2011-05-29 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (464, 5, '2011-05-29 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (464, 6, '2011-05-29 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (465, 1, '2011-05-29 00:00:00', 38, 141, -70, NULL);
INSERT INTO storage.base_operations VALUES (465, 0, '2011-05-29 00:00:00', 62, 141, 70, NULL);
INSERT INTO storage.base_operations VALUES (465, 3, '2011-05-29 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (465, 4, '2011-05-29 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (465, 5, '2011-05-29 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (465, 6, '2011-05-29 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (605, 1, '2011-06-06 00:00:00', 83, 175, -154, NULL);
INSERT INTO storage.base_operations VALUES (467, 1, '2011-05-29 00:00:00', 62, 141, -70, NULL);
INSERT INTO storage.base_operations VALUES (467, 0, '2011-05-29 00:00:00', 8, 141, 70, NULL);
INSERT INTO storage.base_operations VALUES (467, 3, '2011-05-29 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (467, 4, '2011-05-29 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (467, 5, '2011-05-29 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (467, 6, '2011-05-29 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (605, 0, '2011-06-06 00:00:00', 30, 175, 154, NULL);
INSERT INTO storage.base_operations VALUES (605, 3, '2011-06-06 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (605, 4, '2011-06-06 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (605, 5, '2011-06-06 00:00:00', 9, 175, 2, NULL);
INSERT INTO storage.base_operations VALUES (605, 6, '2011-06-06 00:00:00', 30, 175, -2, NULL);
INSERT INTO storage.base_operations VALUES (1160, 100, '2011-07-08 00:00:00', 12, 85, -56, NULL);
INSERT INTO storage.base_operations VALUES (1160, 101, '2011-07-08 00:00:00', 12, 125, -56, NULL);
INSERT INTO storage.base_operations VALUES (1160, 102, '2011-07-08 00:00:00', 12, 126, -56, NULL);
INSERT INTO storage.base_operations VALUES (640, 1, '2011-06-10 00:00:00', 61, 175, -466, NULL);
INSERT INTO storage.base_operations VALUES (640, 0, '2011-06-10 00:00:00', 62, 175, 466, NULL);
INSERT INTO storage.base_operations VALUES (640, 3, '2011-06-10 00:00:00', 61, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (640, 4, '2011-06-10 00:00:00', 62, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (640, 5, '2011-06-10 00:00:00', 9, 175, 28, NULL);
INSERT INTO storage.base_operations VALUES (469, 1, '2011-05-30 00:00:00', 37, 141, -65, NULL);
INSERT INTO storage.base_operations VALUES (469, 0, '2011-05-30 00:00:00', 38, 141, 65, NULL);
INSERT INTO storage.base_operations VALUES (469, 3, '2011-05-30 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (469, 4, '2011-05-30 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (469, 5, '2011-05-30 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (469, 6, '2011-05-30 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (470, 1, '2011-05-30 00:00:00', 38, 141, -65, NULL);
INSERT INTO storage.base_operations VALUES (470, 0, '2011-05-30 00:00:00', 62, 141, 65, NULL);
INSERT INTO storage.base_operations VALUES (470, 3, '2011-05-30 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (470, 4, '2011-05-30 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (470, 5, '2011-05-30 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (470, 6, '2011-05-30 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (472, 1, '2011-05-30 00:00:00', 62, 141, -65, NULL);
INSERT INTO storage.base_operations VALUES (472, 0, '2011-05-30 00:00:00', 8, 141, 65, NULL);
INSERT INTO storage.base_operations VALUES (472, 3, '2011-05-30 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (472, 4, '2011-05-30 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (472, 5, '2011-05-30 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (472, 6, '2011-05-30 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (473, 1, '2011-06-02 00:00:00', 35, 174, -144, NULL);
INSERT INTO storage.base_operations VALUES (473, 0, '2011-06-02 00:00:00', 83, 174, 144, NULL);
INSERT INTO storage.base_operations VALUES (473, 3, '2011-06-02 00:00:00', 35, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (473, 4, '2011-06-02 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (473, 5, '2011-06-02 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (473, 6, '2011-06-02 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (474, 1, '2011-06-02 00:00:00', 35, 175, -149, NULL);
INSERT INTO storage.base_operations VALUES (474, 0, '2011-06-02 00:00:00', 83, 175, 149, NULL);
INSERT INTO storage.base_operations VALUES (474, 3, '2011-06-02 00:00:00', 35, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (474, 4, '2011-06-02 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (474, 5, '2011-06-02 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (474, 6, '2011-06-02 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (475, 1, '2011-06-02 00:00:00', 83, 174, -144, NULL);
INSERT INTO storage.base_operations VALUES (475, 0, '2011-06-02 00:00:00', 30, 174, 144, NULL);
INSERT INTO storage.base_operations VALUES (475, 3, '2011-06-02 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (475, 4, '2011-06-02 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (475, 5, '2011-06-02 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (475, 6, '2011-06-02 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (476, 1, '2011-06-02 00:00:00', 83, 175, -149, NULL);
INSERT INTO storage.base_operations VALUES (476, 0, '2011-06-02 00:00:00', 30, 175, 149, NULL);
INSERT INTO storage.base_operations VALUES (476, 3, '2011-06-02 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (476, 4, '2011-06-02 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (476, 5, '2011-06-02 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (476, 6, '2011-06-02 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (478, 1, '2011-06-02 00:00:00', 30, 175, -130, NULL);
INSERT INTO storage.base_operations VALUES (478, 0, '2011-06-02 00:00:00', 37, 175, 130, NULL);
INSERT INTO storage.base_operations VALUES (478, 3, '2011-06-02 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (478, 4, '2011-06-02 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (478, 5, '2011-06-02 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (478, 6, '2011-06-02 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (480, 1, '2011-06-02 00:00:00', 37, 175, -130, NULL);
INSERT INTO storage.base_operations VALUES (480, 0, '2011-06-02 00:00:00', 38, 175, 130, NULL);
INSERT INTO storage.base_operations VALUES (480, 3, '2011-06-02 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (480, 4, '2011-06-02 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (480, 5, '2011-06-02 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (480, 6, '2011-06-02 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (481, 1, '2011-06-01 00:00:00', 30, 174, -264, NULL);
INSERT INTO storage.base_operations VALUES (481, 0, '2011-06-01 00:00:00', 37, 174, 264, NULL);
INSERT INTO storage.base_operations VALUES (481, 3, '2011-06-01 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (481, 4, '2011-06-01 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (481, 5, '2011-06-01 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (481, 6, '2011-06-01 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (482, 1, '2011-06-01 00:00:00', 30, 175, -20, NULL);
INSERT INTO storage.base_operations VALUES (482, 0, '2011-06-01 00:00:00', 37, 175, 20, NULL);
INSERT INTO storage.base_operations VALUES (482, 3, '2011-06-01 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (482, 4, '2011-06-01 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (482, 5, '2011-06-01 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (482, 6, '2011-06-01 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (483, 1, '2011-06-01 00:00:00', 37, 174, -264, NULL);
INSERT INTO storage.base_operations VALUES (483, 0, '2011-06-01 00:00:00', 38, 174, 264, NULL);
INSERT INTO storage.base_operations VALUES (483, 3, '2011-06-01 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (483, 4, '2011-06-01 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (483, 5, '2011-06-01 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (483, 6, '2011-06-01 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (520, 1, '2011-06-03 00:00:00', 35, 174, -165, NULL);
INSERT INTO storage.base_operations VALUES (520, 0, '2011-06-03 00:00:00', 83, 174, 165, NULL);
INSERT INTO storage.base_operations VALUES (520, 3, '2011-06-03 00:00:00', 35, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (520, 4, '2011-06-03 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (520, 5, '2011-06-03 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (520, 6, '2011-06-03 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (523, 1, '2011-06-03 00:00:00', 83, 174, -165, NULL);
INSERT INTO storage.base_operations VALUES (523, 0, '2011-06-03 00:00:00', 30, 174, 165, NULL);
INSERT INTO storage.base_operations VALUES (523, 3, '2011-06-03 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (485, 1, '2011-06-01 00:00:00', 38, 174, -264, NULL);
INSERT INTO storage.base_operations VALUES (485, 0, '2011-06-01 00:00:00', 62, 174, 264, NULL);
INSERT INTO storage.base_operations VALUES (485, 3, '2011-06-01 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (485, 4, '2011-06-01 00:00:00', 62, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (485, 5, '2011-06-01 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (485, 6, '2011-06-01 00:00:00', 62, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (612, 1, '2011-06-07 00:00:00', 30, 175, -323, NULL);
INSERT INTO storage.base_operations VALUES (612, 0, '2011-06-07 00:00:00', 61, 175, 323, NULL);
INSERT INTO storage.base_operations VALUES (612, 3, '2011-06-07 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (612, 4, '2011-06-07 00:00:00', 61, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (612, 5, '2011-06-07 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (612, 6, '2011-06-07 00:00:00', 61, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (523, 4, '2011-06-03 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (523, 5, '2011-06-03 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (523, 6, '2011-06-03 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (640, 6, '2011-06-10 00:00:00', 62, 175, -28, NULL);
INSERT INTO storage.base_operations VALUES (456, 3, '2011-05-26 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (456, 4, '2011-05-26 00:00:00', 62, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (456, 5, '2011-05-26 00:00:00', 9, 174, 6, NULL);
INSERT INTO storage.base_operations VALUES (456, 6, '2011-05-26 00:00:00', 62, 174, -6, NULL);
INSERT INTO storage.base_operations VALUES (704, 0, '2011-05-18 00:00:00', 353, 85, 1000, NULL);
INSERT INTO storage.base_operations VALUES (704, 3, '2011-05-18 00:00:00', 8, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (704, 4, '2011-05-18 00:00:00', 353, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (704, 5, '2011-05-18 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (704, 6, '2011-05-18 00:00:00', 353, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (715, 1, '2011-04-28 00:00:00', 147, 97, -330, NULL);
INSERT INTO storage.base_operations VALUES (715, 0, '2011-04-28 00:00:00', 12, 97, 330, NULL);
INSERT INTO storage.base_operations VALUES (715, 3, '2011-04-28 00:00:00', 147, 97, 0, NULL);
INSERT INTO storage.base_operations VALUES (715, 4, '2011-04-28 00:00:00', 12, 97, 0, NULL);
INSERT INTO storage.base_operations VALUES (715, 5, '2011-04-28 00:00:00', 9, 97, 0, NULL);
INSERT INTO storage.base_operations VALUES (715, 6, '2011-04-28 00:00:00', 12, 97, 0, NULL);
INSERT INTO storage.base_operations VALUES (719, 6, '2011-05-10 00:00:00', 12, 90, 0, NULL);
INSERT INTO storage.base_operations VALUES (727, 1, '2011-05-11 00:00:00', 8, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (727, 0, '2011-05-11 00:00:00', 147, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (727, 3, '2011-05-11 00:00:00', 8, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (727, 4, '2011-05-11 00:00:00', 147, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (727, 5, '2011-05-11 00:00:00', 9, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (489, 1, '2011-05-31 00:00:00', 35, 84, -12, NULL);
INSERT INTO storage.base_operations VALUES (489, 0, '2011-05-31 00:00:00', 83, 84, 12, NULL);
INSERT INTO storage.base_operations VALUES (489, 3, '2011-05-31 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (489, 4, '2011-05-31 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (489, 5, '2011-05-31 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (489, 6, '2011-05-31 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (490, 1, '2011-05-31 00:00:00', 35, 174, -89, NULL);
INSERT INTO storage.base_operations VALUES (490, 0, '2011-05-31 00:00:00', 83, 174, 89, NULL);
INSERT INTO storage.base_operations VALUES (490, 3, '2011-05-31 00:00:00', 35, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (490, 4, '2011-05-31 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (490, 5, '2011-05-31 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (490, 6, '2011-05-31 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (491, 1, '2011-05-31 00:00:00', 35, 175, -187, NULL);
INSERT INTO storage.base_operations VALUES (491, 0, '2011-05-31 00:00:00', 83, 175, 187, NULL);
INSERT INTO storage.base_operations VALUES (491, 3, '2011-05-31 00:00:00', 35, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (491, 4, '2011-05-31 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (491, 5, '2011-05-31 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (491, 6, '2011-05-31 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (492, 1, '2011-05-31 00:00:00', 83, 174, -89, NULL);
INSERT INTO storage.base_operations VALUES (492, 0, '2011-05-31 00:00:00', 30, 174, 89, NULL);
INSERT INTO storage.base_operations VALUES (492, 3, '2011-05-31 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (492, 4, '2011-05-31 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (492, 5, '2011-05-31 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (492, 6, '2011-05-31 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (493, 1, '2011-05-31 00:00:00', 83, 175, -187, NULL);
INSERT INTO storage.base_operations VALUES (493, 0, '2011-05-31 00:00:00', 30, 175, 187, NULL);
INSERT INTO storage.base_operations VALUES (493, 3, '2011-05-31 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (493, 4, '2011-05-31 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (493, 5, '2011-05-31 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (493, 6, '2011-05-31 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (496, 1, '2011-05-31 00:00:00', 30, 175, -187, NULL);
INSERT INTO storage.base_operations VALUES (496, 0, '2011-05-31 00:00:00', 37, 175, 187, NULL);
INSERT INTO storage.base_operations VALUES (496, 3, '2011-05-31 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (496, 4, '2011-05-31 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (496, 5, '2011-05-31 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (496, 6, '2011-05-31 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (498, 1, '2011-05-31 00:00:00', 37, 174, -89, NULL);
INSERT INTO storage.base_operations VALUES (498, 0, '2011-05-31 00:00:00', 38, 174, 89, NULL);
INSERT INTO storage.base_operations VALUES (498, 3, '2011-05-31 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (498, 4, '2011-05-31 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (498, 5, '2011-05-31 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (498, 6, '2011-05-31 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (499, 1, '2011-05-31 00:00:00', 37, 175, -187, NULL);
INSERT INTO storage.base_operations VALUES (499, 0, '2011-05-31 00:00:00', 38, 175, 187, NULL);
INSERT INTO storage.base_operations VALUES (499, 3, '2011-05-31 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (499, 4, '2011-05-31 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (499, 5, '2011-05-31 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (499, 6, '2011-05-31 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (521, 1, '2011-06-03 00:00:00', 35, 175, -192, NULL);
INSERT INTO storage.base_operations VALUES (521, 0, '2011-06-03 00:00:00', 83, 175, 192, NULL);
INSERT INTO storage.base_operations VALUES (521, 3, '2011-06-03 00:00:00', 35, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (521, 4, '2011-06-03 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (521, 5, '2011-06-03 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (521, 6, '2011-06-03 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (524, 1, '2011-06-03 00:00:00', 83, 175, -192, NULL);
INSERT INTO storage.base_operations VALUES (524, 0, '2011-06-03 00:00:00', 30, 175, 192, NULL);
INSERT INTO storage.base_operations VALUES (524, 3, '2011-06-03 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (524, 4, '2011-06-03 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (524, 5, '2011-06-03 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (524, 6, '2011-06-03 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (615, 1, '2011-06-07 00:00:00', 61, 174, -275, NULL);
INSERT INTO storage.base_operations VALUES (1291, 5, '2011-08-01 00:00:00', 9, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (528, 1, '2011-06-03 00:00:00', 30, 175, -420, NULL);
INSERT INTO storage.base_operations VALUES (528, 0, '2011-06-03 00:00:00', 37, 175, 420, NULL);
INSERT INTO storage.base_operations VALUES (528, 3, '2011-06-03 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (528, 4, '2011-06-03 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (528, 5, '2011-06-03 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (528, 6, '2011-06-03 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (503, 1, '2011-05-31 00:00:00', 37, 143, -60, NULL);
INSERT INTO storage.base_operations VALUES (503, 0, '2011-05-31 00:00:00', 38, 143, 60, NULL);
INSERT INTO storage.base_operations VALUES (503, 3, '2011-05-31 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (503, 4, '2011-05-31 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (503, 5, '2011-05-31 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (503, 6, '2011-05-31 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (615, 0, '2011-06-07 00:00:00', 37, 174, 275, NULL);
INSERT INTO storage.base_operations VALUES (615, 3, '2011-06-07 00:00:00', 61, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (615, 4, '2011-06-07 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (615, 5, '2011-06-07 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (615, 6, '2011-06-07 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (641, 1, '2011-06-10 00:00:00', 62, 175, -438, NULL);
INSERT INTO storage.base_operations VALUES (641, 0, '2011-06-10 00:00:00', 8, 175, 438, NULL);
INSERT INTO storage.base_operations VALUES (504, 1, '2011-05-31 00:00:00', 38, 143, -60, NULL);
INSERT INTO storage.base_operations VALUES (504, 0, '2011-05-31 00:00:00', 62, 143, 60, NULL);
INSERT INTO storage.base_operations VALUES (504, 3, '2011-05-31 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (504, 4, '2011-05-31 00:00:00', 62, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (504, 5, '2011-05-31 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (504, 6, '2011-05-31 00:00:00', 62, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (641, 3, '2011-06-10 00:00:00', 62, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (641, 4, '2011-06-10 00:00:00', 8, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (641, 5, '2011-06-10 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (641, 6, '2011-06-10 00:00:00', 8, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (698, 1, '2011-05-26 00:00:00', 62, 174, -85, NULL);
INSERT INTO storage.base_operations VALUES (698, 0, '2011-05-26 00:00:00', 8, 174, 85, NULL);
INSERT INTO storage.base_operations VALUES (506, 1, '2011-05-31 00:00:00', 62, 143, -60, NULL);
INSERT INTO storage.base_operations VALUES (506, 0, '2011-05-31 00:00:00', 8, 143, 60, NULL);
INSERT INTO storage.base_operations VALUES (506, 3, '2011-05-31 00:00:00', 62, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (506, 4, '2011-05-31 00:00:00', 8, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (506, 5, '2011-05-31 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (506, 6, '2011-05-31 00:00:00', 8, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (698, 3, '2011-05-26 00:00:00', 62, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (698, 4, '2011-05-26 00:00:00', 8, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (698, 5, '2011-05-26 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (698, 6, '2011-05-26 00:00:00', 8, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (705, 1, '2011-05-18 00:00:00', 8, 86, -1000, NULL);
INSERT INTO storage.base_operations VALUES (705, 0, '2011-05-18 00:00:00', 353, 86, 1000, NULL);
INSERT INTO storage.base_operations VALUES (507, 1, '2011-06-02 00:00:00', 35, 174, -138, NULL);
INSERT INTO storage.base_operations VALUES (507, 0, '2011-06-02 00:00:00', 83, 174, 138, NULL);
INSERT INTO storage.base_operations VALUES (507, 3, '2011-06-02 00:00:00', 35, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (507, 4, '2011-06-02 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (507, 5, '2011-06-02 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (507, 6, '2011-06-02 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (508, 1, '2011-06-02 00:00:00', 35, 175, -171, NULL);
INSERT INTO storage.base_operations VALUES (508, 0, '2011-06-02 00:00:00', 83, 175, 171, NULL);
INSERT INTO storage.base_operations VALUES (508, 3, '2011-06-02 00:00:00', 35, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (508, 4, '2011-06-02 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (508, 5, '2011-06-02 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (508, 6, '2011-06-02 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (705, 3, '2011-05-18 00:00:00', 8, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (705, 4, '2011-05-18 00:00:00', 353, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (705, 5, '2011-05-18 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (536, 1, '2011-06-03 00:00:00', 35, 174, -176, NULL);
INSERT INTO storage.base_operations VALUES (536, 0, '2011-06-03 00:00:00', 83, 174, 176, NULL);
INSERT INTO storage.base_operations VALUES (536, 3, '2011-06-03 00:00:00', 35, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (536, 4, '2011-06-03 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (536, 5, '2011-06-03 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (536, 6, '2011-06-03 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (705, 6, '2011-05-18 00:00:00', 353, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (538, 1, '2011-06-03 00:00:00', 83, 174, -176, NULL);
INSERT INTO storage.base_operations VALUES (538, 0, '2011-06-03 00:00:00', 30, 174, 176, NULL);
INSERT INTO storage.base_operations VALUES (538, 3, '2011-06-03 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (538, 4, '2011-06-03 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (538, 5, '2011-06-03 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (538, 6, '2011-06-03 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (716, 1, '2011-04-28 00:00:00', 147, 98, -318, NULL);
INSERT INTO storage.base_operations VALUES (716, 0, '2011-04-28 00:00:00', 12, 98, 318, NULL);
INSERT INTO storage.base_operations VALUES (716, 3, '2011-04-28 00:00:00', 147, 98, 0, NULL);
INSERT INTO storage.base_operations VALUES (716, 4, '2011-04-28 00:00:00', 12, 98, 0, NULL);
INSERT INTO storage.base_operations VALUES (716, 5, '2011-04-28 00:00:00', 9, 98, 0, NULL);
INSERT INTO storage.base_operations VALUES (716, 6, '2011-04-28 00:00:00', 12, 98, 0, NULL);
INSERT INTO storage.base_operations VALUES (720, 1, '2011-05-10 00:00:00', 147, 91, -234, NULL);
INSERT INTO storage.base_operations VALUES (720, 0, '2011-05-10 00:00:00', 12, 91, 234, NULL);
INSERT INTO storage.base_operations VALUES (720, 3, '2011-05-10 00:00:00', 147, 91, 0, NULL);
INSERT INTO storage.base_operations VALUES (720, 4, '2011-05-10 00:00:00', 12, 91, 0, NULL);
INSERT INTO storage.base_operations VALUES (720, 5, '2011-05-10 00:00:00', 9, 91, 0, NULL);
INSERT INTO storage.base_operations VALUES (1160, 103, '2011-07-08 00:00:00', 12, 121, -56, NULL);
INSERT INTO storage.base_operations VALUES (1160, 1, '2011-07-08 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1160, 0, '2011-07-08 00:00:00', 146, 285, 56, NULL);
INSERT INTO storage.base_operations VALUES (936, 1, '2011-06-21 00:00:00', 62, 140, -142, NULL);
INSERT INTO storage.base_operations VALUES (936, 0, '2011-06-21 00:00:00', 8, 140, 142, NULL);
INSERT INTO storage.base_operations VALUES (936, 3, '2011-06-21 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (509, 1, '2011-06-02 00:00:00', 83, 174, -138, NULL);
INSERT INTO storage.base_operations VALUES (509, 0, '2011-06-02 00:00:00', 30, 174, 138, NULL);
INSERT INTO storage.base_operations VALUES (509, 3, '2011-06-02 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (509, 4, '2011-06-02 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (509, 5, '2011-06-02 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (509, 6, '2011-06-02 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (510, 1, '2011-06-02 00:00:00', 83, 175, -171, NULL);
INSERT INTO storage.base_operations VALUES (510, 0, '2011-06-02 00:00:00', 30, 175, 171, NULL);
INSERT INTO storage.base_operations VALUES (510, 3, '2011-06-02 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (510, 4, '2011-06-02 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (510, 5, '2011-06-02 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (510, 6, '2011-06-02 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (643, 1, '2011-06-10 00:00:00', 37, 143, -42, NULL);
INSERT INTO storage.base_operations VALUES (643, 0, '2011-06-10 00:00:00', 38, 143, 42, NULL);
INSERT INTO storage.base_operations VALUES (643, 3, '2011-06-10 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (643, 4, '2011-06-10 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (643, 5, '2011-06-10 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (643, 6, '2011-06-10 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (495, 1, '2011-05-31 00:00:00', 30, 174, -89, NULL);
INSERT INTO storage.base_operations VALUES (495, 0, '2011-05-31 00:00:00', 61, 174, 89, NULL);
INSERT INTO storage.base_operations VALUES (495, 3, '2011-05-31 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (495, 4, '2011-05-31 00:00:00', 61, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (495, 5, '2011-05-31 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (495, 6, '2011-05-31 00:00:00', 61, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (706, 1, '2011-05-18 00:00:00', 8, 87, -1000, NULL);
INSERT INTO storage.base_operations VALUES (706, 0, '2011-05-18 00:00:00', 353, 87, 1000, NULL);
INSERT INTO storage.base_operations VALUES (706, 3, '2011-05-18 00:00:00', 8, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (706, 4, '2011-05-18 00:00:00', 353, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (706, 5, '2011-05-18 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (706, 6, '2011-05-18 00:00:00', 353, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (707, 1, '2011-04-28 00:00:00', 147, 88, -627, NULL);
INSERT INTO storage.base_operations VALUES (936, 4, '2011-06-21 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (936, 5, '2011-06-21 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (936, 6, '2011-06-21 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (948, 1, '2011-06-23 00:00:00', 62, 140, -140, NULL);
INSERT INTO storage.base_operations VALUES (948, 0, '2011-06-23 00:00:00', 8, 140, 140, NULL);
INSERT INTO storage.base_operations VALUES (707, 0, '2011-04-28 00:00:00', 12, 88, 627, NULL);
INSERT INTO storage.base_operations VALUES (707, 3, '2011-04-28 00:00:00', 147, 88, 0, NULL);
INSERT INTO storage.base_operations VALUES (707, 4, '2011-04-28 00:00:00', 12, 88, 0, NULL);
INSERT INTO storage.base_operations VALUES (707, 5, '2011-04-28 00:00:00', 9, 88, 0, NULL);
INSERT INTO storage.base_operations VALUES (707, 6, '2011-04-28 00:00:00', 12, 88, 0, NULL);
INSERT INTO storage.base_operations VALUES (948, 3, '2011-06-23 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (948, 4, '2011-06-23 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (635, 1, '2011-06-09 00:00:00', 37, 143, -43, NULL);
INSERT INTO storage.base_operations VALUES (635, 0, '2011-06-09 00:00:00', 38, 143, 43, NULL);
INSERT INTO storage.base_operations VALUES (635, 3, '2011-06-09 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (635, 4, '2011-06-09 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (635, 5, '2011-06-09 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (515, 1, '2011-06-02 00:00:00', 37, 175, -450, NULL);
INSERT INTO storage.base_operations VALUES (515, 0, '2011-06-02 00:00:00', 38, 175, 450, NULL);
INSERT INTO storage.base_operations VALUES (515, 3, '2011-06-02 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (515, 4, '2011-06-02 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (515, 5, '2011-06-02 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (515, 6, '2011-06-02 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (635, 6, '2011-06-09 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (948, 5, '2011-06-23 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (948, 6, '2011-06-23 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (807, 100, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (807, 101, '2011-06-29 00:00:00', 12, 334, -2, NULL);
INSERT INTO storage.base_operations VALUES (807, 102, '2011-06-29 00:00:00', 12, 335, -2, NULL);
INSERT INTO storage.base_operations VALUES (720, 6, '2011-05-10 00:00:00', 12, 91, 0, NULL);
INSERT INTO storage.base_operations VALUES (727, 6, '2011-05-11 00:00:00', 147, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (726, 1, '2011-05-11 00:00:00', 8, 140, -50, NULL);
INSERT INTO storage.base_operations VALUES (726, 0, '2011-05-11 00:00:00', 147, 140, 50, NULL);
INSERT INTO storage.base_operations VALUES (726, 3, '2011-05-11 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (726, 4, '2011-05-11 00:00:00', 147, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (726, 5, '2011-05-11 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (726, 6, '2011-05-11 00:00:00', 147, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (807, 103, '2011-06-29 00:00:00', 12, 228, -2, NULL);
INSERT INTO storage.base_operations VALUES (807, 1, '2011-06-29 00:00:00', 12, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (807, 0, '2011-06-29 00:00:00', 356, 333, 2, NULL);
INSERT INTO storage.base_operations VALUES (807, 3, '2011-06-29 00:00:00', 12, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (807, 4, '2011-06-29 00:00:00', 356, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (807, 5, '2011-06-29 00:00:00', 9, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (807, 6, '2011-06-29 00:00:00', 356, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (537, 1, '2011-06-03 00:00:00', 35, 175, -178, NULL);
INSERT INTO storage.base_operations VALUES (537, 0, '2011-06-03 00:00:00', 83, 175, 178, NULL);
INSERT INTO storage.base_operations VALUES (537, 3, '2011-06-03 00:00:00', 35, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (537, 4, '2011-06-03 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (537, 5, '2011-06-03 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (537, 6, '2011-06-03 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (539, 1, '2011-06-03 00:00:00', 83, 175, -178, NULL);
INSERT INTO storage.base_operations VALUES (539, 0, '2011-06-03 00:00:00', 30, 175, 178, NULL);
INSERT INTO storage.base_operations VALUES (539, 3, '2011-06-03 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (539, 4, '2011-06-03 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (539, 5, '2011-06-03 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (539, 6, '2011-06-03 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (546, 1, '2011-06-03 00:00:00', 37, 142, -61, NULL);
INSERT INTO storage.base_operations VALUES (546, 0, '2011-06-03 00:00:00', 38, 142, 61, NULL);
INSERT INTO storage.base_operations VALUES (546, 3, '2011-06-03 00:00:00', 37, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (546, 4, '2011-06-03 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (546, 5, '2011-06-03 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (546, 6, '2011-06-03 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (547, 1, '2011-06-03 00:00:00', 37, 143, -12, NULL);
INSERT INTO storage.base_operations VALUES (547, 0, '2011-06-03 00:00:00', 38, 143, 12, NULL);
INSERT INTO storage.base_operations VALUES (547, 3, '2011-06-03 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (547, 4, '2011-06-03 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (547, 5, '2011-06-03 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (547, 6, '2011-06-03 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (663, 1, '2011-06-18 00:00:00', 30, 174, -650, NULL);
INSERT INTO storage.base_operations VALUES (663, 0, '2011-06-18 00:00:00', 61, 174, 650, NULL);
INSERT INTO storage.base_operations VALUES (663, 3, '2011-06-18 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (663, 4, '2011-06-18 00:00:00', 61, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (663, 5, '2011-06-18 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (663, 6, '2011-06-18 00:00:00', 61, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (699, 1, '2011-05-31 00:00:00', 61, 174, -89, NULL);
INSERT INTO storage.base_operations VALUES (549, 1, '2011-06-03 00:00:00', 38, 142, -61, NULL);
INSERT INTO storage.base_operations VALUES (549, 0, '2011-06-03 00:00:00', 62, 142, 61, NULL);
INSERT INTO storage.base_operations VALUES (549, 3, '2011-06-03 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (549, 4, '2011-06-03 00:00:00', 62, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (549, 5, '2011-06-03 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (549, 6, '2011-06-03 00:00:00', 62, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (550, 1, '2011-06-03 00:00:00', 38, 143, -12, NULL);
INSERT INTO storage.base_operations VALUES (550, 0, '2011-06-03 00:00:00', 62, 143, 12, NULL);
INSERT INTO storage.base_operations VALUES (550, 3, '2011-06-03 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (550, 4, '2011-06-03 00:00:00', 62, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (550, 5, '2011-06-03 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (550, 6, '2011-06-03 00:00:00', 62, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (699, 0, '2011-05-31 00:00:00', 37, 174, 89, NULL);
INSERT INTO storage.base_operations VALUES (699, 3, '2011-05-31 00:00:00', 61, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (699, 4, '2011-05-31 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (699, 5, '2011-05-31 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (699, 6, '2011-05-31 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (708, 1, '2011-04-28 00:00:00', 147, 89, -1413, NULL);
INSERT INTO storage.base_operations VALUES (708, 0, '2011-04-28 00:00:00', 12, 89, 1413, NULL);
INSERT INTO storage.base_operations VALUES (708, 3, '2011-04-28 00:00:00', 147, 89, 0, NULL);
INSERT INTO storage.base_operations VALUES (708, 4, '2011-04-28 00:00:00', 12, 89, 0, NULL);
INSERT INTO storage.base_operations VALUES (708, 5, '2011-04-28 00:00:00', 9, 89, 0, NULL);
INSERT INTO storage.base_operations VALUES (708, 6, '2011-04-28 00:00:00', 12, 89, 0, NULL);
INSERT INTO storage.base_operations VALUES (551, 1, '2011-06-03 00:00:00', 62, 142, -61, NULL);
INSERT INTO storage.base_operations VALUES (551, 0, '2011-06-03 00:00:00', 8, 142, 61, NULL);
INSERT INTO storage.base_operations VALUES (551, 3, '2011-06-03 00:00:00', 62, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (551, 4, '2011-06-03 00:00:00', 8, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (551, 5, '2011-06-03 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (551, 6, '2011-06-03 00:00:00', 8, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (721, 1, '2011-05-10 00:00:00', 147, 330, -140, NULL);
INSERT INTO storage.base_operations VALUES (721, 0, '2011-05-10 00:00:00', 12, 330, 140, NULL);
INSERT INTO storage.base_operations VALUES (721, 3, '2011-05-10 00:00:00', 147, 330, 0, NULL);
INSERT INTO storage.base_operations VALUES (721, 4, '2011-05-10 00:00:00', 12, 330, 0, NULL);
INSERT INTO storage.base_operations VALUES (721, 5, '2011-05-10 00:00:00', 9, 330, 0, NULL);
INSERT INTO storage.base_operations VALUES (721, 6, '2011-05-10 00:00:00', 12, 330, 0, NULL);
INSERT INTO storage.base_operations VALUES (722, 1, '2011-05-11 00:00:00', 8, 84, -1200, NULL);
INSERT INTO storage.base_operations VALUES (554, 1, '2011-06-04 00:00:00', 35, 174, -147, NULL);
INSERT INTO storage.base_operations VALUES (554, 0, '2011-06-04 00:00:00', 83, 174, 147, NULL);
INSERT INTO storage.base_operations VALUES (554, 3, '2011-06-04 00:00:00', 35, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (554, 4, '2011-06-04 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (554, 5, '2011-06-04 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (554, 6, '2011-06-04 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (555, 1, '2011-06-04 00:00:00', 35, 175, -158, NULL);
INSERT INTO storage.base_operations VALUES (555, 0, '2011-06-04 00:00:00', 83, 175, 158, NULL);
INSERT INTO storage.base_operations VALUES (555, 3, '2011-06-04 00:00:00', 35, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (555, 4, '2011-06-04 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (555, 5, '2011-06-04 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (555, 6, '2011-06-04 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (722, 0, '2011-05-11 00:00:00', 147, 84, 1200, NULL);
INSERT INTO storage.base_operations VALUES (722, 3, '2011-05-11 00:00:00', 8, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (722, 4, '2011-05-11 00:00:00', 147, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (722, 5, '2011-05-11 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (646, 1, '2011-06-13 00:00:00', 30, 143, -150, NULL);
INSERT INTO storage.base_operations VALUES (646, 0, '2011-06-13 00:00:00', 37, 143, 150, NULL);
INSERT INTO storage.base_operations VALUES (646, 3, '2011-06-13 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (646, 4, '2011-06-13 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (646, 5, '2011-06-13 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (646, 6, '2011-06-13 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (649, 1, '2011-06-14 00:00:00', 37, 143, -50, NULL);
INSERT INTO storage.base_operations VALUES (649, 0, '2011-06-14 00:00:00', 38, 143, 50, NULL);
INSERT INTO storage.base_operations VALUES (649, 3, '2011-06-14 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (649, 4, '2011-06-14 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (649, 5, '2011-06-14 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (649, 6, '2011-06-14 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (652, 1, '2011-06-15 00:00:00', 37, 143, -60, NULL);
INSERT INTO storage.base_operations VALUES (652, 0, '2011-06-15 00:00:00', 38, 143, 60, NULL);
INSERT INTO storage.base_operations VALUES (652, 3, '2011-06-15 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (652, 4, '2011-06-15 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (652, 5, '2011-06-15 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (652, 6, '2011-06-15 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (653, 1, '2011-06-15 00:00:00', 30, 141, -180, NULL);
INSERT INTO storage.base_operations VALUES (653, 0, '2011-06-15 00:00:00', 37, 141, 180, NULL);
INSERT INTO storage.base_operations VALUES (653, 3, '2011-06-15 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (653, 4, '2011-06-15 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (653, 5, '2011-06-15 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (616, 1, '2011-06-07 00:00:00', 61, 175, -323, NULL);
INSERT INTO storage.base_operations VALUES (616, 0, '2011-06-07 00:00:00', 37, 175, 323, NULL);
INSERT INTO storage.base_operations VALUES (616, 3, '2011-06-07 00:00:00', 61, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (616, 4, '2011-06-07 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (616, 5, '2011-06-07 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (616, 6, '2011-06-07 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (664, 1, '2011-06-18 00:00:00', 37, 140, -100, NULL);
INSERT INTO storage.base_operations VALUES (664, 0, '2011-06-18 00:00:00', 38, 140, 100, NULL);
INSERT INTO storage.base_operations VALUES (664, 3, '2011-06-18 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (664, 4, '2011-06-18 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (664, 5, '2011-06-18 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (664, 6, '2011-06-18 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (501, 1, '2011-05-31 00:00:00', 38, 174, -89, NULL);
INSERT INTO storage.base_operations VALUES (556, 1, '2011-06-04 00:00:00', 83, 174, -147, NULL);
INSERT INTO storage.base_operations VALUES (556, 0, '2011-06-04 00:00:00', 30, 174, 147, NULL);
INSERT INTO storage.base_operations VALUES (556, 3, '2011-06-04 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (556, 4, '2011-06-04 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (556, 5, '2011-06-04 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (556, 6, '2011-06-04 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (557, 1, '2011-06-04 00:00:00', 83, 175, -158, NULL);
INSERT INTO storage.base_operations VALUES (557, 0, '2011-06-04 00:00:00', 30, 175, 158, NULL);
INSERT INTO storage.base_operations VALUES (557, 3, '2011-06-04 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (557, 4, '2011-06-04 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (557, 5, '2011-06-04 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (557, 6, '2011-06-04 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (501, 0, '2011-05-31 00:00:00', 62, 174, 89, NULL);
INSERT INTO storage.base_operations VALUES (501, 3, '2011-05-31 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (501, 4, '2011-05-31 00:00:00', 62, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (501, 5, '2011-05-31 00:00:00', 9, 174, 8, NULL);
INSERT INTO storage.base_operations VALUES (501, 6, '2011-05-31 00:00:00', 62, 174, -8, NULL);
INSERT INTO storage.base_operations VALUES (1160, 3, '2011-07-08 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1160, 4, '2011-07-08 00:00:00', 146, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1160, 5, '2011-07-08 00:00:00', 9, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1160, 6, '2011-07-08 00:00:00', 146, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1291, 6, '2011-08-01 00:00:00', 83, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (1293, 1, '2011-08-01 00:00:00', 83, 381, -92, NULL);
INSERT INTO storage.base_operations VALUES (709, 1, '2011-04-28 00:00:00', 147, 90, -1420, NULL);
INSERT INTO storage.base_operations VALUES (559, 1, '2011-06-04 00:00:00', 30, 174, -343, NULL);
INSERT INTO storage.base_operations VALUES (559, 0, '2011-06-04 00:00:00', 37, 174, 343, NULL);
INSERT INTO storage.base_operations VALUES (559, 3, '2011-06-04 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (559, 4, '2011-06-04 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (559, 5, '2011-06-04 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (559, 6, '2011-06-04 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (560, 1, '2011-06-04 00:00:00', 30, 175, -77, NULL);
INSERT INTO storage.base_operations VALUES (560, 0, '2011-06-04 00:00:00', 37, 175, 77, NULL);
INSERT INTO storage.base_operations VALUES (560, 3, '2011-06-04 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (560, 4, '2011-06-04 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (560, 5, '2011-06-04 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (560, 6, '2011-06-04 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (709, 0, '2011-04-28 00:00:00', 12, 90, 1420, NULL);
INSERT INTO storage.base_operations VALUES (709, 3, '2011-04-28 00:00:00', 147, 90, 0, NULL);
INSERT INTO storage.base_operations VALUES (561, 1, '2011-06-04 00:00:00', 37, 174, -343, NULL);
INSERT INTO storage.base_operations VALUES (561, 0, '2011-06-04 00:00:00', 38, 174, 343, NULL);
INSERT INTO storage.base_operations VALUES (561, 3, '2011-06-04 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (561, 4, '2011-06-04 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (561, 5, '2011-06-04 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (561, 6, '2011-06-04 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (562, 1, '2011-06-04 00:00:00', 37, 175, -77, NULL);
INSERT INTO storage.base_operations VALUES (562, 0, '2011-06-04 00:00:00', 38, 175, 77, NULL);
INSERT INTO storage.base_operations VALUES (562, 3, '2011-06-04 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (562, 4, '2011-06-04 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (562, 5, '2011-06-04 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (562, 6, '2011-06-04 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (564, 1, '2011-06-04 00:00:00', 37, 142, -10, NULL);
INSERT INTO storage.base_operations VALUES (564, 0, '2011-06-04 00:00:00', 38, 142, 10, NULL);
INSERT INTO storage.base_operations VALUES (564, 3, '2011-06-04 00:00:00', 37, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (564, 4, '2011-06-04 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (564, 5, '2011-06-04 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (564, 6, '2011-06-04 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (568, 1, '2011-06-04 00:00:00', 35, 174, -191, NULL);
INSERT INTO storage.base_operations VALUES (568, 0, '2011-06-04 00:00:00', 83, 174, 191, NULL);
INSERT INTO storage.base_operations VALUES (568, 3, '2011-06-04 00:00:00', 35, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (568, 4, '2011-06-04 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (568, 5, '2011-06-04 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (568, 6, '2011-06-04 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (569, 1, '2011-06-04 00:00:00', 35, 175, -188, NULL);
INSERT INTO storage.base_operations VALUES (569, 0, '2011-06-04 00:00:00', 83, 175, 188, NULL);
INSERT INTO storage.base_operations VALUES (569, 3, '2011-06-04 00:00:00', 35, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (569, 4, '2011-06-04 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (569, 5, '2011-06-04 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (569, 6, '2011-06-04 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (570, 1, '2011-06-04 00:00:00', 83, 174, -190, NULL);
INSERT INTO storage.base_operations VALUES (570, 0, '2011-06-04 00:00:00', 30, 174, 190, NULL);
INSERT INTO storage.base_operations VALUES (570, 3, '2011-06-04 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (570, 4, '2011-06-04 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (570, 5, '2011-06-04 00:00:00', 9, 174, 1, NULL);
INSERT INTO storage.base_operations VALUES (570, 6, '2011-06-04 00:00:00', 30, 174, -1, NULL);
INSERT INTO storage.base_operations VALUES (571, 1, '2011-06-04 00:00:00', 83, 175, -187, NULL);
INSERT INTO storage.base_operations VALUES (571, 0, '2011-06-04 00:00:00', 30, 175, 187, NULL);
INSERT INTO storage.base_operations VALUES (571, 3, '2011-06-04 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (571, 4, '2011-06-04 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (571, 5, '2011-06-04 00:00:00', 9, 175, 1, NULL);
INSERT INTO storage.base_operations VALUES (571, 6, '2011-06-04 00:00:00', 30, 175, -1, NULL);
INSERT INTO storage.base_operations VALUES (619, 1, '2011-06-07 00:00:00', 37, 142, -50, NULL);
INSERT INTO storage.base_operations VALUES (619, 0, '2011-06-07 00:00:00', 38, 142, 50, NULL);
INSERT INTO storage.base_operations VALUES (619, 3, '2011-06-07 00:00:00', 37, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (619, 4, '2011-06-07 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (619, 5, '2011-06-07 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (619, 6, '2011-06-07 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (1161, 100, '2011-07-08 00:00:00', 12, 86, -56, NULL);
INSERT INTO storage.base_operations VALUES (572, 1, '2011-06-04 00:00:00', 30, 175, -400, NULL);
INSERT INTO storage.base_operations VALUES (572, 0, '2011-06-04 00:00:00', 37, 175, 400, NULL);
INSERT INTO storage.base_operations VALUES (572, 3, '2011-06-04 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (572, 4, '2011-06-04 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (572, 5, '2011-06-04 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (572, 6, '2011-06-04 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (1161, 101, '2011-07-08 00:00:00', 12, 125, -56, NULL);
INSERT INTO storage.base_operations VALUES (1161, 102, '2011-07-08 00:00:00', 12, 121, -56, NULL);
INSERT INTO storage.base_operations VALUES (1161, 103, '2011-07-08 00:00:00', 12, 126, -56, NULL);
INSERT INTO storage.base_operations VALUES (1161, 1, '2011-07-08 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1161, 0, '2011-07-08 00:00:00', 146, 290, 56, NULL);
INSERT INTO storage.base_operations VALUES (1161, 3, '2011-07-08 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (574, 1, '2011-06-04 00:00:00', 37, 175, -400, NULL);
INSERT INTO storage.base_operations VALUES (574, 0, '2011-06-04 00:00:00', 38, 175, 400, NULL);
INSERT INTO storage.base_operations VALUES (574, 3, '2011-06-04 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (574, 4, '2011-06-04 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (574, 5, '2011-06-04 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (574, 6, '2011-06-04 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (1161, 4, '2011-07-08 00:00:00', 146, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1161, 5, '2011-07-08 00:00:00', 9, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1161, 6, '2011-07-08 00:00:00', 146, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1293, 0, '2011-08-01 00:00:00', 30, 381, 92, NULL);
INSERT INTO storage.base_operations VALUES (1293, 3, '2011-08-01 00:00:00', 83, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (692, 1, '2011-06-07 00:00:00', 37, 175, -323, NULL);
INSERT INTO storage.base_operations VALUES (575, 1, '2011-06-04 00:00:00', 38, 175, -400, NULL);
INSERT INTO storage.base_operations VALUES (575, 0, '2011-06-04 00:00:00', 62, 175, 400, NULL);
INSERT INTO storage.base_operations VALUES (575, 3, '2011-06-04 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (575, 4, '2011-06-04 00:00:00', 62, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (575, 5, '2011-06-04 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (575, 6, '2011-06-04 00:00:00', 62, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (692, 0, '2011-06-07 00:00:00', 38, 175, 323, NULL);
INSERT INTO storage.base_operations VALUES (692, 3, '2011-06-07 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (692, 4, '2011-06-07 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (692, 5, '2011-06-07 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (692, 6, '2011-06-07 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (666, 1, '2011-06-18 00:00:00', 37, 140, -42, NULL);
INSERT INTO storage.base_operations VALUES (666, 0, '2011-06-18 00:00:00', 38, 140, 42, NULL);
INSERT INTO storage.base_operations VALUES (666, 3, '2011-06-18 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (666, 4, '2011-06-18 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (666, 5, '2011-06-18 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (666, 6, '2011-06-18 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (700, 1, '2011-05-31 00:00:00', 62, 174, -81, NULL);
INSERT INTO storage.base_operations VALUES (700, 0, '2011-05-31 00:00:00', 8, 174, 81, NULL);
INSERT INTO storage.base_operations VALUES (700, 3, '2011-05-31 00:00:00', 62, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (700, 4, '2011-05-31 00:00:00', 8, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (700, 5, '2011-05-31 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (700, 6, '2011-05-31 00:00:00', 8, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (709, 4, '2011-04-28 00:00:00', 12, 90, 0, NULL);
INSERT INTO storage.base_operations VALUES (709, 5, '2011-04-28 00:00:00', 9, 90, 0, NULL);
INSERT INTO storage.base_operations VALUES (709, 6, '2011-04-28 00:00:00', 12, 90, 0, NULL);
INSERT INTO storage.base_operations VALUES (579, 1, '2011-06-04 00:00:00', 37, 142, -58, NULL);
INSERT INTO storage.base_operations VALUES (579, 0, '2011-06-04 00:00:00', 38, 142, 58, NULL);
INSERT INTO storage.base_operations VALUES (579, 3, '2011-06-04 00:00:00', 37, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (579, 4, '2011-06-04 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (579, 5, '2011-06-04 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (579, 6, '2011-06-04 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (722, 6, '2011-05-11 00:00:00', 147, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (728, 1, '2011-05-10 00:00:00', 147, 120, -140, NULL);
INSERT INTO storage.base_operations VALUES (728, 0, '2011-05-10 00:00:00', 12, 120, 140, NULL);
INSERT INTO storage.base_operations VALUES (728, 3, '2011-05-10 00:00:00', 147, 120, 0, NULL);
INSERT INTO storage.base_operations VALUES (728, 4, '2011-05-10 00:00:00', 12, 120, 0, NULL);
INSERT INTO storage.base_operations VALUES (581, 1, '2011-06-04 00:00:00', 38, 142, -58, NULL);
INSERT INTO storage.base_operations VALUES (581, 0, '2011-06-04 00:00:00', 62, 142, 58, NULL);
INSERT INTO storage.base_operations VALUES (581, 3, '2011-06-04 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (581, 4, '2011-06-04 00:00:00', 62, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (581, 5, '2011-06-04 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (581, 6, '2011-06-04 00:00:00', 62, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (728, 5, '2011-05-10 00:00:00', 9, 120, 0, NULL);
INSERT INTO storage.base_operations VALUES (728, 6, '2011-05-10 00:00:00', 12, 120, 0, NULL);
INSERT INTO storage.base_operations VALUES (582, 1, '2011-06-04 00:00:00', 62, 142, -58, NULL);
INSERT INTO storage.base_operations VALUES (582, 0, '2011-06-04 00:00:00', 8, 142, 58, NULL);
INSERT INTO storage.base_operations VALUES (582, 3, '2011-06-04 00:00:00', 62, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (582, 4, '2011-06-04 00:00:00', 8, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (582, 5, '2011-06-04 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (582, 6, '2011-06-04 00:00:00', 8, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (583, 1, '2011-06-05 00:00:00', 35, 174, -386, NULL);
INSERT INTO storage.base_operations VALUES (583, 0, '2011-06-05 00:00:00', 83, 174, 386, NULL);
INSERT INTO storage.base_operations VALUES (583, 3, '2011-06-05 00:00:00', 35, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (583, 4, '2011-06-05 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (583, 5, '2011-06-05 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (583, 6, '2011-06-05 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (584, 1, '2011-06-05 00:00:00', 35, 175, -329, NULL);
INSERT INTO storage.base_operations VALUES (584, 0, '2011-06-05 00:00:00', 83, 175, 329, NULL);
INSERT INTO storage.base_operations VALUES (584, 3, '2011-06-05 00:00:00', 35, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (584, 4, '2011-06-05 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (584, 5, '2011-06-05 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (584, 6, '2011-06-05 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (620, 1, '2011-06-07 00:00:00', 37, 143, -15, NULL);
INSERT INTO storage.base_operations VALUES (620, 0, '2011-06-07 00:00:00', 38, 143, 15, NULL);
INSERT INTO storage.base_operations VALUES (620, 3, '2011-06-07 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (620, 4, '2011-06-07 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (620, 5, '2011-06-07 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (620, 6, '2011-06-07 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (629, 1, '2011-06-08 00:00:00', 61, 174, -516, NULL);
INSERT INTO storage.base_operations VALUES (629, 0, '2011-06-08 00:00:00', 37, 174, 516, NULL);
INSERT INTO storage.base_operations VALUES (629, 3, '2011-06-08 00:00:00', 61, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (629, 4, '2011-06-08 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (586, 1, '2011-06-05 00:00:00', 83, 174, -386, NULL);
INSERT INTO storage.base_operations VALUES (586, 0, '2011-06-05 00:00:00', 30, 174, 386, NULL);
INSERT INTO storage.base_operations VALUES (586, 3, '2011-06-05 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (586, 4, '2011-06-05 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (586, 5, '2011-06-05 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (586, 6, '2011-06-05 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (587, 1, '2011-06-05 00:00:00', 83, 175, -329, NULL);
INSERT INTO storage.base_operations VALUES (587, 0, '2011-06-05 00:00:00', 30, 175, 329, NULL);
INSERT INTO storage.base_operations VALUES (587, 3, '2011-06-05 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (587, 4, '2011-06-05 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (587, 5, '2011-06-05 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (587, 6, '2011-06-05 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (629, 5, '2011-06-08 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (629, 6, '2011-06-08 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (694, 1, '2011-06-18 00:00:00', 61, 174, -650, NULL);
INSERT INTO storage.base_operations VALUES (694, 0, '2011-06-18 00:00:00', 62, 174, 650, NULL);
INSERT INTO storage.base_operations VALUES (694, 3, '2011-06-18 00:00:00', 61, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (694, 4, '2011-06-18 00:00:00', 62, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (694, 5, '2011-06-18 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (694, 6, '2011-06-18 00:00:00', 62, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (701, 1, '2011-06-01 00:00:00', 35, 174, -138, NULL);
INSERT INTO storage.base_operations VALUES (701, 0, '2011-06-01 00:00:00', 83, 174, 138, NULL);
INSERT INTO storage.base_operations VALUES (701, 3, '2011-06-01 00:00:00', 35, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (701, 4, '2011-06-01 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (701, 5, '2011-06-01 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (701, 6, '2011-06-01 00:00:00', 83, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (1162, 100, '2011-07-08 00:00:00', 12, 87, -40, NULL);
INSERT INTO storage.base_operations VALUES (1162, 101, '2011-07-08 00:00:00', 12, 125, -40, NULL);
INSERT INTO storage.base_operations VALUES (1162, 102, '2011-07-08 00:00:00', 12, 121, -40, NULL);
INSERT INTO storage.base_operations VALUES (1162, 103, '2011-07-08 00:00:00', 12, 126, -40, NULL);
INSERT INTO storage.base_operations VALUES (1162, 1, '2011-07-08 00:00:00', 12, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (1162, 0, '2011-07-08 00:00:00', 146, 295, 40, NULL);
INSERT INTO storage.base_operations VALUES (710, 1, '2011-04-28 00:00:00', 147, 91, -682, NULL);
INSERT INTO storage.base_operations VALUES (710, 0, '2011-04-28 00:00:00', 12, 91, 682, NULL);
INSERT INTO storage.base_operations VALUES (710, 3, '2011-04-28 00:00:00', 147, 91, 0, NULL);
INSERT INTO storage.base_operations VALUES (710, 4, '2011-04-28 00:00:00', 12, 91, 0, NULL);
INSERT INTO storage.base_operations VALUES (710, 5, '2011-04-28 00:00:00', 9, 91, 0, NULL);
INSERT INTO storage.base_operations VALUES (710, 6, '2011-04-28 00:00:00', 12, 91, 0, NULL);
INSERT INTO storage.base_operations VALUES (1162, 3, '2011-07-08 00:00:00', 12, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (1162, 4, '2011-07-08 00:00:00', 146, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (1162, 5, '2011-07-08 00:00:00', 9, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (1162, 6, '2011-07-08 00:00:00', 146, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (1183, 100, '2011-05-20 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (1183, 101, '2011-05-20 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1183, 102, '2011-05-20 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1065, 100, '2011-06-15 00:00:00', 12, 141, -6, NULL);
INSERT INTO storage.base_operations VALUES (1065, 101, '2011-06-15 00:00:00', 12, 114, -6, NULL);
INSERT INTO storage.base_operations VALUES (1065, 1, '2011-06-15 00:00:00', 12, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1065, 0, '2011-06-15 00:00:00', 373, 233, 6, NULL);
INSERT INTO storage.base_operations VALUES (1065, 3, '2011-06-15 00:00:00', 12, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (723, 1, '2011-05-11 00:00:00', 8, 85, -500, NULL);
INSERT INTO storage.base_operations VALUES (723, 0, '2011-05-11 00:00:00', 147, 85, 500, NULL);
INSERT INTO storage.base_operations VALUES (723, 3, '2011-05-11 00:00:00', 8, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (723, 4, '2011-05-11 00:00:00', 147, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (723, 5, '2011-05-11 00:00:00', 9, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (723, 6, '2011-05-11 00:00:00', 147, 85, 0, NULL);
INSERT INTO storage.base_operations VALUES (1065, 4, '2011-06-15 00:00:00', 373, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (804, 100, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (804, 101, '2011-06-29 00:00:00', 12, 334, -2, NULL);
INSERT INTO storage.base_operations VALUES (804, 102, '2011-06-29 00:00:00', 12, 335, -2, NULL);
INSERT INTO storage.base_operations VALUES (804, 103, '2011-06-29 00:00:00', 12, 351, -2, NULL);
INSERT INTO storage.base_operations VALUES (804, 1, '2011-06-29 00:00:00', 12, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (804, 0, '2011-06-29 00:00:00', 356, 347, 2, NULL);
INSERT INTO storage.base_operations VALUES (804, 3, '2011-06-29 00:00:00', 12, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (804, 4, '2011-06-29 00:00:00', 356, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (592, 1, '2011-06-05 00:00:00', 37, 142, -54, NULL);
INSERT INTO storage.base_operations VALUES (592, 0, '2011-06-05 00:00:00', 38, 142, 54, NULL);
INSERT INTO storage.base_operations VALUES (592, 3, '2011-06-05 00:00:00', 37, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (592, 4, '2011-06-05 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (592, 5, '2011-06-05 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (592, 6, '2011-06-05 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (598, 1, '2011-06-05 00:00:00', 38, 142, -54, NULL);
INSERT INTO storage.base_operations VALUES (598, 0, '2011-06-05 00:00:00', 62, 142, 54, NULL);
INSERT INTO storage.base_operations VALUES (598, 3, '2011-06-05 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (598, 4, '2011-06-05 00:00:00', 62, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (598, 5, '2011-06-05 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (598, 6, '2011-06-05 00:00:00', 62, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (599, 1, '2011-06-05 00:00:00', 62, 142, -54, NULL);
INSERT INTO storage.base_operations VALUES (599, 0, '2011-06-05 00:00:00', 8, 142, 54, NULL);
INSERT INTO storage.base_operations VALUES (599, 3, '2011-06-05 00:00:00', 62, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (599, 4, '2011-06-05 00:00:00', 8, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (599, 5, '2011-06-05 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (599, 6, '2011-06-05 00:00:00', 8, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (623, 1, '2011-06-08 00:00:00', 30, 175, -590, NULL);
INSERT INTO storage.base_operations VALUES (623, 0, '2011-06-08 00:00:00', 61, 175, 590, NULL);
INSERT INTO storage.base_operations VALUES (623, 3, '2011-06-08 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (623, 4, '2011-06-08 00:00:00', 61, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (623, 5, '2011-06-08 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (623, 6, '2011-06-08 00:00:00', 61, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (695, 1, '2011-06-18 00:00:00', 62, 174, -650, NULL);
INSERT INTO storage.base_operations VALUES (1065, 5, '2011-06-15 00:00:00', 9, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1065, 6, '2011-06-15 00:00:00', 373, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1084, 100, '2011-06-15 00:00:00', 12, 141, -15, NULL);
INSERT INTO storage.base_operations VALUES (1084, 101, '2011-06-15 00:00:00', 12, 143, -15, NULL);
INSERT INTO storage.base_operations VALUES (1084, 1, '2011-06-15 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1163, 100, '2011-07-08 00:00:00', 12, 140, -26, NULL);
INSERT INTO storage.base_operations VALUES (1163, 101, '2011-07-08 00:00:00', 12, 142, -26, NULL);
INSERT INTO storage.base_operations VALUES (1163, 1, '2011-07-08 00:00:00', 12, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (1163, 0, '2011-07-08 00:00:00', 146, 318, 26, NULL);
INSERT INTO storage.base_operations VALUES (1163, 3, '2011-07-08 00:00:00', 12, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (1163, 4, '2011-07-08 00:00:00', 146, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (1163, 5, '2011-07-08 00:00:00', 9, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (1163, 6, '2011-07-08 00:00:00', 146, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (1183, 103, '2011-05-20 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1183, 104, '2011-05-20 00:00:00', 12, 90, -1, NULL);
INSERT INTO storage.base_operations VALUES (1183, 1, '2011-05-20 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (695, 0, '2011-06-18 00:00:00', 8, 174, 650, NULL);
INSERT INTO storage.base_operations VALUES (695, 3, '2011-06-18 00:00:00', 62, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (695, 4, '2011-06-18 00:00:00', 8, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (695, 5, '2011-06-18 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (695, 6, '2011-06-18 00:00:00', 8, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (702, 1, '2011-06-01 00:00:00', 35, 175, -150, NULL);
INSERT INTO storage.base_operations VALUES (702, 0, '2011-06-01 00:00:00', 83, 175, 150, NULL);
INSERT INTO storage.base_operations VALUES (702, 3, '2011-06-01 00:00:00', 35, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (702, 4, '2011-06-01 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (702, 5, '2011-06-01 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (702, 6, '2011-06-01 00:00:00', 83, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (610, 1, '2011-06-06 00:00:00', 37, 142, -25, NULL);
INSERT INTO storage.base_operations VALUES (610, 0, '2011-06-06 00:00:00', 38, 142, 25, NULL);
INSERT INTO storage.base_operations VALUES (610, 3, '2011-06-06 00:00:00', 37, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (610, 4, '2011-06-06 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (610, 5, '2011-06-06 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (610, 6, '2011-06-06 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (642, 1, '2011-06-10 00:00:00', 30, 141, -200, NULL);
INSERT INTO storage.base_operations VALUES (642, 0, '2011-06-10 00:00:00', 37, 141, 200, NULL);
INSERT INTO storage.base_operations VALUES (642, 3, '2011-06-10 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (611, 1, '2011-06-06 00:00:00', 30, 143, -125, NULL);
INSERT INTO storage.base_operations VALUES (611, 0, '2011-06-06 00:00:00', 37, 143, 125, NULL);
INSERT INTO storage.base_operations VALUES (611, 3, '2011-06-06 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (611, 4, '2011-06-06 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (611, 5, '2011-06-06 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (611, 6, '2011-06-06 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (530, 1, '2011-06-03 00:00:00', 30, 142, -140, NULL);
INSERT INTO storage.base_operations VALUES (530, 0, '2011-06-03 00:00:00', 37, 142, 140, NULL);
INSERT INTO storage.base_operations VALUES (530, 3, '2011-06-03 00:00:00', 30, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (530, 4, '2011-06-03 00:00:00', 37, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (530, 5, '2011-06-03 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (530, 6, '2011-06-03 00:00:00', 37, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (563, 1, '2011-06-04 00:00:00', 30, 142, -220, NULL);
INSERT INTO storage.base_operations VALUES (563, 0, '2011-06-04 00:00:00', 37, 142, 220, NULL);
INSERT INTO storage.base_operations VALUES (563, 3, '2011-06-04 00:00:00', 30, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (563, 4, '2011-06-04 00:00:00', 37, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (563, 5, '2011-06-04 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (563, 6, '2011-06-04 00:00:00', 37, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (642, 4, '2011-06-10 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (642, 5, '2011-06-10 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (642, 6, '2011-06-10 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (711, 1, '2011-04-28 00:00:00', 147, 228, -1000, NULL);
INSERT INTO storage.base_operations VALUES (711, 0, '2011-04-28 00:00:00', 12, 228, 1000, NULL);
INSERT INTO storage.base_operations VALUES (711, 3, '2011-04-28 00:00:00', 147, 228, 0, NULL);
INSERT INTO storage.base_operations VALUES (711, 4, '2011-04-28 00:00:00', 12, 228, 0, NULL);
INSERT INTO storage.base_operations VALUES (711, 5, '2011-04-28 00:00:00', 9, 228, 0, NULL);
INSERT INTO storage.base_operations VALUES (711, 6, '2011-04-28 00:00:00', 12, 228, 0, NULL);
INSERT INTO storage.base_operations VALUES (645, 1, '2011-06-11 00:00:00', 37, 143, -50, NULL);
INSERT INTO storage.base_operations VALUES (645, 0, '2011-06-11 00:00:00', 38, 143, 50, NULL);
INSERT INTO storage.base_operations VALUES (645, 3, '2011-06-11 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (645, 4, '2011-06-11 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (645, 5, '2011-06-11 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (645, 6, '2011-06-11 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (648, 1, '2011-06-14 00:00:00', 30, 143, -175, NULL);
INSERT INTO storage.base_operations VALUES (648, 0, '2011-06-14 00:00:00', 37, 143, 175, NULL);
INSERT INTO storage.base_operations VALUES (648, 3, '2011-06-14 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (648, 4, '2011-06-14 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (648, 5, '2011-06-14 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (648, 6, '2011-06-14 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (724, 1, '2011-05-11 00:00:00', 8, 86, -1500, NULL);
INSERT INTO storage.base_operations VALUES (724, 0, '2011-05-11 00:00:00', 147, 86, 1500, NULL);
INSERT INTO storage.base_operations VALUES (651, 1, '2011-06-15 00:00:00', 30, 141, -142, NULL);
INSERT INTO storage.base_operations VALUES (651, 0, '2011-06-15 00:00:00', 37, 141, 142, NULL);
INSERT INTO storage.base_operations VALUES (651, 3, '2011-06-15 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (651, 4, '2011-06-15 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (651, 5, '2011-06-15 00:00:00', 9, 141, 8, NULL);
INSERT INTO storage.base_operations VALUES (651, 6, '2011-06-15 00:00:00', 37, 141, -8, NULL);
INSERT INTO storage.base_operations VALUES (724, 3, '2011-05-11 00:00:00', 8, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (724, 4, '2011-05-11 00:00:00', 147, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (724, 5, '2011-05-11 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (724, 6, '2011-05-11 00:00:00', 147, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (630, 1, '2011-06-09 00:00:00', 38, 175, -569, NULL);
INSERT INTO storage.base_operations VALUES (1164, 100, '2011-07-08 00:00:00', 12, 141, -7, NULL);
INSERT INTO storage.base_operations VALUES (1164, 101, '2011-07-08 00:00:00', 12, 143, -7, NULL);
INSERT INTO storage.base_operations VALUES (1164, 1, '2011-07-08 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1164, 0, '2011-07-08 00:00:00', 146, 321, 7, NULL);
INSERT INTO storage.base_operations VALUES (1164, 3, '2011-07-08 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1164, 4, '2011-07-08 00:00:00', 146, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (630, 0, '2011-06-09 00:00:00', 62, 175, 569, NULL);
INSERT INTO storage.base_operations VALUES (630, 3, '2011-06-09 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (630, 4, '2011-06-09 00:00:00', 62, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (630, 5, '2011-06-09 00:00:00', 9, 175, 29, NULL);
INSERT INTO storage.base_operations VALUES (630, 6, '2011-06-09 00:00:00', 62, 175, -29, NULL);
INSERT INTO storage.base_operations VALUES (669, 1, '2011-06-19 00:00:00', 30, 174, -484, NULL);
INSERT INTO storage.base_operations VALUES (1164, 5, '2011-07-08 00:00:00', 9, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1164, 6, '2011-07-08 00:00:00', 146, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1183, 0, '2011-05-20 00:00:00', 371, 210, 1, NULL);
INSERT INTO storage.base_operations VALUES (1183, 3, '2011-05-20 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1183, 4, '2011-05-20 00:00:00', 371, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1183, 5, '2011-05-20 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1183, 6, '2011-05-20 00:00:00', 371, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1293, 4, '2011-08-01 00:00:00', 30, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1293, 5, '2011-08-01 00:00:00', 9, 381, 1, NULL);
INSERT INTO storage.base_operations VALUES (1293, 6, '2011-08-01 00:00:00', 30, 381, -1, NULL);
INSERT INTO storage.base_operations VALUES (1294, 1, '2011-08-01 00:00:00', 30, 381, -91, NULL);
INSERT INTO storage.base_operations VALUES (1294, 0, '2011-08-01 00:00:00', 61, 381, 91, NULL);
INSERT INTO storage.base_operations VALUES (669, 0, '2011-06-19 00:00:00', 61, 174, 484, NULL);
INSERT INTO storage.base_operations VALUES (669, 3, '2011-06-19 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (669, 4, '2011-06-19 00:00:00', 61, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (669, 5, '2011-06-19 00:00:00', 9, 174, 5, NULL);
INSERT INTO storage.base_operations VALUES (669, 6, '2011-06-19 00:00:00', 61, 174, -5, NULL);
INSERT INTO storage.base_operations VALUES (1294, 3, '2011-08-01 00:00:00', 30, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1294, 4, '2011-08-01 00:00:00', 61, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (804, 5, '2011-06-29 00:00:00', 9, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (804, 6, '2011-06-29 00:00:00', 356, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (949, 1, '2011-06-23 00:00:00', 37, 143, -195, NULL);
INSERT INTO storage.base_operations VALUES (949, 0, '2011-06-23 00:00:00', 38, 143, 195, NULL);
INSERT INTO storage.base_operations VALUES (949, 3, '2011-06-23 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (949, 4, '2011-06-23 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (644, 1, '2011-06-11 00:00:00', 30, 143, -151, NULL);
INSERT INTO storage.base_operations VALUES (644, 0, '2011-06-11 00:00:00', 37, 143, 151, NULL);
INSERT INTO storage.base_operations VALUES (644, 3, '2011-06-11 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (644, 4, '2011-06-11 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (644, 5, '2011-06-11 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (644, 6, '2011-06-11 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (647, 1, '2011-06-13 00:00:00', 37, 143, -50, NULL);
INSERT INTO storage.base_operations VALUES (647, 0, '2011-06-13 00:00:00', 38, 143, 50, NULL);
INSERT INTO storage.base_operations VALUES (647, 3, '2011-06-13 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (647, 4, '2011-06-13 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (647, 5, '2011-06-13 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (647, 6, '2011-06-13 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (650, 1, '2011-06-14 00:00:00', 37, 143, -50, NULL);
INSERT INTO storage.base_operations VALUES (650, 0, '2011-06-14 00:00:00', 38, 143, 50, NULL);
INSERT INTO storage.base_operations VALUES (650, 3, '2011-06-14 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (650, 4, '2011-06-14 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (650, 5, '2011-06-14 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (650, 6, '2011-06-14 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (653, 6, '2011-06-15 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (654, 1, '2011-06-15 00:00:00', 37, 143, -60, NULL);
INSERT INTO storage.base_operations VALUES (654, 0, '2011-06-15 00:00:00', 38, 143, 60, NULL);
INSERT INTO storage.base_operations VALUES (654, 3, '2011-06-15 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (654, 4, '2011-06-15 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (654, 5, '2011-06-15 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (654, 6, '2011-06-15 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (655, 1, '2011-06-16 00:00:00', 30, 141, -194, NULL);
INSERT INTO storage.base_operations VALUES (655, 0, '2011-06-16 00:00:00', 37, 141, 194, NULL);
INSERT INTO storage.base_operations VALUES (655, 3, '2011-06-16 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (655, 4, '2011-06-16 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (655, 5, '2011-06-16 00:00:00', 9, 141, 6, NULL);
INSERT INTO storage.base_operations VALUES (655, 6, '2011-06-16 00:00:00', 37, 141, -6, NULL);
INSERT INTO storage.base_operations VALUES (656, 1, '2011-06-16 00:00:00', 30, 141, -140, NULL);
INSERT INTO storage.base_operations VALUES (656, 0, '2011-06-16 00:00:00', 37, 141, 140, NULL);
INSERT INTO storage.base_operations VALUES (656, 3, '2011-06-16 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (656, 4, '2011-06-16 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (656, 5, '2011-06-16 00:00:00', 9, 141, 1, NULL);
INSERT INTO storage.base_operations VALUES (656, 6, '2011-06-16 00:00:00', 37, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (657, 1, '2011-06-16 00:00:00', 37, 143, -65, NULL);
INSERT INTO storage.base_operations VALUES (657, 0, '2011-06-16 00:00:00', 38, 143, 65, NULL);
INSERT INTO storage.base_operations VALUES (657, 3, '2011-06-16 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (657, 4, '2011-06-16 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (657, 5, '2011-06-16 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (657, 6, '2011-06-16 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (658, 1, '2011-06-16 00:00:00', 37, 140, -50, NULL);
INSERT INTO storage.base_operations VALUES (658, 0, '2011-06-16 00:00:00', 38, 140, 50, NULL);
INSERT INTO storage.base_operations VALUES (658, 3, '2011-06-16 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (658, 4, '2011-06-16 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (658, 5, '2011-06-16 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (658, 6, '2011-06-16 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (659, 1, '2011-06-17 00:00:00', 37, 140, -50, NULL);
INSERT INTO storage.base_operations VALUES (659, 0, '2011-06-17 00:00:00', 38, 140, 50, NULL);
INSERT INTO storage.base_operations VALUES (659, 3, '2011-06-17 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (659, 4, '2011-06-17 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (659, 5, '2011-06-17 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (659, 6, '2011-06-17 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (632, 1, '2011-06-09 00:00:00', 62, 175, -540, NULL);
INSERT INTO storage.base_operations VALUES (632, 0, '2011-06-09 00:00:00', 8, 175, 540, NULL);
INSERT INTO storage.base_operations VALUES (632, 3, '2011-06-09 00:00:00', 62, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (632, 4, '2011-06-09 00:00:00', 8, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (632, 5, '2011-06-09 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (632, 6, '2011-06-09 00:00:00', 8, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (696, 1, '2011-06-19 00:00:00', 61, 174, -307, NULL);
INSERT INTO storage.base_operations VALUES (696, 0, '2011-06-19 00:00:00', 38, 174, 307, NULL);
INSERT INTO storage.base_operations VALUES (696, 3, '2011-06-19 00:00:00', 61, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (696, 4, '2011-06-19 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (696, 5, '2011-06-19 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (696, 6, '2011-06-19 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (1294, 5, '2011-08-01 00:00:00', 9, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1294, 6, '2011-08-01 00:00:00', 61, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1295, 1, '2011-08-01 00:00:00', 61, 381, -91, NULL);
INSERT INTO storage.base_operations VALUES (661, 1, '2011-06-17 00:00:00', 37, 140, -70, NULL);
INSERT INTO storage.base_operations VALUES (661, 0, '2011-06-17 00:00:00', 38, 140, 70, NULL);
INSERT INTO storage.base_operations VALUES (661, 3, '2011-06-17 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (661, 4, '2011-06-17 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (661, 5, '2011-06-17 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (661, 6, '2011-06-17 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (1295, 0, '2011-08-01 00:00:00', 37, 381, 91, NULL);
INSERT INTO storage.base_operations VALUES (1295, 3, '2011-08-01 00:00:00', 61, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1295, 4, '2011-08-01 00:00:00', 37, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1184, 1, '2011-05-20 00:00:00', 12, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (1184, 0, '2011-05-20 00:00:00', 371, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (1184, 3, '2011-05-20 00:00:00', 12, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (712, 1, '2011-04-28 00:00:00', 147, 351, -1000, NULL);
INSERT INTO storage.base_operations VALUES (712, 0, '2011-04-28 00:00:00', 12, 351, 1000, NULL);
INSERT INTO storage.base_operations VALUES (712, 3, '2011-04-28 00:00:00', 147, 351, 0, NULL);
INSERT INTO storage.base_operations VALUES (712, 4, '2011-04-28 00:00:00', 12, 351, 0, NULL);
INSERT INTO storage.base_operations VALUES (712, 5, '2011-04-28 00:00:00', 9, 351, 0, NULL);
INSERT INTO storage.base_operations VALUES (712, 6, '2011-04-28 00:00:00', 12, 351, 0, NULL);
INSERT INTO storage.base_operations VALUES (662, 1, '2011-06-17 00:00:00', 30, 141, -44, NULL);
INSERT INTO storage.base_operations VALUES (662, 0, '2011-06-17 00:00:00', 37, 141, 44, NULL);
INSERT INTO storage.base_operations VALUES (662, 3, '2011-06-17 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (662, 4, '2011-06-17 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (662, 5, '2011-06-17 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (662, 6, '2011-06-17 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (717, 1, '2011-05-10 00:00:00', 147, 88, -75, NULL);
INSERT INTO storage.base_operations VALUES (717, 0, '2011-05-10 00:00:00', 12, 88, 75, NULL);
INSERT INTO storage.base_operations VALUES (717, 3, '2011-05-10 00:00:00', 147, 88, 0, NULL);
INSERT INTO storage.base_operations VALUES (717, 4, '2011-05-10 00:00:00', 12, 88, 0, NULL);
INSERT INTO storage.base_operations VALUES (717, 5, '2011-05-10 00:00:00', 9, 88, 0, NULL);
INSERT INTO storage.base_operations VALUES (717, 6, '2011-05-10 00:00:00', 12, 88, 0, NULL);
INSERT INTO storage.base_operations VALUES (660, 1, '2011-06-17 00:00:00', 30, 143, -100, NULL);
INSERT INTO storage.base_operations VALUES (660, 0, '2011-06-17 00:00:00', 37, 143, 100, NULL);
INSERT INTO storage.base_operations VALUES (660, 3, '2011-06-17 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (660, 4, '2011-06-17 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (660, 5, '2011-06-17 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (660, 6, '2011-06-17 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (1184, 4, '2011-05-20 00:00:00', 371, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (1184, 5, '2011-05-20 00:00:00', 9, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (1184, 6, '2011-05-20 00:00:00', 371, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (1295, 5, '2011-08-01 00:00:00', 9, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1295, 6, '2011-08-01 00:00:00', 37, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (725, 1, '2011-05-11 00:00:00', 8, 142, -50, NULL);
INSERT INTO storage.base_operations VALUES (725, 0, '2011-05-11 00:00:00', 147, 142, 50, NULL);
INSERT INTO storage.base_operations VALUES (725, 3, '2011-05-11 00:00:00', 8, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (725, 4, '2011-05-11 00:00:00', 147, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (725, 5, '2011-05-11 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (725, 6, '2011-05-11 00:00:00', 147, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (665, 1, '2011-06-18 00:00:00', 30, 143, -149, NULL);
INSERT INTO storage.base_operations VALUES (665, 0, '2011-06-18 00:00:00', 37, 143, 149, NULL);
INSERT INTO storage.base_operations VALUES (665, 3, '2011-06-18 00:00:00', 30, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (665, 4, '2011-06-18 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (665, 5, '2011-06-18 00:00:00', 9, 143, 7, NULL);
INSERT INTO storage.base_operations VALUES (665, 6, '2011-06-18 00:00:00', 37, 143, -7, NULL);
INSERT INTO storage.base_operations VALUES (668, 1, '2011-06-18 00:00:00', 37, 141, -15, NULL);
INSERT INTO storage.base_operations VALUES (668, 0, '2011-06-18 00:00:00', 38, 141, 15, NULL);
INSERT INTO storage.base_operations VALUES (668, 3, '2011-06-18 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (668, 4, '2011-06-18 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (668, 5, '2011-06-18 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (668, 6, '2011-06-18 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (667, 1, '2011-06-18 00:00:00', 30, 141, -125, NULL);
INSERT INTO storage.base_operations VALUES (667, 0, '2011-06-18 00:00:00', 37, 141, 125, NULL);
INSERT INTO storage.base_operations VALUES (667, 3, '2011-06-18 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (667, 4, '2011-06-18 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (667, 5, '2011-06-18 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (667, 6, '2011-06-18 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (670, 1, '2011-06-19 00:00:00', 30, 141, -200, NULL);
INSERT INTO storage.base_operations VALUES (670, 0, '2011-06-19 00:00:00', 37, 141, 200, NULL);
INSERT INTO storage.base_operations VALUES (670, 3, '2011-06-19 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (670, 4, '2011-06-19 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (670, 5, '2011-06-19 00:00:00', 9, 141, 4, NULL);
INSERT INTO storage.base_operations VALUES (670, 6, '2011-06-19 00:00:00', 37, 141, -4, NULL);
INSERT INTO storage.base_operations VALUES (671, 1, '2011-06-19 00:00:00', 37, 141, -60, NULL);
INSERT INTO storage.base_operations VALUES (671, 0, '2011-06-19 00:00:00', 38, 141, 60, NULL);
INSERT INTO storage.base_operations VALUES (671, 3, '2011-06-19 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (671, 4, '2011-06-19 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (671, 5, '2011-06-19 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (671, 6, '2011-06-19 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (633, 1, '2011-06-09 00:00:00', 30, 175, -260, NULL);
INSERT INTO storage.base_operations VALUES (633, 0, '2011-06-09 00:00:00', 61, 175, 260, NULL);
INSERT INTO storage.base_operations VALUES (633, 3, '2011-06-09 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (1296, 1, '2011-08-01 00:00:00', 37, 381, -91, NULL);
INSERT INTO storage.base_operations VALUES (1296, 0, '2011-08-01 00:00:00', 38, 381, 91, NULL);
INSERT INTO storage.base_operations VALUES (1296, 3, '2011-08-01 00:00:00', 37, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1296, 4, '2011-08-01 00:00:00', 38, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1296, 5, '2011-08-01 00:00:00', 9, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1296, 6, '2011-08-01 00:00:00', 38, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (633, 4, '2011-06-09 00:00:00', 61, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (633, 5, '2011-06-09 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (633, 6, '2011-06-09 00:00:00', 61, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (697, 1, '2011-06-19 00:00:00', 38, 174, -484, NULL);
INSERT INTO storage.base_operations VALUES (697, 0, '2011-06-19 00:00:00', 62, 174, 484, NULL);
INSERT INTO storage.base_operations VALUES (697, 3, '2011-06-19 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (1066, 100, '2011-06-15 00:00:00', 12, 125, -20, NULL);
INSERT INTO storage.base_operations VALUES (1066, 101, '2011-06-15 00:00:00', 12, 334, -20, NULL);
INSERT INTO storage.base_operations VALUES (1066, 102, '2011-06-15 00:00:00', 12, 335, -20, NULL);
INSERT INTO storage.base_operations VALUES (1066, 103, '2011-06-15 00:00:00', 12, 228, -20, NULL);
INSERT INTO storage.base_operations VALUES (1066, 1, '2011-06-15 00:00:00', 12, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1066, 0, '2011-06-15 00:00:00', 373, 333, 20, NULL);
INSERT INTO storage.base_operations VALUES (697, 4, '2011-06-19 00:00:00', 62, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (697, 5, '2011-06-19 00:00:00', 9, 174, 34, NULL);
INSERT INTO storage.base_operations VALUES (697, 6, '2011-06-19 00:00:00', 62, 174, -34, NULL);
INSERT INTO storage.base_operations VALUES (676, 1, '2011-06-20 00:00:00', 30, 141, -100, NULL);
INSERT INTO storage.base_operations VALUES (676, 0, '2011-06-20 00:00:00', 37, 141, 100, NULL);
INSERT INTO storage.base_operations VALUES (676, 3, '2011-06-20 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (676, 4, '2011-06-20 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (676, 5, '2011-06-20 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (676, 6, '2011-06-20 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (672, 1, '2011-06-20 00:00:00', 37, 141, -36, NULL);
INSERT INTO storage.base_operations VALUES (672, 0, '2011-06-20 00:00:00', 38, 141, 36, NULL);
INSERT INTO storage.base_operations VALUES (672, 3, '2011-06-20 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (672, 4, '2011-06-20 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (672, 5, '2011-06-20 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (672, 6, '2011-06-20 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (713, 1, '2011-04-28 00:00:00', 147, 95, -373, NULL);
INSERT INTO storage.base_operations VALUES (713, 0, '2011-04-28 00:00:00', 12, 95, 373, NULL);
INSERT INTO storage.base_operations VALUES (713, 3, '2011-04-28 00:00:00', 147, 95, 0, NULL);
INSERT INTO storage.base_operations VALUES (713, 4, '2011-04-28 00:00:00', 12, 95, 0, NULL);
INSERT INTO storage.base_operations VALUES (713, 5, '2011-04-28 00:00:00', 9, 95, 0, NULL);
INSERT INTO storage.base_operations VALUES (713, 6, '2011-04-28 00:00:00', 12, 95, 0, NULL);
INSERT INTO storage.base_operations VALUES (718, 1, '2011-05-10 00:00:00', 147, 89, -127, NULL);
INSERT INTO storage.base_operations VALUES (718, 0, '2011-05-10 00:00:00', 12, 89, 127, NULL);
INSERT INTO storage.base_operations VALUES (718, 3, '2011-05-10 00:00:00', 147, 89, 0, NULL);
INSERT INTO storage.base_operations VALUES (679, 1, '2011-06-20 00:00:00', 30, 140, -50, NULL);
INSERT INTO storage.base_operations VALUES (679, 0, '2011-06-20 00:00:00', 37, 140, 50, NULL);
INSERT INTO storage.base_operations VALUES (679, 3, '2011-06-20 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (679, 4, '2011-06-20 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (679, 5, '2011-06-20 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (679, 6, '2011-06-20 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (718, 4, '2011-05-10 00:00:00', 12, 89, 0, NULL);
INSERT INTO storage.base_operations VALUES (718, 5, '2011-05-10 00:00:00', 9, 89, 0, NULL);
INSERT INTO storage.base_operations VALUES (718, 6, '2011-05-10 00:00:00', 12, 89, 0, NULL);
INSERT INTO storage.base_operations VALUES (680, 1, '2011-06-20 00:00:00', 30, 141, -100, NULL);
INSERT INTO storage.base_operations VALUES (680, 0, '2011-06-20 00:00:00', 37, 141, 100, NULL);
INSERT INTO storage.base_operations VALUES (680, 3, '2011-06-20 00:00:00', 30, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (680, 4, '2011-06-20 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (680, 5, '2011-06-20 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (680, 6, '2011-06-20 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (677, 1, '2011-06-20 00:00:00', 37, 141, -73, NULL);
INSERT INTO storage.base_operations VALUES (677, 0, '2011-06-20 00:00:00', 38, 141, 73, NULL);
INSERT INTO storage.base_operations VALUES (677, 3, '2011-06-20 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (677, 4, '2011-06-20 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (677, 5, '2011-06-20 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (677, 6, '2011-06-20 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (487, 1, '2011-06-01 00:00:00', 30, 174, -264, NULL);
INSERT INTO storage.base_operations VALUES (487, 0, '2011-06-01 00:00:00', 61, 174, 264, NULL);
INSERT INTO storage.base_operations VALUES (487, 3, '2011-06-01 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (487, 4, '2011-06-01 00:00:00', 61, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (487, 5, '2011-06-01 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (487, 6, '2011-06-01 00:00:00', 61, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (682, 1, '2011-06-01 00:00:00', 37, 143, -58, NULL);
INSERT INTO storage.base_operations VALUES (682, 0, '2011-06-01 00:00:00', 38, 143, 58, NULL);
INSERT INTO storage.base_operations VALUES (682, 3, '2011-06-01 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (682, 4, '2011-06-01 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (682, 5, '2011-06-01 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (682, 6, '2011-06-01 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (681, 1, '2011-06-01 00:00:00', 62, 174, -264, NULL);
INSERT INTO storage.base_operations VALUES (681, 0, '2011-06-01 00:00:00', 8, 174, 264, NULL);
INSERT INTO storage.base_operations VALUES (681, 3, '2011-06-01 00:00:00', 62, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (681, 4, '2011-06-01 00:00:00', 8, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (681, 5, '2011-06-01 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (681, 6, '2011-06-01 00:00:00', 8, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (540, 1, '2011-06-03 00:00:00', 30, 174, -425, NULL);
INSERT INTO storage.base_operations VALUES (540, 0, '2011-06-03 00:00:00', 61, 174, 425, NULL);
INSERT INTO storage.base_operations VALUES (540, 3, '2011-06-03 00:00:00', 30, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (540, 4, '2011-06-03 00:00:00', 61, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (540, 5, '2011-06-03 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (540, 6, '2011-06-03 00:00:00', 61, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (541, 1, '2011-06-03 00:00:00', 61, 174, -425, NULL);
INSERT INTO storage.base_operations VALUES (541, 0, '2011-06-03 00:00:00', 37, 174, 425, NULL);
INSERT INTO storage.base_operations VALUES (541, 3, '2011-06-03 00:00:00', 61, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (541, 4, '2011-06-03 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (541, 5, '2011-06-03 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (541, 6, '2011-06-03 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (543, 1, '2011-06-03 00:00:00', 37, 174, -425, NULL);
INSERT INTO storage.base_operations VALUES (543, 0, '2011-06-03 00:00:00', 38, 174, 425, NULL);
INSERT INTO storage.base_operations VALUES (543, 3, '2011-06-03 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (543, 4, '2011-06-03 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (543, 5, '2011-06-03 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (543, 6, '2011-06-03 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (634, 1, '2011-06-09 00:00:00', 61, 175, -260, NULL);
INSERT INTO storage.base_operations VALUES (634, 0, '2011-06-09 00:00:00', 62, 175, 260, NULL);
INSERT INTO storage.base_operations VALUES (634, 3, '2011-06-09 00:00:00', 61, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (634, 4, '2011-06-09 00:00:00', 62, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (634, 5, '2011-06-09 00:00:00', 9, 175, 10, NULL);
INSERT INTO storage.base_operations VALUES (634, 6, '2011-06-09 00:00:00', 62, 175, -10, NULL);
INSERT INTO storage.base_operations VALUES (684, 1, '2011-06-03 00:00:00', 62, 174, -400, NULL);
INSERT INTO storage.base_operations VALUES (684, 0, '2011-06-03 00:00:00', 8, 174, 400, NULL);
INSERT INTO storage.base_operations VALUES (684, 3, '2011-06-03 00:00:00', 62, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (684, 4, '2011-06-03 00:00:00', 8, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (684, 5, '2011-06-03 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (684, 6, '2011-06-03 00:00:00', 8, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (685, 1, '2011-06-03 00:00:00', 62, 143, -12, NULL);
INSERT INTO storage.base_operations VALUES (685, 0, '2011-06-03 00:00:00', 8, 143, 12, NULL);
INSERT INTO storage.base_operations VALUES (685, 3, '2011-06-03 00:00:00', 62, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (685, 4, '2011-06-03 00:00:00', 8, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (685, 5, '2011-06-03 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (685, 6, '2011-06-03 00:00:00', 8, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (686, 1, '2011-06-03 00:00:00', 61, 142, -140, NULL);
INSERT INTO storage.base_operations VALUES (686, 0, '2011-06-03 00:00:00', 37, 142, 140, NULL);
INSERT INTO storage.base_operations VALUES (686, 3, '2011-06-03 00:00:00', 61, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (686, 4, '2011-06-03 00:00:00', 37, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (686, 5, '2011-06-03 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (686, 6, '2011-06-03 00:00:00', 37, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (703, 1, '2011-05-18 00:00:00', 8, 84, -1000, NULL);
INSERT INTO storage.base_operations VALUES (703, 0, '2011-05-18 00:00:00', 353, 84, 1000, NULL);
INSERT INTO storage.base_operations VALUES (703, 3, '2011-05-18 00:00:00', 8, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (703, 4, '2011-05-18 00:00:00', 353, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (703, 5, '2011-05-18 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (703, 6, '2011-05-18 00:00:00', 353, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (544, 1, '2011-06-03 00:00:00', 38, 174, -425, NULL);
INSERT INTO storage.base_operations VALUES (544, 0, '2011-06-03 00:00:00', 62, 174, 425, NULL);
INSERT INTO storage.base_operations VALUES (544, 3, '2011-06-03 00:00:00', 38, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (544, 4, '2011-06-03 00:00:00', 62, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (544, 5, '2011-06-03 00:00:00', 9, 174, 25, NULL);
INSERT INTO storage.base_operations VALUES (544, 6, '2011-06-03 00:00:00', 62, 174, -25, NULL);
INSERT INTO storage.base_operations VALUES (687, 1, '2011-06-03 00:00:00', 38, 175, -444, NULL);
INSERT INTO storage.base_operations VALUES (687, 0, '2011-06-03 00:00:00', 62, 175, 444, NULL);
INSERT INTO storage.base_operations VALUES (687, 3, '2011-06-03 00:00:00', 38, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (687, 4, '2011-06-03 00:00:00', 62, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (687, 5, '2011-06-03 00:00:00', 9, 175, 14, NULL);
INSERT INTO storage.base_operations VALUES (687, 6, '2011-06-03 00:00:00', 62, 175, -14, NULL);
INSERT INTO storage.base_operations VALUES (688, 1, '2011-06-03 00:00:00', 62, 175, -430, NULL);
INSERT INTO storage.base_operations VALUES (688, 0, '2011-06-03 00:00:00', 8, 175, 430, NULL);
INSERT INTO storage.base_operations VALUES (688, 3, '2011-06-03 00:00:00', 62, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (688, 4, '2011-06-03 00:00:00', 8, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (688, 5, '2011-06-03 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (688, 6, '2011-06-03 00:00:00', 8, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (690, 1, '2011-06-01 00:00:00', 61, 174, -264, NULL);
INSERT INTO storage.base_operations VALUES (690, 0, '2011-06-01 00:00:00', 37, 174, 264, NULL);
INSERT INTO storage.base_operations VALUES (690, 3, '2011-06-01 00:00:00', 61, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (690, 4, '2011-06-01 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (690, 5, '2011-06-01 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (690, 6, '2011-06-01 00:00:00', 37, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (514, 1, '2011-06-02 00:00:00', 30, 175, -450, NULL);
INSERT INTO storage.base_operations VALUES (514, 0, '2011-06-02 00:00:00', 37, 175, 450, NULL);
INSERT INTO storage.base_operations VALUES (514, 3, '2011-06-02 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (514, 4, '2011-06-02 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (514, 5, '2011-06-02 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (514, 6, '2011-06-02 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (576, 1, '2011-06-04 00:00:00', 61, 175, -400, NULL);
INSERT INTO storage.base_operations VALUES (576, 0, '2011-06-04 00:00:00', 37, 175, 400, NULL);
INSERT INTO storage.base_operations VALUES (576, 3, '2011-06-04 00:00:00', 61, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (576, 4, '2011-06-04 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (576, 5, '2011-06-04 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (576, 6, '2011-06-04 00:00:00', 37, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (577, 1, '2011-06-04 00:00:00', 30, 175, -400, NULL);
INSERT INTO storage.base_operations VALUES (577, 0, '2011-06-04 00:00:00', 61, 175, 400, NULL);
INSERT INTO storage.base_operations VALUES (577, 3, '2011-06-04 00:00:00', 30, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (577, 4, '2011-06-04 00:00:00', 61, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (577, 5, '2011-06-04 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (577, 6, '2011-06-04 00:00:00', 61, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (691, 1, '2011-06-04 00:00:00', 62, 175, -400, NULL);
INSERT INTO storage.base_operations VALUES (691, 0, '2011-06-04 00:00:00', 8, 175, 400, NULL);
INSERT INTO storage.base_operations VALUES (691, 3, '2011-06-04 00:00:00', 62, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (691, 4, '2011-06-04 00:00:00', 8, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (691, 5, '2011-06-04 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (691, 6, '2011-06-04 00:00:00', 8, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (714, 1, '2011-04-28 00:00:00', 147, 99, -337, NULL);
INSERT INTO storage.base_operations VALUES (714, 0, '2011-04-28 00:00:00', 12, 99, 337, NULL);
INSERT INTO storage.base_operations VALUES (714, 3, '2011-04-28 00:00:00', 147, 99, 0, NULL);
INSERT INTO storage.base_operations VALUES (714, 4, '2011-04-28 00:00:00', 12, 99, 0, NULL);
INSERT INTO storage.base_operations VALUES (714, 5, '2011-04-28 00:00:00', 9, 99, 0, NULL);
INSERT INTO storage.base_operations VALUES (714, 6, '2011-04-28 00:00:00', 12, 99, 0, NULL);
INSERT INTO storage.base_operations VALUES (719, 1, '2011-05-10 00:00:00', 147, 90, -126, NULL);
INSERT INTO storage.base_operations VALUES (719, 0, '2011-05-10 00:00:00', 12, 90, 126, NULL);
INSERT INTO storage.base_operations VALUES (719, 3, '2011-05-10 00:00:00', 147, 90, 0, NULL);
INSERT INTO storage.base_operations VALUES (719, 4, '2011-05-10 00:00:00', 12, 90, 0, NULL);
INSERT INTO storage.base_operations VALUES (719, 5, '2011-05-10 00:00:00', 9, 90, 0, NULL);
INSERT INTO storage.base_operations VALUES (1297, 1, '2011-08-02 00:00:00', 35, 381, -131, NULL);
INSERT INTO storage.base_operations VALUES (1297, 0, '2011-08-02 00:00:00', 83, 381, 131, NULL);
INSERT INTO storage.base_operations VALUES (1297, 3, '2011-08-02 00:00:00', 35, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1297, 4, '2011-08-02 00:00:00', 83, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1297, 5, '2011-08-02 00:00:00', 9, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1066, 3, '2011-06-15 00:00:00', 12, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1066, 4, '2011-06-15 00:00:00', 373, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1066, 5, '2011-06-15 00:00:00', 9, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1066, 6, '2011-06-15 00:00:00', 373, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1084, 0, '2011-06-15 00:00:00', 373, 321, 15, NULL);
INSERT INTO storage.base_operations VALUES (1084, 3, '2011-06-15 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (809, 100, '2011-06-29 00:00:00', 12, 140, -1, NULL);
INSERT INTO storage.base_operations VALUES (809, 101, '2011-06-29 00:00:00', 12, 142, -1, NULL);
INSERT INTO storage.base_operations VALUES (809, 1, '2011-06-29 00:00:00', 12, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (809, 0, '2011-06-29 00:00:00', 356, 318, 1, NULL);
INSERT INTO storage.base_operations VALUES (729, 100, '2011-04-19 00:00:00', 12, 113, -32, NULL);
INSERT INTO storage.base_operations VALUES (729, 101, '2011-04-19 00:00:00', 12, 121, -32, NULL);
INSERT INTO storage.base_operations VALUES (729, 102, '2011-04-19 00:00:00', 12, 126, -32, NULL);
INSERT INTO storage.base_operations VALUES (729, 103, '2011-04-19 00:00:00', 12, 125, -32, NULL);
INSERT INTO storage.base_operations VALUES (729, 104, '2011-04-19 00:00:00', 12, 88, -32, NULL);
INSERT INTO storage.base_operations VALUES (729, 1, '2011-04-19 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (729, 0, '2011-04-19 00:00:00', 355, 186, 32, NULL);
INSERT INTO storage.base_operations VALUES (729, 3, '2011-04-19 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (729, 4, '2011-04-19 00:00:00', 355, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (729, 5, '2011-04-19 00:00:00', 9, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (729, 6, '2011-04-19 00:00:00', 355, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (730, 100, '2011-04-19 00:00:00', 12, 125, -32, NULL);
INSERT INTO storage.base_operations VALUES (730, 101, '2011-04-19 00:00:00', 12, 126, -32, NULL);
INSERT INTO storage.base_operations VALUES (730, 102, '2011-04-19 00:00:00', 12, 121, -32, NULL);
INSERT INTO storage.base_operations VALUES (730, 103, '2011-04-19 00:00:00', 12, 114, -32, NULL);
INSERT INTO storage.base_operations VALUES (730, 104, '2011-04-19 00:00:00', 12, 89, -32, NULL);
INSERT INTO storage.base_operations VALUES (730, 1, '2011-04-19 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (730, 0, '2011-04-19 00:00:00', 355, 205, 32, NULL);
INSERT INTO storage.base_operations VALUES (730, 3, '2011-04-19 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (730, 4, '2011-04-19 00:00:00', 355, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (730, 5, '2011-04-19 00:00:00', 9, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (730, 6, '2011-04-19 00:00:00', 355, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (731, 100, '2011-04-19 00:00:00', 12, 115, -32, NULL);
INSERT INTO storage.base_operations VALUES (731, 101, '2011-04-19 00:00:00', 12, 125, -32, NULL);
INSERT INTO storage.base_operations VALUES (731, 102, '2011-04-19 00:00:00', 12, 121, -32, NULL);
INSERT INTO storage.base_operations VALUES (731, 103, '2011-04-19 00:00:00', 12, 126, -32, NULL);
INSERT INTO storage.base_operations VALUES (731, 104, '2011-04-19 00:00:00', 12, 90, -32, NULL);
INSERT INTO storage.base_operations VALUES (731, 1, '2011-04-19 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (731, 0, '2011-04-19 00:00:00', 355, 210, 32, NULL);
INSERT INTO storage.base_operations VALUES (731, 3, '2011-04-19 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (731, 4, '2011-04-19 00:00:00', 355, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (731, 5, '2011-04-19 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (731, 6, '2011-04-19 00:00:00', 355, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (732, 100, '2011-04-19 00:00:00', 12, 125, -32, NULL);
INSERT INTO storage.base_operations VALUES (732, 101, '2011-04-19 00:00:00', 12, 126, -32, NULL);
INSERT INTO storage.base_operations VALUES (732, 102, '2011-04-19 00:00:00', 12, 91, -32, NULL);
INSERT INTO storage.base_operations VALUES (732, 103, '2011-04-19 00:00:00', 12, 121, -32, NULL);
INSERT INTO storage.base_operations VALUES (732, 104, '2011-04-19 00:00:00', 12, 116, -32, NULL);
INSERT INTO storage.base_operations VALUES (732, 1, '2011-04-19 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (732, 0, '2011-04-19 00:00:00', 355, 217, 32, NULL);
INSERT INTO storage.base_operations VALUES (732, 3, '2011-04-19 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (732, 4, '2011-04-19 00:00:00', 355, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (732, 5, '2011-04-19 00:00:00', 9, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (732, 6, '2011-04-19 00:00:00', 355, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (733, 100, '2011-04-19 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (733, 101, '2011-04-19 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (733, 102, '2011-04-19 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (733, 103, '2011-04-19 00:00:00', 12, 88, -16, NULL);
INSERT INTO storage.base_operations VALUES (733, 1, '2011-04-19 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (733, 0, '2011-04-19 00:00:00', 355, 176, 16, NULL);
INSERT INTO storage.base_operations VALUES (733, 3, '2011-04-19 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (733, 4, '2011-04-19 00:00:00', 355, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (733, 5, '2011-04-19 00:00:00', 9, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (733, 6, '2011-04-19 00:00:00', 355, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (734, 100, '2011-04-19 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (734, 101, '2011-04-19 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (734, 102, '2011-04-19 00:00:00', 12, 89, -16, NULL);
INSERT INTO storage.base_operations VALUES (734, 103, '2011-04-19 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (734, 1, '2011-04-19 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (734, 0, '2011-04-19 00:00:00', 355, 181, 16, NULL);
INSERT INTO storage.base_operations VALUES (734, 3, '2011-04-19 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (734, 4, '2011-04-19 00:00:00', 355, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (734, 5, '2011-04-19 00:00:00', 9, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (734, 6, '2011-04-19 00:00:00', 355, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (735, 100, '2011-04-19 00:00:00', 12, 90, -16, NULL);
INSERT INTO storage.base_operations VALUES (735, 101, '2011-04-19 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (735, 102, '2011-04-19 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (735, 103, '2011-04-19 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (735, 1, '2011-04-19 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (735, 0, '2011-04-19 00:00:00', 355, 195, 16, NULL);
INSERT INTO storage.base_operations VALUES (735, 3, '2011-04-19 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (735, 4, '2011-04-19 00:00:00', 355, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (735, 5, '2011-04-19 00:00:00', 9, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (735, 6, '2011-04-19 00:00:00', 355, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (736, 100, '2011-04-19 00:00:00', 12, 91, -16, NULL);
INSERT INTO storage.base_operations VALUES (736, 101, '2011-04-19 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (736, 102, '2011-04-19 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (736, 103, '2011-04-19 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (736, 1, '2011-04-19 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (736, 0, '2011-04-19 00:00:00', 355, 200, 16, NULL);
INSERT INTO storage.base_operations VALUES (736, 3, '2011-04-19 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (736, 4, '2011-04-19 00:00:00', 355, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (736, 5, '2011-04-19 00:00:00', 9, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (736, 6, '2011-04-19 00:00:00', 355, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (737, 100, '2011-04-19 00:00:00', 12, 95, -16, NULL);
INSERT INTO storage.base_operations VALUES (737, 101, '2011-04-19 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (737, 102, '2011-04-19 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (737, 103, '2011-04-19 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (737, 1, '2011-04-19 00:00:00', 12, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (737, 0, '2011-04-19 00:00:00', 355, 236, 16, NULL);
INSERT INTO storage.base_operations VALUES (737, 3, '2011-04-19 00:00:00', 12, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (737, 4, '2011-04-19 00:00:00', 355, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (737, 5, '2011-04-19 00:00:00', 9, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (737, 6, '2011-04-19 00:00:00', 355, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (738, 100, '2011-04-19 00:00:00', 12, 99, -16, NULL);
INSERT INTO storage.base_operations VALUES (738, 101, '2011-04-19 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (738, 102, '2011-04-19 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (738, 103, '2011-04-19 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (738, 1, '2011-04-19 00:00:00', 12, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (738, 0, '2011-04-19 00:00:00', 355, 241, 16, NULL);
INSERT INTO storage.base_operations VALUES (738, 3, '2011-04-19 00:00:00', 12, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (738, 4, '2011-04-19 00:00:00', 355, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (738, 5, '2011-04-19 00:00:00', 9, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (738, 6, '2011-04-19 00:00:00', 355, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (739, 100, '2011-04-19 00:00:00', 12, 97, -16, NULL);
INSERT INTO storage.base_operations VALUES (739, 101, '2011-04-19 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (739, 102, '2011-04-19 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (739, 103, '2011-04-19 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (739, 1, '2011-04-19 00:00:00', 12, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (739, 0, '2011-04-19 00:00:00', 355, 246, 16, NULL);
INSERT INTO storage.base_operations VALUES (739, 3, '2011-04-19 00:00:00', 12, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (739, 4, '2011-04-19 00:00:00', 355, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (739, 5, '2011-04-19 00:00:00', 9, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (739, 6, '2011-04-19 00:00:00', 355, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (740, 100, '2011-04-19 00:00:00', 12, 91, -16, NULL);
INSERT INTO storage.base_operations VALUES (740, 101, '2011-04-19 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (740, 102, '2011-04-19 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (740, 103, '2011-04-19 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (740, 1, '2011-04-19 00:00:00', 12, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (740, 0, '2011-04-19 00:00:00', 355, 251, 16, NULL);
INSERT INTO storage.base_operations VALUES (740, 3, '2011-04-19 00:00:00', 12, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (740, 4, '2011-04-19 00:00:00', 355, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (740, 5, '2011-04-19 00:00:00', 9, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (740, 6, '2011-04-19 00:00:00', 355, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (741, 1, '2011-04-19 00:00:00', 12, 113, -32, NULL);
INSERT INTO storage.base_operations VALUES (741, 0, '2011-04-19 00:00:00', 355, 113, 32, NULL);
INSERT INTO storage.base_operations VALUES (741, 3, '2011-04-19 00:00:00', 12, 113, 0, NULL);
INSERT INTO storage.base_operations VALUES (741, 4, '2011-04-19 00:00:00', 355, 113, 0, NULL);
INSERT INTO storage.base_operations VALUES (741, 5, '2011-04-19 00:00:00', 9, 113, 0, NULL);
INSERT INTO storage.base_operations VALUES (741, 6, '2011-04-19 00:00:00', 355, 113, 0, NULL);
INSERT INTO storage.base_operations VALUES (742, 1, '2011-04-19 00:00:00', 12, 114, -24, NULL);
INSERT INTO storage.base_operations VALUES (742, 0, '2011-04-19 00:00:00', 355, 114, 24, NULL);
INSERT INTO storage.base_operations VALUES (742, 3, '2011-04-19 00:00:00', 12, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (742, 4, '2011-04-19 00:00:00', 355, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (742, 5, '2011-04-19 00:00:00', 9, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (742, 6, '2011-04-19 00:00:00', 355, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (743, 1, '2011-04-19 00:00:00', 12, 115, -20, NULL);
INSERT INTO storage.base_operations VALUES (743, 0, '2011-04-19 00:00:00', 355, 115, 20, NULL);
INSERT INTO storage.base_operations VALUES (743, 3, '2011-04-19 00:00:00', 12, 115, 0, NULL);
INSERT INTO storage.base_operations VALUES (743, 4, '2011-04-19 00:00:00', 355, 115, 0, NULL);
INSERT INTO storage.base_operations VALUES (743, 5, '2011-04-19 00:00:00', 9, 115, 0, NULL);
INSERT INTO storage.base_operations VALUES (743, 6, '2011-04-19 00:00:00', 355, 115, 0, NULL);
INSERT INTO storage.base_operations VALUES (744, 1, '2011-04-19 00:00:00', 12, 116, -16, NULL);
INSERT INTO storage.base_operations VALUES (744, 0, '2011-04-19 00:00:00', 355, 116, 16, NULL);
INSERT INTO storage.base_operations VALUES (744, 3, '2011-04-19 00:00:00', 12, 116, 0, NULL);
INSERT INTO storage.base_operations VALUES (744, 4, '2011-04-19 00:00:00', 355, 116, 0, NULL);
INSERT INTO storage.base_operations VALUES (744, 5, '2011-04-19 00:00:00', 9, 116, 0, NULL);
INSERT INTO storage.base_operations VALUES (744, 6, '2011-04-19 00:00:00', 355, 116, 0, NULL);
INSERT INTO storage.base_operations VALUES (1297, 6, '2011-08-02 00:00:00', 83, 381, 0, NULL);
INSERT INTO storage.base_operations VALUES (1185, 100, '2011-05-17 00:00:00', 12, 97, -1, NULL);
INSERT INTO storage.base_operations VALUES (1185, 101, '2011-05-17 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (1185, 102, '2011-05-17 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1185, 103, '2011-05-17 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1185, 104, '2011-05-17 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (938, 1, '2011-06-21 00:00:00', 37, 140, -51, NULL);
INSERT INTO storage.base_operations VALUES (938, 0, '2011-06-21 00:00:00', 38, 140, 51, NULL);
INSERT INTO storage.base_operations VALUES (938, 3, '2011-06-21 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (938, 4, '2011-06-21 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (938, 5, '2011-06-21 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (938, 6, '2011-06-21 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (949, 5, '2011-06-23 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (949, 6, '2011-06-23 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (959, 1, '2011-06-25 00:00:00', 37, 142, -86, NULL);
INSERT INTO storage.base_operations VALUES (959, 0, '2011-06-25 00:00:00', 38, 142, 86, NULL);
INSERT INTO storage.base_operations VALUES (748, 1, '2011-05-18 00:00:00', 12, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (748, 0, '2011-05-18 00:00:00', 359, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (748, 3, '2011-05-18 00:00:00', 12, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (748, 4, '2011-05-18 00:00:00', 359, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (748, 5, '2011-05-18 00:00:00', 9, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (748, 6, '2011-05-18 00:00:00', 359, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (745, 100, '2011-05-18 00:00:00', 12, 125, -250, NULL);
INSERT INTO storage.base_operations VALUES (745, 101, '2011-05-18 00:00:00', 12, 126, -250, NULL);
INSERT INTO storage.base_operations VALUES (745, 102, '2011-05-18 00:00:00', 12, 89, -250, NULL);
INSERT INTO storage.base_operations VALUES (745, 103, '2011-05-18 00:00:00', 12, 121, -250, NULL);
INSERT INTO storage.base_operations VALUES (745, 1, '2011-05-18 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (745, 0, '2011-05-18 00:00:00', 359, 181, 250, NULL);
INSERT INTO storage.base_operations VALUES (745, 3, '2011-05-18 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (745, 4, '2011-05-18 00:00:00', 359, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (745, 5, '2011-05-18 00:00:00', 9, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (745, 6, '2011-05-18 00:00:00', 359, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (746, 100, '2011-05-18 00:00:00', 12, 90, -250, NULL);
INSERT INTO storage.base_operations VALUES (746, 101, '2011-05-18 00:00:00', 12, 125, -250, NULL);
INSERT INTO storage.base_operations VALUES (746, 102, '2011-05-18 00:00:00', 12, 121, -250, NULL);
INSERT INTO storage.base_operations VALUES (746, 103, '2011-05-18 00:00:00', 12, 126, -250, NULL);
INSERT INTO storage.base_operations VALUES (746, 1, '2011-05-18 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (746, 0, '2011-05-18 00:00:00', 359, 195, 250, NULL);
INSERT INTO storage.base_operations VALUES (746, 3, '2011-05-18 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (746, 4, '2011-05-18 00:00:00', 359, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (746, 5, '2011-05-18 00:00:00', 9, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (746, 6, '2011-05-18 00:00:00', 359, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (747, 100, '2011-05-18 00:00:00', 12, 91, -250, NULL);
INSERT INTO storage.base_operations VALUES (747, 101, '2011-05-18 00:00:00', 12, 125, -250, NULL);
INSERT INTO storage.base_operations VALUES (747, 102, '2011-05-18 00:00:00', 12, 126, -250, NULL);
INSERT INTO storage.base_operations VALUES (747, 103, '2011-05-18 00:00:00', 12, 121, -250, NULL);
INSERT INTO storage.base_operations VALUES (747, 1, '2011-05-18 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (747, 0, '2011-05-18 00:00:00', 359, 200, 250, NULL);
INSERT INTO storage.base_operations VALUES (747, 3, '2011-05-18 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (747, 4, '2011-05-18 00:00:00', 359, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (747, 5, '2011-05-18 00:00:00', 9, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (747, 6, '2011-05-18 00:00:00', 359, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1280, 1, '2011-07-06 00:00:00', 35, 84, -72, NULL);
INSERT INTO storage.base_operations VALUES (1280, 0, '2011-07-06 00:00:00', 83, 84, 72, NULL);
INSERT INTO storage.base_operations VALUES (1280, 3, '2011-07-06 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1280, 4, '2011-07-06 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1280, 5, '2011-07-06 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1280, 6, '2011-07-06 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1185, 1, '2011-05-17 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1185, 0, '2011-05-17 00:00:00', 378, 268, 1, NULL);
INSERT INTO storage.base_operations VALUES (1185, 3, '2011-05-17 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1185, 4, '2011-05-17 00:00:00', 378, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (939, 1, '2011-06-21 00:00:00', 37, 141, -25, NULL);
INSERT INTO storage.base_operations VALUES (939, 0, '2011-06-21 00:00:00', 38, 141, 25, NULL);
INSERT INTO storage.base_operations VALUES (939, 3, '2011-06-21 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (939, 4, '2011-06-21 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (939, 5, '2011-06-21 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (939, 6, '2011-06-21 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (1067, 100, '2011-06-15 00:00:00', 12, 125, -20, NULL);
INSERT INTO storage.base_operations VALUES (1067, 101, '2011-06-15 00:00:00', 12, 334, -20, NULL);
INSERT INTO storage.base_operations VALUES (1067, 102, '2011-06-15 00:00:00', 12, 335, -20, NULL);
INSERT INTO storage.base_operations VALUES (1067, 103, '2011-06-15 00:00:00', 12, 351, -20, NULL);
INSERT INTO storage.base_operations VALUES (809, 3, '2011-06-29 00:00:00', 12, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (809, 4, '2011-06-29 00:00:00', 356, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (809, 5, '2011-06-29 00:00:00', 9, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (809, 6, '2011-06-29 00:00:00', 356, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (1067, 1, '2011-06-15 00:00:00', 12, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (1185, 5, '2011-05-17 00:00:00', 9, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (959, 3, '2011-06-25 00:00:00', 37, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (959, 4, '2011-06-25 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (959, 5, '2011-06-25 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (959, 6, '2011-06-25 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (968, 3, '2011-06-28 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (968, 4, '2011-06-28 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (968, 5, '2011-06-28 00:00:00', 9, 140, 5, NULL);
INSERT INTO storage.base_operations VALUES (968, 6, '2011-06-28 00:00:00', 62, 140, -5, NULL);
INSERT INTO storage.base_operations VALUES (1185, 6, '2011-05-17 00:00:00', 378, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1281, 1, '2011-07-06 00:00:00', 35, 87, -161, NULL);
INSERT INTO storage.base_operations VALUES (1226, 3, '2011-05-30 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1226, 4, '2011-05-30 00:00:00', 375, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1226, 5, '2011-05-30 00:00:00', 9, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1226, 6, '2011-05-30 00:00:00', 375, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1232, 100, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (749, 100, '2011-05-05 00:00:00', 12, 113, -30, NULL);
INSERT INTO storage.base_operations VALUES (749, 101, '2011-05-05 00:00:00', 12, 121, -30, NULL);
INSERT INTO storage.base_operations VALUES (749, 102, '2011-05-05 00:00:00', 12, 126, -30, NULL);
INSERT INTO storage.base_operations VALUES (749, 103, '2011-05-05 00:00:00', 12, 125, -30, NULL);
INSERT INTO storage.base_operations VALUES (749, 104, '2011-05-05 00:00:00', 12, 88, -30, NULL);
INSERT INTO storage.base_operations VALUES (749, 1, '2011-05-05 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (749, 0, '2011-05-05 00:00:00', 358, 186, 30, NULL);
INSERT INTO storage.base_operations VALUES (749, 3, '2011-05-05 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (749, 4, '2011-05-05 00:00:00', 358, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (749, 5, '2011-05-05 00:00:00', 9, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (749, 6, '2011-05-05 00:00:00', 358, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (750, 100, '2011-05-05 00:00:00', 12, 125, -40, NULL);
INSERT INTO storage.base_operations VALUES (750, 101, '2011-05-05 00:00:00', 12, 126, -40, NULL);
INSERT INTO storage.base_operations VALUES (750, 102, '2011-05-05 00:00:00', 12, 121, -40, NULL);
INSERT INTO storage.base_operations VALUES (750, 103, '2011-05-05 00:00:00', 12, 114, -40, NULL);
INSERT INTO storage.base_operations VALUES (750, 104, '2011-05-05 00:00:00', 12, 89, -40, NULL);
INSERT INTO storage.base_operations VALUES (750, 1, '2011-05-05 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (750, 0, '2011-05-05 00:00:00', 358, 205, 40, NULL);
INSERT INTO storage.base_operations VALUES (750, 3, '2011-05-05 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (750, 4, '2011-05-05 00:00:00', 358, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (750, 5, '2011-05-05 00:00:00', 9, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1006, 1, '2011-07-01 00:00:00', 38, 87, -285, NULL);
INSERT INTO storage.base_operations VALUES (1006, 0, '2011-07-01 00:00:00', 62, 87, 285, NULL);
INSERT INTO storage.base_operations VALUES (1006, 3, '2011-07-01 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1006, 4, '2011-07-01 00:00:00', 62, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1006, 5, '2011-07-01 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1006, 6, '2011-07-01 00:00:00', 62, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1018, 1, '2011-07-02 00:00:00', 37, 86, -90, NULL);
INSERT INTO storage.base_operations VALUES (1018, 0, '2011-07-02 00:00:00', 38, 86, 90, NULL);
INSERT INTO storage.base_operations VALUES (1018, 3, '2011-07-02 00:00:00', 37, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1018, 4, '2011-07-02 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1018, 5, '2011-07-02 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1018, 6, '2011-07-02 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (750, 6, '2011-05-05 00:00:00', 358, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (751, 100, '2011-05-05 00:00:00', 12, 115, -40, NULL);
INSERT INTO storage.base_operations VALUES (751, 101, '2011-05-05 00:00:00', 12, 125, -40, NULL);
INSERT INTO storage.base_operations VALUES (751, 102, '2011-05-05 00:00:00', 12, 121, -40, NULL);
INSERT INTO storage.base_operations VALUES (751, 103, '2011-05-05 00:00:00', 12, 126, -40, NULL);
INSERT INTO storage.base_operations VALUES (751, 104, '2011-05-05 00:00:00', 12, 90, -40, NULL);
INSERT INTO storage.base_operations VALUES (751, 1, '2011-05-05 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (751, 0, '2011-05-05 00:00:00', 358, 210, 40, NULL);
INSERT INTO storage.base_operations VALUES (751, 3, '2011-05-05 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (751, 4, '2011-05-05 00:00:00', 358, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (751, 5, '2011-05-05 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (751, 6, '2011-05-05 00:00:00', 358, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (752, 100, '2011-05-05 00:00:00', 12, 125, -30, NULL);
INSERT INTO storage.base_operations VALUES (752, 101, '2011-05-05 00:00:00', 12, 126, -30, NULL);
INSERT INTO storage.base_operations VALUES (752, 102, '2011-05-05 00:00:00', 12, 91, -30, NULL);
INSERT INTO storage.base_operations VALUES (752, 103, '2011-05-05 00:00:00', 12, 121, -30, NULL);
INSERT INTO storage.base_operations VALUES (752, 104, '2011-05-05 00:00:00', 12, 116, -30, NULL);
INSERT INTO storage.base_operations VALUES (752, 1, '2011-05-05 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (752, 0, '2011-05-05 00:00:00', 358, 217, 30, NULL);
INSERT INTO storage.base_operations VALUES (752, 3, '2011-05-05 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (752, 4, '2011-05-05 00:00:00', 358, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (752, 5, '2011-05-05 00:00:00', 9, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (752, 6, '2011-05-05 00:00:00', 358, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (753, 100, '2011-05-05 00:00:00', 12, 84, -40, NULL);
INSERT INTO storage.base_operations VALUES (753, 101, '2011-05-05 00:00:00', 12, 125, -40, NULL);
INSERT INTO storage.base_operations VALUES (753, 102, '2011-05-05 00:00:00', 12, 126, -40, NULL);
INSERT INTO storage.base_operations VALUES (753, 103, '2011-05-05 00:00:00', 12, 121, -40, NULL);
INSERT INTO storage.base_operations VALUES (753, 1, '2011-05-05 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (753, 0, '2011-05-05 00:00:00', 358, 280, 40, NULL);
INSERT INTO storage.base_operations VALUES (753, 3, '2011-05-05 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (753, 4, '2011-05-05 00:00:00', 358, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (753, 5, '2011-05-05 00:00:00', 9, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (753, 6, '2011-05-05 00:00:00', 358, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (754, 100, '2011-05-05 00:00:00', 12, 85, -40, NULL);
INSERT INTO storage.base_operations VALUES (754, 101, '2011-05-05 00:00:00', 12, 125, -40, NULL);
INSERT INTO storage.base_operations VALUES (754, 102, '2011-05-05 00:00:00', 12, 126, -40, NULL);
INSERT INTO storage.base_operations VALUES (754, 103, '2011-05-05 00:00:00', 12, 121, -40, NULL);
INSERT INTO storage.base_operations VALUES (754, 1, '2011-05-05 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (754, 0, '2011-05-05 00:00:00', 358, 285, 40, NULL);
INSERT INTO storage.base_operations VALUES (754, 3, '2011-05-05 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (754, 4, '2011-05-05 00:00:00', 358, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (754, 5, '2011-05-05 00:00:00', 9, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (754, 6, '2011-05-05 00:00:00', 358, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (755, 100, '2011-05-05 00:00:00', 12, 86, -32, NULL);
INSERT INTO storage.base_operations VALUES (755, 101, '2011-05-05 00:00:00', 12, 125, -32, NULL);
INSERT INTO storage.base_operations VALUES (755, 102, '2011-05-05 00:00:00', 12, 121, -32, NULL);
INSERT INTO storage.base_operations VALUES (755, 103, '2011-05-05 00:00:00', 12, 126, -32, NULL);
INSERT INTO storage.base_operations VALUES (755, 1, '2011-05-05 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (755, 0, '2011-05-05 00:00:00', 358, 290, 32, NULL);
INSERT INTO storage.base_operations VALUES (755, 3, '2011-05-05 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (755, 4, '2011-05-05 00:00:00', 358, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (755, 5, '2011-05-05 00:00:00', 9, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (755, 6, '2011-05-05 00:00:00', 358, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (756, 100, '2011-05-05 00:00:00', 12, 87, -32, NULL);
INSERT INTO storage.base_operations VALUES (756, 101, '2011-05-05 00:00:00', 12, 125, -32, NULL);
INSERT INTO storage.base_operations VALUES (756, 102, '2011-05-05 00:00:00', 12, 121, -32, NULL);
INSERT INTO storage.base_operations VALUES (756, 103, '2011-05-05 00:00:00', 12, 126, -32, NULL);
INSERT INTO storage.base_operations VALUES (756, 1, '2011-05-05 00:00:00', 12, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (756, 0, '2011-05-05 00:00:00', 358, 295, 32, NULL);
INSERT INTO storage.base_operations VALUES (756, 3, '2011-05-05 00:00:00', 12, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (756, 4, '2011-05-05 00:00:00', 358, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (756, 5, '2011-05-05 00:00:00', 9, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (756, 6, '2011-05-05 00:00:00', 358, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (1281, 0, '2011-07-06 00:00:00', 83, 87, 161, NULL);
INSERT INTO storage.base_operations VALUES (1281, 3, '2011-07-06 00:00:00', 35, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1281, 4, '2011-07-06 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1281, 5, '2011-07-06 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1281, 6, '2011-07-06 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1282, 1, '2011-07-06 00:00:00', 83, 84, -72, NULL);
INSERT INTO storage.base_operations VALUES (1282, 0, '2011-07-06 00:00:00', 30, 84, 72, NULL);
INSERT INTO storage.base_operations VALUES (1282, 3, '2011-07-06 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1282, 4, '2011-07-06 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1282, 5, '2011-07-06 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1282, 6, '2011-07-06 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1067, 0, '2011-06-15 00:00:00', 373, 347, 20, NULL);
INSERT INTO storage.base_operations VALUES (1067, 3, '2011-06-15 00:00:00', 12, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (1067, 4, '2011-06-15 00:00:00', 373, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (808, 100, '2011-06-29 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (808, 101, '2011-06-29 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (808, 102, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (808, 103, '2011-06-29 00:00:00', 12, 88, -2, NULL);
INSERT INTO storage.base_operations VALUES (808, 1, '2011-06-29 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (808, 0, '2011-06-29 00:00:00', 356, 176, 2, NULL);
INSERT INTO storage.base_operations VALUES (808, 3, '2011-06-29 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (808, 4, '2011-06-29 00:00:00', 356, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (808, 5, '2011-06-29 00:00:00', 9, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (808, 6, '2011-06-29 00:00:00', 356, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (811, 100, '2011-06-29 00:00:00', 12, 140, -1, NULL);
INSERT INTO storage.base_operations VALUES (811, 101, '2011-06-29 00:00:00', 12, 112, -1, NULL);
INSERT INTO storage.base_operations VALUES (811, 1, '2011-06-29 00:00:00', 12, 324, 0, NULL);
INSERT INTO storage.base_operations VALUES (811, 0, '2011-06-29 00:00:00', 356, 324, 1, NULL);
INSERT INTO storage.base_operations VALUES (811, 3, '2011-06-29 00:00:00', 12, 324, 0, NULL);
INSERT INTO storage.base_operations VALUES (811, 4, '2011-06-29 00:00:00', 356, 324, 0, NULL);
INSERT INTO storage.base_operations VALUES (811, 5, '2011-06-29 00:00:00', 9, 324, 0, NULL);
INSERT INTO storage.base_operations VALUES (811, 6, '2011-06-29 00:00:00', 356, 324, 0, NULL);
INSERT INTO storage.base_operations VALUES (1067, 5, '2011-06-15 00:00:00', 9, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (1067, 6, '2011-06-15 00:00:00', 373, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (1283, 1, '2011-07-06 00:00:00', 83, 87, -161, NULL);
INSERT INTO storage.base_operations VALUES (1283, 0, '2011-07-06 00:00:00', 30, 87, 161, NULL);
INSERT INTO storage.base_operations VALUES (1283, 3, '2011-07-06 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1283, 4, '2011-07-06 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1283, 5, '2011-07-06 00:00:00', 9, 87, 1, NULL);
INSERT INTO storage.base_operations VALUES (1283, 6, '2011-07-06 00:00:00', 30, 87, -1, NULL);
INSERT INTO storage.base_operations VALUES (1284, 1, '2011-07-06 00:00:00', 30, 84, -72, NULL);
INSERT INTO storage.base_operations VALUES (1284, 0, '2011-07-06 00:00:00', 61, 84, 72, NULL);
INSERT INTO storage.base_operations VALUES (1284, 3, '2011-07-06 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1284, 4, '2011-07-06 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (767, 1, '2011-05-05 00:00:00', 12, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (767, 0, '2011-05-05 00:00:00', 354, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (767, 3, '2011-05-05 00:00:00', 12, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (767, 4, '2011-05-05 00:00:00', 354, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (767, 5, '2011-05-05 00:00:00', 9, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (767, 6, '2011-05-05 00:00:00', 354, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (759, 100, '2011-05-05 00:00:00', 12, 113, -24, NULL);
INSERT INTO storage.base_operations VALUES (759, 101, '2011-05-05 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (759, 102, '2011-05-05 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (759, 103, '2011-05-05 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (759, 104, '2011-05-05 00:00:00', 12, 88, -24, NULL);
INSERT INTO storage.base_operations VALUES (759, 1, '2011-05-05 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (759, 0, '2011-05-05 00:00:00', 354, 186, 24, NULL);
INSERT INTO storage.base_operations VALUES (759, 3, '2011-05-05 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (759, 4, '2011-05-05 00:00:00', 354, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (759, 5, '2011-05-05 00:00:00', 9, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (759, 6, '2011-05-05 00:00:00', 354, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (765, 100, '2011-05-05 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (765, 101, '2011-05-05 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (765, 102, '2011-05-05 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (765, 103, '2011-05-05 00:00:00', 12, 114, -24, NULL);
INSERT INTO storage.base_operations VALUES (765, 104, '2011-05-05 00:00:00', 12, 89, -24, NULL);
INSERT INTO storage.base_operations VALUES (765, 1, '2011-05-05 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (765, 0, '2011-05-05 00:00:00', 354, 205, 24, NULL);
INSERT INTO storage.base_operations VALUES (765, 3, '2011-05-05 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (765, 4, '2011-05-05 00:00:00', 354, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (765, 5, '2011-05-05 00:00:00', 9, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (765, 6, '2011-05-05 00:00:00', 354, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (760, 100, '2011-05-05 00:00:00', 12, 115, -30, NULL);
INSERT INTO storage.base_operations VALUES (760, 101, '2011-05-05 00:00:00', 12, 125, -30, NULL);
INSERT INTO storage.base_operations VALUES (760, 102, '2011-05-05 00:00:00', 12, 121, -30, NULL);
INSERT INTO storage.base_operations VALUES (760, 103, '2011-05-05 00:00:00', 12, 126, -30, NULL);
INSERT INTO storage.base_operations VALUES (760, 104, '2011-05-05 00:00:00', 12, 90, -30, NULL);
INSERT INTO storage.base_operations VALUES (760, 1, '2011-05-05 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (760, 0, '2011-05-05 00:00:00', 354, 210, 30, NULL);
INSERT INTO storage.base_operations VALUES (760, 3, '2011-05-05 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (760, 4, '2011-05-05 00:00:00', 354, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (760, 5, '2011-05-05 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (760, 6, '2011-05-05 00:00:00', 354, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (761, 100, '2011-05-05 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (761, 101, '2011-05-05 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (761, 102, '2011-05-05 00:00:00', 12, 91, -24, NULL);
INSERT INTO storage.base_operations VALUES (761, 103, '2011-05-05 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (761, 104, '2011-05-05 00:00:00', 12, 116, -24, NULL);
INSERT INTO storage.base_operations VALUES (761, 1, '2011-05-05 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (761, 0, '2011-05-05 00:00:00', 354, 217, 24, NULL);
INSERT INTO storage.base_operations VALUES (761, 3, '2011-05-05 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (761, 4, '2011-05-05 00:00:00', 354, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (761, 5, '2011-05-05 00:00:00', 9, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (761, 6, '2011-05-05 00:00:00', 354, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (762, 100, '2011-05-05 00:00:00', 12, 84, -24, NULL);
INSERT INTO storage.base_operations VALUES (762, 101, '2011-05-05 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (762, 102, '2011-05-05 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (762, 103, '2011-05-05 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (762, 1, '2011-05-05 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (762, 0, '2011-05-05 00:00:00', 354, 280, 24, NULL);
INSERT INTO storage.base_operations VALUES (762, 3, '2011-05-05 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (762, 4, '2011-05-05 00:00:00', 354, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (762, 5, '2011-05-05 00:00:00', 9, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (762, 6, '2011-05-05 00:00:00', 354, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (766, 100, '2011-05-05 00:00:00', 12, 85, -24, NULL);
INSERT INTO storage.base_operations VALUES (766, 101, '2011-05-05 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (766, 102, '2011-05-05 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (766, 103, '2011-05-05 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (766, 1, '2011-05-05 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (766, 0, '2011-05-05 00:00:00', 354, 285, 24, NULL);
INSERT INTO storage.base_operations VALUES (766, 3, '2011-05-05 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (766, 4, '2011-05-05 00:00:00', 354, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (766, 5, '2011-05-05 00:00:00', 9, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (766, 6, '2011-05-05 00:00:00', 354, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (763, 100, '2011-05-05 00:00:00', 12, 86, -24, NULL);
INSERT INTO storage.base_operations VALUES (763, 101, '2011-05-05 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (763, 102, '2011-05-05 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (763, 103, '2011-05-05 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (763, 1, '2011-05-05 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (763, 0, '2011-05-05 00:00:00', 354, 290, 24, NULL);
INSERT INTO storage.base_operations VALUES (763, 3, '2011-05-05 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (763, 4, '2011-05-05 00:00:00', 354, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (763, 5, '2011-05-05 00:00:00', 9, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (763, 6, '2011-05-05 00:00:00', 354, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (764, 100, '2011-05-05 00:00:00', 12, 87, -24, NULL);
INSERT INTO storage.base_operations VALUES (764, 101, '2011-05-05 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (764, 102, '2011-05-05 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (764, 103, '2011-05-05 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (764, 1, '2011-05-05 00:00:00', 12, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (764, 0, '2011-05-05 00:00:00', 354, 295, 24, NULL);
INSERT INTO storage.base_operations VALUES (764, 3, '2011-05-05 00:00:00', 12, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (764, 4, '2011-05-05 00:00:00', 354, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (764, 5, '2011-05-05 00:00:00', 9, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (764, 6, '2011-05-05 00:00:00', 354, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (1284, 5, '2011-07-06 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1068, 100, '2011-06-15 00:00:00', 12, 95, -24, NULL);
INSERT INTO storage.base_operations VALUES (810, 100, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (810, 101, '2011-06-29 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (810, 102, '2011-06-29 00:00:00', 12, 89, -2, NULL);
INSERT INTO storage.base_operations VALUES (810, 103, '2011-06-29 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (810, 1, '2011-06-29 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (810, 0, '2011-06-29 00:00:00', 356, 181, 2, NULL);
INSERT INTO storage.base_operations VALUES (810, 3, '2011-06-29 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (810, 4, '2011-06-29 00:00:00', 356, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (810, 5, '2011-06-29 00:00:00', 9, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (810, 6, '2011-06-29 00:00:00', 356, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (813, 100, '2011-06-29 00:00:00', 12, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (813, 101, '2011-06-29 00:00:00', 12, 143, -1, NULL);
INSERT INTO storage.base_operations VALUES (813, 1, '2011-06-29 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (813, 0, '2011-06-29 00:00:00', 356, 321, 1, NULL);
INSERT INTO storage.base_operations VALUES (813, 3, '2011-06-29 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (813, 4, '2011-06-29 00:00:00', 356, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (813, 5, '2011-06-29 00:00:00', 9, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (813, 6, '2011-06-29 00:00:00', 356, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (950, 1, '2011-06-24 00:00:00', 37, 141, -40, NULL);
INSERT INTO storage.base_operations VALUES (950, 0, '2011-06-24 00:00:00', 38, 141, 40, NULL);
INSERT INTO storage.base_operations VALUES (950, 3, '2011-06-24 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (950, 4, '2011-06-24 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (771, 100, '2011-05-05 00:00:00', 12, 95, -5, NULL);
INSERT INTO storage.base_operations VALUES (771, 101, '2011-05-05 00:00:00', 12, 126, -5, NULL);
INSERT INTO storage.base_operations VALUES (771, 102, '2011-05-05 00:00:00', 12, 121, -5, NULL);
INSERT INTO storage.base_operations VALUES (771, 103, '2011-05-05 00:00:00', 12, 125, -5, NULL);
INSERT INTO storage.base_operations VALUES (771, 104, '2011-05-05 00:00:00', 12, 113, -5, NULL);
INSERT INTO storage.base_operations VALUES (771, 1, '2011-05-05 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (771, 0, '2011-05-05 00:00:00', 356, 256, 5, NULL);
INSERT INTO storage.base_operations VALUES (771, 3, '2011-05-05 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (771, 4, '2011-05-05 00:00:00', 356, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (771, 5, '2011-05-05 00:00:00', 9, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (771, 6, '2011-05-05 00:00:00', 356, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (768, 100, '2011-05-05 00:00:00', 12, 125, -5, NULL);
INSERT INTO storage.base_operations VALUES (768, 101, '2011-05-05 00:00:00', 12, 99, -5, NULL);
INSERT INTO storage.base_operations VALUES (768, 102, '2011-05-05 00:00:00', 12, 114, -5, NULL);
INSERT INTO storage.base_operations VALUES (768, 103, '2011-05-05 00:00:00', 12, 126, -5, NULL);
INSERT INTO storage.base_operations VALUES (768, 104, '2011-05-05 00:00:00', 12, 121, -5, NULL);
INSERT INTO storage.base_operations VALUES (768, 1, '2011-05-05 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (768, 0, '2011-05-05 00:00:00', 356, 262, 5, NULL);
INSERT INTO storage.base_operations VALUES (768, 3, '2011-05-05 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (768, 4, '2011-05-05 00:00:00', 356, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (768, 5, '2011-05-05 00:00:00', 9, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (768, 6, '2011-05-05 00:00:00', 356, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (769, 100, '2011-05-05 00:00:00', 12, 97, -5, NULL);
INSERT INTO storage.base_operations VALUES (769, 101, '2011-05-05 00:00:00', 12, 115, -5, NULL);
INSERT INTO storage.base_operations VALUES (769, 102, '2011-05-05 00:00:00', 12, 125, -5, NULL);
INSERT INTO storage.base_operations VALUES (769, 103, '2011-05-05 00:00:00', 12, 126, -5, NULL);
INSERT INTO storage.base_operations VALUES (769, 104, '2011-05-05 00:00:00', 12, 121, -5, NULL);
INSERT INTO storage.base_operations VALUES (769, 1, '2011-05-05 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (769, 0, '2011-05-05 00:00:00', 356, 268, 5, NULL);
INSERT INTO storage.base_operations VALUES (769, 3, '2011-05-05 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (769, 4, '2011-05-05 00:00:00', 356, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (769, 5, '2011-05-05 00:00:00', 9, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (769, 6, '2011-05-05 00:00:00', 356, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (770, 100, '2011-05-05 00:00:00', 12, 98, -5, NULL);
INSERT INTO storage.base_operations VALUES (770, 101, '2011-05-05 00:00:00', 12, 116, -5, NULL);
INSERT INTO storage.base_operations VALUES (770, 102, '2011-05-05 00:00:00', 12, 125, -5, NULL);
INSERT INTO storage.base_operations VALUES (770, 103, '2011-05-05 00:00:00', 12, 126, -5, NULL);
INSERT INTO storage.base_operations VALUES (770, 104, '2011-05-05 00:00:00', 12, 121, -5, NULL);
INSERT INTO storage.base_operations VALUES (770, 1, '2011-05-05 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (770, 0, '2011-05-05 00:00:00', 356, 274, 5, NULL);
INSERT INTO storage.base_operations VALUES (770, 3, '2011-05-05 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (770, 4, '2011-05-05 00:00:00', 356, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (770, 5, '2011-05-05 00:00:00', 9, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (770, 6, '2011-05-05 00:00:00', 356, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (950, 5, '2011-06-24 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (950, 6, '2011-06-24 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (1068, 101, '2011-06-15 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (1284, 6, '2011-07-06 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1285, 1, '2011-07-06 00:00:00', 30, 87, -160, NULL);
INSERT INTO storage.base_operations VALUES (1285, 0, '2011-07-06 00:00:00', 61, 87, 160, NULL);
INSERT INTO storage.base_operations VALUES (1285, 3, '2011-07-06 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1285, 4, '2011-07-06 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (772, 100, '2011-06-17 00:00:00', 12, 98, -1, NULL);
INSERT INTO storage.base_operations VALUES (772, 101, '2011-06-17 00:00:00', 12, 116, -1, NULL);
INSERT INTO storage.base_operations VALUES (772, 102, '2011-06-17 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (772, 103, '2011-06-17 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (772, 104, '2011-06-17 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (772, 1, '2011-06-17 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (772, 0, '2011-06-17 00:00:00', 362, 274, 1, NULL);
INSERT INTO storage.base_operations VALUES (772, 3, '2011-06-17 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (772, 4, '2011-06-17 00:00:00', 362, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (772, 5, '2011-06-17 00:00:00', 9, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (772, 6, '2011-06-17 00:00:00', 362, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1227, 100, '2011-05-30 00:00:00', 12, 95, -1, NULL);
INSERT INTO storage.base_operations VALUES (1227, 101, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1227, 102, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1227, 103, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1227, 1, '2011-05-30 00:00:00', 12, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1227, 0, '2011-05-30 00:00:00', 375, 236, 1, NULL);
INSERT INTO storage.base_operations VALUES (940, 1, '2011-06-22 00:00:00', 38, 140, -51, NULL);
INSERT INTO storage.base_operations VALUES (940, 0, '2011-06-22 00:00:00', 62, 140, 51, NULL);
INSERT INTO storage.base_operations VALUES (940, 3, '2011-06-22 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (940, 4, '2011-06-22 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (940, 5, '2011-06-22 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (775, 100, '2011-06-15 00:00:00', 12, 141, -7, NULL);
INSERT INTO storage.base_operations VALUES (775, 101, '2011-06-15 00:00:00', 12, 114, -7, NULL);
INSERT INTO storage.base_operations VALUES (775, 1, '2011-06-15 00:00:00', 12, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (775, 0, '2011-06-15 00:00:00', 361, 233, 7, NULL);
INSERT INTO storage.base_operations VALUES (775, 3, '2011-06-15 00:00:00', 12, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (775, 4, '2011-06-15 00:00:00', 361, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (775, 5, '2011-06-15 00:00:00', 9, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (775, 6, '2011-06-15 00:00:00', 361, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (774, 100, '2011-06-15 00:00:00', 12, 98, -1, NULL);
INSERT INTO storage.base_operations VALUES (774, 101, '2011-06-15 00:00:00', 12, 116, -1, NULL);
INSERT INTO storage.base_operations VALUES (774, 102, '2011-06-15 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (774, 103, '2011-06-15 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (774, 104, '2011-06-15 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (774, 1, '2011-06-15 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (774, 0, '2011-06-15 00:00:00', 361, 274, 1, NULL);
INSERT INTO storage.base_operations VALUES (774, 3, '2011-06-15 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (774, 4, '2011-06-15 00:00:00', 361, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (774, 5, '2011-06-15 00:00:00', 9, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (774, 6, '2011-06-15 00:00:00', 361, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (940, 6, '2011-06-22 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (977, 1, '2011-06-30 00:00:00', 83, 87, -92, NULL);
INSERT INTO storage.base_operations VALUES (977, 0, '2011-06-30 00:00:00', 30, 87, 92, NULL);
INSERT INTO storage.base_operations VALUES (977, 3, '2011-06-30 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (977, 4, '2011-06-30 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (977, 5, '2011-06-30 00:00:00', 9, 87, 1, NULL);
INSERT INTO storage.base_operations VALUES (977, 6, '2011-06-30 00:00:00', 30, 87, -1, NULL);
INSERT INTO storage.base_operations VALUES (985, 1, '2011-07-01 00:00:00', 37, 86, -37, NULL);
INSERT INTO storage.base_operations VALUES (985, 0, '2011-07-01 00:00:00', 38, 86, 37, NULL);
INSERT INTO storage.base_operations VALUES (985, 3, '2011-07-01 00:00:00', 37, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (985, 4, '2011-07-01 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (985, 5, '2011-07-01 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (985, 6, '2011-07-01 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (993, 1, '2011-07-01 00:00:00', 30, 84, -94, NULL);
INSERT INTO storage.base_operations VALUES (779, 100, '2011-06-27 00:00:00', 12, 141, -5, NULL);
INSERT INTO storage.base_operations VALUES (779, 101, '2011-06-27 00:00:00', 12, 143, -5, NULL);
INSERT INTO storage.base_operations VALUES (779, 1, '2011-06-27 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (779, 0, '2011-06-27 00:00:00', 360, 321, 5, NULL);
INSERT INTO storage.base_operations VALUES (779, 3, '2011-06-27 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (779, 4, '2011-06-27 00:00:00', 360, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (779, 5, '2011-06-27 00:00:00', 9, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (779, 6, '2011-06-27 00:00:00', 360, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (776, 100, '2011-06-27 00:00:00', 12, 140, -5, NULL);
INSERT INTO storage.base_operations VALUES (776, 101, '2011-06-27 00:00:00', 12, 142, -5, NULL);
INSERT INTO storage.base_operations VALUES (776, 1, '2011-06-27 00:00:00', 12, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (776, 0, '2011-06-27 00:00:00', 360, 318, 5, NULL);
INSERT INTO storage.base_operations VALUES (776, 3, '2011-06-27 00:00:00', 12, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (776, 4, '2011-06-27 00:00:00', 360, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (776, 5, '2011-06-27 00:00:00', 9, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (776, 6, '2011-06-27 00:00:00', 360, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (780, 100, '2011-06-27 00:00:00', 12, 85, -5, NULL);
INSERT INTO storage.base_operations VALUES (780, 101, '2011-06-27 00:00:00', 12, 125, -5, NULL);
INSERT INTO storage.base_operations VALUES (780, 102, '2011-06-27 00:00:00', 12, 126, -5, NULL);
INSERT INTO storage.base_operations VALUES (780, 103, '2011-06-27 00:00:00', 12, 121, -5, NULL);
INSERT INTO storage.base_operations VALUES (780, 1, '2011-06-27 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (780, 0, '2011-06-27 00:00:00', 360, 285, 5, NULL);
INSERT INTO storage.base_operations VALUES (780, 3, '2011-06-27 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (780, 4, '2011-06-27 00:00:00', 360, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (780, 5, '2011-06-27 00:00:00', 9, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (780, 6, '2011-06-27 00:00:00', 360, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (777, 100, '2011-06-27 00:00:00', 12, 84, -5, NULL);
INSERT INTO storage.base_operations VALUES (777, 101, '2011-06-27 00:00:00', 12, 125, -5, NULL);
INSERT INTO storage.base_operations VALUES (777, 102, '2011-06-27 00:00:00', 12, 126, -5, NULL);
INSERT INTO storage.base_operations VALUES (777, 103, '2011-06-27 00:00:00', 12, 121, -5, NULL);
INSERT INTO storage.base_operations VALUES (777, 1, '2011-06-27 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (777, 0, '2011-06-27 00:00:00', 360, 280, 5, NULL);
INSERT INTO storage.base_operations VALUES (777, 3, '2011-06-27 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (777, 4, '2011-06-27 00:00:00', 360, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (777, 5, '2011-06-27 00:00:00', 9, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (777, 6, '2011-06-27 00:00:00', 360, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (778, 100, '2011-06-27 00:00:00', 12, 86, -5, NULL);
INSERT INTO storage.base_operations VALUES (778, 101, '2011-06-27 00:00:00', 12, 125, -5, NULL);
INSERT INTO storage.base_operations VALUES (778, 102, '2011-06-27 00:00:00', 12, 121, -5, NULL);
INSERT INTO storage.base_operations VALUES (778, 103, '2011-06-27 00:00:00', 12, 126, -5, NULL);
INSERT INTO storage.base_operations VALUES (778, 1, '2011-06-27 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (778, 0, '2011-06-27 00:00:00', 360, 290, 5, NULL);
INSERT INTO storage.base_operations VALUES (778, 3, '2011-06-27 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (778, 4, '2011-06-27 00:00:00', 360, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (778, 5, '2011-06-27 00:00:00', 9, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (778, 6, '2011-06-27 00:00:00', 360, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (993, 0, '2011-07-01 00:00:00', 61, 84, 94, NULL);
INSERT INTO storage.base_operations VALUES (993, 3, '2011-07-01 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (993, 4, '2011-07-01 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (993, 5, '2011-07-01 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (993, 6, '2011-07-01 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1000, 1, '2011-07-01 00:00:00', 37, 86, -54, NULL);
INSERT INTO storage.base_operations VALUES (1000, 0, '2011-07-01 00:00:00', 38, 86, 54, NULL);
INSERT INTO storage.base_operations VALUES (1000, 3, '2011-07-01 00:00:00', 37, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1000, 4, '2011-07-01 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1000, 5, '2011-07-01 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1000, 6, '2011-07-01 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1068, 102, '2011-06-15 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (1285, 5, '2011-07-06 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1285, 6, '2011-07-06 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1286, 1, '2011-07-06 00:00:00', 61, 84, -72, NULL);
INSERT INTO storage.base_operations VALUES (1286, 0, '2011-07-06 00:00:00', 37, 84, 72, NULL);
INSERT INTO storage.base_operations VALUES (1286, 3, '2011-07-06 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1286, 4, '2011-07-06 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1286, 5, '2011-07-06 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1286, 6, '2011-07-06 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1287, 1, '2011-07-06 00:00:00', 61, 87, -160, NULL);
INSERT INTO storage.base_operations VALUES (1287, 0, '2011-07-06 00:00:00', 37, 87, 160, NULL);
INSERT INTO storage.base_operations VALUES (1287, 3, '2011-07-06 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1068, 103, '2011-06-15 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (1068, 1, '2011-06-15 00:00:00', 12, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1068, 0, '2011-06-15 00:00:00', 373, 236, 24, NULL);
INSERT INTO storage.base_operations VALUES (1068, 3, '2011-06-15 00:00:00', 12, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1068, 4, '2011-06-15 00:00:00', 373, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (812, 100, '2011-06-29 00:00:00', 12, 90, -2, NULL);
INSERT INTO storage.base_operations VALUES (812, 101, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (812, 102, '2011-06-29 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (812, 103, '2011-06-29 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (812, 1, '2011-06-29 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (812, 0, '2011-06-29 00:00:00', 356, 195, 2, NULL);
INSERT INTO storage.base_operations VALUES (812, 3, '2011-06-29 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (812, 4, '2011-06-29 00:00:00', 356, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (812, 5, '2011-06-29 00:00:00', 9, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (812, 6, '2011-06-29 00:00:00', 356, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (815, 100, '2011-06-29 00:00:00', 12, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (815, 101, '2011-06-29 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (815, 1, '2011-06-29 00:00:00', 12, 327, 0, NULL);
INSERT INTO storage.base_operations VALUES (815, 0, '2011-06-29 00:00:00', 356, 327, 1, NULL);
INSERT INTO storage.base_operations VALUES (815, 3, '2011-06-29 00:00:00', 12, 327, 0, NULL);
INSERT INTO storage.base_operations VALUES (815, 4, '2011-06-29 00:00:00', 356, 327, 0, NULL);
INSERT INTO storage.base_operations VALUES (815, 5, '2011-06-29 00:00:00', 9, 327, 0, NULL);
INSERT INTO storage.base_operations VALUES (815, 6, '2011-06-29 00:00:00', 356, 327, 0, NULL);
INSERT INTO storage.base_operations VALUES (951, 1, '2011-06-24 00:00:00', 38, 141, -40, NULL);
INSERT INTO storage.base_operations VALUES (951, 0, '2011-06-24 00:00:00', 62, 141, 40, NULL);
INSERT INTO storage.base_operations VALUES (951, 3, '2011-06-24 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (951, 4, '2011-06-24 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (951, 5, '2011-06-24 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (951, 6, '2011-06-24 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (960, 1, '2011-06-26 00:00:00', 38, 142, -86, NULL);
INSERT INTO storage.base_operations VALUES (960, 0, '2011-06-26 00:00:00', 62, 142, 86, NULL);
INSERT INTO storage.base_operations VALUES (960, 3, '2011-06-26 00:00:00', 38, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (960, 4, '2011-06-26 00:00:00', 62, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (960, 5, '2011-06-26 00:00:00', 9, 142, 1, NULL);
INSERT INTO storage.base_operations VALUES (960, 6, '2011-06-26 00:00:00', 62, 142, -1, NULL);
INSERT INTO storage.base_operations VALUES (969, 1, '2011-06-28 00:00:00', 62, 140, -111, NULL);
INSERT INTO storage.base_operations VALUES (969, 0, '2011-06-28 00:00:00', 8, 140, 111, NULL);
INSERT INTO storage.base_operations VALUES (969, 3, '2011-06-28 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (969, 4, '2011-06-28 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (969, 5, '2011-06-28 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (1287, 4, '2011-07-06 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1287, 5, '2011-07-06 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1287, 6, '2011-07-06 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1288, 1, '2011-07-06 00:00:00', 37, 87, -160, NULL);
INSERT INTO storage.base_operations VALUES (1288, 0, '2011-07-06 00:00:00', 38, 87, 160, NULL);
INSERT INTO storage.base_operations VALUES (1288, 3, '2011-07-06 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1288, 4, '2011-07-06 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1288, 5, '2011-07-06 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1288, 6, '2011-07-06 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1266, 1, '2011-07-05 00:00:00', 38, 84, -149, NULL);
INSERT INTO storage.base_operations VALUES (1266, 0, '2011-07-05 00:00:00', 62, 84, 149, NULL);
INSERT INTO storage.base_operations VALUES (969, 6, '2011-06-28 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (1266, 3, '2011-07-05 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1266, 4, '2011-07-05 00:00:00', 62, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1266, 5, '2011-07-05 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1266, 6, '2011-07-05 00:00:00', 62, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1267, 1, '2011-07-05 00:00:00', 38, 87, -322, NULL);
INSERT INTO storage.base_operations VALUES (1227, 3, '2011-05-30 00:00:00', 12, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1227, 4, '2011-05-30 00:00:00', 375, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1227, 5, '2011-05-30 00:00:00', 9, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1227, 6, '2011-05-30 00:00:00', 375, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1232, 101, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1232, 102, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1232, 103, '2011-05-30 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (1232, 104, '2011-05-30 00:00:00', 12, 89, -1, NULL);
INSERT INTO storage.base_operations VALUES (1232, 1, '2011-05-30 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1232, 0, '2011-05-30 00:00:00', 375, 205, 1, NULL);
INSERT INTO storage.base_operations VALUES (1232, 3, '2011-05-30 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1232, 4, '2011-05-30 00:00:00', 375, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1232, 5, '2011-05-30 00:00:00', 9, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1232, 6, '2011-05-30 00:00:00', 375, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1236, 100, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1236, 101, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1236, 102, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1236, 103, '2011-05-30 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (1236, 104, '2011-05-30 00:00:00', 12, 89, -1, NULL);
INSERT INTO storage.base_operations VALUES (1236, 1, '2011-05-30 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1013, 1, '2011-07-02 00:00:00', 37, 84, -118, NULL);
INSERT INTO storage.base_operations VALUES (1013, 0, '2011-07-02 00:00:00', 38, 84, 118, NULL);
INSERT INTO storage.base_operations VALUES (1013, 3, '2011-07-02 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1013, 4, '2011-07-02 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1013, 5, '2011-07-02 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1013, 6, '2011-07-02 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (941, 1, '2011-06-22 00:00:00', 62, 140, -51, NULL);
INSERT INTO storage.base_operations VALUES (941, 0, '2011-06-22 00:00:00', 8, 140, 51, NULL);
INSERT INTO storage.base_operations VALUES (941, 3, '2011-06-22 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (941, 4, '2011-06-22 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (941, 5, '2011-06-22 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (941, 6, '2011-06-22 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (1068, 5, '2011-06-15 00:00:00', 9, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1068, 6, '2011-06-15 00:00:00', 373, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1084, 4, '2011-06-15 00:00:00', 373, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1084, 5, '2011-06-15 00:00:00', 9, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (814, 100, '2011-06-29 00:00:00', 12, 91, -2, NULL);
INSERT INTO storage.base_operations VALUES (814, 101, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (814, 102, '2011-06-29 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (814, 103, '2011-06-29 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (814, 1, '2011-06-29 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (814, 0, '2011-06-29 00:00:00', 356, 200, 2, NULL);
INSERT INTO storage.base_operations VALUES (814, 3, '2011-06-29 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (814, 4, '2011-06-29 00:00:00', 356, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (814, 5, '2011-06-29 00:00:00', 9, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (814, 6, '2011-06-29 00:00:00', 356, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1084, 6, '2011-06-15 00:00:00', 373, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1209, 100, '2011-06-14 00:00:00', 12, 86, -1, NULL);
INSERT INTO storage.base_operations VALUES (1209, 101, '2011-06-14 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1209, 102, '2011-06-14 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1209, 103, '2011-06-14 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1209, 1, '2011-06-14 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1209, 0, '2011-06-14 00:00:00', 378, 290, 1, NULL);
INSERT INTO storage.base_operations VALUES (978, 1, '2011-06-30 00:00:00', 30, 87, -91, NULL);
INSERT INTO storage.base_operations VALUES (978, 0, '2011-06-30 00:00:00', 61, 87, 91, NULL);
INSERT INTO storage.base_operations VALUES (978, 3, '2011-06-30 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (978, 4, '2011-06-30 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1209, 3, '2011-06-14 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1209, 4, '2011-06-14 00:00:00', 378, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1209, 5, '2011-06-14 00:00:00', 9, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1209, 6, '2011-06-14 00:00:00', 378, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1219, 100, '2011-05-30 00:00:00', 12, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (1219, 101, '2011-05-30 00:00:00', 12, 330, -1, NULL);
INSERT INTO storage.base_operations VALUES (1219, 1, '2011-05-30 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1219, 0, '2011-05-30 00:00:00', 380, 230, 1, NULL);
INSERT INTO storage.base_operations VALUES (1219, 3, '2011-05-30 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1219, 4, '2011-05-30 00:00:00', 380, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (978, 5, '2011-06-30 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (978, 6, '2011-06-30 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1219, 5, '2011-05-30 00:00:00', 9, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1219, 6, '2011-05-30 00:00:00', 380, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1222, 100, '2011-05-30 00:00:00', 12, 95, -1, NULL);
INSERT INTO storage.base_operations VALUES (1222, 101, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1222, 102, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1222, 103, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (994, 1, '2011-07-01 00:00:00', 61, 84, -94, NULL);
INSERT INTO storage.base_operations VALUES (994, 0, '2011-07-01 00:00:00', 37, 84, 94, NULL);
INSERT INTO storage.base_operations VALUES (994, 3, '2011-07-01 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (994, 4, '2011-07-01 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1222, 1, '2011-05-30 00:00:00', 12, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1222, 0, '2011-05-30 00:00:00', 375, 236, 1, NULL);
INSERT INTO storage.base_operations VALUES (1222, 3, '2011-05-30 00:00:00', 12, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1222, 4, '2011-05-30 00:00:00', 375, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1222, 5, '2011-05-30 00:00:00', 9, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1222, 6, '2011-05-30 00:00:00', 375, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1236, 0, '2011-05-30 00:00:00', 371, 205, 1, NULL);
INSERT INTO storage.base_operations VALUES (1236, 3, '2011-05-30 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1236, 4, '2011-05-30 00:00:00', 371, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1236, 5, '2011-05-30 00:00:00', 9, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1236, 6, '2011-05-30 00:00:00', 371, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (934, 1, '2011-06-09 00:00:00', 8, 140, -100, NULL);
INSERT INTO storage.base_operations VALUES (934, 0, '2011-06-09 00:00:00', 147, 140, 100, NULL);
INSERT INTO storage.base_operations VALUES (934, 3, '2011-06-09 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (934, 4, '2011-06-09 00:00:00', 147, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (934, 5, '2011-06-09 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (934, 6, '2011-06-09 00:00:00', 147, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (255, -1, '2011-04-18 00:00:00', 12, 97, 509, NULL);
INSERT INTO storage.base_operations VALUES (98, 100, '2011-04-19 00:00:00', 12, 125, -32, NULL);
INSERT INTO storage.base_operations VALUES (98, 101, '2011-04-19 00:00:00', 12, 126, -32, NULL);
INSERT INTO storage.base_operations VALUES (98, 102, '2011-04-19 00:00:00', 12, 89, -32, NULL);
INSERT INTO storage.base_operations VALUES (98, 103, '2011-04-19 00:00:00', 12, 121, -32, NULL);
INSERT INTO storage.base_operations VALUES (98, 1, '2011-04-19 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (994, 5, '2011-07-01 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (994, 6, '2011-07-01 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1001, 1, '2011-07-01 00:00:00', 35, 87, -63, NULL);
INSERT INTO storage.base_operations VALUES (1001, 0, '2011-07-01 00:00:00', 83, 87, 63, NULL);
INSERT INTO storage.base_operations VALUES (1001, 3, '2011-07-01 00:00:00', 35, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1001, 4, '2011-07-01 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1001, 5, '2011-07-01 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1001, 6, '2011-07-01 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1007, 1, '2011-07-01 00:00:00', 62, 87, -285, NULL);
INSERT INTO storage.base_operations VALUES (1007, 0, '2011-07-01 00:00:00', 8, 87, 285, NULL);
INSERT INTO storage.base_operations VALUES (1007, 3, '2011-07-01 00:00:00', 62, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1007, 4, '2011-07-01 00:00:00', 8, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1007, 5, '2011-07-01 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1007, 6, '2011-07-01 00:00:00', 8, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (98, 0, '2011-04-19 00:00:00', 146, 181, 32, NULL);
INSERT INTO storage.base_operations VALUES (98, 3, '2011-04-19 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (98, 4, '2011-04-19 00:00:00', 146, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (98, 5, '2011-04-19 00:00:00', 9, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (98, 6, '2011-04-19 00:00:00', 146, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (92, 101, '2011-04-19 00:00:00', 12, 126, -8, NULL);
INSERT INTO storage.base_operations VALUES (1069, 100, '2011-06-15 00:00:00', 12, 99, -16, NULL);
INSERT INTO storage.base_operations VALUES (1069, 101, '2011-06-15 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (1069, 102, '2011-06-15 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (1069, 103, '2011-06-15 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (1069, 1, '2011-06-15 00:00:00', 12, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (1267, 0, '2011-07-05 00:00:00', 62, 87, 322, NULL);
INSERT INTO storage.base_operations VALUES (952, 1, '2011-06-24 00:00:00', 62, 141, -40, NULL);
INSERT INTO storage.base_operations VALUES (952, 0, '2011-06-24 00:00:00', 8, 141, 40, NULL);
INSERT INTO storage.base_operations VALUES (952, 3, '2011-06-24 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (952, 4, '2011-06-24 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (952, 5, '2011-06-24 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (952, 6, '2011-06-24 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (961, 1, '2011-06-26 00:00:00', 62, 142, -85, NULL);
INSERT INTO storage.base_operations VALUES (961, 0, '2011-06-26 00:00:00', 8, 142, 85, NULL);
INSERT INTO storage.base_operations VALUES (961, 3, '2011-06-26 00:00:00', 62, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (816, 100, '2011-06-29 00:00:00', 12, 84, -2, NULL);
INSERT INTO storage.base_operations VALUES (816, 101, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (816, 102, '2011-06-29 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (816, 103, '2011-06-29 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (816, 1, '2011-06-29 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (816, 0, '2011-06-29 00:00:00', 356, 280, 2, NULL);
INSERT INTO storage.base_operations VALUES (816, 3, '2011-06-29 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (816, 4, '2011-06-29 00:00:00', 356, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (816, 5, '2011-06-29 00:00:00', 9, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (816, 6, '2011-06-29 00:00:00', 356, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (961, 4, '2011-06-26 00:00:00', 8, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (961, 5, '2011-06-26 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (961, 6, '2011-06-26 00:00:00', 8, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (970, 1, '2011-06-28 00:00:00', 30, 140, -15, NULL);
INSERT INTO storage.base_operations VALUES (970, 0, '2011-06-28 00:00:00', 37, 140, 15, NULL);
INSERT INTO storage.base_operations VALUES (970, 3, '2011-06-28 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (970, 4, '2011-06-28 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (970, 5, '2011-06-28 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (970, 6, '2011-06-28 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (1267, 3, '2011-07-05 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1267, 4, '2011-07-05 00:00:00', 62, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1267, 5, '2011-07-05 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1267, 6, '2011-07-05 00:00:00', 62, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1268, 1, '2011-07-05 00:00:00', 62, 84, -149, NULL);
INSERT INTO storage.base_operations VALUES (1191, 1, '2011-05-20 00:00:00', 12, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (1191, 0, '2011-05-20 00:00:00', 379, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (1191, 3, '2011-05-20 00:00:00', 12, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (1191, 4, '2011-05-20 00:00:00', 379, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (1191, 5, '2011-05-20 00:00:00', 9, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (1191, 6, '2011-05-20 00:00:00', 379, NULL, 0, NULL);
INSERT INTO storage.base_operations VALUES (1268, 0, '2011-07-05 00:00:00', 8, 84, 149, NULL);
INSERT INTO storage.base_operations VALUES (1268, 3, '2011-07-05 00:00:00', 62, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1268, 4, '2011-07-05 00:00:00', 8, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1268, 5, '2011-07-05 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1268, 6, '2011-07-05 00:00:00', 8, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1210, 100, '2011-06-14 00:00:00', 12, 85, -1, NULL);
INSERT INTO storage.base_operations VALUES (986, 1, '2011-07-01 00:00:00', 35, 87, -131, NULL);
INSERT INTO storage.base_operations VALUES (986, 0, '2011-07-01 00:00:00', 83, 87, 131, NULL);
INSERT INTO storage.base_operations VALUES (1210, 101, '2011-06-14 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1210, 102, '2011-06-14 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1210, 103, '2011-06-14 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1210, 1, '2011-06-14 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1210, 0, '2011-06-14 00:00:00', 378, 285, 1, NULL);
INSERT INTO storage.base_operations VALUES (1210, 3, '2011-06-14 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1210, 4, '2011-06-14 00:00:00', 378, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1210, 5, '2011-06-14 00:00:00', 9, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1210, 6, '2011-06-14 00:00:00', 378, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1220, 100, '2011-05-30 00:00:00', 12, 98, -1, NULL);
INSERT INTO storage.base_operations VALUES (1220, 101, '2011-05-30 00:00:00', 12, 116, -1, NULL);
INSERT INTO storage.base_operations VALUES (1220, 102, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1220, 103, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1220, 104, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1220, 1, '2011-05-30 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1220, 0, '2011-05-30 00:00:00', 380, 274, 1, NULL);
INSERT INTO storage.base_operations VALUES (1220, 3, '2011-05-30 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1220, 4, '2011-05-30 00:00:00', 380, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1220, 5, '2011-05-30 00:00:00', 9, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1220, 6, '2011-05-30 00:00:00', 380, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1223, 100, '2011-05-30 00:00:00', 12, 97, -1, NULL);
INSERT INTO storage.base_operations VALUES (1223, 101, '2011-05-30 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (1223, 102, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1223, 103, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (986, 3, '2011-07-01 00:00:00', 35, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (986, 4, '2011-07-01 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (986, 5, '2011-07-01 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (986, 6, '2011-07-01 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1026, 1, '2011-07-02 00:00:00', 30, 84, -50, NULL);
INSERT INTO storage.base_operations VALUES (1026, 0, '2011-07-02 00:00:00', 61, 84, 50, NULL);
INSERT INTO storage.base_operations VALUES (1026, 3, '2011-07-02 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1026, 4, '2011-07-02 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1026, 5, '2011-07-02 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1026, 6, '2011-07-02 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1034, 5, '2011-07-02 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1034, 6, '2011-07-02 00:00:00', 37, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1037, 1, '2011-07-02 00:00:00', 83, 87, -41, NULL);
INSERT INTO storage.base_operations VALUES (1037, 0, '2011-07-02 00:00:00', 30, 87, 41, NULL);
INSERT INTO storage.base_operations VALUES (1037, 3, '2011-07-02 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1037, 4, '2011-07-02 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1037, 5, '2011-07-02 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1037, 6, '2011-07-02 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (942, 1, '2011-06-22 00:00:00', 37, 141, -60, NULL);
INSERT INTO storage.base_operations VALUES (942, 0, '2011-06-22 00:00:00', 38, 141, 60, NULL);
INSERT INTO storage.base_operations VALUES (942, 3, '2011-06-22 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (942, 4, '2011-06-22 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (942, 5, '2011-06-22 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (942, 6, '2011-06-22 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (1069, 0, '2011-06-15 00:00:00', 373, 241, 16, NULL);
INSERT INTO storage.base_operations VALUES (1069, 3, '2011-06-15 00:00:00', 12, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (1069, 4, '2011-06-15 00:00:00', 373, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (1069, 5, '2011-06-15 00:00:00', 9, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (1069, 6, '2011-06-15 00:00:00', 373, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (1269, 1, '2011-07-05 00:00:00', 62, 87, -322, NULL);
INSERT INTO storage.base_operations VALUES (1269, 0, '2011-07-05 00:00:00', 8, 87, 322, NULL);
INSERT INTO storage.base_operations VALUES (1269, 3, '2011-07-05 00:00:00', 62, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1269, 4, '2011-07-05 00:00:00', 8, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1269, 5, '2011-07-05 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1186, 100, '2011-05-20 00:00:00', 12, 113, -1, NULL);
INSERT INTO storage.base_operations VALUES (1186, 101, '2011-05-20 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1186, 102, '2011-05-20 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1186, 103, '2011-05-20 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1186, 104, '2011-05-20 00:00:00', 12, 88, -1, NULL);
INSERT INTO storage.base_operations VALUES (1186, 1, '2011-05-20 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1186, 0, '2011-05-20 00:00:00', 379, 186, 1, NULL);
INSERT INTO storage.base_operations VALUES (979, 1, '2011-06-30 00:00:00', 61, 87, -91, NULL);
INSERT INTO storage.base_operations VALUES (979, 0, '2011-06-30 00:00:00', 37, 87, 91, NULL);
INSERT INTO storage.base_operations VALUES (979, 3, '2011-06-30 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (979, 4, '2011-06-30 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (979, 5, '2011-06-30 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (979, 6, '2011-06-30 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (987, 1, '2011-07-01 00:00:00', 83, 87, -131, NULL);
INSERT INTO storage.base_operations VALUES (806, 100, '2011-06-29 00:00:00', 12, 85, -2, NULL);
INSERT INTO storage.base_operations VALUES (806, 101, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (806, 102, '2011-06-29 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (806, 103, '2011-06-29 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (806, 1, '2011-06-29 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (806, 0, '2011-06-29 00:00:00', 356, 285, 2, NULL);
INSERT INTO storage.base_operations VALUES (806, 3, '2011-06-29 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (806, 4, '2011-06-29 00:00:00', 356, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (806, 5, '2011-06-29 00:00:00', 9, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (806, 6, '2011-06-29 00:00:00', 356, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1186, 3, '2011-05-20 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1186, 4, '2011-05-20 00:00:00', 379, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1186, 5, '2011-05-20 00:00:00', 9, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1186, 6, '2011-05-20 00:00:00', 379, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1199, 100, '2011-05-31 00:00:00', 12, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (1199, 101, '2011-05-31 00:00:00', 12, 330, -1, NULL);
INSERT INTO storage.base_operations VALUES (1199, 1, '2011-05-31 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1199, 0, '2011-05-31 00:00:00', 378, 230, 1, NULL);
INSERT INTO storage.base_operations VALUES (1199, 3, '2011-05-31 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1199, 4, '2011-05-31 00:00:00', 378, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1199, 5, '2011-05-31 00:00:00', 9, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1199, 6, '2011-05-31 00:00:00', 378, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1211, 100, '2011-06-14 00:00:00', 12, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (1211, 101, '2011-06-14 00:00:00', 12, 330, -1, NULL);
INSERT INTO storage.base_operations VALUES (1211, 1, '2011-06-14 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1211, 0, '2011-06-14 00:00:00', 378, 230, 1, NULL);
INSERT INTO storage.base_operations VALUES (1211, 3, '2011-06-14 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1211, 4, '2011-06-14 00:00:00', 378, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1211, 5, '2011-06-14 00:00:00', 9, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1211, 6, '2011-06-14 00:00:00', 378, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1221, 100, '2011-05-30 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (1221, 101, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1221, 102, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1221, 103, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1221, 104, '2011-05-30 00:00:00', 12, 90, -1, NULL);
INSERT INTO storage.base_operations VALUES (1221, 1, '2011-05-30 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1221, 0, '2011-05-30 00:00:00', 380, 210, 1, NULL);
INSERT INTO storage.base_operations VALUES (1221, 3, '2011-05-30 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1221, 4, '2011-05-30 00:00:00', 380, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1221, 5, '2011-05-30 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1221, 6, '2011-05-30 00:00:00', 380, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1223, 104, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1223, 1, '2011-05-30 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1223, 0, '2011-05-30 00:00:00', 375, 268, 1, NULL);
INSERT INTO storage.base_operations VALUES (1223, 3, '2011-05-30 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1223, 4, '2011-05-30 00:00:00', 375, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1223, 5, '2011-05-30 00:00:00', 9, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1223, 6, '2011-05-30 00:00:00', 375, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1233, 100, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1233, 101, '2011-05-30 00:00:00', 12, 99, -1, NULL);
INSERT INTO storage.base_operations VALUES (1233, 102, '2011-05-30 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (1233, 103, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1233, 104, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1233, 1, '2011-05-30 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1233, 0, '2011-05-30 00:00:00', 378, 262, 1, NULL);
INSERT INTO storage.base_operations VALUES (1233, 3, '2011-05-30 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1233, 4, '2011-05-30 00:00:00', 378, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1233, 5, '2011-05-30 00:00:00', 9, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1233, 6, '2011-05-30 00:00:00', 378, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1237, 100, '2011-05-30 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (1237, 101, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1237, 102, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1237, 103, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1070, 100, '2011-06-15 00:00:00', 12, 97, -16, NULL);
INSERT INTO storage.base_operations VALUES (1070, 101, '2011-06-15 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (1070, 102, '2011-06-15 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (1070, 103, '2011-06-15 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (1070, 1, '2011-06-15 00:00:00', 12, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (1070, 0, '2011-06-15 00:00:00', 373, 246, 16, NULL);
INSERT INTO storage.base_operations VALUES (1269, 6, '2011-07-05 00:00:00', 8, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1270, 1, '2011-07-06 00:00:00', 35, 84, -63, NULL);
INSERT INTO storage.base_operations VALUES (1270, 0, '2011-07-06 00:00:00', 83, 84, 63, NULL);
INSERT INTO storage.base_operations VALUES (1270, 3, '2011-07-06 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1270, 4, '2011-07-06 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1270, 5, '2011-07-06 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (962, 1, '2011-06-27 00:00:00', 37, 140, -44, NULL);
INSERT INTO storage.base_operations VALUES (962, 0, '2011-06-27 00:00:00', 38, 140, 44, NULL);
INSERT INTO storage.base_operations VALUES (962, 3, '2011-06-27 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (962, 4, '2011-06-27 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (962, 5, '2011-06-27 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (962, 6, '2011-06-27 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (971, 1, '2011-06-28 00:00:00', 37, 140, -70, NULL);
INSERT INTO storage.base_operations VALUES (971, 0, '2011-06-28 00:00:00', 38, 140, 70, NULL);
INSERT INTO storage.base_operations VALUES (971, 3, '2011-06-28 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (971, 4, '2011-06-28 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (971, 5, '2011-06-28 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (971, 6, '2011-06-28 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (1187, 100, '2011-05-20 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (1187, 101, '2011-05-20 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1187, 102, '2011-05-20 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1187, 103, '2011-05-20 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1187, 104, '2011-05-20 00:00:00', 12, 90, -1, NULL);
INSERT INTO storage.base_operations VALUES (1187, 1, '2011-05-20 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (987, 0, '2011-07-01 00:00:00', 30, 87, 131, NULL);
INSERT INTO storage.base_operations VALUES (987, 3, '2011-07-01 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (987, 4, '2011-07-01 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (987, 5, '2011-07-01 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (987, 6, '2011-07-01 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (995, 1, '2011-07-01 00:00:00', 37, 84, -94, NULL);
INSERT INTO storage.base_operations VALUES (995, 0, '2011-07-01 00:00:00', 38, 84, 94, NULL);
INSERT INTO storage.base_operations VALUES (995, 3, '2011-07-01 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (995, 4, '2011-07-01 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (995, 5, '2011-07-01 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (995, 6, '2011-07-01 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1187, 0, '2011-05-20 00:00:00', 379, 210, 1, NULL);
INSERT INTO storage.base_operations VALUES (1187, 3, '2011-05-20 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1187, 4, '2011-05-20 00:00:00', 379, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1187, 5, '2011-05-20 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1187, 6, '2011-05-20 00:00:00', 379, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1200, 100, '2011-05-31 00:00:00', 12, 113, -5, NULL);
INSERT INTO storage.base_operations VALUES (1008, 1, '2011-07-02 00:00:00', 35, 84, -118, NULL);
INSERT INTO storage.base_operations VALUES (1008, 0, '2011-07-02 00:00:00', 83, 84, 118, NULL);
INSERT INTO storage.base_operations VALUES (1008, 3, '2011-07-02 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1008, 4, '2011-07-02 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1008, 5, '2011-07-02 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1008, 6, '2011-07-02 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1014, 1, '2011-07-02 00:00:00', 35, 86, -90, NULL);
INSERT INTO storage.base_operations VALUES (1014, 0, '2011-07-02 00:00:00', 83, 86, 90, NULL);
INSERT INTO storage.base_operations VALUES (1014, 3, '2011-07-02 00:00:00', 35, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1014, 4, '2011-07-02 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1014, 5, '2011-07-02 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1014, 6, '2011-07-02 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1019, 1, '2011-07-02 00:00:00', 35, 87, -82, NULL);
INSERT INTO storage.base_operations VALUES (1019, 0, '2011-07-02 00:00:00', 83, 87, 82, NULL);
INSERT INTO storage.base_operations VALUES (1019, 3, '2011-07-02 00:00:00', 35, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1019, 4, '2011-07-02 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1019, 5, '2011-07-02 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1019, 6, '2011-07-02 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1023, 1, '2011-07-02 00:00:00', 37, 87, -82, NULL);
INSERT INTO storage.base_operations VALUES (1023, 0, '2011-07-02 00:00:00', 38, 87, 82, NULL);
INSERT INTO storage.base_operations VALUES (1200, 101, '2011-05-31 00:00:00', 12, 121, -5, NULL);
INSERT INTO storage.base_operations VALUES (1200, 102, '2011-05-31 00:00:00', 12, 126, -5, NULL);
INSERT INTO storage.base_operations VALUES (1200, 103, '2011-05-31 00:00:00', 12, 125, -5, NULL);
INSERT INTO storage.base_operations VALUES (1200, 104, '2011-05-31 00:00:00', 12, 88, -5, NULL);
INSERT INTO storage.base_operations VALUES (1200, 1, '2011-05-31 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1200, 0, '2011-05-31 00:00:00', 378, 186, 5, NULL);
INSERT INTO storage.base_operations VALUES (1200, 3, '2011-05-31 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1200, 4, '2011-05-31 00:00:00', 378, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1200, 5, '2011-05-31 00:00:00', 9, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1200, 6, '2011-05-31 00:00:00', 378, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1212, 100, '2011-06-14 00:00:00', 12, 119, -1, NULL);
INSERT INTO storage.base_operations VALUES (1212, 101, '2011-06-14 00:00:00', 12, 331, -1, NULL);
INSERT INTO storage.base_operations VALUES (1212, 1, '2011-06-14 00:00:00', 12, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1212, 0, '2011-06-14 00:00:00', 378, 192, 1, NULL);
INSERT INTO storage.base_operations VALUES (1212, 3, '2011-06-14 00:00:00', 12, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1212, 4, '2011-06-14 00:00:00', 378, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1212, 5, '2011-06-14 00:00:00', 9, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1212, 6, '2011-06-14 00:00:00', 378, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1224, 100, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1224, 101, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1224, 102, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1224, 103, '2011-05-30 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (1224, 104, '2011-05-30 00:00:00', 12, 89, -1, NULL);
INSERT INTO storage.base_operations VALUES (1224, 1, '2011-05-30 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1224, 0, '2011-05-30 00:00:00', 375, 205, 1, NULL);
INSERT INTO storage.base_operations VALUES (1224, 3, '2011-05-30 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1224, 4, '2011-05-30 00:00:00', 375, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1224, 5, '2011-05-30 00:00:00', 9, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1224, 6, '2011-05-30 00:00:00', 375, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1270, 6, '2011-07-06 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1271, 1, '2011-07-06 00:00:00', 35, 87, -196, NULL);
INSERT INTO storage.base_operations VALUES (1271, 0, '2011-07-06 00:00:00', 83, 87, 196, NULL);
INSERT INTO storage.base_operations VALUES (1271, 3, '2011-07-06 00:00:00', 35, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1271, 4, '2011-07-06 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1271, 5, '2011-07-06 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1188, 100, '2011-05-20 00:00:00', 12, 91, -1, NULL);
INSERT INTO storage.base_operations VALUES (1188, 101, '2011-05-20 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1188, 102, '2011-05-20 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1188, 103, '2011-05-20 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1188, 1, '2011-05-20 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1188, 0, '2011-05-20 00:00:00', 379, 200, 1, NULL);
INSERT INTO storage.base_operations VALUES (1188, 3, '2011-05-20 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1188, 4, '2011-05-20 00:00:00', 379, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1188, 5, '2011-05-20 00:00:00', 9, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1188, 6, '2011-05-20 00:00:00', 379, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1201, 100, '2011-05-31 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1201, 101, '2011-05-31 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1201, 102, '2011-05-31 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1201, 103, '2011-05-31 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (1201, 104, '2011-05-31 00:00:00', 12, 89, -1, NULL);
INSERT INTO storage.base_operations VALUES (1201, 1, '2011-05-31 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1201, 0, '2011-05-31 00:00:00', 378, 205, 1, NULL);
INSERT INTO storage.base_operations VALUES (1201, 3, '2011-05-31 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1201, 4, '2011-05-31 00:00:00', 378, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1201, 5, '2011-05-31 00:00:00', 9, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1201, 6, '2011-05-31 00:00:00', 378, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1271, 6, '2011-07-06 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1272, 1, '2011-07-06 00:00:00', 83, 84, -63, NULL);
INSERT INTO storage.base_operations VALUES (1272, 0, '2011-07-06 00:00:00', 30, 84, 63, NULL);
INSERT INTO storage.base_operations VALUES (1272, 3, '2011-07-06 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1272, 4, '2011-07-06 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1272, 5, '2011-07-06 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1272, 6, '2011-07-06 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1273, 1, '2011-07-06 00:00:00', 83, 87, -196, NULL);
INSERT INTO storage.base_operations VALUES (1273, 0, '2011-07-06 00:00:00', 30, 87, 196, NULL);
INSERT INTO storage.base_operations VALUES (1273, 3, '2011-07-06 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1273, 4, '2011-07-06 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1273, 5, '2011-07-06 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1273, 6, '2011-07-06 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1275, 1, '2011-07-06 00:00:00', 30, 87, -196, NULL);
INSERT INTO storage.base_operations VALUES (1275, 0, '2011-07-06 00:00:00', 61, 87, 196, NULL);
INSERT INTO storage.base_operations VALUES (1275, 3, '2011-07-06 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1275, 4, '2011-07-06 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1275, 5, '2011-07-06 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1275, 6, '2011-07-06 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1274, 1, '2011-07-06 00:00:00', 30, 84, -63, NULL);
INSERT INTO storage.base_operations VALUES (1274, 0, '2011-07-06 00:00:00', 61, 84, 63, NULL);
INSERT INTO storage.base_operations VALUES (1237, 104, '2011-05-30 00:00:00', 12, 90, -1, NULL);
INSERT INTO storage.base_operations VALUES (1237, 1, '2011-05-30 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1237, 0, '2011-05-30 00:00:00', 371, 210, 1, NULL);
INSERT INTO storage.base_operations VALUES (1237, 3, '2011-05-30 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1237, 4, '2011-05-30 00:00:00', 371, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1237, 5, '2011-05-30 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1237, 6, '2011-05-30 00:00:00', 371, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1240, 1, '2011-06-09 00:00:00', 8, 142, -100, NULL);
INSERT INTO storage.base_operations VALUES (1240, 0, '2011-06-09 00:00:00', 147, 142, 100, NULL);
INSERT INTO storage.base_operations VALUES (1240, 3, '2011-06-09 00:00:00', 8, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (1240, 4, '2011-06-09 00:00:00', 147, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (1240, 5, '2011-06-09 00:00:00', 9, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (1240, 6, '2011-06-09 00:00:00', 147, 142, 0, NULL);
INSERT INTO storage.base_operations VALUES (250, -1, '2011-04-18 00:00:00', 12, 89, 549, NULL);
INSERT INTO storage.base_operations VALUES (99, 100, '2011-04-19 00:00:00', 12, 90, -32, NULL);
INSERT INTO storage.base_operations VALUES (99, 101, '2011-04-19 00:00:00', 12, 125, -32, NULL);
INSERT INTO storage.base_operations VALUES (99, 102, '2011-04-19 00:00:00', 12, 121, -32, NULL);
INSERT INTO storage.base_operations VALUES (99, 103, '2011-04-19 00:00:00', 12, 126, -32, NULL);
INSERT INTO storage.base_operations VALUES (99, 1, '2011-04-19 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (99, 0, '2011-04-19 00:00:00', 146, 195, 32, NULL);
INSERT INTO storage.base_operations VALUES (99, 3, '2011-04-19 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (99, 4, '2011-04-19 00:00:00', 146, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (99, 5, '2011-04-19 00:00:00', 9, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (99, 6, '2011-04-19 00:00:00', 146, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (943, 1, '2011-06-22 00:00:00', 38, 141, -85, NULL);
INSERT INTO storage.base_operations VALUES (943, 0, '2011-06-22 00:00:00', 62, 141, 85, NULL);
INSERT INTO storage.base_operations VALUES (943, 3, '2011-06-22 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (943, 4, '2011-06-22 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (943, 5, '2011-06-22 00:00:00', 9, 141, 5, NULL);
INSERT INTO storage.base_operations VALUES (943, 6, '2011-06-22 00:00:00', 62, 141, -5, NULL);
INSERT INTO storage.base_operations VALUES (953, 1, '2011-06-24 00:00:00', 37, 141, -77, NULL);
INSERT INTO storage.base_operations VALUES (953, 0, '2011-06-24 00:00:00', 38, 141, 77, NULL);
INSERT INTO storage.base_operations VALUES (953, 3, '2011-06-24 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (953, 4, '2011-06-24 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (953, 5, '2011-06-24 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (953, 6, '2011-06-24 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (1070, 3, '2011-06-15 00:00:00', 12, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (1070, 4, '2011-06-15 00:00:00', 373, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (1070, 5, '2011-06-15 00:00:00', 9, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (1070, 6, '2011-06-15 00:00:00', 373, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (1085, 100, '2011-06-15 00:00:00', 12, 141, -15, NULL);
INSERT INTO storage.base_operations VALUES (1085, 101, '2011-06-15 00:00:00', 12, 114, -15, NULL);
INSERT INTO storage.base_operations VALUES (1085, 1, '2011-06-15 00:00:00', 12, 327, 0, NULL);
INSERT INTO storage.base_operations VALUES (1085, 0, '2011-06-15 00:00:00', 373, 327, 15, NULL);
INSERT INTO storage.base_operations VALUES (1085, 3, '2011-06-15 00:00:00', 12, 327, 0, NULL);
INSERT INTO storage.base_operations VALUES (1085, 4, '2011-06-15 00:00:00', 373, 327, 0, NULL);
INSERT INTO storage.base_operations VALUES (92, 102, '2011-04-19 00:00:00', 12, 125, -8, NULL);
INSERT INTO storage.base_operations VALUES (92, 103, '2011-04-19 00:00:00', 12, 121, -8, NULL);
INSERT INTO storage.base_operations VALUES (92, 1, '2011-04-19 00:00:00', 12, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (1071, 100, '2011-06-15 00:00:00', 12, 91, -16, NULL);
INSERT INTO storage.base_operations VALUES (1071, 101, '2011-06-15 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (1071, 102, '2011-06-15 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (1071, 103, '2011-06-15 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (1071, 1, '2011-06-15 00:00:00', 12, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (1071, 0, '2011-06-15 00:00:00', 373, 251, 16, NULL);
INSERT INTO storage.base_operations VALUES (825, 100, '2011-05-20 00:00:00', 12, 126, -8, NULL);
INSERT INTO storage.base_operations VALUES (825, 101, '2011-05-20 00:00:00', 12, 121, -8, NULL);
INSERT INTO storage.base_operations VALUES (825, 102, '2011-05-20 00:00:00', 12, 125, -8, NULL);
INSERT INTO storage.base_operations VALUES (825, 103, '2011-05-20 00:00:00', 12, 88, -8, NULL);
INSERT INTO storage.base_operations VALUES (825, 1, '2011-05-20 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (825, 0, '2011-05-20 00:00:00', 146, 176, 8, NULL);
INSERT INTO storage.base_operations VALUES (825, 3, '2011-05-20 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (825, 4, '2011-05-20 00:00:00', 146, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (825, 5, '2011-05-20 00:00:00', 9, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (825, 6, '2011-05-20 00:00:00', 146, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (822, 100, '2011-05-20 00:00:00', 12, 125, -8, NULL);
INSERT INTO storage.base_operations VALUES (822, 101, '2011-05-20 00:00:00', 12, 126, -8, NULL);
INSERT INTO storage.base_operations VALUES (822, 102, '2011-05-20 00:00:00', 12, 89, -8, NULL);
INSERT INTO storage.base_operations VALUES (822, 103, '2011-05-20 00:00:00', 12, 121, -8, NULL);
INSERT INTO storage.base_operations VALUES (822, 1, '2011-05-20 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (822, 0, '2011-05-20 00:00:00', 146, 181, 8, NULL);
INSERT INTO storage.base_operations VALUES (822, 3, '2011-05-20 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (822, 4, '2011-05-20 00:00:00', 146, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (822, 5, '2011-05-20 00:00:00', 9, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (822, 6, '2011-05-20 00:00:00', 146, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (823, 100, '2011-05-20 00:00:00', 12, 90, -8, NULL);
INSERT INTO storage.base_operations VALUES (823, 101, '2011-05-20 00:00:00', 12, 125, -8, NULL);
INSERT INTO storage.base_operations VALUES (823, 102, '2011-05-20 00:00:00', 12, 121, -8, NULL);
INSERT INTO storage.base_operations VALUES (823, 103, '2011-05-20 00:00:00', 12, 126, -8, NULL);
INSERT INTO storage.base_operations VALUES (823, 1, '2011-05-20 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (823, 0, '2011-05-20 00:00:00', 146, 195, 8, NULL);
INSERT INTO storage.base_operations VALUES (823, 3, '2011-05-20 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (823, 4, '2011-05-20 00:00:00', 146, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (823, 5, '2011-05-20 00:00:00', 9, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (823, 6, '2011-05-20 00:00:00', 146, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (821, 100, '2011-05-20 00:00:00', 12, 84, -56, NULL);
INSERT INTO storage.base_operations VALUES (821, 101, '2011-05-20 00:00:00', 12, 125, -56, NULL);
INSERT INTO storage.base_operations VALUES (821, 102, '2011-05-20 00:00:00', 12, 126, -56, NULL);
INSERT INTO storage.base_operations VALUES (821, 103, '2011-05-20 00:00:00', 12, 121, -56, NULL);
INSERT INTO storage.base_operations VALUES (821, 1, '2011-05-20 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (821, 0, '2011-05-20 00:00:00', 146, 280, 56, NULL);
INSERT INTO storage.base_operations VALUES (821, 3, '2011-05-20 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (821, 4, '2011-05-20 00:00:00', 146, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (821, 5, '2011-05-20 00:00:00', 9, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (821, 6, '2011-05-20 00:00:00', 146, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (824, 100, '2011-05-20 00:00:00', 12, 85, -48, NULL);
INSERT INTO storage.base_operations VALUES (824, 101, '2011-05-20 00:00:00', 12, 125, -48, NULL);
INSERT INTO storage.base_operations VALUES (824, 102, '2011-05-20 00:00:00', 12, 126, -48, NULL);
INSERT INTO storage.base_operations VALUES (824, 103, '2011-05-20 00:00:00', 12, 121, -48, NULL);
INSERT INTO storage.base_operations VALUES (824, 1, '2011-05-20 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (824, 0, '2011-05-20 00:00:00', 146, 285, 48, NULL);
INSERT INTO storage.base_operations VALUES (824, 3, '2011-05-20 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (824, 4, '2011-05-20 00:00:00', 146, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (824, 5, '2011-05-20 00:00:00', 9, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (824, 6, '2011-05-20 00:00:00', 146, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (819, 100, '2011-05-20 00:00:00', 12, 86, -48, NULL);
INSERT INTO storage.base_operations VALUES (819, 101, '2011-05-20 00:00:00', 12, 125, -48, NULL);
INSERT INTO storage.base_operations VALUES (819, 102, '2011-05-20 00:00:00', 12, 121, -48, NULL);
INSERT INTO storage.base_operations VALUES (819, 103, '2011-05-20 00:00:00', 12, 126, -48, NULL);
INSERT INTO storage.base_operations VALUES (819, 1, '2011-05-20 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (819, 0, '2011-05-20 00:00:00', 146, 290, 48, NULL);
INSERT INTO storage.base_operations VALUES (819, 3, '2011-05-20 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (819, 4, '2011-05-20 00:00:00', 146, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (819, 5, '2011-05-20 00:00:00', 9, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (819, 6, '2011-05-20 00:00:00', 146, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (820, 100, '2011-05-20 00:00:00', 12, 87, -32, NULL);
INSERT INTO storage.base_operations VALUES (820, 101, '2011-05-20 00:00:00', 12, 125, -32, NULL);
INSERT INTO storage.base_operations VALUES (820, 102, '2011-05-20 00:00:00', 12, 121, -32, NULL);
INSERT INTO storage.base_operations VALUES (820, 103, '2011-05-20 00:00:00', 12, 126, -32, NULL);
INSERT INTO storage.base_operations VALUES (820, 1, '2011-05-20 00:00:00', 12, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (820, 0, '2011-05-20 00:00:00', 146, 295, 32, NULL);
INSERT INTO storage.base_operations VALUES (820, 3, '2011-05-20 00:00:00', 12, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (820, 4, '2011-05-20 00:00:00', 146, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (820, 5, '2011-05-20 00:00:00', 9, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (820, 6, '2011-05-20 00:00:00', 146, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (859, 100, '2011-05-20 00:00:00', 12, 141, -8, NULL);
INSERT INTO storage.base_operations VALUES (859, 101, '2011-05-20 00:00:00', 12, 114, -8, NULL);
INSERT INTO storage.base_operations VALUES (859, 1, '2011-05-20 00:00:00', 12, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (859, 0, '2011-05-20 00:00:00', 146, 233, 8, NULL);
INSERT INTO storage.base_operations VALUES (859, 3, '2011-05-20 00:00:00', 12, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (859, 4, '2011-05-20 00:00:00', 146, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (859, 5, '2011-05-20 00:00:00', 9, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (859, 6, '2011-05-20 00:00:00', 146, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (860, 100, '2011-05-20 00:00:00', 12, 141, -8, NULL);
INSERT INTO storage.base_operations VALUES (860, 101, '2011-05-20 00:00:00', 12, 143, -8, NULL);
INSERT INTO storage.base_operations VALUES (860, 1, '2011-05-20 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (860, 0, '2011-05-20 00:00:00', 146, 321, 8, NULL);
INSERT INTO storage.base_operations VALUES (860, 3, '2011-05-20 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (860, 4, '2011-05-20 00:00:00', 146, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (860, 5, '2011-05-20 00:00:00', 9, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (860, 6, '2011-05-20 00:00:00', 146, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (861, 100, '2011-05-20 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (861, 101, '2011-05-20 00:00:00', 12, 334, -24, NULL);
INSERT INTO storage.base_operations VALUES (861, 102, '2011-05-20 00:00:00', 12, 335, -24, NULL);
INSERT INTO storage.base_operations VALUES (861, 103, '2011-05-20 00:00:00', 12, 228, -24, NULL);
INSERT INTO storage.base_operations VALUES (861, 1, '2011-05-20 00:00:00', 12, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (861, 0, '2011-05-20 00:00:00', 146, 333, 24, NULL);
INSERT INTO storage.base_operations VALUES (861, 3, '2011-05-20 00:00:00', 12, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (861, 4, '2011-05-20 00:00:00', 146, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (861, 5, '2011-05-20 00:00:00', 9, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (861, 6, '2011-05-20 00:00:00', 146, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (862, 100, '2011-05-20 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (862, 101, '2011-05-20 00:00:00', 12, 334, -24, NULL);
INSERT INTO storage.base_operations VALUES (862, 102, '2011-05-20 00:00:00', 12, 335, -24, NULL);
INSERT INTO storage.base_operations VALUES (862, 103, '2011-05-20 00:00:00', 12, 351, -24, NULL);
INSERT INTO storage.base_operations VALUES (862, 1, '2011-05-20 00:00:00', 12, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (862, 0, '2011-05-20 00:00:00', 146, 347, 24, NULL);
INSERT INTO storage.base_operations VALUES (862, 3, '2011-05-20 00:00:00', 12, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (862, 4, '2011-05-20 00:00:00', 146, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (862, 5, '2011-05-20 00:00:00', 9, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (862, 6, '2011-05-20 00:00:00', 146, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (863, 100, '2011-05-20 00:00:00', 12, 140, -24, NULL);
INSERT INTO storage.base_operations VALUES (863, 101, '2011-05-20 00:00:00', 12, 142, -24, NULL);
INSERT INTO storage.base_operations VALUES (863, 1, '2011-05-20 00:00:00', 12, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (863, 0, '2011-05-20 00:00:00', 146, 318, 24, NULL);
INSERT INTO storage.base_operations VALUES (863, 3, '2011-05-20 00:00:00', 12, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (863, 4, '2011-05-20 00:00:00', 146, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (863, 5, '2011-05-20 00:00:00', 9, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (863, 6, '2011-05-20 00:00:00', 146, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (944, 1, '2011-06-22 00:00:00', 62, 141, -80, NULL);
INSERT INTO storage.base_operations VALUES (944, 0, '2011-06-22 00:00:00', 8, 141, 80, NULL);
INSERT INTO storage.base_operations VALUES (944, 3, '2011-06-22 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (944, 4, '2011-06-22 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (944, 5, '2011-06-22 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (944, 6, '2011-06-22 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (1071, 3, '2011-06-15 00:00:00', 12, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (1071, 4, '2011-06-15 00:00:00', 373, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (1071, 5, '2011-06-15 00:00:00', 9, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (1071, 6, '2011-06-15 00:00:00', 373, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (1085, 5, '2011-06-15 00:00:00', 9, 327, 0, NULL);
INSERT INTO storage.base_operations VALUES (1085, 6, '2011-06-15 00:00:00', 373, 327, 0, NULL);
INSERT INTO storage.base_operations VALUES (963, 1, '2011-06-27 00:00:00', 38, 140, -44, NULL);
INSERT INTO storage.base_operations VALUES (963, 0, '2011-06-27 00:00:00', 62, 140, 44, NULL);
INSERT INTO storage.base_operations VALUES (963, 3, '2011-06-27 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (963, 4, '2011-06-27 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (963, 5, '2011-06-27 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (963, 6, '2011-06-27 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (1274, 3, '2011-07-06 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (980, 1, '2011-06-30 00:00:00', 37, 87, -91, NULL);
INSERT INTO storage.base_operations VALUES (980, 0, '2011-06-30 00:00:00', 38, 87, 91, NULL);
INSERT INTO storage.base_operations VALUES (980, 3, '2011-06-30 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (980, 4, '2011-06-30 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (980, 5, '2011-06-30 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (980, 6, '2011-06-30 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1274, 4, '2011-07-06 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1274, 5, '2011-07-06 00:00:00', 9, 84, 1, NULL);
INSERT INTO storage.base_operations VALUES (1002, 1, '2011-07-01 00:00:00', 83, 87, -63, NULL);
INSERT INTO storage.base_operations VALUES (1002, 0, '2011-07-01 00:00:00', 30, 87, 63, NULL);
INSERT INTO storage.base_operations VALUES (1002, 3, '2011-07-01 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1002, 4, '2011-07-01 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1002, 5, '2011-07-01 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1002, 6, '2011-07-01 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (864, 100, '2011-05-24 00:00:00', 12, 125, -100, NULL);
INSERT INTO storage.base_operations VALUES (864, 101, '2011-05-24 00:00:00', 12, 334, -100, NULL);
INSERT INTO storage.base_operations VALUES (864, 102, '2011-05-24 00:00:00', 12, 335, -100, NULL);
INSERT INTO storage.base_operations VALUES (864, 103, '2011-05-24 00:00:00', 12, 228, -100, NULL);
INSERT INTO storage.base_operations VALUES (864, 1, '2011-05-24 00:00:00', 12, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (864, 0, '2011-05-24 00:00:00', 359, 333, 100, NULL);
INSERT INTO storage.base_operations VALUES (864, 3, '2011-05-24 00:00:00', 12, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (864, 4, '2011-05-24 00:00:00', 359, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (864, 5, '2011-05-24 00:00:00', 9, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (864, 6, '2011-05-24 00:00:00', 359, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (865, 100, '2011-05-24 00:00:00', 12, 113, -2, NULL);
INSERT INTO storage.base_operations VALUES (865, 101, '2011-05-24 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (865, 102, '2011-05-24 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (865, 103, '2011-05-24 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (865, 104, '2011-05-24 00:00:00', 12, 88, -2, NULL);
INSERT INTO storage.base_operations VALUES (865, 1, '2011-05-24 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (865, 0, '2011-05-24 00:00:00', 359, 186, 2, NULL);
INSERT INTO storage.base_operations VALUES (865, 3, '2011-05-24 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (865, 4, '2011-05-24 00:00:00', 359, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (865, 5, '2011-05-24 00:00:00', 9, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (865, 6, '2011-05-24 00:00:00', 359, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (866, 100, '2011-05-24 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (866, 101, '2011-05-24 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (866, 102, '2011-05-24 00:00:00', 12, 89, -1, NULL);
INSERT INTO storage.base_operations VALUES (866, 103, '2011-05-24 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (866, 1, '2011-05-24 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (866, 0, '2011-05-24 00:00:00', 359, 181, 1, NULL);
INSERT INTO storage.base_operations VALUES (866, 3, '2011-05-24 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (866, 4, '2011-05-24 00:00:00', 359, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (866, 5, '2011-05-24 00:00:00', 9, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (866, 6, '2011-05-24 00:00:00', 359, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (867, 100, '2011-05-24 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (867, 101, '2011-05-24 00:00:00', 12, 99, -1, NULL);
INSERT INTO storage.base_operations VALUES (867, 102, '2011-05-24 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (867, 103, '2011-05-24 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (867, 104, '2011-05-24 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (867, 1, '2011-05-24 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (867, 0, '2011-05-24 00:00:00', 359, 262, 1, NULL);
INSERT INTO storage.base_operations VALUES (867, 3, '2011-05-24 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (867, 4, '2011-05-24 00:00:00', 359, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (867, 5, '2011-05-24 00:00:00', 9, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (867, 6, '2011-05-24 00:00:00', 359, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (868, 100, '2011-05-24 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (868, 101, '2011-05-24 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (868, 102, '2011-05-24 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (868, 103, '2011-05-24 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (868, 104, '2011-05-24 00:00:00', 12, 90, -1, NULL);
INSERT INTO storage.base_operations VALUES (868, 1, '2011-05-24 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (868, 0, '2011-05-24 00:00:00', 359, 210, 1, NULL);
INSERT INTO storage.base_operations VALUES (868, 3, '2011-05-24 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (868, 4, '2011-05-24 00:00:00', 359, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (868, 5, '2011-05-24 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (868, 6, '2011-05-24 00:00:00', 359, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (869, 100, '2011-05-24 00:00:00', 12, 90, -1, NULL);
INSERT INTO storage.base_operations VALUES (869, 101, '2011-05-24 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (869, 102, '2011-05-24 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (869, 103, '2011-05-24 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (869, 1, '2011-05-24 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (869, 0, '2011-05-24 00:00:00', 359, 195, 1, NULL);
INSERT INTO storage.base_operations VALUES (869, 3, '2011-05-24 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (869, 4, '2011-05-24 00:00:00', 359, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (869, 5, '2011-05-24 00:00:00', 9, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (869, 6, '2011-05-24 00:00:00', 359, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (870, 100, '2011-05-24 00:00:00', 12, 119, -2, NULL);
INSERT INTO storage.base_operations VALUES (870, 101, '2011-05-24 00:00:00', 12, 331, -2, NULL);
INSERT INTO storage.base_operations VALUES (870, 1, '2011-05-24 00:00:00', 12, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (870, 0, '2011-05-24 00:00:00', 359, 192, 2, NULL);
INSERT INTO storage.base_operations VALUES (870, 3, '2011-05-24 00:00:00', 12, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (870, 4, '2011-05-24 00:00:00', 359, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (870, 5, '2011-05-24 00:00:00', 9, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (870, 6, '2011-05-24 00:00:00', 359, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (871, 100, '2011-05-24 00:00:00', 12, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (871, 101, '2011-05-24 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (871, 1, '2011-05-24 00:00:00', 12, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (871, 0, '2011-05-24 00:00:00', 359, 233, 1, NULL);
INSERT INTO storage.base_operations VALUES (871, 3, '2011-05-24 00:00:00', 12, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (871, 4, '2011-05-24 00:00:00', 359, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (871, 5, '2011-05-24 00:00:00', 9, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (871, 6, '2011-05-24 00:00:00', 359, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (872, 100, '2011-05-24 00:00:00', 12, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (872, 101, '2011-05-24 00:00:00', 12, 330, -1, NULL);
INSERT INTO storage.base_operations VALUES (872, 1, '2011-05-24 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (872, 0, '2011-05-24 00:00:00', 359, 230, 1, NULL);
INSERT INTO storage.base_operations VALUES (872, 3, '2011-05-24 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (872, 4, '2011-05-24 00:00:00', 359, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (872, 5, '2011-05-24 00:00:00', 9, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (872, 6, '2011-05-24 00:00:00', 359, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1072, 100, '2011-06-15 00:00:00', 12, 95, -18, NULL);
INSERT INTO storage.base_operations VALUES (1072, 101, '2011-06-15 00:00:00', 12, 126, -18, NULL);
INSERT INTO storage.base_operations VALUES (1072, 102, '2011-06-15 00:00:00', 12, 121, -18, NULL);
INSERT INTO storage.base_operations VALUES (1072, 103, '2011-06-15 00:00:00', 12, 125, -18, NULL);
INSERT INTO storage.base_operations VALUES (1072, 104, '2011-06-15 00:00:00', 12, 113, -18, NULL);
INSERT INTO storage.base_operations VALUES (1072, 1, '2011-06-15 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (954, 1, '2011-06-24 00:00:00', 37, 143, -34, NULL);
INSERT INTO storage.base_operations VALUES (954, 0, '2011-06-24 00:00:00', 38, 143, 34, NULL);
INSERT INTO storage.base_operations VALUES (954, 3, '2011-06-24 00:00:00', 37, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (954, 4, '2011-06-24 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (954, 5, '2011-06-24 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (954, 6, '2011-06-24 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (1072, 0, '2011-06-15 00:00:00', 373, 256, 18, NULL);
INSERT INTO storage.base_operations VALUES (1072, 3, '2011-06-15 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1072, 4, '2011-06-15 00:00:00', 373, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1072, 5, '2011-06-15 00:00:00', 9, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1072, 6, '2011-06-15 00:00:00', 373, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (972, 1, '2011-06-29 00:00:00', 38, 140, -70, NULL);
INSERT INTO storage.base_operations VALUES (972, 0, '2011-06-29 00:00:00', 62, 140, 70, NULL);
INSERT INTO storage.base_operations VALUES (972, 3, '2011-06-29 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (972, 4, '2011-06-29 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (972, 5, '2011-06-29 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (972, 6, '2011-06-29 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (988, 1, '2011-07-01 00:00:00', 30, 87, -131, NULL);
INSERT INTO storage.base_operations VALUES (988, 0, '2011-07-01 00:00:00', 61, 87, 131, NULL);
INSERT INTO storage.base_operations VALUES (988, 3, '2011-07-01 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (988, 4, '2011-07-01 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (988, 5, '2011-07-01 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (988, 6, '2011-07-01 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (996, 1, '2011-07-01 00:00:00', 35, 86, -56, NULL);
INSERT INTO storage.base_operations VALUES (996, 0, '2011-07-01 00:00:00', 83, 86, 56, NULL);
INSERT INTO storage.base_operations VALUES (996, 3, '2011-07-01 00:00:00', 35, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (996, 4, '2011-07-01 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (996, 5, '2011-07-01 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (996, 6, '2011-07-01 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1023, 3, '2011-07-02 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1023, 4, '2011-07-02 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1023, 5, '2011-07-02 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1023, 6, '2011-07-02 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1030, 1, '2011-07-02 00:00:00', 62, 84, -212, NULL);
INSERT INTO storage.base_operations VALUES (1030, 0, '2011-07-02 00:00:00', 8, 84, 212, NULL);
INSERT INTO storage.base_operations VALUES (1030, 3, '2011-07-02 00:00:00', 62, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1030, 4, '2011-07-02 00:00:00', 8, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1030, 5, '2011-07-02 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1030, 6, '2011-07-02 00:00:00', 8, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1033, 1, '2011-07-02 00:00:00', 30, 86, -49, NULL);
INSERT INTO storage.base_operations VALUES (1033, 0, '2011-07-02 00:00:00', 61, 86, 49, NULL);
INSERT INTO storage.base_operations VALUES (1033, 3, '2011-07-02 00:00:00', 30, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (945, 1, '2011-06-22 00:00:00', 37, 140, -140, NULL);
INSERT INTO storage.base_operations VALUES (945, 0, '2011-06-22 00:00:00', 38, 140, 140, NULL);
INSERT INTO storage.base_operations VALUES (945, 3, '2011-06-22 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (945, 4, '2011-06-22 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (945, 5, '2011-06-22 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (945, 6, '2011-06-22 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (1073, 100, '2011-06-15 00:00:00', 12, 125, -12, NULL);
INSERT INTO storage.base_operations VALUES (1073, 101, '2011-06-15 00:00:00', 12, 99, -12, NULL);
INSERT INTO storage.base_operations VALUES (1073, 102, '2011-06-15 00:00:00', 12, 114, -12, NULL);
INSERT INTO storage.base_operations VALUES (1073, 103, '2011-06-15 00:00:00', 12, 126, -12, NULL);
INSERT INTO storage.base_operations VALUES (1073, 104, '2011-06-15 00:00:00', 12, 121, -12, NULL);
INSERT INTO storage.base_operations VALUES (1073, 1, '2011-06-15 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (964, 1, '2011-06-27 00:00:00', 62, 140, -44, NULL);
INSERT INTO storage.base_operations VALUES (964, 0, '2011-06-27 00:00:00', 8, 140, 44, NULL);
INSERT INTO storage.base_operations VALUES (964, 3, '2011-06-27 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (964, 4, '2011-06-27 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (964, 5, '2011-06-27 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (964, 6, '2011-06-27 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (1073, 0, '2011-06-15 00:00:00', 373, 262, 12, NULL);
INSERT INTO storage.base_operations VALUES (1073, 3, '2011-06-15 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1073, 4, '2011-06-15 00:00:00', 373, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1073, 5, '2011-06-15 00:00:00', 9, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1073, 6, '2011-06-15 00:00:00', 373, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1086, 1, '2011-06-15 00:00:00', 12, 112, -40, NULL);
INSERT INTO storage.base_operations VALUES (981, 1, '2011-07-01 00:00:00', 35, 86, -38, NULL);
INSERT INTO storage.base_operations VALUES (981, 0, '2011-07-01 00:00:00', 83, 86, 38, NULL);
INSERT INTO storage.base_operations VALUES (981, 3, '2011-07-01 00:00:00', 35, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (981, 4, '2011-07-01 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (981, 5, '2011-07-01 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (981, 6, '2011-07-01 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1086, 0, '2011-06-15 00:00:00', 373, 112, 40, NULL);
INSERT INTO storage.base_operations VALUES (1086, 3, '2011-06-15 00:00:00', 12, 112, 0, NULL);
INSERT INTO storage.base_operations VALUES (1086, 4, '2011-06-15 00:00:00', 373, 112, 0, NULL);
INSERT INTO storage.base_operations VALUES (1086, 5, '2011-06-15 00:00:00', 9, 112, 0, NULL);
INSERT INTO storage.base_operations VALUES (1086, 6, '2011-06-15 00:00:00', 373, 112, 0, NULL);
INSERT INTO storage.base_operations VALUES (1189, 100, '2011-05-20 00:00:00', 12, 91, -1, NULL);
INSERT INTO storage.base_operations VALUES (1189, 101, '2011-05-20 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1189, 102, '2011-05-20 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1189, 103, '2011-05-20 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1003, 1, '2011-07-01 00:00:00', 30, 87, -63, NULL);
INSERT INTO storage.base_operations VALUES (1003, 0, '2011-07-01 00:00:00', 61, 87, 63, NULL);
INSERT INTO storage.base_operations VALUES (1003, 3, '2011-07-01 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1003, 4, '2011-07-01 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1003, 5, '2011-07-01 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1003, 6, '2011-07-01 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1009, 1, '2011-07-02 00:00:00', 83, 84, -118, NULL);
INSERT INTO storage.base_operations VALUES (1009, 0, '2011-07-02 00:00:00', 30, 84, 118, NULL);
INSERT INTO storage.base_operations VALUES (1009, 3, '2011-07-02 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1009, 4, '2011-07-02 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1009, 5, '2011-07-02 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1009, 6, '2011-07-02 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1015, 1, '2011-07-02 00:00:00', 83, 86, -90, NULL);
INSERT INTO storage.base_operations VALUES (1015, 0, '2011-07-02 00:00:00', 30, 86, 90, NULL);
INSERT INTO storage.base_operations VALUES (1015, 3, '2011-07-02 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1015, 4, '2011-07-02 00:00:00', 30, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1015, 5, '2011-07-02 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1015, 6, '2011-07-02 00:00:00', 30, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1020, 1, '2011-07-02 00:00:00', 83, 87, -82, NULL);
INSERT INTO storage.base_operations VALUES (1020, 0, '2011-07-02 00:00:00', 30, 87, 82, NULL);
INSERT INTO storage.base_operations VALUES (1020, 3, '2011-07-02 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1020, 4, '2011-07-02 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1020, 5, '2011-07-02 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1020, 6, '2011-07-02 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1094, 100, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (1094, 101, '2011-06-29 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (1189, 1, '2011-05-20 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1189, 0, '2011-05-20 00:00:00', 379, 200, 1, NULL);
INSERT INTO storage.base_operations VALUES (1027, 1, '2011-07-02 00:00:00', 61, 84, -50, NULL);
INSERT INTO storage.base_operations VALUES (1027, 0, '2011-07-02 00:00:00', 37, 84, 50, NULL);
INSERT INTO storage.base_operations VALUES (1027, 3, '2011-07-02 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1027, 4, '2011-07-02 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1027, 5, '2011-07-02 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1027, 6, '2011-07-02 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1033, 4, '2011-07-02 00:00:00', 61, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1033, 5, '2011-07-02 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1033, 6, '2011-07-02 00:00:00', 61, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1036, 1, '2011-07-02 00:00:00', 35, 87, -41, NULL);
INSERT INTO storage.base_operations VALUES (1036, 0, '2011-07-02 00:00:00', 83, 87, 41, NULL);
INSERT INTO storage.base_operations VALUES (1036, 3, '2011-07-02 00:00:00', 35, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1036, 4, '2011-07-02 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1036, 5, '2011-07-02 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1036, 6, '2011-07-02 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1038, 6, '2011-07-02 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1039, 1, '2011-07-02 00:00:00', 61, 87, -41, NULL);
INSERT INTO storage.base_operations VALUES (1039, 0, '2011-07-02 00:00:00', 37, 87, 41, NULL);
INSERT INTO storage.base_operations VALUES (1039, 3, '2011-07-02 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1039, 4, '2011-07-02 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1039, 5, '2011-07-02 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1039, 6, '2011-07-02 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1040, 1, '2011-07-02 00:00:00', 37, 87, -41, NULL);
INSERT INTO storage.base_operations VALUES (1040, 0, '2011-07-02 00:00:00', 38, 87, 41, NULL);
INSERT INTO storage.base_operations VALUES (1040, 3, '2011-07-02 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1040, 4, '2011-07-02 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1040, 5, '2011-07-02 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1040, 6, '2011-07-02 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1074, 100, '2011-06-15 00:00:00', 12, 97, -12, NULL);
INSERT INTO storage.base_operations VALUES (1074, 101, '2011-06-15 00:00:00', 12, 115, -12, NULL);
INSERT INTO storage.base_operations VALUES (1074, 102, '2011-06-15 00:00:00', 12, 125, -12, NULL);
INSERT INTO storage.base_operations VALUES (1074, 103, '2011-06-15 00:00:00', 12, 126, -12, NULL);
INSERT INTO storage.base_operations VALUES (1074, 104, '2011-06-15 00:00:00', 12, 121, -12, NULL);
INSERT INTO storage.base_operations VALUES (1074, 1, '2011-06-15 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (955, 1, '2011-06-24 00:00:00', 38, 143, -229, NULL);
INSERT INTO storage.base_operations VALUES (955, 0, '2011-06-24 00:00:00', 62, 143, 229, NULL);
INSERT INTO storage.base_operations VALUES (955, 3, '2011-06-24 00:00:00', 38, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (955, 4, '2011-06-24 00:00:00', 62, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (955, 5, '2011-06-24 00:00:00', 9, 143, 8, NULL);
INSERT INTO storage.base_operations VALUES (955, 6, '2011-06-24 00:00:00', 62, 143, -8, NULL);
INSERT INTO storage.base_operations VALUES (1074, 0, '2011-06-15 00:00:00', 373, 268, 12, NULL);
INSERT INTO storage.base_operations VALUES (1074, 3, '2011-06-15 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1074, 4, '2011-06-15 00:00:00', 373, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1074, 5, '2011-06-15 00:00:00', 9, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1074, 6, '2011-06-15 00:00:00', 373, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1087, 1, '2011-06-15 00:00:00', 12, 113, -48, NULL);
INSERT INTO storage.base_operations VALUES (973, 1, '2011-06-29 00:00:00', 62, 140, -70, NULL);
INSERT INTO storage.base_operations VALUES (973, 0, '2011-06-29 00:00:00', 8, 140, 70, NULL);
INSERT INTO storage.base_operations VALUES (973, 3, '2011-06-29 00:00:00', 62, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (973, 4, '2011-06-29 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (973, 5, '2011-06-29 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (973, 6, '2011-06-29 00:00:00', 8, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (1087, 0, '2011-06-15 00:00:00', 373, 113, 48, NULL);
INSERT INTO storage.base_operations VALUES (1087, 3, '2011-06-15 00:00:00', 12, 113, 0, NULL);
INSERT INTO storage.base_operations VALUES (1087, 4, '2011-06-15 00:00:00', 373, 113, 0, NULL);
INSERT INTO storage.base_operations VALUES (1087, 5, '2011-06-15 00:00:00', 9, 113, 0, NULL);
INSERT INTO storage.base_operations VALUES (1087, 6, '2011-06-15 00:00:00', 373, 113, 0, NULL);
INSERT INTO storage.base_operations VALUES (1274, 6, '2011-07-06 00:00:00', 61, 84, -1, NULL);
INSERT INTO storage.base_operations VALUES (989, 1, '2011-07-01 00:00:00', 61, 87, -131, NULL);
INSERT INTO storage.base_operations VALUES (989, 0, '2011-07-01 00:00:00', 37, 87, 131, NULL);
INSERT INTO storage.base_operations VALUES (989, 3, '2011-07-01 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (989, 4, '2011-07-01 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (989, 5, '2011-07-01 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (989, 6, '2011-07-01 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1276, 1, '2011-07-06 00:00:00', 61, 84, -62, NULL);
INSERT INTO storage.base_operations VALUES (1276, 0, '2011-07-06 00:00:00', 37, 84, 62, NULL);
INSERT INTO storage.base_operations VALUES (1276, 3, '2011-07-06 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1276, 4, '2011-07-06 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1276, 5, '2011-07-06 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1189, 3, '2011-05-20 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1189, 4, '2011-05-20 00:00:00', 379, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1189, 5, '2011-05-20 00:00:00', 9, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1189, 6, '2011-05-20 00:00:00', 379, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1202, 100, '2011-05-31 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1202, 101, '2011-05-31 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1094, 102, '2011-06-29 00:00:00', 12, 89, -2, NULL);
INSERT INTO storage.base_operations VALUES (1094, 103, '2011-06-29 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (1094, 1, '2011-06-29 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1094, 0, '2011-06-29 00:00:00', 371, 181, 2, NULL);
INSERT INTO storage.base_operations VALUES (1094, 3, '2011-06-29 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1094, 4, '2011-06-29 00:00:00', 371, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1094, 5, '2011-06-29 00:00:00', 9, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1094, 6, '2011-06-29 00:00:00', 371, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1100, 100, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (1100, 101, '2011-06-29 00:00:00', 12, 334, -2, NULL);
INSERT INTO storage.base_operations VALUES (1100, 102, '2011-06-29 00:00:00', 12, 335, -2, NULL);
INSERT INTO storage.base_operations VALUES (1100, 103, '2011-06-29 00:00:00', 12, 228, -2, NULL);
INSERT INTO storage.base_operations VALUES (1100, 1, '2011-06-29 00:00:00', 12, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1100, 0, '2011-06-29 00:00:00', 371, 333, 2, NULL);
INSERT INTO storage.base_operations VALUES (1100, 3, '2011-06-29 00:00:00', 12, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1100, 4, '2011-06-29 00:00:00', 371, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1100, 5, '2011-06-29 00:00:00', 9, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1100, 6, '2011-06-29 00:00:00', 371, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1202, 102, '2011-05-31 00:00:00', 12, 89, -1, NULL);
INSERT INTO storage.base_operations VALUES (1202, 103, '2011-05-31 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1202, 1, '2011-05-31 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1202, 0, '2011-05-31 00:00:00', 378, 181, 1, NULL);
INSERT INTO storage.base_operations VALUES (1202, 3, '2011-05-31 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1202, 4, '2011-05-31 00:00:00', 378, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1276, 6, '2011-07-06 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1277, 1, '2011-07-06 00:00:00', 61, 87, -196, NULL);
INSERT INTO storage.base_operations VALUES (1277, 0, '2011-07-06 00:00:00', 37, 87, 196, NULL);
INSERT INTO storage.base_operations VALUES (1277, 3, '2011-07-06 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1277, 4, '2011-07-06 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1277, 5, '2011-07-06 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1277, 6, '2011-07-06 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1278, 1, '2011-07-06 00:00:00', 37, 87, -196, NULL);
INSERT INTO storage.base_operations VALUES (1278, 0, '2011-07-06 00:00:00', 38, 87, 196, NULL);
INSERT INTO storage.base_operations VALUES (1278, 3, '2011-07-06 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1278, 4, '2011-07-06 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1024, 1, '2011-07-02 00:00:00', 35, 84, -50, NULL);
INSERT INTO storage.base_operations VALUES (1024, 0, '2011-07-02 00:00:00', 83, 84, 50, NULL);
INSERT INTO storage.base_operations VALUES (1024, 3, '2011-07-02 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1024, 4, '2011-07-02 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1024, 5, '2011-07-02 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1024, 6, '2011-07-02 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1031, 1, '2011-07-02 00:00:00', 35, 86, -49, NULL);
INSERT INTO storage.base_operations VALUES (1031, 0, '2011-07-02 00:00:00', 83, 86, 49, NULL);
INSERT INTO storage.base_operations VALUES (1031, 3, '2011-07-02 00:00:00', 35, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1031, 4, '2011-07-02 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1031, 5, '2011-07-02 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1031, 6, '2011-07-02 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1075, 100, '2011-06-15 00:00:00', 12, 98, -12, NULL);
INSERT INTO storage.base_operations VALUES (1075, 101, '2011-06-15 00:00:00', 12, 116, -12, NULL);
INSERT INTO storage.base_operations VALUES (1075, 102, '2011-06-15 00:00:00', 12, 125, -12, NULL);
INSERT INTO storage.base_operations VALUES (1075, 103, '2011-06-15 00:00:00', 12, 126, -12, NULL);
INSERT INTO storage.base_operations VALUES (1075, 104, '2011-06-15 00:00:00', 12, 121, -12, NULL);
INSERT INTO storage.base_operations VALUES (1075, 1, '2011-06-15 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1075, 0, '2011-06-15 00:00:00', 373, 274, 12, NULL);
INSERT INTO storage.base_operations VALUES (1075, 3, '2011-06-15 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1075, 4, '2011-06-15 00:00:00', 373, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1075, 5, '2011-06-15 00:00:00', 9, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1075, 6, '2011-06-15 00:00:00', 373, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1088, 1, '2011-06-15 00:00:00', 12, 114, -36, NULL);
INSERT INTO storage.base_operations VALUES (1088, 0, '2011-06-15 00:00:00', 373, 114, 36, NULL);
INSERT INTO storage.base_operations VALUES (1088, 3, '2011-06-15 00:00:00', 12, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (1088, 4, '2011-06-15 00:00:00', 373, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (1088, 5, '2011-06-15 00:00:00', 9, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (1088, 6, '2011-06-15 00:00:00', 373, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (1278, 5, '2011-07-06 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1278, 6, '2011-07-06 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1257, 1, '2011-07-05 00:00:00', 83, 84, -92, NULL);
INSERT INTO storage.base_operations VALUES (1257, 0, '2011-07-05 00:00:00', 30, 84, 92, NULL);
INSERT INTO storage.base_operations VALUES (1257, 3, '2011-07-05 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1257, 4, '2011-07-05 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1190, 100, '2011-05-20 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (1190, 101, '2011-05-20 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1190, 102, '2011-05-20 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1190, 103, '2011-05-20 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1190, 104, '2011-05-20 00:00:00', 12, 90, -1, NULL);
INSERT INTO storage.base_operations VALUES (1190, 1, '2011-05-20 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1095, 100, '2011-06-29 00:00:00', 12, 90, -2, NULL);
INSERT INTO storage.base_operations VALUES (1095, 101, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (1095, 102, '2011-06-29 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (1095, 103, '2011-06-29 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (1095, 1, '2011-06-29 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (1095, 0, '2011-06-29 00:00:00', 371, 195, 2, NULL);
INSERT INTO storage.base_operations VALUES (1095, 3, '2011-06-29 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (1095, 4, '2011-06-29 00:00:00', 371, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (965, 1, '2011-06-27 00:00:00', 30, 140, -160, NULL);
INSERT INTO storage.base_operations VALUES (965, 0, '2011-06-27 00:00:00', 37, 140, 160, NULL);
INSERT INTO storage.base_operations VALUES (965, 3, '2011-06-27 00:00:00', 30, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (965, 4, '2011-06-27 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (1095, 5, '2011-06-29 00:00:00', 9, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (1095, 6, '2011-06-29 00:00:00', 371, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (1101, 100, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (1101, 101, '2011-06-29 00:00:00', 12, 334, -2, NULL);
INSERT INTO storage.base_operations VALUES (1101, 102, '2011-06-29 00:00:00', 12, 335, -2, NULL);
INSERT INTO storage.base_operations VALUES (1101, 103, '2011-06-29 00:00:00', 12, 351, -2, NULL);
INSERT INTO storage.base_operations VALUES (1101, 1, '2011-06-29 00:00:00', 12, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (1101, 0, '2011-06-29 00:00:00', 371, 347, 2, NULL);
INSERT INTO storage.base_operations VALUES (1101, 3, '2011-06-29 00:00:00', 12, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (1101, 4, '2011-06-29 00:00:00', 371, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (1101, 5, '2011-06-29 00:00:00', 9, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (1101, 6, '2011-06-29 00:00:00', 371, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (1257, 5, '2011-07-05 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1257, 6, '2011-07-05 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1258, 1, '2011-07-05 00:00:00', 83, 87, -166, NULL);
INSERT INTO storage.base_operations VALUES (1258, 0, '2011-07-05 00:00:00', 30, 87, 166, NULL);
INSERT INTO storage.base_operations VALUES (1258, 3, '2011-07-05 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1258, 4, '2011-07-05 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1258, 5, '2011-07-05 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1258, 6, '2011-07-05 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (965, 5, '2011-06-27 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (965, 6, '2011-06-27 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (1259, 1, '2011-07-05 00:00:00', 30, 84, -92, NULL);
INSERT INTO storage.base_operations VALUES (1259, 0, '2011-07-05 00:00:00', 61, 84, 92, NULL);
INSERT INTO storage.base_operations VALUES (1259, 3, '2011-07-05 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1259, 4, '2011-07-05 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1259, 5, '2011-07-05 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1259, 6, '2011-07-05 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (982, 1, '2011-07-01 00:00:00', 83, 86, -38, NULL);
INSERT INTO storage.base_operations VALUES (982, 0, '2011-07-01 00:00:00', 30, 86, 38, NULL);
INSERT INTO storage.base_operations VALUES (982, 3, '2011-07-01 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (982, 4, '2011-07-01 00:00:00', 30, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (982, 5, '2011-07-01 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (982, 6, '2011-07-01 00:00:00', 30, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1261, 1, '2011-07-05 00:00:00', 30, 87, -166, NULL);
INSERT INTO storage.base_operations VALUES (1104, 100, '2011-06-29 00:00:00', 12, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (1104, 101, '2011-06-29 00:00:00', 12, 143, -1, NULL);
INSERT INTO storage.base_operations VALUES (1104, 1, '2011-06-29 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1104, 0, '2011-06-29 00:00:00', 371, 321, 1, NULL);
INSERT INTO storage.base_operations VALUES (1104, 3, '2011-06-29 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1104, 4, '2011-06-29 00:00:00', 371, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1104, 5, '2011-06-29 00:00:00', 9, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1190, 0, '2011-05-20 00:00:00', 379, 210, 1, NULL);
INSERT INTO storage.base_operations VALUES (1190, 3, '2011-05-20 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1190, 4, '2011-05-20 00:00:00', 379, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1190, 5, '2011-05-20 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1190, 6, '2011-05-20 00:00:00', 379, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (997, 1, '2011-07-01 00:00:00', 83, 86, -56, NULL);
INSERT INTO storage.base_operations VALUES (997, 0, '2011-07-01 00:00:00', 30, 86, 56, NULL);
INSERT INTO storage.base_operations VALUES (997, 3, '2011-07-01 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (997, 4, '2011-07-01 00:00:00', 30, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (997, 5, '2011-07-01 00:00:00', 9, 86, 1, NULL);
INSERT INTO storage.base_operations VALUES (997, 6, '2011-07-01 00:00:00', 30, 86, -1, NULL);
INSERT INTO storage.base_operations VALUES (1004, 1, '2011-07-01 00:00:00', 61, 87, -63, NULL);
INSERT INTO storage.base_operations VALUES (1004, 0, '2011-07-01 00:00:00', 37, 87, 63, NULL);
INSERT INTO storage.base_operations VALUES (1076, 100, '2011-06-15 00:00:00', 12, 84, -36, NULL);
INSERT INTO storage.base_operations VALUES (1076, 101, '2011-06-15 00:00:00', 12, 125, -36, NULL);
INSERT INTO storage.base_operations VALUES (1076, 102, '2011-06-15 00:00:00', 12, 126, -36, NULL);
INSERT INTO storage.base_operations VALUES (1076, 103, '2011-06-15 00:00:00', 12, 121, -36, NULL);
INSERT INTO storage.base_operations VALUES (1076, 1, '2011-06-15 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1076, 0, '2011-06-15 00:00:00', 373, 280, 36, NULL);
INSERT INTO storage.base_operations VALUES (1076, 3, '2011-06-15 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1076, 4, '2011-06-15 00:00:00', 373, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1076, 5, '2011-06-15 00:00:00', 9, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1076, 6, '2011-06-15 00:00:00', 373, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1089, 1, '2011-06-15 00:00:00', 12, 115, -30, NULL);
INSERT INTO storage.base_operations VALUES (1089, 0, '2011-06-15 00:00:00', 373, 115, 30, NULL);
INSERT INTO storage.base_operations VALUES (1089, 3, '2011-06-15 00:00:00', 12, 115, 0, NULL);
INSERT INTO storage.base_operations VALUES (1089, 4, '2011-06-15 00:00:00', 373, 115, 0, NULL);
INSERT INTO storage.base_operations VALUES (1089, 5, '2011-06-15 00:00:00', 9, 115, 0, NULL);
INSERT INTO storage.base_operations VALUES (1089, 6, '2011-06-15 00:00:00', 373, 115, 0, NULL);
INSERT INTO storage.base_operations VALUES (1261, 0, '2011-07-05 00:00:00', 61, 87, 166, NULL);
INSERT INTO storage.base_operations VALUES (1261, 3, '2011-07-05 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1261, 4, '2011-07-05 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1261, 5, '2011-07-05 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1261, 6, '2011-07-05 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1262, 1, '2011-07-05 00:00:00', 61, 84, -92, NULL);
INSERT INTO storage.base_operations VALUES (1262, 0, '2011-07-05 00:00:00', 37, 84, 92, NULL);
INSERT INTO storage.base_operations VALUES (1262, 3, '2011-07-05 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1262, 4, '2011-07-05 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1262, 5, '2011-07-05 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1262, 6, '2011-07-05 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1263, 1, '2011-07-05 00:00:00', 61, 87, -166, NULL);
INSERT INTO storage.base_operations VALUES (1096, 100, '2011-06-29 00:00:00', 12, 91, -2, NULL);
INSERT INTO storage.base_operations VALUES (1096, 101, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (1096, 102, '2011-06-29 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (1096, 103, '2011-06-29 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (1096, 1, '2011-06-29 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1096, 0, '2011-06-29 00:00:00', 371, 200, 2, NULL);
INSERT INTO storage.base_operations VALUES (1096, 3, '2011-06-29 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1096, 4, '2011-06-29 00:00:00', 371, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1096, 5, '2011-06-29 00:00:00', 9, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1096, 6, '2011-06-29 00:00:00', 371, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1102, 100, '2011-06-29 00:00:00', 12, 140, -1, NULL);
INSERT INTO storage.base_operations VALUES (1102, 101, '2011-06-29 00:00:00', 12, 142, -1, NULL);
INSERT INTO storage.base_operations VALUES (1102, 1, '2011-06-29 00:00:00', 12, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (1102, 0, '2011-06-29 00:00:00', 371, 318, 1, NULL);
INSERT INTO storage.base_operations VALUES (1102, 3, '2011-06-29 00:00:00', 12, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (1102, 4, '2011-06-29 00:00:00', 371, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (1102, 5, '2011-06-29 00:00:00', 9, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (1102, 6, '2011-06-29 00:00:00', 371, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (1263, 0, '2011-07-05 00:00:00', 37, 87, 166, NULL);
INSERT INTO storage.base_operations VALUES (1263, 3, '2011-07-05 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1263, 4, '2011-07-05 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1263, 5, '2011-07-05 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1263, 6, '2011-07-05 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1264, 1, '2011-07-05 00:00:00', 37, 84, -92, NULL);
INSERT INTO storage.base_operations VALUES (1264, 0, '2011-07-05 00:00:00', 38, 84, 92, NULL);
INSERT INTO storage.base_operations VALUES (1264, 3, '2011-07-05 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1264, 4, '2011-07-05 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1264, 5, '2011-07-05 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1264, 6, '2011-07-05 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1265, 1, '2011-07-05 00:00:00', 37, 87, -166, NULL);
INSERT INTO storage.base_operations VALUES (1265, 0, '2011-07-05 00:00:00', 38, 87, 166, NULL);
INSERT INTO storage.base_operations VALUES (1265, 3, '2011-07-05 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1265, 4, '2011-07-05 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1265, 5, '2011-07-05 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1265, 6, '2011-07-05 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1244, 1, '2011-07-05 00:00:00', 83, 84, -57, NULL);
INSERT INTO storage.base_operations VALUES (1244, 0, '2011-07-05 00:00:00', 30, 84, 57, NULL);
INSERT INTO storage.base_operations VALUES (1244, 3, '2011-07-05 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1244, 4, '2011-07-05 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1104, 6, '2011-06-29 00:00:00', 371, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1202, 5, '2011-05-31 00:00:00', 9, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1202, 6, '2011-05-31 00:00:00', 378, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1214, 100, '2011-06-20 00:00:00', 12, 95, -1, NULL);
INSERT INTO storage.base_operations VALUES (1214, 101, '2011-06-20 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1214, 102, '2011-06-20 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (832, 100, '2011-06-09 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (832, 101, '2011-06-09 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (832, 102, '2011-06-09 00:00:00', 12, 91, -1, NULL);
INSERT INTO storage.base_operations VALUES (832, 103, '2011-06-09 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (832, 104, '2011-06-09 00:00:00', 12, 116, -1, NULL);
INSERT INTO storage.base_operations VALUES (832, 1, '2011-06-09 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (832, 0, '2011-06-09 00:00:00', 371, 217, 1, NULL);
INSERT INTO storage.base_operations VALUES (832, 3, '2011-06-09 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (832, 4, '2011-06-09 00:00:00', 371, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (832, 5, '2011-06-09 00:00:00', 9, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (832, 6, '2011-06-09 00:00:00', 371, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (932, 1, '2011-06-09 00:00:00', 8, 174, -500, NULL);
INSERT INTO storage.base_operations VALUES (932, 0, '2011-06-09 00:00:00', 147, 174, 500, NULL);
INSERT INTO storage.base_operations VALUES (932, 3, '2011-06-09 00:00:00', 8, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (932, 4, '2011-06-09 00:00:00', 147, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (932, 5, '2011-06-09 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (932, 6, '2011-06-09 00:00:00', 147, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (834, 0, '2011-04-20 00:00:00', 374, 176, 24, NULL);
INSERT INTO storage.base_operations VALUES (834, 3, '2011-04-20 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (834, 4, '2011-04-20 00:00:00', 374, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (834, 5, '2011-04-20 00:00:00', 9, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (834, 6, '2011-04-20 00:00:00', 374, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (835, 100, '2011-04-20 00:00:00', 12, 125, -32, NULL);
INSERT INTO storage.base_operations VALUES (1077, 100, '2011-06-15 00:00:00', 12, 85, -24, NULL);
INSERT INTO storage.base_operations VALUES (1077, 101, '2011-06-15 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (1077, 102, '2011-06-15 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (1077, 103, '2011-06-15 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (1077, 1, '2011-06-15 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1077, 0, '2011-06-15 00:00:00', 373, 285, 24, NULL);
INSERT INTO storage.base_operations VALUES (1077, 3, '2011-06-15 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1077, 4, '2011-06-15 00:00:00', 373, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1077, 5, '2011-06-15 00:00:00', 9, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1077, 6, '2011-06-15 00:00:00', 373, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1169, 100, '2011-07-08 00:00:00', 12, 113, -36, NULL);
INSERT INTO storage.base_operations VALUES (1169, 101, '2011-07-08 00:00:00', 12, 121, -36, NULL);
INSERT INTO storage.base_operations VALUES (1169, 102, '2011-07-08 00:00:00', 12, 126, -36, NULL);
INSERT INTO storage.base_operations VALUES (1169, 103, '2011-07-08 00:00:00', 12, 125, -36, NULL);
INSERT INTO storage.base_operations VALUES (1169, 104, '2011-07-08 00:00:00', 12, 88, -36, NULL);
INSERT INTO storage.base_operations VALUES (1169, 1, '2011-07-08 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1169, 0, '2011-07-08 00:00:00', 358, 186, 36, NULL);
INSERT INTO storage.base_operations VALUES (1169, 3, '2011-07-08 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1169, 4, '2011-07-08 00:00:00', 358, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1169, 5, '2011-07-08 00:00:00', 9, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1169, 6, '2011-07-08 00:00:00', 358, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1244, 5, '2011-07-05 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1244, 6, '2011-07-05 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1245, 1, '2011-07-05 00:00:00', 83, 86, -8, NULL);
INSERT INTO storage.base_operations VALUES (1245, 0, '2011-07-05 00:00:00', 30, 86, 8, NULL);
INSERT INTO storage.base_operations VALUES (1245, 3, '2011-07-05 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1245, 4, '2011-07-05 00:00:00', 30, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1245, 5, '2011-07-05 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1097, 100, '2011-06-29 00:00:00', 12, 84, -2, NULL);
INSERT INTO storage.base_operations VALUES (1097, 101, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (1097, 102, '2011-06-29 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (1097, 103, '2011-06-29 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (1097, 1, '2011-06-29 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1097, 0, '2011-06-29 00:00:00', 371, 280, 2, NULL);
INSERT INTO storage.base_operations VALUES (1097, 3, '2011-06-29 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1097, 4, '2011-06-29 00:00:00', 371, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1097, 5, '2011-06-29 00:00:00', 9, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1097, 6, '2011-06-29 00:00:00', 371, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1245, 6, '2011-07-05 00:00:00', 30, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1246, 1, '2011-07-05 00:00:00', 83, 87, -14, NULL);
INSERT INTO storage.base_operations VALUES (1246, 0, '2011-07-05 00:00:00', 30, 87, 14, NULL);
INSERT INTO storage.base_operations VALUES (1246, 3, '2011-07-05 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1246, 4, '2011-07-05 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1246, 5, '2011-07-05 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1246, 6, '2011-07-05 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1247, 1, '2011-07-05 00:00:00', 30, 84, -57, NULL);
INSERT INTO storage.base_operations VALUES (1247, 0, '2011-07-05 00:00:00', 61, 84, 57, NULL);
INSERT INTO storage.base_operations VALUES (1105, 100, '2011-06-29 00:00:00', 12, 140, -1, NULL);
INSERT INTO storage.base_operations VALUES (1105, 101, '2011-06-29 00:00:00', 12, 112, -1, NULL);
INSERT INTO storage.base_operations VALUES (1105, 1, '2011-06-29 00:00:00', 12, 324, 0, NULL);
INSERT INTO storage.base_operations VALUES (1105, 0, '2011-06-29 00:00:00', 371, 324, 1, NULL);
INSERT INTO storage.base_operations VALUES (1105, 3, '2011-06-29 00:00:00', 12, 324, 0, NULL);
INSERT INTO storage.base_operations VALUES (1105, 4, '2011-06-29 00:00:00', 371, 324, 0, NULL);
INSERT INTO storage.base_operations VALUES (1105, 5, '2011-06-29 00:00:00', 9, 324, 0, NULL);
INSERT INTO storage.base_operations VALUES (1105, 6, '2011-06-29 00:00:00', 371, 324, 0, NULL);
INSERT INTO storage.base_operations VALUES (1103, 100, '2011-06-29 00:00:00', 12, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (1103, 101, '2011-06-29 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (1103, 1, '2011-06-29 00:00:00', 12, 327, 0, NULL);
INSERT INTO storage.base_operations VALUES (1103, 0, '2011-06-29 00:00:00', 371, 327, 1, NULL);
INSERT INTO storage.base_operations VALUES (1103, 3, '2011-06-29 00:00:00', 12, 327, 0, NULL);
INSERT INTO storage.base_operations VALUES (1103, 4, '2011-06-29 00:00:00', 371, 327, 0, NULL);
INSERT INTO storage.base_operations VALUES (1103, 5, '2011-06-29 00:00:00', 9, 327, 0, NULL);
INSERT INTO storage.base_operations VALUES (1103, 6, '2011-06-29 00:00:00', 371, 327, 0, NULL);
INSERT INTO storage.base_operations VALUES (831, 100, '2011-06-09 00:00:00', 12, 113, -1, NULL);
INSERT INTO storage.base_operations VALUES (831, 101, '2011-06-09 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (831, 102, '2011-06-09 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (831, 103, '2011-06-09 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (831, 104, '2011-06-09 00:00:00', 12, 88, -1, NULL);
INSERT INTO storage.base_operations VALUES (831, 1, '2011-06-09 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (831, 0, '2011-06-09 00:00:00', 371, 186, 1, NULL);
INSERT INTO storage.base_operations VALUES (831, 3, '2011-06-09 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (831, 4, '2011-06-09 00:00:00', 371, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (831, 5, '2011-06-09 00:00:00', 9, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (831, 6, '2011-06-09 00:00:00', 371, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (833, 100, '2011-06-09 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (833, 101, '2011-06-09 00:00:00', 12, 334, -1, NULL);
INSERT INTO storage.base_operations VALUES (833, 102, '2011-06-09 00:00:00', 12, 335, -1, NULL);
INSERT INTO storage.base_operations VALUES (833, 103, '2011-06-09 00:00:00', 12, 351, -1, NULL);
INSERT INTO storage.base_operations VALUES (833, 1, '2011-06-09 00:00:00', 12, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (833, 0, '2011-06-09 00:00:00', 371, 347, 1, NULL);
INSERT INTO storage.base_operations VALUES (833, 3, '2011-06-09 00:00:00', 12, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (833, 4, '2011-06-09 00:00:00', 371, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (833, 5, '2011-06-09 00:00:00', 9, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (833, 6, '2011-06-09 00:00:00', 371, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (933, 1, '2011-06-09 00:00:00', 8, 175, -500, NULL);
INSERT INTO storage.base_operations VALUES (933, 0, '2011-06-09 00:00:00', 147, 175, 500, NULL);
INSERT INTO storage.base_operations VALUES (933, 3, '2011-06-09 00:00:00', 8, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (933, 4, '2011-06-09 00:00:00', 147, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (933, 5, '2011-06-09 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (933, 6, '2011-06-09 00:00:00', 147, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (834, 100, '2011-04-20 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (834, 101, '2011-04-20 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (834, 102, '2011-04-20 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (834, 103, '2011-04-20 00:00:00', 12, 88, -24, NULL);
INSERT INTO storage.base_operations VALUES (834, 1, '2011-04-20 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (1078, 100, '2011-06-15 00:00:00', 12, 86, -24, NULL);
INSERT INTO storage.base_operations VALUES (1078, 101, '2011-06-15 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (1078, 102, '2011-06-15 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (1078, 103, '2011-06-15 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (1078, 1, '2011-06-15 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1078, 0, '2011-06-15 00:00:00', 373, 290, 24, NULL);
INSERT INTO storage.base_operations VALUES (956, 1, '2011-06-24 00:00:00', 62, 143, -221, NULL);
INSERT INTO storage.base_operations VALUES (956, 0, '2011-06-24 00:00:00', 8, 143, 221, NULL);
INSERT INTO storage.base_operations VALUES (956, 3, '2011-06-24 00:00:00', 62, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (956, 4, '2011-06-24 00:00:00', 8, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (956, 5, '2011-06-24 00:00:00', 9, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (956, 6, '2011-06-24 00:00:00', 8, 143, 0, NULL);
INSERT INTO storage.base_operations VALUES (1078, 3, '2011-06-15 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1078, 4, '2011-06-15 00:00:00', 373, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1078, 5, '2011-06-15 00:00:00', 9, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1078, 6, '2011-06-15 00:00:00', 373, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1170, 100, '2011-07-08 00:00:00', 12, 125, -30, NULL);
INSERT INTO storage.base_operations VALUES (1170, 101, '2011-07-08 00:00:00', 12, 126, -30, NULL);
INSERT INTO storage.base_operations VALUES (1170, 102, '2011-07-08 00:00:00', 12, 121, -30, NULL);
INSERT INTO storage.base_operations VALUES (1170, 103, '2011-07-08 00:00:00', 12, 114, -30, NULL);
INSERT INTO storage.base_operations VALUES (1170, 104, '2011-07-08 00:00:00', 12, 89, -30, NULL);
INSERT INTO storage.base_operations VALUES (1170, 1, '2011-07-08 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1170, 0, '2011-07-08 00:00:00', 358, 205, 30, NULL);
INSERT INTO storage.base_operations VALUES (1170, 3, '2011-07-08 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1170, 4, '2011-07-08 00:00:00', 358, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1170, 5, '2011-07-08 00:00:00', 9, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1170, 6, '2011-07-08 00:00:00', 358, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1192, 100, '2011-06-03 00:00:00', 12, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (1192, 101, '2011-06-03 00:00:00', 12, 143, -1, NULL);
INSERT INTO storage.base_operations VALUES (1192, 1, '2011-06-03 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1192, 0, '2011-06-03 00:00:00', 375, 321, 1, NULL);
INSERT INTO storage.base_operations VALUES (1192, 3, '2011-06-03 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1192, 4, '2011-06-03 00:00:00', 375, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1192, 5, '2011-06-03 00:00:00', 9, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1192, 6, '2011-06-03 00:00:00', 375, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (974, 1, '2011-06-30 00:00:00', 37, 140, -25, NULL);
INSERT INTO storage.base_operations VALUES (974, 0, '2011-06-30 00:00:00', 38, 140, 25, NULL);
INSERT INTO storage.base_operations VALUES (974, 3, '2011-06-30 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (974, 4, '2011-06-30 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (974, 5, '2011-06-30 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (974, 6, '2011-06-30 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (1203, 100, '2011-05-31 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (1203, 101, '2011-05-31 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1203, 102, '2011-05-31 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1203, 103, '2011-05-31 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1203, 104, '2011-05-31 00:00:00', 12, 90, -1, NULL);
INSERT INTO storage.base_operations VALUES (1203, 1, '2011-05-31 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (990, 1, '2011-07-01 00:00:00', 37, 87, -131, NULL);
INSERT INTO storage.base_operations VALUES (990, 0, '2011-07-01 00:00:00', 38, 87, 131, NULL);
INSERT INTO storage.base_operations VALUES (990, 3, '2011-07-01 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (990, 4, '2011-07-01 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (990, 5, '2011-07-01 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (990, 6, '2011-07-01 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1203, 0, '2011-05-31 00:00:00', 378, 210, 1, NULL);
INSERT INTO storage.base_operations VALUES (1203, 3, '2011-05-31 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1203, 4, '2011-05-31 00:00:00', 378, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1203, 5, '2011-05-31 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1203, 6, '2011-05-31 00:00:00', 378, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1214, 103, '2011-06-20 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1214, 104, '2011-06-20 00:00:00', 12, 113, -1, NULL);
INSERT INTO storage.base_operations VALUES (1214, 1, '2011-06-20 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1214, 0, '2011-06-20 00:00:00', 356, 256, 1, NULL);
INSERT INTO storage.base_operations VALUES (1214, 3, '2011-06-20 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1214, 4, '2011-06-20 00:00:00', 356, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1214, 5, '2011-06-20 00:00:00', 9, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1214, 6, '2011-06-20 00:00:00', 356, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1247, 3, '2011-07-05 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1247, 4, '2011-07-05 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1247, 5, '2011-07-05 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1247, 6, '2011-07-05 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1248, 1, '2011-07-05 00:00:00', 30, 86, -8, NULL);
INSERT INTO storage.base_operations VALUES (1248, 0, '2011-07-05 00:00:00', 61, 86, 8, NULL);
INSERT INTO storage.base_operations VALUES (1229, 100, '2011-05-30 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (1229, 101, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1229, 102, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1229, 103, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1229, 104, '2011-05-30 00:00:00', 12, 90, -1, NULL);
INSERT INTO storage.base_operations VALUES (1229, 1, '2011-05-30 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1229, 0, '2011-05-30 00:00:00', 379, 210, 1, NULL);
INSERT INTO storage.base_operations VALUES (1229, 3, '2011-05-30 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1229, 4, '2011-05-30 00:00:00', 379, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1229, 5, '2011-05-30 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1229, 6, '2011-05-30 00:00:00', 379, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1234, 100, '2011-05-30 00:00:00', 12, 97, -1, NULL);
INSERT INTO storage.base_operations VALUES (1004, 3, '2011-07-01 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1004, 4, '2011-07-01 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1004, 5, '2011-07-01 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1004, 6, '2011-07-01 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1016, 1, '2011-07-02 00:00:00', 30, 86, -90, NULL);
INSERT INTO storage.base_operations VALUES (1016, 0, '2011-07-02 00:00:00', 61, 86, 90, NULL);
INSERT INTO storage.base_operations VALUES (1016, 3, '2011-07-02 00:00:00', 30, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1016, 4, '2011-07-02 00:00:00', 61, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1016, 5, '2011-07-02 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1016, 6, '2011-07-02 00:00:00', 61, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1021, 1, '2011-07-02 00:00:00', 30, 87, -82, NULL);
INSERT INTO storage.base_operations VALUES (1021, 0, '2011-07-02 00:00:00', 61, 87, 82, NULL);
INSERT INTO storage.base_operations VALUES (1079, 100, '2011-06-15 00:00:00', 12, 84, -27, NULL);
INSERT INTO storage.base_operations VALUES (1079, 101, '2011-06-15 00:00:00', 12, 113, -27, NULL);
INSERT INTO storage.base_operations VALUES (1079, 102, '2011-06-15 00:00:00', 12, 125, -27, NULL);
INSERT INTO storage.base_operations VALUES (1079, 103, '2011-06-15 00:00:00', 12, 121, -27, NULL);
INSERT INTO storage.base_operations VALUES (1079, 104, '2011-06-15 00:00:00', 12, 126, -27, NULL);
INSERT INTO storage.base_operations VALUES (1171, 100, '2011-07-08 00:00:00', 12, 115, -30, NULL);
INSERT INTO storage.base_operations VALUES (1171, 101, '2011-07-08 00:00:00', 12, 125, -30, NULL);
INSERT INTO storage.base_operations VALUES (1171, 102, '2011-07-08 00:00:00', 12, 121, -30, NULL);
INSERT INTO storage.base_operations VALUES (1171, 103, '2011-07-08 00:00:00', 12, 126, -30, NULL);
INSERT INTO storage.base_operations VALUES (1171, 104, '2011-07-08 00:00:00', 12, 90, -30, NULL);
INSERT INTO storage.base_operations VALUES (1171, 1, '2011-07-08 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1171, 0, '2011-07-08 00:00:00', 358, 210, 30, NULL);
INSERT INTO storage.base_operations VALUES (966, 1, '2011-06-27 00:00:00', 37, 140, -50, NULL);
INSERT INTO storage.base_operations VALUES (1171, 3, '2011-07-08 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1171, 4, '2011-07-08 00:00:00', 358, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1171, 5, '2011-07-08 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1171, 6, '2011-07-08 00:00:00', 358, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1248, 3, '2011-07-05 00:00:00', 30, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1248, 4, '2011-07-05 00:00:00', 61, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1248, 5, '2011-07-05 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1248, 6, '2011-07-05 00:00:00', 61, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1249, 1, '2011-07-05 00:00:00', 30, 87, -14, NULL);
INSERT INTO storage.base_operations VALUES (1249, 0, '2011-07-05 00:00:00', 61, 87, 14, NULL);
INSERT INTO storage.base_operations VALUES (1204, 100, '2011-05-31 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1204, 101, '2011-05-31 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1204, 102, '2011-05-31 00:00:00', 12, 91, -1, NULL);
INSERT INTO storage.base_operations VALUES (1204, 103, '2011-05-31 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1204, 104, '2011-05-31 00:00:00', 12, 116, -1, NULL);
INSERT INTO storage.base_operations VALUES (1204, 1, '2011-05-31 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1204, 0, '2011-05-31 00:00:00', 378, 217, 1, NULL);
INSERT INTO storage.base_operations VALUES (1204, 3, '2011-05-31 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1204, 4, '2011-05-31 00:00:00', 378, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1204, 5, '2011-05-31 00:00:00', 9, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1204, 6, '2011-05-31 00:00:00', 378, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (966, 0, '2011-06-27 00:00:00', 38, 140, 50, NULL);
INSERT INTO storage.base_operations VALUES (966, 3, '2011-06-27 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (966, 4, '2011-06-27 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (966, 5, '2011-06-27 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (966, 6, '2011-06-27 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (983, 1, '2011-07-01 00:00:00', 30, 86, -38, NULL);
INSERT INTO storage.base_operations VALUES (983, 0, '2011-07-01 00:00:00', 61, 86, 38, NULL);
INSERT INTO storage.base_operations VALUES (983, 3, '2011-07-01 00:00:00', 30, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (983, 4, '2011-07-01 00:00:00', 61, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (983, 5, '2011-07-01 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (983, 6, '2011-07-01 00:00:00', 61, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1234, 101, '2011-05-30 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (1234, 102, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1234, 103, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1234, 104, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1234, 1, '2011-05-30 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1234, 0, '2011-05-30 00:00:00', 378, 268, 1, NULL);
INSERT INTO storage.base_operations VALUES (998, 1, '2011-07-01 00:00:00', 30, 86, -55, NULL);
INSERT INTO storage.base_operations VALUES (1234, 3, '2011-05-30 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1234, 4, '2011-05-30 00:00:00', 378, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1234, 5, '2011-05-30 00:00:00', 9, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1234, 6, '2011-05-30 00:00:00', 378, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (252, -1, '2011-04-18 00:00:00', 12, 91, 505, NULL);
INSERT INTO storage.base_operations VALUES (101, 100, '2011-04-19 00:00:00', 12, 91, -24, NULL);
INSERT INTO storage.base_operations VALUES (101, 101, '2011-04-19 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (101, 102, '2011-04-19 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (101, 103, '2011-04-19 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (101, 1, '2011-04-19 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (101, 0, '2011-04-19 00:00:00', 146, 200, 24, NULL);
INSERT INTO storage.base_operations VALUES (101, 3, '2011-04-19 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (101, 4, '2011-04-19 00:00:00', 146, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (101, 5, '2011-04-19 00:00:00', 9, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (101, 6, '2011-04-19 00:00:00', 146, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (92, 0, '2011-04-19 00:00:00', 146, 251, 8, NULL);
INSERT INTO storage.base_operations VALUES (92, 3, '2011-04-19 00:00:00', 12, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (92, 4, '2011-04-19 00:00:00', 146, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (92, 5, '2011-04-19 00:00:00', 9, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (92, 6, '2011-04-19 00:00:00', 146, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (94, 100, '2011-04-19 00:00:00', 12, 85, -24, NULL);
INSERT INTO storage.base_operations VALUES (94, 101, '2011-04-19 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (94, 102, '2011-04-19 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (94, 103, '2011-04-19 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (94, 1, '2011-04-19 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (94, 0, '2011-04-19 00:00:00', 146, 285, 24, NULL);
INSERT INTO storage.base_operations VALUES (94, 3, '2011-04-19 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (94, 4, '2011-04-19 00:00:00', 146, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (998, 0, '2011-07-01 00:00:00', 61, 86, 55, NULL);
INSERT INTO storage.base_operations VALUES (998, 3, '2011-07-01 00:00:00', 30, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (998, 4, '2011-07-01 00:00:00', 61, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (998, 5, '2011-07-01 00:00:00', 9, 86, 1, NULL);
INSERT INTO storage.base_operations VALUES (94, 5, '2011-04-19 00:00:00', 9, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (94, 6, '2011-04-19 00:00:00', 146, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (96, 100, '2011-04-19 00:00:00', 12, 87, -16, NULL);
INSERT INTO storage.base_operations VALUES (96, 101, '2011-04-19 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (96, 102, '2011-04-19 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (96, 103, '2011-04-19 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (96, 1, '2011-04-19 00:00:00', 12, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (96, 0, '2011-04-19 00:00:00', 146, 295, 16, NULL);
INSERT INTO storage.base_operations VALUES (96, 3, '2011-04-19 00:00:00', 12, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (96, 4, '2011-04-19 00:00:00', 146, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (96, 5, '2011-04-19 00:00:00', 9, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (1079, 1, '2011-06-15 00:00:00', 12, 300, 0, NULL);
INSERT INTO storage.base_operations VALUES (1079, 0, '2011-06-15 00:00:00', 373, 300, 27, NULL);
INSERT INTO storage.base_operations VALUES (1079, 3, '2011-06-15 00:00:00', 12, 300, 0, NULL);
INSERT INTO storage.base_operations VALUES (1079, 4, '2011-06-15 00:00:00', 373, 300, 0, NULL);
INSERT INTO storage.base_operations VALUES (1079, 5, '2011-06-15 00:00:00', 9, 300, 0, NULL);
INSERT INTO storage.base_operations VALUES (1079, 6, '2011-06-15 00:00:00', 373, 300, 0, NULL);
INSERT INTO storage.base_operations VALUES (957, 1, '2011-06-25 00:00:00', 38, 141, -77, NULL);
INSERT INTO storage.base_operations VALUES (957, 0, '2011-06-25 00:00:00', 62, 141, 77, NULL);
INSERT INTO storage.base_operations VALUES (957, 3, '2011-06-25 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (957, 4, '2011-06-25 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (957, 5, '2011-06-25 00:00:00', 9, 141, 2, NULL);
INSERT INTO storage.base_operations VALUES (957, 6, '2011-06-25 00:00:00', 62, 141, -2, NULL);
INSERT INTO storage.base_operations VALUES (1090, 1, '2011-06-15 00:00:00', 12, 116, -24, NULL);
INSERT INTO storage.base_operations VALUES (1090, 0, '2011-06-15 00:00:00', 373, 116, 24, NULL);
INSERT INTO storage.base_operations VALUES (1172, 100, '2011-07-08 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (1172, 101, '2011-07-08 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (1172, 102, '2011-07-08 00:00:00', 12, 91, -24, NULL);
INSERT INTO storage.base_operations VALUES (1172, 103, '2011-07-08 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (1172, 104, '2011-07-08 00:00:00', 12, 116, -24, NULL);
INSERT INTO storage.base_operations VALUES (1172, 1, '2011-07-08 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1172, 0, '2011-07-08 00:00:00', 358, 217, 24, NULL);
INSERT INTO storage.base_operations VALUES (1172, 3, '2011-07-08 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1172, 4, '2011-07-08 00:00:00', 358, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1172, 5, '2011-07-08 00:00:00', 9, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1172, 6, '2011-07-08 00:00:00', 358, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1193, 100, '2011-05-30 00:00:00', 12, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (1193, 101, '2011-05-30 00:00:00', 12, 330, -1, NULL);
INSERT INTO storage.base_operations VALUES (1193, 1, '2011-05-30 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1193, 0, '2011-05-30 00:00:00', 375, 230, 1, NULL);
INSERT INTO storage.base_operations VALUES (1193, 3, '2011-05-30 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1193, 4, '2011-05-30 00:00:00', 375, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1193, 5, '2011-05-30 00:00:00', 9, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1193, 6, '2011-05-30 00:00:00', 375, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1205, 100, '2011-05-31 00:00:00', 12, 84, -1, NULL);
INSERT INTO storage.base_operations VALUES (1205, 101, '2011-05-31 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1205, 102, '2011-05-31 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1205, 103, '2011-05-31 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1205, 1, '2011-05-31 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1205, 0, '2011-05-31 00:00:00', 378, 280, 1, NULL);
INSERT INTO storage.base_operations VALUES (1205, 3, '2011-05-31 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1205, 4, '2011-05-31 00:00:00', 378, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1205, 5, '2011-05-31 00:00:00', 9, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1205, 6, '2011-05-31 00:00:00', 378, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1215, 100, '2011-06-21 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1215, 101, '2011-06-21 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1215, 102, '2011-06-21 00:00:00', 12, 91, -1, NULL);
INSERT INTO storage.base_operations VALUES (1215, 103, '2011-06-21 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1215, 104, '2011-06-21 00:00:00', 12, 116, -1, NULL);
INSERT INTO storage.base_operations VALUES (1215, 1, '2011-06-21 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1215, 0, '2011-06-21 00:00:00', 375, 217, 1, NULL);
INSERT INTO storage.base_operations VALUES (1215, 3, '2011-06-21 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1215, 4, '2011-06-21 00:00:00', 375, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1215, 5, '2011-06-21 00:00:00', 9, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1215, 6, '2011-06-21 00:00:00', 375, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1249, 3, '2011-07-05 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1249, 4, '2011-07-05 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1249, 5, '2011-07-05 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1249, 6, '2011-07-05 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1250, 1, '2011-07-05 00:00:00', 61, 84, -57, NULL);
INSERT INTO storage.base_operations VALUES (1230, 100, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1230, 101, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1230, 102, '2011-05-30 00:00:00', 12, 91, -1, NULL);
INSERT INTO storage.base_operations VALUES (1230, 103, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1230, 104, '2011-05-30 00:00:00', 12, 116, -1, NULL);
INSERT INTO storage.base_operations VALUES (1230, 1, '2011-05-30 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1230, 0, '2011-05-30 00:00:00', 378, 217, 1, NULL);
INSERT INTO storage.base_operations VALUES (975, 1, '2011-06-30 00:00:00', 37, 141, -10, NULL);
INSERT INTO storage.base_operations VALUES (975, 0, '2011-06-30 00:00:00', 38, 141, 10, NULL);
INSERT INTO storage.base_operations VALUES (975, 3, '2011-06-30 00:00:00', 37, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (975, 4, '2011-06-30 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (975, 5, '2011-06-30 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (975, 6, '2011-06-30 00:00:00', 38, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (991, 1, '2011-07-01 00:00:00', 35, 84, -94, NULL);
INSERT INTO storage.base_operations VALUES (991, 0, '2011-07-01 00:00:00', 83, 84, 94, NULL);
INSERT INTO storage.base_operations VALUES (991, 3, '2011-07-01 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (991, 4, '2011-07-01 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (991, 5, '2011-07-01 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (991, 6, '2011-07-01 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (998, 6, '2011-07-01 00:00:00', 61, 86, -1, NULL);
INSERT INTO storage.base_operations VALUES (1011, 1, '2011-07-02 00:00:00', 30, 84, -118, NULL);
INSERT INTO storage.base_operations VALUES (1011, 0, '2011-07-02 00:00:00', 61, 84, 118, NULL);
INSERT INTO storage.base_operations VALUES (1011, 3, '2011-07-02 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1011, 4, '2011-07-02 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1011, 5, '2011-07-02 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1011, 6, '2011-07-02 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1021, 3, '2011-07-02 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1021, 4, '2011-07-02 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1021, 5, '2011-07-02 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1021, 6, '2011-07-02 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1028, 1, '2011-07-02 00:00:00', 37, 84, -50, NULL);
INSERT INTO storage.base_operations VALUES (1028, 0, '2011-07-02 00:00:00', 38, 84, 50, NULL);
INSERT INTO storage.base_operations VALUES (1028, 3, '2011-07-02 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1028, 4, '2011-07-02 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1028, 5, '2011-07-02 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1028, 6, '2011-07-02 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1080, 100, '2011-06-15 00:00:00', 12, 85, -18, NULL);
INSERT INTO storage.base_operations VALUES (1080, 101, '2011-06-15 00:00:00', 12, 114, -18, NULL);
INSERT INTO storage.base_operations VALUES (1080, 102, '2011-06-15 00:00:00', 12, 125, -18, NULL);
INSERT INTO storage.base_operations VALUES (1080, 103, '2011-06-15 00:00:00', 12, 121, -18, NULL);
INSERT INTO storage.base_operations VALUES (1080, 104, '2011-06-15 00:00:00', 12, 126, -18, NULL);
INSERT INTO storage.base_operations VALUES (1080, 1, '2011-06-15 00:00:00', 12, 306, 0, NULL);
INSERT INTO storage.base_operations VALUES (1173, 100, '2011-07-08 00:00:00', 12, 119, -8, NULL);
INSERT INTO storage.base_operations VALUES (1173, 101, '2011-07-08 00:00:00', 12, 331, -8, NULL);
INSERT INTO storage.base_operations VALUES (1173, 1, '2011-07-08 00:00:00', 12, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1173, 0, '2011-07-08 00:00:00', 358, 192, 8, NULL);
INSERT INTO storage.base_operations VALUES (1173, 3, '2011-07-08 00:00:00', 12, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1173, 4, '2011-07-08 00:00:00', 358, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (967, 1, '2011-06-28 00:00:00', 37, 140, -116, NULL);
INSERT INTO storage.base_operations VALUES (967, 0, '2011-06-28 00:00:00', 38, 140, 116, NULL);
INSERT INTO storage.base_operations VALUES (967, 3, '2011-06-28 00:00:00', 37, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (967, 4, '2011-06-28 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (967, 5, '2011-06-28 00:00:00', 9, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (967, 6, '2011-06-28 00:00:00', 38, 140, 0, NULL);
INSERT INTO storage.base_operations VALUES (1173, 5, '2011-07-08 00:00:00', 9, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1173, 6, '2011-07-08 00:00:00', 358, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1250, 0, '2011-07-05 00:00:00', 37, 84, 57, NULL);
INSERT INTO storage.base_operations VALUES (1250, 3, '2011-07-05 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1250, 4, '2011-07-05 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1250, 5, '2011-07-05 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1250, 6, '2011-07-05 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1251, 1, '2011-07-05 00:00:00', 61, 86, -8, NULL);
INSERT INTO storage.base_operations VALUES (1251, 0, '2011-07-05 00:00:00', 37, 86, 8, NULL);
INSERT INTO storage.base_operations VALUES (1251, 3, '2011-07-05 00:00:00', 61, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1251, 4, '2011-07-05 00:00:00', 37, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1251, 5, '2011-07-05 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1251, 6, '2011-07-05 00:00:00', 37, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1252, 1, '2011-07-05 00:00:00', 61, 87, -14, NULL);
INSERT INTO storage.base_operations VALUES (1252, 0, '2011-07-05 00:00:00', 37, 87, 14, NULL);
INSERT INTO storage.base_operations VALUES (1252, 3, '2011-07-05 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1252, 4, '2011-07-05 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1252, 5, '2011-07-05 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (830, 100, '2011-06-03 00:00:00', 12, 141, -3, NULL);
INSERT INTO storage.base_operations VALUES (830, 101, '2011-06-03 00:00:00', 12, 330, -3, NULL);
INSERT INTO storage.base_operations VALUES (830, 1, '2011-06-03 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (830, 0, '2011-06-03 00:00:00', 368, 230, 3, NULL);
INSERT INTO storage.base_operations VALUES (830, 3, '2011-06-03 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (830, 4, '2011-06-03 00:00:00', 368, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (830, 5, '2011-06-03 00:00:00', 9, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (830, 6, '2011-06-03 00:00:00', 368, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (829, 100, '2011-06-03 00:00:00', 12, 125, -3, NULL);
INSERT INTO storage.base_operations VALUES (829, 101, '2011-06-03 00:00:00', 12, 334, -3, NULL);
INSERT INTO storage.base_operations VALUES (829, 102, '2011-06-03 00:00:00', 12, 335, -3, NULL);
INSERT INTO storage.base_operations VALUES (829, 103, '2011-06-03 00:00:00', 12, 351, -3, NULL);
INSERT INTO storage.base_operations VALUES (829, 1, '2011-06-03 00:00:00', 12, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (829, 0, '2011-06-03 00:00:00', 368, 347, 3, NULL);
INSERT INTO storage.base_operations VALUES (829, 3, '2011-06-03 00:00:00', 12, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (829, 4, '2011-06-03 00:00:00', 368, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (829, 5, '2011-06-03 00:00:00', 9, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (829, 6, '2011-06-03 00:00:00', 368, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (828, 100, '2011-06-03 00:00:00', 12, 97, -3, NULL);
INSERT INTO storage.base_operations VALUES (828, 101, '2011-06-03 00:00:00', 12, 115, -3, NULL);
INSERT INTO storage.base_operations VALUES (828, 102, '2011-06-03 00:00:00', 12, 125, -3, NULL);
INSERT INTO storage.base_operations VALUES (828, 103, '2011-06-03 00:00:00', 12, 126, -3, NULL);
INSERT INTO storage.base_operations VALUES (828, 104, '2011-06-03 00:00:00', 12, 121, -3, NULL);
INSERT INTO storage.base_operations VALUES (828, 1, '2011-06-03 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (828, 0, '2011-06-03 00:00:00', 368, 268, 3, NULL);
INSERT INTO storage.base_operations VALUES (828, 3, '2011-06-03 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (828, 4, '2011-06-03 00:00:00', 368, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (828, 5, '2011-06-03 00:00:00', 9, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (828, 6, '2011-06-03 00:00:00', 368, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1005, 1, '2011-07-01 00:00:00', 37, 87, -63, NULL);
INSERT INTO storage.base_operations VALUES (1005, 0, '2011-07-01 00:00:00', 38, 87, 63, NULL);
INSERT INTO storage.base_operations VALUES (1005, 3, '2011-07-01 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1005, 4, '2011-07-01 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1005, 5, '2011-07-01 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1005, 6, '2011-07-01 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1017, 1, '2011-07-02 00:00:00', 61, 86, -90, NULL);
INSERT INTO storage.base_operations VALUES (1017, 0, '2011-07-02 00:00:00', 37, 86, 90, NULL);
INSERT INTO storage.base_operations VALUES (1017, 3, '2011-07-02 00:00:00', 61, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1017, 4, '2011-07-02 00:00:00', 37, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1017, 5, '2011-07-02 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1017, 6, '2011-07-02 00:00:00', 37, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1025, 1, '2011-07-02 00:00:00', 83, 84, -50, NULL);
INSERT INTO storage.base_operations VALUES (1025, 0, '2011-07-02 00:00:00', 30, 84, 50, NULL);
INSERT INTO storage.base_operations VALUES (1025, 3, '2011-07-02 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1025, 4, '2011-07-02 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1025, 5, '2011-07-02 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1025, 6, '2011-07-02 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1035, 1, '2011-07-02 00:00:00', 37, 86, -49, NULL);
INSERT INTO storage.base_operations VALUES (1035, 0, '2011-07-02 00:00:00', 38, 86, 49, NULL);
INSERT INTO storage.base_operations VALUES (1035, 3, '2011-07-02 00:00:00', 37, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1035, 4, '2011-07-02 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1035, 5, '2011-07-02 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1035, 6, '2011-07-02 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1038, 1, '2011-07-02 00:00:00', 30, 87, -41, NULL);
INSERT INTO storage.base_operations VALUES (1038, 0, '2011-07-02 00:00:00', 61, 87, 41, NULL);
INSERT INTO storage.base_operations VALUES (1038, 3, '2011-07-02 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1038, 4, '2011-07-02 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1038, 5, '2011-07-02 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1080, 0, '2011-06-15 00:00:00', 373, 306, 18, NULL);
INSERT INTO storage.base_operations VALUES (1080, 3, '2011-06-15 00:00:00', 12, 306, 0, NULL);
INSERT INTO storage.base_operations VALUES (1080, 4, '2011-06-15 00:00:00', 373, 306, 0, NULL);
INSERT INTO storage.base_operations VALUES (826, 100, '2011-06-03 00:00:00', 12, 125, -3, NULL);
INSERT INTO storage.base_operations VALUES (826, 101, '2011-06-03 00:00:00', 12, 99, -3, NULL);
INSERT INTO storage.base_operations VALUES (826, 102, '2011-06-03 00:00:00', 12, 114, -3, NULL);
INSERT INTO storage.base_operations VALUES (826, 103, '2011-06-03 00:00:00', 12, 126, -3, NULL);
INSERT INTO storage.base_operations VALUES (826, 104, '2011-06-03 00:00:00', 12, 121, -3, NULL);
INSERT INTO storage.base_operations VALUES (826, 1, '2011-06-03 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (826, 0, '2011-06-03 00:00:00', 368, 262, 3, NULL);
INSERT INTO storage.base_operations VALUES (826, 3, '2011-06-03 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (826, 4, '2011-06-03 00:00:00', 368, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (826, 5, '2011-06-03 00:00:00', 9, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (826, 6, '2011-06-03 00:00:00', 368, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1080, 5, '2011-06-15 00:00:00', 9, 306, 0, NULL);
INSERT INTO storage.base_operations VALUES (1080, 6, '2011-06-15 00:00:00', 373, 306, 0, NULL);
INSERT INTO storage.base_operations VALUES (1090, 3, '2011-06-15 00:00:00', 12, 116, 0, NULL);
INSERT INTO storage.base_operations VALUES (958, 1, '2011-06-25 00:00:00', 62, 141, -75, NULL);
INSERT INTO storage.base_operations VALUES (958, 0, '2011-06-25 00:00:00', 8, 141, 75, NULL);
INSERT INTO storage.base_operations VALUES (958, 3, '2011-06-25 00:00:00', 62, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (958, 4, '2011-06-25 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (958, 5, '2011-06-25 00:00:00', 9, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (958, 6, '2011-06-25 00:00:00', 8, 141, 0, NULL);
INSERT INTO storage.base_operations VALUES (1090, 4, '2011-06-15 00:00:00', 373, 116, 0, NULL);
INSERT INTO storage.base_operations VALUES (1090, 5, '2011-06-15 00:00:00', 9, 116, 0, NULL);
INSERT INTO storage.base_operations VALUES (1090, 6, '2011-06-15 00:00:00', 373, 116, 0, NULL);
INSERT INTO storage.base_operations VALUES (1174, 100, '2011-07-08 00:00:00', 12, 141, -9, NULL);
INSERT INTO storage.base_operations VALUES (1174, 101, '2011-07-08 00:00:00', 12, 330, -9, NULL);
INSERT INTO storage.base_operations VALUES (1174, 1, '2011-07-08 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (976, 1, '2011-06-30 00:00:00', 35, 87, -92, NULL);
INSERT INTO storage.base_operations VALUES (976, 0, '2011-06-30 00:00:00', 83, 87, 92, NULL);
INSERT INTO storage.base_operations VALUES (976, 3, '2011-06-30 00:00:00', 35, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (976, 4, '2011-06-30 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (976, 5, '2011-06-30 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (976, 6, '2011-06-30 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (984, 1, '2011-07-01 00:00:00', 61, 86, -38, NULL);
INSERT INTO storage.base_operations VALUES (984, 0, '2011-07-01 00:00:00', 37, 86, 38, NULL);
INSERT INTO storage.base_operations VALUES (984, 3, '2011-07-01 00:00:00', 61, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (984, 4, '2011-07-01 00:00:00', 37, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (984, 5, '2011-07-01 00:00:00', 9, 86, 1, NULL);
INSERT INTO storage.base_operations VALUES (984, 6, '2011-07-01 00:00:00', 37, 86, -1, NULL);
INSERT INTO storage.base_operations VALUES (992, 1, '2011-07-01 00:00:00', 83, 84, -94, NULL);
INSERT INTO storage.base_operations VALUES (992, 0, '2011-07-01 00:00:00', 30, 84, 94, NULL);
INSERT INTO storage.base_operations VALUES (992, 3, '2011-07-01 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (992, 4, '2011-07-01 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (992, 5, '2011-07-01 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (992, 6, '2011-07-01 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (999, 1, '2011-07-01 00:00:00', 61, 86, -54, NULL);
INSERT INTO storage.base_operations VALUES (999, 0, '2011-07-01 00:00:00', 37, 86, 54, NULL);
INSERT INTO storage.base_operations VALUES (999, 3, '2011-07-01 00:00:00', 61, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (999, 4, '2011-07-01 00:00:00', 37, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (999, 5, '2011-07-01 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (999, 6, '2011-07-01 00:00:00', 37, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1174, 0, '2011-07-08 00:00:00', 358, 230, 9, NULL);
INSERT INTO storage.base_operations VALUES (1174, 3, '2011-07-08 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1174, 4, '2011-07-08 00:00:00', 358, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1174, 5, '2011-07-08 00:00:00', 9, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1174, 6, '2011-07-08 00:00:00', 358, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1194, 1, '2011-05-30 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (1012, 1, '2011-07-02 00:00:00', 61, 84, -118, NULL);
INSERT INTO storage.base_operations VALUES (1012, 0, '2011-07-02 00:00:00', 37, 84, 118, NULL);
INSERT INTO storage.base_operations VALUES (1012, 3, '2011-07-02 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1012, 4, '2011-07-02 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1012, 5, '2011-07-02 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1012, 6, '2011-07-02 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1098, 100, '2011-06-29 00:00:00', 12, 85, -2, NULL);
INSERT INTO storage.base_operations VALUES (1098, 101, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (1098, 102, '2011-06-29 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (1098, 103, '2011-06-29 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (1098, 1, '2011-06-29 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1022, 1, '2011-07-02 00:00:00', 61, 87, -82, NULL);
INSERT INTO storage.base_operations VALUES (1022, 0, '2011-07-02 00:00:00', 37, 87, 82, NULL);
INSERT INTO storage.base_operations VALUES (1022, 3, '2011-07-02 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1022, 4, '2011-07-02 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1022, 5, '2011-07-02 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1022, 6, '2011-07-02 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1098, 0, '2011-06-29 00:00:00', 371, 285, 2, NULL);
INSERT INTO storage.base_operations VALUES (1098, 3, '2011-06-29 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1098, 4, '2011-06-29 00:00:00', 371, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1098, 5, '2011-06-29 00:00:00', 9, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1098, 6, '2011-06-29 00:00:00', 371, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1029, 1, '2011-07-02 00:00:00', 38, 84, -212, NULL);
INSERT INTO storage.base_operations VALUES (1029, 0, '2011-07-02 00:00:00', 62, 84, 212, NULL);
INSERT INTO storage.base_operations VALUES (1029, 3, '2011-07-02 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1029, 4, '2011-07-02 00:00:00', 62, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1029, 5, '2011-07-02 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1029, 6, '2011-07-02 00:00:00', 62, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1032, 1, '2011-07-02 00:00:00', 83, 86, -49, NULL);
INSERT INTO storage.base_operations VALUES (1032, 0, '2011-07-02 00:00:00', 30, 86, 49, NULL);
INSERT INTO storage.base_operations VALUES (1032, 3, '2011-07-02 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1032, 4, '2011-07-02 00:00:00', 30, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1032, 5, '2011-07-02 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1032, 6, '2011-07-02 00:00:00', 30, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1034, 1, '2011-07-02 00:00:00', 61, 86, -49, NULL);
INSERT INTO storage.base_operations VALUES (1034, 0, '2011-07-02 00:00:00', 37, 86, 49, NULL);
INSERT INTO storage.base_operations VALUES (1034, 3, '2011-07-02 00:00:00', 61, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1034, 4, '2011-07-02 00:00:00', 37, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1081, 100, '2011-06-15 00:00:00', 12, 86, -18, NULL);
INSERT INTO storage.base_operations VALUES (1081, 101, '2011-06-15 00:00:00', 12, 125, -18, NULL);
INSERT INTO storage.base_operations VALUES (1041, 1, '2011-07-03 00:00:00', 35, 84, -35, NULL);
INSERT INTO storage.base_operations VALUES (1041, 0, '2011-07-03 00:00:00', 83, 84, 35, NULL);
INSERT INTO storage.base_operations VALUES (1041, 3, '2011-07-03 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1041, 4, '2011-07-03 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1041, 5, '2011-07-03 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1041, 6, '2011-07-03 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1081, 102, '2011-06-15 00:00:00', 12, 115, -18, NULL);
INSERT INTO storage.base_operations VALUES (1081, 103, '2011-06-15 00:00:00', 12, 121, -18, NULL);
INSERT INTO storage.base_operations VALUES (1081, 104, '2011-06-15 00:00:00', 12, 126, -18, NULL);
INSERT INTO storage.base_operations VALUES (1081, 1, '2011-06-15 00:00:00', 12, 312, 0, NULL);
INSERT INTO storage.base_operations VALUES (1081, 0, '2011-06-15 00:00:00', 373, 312, 18, NULL);
INSERT INTO storage.base_operations VALUES (1081, 3, '2011-06-15 00:00:00', 12, 312, 0, NULL);
INSERT INTO storage.base_operations VALUES (1042, 1, '2011-07-03 00:00:00', 35, 86, -7, NULL);
INSERT INTO storage.base_operations VALUES (1042, 0, '2011-07-03 00:00:00', 83, 86, 7, NULL);
INSERT INTO storage.base_operations VALUES (1042, 3, '2011-07-03 00:00:00', 35, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1042, 4, '2011-07-03 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1042, 5, '2011-07-03 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1042, 6, '2011-07-03 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1081, 4, '2011-06-15 00:00:00', 373, 312, 0, NULL);
INSERT INTO storage.base_operations VALUES (1081, 5, '2011-06-15 00:00:00', 9, 312, 0, NULL);
INSERT INTO storage.base_operations VALUES (1081, 6, '2011-06-15 00:00:00', 373, 312, 0, NULL);
INSERT INTO storage.base_operations VALUES (1091, 100, '2011-06-15 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (1091, 101, '2011-06-15 00:00:00', 12, 99, -2, NULL);
INSERT INTO storage.base_operations VALUES (1091, 102, '2011-06-15 00:00:00', 12, 114, -2, NULL);
INSERT INTO storage.base_operations VALUES (1043, 1, '2011-07-03 00:00:00', 35, 87, -19, NULL);
INSERT INTO storage.base_operations VALUES (1043, 0, '2011-07-03 00:00:00', 83, 87, 19, NULL);
INSERT INTO storage.base_operations VALUES (1043, 3, '2011-07-03 00:00:00', 35, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1043, 4, '2011-07-03 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1043, 5, '2011-07-03 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1043, 6, '2011-07-03 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1091, 103, '2011-06-15 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (1091, 104, '2011-06-15 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (1044, 1, '2011-07-04 00:00:00', 83, 84, -35, NULL);
INSERT INTO storage.base_operations VALUES (1044, 0, '2011-07-04 00:00:00', 30, 84, 35, NULL);
INSERT INTO storage.base_operations VALUES (1044, 3, '2011-07-04 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1044, 4, '2011-07-04 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1044, 5, '2011-07-04 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1044, 6, '2011-07-04 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1045, 1, '2011-07-04 00:00:00', 83, 86, -7, NULL);
INSERT INTO storage.base_operations VALUES (1045, 0, '2011-07-04 00:00:00', 30, 86, 7, NULL);
INSERT INTO storage.base_operations VALUES (1045, 3, '2011-07-04 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1045, 4, '2011-07-04 00:00:00', 30, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1045, 5, '2011-07-04 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1045, 6, '2011-07-04 00:00:00', 30, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1046, 1, '2011-07-04 00:00:00', 83, 87, -19, NULL);
INSERT INTO storage.base_operations VALUES (1046, 0, '2011-07-04 00:00:00', 30, 87, 19, NULL);
INSERT INTO storage.base_operations VALUES (1046, 3, '2011-07-04 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1046, 4, '2011-07-04 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1046, 5, '2011-07-04 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1046, 6, '2011-07-04 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1047, 1, '2011-07-04 00:00:00', 30, 84, -35, NULL);
INSERT INTO storage.base_operations VALUES (1047, 0, '2011-07-04 00:00:00', 61, 84, 35, NULL);
INSERT INTO storage.base_operations VALUES (1047, 3, '2011-07-04 00:00:00', 30, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1047, 4, '2011-07-04 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1047, 5, '2011-07-04 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1047, 6, '2011-07-04 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1048, 1, '2011-07-04 00:00:00', 30, 86, -7, NULL);
INSERT INTO storage.base_operations VALUES (1048, 0, '2011-07-04 00:00:00', 61, 86, 7, NULL);
INSERT INTO storage.base_operations VALUES (1048, 3, '2011-07-04 00:00:00', 30, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1048, 4, '2011-07-04 00:00:00', 61, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1048, 5, '2011-07-04 00:00:00', 9, 86, 1, NULL);
INSERT INTO storage.base_operations VALUES (1048, 6, '2011-07-04 00:00:00', 61, 86, -1, NULL);
INSERT INTO storage.base_operations VALUES (1049, 1, '2011-07-04 00:00:00', 30, 87, -19, NULL);
INSERT INTO storage.base_operations VALUES (1049, 0, '2011-07-04 00:00:00', 61, 87, 19, NULL);
INSERT INTO storage.base_operations VALUES (1049, 3, '2011-07-04 00:00:00', 30, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1049, 4, '2011-07-04 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1049, 5, '2011-07-04 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1049, 6, '2011-07-04 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1050, 1, '2011-07-04 00:00:00', 61, 84, -35, NULL);
INSERT INTO storage.base_operations VALUES (1050, 0, '2011-07-04 00:00:00', 37, 84, 35, NULL);
INSERT INTO storage.base_operations VALUES (1050, 3, '2011-07-04 00:00:00', 61, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1050, 4, '2011-07-04 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1050, 5, '2011-07-04 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1050, 6, '2011-07-04 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1051, 1, '2011-07-04 00:00:00', 61, 86, -6, NULL);
INSERT INTO storage.base_operations VALUES (1051, 0, '2011-07-04 00:00:00', 37, 86, 6, NULL);
INSERT INTO storage.base_operations VALUES (1051, 3, '2011-07-04 00:00:00', 61, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1051, 4, '2011-07-04 00:00:00', 37, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1051, 5, '2011-07-04 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1051, 6, '2011-07-04 00:00:00', 37, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1052, 1, '2011-07-04 00:00:00', 61, 87, -19, NULL);
INSERT INTO storage.base_operations VALUES (1052, 0, '2011-07-04 00:00:00', 37, 87, 19, NULL);
INSERT INTO storage.base_operations VALUES (1052, 3, '2011-07-04 00:00:00', 61, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1052, 4, '2011-07-04 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1052, 5, '2011-07-04 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1052, 6, '2011-07-04 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1053, 1, '2011-07-04 00:00:00', 37, 84, -35, NULL);
INSERT INTO storage.base_operations VALUES (1053, 0, '2011-07-04 00:00:00', 38, 84, 35, NULL);
INSERT INTO storage.base_operations VALUES (1053, 3, '2011-07-04 00:00:00', 37, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1053, 4, '2011-07-04 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1053, 5, '2011-07-04 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1053, 6, '2011-07-04 00:00:00', 38, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1054, 1, '2011-07-04 00:00:00', 37, 86, -6, NULL);
INSERT INTO storage.base_operations VALUES (1054, 0, '2011-07-04 00:00:00', 38, 86, 6, NULL);
INSERT INTO storage.base_operations VALUES (1054, 3, '2011-07-04 00:00:00', 37, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1054, 4, '2011-07-04 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1054, 5, '2011-07-04 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1054, 6, '2011-07-04 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1055, 1, '2011-07-04 00:00:00', 37, 87, -19, NULL);
INSERT INTO storage.base_operations VALUES (1055, 0, '2011-07-04 00:00:00', 38, 87, 19, NULL);
INSERT INTO storage.base_operations VALUES (1055, 3, '2011-07-04 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1055, 4, '2011-07-04 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1055, 5, '2011-07-04 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1055, 6, '2011-07-04 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1082, 100, '2011-06-15 00:00:00', 12, 140, -24, NULL);
INSERT INTO storage.base_operations VALUES (1082, 101, '2011-06-15 00:00:00', 12, 142, -24, NULL);
INSERT INTO storage.base_operations VALUES (1082, 1, '2011-06-15 00:00:00', 12, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (1082, 0, '2011-06-15 00:00:00', 373, 318, 24, NULL);
INSERT INTO storage.base_operations VALUES (1082, 3, '2011-06-15 00:00:00', 12, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (1082, 4, '2011-06-15 00:00:00', 373, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (1082, 5, '2011-06-15 00:00:00', 9, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (1082, 6, '2011-06-15 00:00:00', 373, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (1091, 1, '2011-06-15 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1091, 0, '2011-06-15 00:00:00', 373, 262, 2, NULL);
INSERT INTO storage.base_operations VALUES (1091, 3, '2011-06-15 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1091, 4, '2011-06-15 00:00:00', 373, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1091, 5, '2011-06-15 00:00:00', 9, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1091, 6, '2011-06-15 00:00:00', 373, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1175, 100, '2011-07-08 00:00:00', 12, 125, -20, NULL);
INSERT INTO storage.base_operations VALUES (1175, 101, '2011-07-08 00:00:00', 12, 334, -20, NULL);
INSERT INTO storage.base_operations VALUES (1175, 102, '2011-07-08 00:00:00', 12, 335, -20, NULL);
INSERT INTO storage.base_operations VALUES (1175, 103, '2011-07-08 00:00:00', 12, 228, -20, NULL);
INSERT INTO storage.base_operations VALUES (1175, 1, '2011-07-08 00:00:00', 12, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1175, 0, '2011-07-08 00:00:00', 358, 333, 20, NULL);
INSERT INTO storage.base_operations VALUES (1093, 100, '2011-06-29 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (1093, 101, '2011-06-29 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (1093, 102, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (1093, 103, '2011-06-29 00:00:00', 12, 88, -2, NULL);
INSERT INTO storage.base_operations VALUES (1093, 1, '2011-06-29 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (1093, 0, '2011-06-29 00:00:00', 371, 176, 2, NULL);
INSERT INTO storage.base_operations VALUES (1093, 3, '2011-06-29 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (1093, 4, '2011-06-29 00:00:00', 371, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (1093, 5, '2011-06-29 00:00:00', 9, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (1093, 6, '2011-06-29 00:00:00', 371, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (1099, 100, '2011-06-29 00:00:00', 12, 86, -2, NULL);
INSERT INTO storage.base_operations VALUES (1099, 101, '2011-06-29 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (1099, 102, '2011-06-29 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (1099, 103, '2011-06-29 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (1099, 1, '2011-06-29 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1099, 0, '2011-06-29 00:00:00', 371, 290, 2, NULL);
INSERT INTO storage.base_operations VALUES (1099, 3, '2011-06-29 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1099, 4, '2011-06-29 00:00:00', 371, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1099, 5, '2011-06-29 00:00:00', 9, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1099, 6, '2011-06-29 00:00:00', 371, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1175, 3, '2011-07-08 00:00:00', 12, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1175, 4, '2011-07-08 00:00:00', 358, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1175, 5, '2011-07-08 00:00:00', 9, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1175, 6, '2011-07-08 00:00:00', 358, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1194, 0, '2011-05-30 00:00:00', 375, 114, 1, NULL);
INSERT INTO storage.base_operations VALUES (1194, 3, '2011-05-30 00:00:00', 12, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (1194, 4, '2011-05-30 00:00:00', 375, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (1194, 5, '2011-05-30 00:00:00', 9, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (1194, 6, '2011-05-30 00:00:00', 375, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (1252, 6, '2011-07-05 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1253, 1, '2011-07-05 00:00:00', 37, 86, -8, NULL);
INSERT INTO storage.base_operations VALUES (1253, 0, '2011-07-05 00:00:00', 38, 86, 8, NULL);
INSERT INTO storage.base_operations VALUES (1253, 3, '2011-07-05 00:00:00', 37, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1253, 4, '2011-07-05 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1253, 5, '2011-07-05 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1230, 3, '2011-05-30 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1230, 4, '2011-05-30 00:00:00', 378, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1230, 5, '2011-05-30 00:00:00', 9, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1230, 6, '2011-05-30 00:00:00', 378, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1238, 100, '2011-05-30 00:00:00', 12, 113, -1, NULL);
INSERT INTO storage.base_operations VALUES (1238, 101, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1238, 102, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1238, 103, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1238, 104, '2011-05-30 00:00:00', 12, 88, -1, NULL);
INSERT INTO storage.base_operations VALUES (1238, 1, '2011-05-30 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1238, 0, '2011-05-30 00:00:00', 376, 186, 1, NULL);
INSERT INTO storage.base_operations VALUES (1238, 3, '2011-05-30 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1238, 4, '2011-05-30 00:00:00', 376, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1238, 5, '2011-05-30 00:00:00', 9, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1238, 6, '2011-05-30 00:00:00', 376, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (254, -1, '2011-04-18 00:00:00', 12, 99, 517, NULL);
INSERT INTO storage.base_operations VALUES (102, 100, '2011-04-19 00:00:00', 12, 95, -8, NULL);
INSERT INTO storage.base_operations VALUES (102, 101, '2011-04-19 00:00:00', 12, 125, -8, NULL);
INSERT INTO storage.base_operations VALUES (102, 102, '2011-04-19 00:00:00', 12, 126, -8, NULL);
INSERT INTO storage.base_operations VALUES (102, 103, '2011-04-19 00:00:00', 12, 121, -8, NULL);
INSERT INTO storage.base_operations VALUES (102, 1, '2011-04-19 00:00:00', 12, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (102, 0, '2011-04-19 00:00:00', 146, 236, 8, NULL);
INSERT INTO storage.base_operations VALUES (102, 3, '2011-04-19 00:00:00', 12, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (102, 4, '2011-04-19 00:00:00', 146, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (102, 5, '2011-04-19 00:00:00', 9, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (102, 6, '2011-04-19 00:00:00', 146, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (93, 100, '2011-04-19 00:00:00', 12, 84, -16, NULL);
INSERT INTO storage.base_operations VALUES (93, 101, '2011-04-19 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (1176, 100, '2011-07-08 00:00:00', 12, 125, -40, NULL);
INSERT INTO storage.base_operations VALUES (1176, 101, '2011-07-08 00:00:00', 12, 334, -40, NULL);
INSERT INTO storage.base_operations VALUES (1176, 102, '2011-07-08 00:00:00', 12, 335, -40, NULL);
INSERT INTO storage.base_operations VALUES (1176, 103, '2011-07-08 00:00:00', 12, 351, -40, NULL);
INSERT INTO storage.base_operations VALUES (1176, 1, '2011-07-08 00:00:00', 12, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (1176, 0, '2011-07-08 00:00:00', 358, 347, 40, NULL);
INSERT INTO storage.base_operations VALUES (1176, 3, '2011-07-08 00:00:00', 12, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (1176, 4, '2011-07-08 00:00:00', 358, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (1176, 5, '2011-07-08 00:00:00', 9, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (1176, 6, '2011-07-08 00:00:00', 358, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (1253, 6, '2011-07-05 00:00:00', 38, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1254, 1, '2011-07-05 00:00:00', 37, 87, -156, NULL);
INSERT INTO storage.base_operations VALUES (1254, 0, '2011-07-05 00:00:00', 38, 87, 156, NULL);
INSERT INTO storage.base_operations VALUES (1254, 3, '2011-07-05 00:00:00', 37, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1254, 4, '2011-07-05 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1254, 5, '2011-07-05 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1254, 6, '2011-07-05 00:00:00', 38, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1255, 1, '2011-07-05 00:00:00', 35, 84, -92, NULL);
INSERT INTO storage.base_operations VALUES (1255, 0, '2011-07-05 00:00:00', 83, 84, 92, NULL);
INSERT INTO storage.base_operations VALUES (1255, 3, '2011-07-05 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1255, 4, '2011-07-05 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1255, 5, '2011-07-05 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1216, 100, '2011-05-30 00:00:00', 12, 141, -2, NULL);
INSERT INTO storage.base_operations VALUES (1216, 101, '2011-05-30 00:00:00', 12, 114, -2, NULL);
INSERT INTO storage.base_operations VALUES (1216, 1, '2011-05-30 00:00:00', 12, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1216, 0, '2011-05-30 00:00:00', 379, 233, 2, NULL);
INSERT INTO storage.base_operations VALUES (1216, 3, '2011-05-30 00:00:00', 12, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1216, 4, '2011-05-30 00:00:00', 379, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1216, 5, '2011-05-30 00:00:00', 9, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1216, 6, '2011-05-30 00:00:00', 379, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1235, 100, '2011-05-30 00:00:00', 12, 95, -1, NULL);
INSERT INTO storage.base_operations VALUES (1235, 101, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1235, 102, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1235, 103, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1235, 104, '2011-05-30 00:00:00', 12, 113, -1, NULL);
INSERT INTO storage.base_operations VALUES (1235, 1, '2011-05-30 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1235, 0, '2011-05-30 00:00:00', 375, 256, 1, NULL);
INSERT INTO storage.base_operations VALUES (1235, 3, '2011-05-30 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1235, 4, '2011-05-30 00:00:00', 375, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1235, 5, '2011-05-30 00:00:00', 9, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1235, 6, '2011-05-30 00:00:00', 375, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1167, 1, '2011-05-16 00:00:00', 378, 334, -2000, NULL);
INSERT INTO storage.base_operations VALUES (1167, 0, '2011-05-16 00:00:00', 12, 334, 2000, NULL);
INSERT INTO storage.base_operations VALUES (1167, 3, '2011-05-16 00:00:00', 378, 334, 0, NULL);
INSERT INTO storage.base_operations VALUES (1167, 4, '2011-05-16 00:00:00', 12, 334, 0, NULL);
INSERT INTO storage.base_operations VALUES (1167, 5, '2011-05-16 00:00:00', 9, 334, 0, NULL);
INSERT INTO storage.base_operations VALUES (1167, 6, '2011-05-16 00:00:00', 12, 334, 0, NULL);
INSERT INTO storage.base_operations VALUES (253, -1, '2011-04-18 00:00:00', 12, 95, 367, NULL);
INSERT INTO storage.base_operations VALUES (90, 100, '2011-04-19 00:00:00', 12, 99, -16, NULL);
INSERT INTO storage.base_operations VALUES (90, 101, '2011-04-19 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (90, 102, '2011-04-19 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (90, 103, '2011-04-19 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (90, 1, '2011-04-19 00:00:00', 12, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (90, 0, '2011-04-19 00:00:00', 146, 241, 16, NULL);
INSERT INTO storage.base_operations VALUES (90, 3, '2011-04-19 00:00:00', 12, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (90, 4, '2011-04-19 00:00:00', 146, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (90, 5, '2011-04-19 00:00:00', 9, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (90, 6, '2011-04-19 00:00:00', 146, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (93, 102, '2011-04-19 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (93, 103, '2011-04-19 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (93, 1, '2011-04-19 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (93, 0, '2011-04-19 00:00:00', 146, 280, 16, NULL);
INSERT INTO storage.base_operations VALUES (93, 3, '2011-04-19 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (93, 4, '2011-04-19 00:00:00', 146, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (93, 5, '2011-04-19 00:00:00', 9, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (93, 6, '2011-04-19 00:00:00', 146, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (95, 100, '2011-04-19 00:00:00', 12, 86, -24, NULL);
INSERT INTO storage.base_operations VALUES (95, 101, '2011-04-19 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (95, 102, '2011-04-19 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (95, 103, '2011-04-19 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (95, 1, '2011-04-19 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (95, 0, '2011-04-19 00:00:00', 146, 290, 24, NULL);
INSERT INTO storage.base_operations VALUES (95, 3, '2011-04-19 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (95, 4, '2011-04-19 00:00:00', 146, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (95, 5, '2011-04-19 00:00:00', 9, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (95, 6, '2011-04-19 00:00:00', 146, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (96, 6, '2011-04-19 00:00:00', 146, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (1241, 1, '2011-07-05 00:00:00', 35, 84, -57, NULL);
INSERT INTO storage.base_operations VALUES (1241, 0, '2011-07-05 00:00:00', 83, 84, 57, NULL);
INSERT INTO storage.base_operations VALUES (1241, 3, '2011-07-05 00:00:00', 35, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1241, 4, '2011-07-05 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1241, 5, '2011-07-05 00:00:00', 9, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1241, 6, '2011-07-05 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1242, 1, '2011-07-05 00:00:00', 35, 86, -8, NULL);
INSERT INTO storage.base_operations VALUES (1242, 0, '2011-07-05 00:00:00', 83, 86, 8, NULL);
INSERT INTO storage.base_operations VALUES (1242, 3, '2011-07-05 00:00:00', 35, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1242, 4, '2011-07-05 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1242, 5, '2011-07-05 00:00:00', 9, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1242, 6, '2011-07-05 00:00:00', 83, 86, 0, NULL);
INSERT INTO storage.base_operations VALUES (1243, 1, '2011-07-05 00:00:00', 35, 87, -14, NULL);
INSERT INTO storage.base_operations VALUES (1243, 0, '2011-07-05 00:00:00', 83, 87, 14, NULL);
INSERT INTO storage.base_operations VALUES (1243, 3, '2011-07-05 00:00:00', 35, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1243, 4, '2011-07-05 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1243, 5, '2011-07-05 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1243, 6, '2011-07-05 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1177, 100, '2011-07-08 00:00:00', 12, 84, -24, NULL);
INSERT INTO storage.base_operations VALUES (1177, 101, '2011-07-08 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (1177, 102, '2011-07-08 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (1177, 103, '2011-07-08 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (1056, 100, '2011-06-15 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (1056, 101, '2011-06-15 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (1056, 102, '2011-06-15 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (1056, 103, '2011-06-15 00:00:00', 12, 88, -24, NULL);
INSERT INTO storage.base_operations VALUES (1056, 1, '2011-06-15 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (1056, 0, '2011-06-15 00:00:00', 373, 176, 24, NULL);
INSERT INTO storage.base_operations VALUES (1056, 3, '2011-06-15 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (1056, 4, '2011-06-15 00:00:00', 373, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (1056, 5, '2011-06-15 00:00:00', 9, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (1056, 6, '2011-06-15 00:00:00', 373, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (1057, 100, '2011-06-15 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (1057, 101, '2011-06-15 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (1057, 102, '2011-06-15 00:00:00', 12, 89, -16, NULL);
INSERT INTO storage.base_operations VALUES (1057, 103, '2011-06-15 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (1057, 1, '2011-06-15 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1057, 0, '2011-06-15 00:00:00', 373, 181, 16, NULL);
INSERT INTO storage.base_operations VALUES (1057, 3, '2011-06-15 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1057, 4, '2011-06-15 00:00:00', 373, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1057, 5, '2011-06-15 00:00:00', 9, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1057, 6, '2011-06-15 00:00:00', 373, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1058, 100, '2011-06-15 00:00:00', 12, 90, -16, NULL);
INSERT INTO storage.base_operations VALUES (1058, 101, '2011-06-15 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (1058, 102, '2011-06-15 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (1058, 103, '2011-06-15 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (1058, 1, '2011-06-15 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (1058, 0, '2011-06-15 00:00:00', 373, 195, 16, NULL);
INSERT INTO storage.base_operations VALUES (1058, 3, '2011-06-15 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (1058, 4, '2011-06-15 00:00:00', 373, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (1058, 5, '2011-06-15 00:00:00', 9, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (1058, 6, '2011-06-15 00:00:00', 373, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (1059, 100, '2011-06-15 00:00:00', 12, 91, -16, NULL);
INSERT INTO storage.base_operations VALUES (1059, 101, '2011-06-15 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (1059, 102, '2011-06-15 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (1059, 103, '2011-06-15 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (1059, 1, '2011-06-15 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1059, 0, '2011-06-15 00:00:00', 373, 200, 16, NULL);
INSERT INTO storage.base_operations VALUES (1059, 3, '2011-06-15 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1059, 4, '2011-06-15 00:00:00', 373, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1059, 5, '2011-06-15 00:00:00', 9, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1059, 6, '2011-06-15 00:00:00', 373, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1060, 100, '2011-06-15 00:00:00', 12, 113, -18, NULL);
INSERT INTO storage.base_operations VALUES (1060, 101, '2011-06-15 00:00:00', 12, 121, -18, NULL);
INSERT INTO storage.base_operations VALUES (1060, 102, '2011-06-15 00:00:00', 12, 126, -18, NULL);
INSERT INTO storage.base_operations VALUES (1060, 103, '2011-06-15 00:00:00', 12, 125, -18, NULL);
INSERT INTO storage.base_operations VALUES (1060, 104, '2011-06-15 00:00:00', 12, 88, -18, NULL);
INSERT INTO storage.base_operations VALUES (1060, 1, '2011-06-15 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1060, 0, '2011-06-15 00:00:00', 373, 186, 18, NULL);
INSERT INTO storage.base_operations VALUES (1060, 3, '2011-06-15 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1060, 4, '2011-06-15 00:00:00', 373, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1060, 5, '2011-06-15 00:00:00', 9, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1060, 6, '2011-06-15 00:00:00', 373, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1061, 100, '2011-06-15 00:00:00', 12, 125, -12, NULL);
INSERT INTO storage.base_operations VALUES (1061, 101, '2011-06-15 00:00:00', 12, 126, -12, NULL);
INSERT INTO storage.base_operations VALUES (1061, 102, '2011-06-15 00:00:00', 12, 121, -12, NULL);
INSERT INTO storage.base_operations VALUES (1061, 103, '2011-06-15 00:00:00', 12, 114, -12, NULL);
INSERT INTO storage.base_operations VALUES (1061, 104, '2011-06-15 00:00:00', 12, 89, -12, NULL);
INSERT INTO storage.base_operations VALUES (1061, 1, '2011-06-15 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1061, 0, '2011-06-15 00:00:00', 373, 205, 12, NULL);
INSERT INTO storage.base_operations VALUES (1061, 3, '2011-06-15 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1061, 4, '2011-06-15 00:00:00', 373, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1061, 5, '2011-06-15 00:00:00', 9, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1061, 6, '2011-06-15 00:00:00', 373, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1062, 100, '2011-06-15 00:00:00', 12, 115, -12, NULL);
INSERT INTO storage.base_operations VALUES (1062, 101, '2011-06-15 00:00:00', 12, 125, -12, NULL);
INSERT INTO storage.base_operations VALUES (1062, 102, '2011-06-15 00:00:00', 12, 121, -12, NULL);
INSERT INTO storage.base_operations VALUES (1062, 103, '2011-06-15 00:00:00', 12, 126, -12, NULL);
INSERT INTO storage.base_operations VALUES (1062, 104, '2011-06-15 00:00:00', 12, 90, -12, NULL);
INSERT INTO storage.base_operations VALUES (1062, 1, '2011-06-15 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1062, 0, '2011-06-15 00:00:00', 373, 210, 12, NULL);
INSERT INTO storage.base_operations VALUES (1062, 3, '2011-06-15 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1062, 4, '2011-06-15 00:00:00', 373, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1062, 5, '2011-06-15 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1062, 6, '2011-06-15 00:00:00', 373, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1063, 100, '2011-06-15 00:00:00', 12, 125, -12, NULL);
INSERT INTO storage.base_operations VALUES (1063, 101, '2011-06-15 00:00:00', 12, 126, -12, NULL);
INSERT INTO storage.base_operations VALUES (1063, 102, '2011-06-15 00:00:00', 12, 91, -12, NULL);
INSERT INTO storage.base_operations VALUES (1063, 103, '2011-06-15 00:00:00', 12, 121, -12, NULL);
INSERT INTO storage.base_operations VALUES (1063, 104, '2011-06-15 00:00:00', 12, 116, -12, NULL);
INSERT INTO storage.base_operations VALUES (1063, 1, '2011-06-15 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1063, 0, '2011-06-15 00:00:00', 373, 217, 12, NULL);
INSERT INTO storage.base_operations VALUES (1063, 3, '2011-06-15 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1063, 4, '2011-06-15 00:00:00', 373, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1063, 5, '2011-06-15 00:00:00', 9, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1063, 6, '2011-06-15 00:00:00', 373, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1083, 100, '2011-06-15 00:00:00', 12, 140, -24, NULL);
INSERT INTO storage.base_operations VALUES (1083, 101, '2011-06-15 00:00:00', 12, 112, -24, NULL);
INSERT INTO storage.base_operations VALUES (1083, 1, '2011-06-15 00:00:00', 12, 324, 0, NULL);
INSERT INTO storage.base_operations VALUES (1083, 0, '2011-06-15 00:00:00', 373, 324, 24, NULL);
INSERT INTO storage.base_operations VALUES (1083, 3, '2011-06-15 00:00:00', 12, 324, 0, NULL);
INSERT INTO storage.base_operations VALUES (1083, 4, '2011-06-15 00:00:00', 373, 324, 0, NULL);
INSERT INTO storage.base_operations VALUES (1083, 5, '2011-06-15 00:00:00', 9, 324, 0, NULL);
INSERT INTO storage.base_operations VALUES (1083, 6, '2011-06-15 00:00:00', 373, 324, 0, NULL);
INSERT INTO storage.base_operations VALUES (1177, 1, '2011-07-08 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (835, 101, '2011-04-20 00:00:00', 12, 126, -32, NULL);
INSERT INTO storage.base_operations VALUES (835, 102, '2011-04-20 00:00:00', 12, 89, -32, NULL);
INSERT INTO storage.base_operations VALUES (835, 103, '2011-04-20 00:00:00', 12, 121, -32, NULL);
INSERT INTO storage.base_operations VALUES (835, 1, '2011-04-20 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (835, 0, '2011-04-20 00:00:00', 374, 181, 32, NULL);
INSERT INTO storage.base_operations VALUES (835, 3, '2011-04-20 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (835, 4, '2011-04-20 00:00:00', 374, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (835, 5, '2011-04-20 00:00:00', 9, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (835, 6, '2011-04-20 00:00:00', 374, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (836, 100, '2011-04-20 00:00:00', 12, 90, -32, NULL);
INSERT INTO storage.base_operations VALUES (836, 101, '2011-04-20 00:00:00', 12, 125, -32, NULL);
INSERT INTO storage.base_operations VALUES (836, 102, '2011-04-20 00:00:00', 12, 121, -32, NULL);
INSERT INTO storage.base_operations VALUES (836, 103, '2011-04-20 00:00:00', 12, 126, -32, NULL);
INSERT INTO storage.base_operations VALUES (836, 1, '2011-04-20 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (836, 0, '2011-04-20 00:00:00', 374, 195, 32, NULL);
INSERT INTO storage.base_operations VALUES (836, 3, '2011-04-20 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (836, 4, '2011-04-20 00:00:00', 374, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (836, 5, '2011-04-20 00:00:00', 9, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (836, 6, '2011-04-20 00:00:00', 374, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (837, 100, '2011-04-20 00:00:00', 12, 91, -24, NULL);
INSERT INTO storage.base_operations VALUES (837, 101, '2011-04-20 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (837, 102, '2011-04-20 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (837, 103, '2011-04-20 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (837, 1, '2011-04-20 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (837, 0, '2011-04-20 00:00:00', 374, 200, 24, NULL);
INSERT INTO storage.base_operations VALUES (837, 3, '2011-04-20 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (837, 4, '2011-04-20 00:00:00', 374, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (837, 5, '2011-04-20 00:00:00', 9, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (837, 6, '2011-04-20 00:00:00', 374, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (838, 100, '2011-04-20 00:00:00', 12, 95, -8, NULL);
INSERT INTO storage.base_operations VALUES (838, 101, '2011-04-20 00:00:00', 12, 125, -8, NULL);
INSERT INTO storage.base_operations VALUES (838, 102, '2011-04-20 00:00:00', 12, 126, -8, NULL);
INSERT INTO storage.base_operations VALUES (838, 103, '2011-04-20 00:00:00', 12, 121, -8, NULL);
INSERT INTO storage.base_operations VALUES (838, 1, '2011-04-20 00:00:00', 12, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (838, 0, '2011-04-20 00:00:00', 374, 236, 8, NULL);
INSERT INTO storage.base_operations VALUES (838, 3, '2011-04-20 00:00:00', 12, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (838, 4, '2011-04-20 00:00:00', 374, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (838, 5, '2011-04-20 00:00:00', 9, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (838, 6, '2011-04-20 00:00:00', 374, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (839, 100, '2011-04-20 00:00:00', 12, 99, -16, NULL);
INSERT INTO storage.base_operations VALUES (839, 101, '2011-04-20 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (839, 102, '2011-04-20 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (839, 103, '2011-04-20 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (839, 1, '2011-04-20 00:00:00', 12, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (839, 0, '2011-04-20 00:00:00', 374, 241, 16, NULL);
INSERT INTO storage.base_operations VALUES (839, 3, '2011-04-20 00:00:00', 12, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (839, 4, '2011-04-20 00:00:00', 374, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (839, 5, '2011-04-20 00:00:00', 9, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (839, 6, '2011-04-20 00:00:00', 374, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (840, 100, '2011-04-20 00:00:00', 12, 97, -16, NULL);
INSERT INTO storage.base_operations VALUES (840, 101, '2011-04-20 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (840, 102, '2011-04-20 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (840, 103, '2011-04-20 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (840, 1, '2011-04-20 00:00:00', 12, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (840, 0, '2011-04-20 00:00:00', 374, 246, 16, NULL);
INSERT INTO storage.base_operations VALUES (840, 3, '2011-04-20 00:00:00', 12, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (840, 4, '2011-04-20 00:00:00', 374, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (840, 5, '2011-04-20 00:00:00', 9, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (840, 6, '2011-04-20 00:00:00', 374, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (841, 100, '2011-04-20 00:00:00', 12, 91, -8, NULL);
INSERT INTO storage.base_operations VALUES (841, 101, '2011-04-20 00:00:00', 12, 126, -8, NULL);
INSERT INTO storage.base_operations VALUES (841, 102, '2011-04-20 00:00:00', 12, 125, -8, NULL);
INSERT INTO storage.base_operations VALUES (841, 103, '2011-04-20 00:00:00', 12, 121, -8, NULL);
INSERT INTO storage.base_operations VALUES (841, 1, '2011-04-20 00:00:00', 12, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (841, 0, '2011-04-20 00:00:00', 374, 251, 8, NULL);
INSERT INTO storage.base_operations VALUES (841, 3, '2011-04-20 00:00:00', 12, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (841, 4, '2011-04-20 00:00:00', 374, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (841, 5, '2011-04-20 00:00:00', 9, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (841, 6, '2011-04-20 00:00:00', 374, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (842, 100, '2011-04-20 00:00:00', 12, 84, -16, NULL);
INSERT INTO storage.base_operations VALUES (842, 101, '2011-04-20 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (842, 102, '2011-04-20 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (842, 103, '2011-04-20 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (842, 1, '2011-04-20 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (842, 0, '2011-04-20 00:00:00', 374, 280, 16, NULL);
INSERT INTO storage.base_operations VALUES (842, 3, '2011-04-20 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (842, 4, '2011-04-20 00:00:00', 374, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (842, 5, '2011-04-20 00:00:00', 9, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (842, 6, '2011-04-20 00:00:00', 374, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (843, 100, '2011-04-20 00:00:00', 12, 85, -24, NULL);
INSERT INTO storage.base_operations VALUES (843, 101, '2011-04-20 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (843, 102, '2011-04-20 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (843, 103, '2011-04-20 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (843, 1, '2011-04-20 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (843, 0, '2011-04-20 00:00:00', 374, 285, 24, NULL);
INSERT INTO storage.base_operations VALUES (843, 3, '2011-04-20 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (843, 4, '2011-04-20 00:00:00', 374, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (843, 5, '2011-04-20 00:00:00', 9, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (843, 6, '2011-04-20 00:00:00', 374, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (844, 100, '2011-04-20 00:00:00', 12, 86, -24, NULL);
INSERT INTO storage.base_operations VALUES (844, 101, '2011-04-20 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (844, 102, '2011-04-20 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (844, 103, '2011-04-20 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (844, 1, '2011-04-20 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (844, 0, '2011-04-20 00:00:00', 374, 290, 24, NULL);
INSERT INTO storage.base_operations VALUES (844, 3, '2011-04-20 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (844, 4, '2011-04-20 00:00:00', 374, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (844, 5, '2011-04-20 00:00:00', 9, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (844, 6, '2011-04-20 00:00:00', 374, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (845, 100, '2011-04-20 00:00:00', 12, 87, -16, NULL);
INSERT INTO storage.base_operations VALUES (845, 101, '2011-04-20 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (845, 102, '2011-04-20 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (845, 103, '2011-04-20 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (845, 1, '2011-04-20 00:00:00', 12, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (845, 0, '2011-04-20 00:00:00', 374, 295, 16, NULL);
INSERT INTO storage.base_operations VALUES (845, 3, '2011-04-20 00:00:00', 12, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (845, 4, '2011-04-20 00:00:00', 374, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (845, 5, '2011-04-20 00:00:00', 9, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (845, 6, '2011-04-20 00:00:00', 374, 295, 0, NULL);
INSERT INTO storage.base_operations VALUES (909, 100, '2011-06-22 00:00:00', 12, 113, -1, NULL);
INSERT INTO storage.base_operations VALUES (909, 101, '2011-06-22 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (909, 102, '2011-06-22 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (909, 103, '2011-06-22 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (909, 104, '2011-06-22 00:00:00', 12, 88, -1, NULL);
INSERT INTO storage.base_operations VALUES (909, 1, '2011-06-22 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (909, 0, '2011-06-22 00:00:00', 371, 186, 1, NULL);
INSERT INTO storage.base_operations VALUES (909, 3, '2011-06-22 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (909, 4, '2011-06-22 00:00:00', 371, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (909, 5, '2011-06-22 00:00:00', 9, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (909, 6, '2011-06-22 00:00:00', 371, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (910, 100, '2011-06-22 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (910, 101, '2011-06-22 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (910, 102, '2011-06-22 00:00:00', 12, 91, -1, NULL);
INSERT INTO storage.base_operations VALUES (910, 103, '2011-06-22 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (910, 104, '2011-06-22 00:00:00', 12, 116, -1, NULL);
INSERT INTO storage.base_operations VALUES (910, 1, '2011-06-22 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (910, 0, '2011-06-22 00:00:00', 371, 217, 1, NULL);
INSERT INTO storage.base_operations VALUES (910, 3, '2011-06-22 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (910, 4, '2011-06-22 00:00:00', 371, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (910, 5, '2011-06-22 00:00:00', 9, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (910, 6, '2011-06-22 00:00:00', 371, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (911, 100, '2011-06-22 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (911, 101, '2011-06-22 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (911, 102, '2011-06-22 00:00:00', 12, 89, -1, NULL);
INSERT INTO storage.base_operations VALUES (911, 103, '2011-06-22 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (911, 1, '2011-06-22 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (911, 0, '2011-06-22 00:00:00', 371, 181, 1, NULL);
INSERT INTO storage.base_operations VALUES (911, 3, '2011-06-22 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (911, 4, '2011-06-22 00:00:00', 371, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (911, 5, '2011-06-22 00:00:00', 9, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (911, 6, '2011-06-22 00:00:00', 371, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (912, 100, '2011-06-22 00:00:00', 12, 115, -2, NULL);
INSERT INTO storage.base_operations VALUES (912, 101, '2011-06-22 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (912, 102, '2011-06-22 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (912, 103, '2011-06-22 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (912, 104, '2011-06-22 00:00:00', 12, 90, -2, NULL);
INSERT INTO storage.base_operations VALUES (912, 1, '2011-06-22 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (912, 0, '2011-06-22 00:00:00', 371, 210, 2, NULL);
INSERT INTO storage.base_operations VALUES (912, 3, '2011-06-22 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (912, 4, '2011-06-22 00:00:00', 371, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (912, 5, '2011-06-22 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (912, 6, '2011-06-22 00:00:00', 371, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (913, 100, '2011-06-09 00:00:00', 12, 95, -1, NULL);
INSERT INTO storage.base_operations VALUES (913, 101, '2011-06-09 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (913, 102, '2011-06-09 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (913, 103, '2011-06-09 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (913, 104, '2011-06-09 00:00:00', 12, 113, -1, NULL);
INSERT INTO storage.base_operations VALUES (913, 1, '2011-06-09 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (913, 0, '2011-06-09 00:00:00', 356, 256, 1, NULL);
INSERT INTO storage.base_operations VALUES (913, 3, '2011-06-09 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (913, 4, '2011-06-09 00:00:00', 356, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (913, 5, '2011-06-09 00:00:00', 9, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (913, 6, '2011-06-09 00:00:00', 356, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (914, 100, '2011-06-09 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (914, 101, '2011-06-09 00:00:00', 12, 99, -1, NULL);
INSERT INTO storage.base_operations VALUES (914, 102, '2011-06-09 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (914, 103, '2011-06-09 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (914, 104, '2011-06-09 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (914, 1, '2011-06-09 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (914, 0, '2011-06-09 00:00:00', 356, 262, 1, NULL);
INSERT INTO storage.base_operations VALUES (914, 3, '2011-06-09 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (914, 4, '2011-06-09 00:00:00', 356, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (914, 5, '2011-06-09 00:00:00', 9, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (914, 6, '2011-06-09 00:00:00', 356, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (915, 100, '2011-06-09 00:00:00', 12, 97, -1, NULL);
INSERT INTO storage.base_operations VALUES (915, 101, '2011-06-09 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (915, 102, '2011-06-09 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (915, 103, '2011-06-09 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (915, 104, '2011-06-09 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (915, 1, '2011-06-09 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (915, 0, '2011-06-09 00:00:00', 356, 268, 1, NULL);
INSERT INTO storage.base_operations VALUES (915, 3, '2011-06-09 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (915, 4, '2011-06-09 00:00:00', 356, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (915, 5, '2011-06-09 00:00:00', 9, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (915, 6, '2011-06-09 00:00:00', 356, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (916, 100, '2011-06-30 00:00:00', 12, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (916, 101, '2011-06-30 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (916, 1, '2011-06-30 00:00:00', 12, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (916, 0, '2011-06-30 00:00:00', 371, 233, 1, NULL);
INSERT INTO storage.base_operations VALUES (916, 3, '2011-06-30 00:00:00', 12, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (916, 4, '2011-06-30 00:00:00', 371, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (916, 5, '2011-06-30 00:00:00', 9, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (916, 6, '2011-06-30 00:00:00', 371, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (917, 100, '2011-06-30 00:00:00', 12, 99, -1, NULL);
INSERT INTO storage.base_operations VALUES (917, 101, '2011-06-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (917, 102, '2011-06-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (917, 103, '2011-06-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (917, 1, '2011-06-30 00:00:00', 12, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (917, 0, '2011-06-30 00:00:00', 371, 241, 1, NULL);
INSERT INTO storage.base_operations VALUES (917, 3, '2011-06-30 00:00:00', 12, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (917, 4, '2011-06-30 00:00:00', 371, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (917, 5, '2011-06-30 00:00:00', 9, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (917, 6, '2011-06-30 00:00:00', 371, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (918, 100, '2011-06-30 00:00:00', 12, 98, -1, NULL);
INSERT INTO storage.base_operations VALUES (918, 101, '2011-06-30 00:00:00', 12, 116, -1, NULL);
INSERT INTO storage.base_operations VALUES (918, 102, '2011-06-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (918, 103, '2011-06-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (918, 104, '2011-06-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (918, 1, '2011-06-30 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (918, 0, '2011-06-30 00:00:00', 371, 274, 1, NULL);
INSERT INTO storage.base_operations VALUES (918, 3, '2011-06-30 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (918, 4, '2011-06-30 00:00:00', 371, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (918, 5, '2011-06-30 00:00:00', 9, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (918, 6, '2011-06-30 00:00:00', 371, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (919, 100, '2011-06-30 00:00:00', 12, 97, -1, NULL);
INSERT INTO storage.base_operations VALUES (919, 101, '2011-06-30 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (919, 102, '2011-06-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (919, 103, '2011-06-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (919, 104, '2011-06-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (919, 1, '2011-06-30 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (919, 0, '2011-06-30 00:00:00', 371, 268, 1, NULL);
INSERT INTO storage.base_operations VALUES (919, 3, '2011-06-30 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (919, 4, '2011-06-30 00:00:00', 371, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (919, 5, '2011-06-30 00:00:00', 9, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (919, 6, '2011-06-30 00:00:00', 371, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (920, 100, '2011-06-10 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (920, 101, '2011-06-10 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (920, 102, '2011-06-10 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (920, 103, '2011-06-10 00:00:00', 12, 114, -16, NULL);
INSERT INTO storage.base_operations VALUES (920, 104, '2011-06-10 00:00:00', 12, 89, -16, NULL);
INSERT INTO storage.base_operations VALUES (920, 1, '2011-06-10 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (920, 0, '2011-06-10 00:00:00', 372, 205, 16, NULL);
INSERT INTO storage.base_operations VALUES (920, 3, '2011-06-10 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (920, 4, '2011-06-10 00:00:00', 372, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (920, 5, '2011-06-10 00:00:00', 9, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (920, 6, '2011-06-10 00:00:00', 372, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (921, 100, '2011-06-10 00:00:00', 12, 115, -16, NULL);
INSERT INTO storage.base_operations VALUES (921, 101, '2011-06-10 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (921, 102, '2011-06-10 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (921, 103, '2011-06-10 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (921, 104, '2011-06-10 00:00:00', 12, 90, -16, NULL);
INSERT INTO storage.base_operations VALUES (921, 1, '2011-06-10 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (921, 0, '2011-06-10 00:00:00', 372, 210, 16, NULL);
INSERT INTO storage.base_operations VALUES (921, 3, '2011-06-10 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (921, 4, '2011-06-10 00:00:00', 372, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (921, 5, '2011-06-10 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (921, 6, '2011-06-10 00:00:00', 372, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (922, 100, '2011-06-10 00:00:00', 12, 141, -18, NULL);
INSERT INTO storage.base_operations VALUES (922, 101, '2011-06-10 00:00:00', 12, 330, -18, NULL);
INSERT INTO storage.base_operations VALUES (922, 1, '2011-06-10 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (922, 0, '2011-06-10 00:00:00', 372, 230, 18, NULL);
INSERT INTO storage.base_operations VALUES (922, 3, '2011-06-10 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (922, 4, '2011-06-10 00:00:00', 372, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (922, 5, '2011-06-10 00:00:00', 9, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (922, 6, '2011-06-10 00:00:00', 372, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (923, 100, '2011-06-10 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (923, 101, '2011-06-10 00:00:00', 12, 99, -16, NULL);
INSERT INTO storage.base_operations VALUES (923, 102, '2011-06-10 00:00:00', 12, 114, -16, NULL);
INSERT INTO storage.base_operations VALUES (923, 103, '2011-06-10 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (923, 104, '2011-06-10 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (923, 1, '2011-06-10 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (923, 0, '2011-06-10 00:00:00', 372, 262, 16, NULL);
INSERT INTO storage.base_operations VALUES (923, 3, '2011-06-10 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (923, 4, '2011-06-10 00:00:00', 372, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (923, 5, '2011-06-10 00:00:00', 9, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (923, 6, '2011-06-10 00:00:00', 372, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (924, 100, '2011-06-10 00:00:00', 12, 98, -8, NULL);
INSERT INTO storage.base_operations VALUES (924, 101, '2011-06-10 00:00:00', 12, 116, -8, NULL);
INSERT INTO storage.base_operations VALUES (924, 102, '2011-06-10 00:00:00', 12, 125, -8, NULL);
INSERT INTO storage.base_operations VALUES (924, 103, '2011-06-10 00:00:00', 12, 126, -8, NULL);
INSERT INTO storage.base_operations VALUES (924, 104, '2011-06-10 00:00:00', 12, 121, -8, NULL);
INSERT INTO storage.base_operations VALUES (924, 1, '2011-06-10 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (924, 0, '2011-06-10 00:00:00', 372, 274, 8, NULL);
INSERT INTO storage.base_operations VALUES (924, 3, '2011-06-10 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (924, 4, '2011-06-10 00:00:00', 372, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (924, 5, '2011-06-10 00:00:00', 9, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (924, 6, '2011-06-10 00:00:00', 372, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (788, 100, '2011-06-17 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (788, 101, '2011-06-17 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (788, 102, '2011-06-17 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (788, 103, '2011-06-17 00:00:00', 12, 88, -1, NULL);
INSERT INTO storage.base_operations VALUES (788, 1, '2011-06-17 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (788, 0, '2011-06-17 00:00:00', 368, 176, 1, NULL);
INSERT INTO storage.base_operations VALUES (788, 3, '2011-06-17 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (788, 4, '2011-06-17 00:00:00', 368, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (788, 5, '2011-06-17 00:00:00', 9, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (788, 6, '2011-06-17 00:00:00', 368, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (794, 100, '2011-06-17 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (794, 101, '2011-06-17 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (794, 102, '2011-06-17 00:00:00', 12, 89, -1, NULL);
INSERT INTO storage.base_operations VALUES (794, 103, '2011-06-17 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (794, 1, '2011-06-17 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (794, 0, '2011-06-17 00:00:00', 368, 181, 1, NULL);
INSERT INTO storage.base_operations VALUES (794, 3, '2011-06-17 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (794, 4, '2011-06-17 00:00:00', 368, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (794, 5, '2011-06-17 00:00:00', 9, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (794, 6, '2011-06-17 00:00:00', 368, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (797, 100, '2011-06-17 00:00:00', 12, 90, -1, NULL);
INSERT INTO storage.base_operations VALUES (797, 101, '2011-06-17 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (797, 102, '2011-06-17 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (797, 103, '2011-06-17 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (797, 1, '2011-06-17 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (797, 0, '2011-06-17 00:00:00', 368, 195, 1, NULL);
INSERT INTO storage.base_operations VALUES (797, 3, '2011-06-17 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (797, 4, '2011-06-17 00:00:00', 368, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (797, 5, '2011-06-17 00:00:00', 9, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (797, 6, '2011-06-17 00:00:00', 368, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (793, 100, '2011-06-17 00:00:00', 12, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (793, 101, '2011-06-17 00:00:00', 12, 330, -1, NULL);
INSERT INTO storage.base_operations VALUES (793, 1, '2011-06-17 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (793, 0, '2011-06-17 00:00:00', 368, 230, 1, NULL);
INSERT INTO storage.base_operations VALUES (793, 3, '2011-06-17 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (793, 4, '2011-06-17 00:00:00', 368, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (793, 5, '2011-06-17 00:00:00', 9, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (793, 6, '2011-06-17 00:00:00', 368, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (790, 100, '2011-06-17 00:00:00', 12, 91, -1, NULL);
INSERT INTO storage.base_operations VALUES (790, 101, '2011-06-17 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (790, 102, '2011-06-17 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (790, 103, '2011-06-17 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (790, 1, '2011-06-17 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (790, 0, '2011-06-17 00:00:00', 368, 200, 1, NULL);
INSERT INTO storage.base_operations VALUES (790, 3, '2011-06-17 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (790, 4, '2011-06-17 00:00:00', 368, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (790, 5, '2011-06-17 00:00:00', 9, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (790, 6, '2011-06-17 00:00:00', 368, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (783, 1, '2011-06-17 00:00:00', 12, 112, -1, NULL);
INSERT INTO storage.base_operations VALUES (783, 0, '2011-06-17 00:00:00', 368, 112, 1, NULL);
INSERT INTO storage.base_operations VALUES (783, 3, '2011-06-17 00:00:00', 12, 112, 0, NULL);
INSERT INTO storage.base_operations VALUES (783, 4, '2011-06-17 00:00:00', 368, 112, 0, NULL);
INSERT INTO storage.base_operations VALUES (783, 5, '2011-06-17 00:00:00', 9, 112, 0, NULL);
INSERT INTO storage.base_operations VALUES (783, 6, '2011-06-17 00:00:00', 368, 112, 0, NULL);
INSERT INTO storage.base_operations VALUES (784, 1, '2011-06-17 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (784, 0, '2011-06-17 00:00:00', 368, 114, 1, NULL);
INSERT INTO storage.base_operations VALUES (784, 3, '2011-06-17 00:00:00', 12, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (784, 4, '2011-06-17 00:00:00', 368, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (784, 5, '2011-06-17 00:00:00', 9, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (784, 6, '2011-06-17 00:00:00', 368, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (785, 1, '2011-06-17 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (785, 0, '2011-06-17 00:00:00', 368, 115, 1, NULL);
INSERT INTO storage.base_operations VALUES (785, 3, '2011-06-17 00:00:00', 12, 115, 0, NULL);
INSERT INTO storage.base_operations VALUES (785, 4, '2011-06-17 00:00:00', 368, 115, 0, NULL);
INSERT INTO storage.base_operations VALUES (785, 5, '2011-06-17 00:00:00', 9, 115, 0, NULL);
INSERT INTO storage.base_operations VALUES (785, 6, '2011-06-17 00:00:00', 368, 115, 0, NULL);
INSERT INTO storage.base_operations VALUES (781, 100, '2011-06-17 00:00:00', 12, 99, -1, NULL);
INSERT INTO storage.base_operations VALUES (781, 101, '2011-06-17 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (781, 102, '2011-06-17 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (781, 103, '2011-06-17 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (781, 1, '2011-06-17 00:00:00', 12, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (781, 0, '2011-06-17 00:00:00', 368, 241, 1, NULL);
INSERT INTO storage.base_operations VALUES (781, 3, '2011-06-17 00:00:00', 12, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (781, 4, '2011-06-17 00:00:00', 368, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (781, 5, '2011-06-17 00:00:00', 9, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (781, 6, '2011-06-17 00:00:00', 368, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (786, 100, '2011-06-17 00:00:00', 12, 97, -1, NULL);
INSERT INTO storage.base_operations VALUES (786, 101, '2011-06-17 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (786, 102, '2011-06-17 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (786, 103, '2011-06-17 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (786, 1, '2011-06-17 00:00:00', 12, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (786, 0, '2011-06-17 00:00:00', 368, 246, 1, NULL);
INSERT INTO storage.base_operations VALUES (786, 3, '2011-06-17 00:00:00', 12, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (786, 4, '2011-06-17 00:00:00', 368, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (786, 5, '2011-06-17 00:00:00', 9, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (786, 6, '2011-06-17 00:00:00', 368, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (795, 1, '2011-06-17 00:00:00', 12, 175, -1, NULL);
INSERT INTO storage.base_operations VALUES (795, 0, '2011-06-17 00:00:00', 368, 175, 1, NULL);
INSERT INTO storage.base_operations VALUES (795, 3, '2011-06-17 00:00:00', 12, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (795, 4, '2011-06-17 00:00:00', 368, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (795, 5, '2011-06-17 00:00:00', 9, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (795, 6, '2011-06-17 00:00:00', 368, 175, 0, NULL);
INSERT INTO storage.base_operations VALUES (787, 100, '2011-06-17 00:00:00', 12, 140, -1, NULL);
INSERT INTO storage.base_operations VALUES (787, 101, '2011-06-17 00:00:00', 12, 142, -1, NULL);
INSERT INTO storage.base_operations VALUES (787, 1, '2011-06-17 00:00:00', 12, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (787, 0, '2011-06-17 00:00:00', 368, 318, 1, NULL);
INSERT INTO storage.base_operations VALUES (787, 3, '2011-06-17 00:00:00', 12, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (787, 4, '2011-06-17 00:00:00', 368, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (787, 5, '2011-06-17 00:00:00', 9, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (787, 6, '2011-06-17 00:00:00', 368, 318, 0, NULL);
INSERT INTO storage.base_operations VALUES (791, 1, '2011-06-17 00:00:00', 12, 174, -1, NULL);
INSERT INTO storage.base_operations VALUES (791, 0, '2011-06-17 00:00:00', 368, 174, 1, NULL);
INSERT INTO storage.base_operations VALUES (791, 3, '2011-06-17 00:00:00', 12, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (791, 4, '2011-06-17 00:00:00', 368, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (791, 5, '2011-06-17 00:00:00', 9, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (791, 6, '2011-06-17 00:00:00', 368, 174, 0, NULL);
INSERT INTO storage.base_operations VALUES (782, 100, '2011-06-17 00:00:00', 12, 141, -2, NULL);
INSERT INTO storage.base_operations VALUES (782, 101, '2011-06-17 00:00:00', 12, 143, -2, NULL);
INSERT INTO storage.base_operations VALUES (782, 1, '2011-06-17 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (782, 0, '2011-06-17 00:00:00', 368, 321, 2, NULL);
INSERT INTO storage.base_operations VALUES (782, 3, '2011-06-17 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (782, 4, '2011-06-17 00:00:00', 368, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (782, 5, '2011-06-17 00:00:00', 9, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (782, 6, '2011-06-17 00:00:00', 368, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (798, 100, '2011-06-17 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (798, 101, '2011-06-17 00:00:00', 12, 334, -1, NULL);
INSERT INTO storage.base_operations VALUES (798, 102, '2011-06-17 00:00:00', 12, 335, -1, NULL);
INSERT INTO storage.base_operations VALUES (798, 103, '2011-06-17 00:00:00', 12, 351, -1, NULL);
INSERT INTO storage.base_operations VALUES (798, 1, '2011-06-17 00:00:00', 12, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (798, 0, '2011-06-17 00:00:00', 368, 347, 1, NULL);
INSERT INTO storage.base_operations VALUES (798, 3, '2011-06-17 00:00:00', 12, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (798, 4, '2011-06-17 00:00:00', 368, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (798, 5, '2011-06-17 00:00:00', 9, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (798, 6, '2011-06-17 00:00:00', 368, 347, 0, NULL);
INSERT INTO storage.base_operations VALUES (789, 100, '2011-06-17 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (789, 101, '2011-06-17 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (789, 102, '2011-06-17 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (789, 103, '2011-06-17 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (789, 104, '2011-06-17 00:00:00', 12, 89, -1, NULL);
INSERT INTO storage.base_operations VALUES (789, 1, '2011-06-17 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (789, 0, '2011-06-17 00:00:00', 368, 205, 1, NULL);
INSERT INTO storage.base_operations VALUES (789, 3, '2011-06-17 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (789, 4, '2011-06-17 00:00:00', 368, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (789, 5, '2011-06-17 00:00:00', 9, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (789, 6, '2011-06-17 00:00:00', 368, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (792, 100, '2011-06-17 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (792, 101, '2011-06-17 00:00:00', 12, 99, -1, NULL);
INSERT INTO storage.base_operations VALUES (792, 102, '2011-06-17 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (792, 103, '2011-06-17 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (792, 104, '2011-06-17 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (792, 1, '2011-06-17 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (792, 0, '2011-06-17 00:00:00', 368, 262, 1, NULL);
INSERT INTO storage.base_operations VALUES (792, 3, '2011-06-17 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (792, 4, '2011-06-17 00:00:00', 368, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (792, 5, '2011-06-17 00:00:00', 9, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (792, 6, '2011-06-17 00:00:00', 368, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (796, 100, '2011-06-17 00:00:00', 12, 95, -1, NULL);
INSERT INTO storage.base_operations VALUES (796, 101, '2011-06-17 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (796, 102, '2011-06-17 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (796, 103, '2011-06-17 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (796, 104, '2011-06-17 00:00:00', 12, 113, -1, NULL);
INSERT INTO storage.base_operations VALUES (796, 1, '2011-06-17 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (796, 0, '2011-06-17 00:00:00', 368, 256, 1, NULL);
INSERT INTO storage.base_operations VALUES (796, 3, '2011-06-17 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (796, 4, '2011-06-17 00:00:00', 368, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (796, 5, '2011-06-17 00:00:00', 9, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (796, 6, '2011-06-17 00:00:00', 368, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (799, 100, '2011-06-17 00:00:00', 12, 98, -1, NULL);
INSERT INTO storage.base_operations VALUES (799, 101, '2011-06-17 00:00:00', 12, 116, -1, NULL);
INSERT INTO storage.base_operations VALUES (799, 102, '2011-06-17 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (799, 103, '2011-06-17 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (799, 104, '2011-06-17 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (799, 1, '2011-06-17 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (799, 0, '2011-06-17 00:00:00', 368, 274, 1, NULL);
INSERT INTO storage.base_operations VALUES (799, 3, '2011-06-17 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (799, 4, '2011-06-17 00:00:00', 368, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (799, 5, '2011-06-17 00:00:00', 9, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (799, 6, '2011-06-17 00:00:00', 368, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (800, 100, '2011-05-05 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (800, 101, '2011-05-05 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (800, 102, '2011-05-05 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (800, 103, '2011-05-05 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (800, 104, '2011-05-05 00:00:00', 12, 90, -1, NULL);
INSERT INTO storage.base_operations VALUES (800, 1, '2011-05-05 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (800, 0, '2011-05-05 00:00:00', 369, 210, 1, NULL);
INSERT INTO storage.base_operations VALUES (800, 3, '2011-05-05 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (800, 4, '2011-05-05 00:00:00', 369, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (800, 5, '2011-05-05 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (800, 6, '2011-05-05 00:00:00', 369, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (801, 100, '2011-05-05 00:00:00', 12, 113, -1, NULL);
INSERT INTO storage.base_operations VALUES (801, 101, '2011-05-05 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (801, 102, '2011-05-05 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (801, 103, '2011-05-05 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (801, 104, '2011-05-05 00:00:00', 12, 88, -1, NULL);
INSERT INTO storage.base_operations VALUES (801, 1, '2011-05-05 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (801, 0, '2011-05-05 00:00:00', 369, 186, 1, NULL);
INSERT INTO storage.base_operations VALUES (801, 3, '2011-05-05 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (801, 4, '2011-05-05 00:00:00', 369, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (801, 5, '2011-05-05 00:00:00', 9, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (801, 6, '2011-05-05 00:00:00', 369, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (803, 100, '2011-05-05 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (803, 101, '2011-05-05 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (803, 102, '2011-05-05 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (803, 103, '2011-05-05 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (803, 104, '2011-05-05 00:00:00', 12, 89, -1, NULL);
INSERT INTO storage.base_operations VALUES (803, 1, '2011-05-05 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (803, 0, '2011-05-05 00:00:00', 369, 205, 1, NULL);
INSERT INTO storage.base_operations VALUES (803, 3, '2011-05-05 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (803, 4, '2011-05-05 00:00:00', 369, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (803, 5, '2011-05-05 00:00:00', 9, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (803, 6, '2011-05-05 00:00:00', 369, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (802, 100, '2011-05-05 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (802, 101, '2011-05-05 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (802, 102, '2011-05-05 00:00:00', 12, 91, -1, NULL);
INSERT INTO storage.base_operations VALUES (802, 103, '2011-05-05 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (802, 104, '2011-05-05 00:00:00', 12, 116, -1, NULL);
INSERT INTO storage.base_operations VALUES (802, 1, '2011-05-05 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (802, 0, '2011-05-05 00:00:00', 369, 217, 1, NULL);
INSERT INTO storage.base_operations VALUES (802, 3, '2011-05-05 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (802, 4, '2011-05-05 00:00:00', 369, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (802, 5, '2011-05-05 00:00:00', 9, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (802, 6, '2011-05-05 00:00:00', 369, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1177, 0, '2011-07-08 00:00:00', 358, 280, 24, NULL);
INSERT INTO storage.base_operations VALUES (1177, 3, '2011-07-08 00:00:00', 12, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1177, 4, '2011-07-08 00:00:00', 358, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1177, 5, '2011-07-08 00:00:00', 9, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1177, 6, '2011-07-08 00:00:00', 358, 280, 0, NULL);
INSERT INTO storage.base_operations VALUES (1255, 6, '2011-07-05 00:00:00', 83, 84, 0, NULL);
INSERT INTO storage.base_operations VALUES (1119, 100, '2011-06-30 00:00:00', 12, 112, -1, NULL);
INSERT INTO storage.base_operations VALUES (1119, 101, '2011-06-30 00:00:00', 12, 119, -1, NULL);
INSERT INTO storage.base_operations VALUES (1119, 1, '2011-06-30 00:00:00', 12, 224, 0, NULL);
INSERT INTO storage.base_operations VALUES (1119, 0, '2011-06-30 00:00:00', 375, 224, 1, NULL);
INSERT INTO storage.base_operations VALUES (1119, 3, '2011-06-30 00:00:00', 12, 224, 0, NULL);
INSERT INTO storage.base_operations VALUES (1119, 4, '2011-06-30 00:00:00', 375, 224, 0, NULL);
INSERT INTO storage.base_operations VALUES (1119, 5, '2011-06-30 00:00:00', 9, 224, 0, NULL);
INSERT INTO storage.base_operations VALUES (1119, 6, '2011-06-30 00:00:00', 375, 224, 0, NULL);
INSERT INTO storage.base_operations VALUES (1256, 1, '2011-07-05 00:00:00', 35, 87, -166, NULL);
INSERT INTO storage.base_operations VALUES (1256, 0, '2011-07-05 00:00:00', 83, 87, 166, NULL);
INSERT INTO storage.base_operations VALUES (1256, 3, '2011-07-05 00:00:00', 35, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1256, 4, '2011-07-05 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1256, 5, '2011-07-05 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1256, 6, '2011-07-05 00:00:00', 83, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (1152, 100, '2011-07-08 00:00:00', 12, 91, -8, NULL);
INSERT INTO storage.base_operations VALUES (1152, 101, '2011-07-08 00:00:00', 12, 125, -8, NULL);
INSERT INTO storage.base_operations VALUES (1152, 102, '2011-07-08 00:00:00', 12, 126, -8, NULL);
INSERT INTO storage.base_operations VALUES (1152, 103, '2011-07-08 00:00:00', 12, 121, -8, NULL);
INSERT INTO storage.base_operations VALUES (1120, 100, '2011-06-30 00:00:00', 12, 119, -1, NULL);
INSERT INTO storage.base_operations VALUES (1120, 101, '2011-06-30 00:00:00', 12, 331, -1, NULL);
INSERT INTO storage.base_operations VALUES (1120, 1, '2011-06-30 00:00:00', 12, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1120, 0, '2011-06-30 00:00:00', 376, 192, 1, NULL);
INSERT INTO storage.base_operations VALUES (1120, 3, '2011-06-30 00:00:00', 12, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1120, 4, '2011-06-30 00:00:00', 376, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1120, 5, '2011-06-30 00:00:00', 9, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1120, 6, '2011-06-30 00:00:00', 376, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1121, 1, '2011-06-30 00:00:00', 12, 112, -1, NULL);
INSERT INTO storage.base_operations VALUES (1121, 0, '2011-06-30 00:00:00', 376, 112, 1, NULL);
INSERT INTO storage.base_operations VALUES (1121, 3, '2011-06-30 00:00:00', 12, 112, 0, NULL);
INSERT INTO storage.base_operations VALUES (1121, 4, '2011-06-30 00:00:00', 376, 112, 0, NULL);
INSERT INTO storage.base_operations VALUES (1121, 5, '2011-06-30 00:00:00', 9, 112, 0, NULL);
INSERT INTO storage.base_operations VALUES (1121, 6, '2011-06-30 00:00:00', 376, 112, 0, NULL);
INSERT INTO storage.base_operations VALUES (1228, 100, '2011-05-30 00:00:00', 12, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (1122, 100, '2011-07-01 00:00:00', 12, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (1122, 101, '2011-07-01 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (1122, 1, '2011-07-01 00:00:00', 12, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1122, 0, '2011-07-01 00:00:00', 371, 233, 1, NULL);
INSERT INTO storage.base_operations VALUES (1122, 3, '2011-07-01 00:00:00', 12, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1122, 4, '2011-07-01 00:00:00', 371, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1122, 5, '2011-07-01 00:00:00', 9, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1122, 6, '2011-07-01 00:00:00', 371, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1228, 101, '2011-05-30 00:00:00', 12, 330, -1, NULL);
INSERT INTO storage.base_operations VALUES (1228, 1, '2011-05-30 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1228, 0, '2011-05-30 00:00:00', 375, 230, 1, NULL);
INSERT INTO storage.base_operations VALUES (1228, 3, '2011-05-30 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1228, 4, '2011-05-30 00:00:00', 375, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1228, 5, '2011-05-30 00:00:00', 9, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1228, 6, '2011-05-30 00:00:00', 375, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1231, 100, '2011-05-30 00:00:00', 12, 95, -2, NULL);
INSERT INTO storage.base_operations VALUES (1231, 101, '2011-05-30 00:00:00', 12, 126, -2, NULL);
INSERT INTO storage.base_operations VALUES (1231, 102, '2011-05-30 00:00:00', 12, 121, -2, NULL);
INSERT INTO storage.base_operations VALUES (1231, 103, '2011-05-30 00:00:00', 12, 125, -2, NULL);
INSERT INTO storage.base_operations VALUES (1231, 104, '2011-05-30 00:00:00', 12, 113, -2, NULL);
INSERT INTO storage.base_operations VALUES (1231, 1, '2011-05-30 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1231, 0, '2011-05-30 00:00:00', 356, 256, 2, NULL);
INSERT INTO storage.base_operations VALUES (1231, 3, '2011-05-30 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1231, 4, '2011-05-30 00:00:00', 356, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1231, 5, '2011-05-30 00:00:00', 9, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1231, 6, '2011-05-30 00:00:00', 356, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1239, 100, '2011-05-30 00:00:00', 12, 95, -1, NULL);
INSERT INTO storage.base_operations VALUES (1239, 101, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1239, 102, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1239, 103, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1239, 104, '2011-05-30 00:00:00', 12, 113, -1, NULL);
INSERT INTO storage.base_operations VALUES (1239, 1, '2011-05-30 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1239, 0, '2011-05-30 00:00:00', 375, 256, 1, NULL);
INSERT INTO storage.base_operations VALUES (1239, 3, '2011-05-30 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1239, 4, '2011-05-30 00:00:00', 375, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1239, 5, '2011-05-30 00:00:00', 9, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1239, 6, '2011-05-30 00:00:00', 375, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1166, 1, '2011-05-16 00:00:00', 378, 335, -2000, NULL);
INSERT INTO storage.base_operations VALUES (1166, 0, '2011-05-16 00:00:00', 12, 335, 2000, NULL);
INSERT INTO storage.base_operations VALUES (1166, 3, '2011-05-16 00:00:00', 378, 335, 0, NULL);
INSERT INTO storage.base_operations VALUES (1166, 4, '2011-05-16 00:00:00', 12, 335, 0, NULL);
INSERT INTO storage.base_operations VALUES (1166, 5, '2011-05-16 00:00:00', 9, 335, 0, NULL);
INSERT INTO storage.base_operations VALUES (1166, 6, '2011-05-16 00:00:00', 12, 335, 0, NULL);
INSERT INTO storage.base_operations VALUES (91, 100, '2011-04-19 00:00:00', 12, 97, -16, NULL);
INSERT INTO storage.base_operations VALUES (91, 101, '2011-04-19 00:00:00', 12, 125, -16, NULL);
INSERT INTO storage.base_operations VALUES (91, 102, '2011-04-19 00:00:00', 12, 126, -16, NULL);
INSERT INTO storage.base_operations VALUES (91, 103, '2011-04-19 00:00:00', 12, 121, -16, NULL);
INSERT INTO storage.base_operations VALUES (91, 1, '2011-04-19 00:00:00', 12, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (91, 0, '2011-04-19 00:00:00', 146, 246, 16, NULL);
INSERT INTO storage.base_operations VALUES (91, 3, '2011-04-19 00:00:00', 12, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (91, 4, '2011-04-19 00:00:00', 146, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (91, 5, '2011-04-19 00:00:00', 9, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (91, 6, '2011-04-19 00:00:00', 146, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (1178, 100, '2011-07-08 00:00:00', 12, 85, -24, NULL);
INSERT INTO storage.base_operations VALUES (1178, 101, '2011-07-08 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (1178, 102, '2011-07-08 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (1178, 103, '2011-07-08 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (1178, 1, '2011-07-08 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1178, 0, '2011-07-08 00:00:00', 358, 285, 24, NULL);
INSERT INTO storage.base_operations VALUES (1178, 3, '2011-07-08 00:00:00', 12, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1178, 4, '2011-07-08 00:00:00', 358, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1178, 5, '2011-07-08 00:00:00', 9, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1178, 6, '2011-07-08 00:00:00', 358, 285, 0, NULL);
INSERT INTO storage.base_operations VALUES (1195, 100, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1195, 101, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1195, 102, '2011-05-30 00:00:00', 12, 91, -1, NULL);
INSERT INTO storage.base_operations VALUES (1195, 103, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1195, 104, '2011-05-30 00:00:00', 12, 116, -1, NULL);
INSERT INTO storage.base_operations VALUES (1195, 1, '2011-05-30 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1195, 0, '2011-05-30 00:00:00', 375, 217, 1, NULL);
INSERT INTO storage.base_operations VALUES (1195, 3, '2011-05-30 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1195, 4, '2011-05-30 00:00:00', 375, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1195, 5, '2011-05-30 00:00:00', 9, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1195, 6, '2011-05-30 00:00:00', 375, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1206, 100, '2011-06-10 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1206, 101, '2011-06-10 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1206, 102, '2011-06-10 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1206, 103, '2011-06-10 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (1206, 104, '2011-06-10 00:00:00', 12, 89, -1, NULL);
INSERT INTO storage.base_operations VALUES (1206, 1, '2011-06-10 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1125, 100, '2011-07-05 00:00:00', 12, 113, -27, NULL);
INSERT INTO storage.base_operations VALUES (1125, 101, '2011-07-05 00:00:00', 12, 121, -27, NULL);
INSERT INTO storage.base_operations VALUES (1125, 102, '2011-07-05 00:00:00', 12, 126, -27, NULL);
INSERT INTO storage.base_operations VALUES (1125, 103, '2011-07-05 00:00:00', 12, 125, -27, NULL);
INSERT INTO storage.base_operations VALUES (1125, 104, '2011-07-05 00:00:00', 12, 88, -27, NULL);
INSERT INTO storage.base_operations VALUES (1125, 1, '2011-07-05 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1125, 0, '2011-07-05 00:00:00', 377, 186, 27, NULL);
INSERT INTO storage.base_operations VALUES (1125, 3, '2011-07-05 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1125, 4, '2011-07-05 00:00:00', 377, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1125, 5, '2011-07-05 00:00:00', 9, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1125, 6, '2011-07-05 00:00:00', 377, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1126, 100, '2011-07-05 00:00:00', 12, 125, -36, NULL);
INSERT INTO storage.base_operations VALUES (1126, 101, '2011-07-05 00:00:00', 12, 126, -36, NULL);
INSERT INTO storage.base_operations VALUES (1126, 102, '2011-07-05 00:00:00', 12, 121, -36, NULL);
INSERT INTO storage.base_operations VALUES (1126, 103, '2011-07-05 00:00:00', 12, 114, -36, NULL);
INSERT INTO storage.base_operations VALUES (1126, 104, '2011-07-05 00:00:00', 12, 89, -36, NULL);
INSERT INTO storage.base_operations VALUES (1126, 1, '2011-07-05 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1126, 0, '2011-07-05 00:00:00', 377, 205, 36, NULL);
INSERT INTO storage.base_operations VALUES (1126, 3, '2011-07-05 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1126, 4, '2011-07-05 00:00:00', 377, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1126, 5, '2011-07-05 00:00:00', 9, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1126, 6, '2011-07-05 00:00:00', 377, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1123, 100, '2011-07-05 00:00:00', 12, 115, -36, NULL);
INSERT INTO storage.base_operations VALUES (1123, 101, '2011-07-05 00:00:00', 12, 125, -36, NULL);
INSERT INTO storage.base_operations VALUES (1123, 102, '2011-07-05 00:00:00', 12, 121, -36, NULL);
INSERT INTO storage.base_operations VALUES (1123, 103, '2011-07-05 00:00:00', 12, 126, -36, NULL);
INSERT INTO storage.base_operations VALUES (1123, 104, '2011-07-05 00:00:00', 12, 90, -36, NULL);
INSERT INTO storage.base_operations VALUES (1123, 1, '2011-07-05 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1123, 0, '2011-07-05 00:00:00', 377, 210, 36, NULL);
INSERT INTO storage.base_operations VALUES (1123, 3, '2011-07-05 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1123, 4, '2011-07-05 00:00:00', 377, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1123, 5, '2011-07-05 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1123, 6, '2011-07-05 00:00:00', 377, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1124, 100, '2011-07-05 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (1124, 101, '2011-07-05 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (1124, 102, '2011-07-05 00:00:00', 12, 91, -24, NULL);
INSERT INTO storage.base_operations VALUES (1124, 103, '2011-07-05 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (1124, 104, '2011-07-05 00:00:00', 12, 116, -24, NULL);
INSERT INTO storage.base_operations VALUES (1124, 1, '2011-07-05 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1124, 0, '2011-07-05 00:00:00', 377, 217, 24, NULL);
INSERT INTO storage.base_operations VALUES (1124, 3, '2011-07-05 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1124, 4, '2011-07-05 00:00:00', 377, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1124, 5, '2011-07-05 00:00:00', 9, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1124, 6, '2011-07-05 00:00:00', 377, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1206, 0, '2011-06-10 00:00:00', 379, 205, 1, NULL);
INSERT INTO storage.base_operations VALUES (1206, 3, '2011-06-10 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1206, 4, '2011-06-10 00:00:00', 379, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1206, 5, '2011-06-10 00:00:00', 9, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1206, 6, '2011-06-10 00:00:00', 379, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1217, 100, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1217, 101, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1217, 102, '2011-05-30 00:00:00', 12, 91, -1, NULL);
INSERT INTO storage.base_operations VALUES (1127, 100, '2011-07-05 00:00:00', 12, 95, -18, NULL);
INSERT INTO storage.base_operations VALUES (1127, 101, '2011-07-05 00:00:00', 12, 126, -18, NULL);
INSERT INTO storage.base_operations VALUES (1127, 102, '2011-07-05 00:00:00', 12, 121, -18, NULL);
INSERT INTO storage.base_operations VALUES (1127, 103, '2011-07-05 00:00:00', 12, 125, -18, NULL);
INSERT INTO storage.base_operations VALUES (1127, 104, '2011-07-05 00:00:00', 12, 113, -18, NULL);
INSERT INTO storage.base_operations VALUES (1127, 1, '2011-07-05 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1127, 0, '2011-07-05 00:00:00', 377, 256, 18, NULL);
INSERT INTO storage.base_operations VALUES (1127, 3, '2011-07-05 00:00:00', 12, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1127, 4, '2011-07-05 00:00:00', 377, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1127, 5, '2011-07-05 00:00:00', 9, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1127, 6, '2011-07-05 00:00:00', 377, 256, 0, NULL);
INSERT INTO storage.base_operations VALUES (1128, 100, '2011-07-05 00:00:00', 12, 125, -36, NULL);
INSERT INTO storage.base_operations VALUES (1128, 101, '2011-07-05 00:00:00', 12, 99, -36, NULL);
INSERT INTO storage.base_operations VALUES (1128, 102, '2011-07-05 00:00:00', 12, 114, -36, NULL);
INSERT INTO storage.base_operations VALUES (1128, 103, '2011-07-05 00:00:00', 12, 126, -36, NULL);
INSERT INTO storage.base_operations VALUES (1128, 104, '2011-07-05 00:00:00', 12, 121, -36, NULL);
INSERT INTO storage.base_operations VALUES (1128, 1, '2011-07-05 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1128, 0, '2011-07-05 00:00:00', 377, 262, 36, NULL);
INSERT INTO storage.base_operations VALUES (1128, 3, '2011-07-05 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1128, 4, '2011-07-05 00:00:00', 377, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1128, 5, '2011-07-05 00:00:00', 9, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1128, 6, '2011-07-05 00:00:00', 377, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1129, 100, '2011-07-05 00:00:00', 12, 97, -36, NULL);
INSERT INTO storage.base_operations VALUES (1129, 101, '2011-07-05 00:00:00', 12, 115, -36, NULL);
INSERT INTO storage.base_operations VALUES (1129, 102, '2011-07-05 00:00:00', 12, 125, -36, NULL);
INSERT INTO storage.base_operations VALUES (1129, 103, '2011-07-05 00:00:00', 12, 126, -36, NULL);
INSERT INTO storage.base_operations VALUES (1129, 104, '2011-07-05 00:00:00', 12, 121, -36, NULL);
INSERT INTO storage.base_operations VALUES (1129, 1, '2011-07-05 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1129, 0, '2011-07-05 00:00:00', 377, 268, 36, NULL);
INSERT INTO storage.base_operations VALUES (1129, 3, '2011-07-05 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1129, 4, '2011-07-05 00:00:00', 377, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1129, 5, '2011-07-05 00:00:00', 9, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1129, 6, '2011-07-05 00:00:00', 377, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1130, 100, '2011-07-05 00:00:00', 12, 98, -24, NULL);
INSERT INTO storage.base_operations VALUES (1130, 101, '2011-07-05 00:00:00', 12, 116, -24, NULL);
INSERT INTO storage.base_operations VALUES (1130, 102, '2011-07-05 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (1130, 103, '2011-07-05 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (1130, 104, '2011-07-05 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (1130, 1, '2011-07-05 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1130, 0, '2011-07-05 00:00:00', 377, 274, 24, NULL);
INSERT INTO storage.base_operations VALUES (1130, 3, '2011-07-05 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1130, 4, '2011-07-05 00:00:00', 377, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1130, 5, '2011-07-05 00:00:00', 9, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1130, 6, '2011-07-05 00:00:00', 377, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1131, 100, '2011-07-05 00:00:00', 12, 85, -24, NULL);
INSERT INTO storage.base_operations VALUES (1131, 101, '2011-07-05 00:00:00', 12, 114, -24, NULL);
INSERT INTO storage.base_operations VALUES (1131, 102, '2011-07-05 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (1131, 103, '2011-07-05 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (1131, 104, '2011-07-05 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (1131, 1, '2011-07-05 00:00:00', 12, 306, 0, NULL);
INSERT INTO storage.base_operations VALUES (1131, 0, '2011-07-05 00:00:00', 377, 306, 24, NULL);
INSERT INTO storage.base_operations VALUES (1131, 3, '2011-07-05 00:00:00', 12, 306, 0, NULL);
INSERT INTO storage.base_operations VALUES (1131, 4, '2011-07-05 00:00:00', 377, 306, 0, NULL);
INSERT INTO storage.base_operations VALUES (1131, 5, '2011-07-05 00:00:00', 9, 306, 0, NULL);
INSERT INTO storage.base_operations VALUES (1131, 6, '2011-07-05 00:00:00', 377, 306, 0, NULL);
INSERT INTO storage.base_operations VALUES (1132, 100, '2011-07-05 00:00:00', 12, 86, -24, NULL);
INSERT INTO storage.base_operations VALUES (1132, 101, '2011-07-05 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (1132, 102, '2011-07-05 00:00:00', 12, 115, -24, NULL);
INSERT INTO storage.base_operations VALUES (1132, 103, '2011-07-05 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (1132, 104, '2011-07-05 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (1132, 1, '2011-07-05 00:00:00', 12, 312, 0, NULL);
INSERT INTO storage.base_operations VALUES (1132, 0, '2011-07-05 00:00:00', 377, 312, 24, NULL);
INSERT INTO storage.base_operations VALUES (1132, 3, '2011-07-05 00:00:00', 12, 312, 0, NULL);
INSERT INTO storage.base_operations VALUES (1132, 4, '2011-07-05 00:00:00', 377, 312, 0, NULL);
INSERT INTO storage.base_operations VALUES (1132, 5, '2011-07-05 00:00:00', 9, 312, 0, NULL);
INSERT INTO storage.base_operations VALUES (1132, 6, '2011-07-05 00:00:00', 377, 312, 0, NULL);
INSERT INTO storage.base_operations VALUES (1133, 100, '2011-07-05 00:00:00', 12, 141, -16, NULL);
INSERT INTO storage.base_operations VALUES (1133, 101, '2011-07-05 00:00:00', 12, 143, -16, NULL);
INSERT INTO storage.base_operations VALUES (1133, 1, '2011-07-05 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1133, 0, '2011-07-05 00:00:00', 377, 321, 16, NULL);
INSERT INTO storage.base_operations VALUES (1133, 3, '2011-07-05 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1133, 4, '2011-07-05 00:00:00', 377, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1133, 5, '2011-07-05 00:00:00', 9, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1133, 6, '2011-07-05 00:00:00', 377, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1134, 100, '2011-07-05 00:00:00', 12, 141, -12, NULL);
INSERT INTO storage.base_operations VALUES (1134, 101, '2011-07-05 00:00:00', 12, 143, -12, NULL);
INSERT INTO storage.base_operations VALUES (1134, 1, '2011-07-05 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1134, 0, '2011-07-05 00:00:00', 377, 321, 12, NULL);
INSERT INTO storage.base_operations VALUES (1134, 3, '2011-07-05 00:00:00', 12, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1134, 4, '2011-07-05 00:00:00', 377, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1134, 5, '2011-07-05 00:00:00', 9, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1134, 6, '2011-07-05 00:00:00', 377, 321, 0, NULL);
INSERT INTO storage.base_operations VALUES (1179, 100, '2011-07-08 00:00:00', 12, 86, -24, NULL);
INSERT INTO storage.base_operations VALUES (1179, 101, '2011-07-08 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (1179, 102, '2011-07-08 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (1179, 103, '2011-07-08 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (1179, 1, '2011-07-08 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1179, 0, '2011-07-08 00:00:00', 358, 290, 24, NULL);
INSERT INTO storage.base_operations VALUES (1179, 3, '2011-07-08 00:00:00', 12, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1179, 4, '2011-07-08 00:00:00', 358, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1179, 5, '2011-07-08 00:00:00', 9, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1179, 6, '2011-07-08 00:00:00', 358, 290, 0, NULL);
INSERT INTO storage.base_operations VALUES (1152, 1, '2011-07-08 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1152, 0, '2011-07-08 00:00:00', 146, 200, 8, NULL);
INSERT INTO storage.base_operations VALUES (1152, 3, '2011-07-08 00:00:00', 12, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1152, 4, '2011-07-08 00:00:00', 146, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1152, 5, '2011-07-08 00:00:00', 9, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1152, 6, '2011-07-08 00:00:00', 146, 200, 0, NULL);
INSERT INTO storage.base_operations VALUES (1207, 100, '2011-06-10 00:00:00', 12, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (1207, 101, '2011-06-10 00:00:00', 12, 330, -1, NULL);
INSERT INTO storage.base_operations VALUES (1207, 1, '2011-06-10 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1207, 0, '2011-06-10 00:00:00', 379, 230, 1, NULL);
INSERT INTO storage.base_operations VALUES (1207, 3, '2011-06-10 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1207, 4, '2011-06-10 00:00:00', 379, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1207, 5, '2011-06-10 00:00:00', 9, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1207, 6, '2011-06-10 00:00:00', 379, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1217, 103, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1217, 104, '2011-05-30 00:00:00', 12, 116, -1, NULL);
INSERT INTO storage.base_operations VALUES (1217, 1, '2011-05-30 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1217, 0, '2011-05-30 00:00:00', 371, 217, 1, NULL);
INSERT INTO storage.base_operations VALUES (1217, 3, '2011-05-30 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1217, 4, '2011-05-30 00:00:00', 371, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1217, 5, '2011-05-30 00:00:00', 9, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1217, 6, '2011-05-30 00:00:00', 371, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1153, 100, '2011-07-08 00:00:00', 12, 141, -8, NULL);
INSERT INTO storage.base_operations VALUES (1153, 101, '2011-07-08 00:00:00', 12, 114, -8, NULL);
INSERT INTO storage.base_operations VALUES (1153, 1, '2011-07-08 00:00:00', 12, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1153, 0, '2011-07-08 00:00:00', 146, 233, 8, NULL);
INSERT INTO storage.base_operations VALUES (1153, 3, '2011-07-08 00:00:00', 12, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1135, 100, '2011-07-05 00:00:00', 12, 113, -45, NULL);
INSERT INTO storage.base_operations VALUES (1135, 101, '2011-07-05 00:00:00', 12, 121, -45, NULL);
INSERT INTO storage.base_operations VALUES (1135, 102, '2011-07-05 00:00:00', 12, 126, -45, NULL);
INSERT INTO storage.base_operations VALUES (1135, 103, '2011-07-05 00:00:00', 12, 125, -45, NULL);
INSERT INTO storage.base_operations VALUES (1135, 104, '2011-07-05 00:00:00', 12, 88, -45, NULL);
INSERT INTO storage.base_operations VALUES (1135, 1, '2011-07-05 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1135, 0, '2011-07-05 00:00:00', 358, 186, 45, NULL);
INSERT INTO storage.base_operations VALUES (1135, 3, '2011-07-05 00:00:00', 12, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1135, 4, '2011-07-05 00:00:00', 358, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1135, 5, '2011-07-05 00:00:00', 9, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1135, 6, '2011-07-05 00:00:00', 358, 186, 0, NULL);
INSERT INTO storage.base_operations VALUES (1136, 100, '2011-07-05 00:00:00', 12, 125, -42, NULL);
INSERT INTO storage.base_operations VALUES (1136, 101, '2011-07-05 00:00:00', 12, 126, -42, NULL);
INSERT INTO storage.base_operations VALUES (1136, 102, '2011-07-05 00:00:00', 12, 121, -42, NULL);
INSERT INTO storage.base_operations VALUES (1136, 103, '2011-07-05 00:00:00', 12, 114, -42, NULL);
INSERT INTO storage.base_operations VALUES (1136, 104, '2011-07-05 00:00:00', 12, 89, -42, NULL);
INSERT INTO storage.base_operations VALUES (1136, 1, '2011-07-05 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1136, 0, '2011-07-05 00:00:00', 358, 205, 42, NULL);
INSERT INTO storage.base_operations VALUES (1136, 3, '2011-07-05 00:00:00', 12, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1136, 4, '2011-07-05 00:00:00', 358, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1136, 5, '2011-07-05 00:00:00', 9, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1136, 6, '2011-07-05 00:00:00', 358, 205, 0, NULL);
INSERT INTO storage.base_operations VALUES (1137, 100, '2011-07-05 00:00:00', 12, 115, -42, NULL);
INSERT INTO storage.base_operations VALUES (1137, 101, '2011-07-05 00:00:00', 12, 125, -42, NULL);
INSERT INTO storage.base_operations VALUES (1137, 102, '2011-07-05 00:00:00', 12, 121, -42, NULL);
INSERT INTO storage.base_operations VALUES (1137, 103, '2011-07-05 00:00:00', 12, 126, -42, NULL);
INSERT INTO storage.base_operations VALUES (1137, 104, '2011-07-05 00:00:00', 12, 90, -42, NULL);
INSERT INTO storage.base_operations VALUES (1137, 1, '2011-07-05 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1137, 0, '2011-07-05 00:00:00', 358, 210, 42, NULL);
INSERT INTO storage.base_operations VALUES (1137, 3, '2011-07-05 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1137, 4, '2011-07-05 00:00:00', 358, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1137, 5, '2011-07-05 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1137, 6, '2011-07-05 00:00:00', 358, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1138, 100, '2011-07-05 00:00:00', 12, 125, -30, NULL);
INSERT INTO storage.base_operations VALUES (1138, 101, '2011-07-05 00:00:00', 12, 126, -30, NULL);
INSERT INTO storage.base_operations VALUES (1138, 102, '2011-07-05 00:00:00', 12, 91, -30, NULL);
INSERT INTO storage.base_operations VALUES (1138, 103, '2011-07-05 00:00:00', 12, 121, -30, NULL);
INSERT INTO storage.base_operations VALUES (1138, 104, '2011-07-05 00:00:00', 12, 116, -30, NULL);
INSERT INTO storage.base_operations VALUES (1138, 1, '2011-07-05 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1138, 0, '2011-07-05 00:00:00', 358, 217, 30, NULL);
INSERT INTO storage.base_operations VALUES (1138, 3, '2011-07-05 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1138, 4, '2011-07-05 00:00:00', 358, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1138, 5, '2011-07-05 00:00:00', 9, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1138, 6, '2011-07-05 00:00:00', 358, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1139, 100, '2011-07-05 00:00:00', 12, 119, -16, NULL);
INSERT INTO storage.base_operations VALUES (1139, 101, '2011-07-05 00:00:00', 12, 331, -16, NULL);
INSERT INTO storage.base_operations VALUES (1139, 1, '2011-07-05 00:00:00', 12, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1139, 0, '2011-07-05 00:00:00', 358, 192, 16, NULL);
INSERT INTO storage.base_operations VALUES (1139, 3, '2011-07-05 00:00:00', 12, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1139, 4, '2011-07-05 00:00:00', 358, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1139, 5, '2011-07-05 00:00:00', 9, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1139, 6, '2011-07-05 00:00:00', 358, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1140, 100, '2011-07-05 00:00:00', 12, 141, -15, NULL);
INSERT INTO storage.base_operations VALUES (1140, 101, '2011-07-05 00:00:00', 12, 330, -15, NULL);
INSERT INTO storage.base_operations VALUES (1140, 1, '2011-07-05 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1140, 0, '2011-07-05 00:00:00', 358, 230, 15, NULL);
INSERT INTO storage.base_operations VALUES (1140, 3, '2011-07-05 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1140, 4, '2011-07-05 00:00:00', 358, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1140, 5, '2011-07-05 00:00:00', 9, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1140, 6, '2011-07-05 00:00:00', 358, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1141, 100, '2011-07-05 00:00:00', 12, 125, -40, NULL);
INSERT INTO storage.base_operations VALUES (1141, 101, '2011-07-05 00:00:00', 12, 334, -40, NULL);
INSERT INTO storage.base_operations VALUES (1141, 102, '2011-07-05 00:00:00', 12, 335, -40, NULL);
INSERT INTO storage.base_operations VALUES (1141, 103, '2011-07-05 00:00:00', 12, 228, -40, NULL);
INSERT INTO storage.base_operations VALUES (1141, 1, '2011-07-05 00:00:00', 12, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1141, 0, '2011-07-05 00:00:00', 358, 333, 40, NULL);
INSERT INTO storage.base_operations VALUES (1141, 3, '2011-07-05 00:00:00', 12, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1141, 4, '2011-07-05 00:00:00', 358, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1141, 5, '2011-07-05 00:00:00', 9, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1141, 6, '2011-07-05 00:00:00', 358, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1142, 100, '2011-07-05 00:00:00', 12, 91, -40, NULL);
INSERT INTO storage.base_operations VALUES (1142, 101, '2011-07-05 00:00:00', 12, 126, -40, NULL);
INSERT INTO storage.base_operations VALUES (1142, 102, '2011-07-05 00:00:00', 12, 125, -40, NULL);
INSERT INTO storage.base_operations VALUES (1142, 103, '2011-07-05 00:00:00', 12, 121, -40, NULL);
INSERT INTO storage.base_operations VALUES (1142, 1, '2011-07-05 00:00:00', 12, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (1142, 0, '2011-07-05 00:00:00', 358, 251, 40, NULL);
INSERT INTO storage.base_operations VALUES (1142, 3, '2011-07-05 00:00:00', 12, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (1142, 4, '2011-07-05 00:00:00', 358, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (1142, 5, '2011-07-05 00:00:00', 9, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (1142, 6, '2011-07-05 00:00:00', 358, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (1143, 100, '2011-07-06 00:00:00', 12, 98, -1, NULL);
INSERT INTO storage.base_operations VALUES (1143, 101, '2011-07-06 00:00:00', 12, 116, -1, NULL);
INSERT INTO storage.base_operations VALUES (1143, 102, '2011-07-06 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1143, 103, '2011-07-06 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1143, 104, '2011-07-06 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1143, 1, '2011-07-06 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1143, 0, '2011-07-06 00:00:00', 371, 274, 1, NULL);
INSERT INTO storage.base_operations VALUES (1143, 3, '2011-07-06 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1143, 4, '2011-07-06 00:00:00', 371, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1143, 5, '2011-07-06 00:00:00', 9, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1143, 6, '2011-07-06 00:00:00', 371, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1181, 100, '2011-05-18 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1181, 101, '2011-05-18 00:00:00', 12, 99, -1, NULL);
INSERT INTO storage.base_operations VALUES (1181, 102, '2011-05-18 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (1181, 103, '2011-05-18 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1181, 104, '2011-05-18 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1181, 1, '2011-05-18 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1181, 0, '2011-05-18 00:00:00', 356, 262, 1, NULL);
INSERT INTO storage.base_operations VALUES (1181, 3, '2011-05-18 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1181, 4, '2011-05-18 00:00:00', 356, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1181, 5, '2011-05-18 00:00:00', 9, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1181, 6, '2011-05-18 00:00:00', 356, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1197, 100, '2011-05-31 00:00:00', 12, 98, -1, NULL);
INSERT INTO storage.base_operations VALUES (1144, 100, '2011-07-07 00:00:00', 12, 119, -4, NULL);
INSERT INTO storage.base_operations VALUES (1144, 101, '2011-07-07 00:00:00', 12, 331, -4, NULL);
INSERT INTO storage.base_operations VALUES (1144, 1, '2011-07-07 00:00:00', 12, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1144, 0, '2011-07-07 00:00:00', 375, 192, 4, NULL);
INSERT INTO storage.base_operations VALUES (1144, 3, '2011-07-07 00:00:00', 12, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1144, 4, '2011-07-07 00:00:00', 375, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1144, 5, '2011-07-07 00:00:00', 9, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1144, 6, '2011-07-07 00:00:00', 375, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1145, 1, '2011-07-07 00:00:00', 12, 112, -4, NULL);
INSERT INTO storage.base_operations VALUES (1145, 0, '2011-07-07 00:00:00', 375, 112, 4, NULL);
INSERT INTO storage.base_operations VALUES (1145, 3, '2011-07-07 00:00:00', 12, 112, 0, NULL);
INSERT INTO storage.base_operations VALUES (1145, 4, '2011-07-07 00:00:00', 375, 112, 0, NULL);
INSERT INTO storage.base_operations VALUES (1145, 5, '2011-07-07 00:00:00', 9, 112, 0, NULL);
INSERT INTO storage.base_operations VALUES (1145, 6, '2011-07-07 00:00:00', 375, 112, 0, NULL);
INSERT INTO storage.base_operations VALUES (1197, 101, '2011-05-31 00:00:00', 12, 116, -1, NULL);
INSERT INTO storage.base_operations VALUES (1197, 102, '2011-05-31 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1197, 103, '2011-05-31 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1197, 104, '2011-05-31 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1197, 1, '2011-05-31 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1197, 0, '2011-05-31 00:00:00', 356, 274, 1, NULL);
INSERT INTO storage.base_operations VALUES (1197, 3, '2011-05-31 00:00:00', 12, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1197, 4, '2011-05-31 00:00:00', 356, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1197, 5, '2011-05-31 00:00:00', 9, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1197, 6, '2011-05-31 00:00:00', 356, 274, 0, NULL);
INSERT INTO storage.base_operations VALUES (1208, 1, '2011-06-10 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (1208, 0, '2011-06-10 00:00:00', 379, 114, 1, NULL);
INSERT INTO storage.base_operations VALUES (1208, 3, '2011-06-10 00:00:00', 12, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (1208, 4, '2011-06-10 00:00:00', 379, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (1208, 5, '2011-06-10 00:00:00', 9, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (1208, 6, '2011-06-10 00:00:00', 379, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (1146, 100, '2011-07-07 00:00:00', 12, 119, -2, NULL);
INSERT INTO storage.base_operations VALUES (1146, 101, '2011-07-07 00:00:00', 12, 331, -2, NULL);
INSERT INTO storage.base_operations VALUES (1146, 1, '2011-07-07 00:00:00', 12, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1146, 0, '2011-07-07 00:00:00', 356, 192, 2, NULL);
INSERT INTO storage.base_operations VALUES (1146, 3, '2011-07-07 00:00:00', 12, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1146, 4, '2011-07-07 00:00:00', 356, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1146, 5, '2011-07-07 00:00:00', 9, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1146, 6, '2011-07-07 00:00:00', 356, 192, 0, NULL);
INSERT INTO storage.base_operations VALUES (1147, 100, '2011-07-07 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1147, 101, '2011-07-07 00:00:00', 12, 99, -1, NULL);
INSERT INTO storage.base_operations VALUES (1147, 102, '2011-07-07 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (1147, 103, '2011-07-07 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1147, 104, '2011-07-07 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1147, 1, '2011-07-07 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1147, 0, '2011-07-07 00:00:00', 356, 262, 1, NULL);
INSERT INTO storage.base_operations VALUES (1147, 3, '2011-07-07 00:00:00', 12, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1147, 4, '2011-07-07 00:00:00', 356, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1147, 5, '2011-07-07 00:00:00', 9, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1147, 6, '2011-07-07 00:00:00', 356, 262, 0, NULL);
INSERT INTO storage.base_operations VALUES (1148, 100, '2011-07-07 00:00:00', 12, 97, -1, NULL);
INSERT INTO storage.base_operations VALUES (1148, 101, '2011-07-07 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (1148, 102, '2011-07-07 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1148, 103, '2011-07-07 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1148, 104, '2011-07-07 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1148, 1, '2011-07-07 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1148, 0, '2011-07-07 00:00:00', 356, 268, 1, NULL);
INSERT INTO storage.base_operations VALUES (1148, 3, '2011-07-07 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1148, 4, '2011-07-07 00:00:00', 356, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1148, 5, '2011-07-07 00:00:00', 9, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1148, 6, '2011-07-07 00:00:00', 356, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1225, 1, '2011-05-30 00:00:00', 12, 114, -1, NULL);
INSERT INTO storage.base_operations VALUES (1225, 0, '2011-05-30 00:00:00', 375, 114, 1, NULL);
INSERT INTO storage.base_operations VALUES (1225, 3, '2011-05-30 00:00:00', 12, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (1225, 4, '2011-05-30 00:00:00', 375, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (1225, 5, '2011-05-30 00:00:00', 9, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (1225, 6, '2011-05-30 00:00:00', 375, 114, 0, NULL);
INSERT INTO storage.base_operations VALUES (931, 1, '2011-06-09 00:00:00', 8, 87, -1500, NULL);
INSERT INTO storage.base_operations VALUES (931, 0, '2011-06-09 00:00:00', 147, 87, 1500, NULL);
INSERT INTO storage.base_operations VALUES (931, 3, '2011-06-09 00:00:00', 8, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (931, 4, '2011-06-09 00:00:00', 147, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (931, 5, '2011-06-09 00:00:00', 9, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (931, 6, '2011-06-09 00:00:00', 147, 87, 0, NULL);
INSERT INTO storage.base_operations VALUES (251, -1, '2011-04-18 00:00:00', 12, 90, 450, NULL);
INSERT INTO storage.base_operations VALUES (100, 100, '2011-04-19 00:00:00', 12, 126, -24, NULL);
INSERT INTO storage.base_operations VALUES (100, 101, '2011-04-19 00:00:00', 12, 121, -24, NULL);
INSERT INTO storage.base_operations VALUES (100, 102, '2011-04-19 00:00:00', 12, 125, -24, NULL);
INSERT INTO storage.base_operations VALUES (100, 103, '2011-04-19 00:00:00', 12, 88, -24, NULL);
INSERT INTO storage.base_operations VALUES (100, 1, '2011-04-19 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (100, 0, '2011-04-19 00:00:00', 146, 176, 24, NULL);
INSERT INTO storage.base_operations VALUES (100, 3, '2011-04-19 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (100, 4, '2011-04-19 00:00:00', 146, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (100, 5, '2011-04-19 00:00:00', 9, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (100, 6, '2011-04-19 00:00:00', 146, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (92, 100, '2011-04-19 00:00:00', 12, 91, -8, NULL);
INSERT INTO storage.base_operations VALUES (1153, 4, '2011-07-08 00:00:00', 146, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1153, 5, '2011-07-08 00:00:00', 9, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1153, 6, '2011-07-08 00:00:00', 146, 233, 0, NULL);
INSERT INTO storage.base_operations VALUES (1154, 100, '2011-07-08 00:00:00', 12, 125, -8, NULL);
INSERT INTO storage.base_operations VALUES (1154, 101, '2011-07-08 00:00:00', 12, 334, -8, NULL);
INSERT INTO storage.base_operations VALUES (1154, 102, '2011-07-08 00:00:00', 12, 335, -8, NULL);
INSERT INTO storage.base_operations VALUES (1154, 103, '2011-07-08 00:00:00', 12, 228, -8, NULL);
INSERT INTO storage.base_operations VALUES (1154, 1, '2011-07-08 00:00:00', 12, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1154, 0, '2011-07-08 00:00:00', 146, 333, 8, NULL);
INSERT INTO storage.base_operations VALUES (1154, 3, '2011-07-08 00:00:00', 12, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1154, 4, '2011-07-08 00:00:00', 146, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1154, 5, '2011-07-08 00:00:00', 9, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1154, 6, '2011-07-08 00:00:00', 146, 333, 0, NULL);
INSERT INTO storage.base_operations VALUES (1155, 100, '2011-07-08 00:00:00', 12, 95, -8, NULL);
INSERT INTO storage.base_operations VALUES (1155, 101, '2011-07-08 00:00:00', 12, 125, -8, NULL);
INSERT INTO storage.base_operations VALUES (1155, 102, '2011-07-08 00:00:00', 12, 126, -8, NULL);
INSERT INTO storage.base_operations VALUES (1155, 103, '2011-07-08 00:00:00', 12, 121, -8, NULL);
INSERT INTO storage.base_operations VALUES (1155, 1, '2011-07-08 00:00:00', 12, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1218, 100, '2011-05-30 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (1218, 101, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1218, 102, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1218, 103, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1218, 104, '2011-05-30 00:00:00', 12, 90, -1, NULL);
INSERT INTO storage.base_operations VALUES (1218, 1, '2011-05-30 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1218, 0, '2011-05-30 00:00:00', 379, 210, 1, NULL);
INSERT INTO storage.base_operations VALUES (1218, 3, '2011-05-30 00:00:00', 12, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1218, 4, '2011-05-30 00:00:00', 379, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1218, 5, '2011-05-30 00:00:00', 9, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1218, 6, '2011-05-30 00:00:00', 379, 210, 0, NULL);
INSERT INTO storage.base_operations VALUES (1226, 100, '2011-05-30 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1226, 101, '2011-05-30 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1226, 102, '2011-05-30 00:00:00', 12, 91, -1, NULL);
INSERT INTO storage.base_operations VALUES (1155, 0, '2011-07-08 00:00:00', 146, 236, 8, NULL);
INSERT INTO storage.base_operations VALUES (1155, 3, '2011-07-08 00:00:00', 12, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1155, 4, '2011-07-08 00:00:00', 146, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1155, 5, '2011-07-08 00:00:00', 9, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1155, 6, '2011-07-08 00:00:00', 146, 236, 0, NULL);
INSERT INTO storage.base_operations VALUES (1156, 100, '2011-07-08 00:00:00', 12, 99, -8, NULL);
INSERT INTO storage.base_operations VALUES (1156, 101, '2011-07-08 00:00:00', 12, 121, -8, NULL);
INSERT INTO storage.base_operations VALUES (1156, 102, '2011-07-08 00:00:00', 12, 125, -8, NULL);
INSERT INTO storage.base_operations VALUES (1156, 103, '2011-07-08 00:00:00', 12, 126, -8, NULL);
INSERT INTO storage.base_operations VALUES (1156, 1, '2011-07-08 00:00:00', 12, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (1156, 0, '2011-07-08 00:00:00', 146, 241, 8, NULL);
INSERT INTO storage.base_operations VALUES (1156, 3, '2011-07-08 00:00:00', 12, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (1156, 4, '2011-07-08 00:00:00', 146, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (1156, 5, '2011-07-08 00:00:00', 9, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (1156, 6, '2011-07-08 00:00:00', 146, 241, 0, NULL);
INSERT INTO storage.base_operations VALUES (1157, 100, '2011-07-08 00:00:00', 12, 97, -8, NULL);
INSERT INTO storage.base_operations VALUES (1157, 101, '2011-07-08 00:00:00', 12, 125, -8, NULL);
INSERT INTO storage.base_operations VALUES (1157, 102, '2011-07-08 00:00:00', 12, 126, -8, NULL);
INSERT INTO storage.base_operations VALUES (1157, 103, '2011-07-08 00:00:00', 12, 121, -8, NULL);
INSERT INTO storage.base_operations VALUES (1157, 1, '2011-07-08 00:00:00', 12, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (1157, 0, '2011-07-08 00:00:00', 146, 246, 8, NULL);
INSERT INTO storage.base_operations VALUES (1157, 3, '2011-07-08 00:00:00', 12, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (1157, 4, '2011-07-08 00:00:00', 146, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (1157, 5, '2011-07-08 00:00:00', 9, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (1157, 6, '2011-07-08 00:00:00', 146, 246, 0, NULL);
INSERT INTO storage.base_operations VALUES (1158, 100, '2011-07-08 00:00:00', 12, 91, -8, NULL);
INSERT INTO storage.base_operations VALUES (1158, 101, '2011-07-08 00:00:00', 12, 126, -8, NULL);
INSERT INTO storage.base_operations VALUES (1158, 102, '2011-07-08 00:00:00', 12, 125, -8, NULL);
INSERT INTO storage.base_operations VALUES (1158, 103, '2011-07-08 00:00:00', 12, 121, -8, NULL);
INSERT INTO storage.base_operations VALUES (1158, 1, '2011-07-08 00:00:00', 12, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (1226, 103, '2011-05-30 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1226, 104, '2011-05-30 00:00:00', 12, 116, -1, NULL);
INSERT INTO storage.base_operations VALUES (1226, 1, '2011-05-30 00:00:00', 12, 217, 0, NULL);
INSERT INTO storage.base_operations VALUES (1226, 0, '2011-05-30 00:00:00', 375, 217, 1, NULL);
INSERT INTO storage.base_operations VALUES (1149, 100, '2011-07-08 00:00:00', 12, 126, -8, NULL);
INSERT INTO storage.base_operations VALUES (1149, 101, '2011-07-08 00:00:00', 12, 121, -8, NULL);
INSERT INTO storage.base_operations VALUES (1149, 102, '2011-07-08 00:00:00', 12, 125, -8, NULL);
INSERT INTO storage.base_operations VALUES (1149, 103, '2011-07-08 00:00:00', 12, 88, -8, NULL);
INSERT INTO storage.base_operations VALUES (1149, 1, '2011-07-08 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (1149, 0, '2011-07-08 00:00:00', 146, 176, 8, NULL);
INSERT INTO storage.base_operations VALUES (1149, 3, '2011-07-08 00:00:00', 12, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (1149, 4, '2011-07-08 00:00:00', 146, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (1149, 5, '2011-07-08 00:00:00', 9, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (1149, 6, '2011-07-08 00:00:00', 146, 176, 0, NULL);
INSERT INTO storage.base_operations VALUES (1150, 100, '2011-07-08 00:00:00', 12, 125, -8, NULL);
INSERT INTO storage.base_operations VALUES (1150, 101, '2011-07-08 00:00:00', 12, 126, -8, NULL);
INSERT INTO storage.base_operations VALUES (1150, 102, '2011-07-08 00:00:00', 12, 89, -8, NULL);
INSERT INTO storage.base_operations VALUES (1150, 103, '2011-07-08 00:00:00', 12, 121, -8, NULL);
INSERT INTO storage.base_operations VALUES (1150, 1, '2011-07-08 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1150, 0, '2011-07-08 00:00:00', 146, 181, 8, NULL);
INSERT INTO storage.base_operations VALUES (1150, 3, '2011-07-08 00:00:00', 12, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1150, 4, '2011-07-08 00:00:00', 146, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1150, 5, '2011-07-08 00:00:00', 9, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1150, 6, '2011-07-08 00:00:00', 146, 181, 0, NULL);
INSERT INTO storage.base_operations VALUES (1151, 100, '2011-07-08 00:00:00', 12, 90, -8, NULL);
INSERT INTO storage.base_operations VALUES (1151, 101, '2011-07-08 00:00:00', 12, 125, -8, NULL);
INSERT INTO storage.base_operations VALUES (1151, 102, '2011-07-08 00:00:00', 12, 121, -8, NULL);
INSERT INTO storage.base_operations VALUES (1151, 103, '2011-07-08 00:00:00', 12, 126, -8, NULL);
INSERT INTO storage.base_operations VALUES (1151, 1, '2011-07-08 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (1151, 0, '2011-07-08 00:00:00', 146, 195, 8, NULL);
INSERT INTO storage.base_operations VALUES (1151, 3, '2011-07-08 00:00:00', 12, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (1151, 4, '2011-07-08 00:00:00', 146, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (1151, 5, '2011-07-08 00:00:00', 9, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (1151, 6, '2011-07-08 00:00:00', 146, 195, 0, NULL);
INSERT INTO storage.base_operations VALUES (1158, 0, '2011-07-08 00:00:00', 146, 251, 8, NULL);
INSERT INTO storage.base_operations VALUES (1158, 3, '2011-07-08 00:00:00', 12, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (1158, 4, '2011-07-08 00:00:00', 146, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (1158, 5, '2011-07-08 00:00:00', 9, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (1158, 6, '2011-07-08 00:00:00', 146, 251, 0, NULL);
INSERT INTO storage.base_operations VALUES (1182, 100, '2011-05-18 00:00:00', 12, 97, -1, NULL);
INSERT INTO storage.base_operations VALUES (1182, 101, '2011-05-18 00:00:00', 12, 115, -1, NULL);
INSERT INTO storage.base_operations VALUES (1182, 102, '2011-05-18 00:00:00', 12, 125, -1, NULL);
INSERT INTO storage.base_operations VALUES (1182, 103, '2011-05-18 00:00:00', 12, 126, -1, NULL);
INSERT INTO storage.base_operations VALUES (1182, 104, '2011-05-18 00:00:00', 12, 121, -1, NULL);
INSERT INTO storage.base_operations VALUES (1182, 1, '2011-05-18 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1182, 0, '2011-05-18 00:00:00', 376, 268, 1, NULL);
INSERT INTO storage.base_operations VALUES (1182, 3, '2011-05-18 00:00:00', 12, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1182, 4, '2011-05-18 00:00:00', 376, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1182, 5, '2011-05-18 00:00:00', 9, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1182, 6, '2011-05-18 00:00:00', 376, 268, 0, NULL);
INSERT INTO storage.base_operations VALUES (1198, 100, '2011-06-07 00:00:00', 12, 141, -1, NULL);
INSERT INTO storage.base_operations VALUES (1198, 101, '2011-06-07 00:00:00', 12, 330, -1, NULL);
INSERT INTO storage.base_operations VALUES (1198, 1, '2011-06-07 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1198, 0, '2011-06-07 00:00:00', 375, 230, 1, NULL);
INSERT INTO storage.base_operations VALUES (1198, 3, '2011-06-07 00:00:00', 12, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1198, 4, '2011-06-07 00:00:00', 375, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1198, 5, '2011-06-07 00:00:00', 9, 230, 0, NULL);
INSERT INTO storage.base_operations VALUES (1198, 6, '2011-06-07 00:00:00', 375, 230, 0, NULL);


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

INSERT INTO storage.operations_complex VALUES (127, '2011-04-21', 37, 38, 141, 113, 13, 0);
INSERT INTO storage.operations_complex VALUES (87, '2011-04-19', 83, 30, 140, 70, 0, 0);
INSERT INTO storage.operations_complex VALUES (88, '2011-04-19', 83, 30, 141, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (89, '2011-04-19', 83, 30, 143, 97, 0, 0);
INSERT INTO storage.operations_complex VALUES (1245, '2011-07-05', 83, 30, 86, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (759, '2011-05-05', 12, 354, 186, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (90, '2011-04-19', 12, 146, 241, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (91, '2011-04-19', 12, 146, 246, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (92, '2011-04-19', 12, 146, 251, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (93, '2011-04-19', 12, 146, 280, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (94, '2011-04-19', 12, 146, 285, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (95, '2011-04-19', 12, 146, 290, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (96, '2011-04-19', 12, 146, 295, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (765, '2011-05-05', 12, 354, 205, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (98, '2011-04-19', 12, 146, 181, 32, 0, 0);
INSERT INTO storage.operations_complex VALUES (46, '2011-04-19', 83, 30, 140, 109, 0, 0);
INSERT INTO storage.operations_complex VALUES (47, '2011-04-19', 83, 30, 141, 21, 0, 0);
INSERT INTO storage.operations_complex VALUES (48, '2011-04-19', 83, 30, 143, 111, 0, 0);
INSERT INTO storage.operations_complex VALUES (99, '2011-04-19', 12, 146, 195, 32, 0, 0);
INSERT INTO storage.operations_complex VALUES (100, '2011-04-19', 12, 146, 176, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (101, '2011-04-19', 12, 146, 200, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (102, '2011-04-19', 12, 146, 236, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (128, '2011-04-21', 38, 62, 86, 425, 0, 0);
INSERT INTO storage.operations_complex VALUES (103, '2011-04-20', 35, 83, 140, 56, 0, 0);
INSERT INTO storage.operations_complex VALUES (104, '2011-04-20', 35, 83, 143, 152, 0, 0);
INSERT INTO storage.operations_complex VALUES (105, '2011-04-20', 35, 83, 142, 191, 0, 0);
INSERT INTO storage.operations_complex VALUES (106, '2011-04-20', 35, 83, 142, 153, 0, 0);
INSERT INTO storage.operations_complex VALUES (107, '2011-04-20', 83, 30, 140, 56, 0, 0);
INSERT INTO storage.operations_complex VALUES (108, '2011-04-20', 83, 30, 143, 152, 0, 0);
INSERT INTO storage.operations_complex VALUES (81, '2011-04-19', 38, 8, 87, 208, 2, 0);
INSERT INTO storage.operations_complex VALUES (129, '2011-04-21', 35, 83, 140, 80, 0, 0);
INSERT INTO storage.operations_complex VALUES (83, '2011-04-19', 35, 83, 143, 97, 0, 0);
INSERT INTO storage.operations_complex VALUES (84, '2011-04-19', 35, 83, 140, 70, 0, 0);
INSERT INTO storage.operations_complex VALUES (85, '2011-04-19', 35, 83, 142, 36, 0, 0);
INSERT INTO storage.operations_complex VALUES (86, '2011-04-19', 38, 33, 144, 2217, 0, 0);
INSERT INTO storage.operations_complex VALUES (130, '2011-04-21', 35, 83, 141, 22, 0, 0);
INSERT INTO storage.operations_complex VALUES (109, '2011-04-20', 38, 8, 86, 562, 2, 0);
INSERT INTO storage.operations_complex VALUES (110, '2011-04-20', 35, 83, 140, 89, 0, 0);
INSERT INTO storage.operations_complex VALUES (111, '2011-04-20', 35, 83, 140, 68, 0, 0);
INSERT INTO storage.operations_complex VALUES (112, '2011-04-20', 35, 83, 143, 119, 0, 0);
INSERT INTO storage.operations_complex VALUES (113, '2011-04-20', 35, 83, 143, 240, 0, 0);
INSERT INTO storage.operations_complex VALUES (114, '2011-04-20', 35, 83, 142, 170, 0, 0);
INSERT INTO storage.operations_complex VALUES (116, '2011-04-20', 83, 30, 140, 157, 0, 0);
INSERT INTO storage.operations_complex VALUES (117, '2011-04-20', 83, 30, 143, 359, 0, 0);
INSERT INTO storage.operations_complex VALUES (761, '2011-05-05', 12, 354, 217, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (119, '2011-04-20', 38, 8, 84, 251, 1, 0);
INSERT INTO storage.operations_complex VALUES (120, '2011-04-20', 38, 8, 85, 505, 5, 0);
INSERT INTO storage.operations_complex VALUES (771, '2011-05-05', 12, 356, 256, 5, 0, 0);
INSERT INTO storage.operations_complex VALUES (122, '2011-04-21', 35, 83, 140, 86, 0, 0);
INSERT INTO storage.operations_complex VALUES (123, '2011-04-21', 35, 83, 142, 197, 0, 0);
INSERT INTO storage.operations_complex VALUES (124, '2011-04-21', 35, 83, 143, 260, 0, 0);
INSERT INTO storage.operations_complex VALUES (125, '2011-04-21', 83, 30, 140, 86, 0, 0);
INSERT INTO storage.operations_complex VALUES (126, '2011-04-21', 83, 30, 143, 260, 0, 0);
INSERT INTO storage.operations_complex VALUES (131, '2011-04-21', 35, 83, 142, 174, 0, 0);
INSERT INTO storage.operations_complex VALUES (132, '2011-04-21', 35, 83, 143, 120, 0, 0);
INSERT INTO storage.operations_complex VALUES (134, '2011-04-22', 83, 30, 140, 80, 0, 0);
INSERT INTO storage.operations_complex VALUES (135, '2011-04-22', 83, 30, 141, 22, 0, 0);
INSERT INTO storage.operations_complex VALUES (136, '2011-04-22', 83, 30, 143, 120, 0, 0);
INSERT INTO storage.operations_complex VALUES (775, '2011-06-15', 12, 361, 233, 7, 0, 0);
INSERT INTO storage.operations_complex VALUES (779, '2011-06-27', 12, 360, 321, 5, 0, 0);
INSERT INTO storage.operations_complex VALUES (788, '2011-06-17', 12, 368, 176, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (794, '2011-06-17', 12, 368, 181, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (141, '2011-04-22', 38, 8, 85, 252, 2, 0);
INSERT INTO storage.operations_complex VALUES (142, '2011-04-22', 38, 8, 86, 701, 11, 0);
INSERT INTO storage.operations_complex VALUES (797, '2011-06-17', 12, 368, 195, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (144, '2011-04-22', 35, 83, 140, 66, 0, 0);
INSERT INTO storage.operations_complex VALUES (145, '2011-04-22', 35, 83, 141, 72, 0, 0);
INSERT INTO storage.operations_complex VALUES (146, '2011-04-22', 35, 83, 142, 177, 0, 0);
INSERT INTO storage.operations_complex VALUES (147, '2011-04-22', 35, 83, 143, 170, 0, 0);
INSERT INTO storage.operations_complex VALUES (149, '2011-04-22', 35, 83, 140, 116, 0, 0);
INSERT INTO storage.operations_complex VALUES (150, '2011-04-22', 35, 83, 142, 137, 0, 0);
INSERT INTO storage.operations_complex VALUES (151, '2011-04-22', 35, 83, 141, 60, 0, 0);
INSERT INTO storage.operations_complex VALUES (152, '2011-04-22', 35, 83, 143, 139, 0, 0);
INSERT INTO storage.operations_complex VALUES (154, '2011-04-22', 83, 30, 140, 182, 0, 0);
INSERT INTO storage.operations_complex VALUES (155, '2011-04-22', 83, 30, 141, 132, 0, 0);
INSERT INTO storage.operations_complex VALUES (157, '2011-04-22', 83, 30, 143, 309, 0, 0);
INSERT INTO storage.operations_complex VALUES (158, '2011-04-23', 30, 37, 143, 116, 4, 0);
INSERT INTO storage.operations_complex VALUES (162, '2011-04-23', 38, 8, 85, 310, 8, 0);
INSERT INTO storage.operations_complex VALUES (163, '2011-04-23', 38, 8, 86, 507, 7, 0);
INSERT INTO storage.operations_complex VALUES (165, '2011-04-23', 35, 83, 140, 55, 0, 0);
INSERT INTO storage.operations_complex VALUES (166, '2011-04-23', 35, 83, 141, 33, 0, 0);
INSERT INTO storage.operations_complex VALUES (167, '2011-04-23', 35, 83, 142, 99, 0, 0);
INSERT INTO storage.operations_complex VALUES (168, '2011-04-23', 35, 83, 143, 71, 0, 0);
INSERT INTO storage.operations_complex VALUES (169, '2011-04-23', 83, 30, 140, 55, 0, 0);
INSERT INTO storage.operations_complex VALUES (170, '2011-04-23', 83, 30, 141, 33, 0, 0);
INSERT INTO storage.operations_complex VALUES (171, '2011-04-23', 83, 30, 143, 71, 0, 0);
INSERT INTO storage.operations_complex VALUES (173, '2011-04-23', 30, 37, 143, 48, 2, 0);
INSERT INTO storage.operations_complex VALUES (174, '2011-04-24', 35, 83, 140, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (175, '2011-04-24', 35, 83, 141, 44, 0, 0);
INSERT INTO storage.operations_complex VALUES (176, '2011-04-24', 35, 83, 142, 245, 0, 0);
INSERT INTO storage.operations_complex VALUES (177, '2011-04-24', 35, 83, 143, 177, 0, 0);
INSERT INTO storage.operations_complex VALUES (180, '2011-04-25', 83, 30, 141, 123, 0, 0);
INSERT INTO storage.operations_complex VALUES (181, '2011-04-25', 83, 30, 143, 316, 0, 0);
INSERT INTO storage.operations_complex VALUES (182, '2011-04-25', 83, 30, 85, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (179, '2011-04-25', 83, 30, 140, 190, 0, 0);
INSERT INTO storage.operations_complex VALUES (1246, '2011-07-05', 83, 30, 87, 14, 0, 0);
INSERT INTO storage.operations_complex VALUES (183, '2011-04-25', 30, 37, 141, 54, 5, 0);
INSERT INTO storage.operations_complex VALUES (186, '2011-04-25', 38, 8, 84, 81, 6, 0);
INSERT INTO storage.operations_complex VALUES (187, '2011-04-25', 38, 8, 86, 1013, 13, 0);
INSERT INTO storage.operations_complex VALUES (189, '2011-04-25', 35, 83, 85, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (190, '2011-04-25', 35, 83, 140, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (191, '2011-04-25', 35, 83, 141, 4, 0, 0);
INSERT INTO storage.operations_complex VALUES (192, '2011-04-25', 83, 30, 140, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (194, '2011-04-25', 30, 37, 85, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (195, '2011-04-25', 30, 37, 143, 20, 5, 0);
INSERT INTO storage.operations_complex VALUES (196, '2011-04-25', 37, 61, 85, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (197, '2011-05-25', 61, 38, 85, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (198, '2011-04-25', 35, 83, 84, 108, 0, 0);
INSERT INTO storage.operations_complex VALUES (199, '2011-04-25', 35, 83, 85, 131, 0, 0);
INSERT INTO storage.operations_complex VALUES (200, '2011-04-25', 35, 83, 140, 12, 0, 0);
INSERT INTO storage.operations_complex VALUES (201, '2011-04-25', 35, 83, 141, 117, 0, 0);
INSERT INTO storage.operations_complex VALUES (203, '2011-05-03', 30, 38, 141, 161, 0, 0);
INSERT INTO storage.operations_complex VALUES (204, '2011-04-26', 62, 8, 141, 201, 1, 0);
INSERT INTO storage.operations_complex VALUES (286, '2011-04-24', 83, 30, 140, 58, 0, 0);
INSERT INTO storage.operations_complex VALUES (205, '2011-04-26', 35, 83, 84, 69, 0, 0);
INSERT INTO storage.operations_complex VALUES (206, '2011-04-26', 35, 83, 85, 174, 0, 0);
INSERT INTO storage.operations_complex VALUES (207, '2011-04-26', 35, 83, 140, 77, 0, 0);
INSERT INTO storage.operations_complex VALUES (208, '2011-04-26', 35, 83, 141, 138, 0, 0);
INSERT INTO storage.operations_complex VALUES (209, '2011-04-27', 38, 8, 141, 205, 5, 0);
INSERT INTO storage.operations_complex VALUES (210, '2011-04-27', 35, 83, 84, 11, 0, 0);
INSERT INTO storage.operations_complex VALUES (211, '2011-04-27', 35, 83, 85, 115, 0, 0);
INSERT INTO storage.operations_complex VALUES (212, '2011-04-27', 35, 83, 140, 31, 0, 0);
INSERT INTO storage.operations_complex VALUES (213, '2011-04-27', 35, 83, 141, 85, 0, 0);
INSERT INTO storage.operations_complex VALUES (214, '2011-04-27', 83, 30, 84, 178, 0, 0);
INSERT INTO storage.operations_complex VALUES (215, '2011-04-27', 83, 30, 85, 419, 0, 0);
INSERT INTO storage.operations_complex VALUES (216, '2011-04-27', 30, 37, 84, 178, 0, 0);
INSERT INTO storage.operations_complex VALUES (217, '2011-04-27', 30, 37, 85, 300, 0, 0);
INSERT INTO storage.operations_complex VALUES (218, '2011-04-27', 37, 61, 84, 178, 8, 0);
INSERT INTO storage.operations_complex VALUES (219, '2011-04-27', 37, 61, 85, 300, 5, 0);
INSERT INTO storage.operations_complex VALUES (220, '2011-04-28', 83, 30, 140, 120, 0, 0);
INSERT INTO storage.operations_complex VALUES (221, '2011-04-28', 83, 30, 141, 340, 0, 0);
INSERT INTO storage.operations_complex VALUES (222, '2011-04-28', 30, 37, 85, 119, 0, 0);
INSERT INTO storage.operations_complex VALUES (223, '2011-04-28', 37, 61, 85, 119, 0, 0);
INSERT INTO storage.operations_complex VALUES (224, '2011-04-28', 61, 38, 85, 119, 0, 0);
INSERT INTO storage.operations_complex VALUES (225, '2011-04-28', 38, 8, 84, 278, 8, 0);
INSERT INTO storage.operations_complex VALUES (226, '2011-04-28', 38, 8, 85, 414, 4, 0);
INSERT INTO storage.operations_complex VALUES (227, '2011-04-30', 83, 30, 142, 1080, 22, 0);
INSERT INTO storage.operations_complex VALUES (230, '2011-04-21', 8, 147, 85, 1000, 0, 0);
INSERT INTO storage.operations_complex VALUES (231, '2011-04-21', 8, 147, 87, 1000, 0, 0);
INSERT INTO storage.operations_complex VALUES (232, '2011-04-27', 8, 147, 143, 200, 0, 0);
INSERT INTO storage.operations_complex VALUES (233, '2011-04-27', 8, 147, 141, 200, 0, 0);
INSERT INTO storage.operations_complex VALUES (274, '2011-04-25', 61, 38, 85, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (257, '2011-04-25', 35, 83, 140, 64, 0, 0);
INSERT INTO storage.operations_complex VALUES (258, '2011-04-25', 35, 83, 141, 131, 0, 0);
INSERT INTO storage.operations_complex VALUES (259, '2011-04-26', 83, 30, 84, 108, 0, 0);
INSERT INTO storage.operations_complex VALUES (260, '2011-04-26', 83, 30, 85, 131, 0, 0);
INSERT INTO storage.operations_complex VALUES (261, '2011-04-26', 83, 30, 140, 64, 0, 0);
INSERT INTO storage.operations_complex VALUES (262, '2011-04-26', 83, 30, 141, 131, 0, 0);
INSERT INTO storage.operations_complex VALUES (263, '2011-04-26', 30, 37, 84, 108, 0, 0);
INSERT INTO storage.operations_complex VALUES (264, '2011-04-26', 30, 37, 85, 131, 0, 0);
INSERT INTO storage.operations_complex VALUES (265, '2011-04-26', 37, 61, 84, 108, 0, 0);
INSERT INTO storage.operations_complex VALUES (266, '2011-04-26', 37, 61, 85, 131, 0, 0);
INSERT INTO storage.operations_complex VALUES (267, '2011-04-26', 61, 38, 85, 131, 0, 0);
INSERT INTO storage.operations_complex VALUES (268, '2011-04-26', 38, 8, 85, 231, 0, 0);
INSERT INTO storage.operations_complex VALUES (269, '2011-04-26', 38, 62, 141, 40, 0, 0);
INSERT INTO storage.operations_complex VALUES (270, '2011-04-26', 35, 83, 84, 98, 0, 0);
INSERT INTO storage.operations_complex VALUES (271, '2011-04-26', 35, 83, 85, 130, 0, 0);
INSERT INTO storage.operations_complex VALUES (272, '2011-04-26', 38, 62, 141, 161, 0, 0);
INSERT INTO storage.operations_complex VALUES (275, '2011-04-24', 35, 83, 141, 79, 0, 0);
INSERT INTO storage.operations_complex VALUES (276, '2011-04-24', 35, 83, 142, 116, 0, 0);
INSERT INTO storage.operations_complex VALUES (277, '2011-04-24', 35, 83, 143, 139, 0, 0);
INSERT INTO storage.operations_complex VALUES (279, '2011-04-24', 35, 83, 141, 36, 0, 0);
INSERT INTO storage.operations_complex VALUES (280, '2011-04-24', 35, 83, 142, 74, 0, 0);
INSERT INTO storage.operations_complex VALUES (281, '2011-04-24', 35, 83, 143, 85, 0, 0);
INSERT INTO storage.operations_complex VALUES (282, '2011-04-24', 35, 83, 140, 90, 0, 0);
INSERT INTO storage.operations_complex VALUES (283, '2011-04-24', 35, 83, 140, 58, 0, 0);
INSERT INTO storage.operations_complex VALUES (284, '2011-04-24', 83, 30, 141, 36, 0, 0);
INSERT INTO storage.operations_complex VALUES (285, '2011-04-24', 83, 30, 143, 85, 0, 0);
INSERT INTO storage.operations_complex VALUES (287, '2011-04-24', 30, 37, 141, 34, 6, 0);
INSERT INTO storage.operations_complex VALUES (288, '2011-04-24', 30, 37, 143, 43, 2, 0);
INSERT INTO storage.operations_complex VALUES (289, '2011-04-24', 38, 62, 84, 81, 0, 0);
INSERT INTO storage.operations_complex VALUES (290, '2011-04-24', 38, 62, 86, 588, 0, 0);
INSERT INTO storage.operations_complex VALUES (291, '2011-05-01', 83, 30, 142, 900, 9, 0);
INSERT INTO storage.operations_complex VALUES (292, '2011-05-02', 83, 30, 142, 905, 10, 0);
INSERT INTO storage.operations_complex VALUES (293, '2011-05-03', 83, 30, 142, 395, 5, 0);
INSERT INTO storage.operations_complex VALUES (294, '2011-05-10', 30, 37, 140, 98, 2, 0);
INSERT INTO storage.operations_complex VALUES (295, '2011-05-11', 30, 37, 140, 88, 0, 0);
INSERT INTO storage.operations_complex VALUES (296, '2011-05-11', 30, 37, 142, 55, 0, 0);
INSERT INTO storage.operations_complex VALUES (297, '2011-05-11', 37, 38, 140, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (298, '2011-05-11', 37, 38, 142, 55, 0, 0);
INSERT INTO storage.operations_complex VALUES (299, '2011-05-11', 38, 62, 140, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (300, '2011-05-11', 38, 62, 142, 55, 0, 0);
INSERT INTO storage.operations_complex VALUES (301, '2011-05-11', 62, 8, 140, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (302, '2011-05-11', 62, 8, 142, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (304, '2011-05-11', 30, 37, 140, 140, 0, 0);
INSERT INTO storage.operations_complex VALUES (1244, '2011-07-05', 83, 30, 84, 57, 0, 0);
INSERT INTO storage.operations_complex VALUES (353, '2011-05-14', 83, 30, 84, 167, 0, 0);
INSERT INTO storage.operations_complex VALUES (306, '2011-05-11', 37, 38, 140, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (307, '2011-05-12', 35, 83, 84, 101, 0, 0);
INSERT INTO storage.operations_complex VALUES (308, '2011-05-12', 35, 83, 85, 119, 0, 0);
INSERT INTO storage.operations_complex VALUES (309, '2011-05-12', 35, 83, 141, 67, 0, 0);
INSERT INTO storage.operations_complex VALUES (310, '2011-05-12', 35, 83, 84, 101, 0, 0);
INSERT INTO storage.operations_complex VALUES (311, '2011-05-12', 35, 83, 85, 66, 0, 0);
INSERT INTO storage.operations_complex VALUES (312, '2011-05-12', 35, 83, 141, 90, 0, 0);
INSERT INTO storage.operations_complex VALUES (313, '2011-05-12', 30, 37, 140, 152, 0, 0);
INSERT INTO storage.operations_complex VALUES (314, '2011-05-12', 30, 37, 140, 150, 0, 0);
INSERT INTO storage.operations_complex VALUES (315, '2011-05-12', 37, 38, 140, 80, 0, 0);
INSERT INTO storage.operations_complex VALUES (316, '2011-05-12', 37, 38, 140, 60, 0, 0);
INSERT INTO storage.operations_complex VALUES (317, '2011-05-12', 38, 62, 140, 230, 0, 0);
INSERT INTO storage.operations_complex VALUES (318, '2011-05-12', 38, 62, 140, 60, 0, 0);
INSERT INTO storage.operations_complex VALUES (319, '2011-05-12', 62, 8, 140, 230, 0, 0);
INSERT INTO storage.operations_complex VALUES (320, '2011-05-12', 62, 8, 140, 60, 0, 0);
INSERT INTO storage.operations_complex VALUES (321, '2011-05-13', 35, 83, 84, 58, 0, 0);
INSERT INTO storage.operations_complex VALUES (322, '2011-05-13', 35, 83, 85, 89, 0, 0);
INSERT INTO storage.operations_complex VALUES (323, '2011-05-13', 35, 83, 141, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (324, '2011-05-13', 35, 83, 84, 109, 0, 0);
INSERT INTO storage.operations_complex VALUES (325, '2011-05-13', 35, 83, 85, 90, 0, 0);
INSERT INTO storage.operations_complex VALUES (326, '2011-05-13', 35, 83, 141, 87, 0, 0);
INSERT INTO storage.operations_complex VALUES (327, '2011-05-13', 83, 30, 84, 202, 0, 0);
INSERT INTO storage.operations_complex VALUES (328, '2011-05-13', 83, 30, 85, 184, 1, 0);
INSERT INTO storage.operations_complex VALUES (329, '2011-05-13', 83, 30, 141, 156, 1, 0);
INSERT INTO storage.operations_complex VALUES (331, '2011-05-13', 30, 37, 84, 102, 0, 0);
INSERT INTO storage.operations_complex VALUES (332, '2011-05-13', 30, 37, 85, 184, 0, 0);
INSERT INTO storage.operations_complex VALUES (333, '2011-05-13', 30, 37, 84, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (334, '2011-05-13', 37, 61, 84, 202, 0, 0);
INSERT INTO storage.operations_complex VALUES (335, '2011-05-13', 37, 61, 85, 184, 0, 0);
INSERT INTO storage.operations_complex VALUES (337, '2011-05-13', 61, 38, 85, 184, 0, 0);
INSERT INTO storage.operations_complex VALUES (338, '2011-05-13', 61, 38, 84, 202, 0, 0);
INSERT INTO storage.operations_complex VALUES (339, '2011-05-13', 38, 62, 85, 184, 9, 0);
INSERT INTO storage.operations_complex VALUES (340, '2011-05-13', 62, 8, 85, 175, 0, 0);
INSERT INTO storage.operations_complex VALUES (341, '2011-05-14', 35, 83, 84, 140, 0, 0);
INSERT INTO storage.operations_complex VALUES (342, '2011-05-14', 35, 83, 85, 154, 0, 0);
INSERT INTO storage.operations_complex VALUES (343, '2011-05-14', 35, 83, 141, 90, 0, 0);
INSERT INTO storage.operations_complex VALUES (344, '2011-05-14', 35, 83, 84, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (345, '2011-05-14', 35, 83, 85, 64, 0, 0);
INSERT INTO storage.operations_complex VALUES (346, '2011-05-14', 35, 83, 141, 76, 0, 0);
INSERT INTO storage.operations_complex VALUES (348, '2011-05-14', 83, 30, 85, 177, 2, 0);
INSERT INTO storage.operations_complex VALUES (349, '2011-05-14', 83, 30, 141, 186, 1, 0);
INSERT INTO storage.operations_complex VALUES (350, '2011-05-14', 83, 30, 84, 140, 0, 0);
INSERT INTO storage.operations_complex VALUES (351, '2011-05-14', 83, 30, 85, 154, 0, 0);
INSERT INTO storage.operations_complex VALUES (352, '2011-05-14', 83, 30, 141, 90, 0, 0);
INSERT INTO storage.operations_complex VALUES (354, '2011-05-14', 30, 37, 84, 167, 0, 0);
INSERT INTO storage.operations_complex VALUES (355, '2011-05-14', 30, 37, 85, 177, 0, 0);
INSERT INTO storage.operations_complex VALUES (356, '2011-05-14', 30, 37, 84, 140, 0, 0);
INSERT INTO storage.operations_complex VALUES (357, '2011-05-14', 30, 37, 85, 154, 0, 0);
INSERT INTO storage.operations_complex VALUES (358, '2011-05-14', 30, 37, 140, 60, 0, 0);
INSERT INTO storage.operations_complex VALUES (359, '2011-05-14', 37, 61, 84, 167, 0, 0);
INSERT INTO storage.operations_complex VALUES (360, '2011-05-14', 37, 61, 85, 177, 0, 0);
INSERT INTO storage.operations_complex VALUES (361, '2011-05-14', 37, 61, 84, 140, 0, 0);
INSERT INTO storage.operations_complex VALUES (362, '2011-05-14', 37, 38, 85, 154, 0, 0);
INSERT INTO storage.operations_complex VALUES (372, '2011-05-15', 35, 83, 84, 150, 0, 0);
INSERT INTO storage.operations_complex VALUES (373, '2011-05-15', 35, 83, 85, 116, 0, 0);
INSERT INTO storage.operations_complex VALUES (374, '2011-05-15', 35, 83, 141, 139, 0, 0);
INSERT INTO storage.operations_complex VALUES (363, '2011-05-14', 37, 61, 85, 154, 0, 0);
INSERT INTO storage.operations_complex VALUES (364, '2011-05-14', 61, 38, 84, 167, 0, 0);
INSERT INTO storage.operations_complex VALUES (365, '2011-05-14', 61, 38, 85, 177, 0, 0);
INSERT INTO storage.operations_complex VALUES (366, '2011-05-14', 61, 38, 84, 140, 0, 0);
INSERT INTO storage.operations_complex VALUES (367, '2011-05-14', 61, 38, 85, 154, 0, 0);
INSERT INTO storage.operations_complex VALUES (368, '2011-05-14', 38, 62, 84, 250, 0, 0);
INSERT INTO storage.operations_complex VALUES (369, '2011-05-14', 62, 8, 84, 250, 0, 0);
INSERT INTO storage.operations_complex VALUES (370, '2011-05-15', 35, 83, 84, 165, 0, 0);
INSERT INTO storage.operations_complex VALUES (371, '2011-05-15', 35, 83, 85, 138, 0, 0);
INSERT INTO storage.operations_complex VALUES (375, '2011-05-15', 35, 83, 141, 148, 0, 0);
INSERT INTO storage.operations_complex VALUES (376, '2011-05-15', 83, 30, 84, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (377, '2011-05-15', 83, 30, 85, 116, 0, 0);
INSERT INTO storage.operations_complex VALUES (378, '2011-05-15', 83, 30, 141, 76, 0, 0);
INSERT INTO storage.operations_complex VALUES (379, '2011-05-15', 30, 37, 84, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (380, '2011-05-15', 30, 37, 85, 64, 0, 0);
INSERT INTO storage.operations_complex VALUES (381, '2011-05-15', 37, 61, 84, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (382, '2011-05-15', 37, 61, 85, 64, 0, 0);
INSERT INTO storage.operations_complex VALUES (383, '2011-05-15', 61, 38, 84, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (384, '2011-05-15', 61, 38, 85, 64, 0, 0);
INSERT INTO storage.operations_complex VALUES (385, '2011-05-15', 38, 62, 84, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (386, '2011-05-15', 62, 8, 84, 250, 0, 0);
INSERT INTO storage.operations_complex VALUES (387, '2011-05-16', 35, 83, 84, 214, 0, 0);
INSERT INTO storage.operations_complex VALUES (388, '2011-05-16', 35, 83, 85, 149, 0, 0);
INSERT INTO storage.operations_complex VALUES (389, '2011-05-16', 35, 83, 141, 170, 0, 0);
INSERT INTO storage.operations_complex VALUES (390, '2011-05-16', 35, 83, 84, 151, 0, 0);
INSERT INTO storage.operations_complex VALUES (391, '2011-05-16', 35, 83, 85, 95, 0, 0);
INSERT INTO storage.operations_complex VALUES (392, '2011-05-16', 35, 83, 141, 66, 0, 0);
INSERT INTO storage.operations_complex VALUES (393, '2011-05-16', 83, 30, 84, 315, 0, 0);
INSERT INTO storage.operations_complex VALUES (394, '2011-05-16', 83, 30, 85, 254, 0, 0);
INSERT INTO storage.operations_complex VALUES (395, '2011-05-16', 83, 30, 141, 139, 0, 0);
INSERT INTO storage.operations_complex VALUES (396, '2011-05-16', 83, 30, 84, 214, 0, 0);
INSERT INTO storage.operations_complex VALUES (397, '2011-05-16', 83, 30, 141, 318, 0, 0);
INSERT INTO storage.operations_complex VALUES (398, '2011-05-16', 30, 37, 84, 315, 0, 0);
INSERT INTO storage.operations_complex VALUES (762, '2011-05-05', 12, 354, 280, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (766, '2011-05-05', 12, 354, 285, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (399, '2011-05-16', 37, 61, 84, 315, 2, 0);
INSERT INTO storage.operations_complex VALUES (402, '2011-05-16', 30, 61, 85, 254, 0, 0);
INSERT INTO storage.operations_complex VALUES (403, '2011-05-16', 30, 61, 84, 214, 0, 0);
INSERT INTO storage.operations_complex VALUES (1247, '2011-07-05', 30, 61, 84, 57, 0, 0);
INSERT INTO storage.operations_complex VALUES (404, '2011-05-16', 61, 38, 84, 313, 0, 0);
INSERT INTO storage.operations_complex VALUES (405, '2011-05-16', 61, 38, 85, 254, 0, 0);
INSERT INTO storage.operations_complex VALUES (406, '2011-05-16', 83, 33, 144, 846, 0, 0);
INSERT INTO storage.operations_complex VALUES (407, '2011-05-16', 83, 33, 144, 941, 0, 0);
INSERT INTO storage.operations_complex VALUES (408, '2011-05-16', 83, 33, 144, 888, 0, 0);
INSERT INTO storage.operations_complex VALUES (409, '2011-05-17', 83, 30, 84, 151, 0, 0);
INSERT INTO storage.operations_complex VALUES (410, '2011-05-17', 83, 30, 85, 242, 2, 0);
INSERT INTO storage.operations_complex VALUES (411, '2011-05-17', 83, 30, 141, 66, 0, 0);
INSERT INTO storage.operations_complex VALUES (412, '2011-05-17', 30, 37, 84, 365, 0, 0);
INSERT INTO storage.operations_complex VALUES (413, '2011-05-17', 30, 37, 140, 120, 0, 0);
INSERT INTO storage.operations_complex VALUES (414, '2011-05-17', 37, 61, 84, 151, 0, 0);
INSERT INTO storage.operations_complex VALUES (415, '2011-05-17', 37, 61, 85, 239, 3, 0);
INSERT INTO storage.operations_complex VALUES (416, '2011-05-17', 61, 38, 84, 367, 0, 0);
INSERT INTO storage.operations_complex VALUES (417, '2011-05-17', 38, 62, 84, 789, 2, 0);
INSERT INTO storage.operations_complex VALUES (418, '2011-05-17', 62, 8, 84, 787, 0, 0);
INSERT INTO storage.operations_complex VALUES (419, '2011-05-17', 61, 37, 85, 493, 0, 0);
INSERT INTO storage.operations_complex VALUES (420, '2011-05-17', 37, 38, 85, 254, 0, 0);
INSERT INTO storage.operations_complex VALUES (421, '2011-05-20', 30, 37, 141, 50, 1, 0);
INSERT INTO storage.operations_complex VALUES (422, '2011-05-20', 30, 37, 141, 90, 0, 0);
INSERT INTO storage.operations_complex VALUES (423, '2011-05-20', 37, 38, 85, 498, 5, 0);
INSERT INTO storage.operations_complex VALUES (424, '2011-05-20', 37, 38, 140, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (425, '2011-05-20', 37, 38, 141, 10, 0, 0);
INSERT INTO storage.operations_complex VALUES (426, '2011-05-20', 38, 62, 85, 493, 0, 0);
INSERT INTO storage.operations_complex VALUES (427, '2011-05-20', 38, 62, 140, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (428, '2011-05-20', 38, 62, 141, 10, 0, 0);
INSERT INTO storage.operations_complex VALUES (429, '2011-05-20', 62, 8, 85, 493, 0, 0);
INSERT INTO storage.operations_complex VALUES (430, '2011-05-20', 62, 8, 140, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (431, '2011-05-20', 62, 8, 141, 10, 0, 0);
INSERT INTO storage.operations_complex VALUES (432, '2011-05-21', 30, 37, 141, 80, 0, 0);
INSERT INTO storage.operations_complex VALUES (433, '2011-05-21', 30, 37, 141, 121, 1, 0);
INSERT INTO storage.operations_complex VALUES (434, '2011-05-21', 37, 38, 140, 154, 9, 0);
INSERT INTO storage.operations_complex VALUES (435, '2011-05-21', 37, 38, 141, 10, 0, 0);
INSERT INTO storage.operations_complex VALUES (436, '2011-05-21', 37, 62, 141, 120, 0, 0);
INSERT INTO storage.operations_complex VALUES (437, '2011-05-21', 62, 38, 141, 20, 0, 0);
INSERT INTO storage.operations_complex VALUES (438, '2011-05-21', 38, 8, 141, 20, 0, 0);
INSERT INTO storage.operations_complex VALUES (439, '2011-05-22', 30, 37, 141, 60, 0, 0);
INSERT INTO storage.operations_complex VALUES (440, '2011-05-22', 30, 37, 143, 73, 2, 0);
INSERT INTO storage.operations_complex VALUES (441, '2011-05-22', 37, 38, 141, 73, 2, 0);
INSERT INTO storage.operations_complex VALUES (442, '2011-05-22', 38, 62, 141, 71, 0, 0);
INSERT INTO storage.operations_complex VALUES (443, '2011-05-22', 62, 8, 141, 71, 0, 0);
INSERT INTO storage.operations_complex VALUES (444, '2011-06-01', 35, 83, 174, 126, 0, 0);
INSERT INTO storage.operations_complex VALUES (445, '2011-06-01', 35, 83, 175, 154, 0, 0);
INSERT INTO storage.operations_complex VALUES (446, '2011-06-01', 83, 30, 174, 264, 0, 0);
INSERT INTO storage.operations_complex VALUES (447, '2011-06-01', 83, 30, 175, 304, 0, 0);
INSERT INTO storage.operations_complex VALUES (448, '2011-05-26', 35, 83, 174, 94, 0, 0);
INSERT INTO storage.operations_complex VALUES (449, '2011-05-26', 35, 83, 175, 169, 0, 0);
INSERT INTO storage.operations_complex VALUES (450, '2011-05-26', 83, 30, 174, 94, 2, 0);
INSERT INTO storage.operations_complex VALUES (451, '2011-05-26', 83, 30, 175, 169, 3, 0);
INSERT INTO storage.operations_complex VALUES (452, '2011-05-26', 30, 37, 174, 92, 1, 0);
INSERT INTO storage.operations_complex VALUES (453, '2011-05-26', 30, 37, 175, 166, 1, 0);
INSERT INTO storage.operations_complex VALUES (454, '2011-05-26', 37, 38, 174, 91, 0, 0);
INSERT INTO storage.operations_complex VALUES (455, '2011-05-26', 37, 38, 175, 165, 0, 0);
INSERT INTO storage.operations_complex VALUES (456, '2011-05-26', 38, 62, 174, 91, 6, 0);
INSERT INTO storage.operations_complex VALUES (768, '2011-05-05', 12, 356, 262, 5, 0, 0);
INSERT INTO storage.operations_complex VALUES (772, '2011-06-17', 12, 362, 274, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (776, '2011-06-27', 12, 360, 318, 5, 0, 0);
INSERT INTO storage.operations_complex VALUES (460, '2011-05-28', 37, 38, 141, 61, 0, 0);
INSERT INTO storage.operations_complex VALUES (461, '2011-05-28', 38, 62, 141, 61, 0, 0);
INSERT INTO storage.operations_complex VALUES (462, '2011-05-28', 62, 8, 141, 61, 0, 0);
INSERT INTO storage.operations_complex VALUES (780, '2011-06-27', 12, 360, 285, 5, 0, 0);
INSERT INTO storage.operations_complex VALUES (464, '2011-05-29', 37, 38, 141, 70, 0, 0);
INSERT INTO storage.operations_complex VALUES (465, '2011-05-29', 38, 62, 141, 70, 0, 0);
INSERT INTO storage.operations_complex VALUES (467, '2011-05-29', 62, 8, 141, 70, 0, 0);
INSERT INTO storage.operations_complex VALUES (469, '2011-05-30', 37, 38, 141, 65, 0, 0);
INSERT INTO storage.operations_complex VALUES (470, '2011-05-30', 38, 62, 141, 65, 0, 0);
INSERT INTO storage.operations_complex VALUES (472, '2011-05-30', 62, 8, 141, 65, 0, 0);
INSERT INTO storage.operations_complex VALUES (473, '2011-06-02', 35, 83, 174, 144, 0, 0);
INSERT INTO storage.operations_complex VALUES (474, '2011-06-02', 35, 83, 175, 149, 0, 0);
INSERT INTO storage.operations_complex VALUES (475, '2011-06-02', 83, 30, 174, 144, 0, 0);
INSERT INTO storage.operations_complex VALUES (476, '2011-06-02', 83, 30, 175, 149, 0, 0);
INSERT INTO storage.operations_complex VALUES (478, '2011-06-02', 30, 37, 175, 130, 0, 0);
INSERT INTO storage.operations_complex VALUES (793, '2011-06-17', 12, 368, 230, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (480, '2011-06-02', 37, 38, 175, 130, 0, 0);
INSERT INTO storage.operations_complex VALUES (481, '2011-06-01', 30, 37, 174, 264, 0, 0);
INSERT INTO storage.operations_complex VALUES (482, '2011-06-01', 30, 37, 175, 20, 0, 0);
INSERT INTO storage.operations_complex VALUES (483, '2011-06-01', 37, 38, 174, 264, 0, 0);
INSERT INTO storage.operations_complex VALUES (485, '2011-06-01', 38, 62, 174, 264, 0, 0);
INSERT INTO storage.operations_complex VALUES (487, '2011-06-01', 30, 61, 174, 264, 0, 0);
INSERT INTO storage.operations_complex VALUES (489, '2011-05-31', 35, 83, 84, 12, 0, 0);
INSERT INTO storage.operations_complex VALUES (490, '2011-05-31', 35, 83, 174, 89, 0, 0);
INSERT INTO storage.operations_complex VALUES (491, '2011-05-31', 35, 83, 175, 187, 0, 0);
INSERT INTO storage.operations_complex VALUES (492, '2011-05-31', 83, 30, 174, 89, 0, 0);
INSERT INTO storage.operations_complex VALUES (493, '2011-05-31', 83, 30, 175, 187, 0, 0);
INSERT INTO storage.operations_complex VALUES (495, '2011-05-31', 30, 61, 174, 89, 0, 0);
INSERT INTO storage.operations_complex VALUES (496, '2011-05-31', 30, 37, 175, 187, 0, 0);
INSERT INTO storage.operations_complex VALUES (499, '2011-05-31', 37, 38, 175, 187, 0, 0);
INSERT INTO storage.operations_complex VALUES (498, '2011-05-31', 37, 38, 174, 89, 0, 0);
INSERT INTO storage.operations_complex VALUES (763, '2011-05-05', 12, 354, 290, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (501, '2011-05-31', 38, 62, 174, 89, 8, 0);
INSERT INTO storage.operations_complex VALUES (767, '2011-05-05', 12, 354, NULL, 0, 0, 0);
INSERT INTO storage.operations_complex VALUES (1248, '2011-07-05', 30, 61, 86, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (769, '2011-05-05', 12, 356, 268, 5, 0, 0);
INSERT INTO storage.operations_complex VALUES (503, '2011-05-31', 37, 38, 143, 60, 0, 0);
INSERT INTO storage.operations_complex VALUES (504, '2011-05-31', 38, 62, 143, 60, 0, 0);
INSERT INTO storage.operations_complex VALUES (506, '2011-05-31', 62, 8, 143, 60, 0, 0);
INSERT INTO storage.operations_complex VALUES (507, '2011-06-02', 35, 83, 174, 138, 0, 0);
INSERT INTO storage.operations_complex VALUES (508, '2011-06-02', 35, 83, 175, 171, 0, 0);
INSERT INTO storage.operations_complex VALUES (509, '2011-06-02', 83, 30, 174, 138, 0, 0);
INSERT INTO storage.operations_complex VALUES (510, '2011-06-02', 83, 30, 175, 171, 0, 0);
INSERT INTO storage.operations_complex VALUES (777, '2011-06-27', 12, 360, 280, 5, 0, 0);
INSERT INTO storage.operations_complex VALUES (514, '2011-06-02', 30, 37, 175, 450, 0, 0);
INSERT INTO storage.operations_complex VALUES (515, '2011-06-02', 37, 38, 175, 450, 0, 0);
INSERT INTO storage.operations_complex VALUES (783, '2011-06-17', 12, 368, 112, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (784, '2011-06-17', 12, 368, 114, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (785, '2011-06-17', 12, 368, 115, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (781, '2011-06-17', 12, 368, 241, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (520, '2011-06-03', 35, 83, 174, 165, 0, 0);
INSERT INTO storage.operations_complex VALUES (521, '2011-06-03', 35, 83, 175, 192, 0, 0);
INSERT INTO storage.operations_complex VALUES (786, '2011-06-17', 12, 368, 246, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (523, '2011-06-03', 83, 30, 174, 165, 0, 0);
INSERT INTO storage.operations_complex VALUES (524, '2011-06-03', 83, 30, 175, 192, 0, 0);
INSERT INTO storage.operations_complex VALUES (782, '2011-06-17', 12, 368, 321, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (787, '2011-06-17', 12, 368, 318, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (791, '2011-06-17', 12, 368, 174, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (554, '2011-06-04', 35, 83, 174, 147, 0, 0);
INSERT INTO storage.operations_complex VALUES (528, '2011-06-03', 30, 37, 175, 420, 0, 0);
INSERT INTO storage.operations_complex VALUES (529, '2011-06-03', 37, 38, 175, 420, 0, 0);
INSERT INTO storage.operations_complex VALUES (530, '2011-06-03', 30, 37, 142, 140, 0, 0);
INSERT INTO storage.operations_complex VALUES (795, '2011-06-17', 12, 368, 175, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (798, '2011-06-17', 12, 368, 347, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (790, '2011-06-17', 12, 368, 200, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (536, '2011-06-03', 35, 83, 174, 176, 0, 0);
INSERT INTO storage.operations_complex VALUES (537, '2011-06-03', 35, 83, 175, 178, 0, 0);
INSERT INTO storage.operations_complex VALUES (538, '2011-06-03', 83, 30, 174, 176, 0, 0);
INSERT INTO storage.operations_complex VALUES (539, '2011-06-03', 83, 30, 175, 178, 0, 0);
INSERT INTO storage.operations_complex VALUES (540, '2011-06-03', 30, 61, 174, 425, 0, 0);
INSERT INTO storage.operations_complex VALUES (541, '2011-06-03', 61, 37, 174, 425, 0, 0);
INSERT INTO storage.operations_complex VALUES (543, '2011-06-03', 37, 38, 174, 425, 0, 0);
INSERT INTO storage.operations_complex VALUES (544, '2011-06-03', 38, 62, 174, 425, 25, 0);
INSERT INTO storage.operations_complex VALUES (546, '2011-06-03', 37, 38, 142, 61, 0, 0);
INSERT INTO storage.operations_complex VALUES (547, '2011-06-03', 37, 38, 143, 12, 0, 0);
INSERT INTO storage.operations_complex VALUES (549, '2011-06-03', 38, 62, 142, 61, 0, 0);
INSERT INTO storage.operations_complex VALUES (550, '2011-06-03', 38, 62, 143, 12, 0, 0);
INSERT INTO storage.operations_complex VALUES (551, '2011-06-03', 62, 8, 142, 61, 0, 0);
INSERT INTO storage.operations_complex VALUES (555, '2011-06-04', 35, 83, 175, 158, 0, 0);
INSERT INTO storage.operations_complex VALUES (556, '2011-06-04', 83, 30, 174, 147, 0, 0);
INSERT INTO storage.operations_complex VALUES (557, '2011-06-04', 83, 30, 175, 158, 0, 0);
INSERT INTO storage.operations_complex VALUES (559, '2011-06-04', 30, 37, 174, 343, 0, 0);
INSERT INTO storage.operations_complex VALUES (560, '2011-06-04', 30, 37, 175, 77, 0, 0);
INSERT INTO storage.operations_complex VALUES (561, '2011-06-04', 37, 38, 174, 343, 0, 0);
INSERT INTO storage.operations_complex VALUES (562, '2011-06-04', 37, 38, 175, 77, 0, 0);
INSERT INTO storage.operations_complex VALUES (563, '2011-06-04', 30, 37, 142, 220, 0, 0);
INSERT INTO storage.operations_complex VALUES (612, '2011-06-07', 30, 61, 175, 323, 0, 0);
INSERT INTO storage.operations_complex VALUES (564, '2011-06-04', 37, 38, 142, 10, 0, 0);
INSERT INTO storage.operations_complex VALUES (801, '2011-05-05', 12, 369, 186, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (803, '2011-05-05', 12, 369, 205, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (568, '2011-06-04', 35, 83, 174, 191, 0, 0);
INSERT INTO storage.operations_complex VALUES (569, '2011-06-04', 35, 83, 175, 188, 0, 0);
INSERT INTO storage.operations_complex VALUES (570, '2011-06-04', 83, 30, 174, 190, 1, 0);
INSERT INTO storage.operations_complex VALUES (571, '2011-06-04', 83, 30, 175, 187, 1, 0);
INSERT INTO storage.operations_complex VALUES (572, '2011-06-04', 30, 37, 175, 400, 0, 0);
INSERT INTO storage.operations_complex VALUES (574, '2011-06-04', 37, 38, 175, 400, 0, 0);
INSERT INTO storage.operations_complex VALUES (575, '2011-06-04', 38, 62, 175, 400, 0, 0);
INSERT INTO storage.operations_complex VALUES (576, '2011-06-04', 61, 37, 175, 400, 0, 0);
INSERT INTO storage.operations_complex VALUES (577, '2011-06-04', 30, 61, 175, 400, 0, 0);
INSERT INTO storage.operations_complex VALUES (808, '2011-06-29', 12, 356, 176, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (579, '2011-06-04', 37, 38, 142, 58, 0, 0);
INSERT INTO storage.operations_complex VALUES (810, '2011-06-29', 12, 356, 181, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (581, '2011-06-04', 38, 62, 142, 58, 0, 0);
INSERT INTO storage.operations_complex VALUES (582, '2011-06-04', 62, 8, 142, 58, 0, 0);
INSERT INTO storage.operations_complex VALUES (583, '2011-06-05', 35, 83, 174, 386, 0, 0);
INSERT INTO storage.operations_complex VALUES (584, '2011-06-05', 35, 83, 175, 329, 0, 0);
INSERT INTO storage.operations_complex VALUES (812, '2011-06-29', 12, 356, 195, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (586, '2011-06-05', 83, 30, 174, 386, 0, 0);
INSERT INTO storage.operations_complex VALUES (587, '2011-06-05', 83, 30, 175, 329, 0, 0);
INSERT INTO storage.operations_complex VALUES (814, '2011-06-29', 12, 356, 200, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (816, '2011-06-29', 12, 356, 280, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (592, '2011-06-05', 37, 38, 142, 54, 0, 0);
INSERT INTO storage.operations_complex VALUES (598, '2011-06-05', 38, 62, 142, 54, 0, 0);
INSERT INTO storage.operations_complex VALUES (599, '2011-06-05', 62, 8, 142, 54, 0, 0);
INSERT INTO storage.operations_complex VALUES (601, '2011-06-06', 35, 83, 174, 212, 0, 0);
INSERT INTO storage.operations_complex VALUES (602, '2011-06-06', 35, 83, 175, 154, 0, 0);
INSERT INTO storage.operations_complex VALUES (604, '2011-06-06', 83, 30, 174, 212, 2, 0);
INSERT INTO storage.operations_complex VALUES (605, '2011-06-06', 83, 30, 175, 154, 2, 0);
INSERT INTO storage.operations_complex VALUES (607, '2011-06-06', 30, 61, 175, 533, 8, 0);
INSERT INTO storage.operations_complex VALUES (610, '2011-06-06', 37, 38, 142, 25, 0, 0);
INSERT INTO storage.operations_complex VALUES (611, '2011-06-06', 30, 37, 143, 125, 0, 0);
INSERT INTO storage.operations_complex VALUES (613, '2011-06-07', 30, 37, 143, 97, 0, 0);
INSERT INTO storage.operations_complex VALUES (615, '2011-06-07', 61, 37, 174, 275, 0, 0);
INSERT INTO storage.operations_complex VALUES (616, '2011-06-07', 61, 37, 175, 323, 0, 0);
INSERT INTO storage.operations_complex VALUES (1249, '2011-07-05', 30, 61, 87, 14, 0, 0);
INSERT INTO storage.operations_complex VALUES (619, '2011-06-07', 37, 38, 142, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (620, '2011-06-07', 37, 38, 143, 15, 0, 0);
INSERT INTO storage.operations_complex VALUES (623, '2011-06-08', 30, 61, 175, 590, 0, 0);
INSERT INTO storage.operations_complex VALUES (629, '2011-06-08', 61, 37, 174, 516, 0, 0);
INSERT INTO storage.operations_complex VALUES (630, '2011-06-09', 38, 62, 175, 569, 29, 0);
INSERT INTO storage.operations_complex VALUES (694, '2011-06-18', 61, 62, 174, 650, 0, 0);
INSERT INTO storage.operations_complex VALUES (632, '2011-06-09', 62, 8, 175, 540, 0, 0);
INSERT INTO storage.operations_complex VALUES (684, '2011-06-03', 62, 8, 174, 400, 0, 0);
INSERT INTO storage.operations_complex VALUES (695, '2011-06-18', 62, 8, 174, 650, 0, 0);
INSERT INTO storage.operations_complex VALUES (633, '2011-06-09', 30, 61, 175, 260, 0, 0);
INSERT INTO storage.operations_complex VALUES (634, '2011-06-09', 61, 62, 175, 260, 10, 0);
INSERT INTO storage.operations_complex VALUES (663, '2011-06-18', 30, 61, 174, 650, 0, 0);
INSERT INTO storage.operations_complex VALUES (696, '2011-06-19', 61, 38, 174, 307, 0, 0);
INSERT INTO storage.operations_complex VALUES (635, '2011-06-09', 37, 38, 143, 43, 0, 0);
INSERT INTO storage.operations_complex VALUES (697, '2011-06-19', 38, 62, 174, 484, 34, 0);
INSERT INTO storage.operations_complex VALUES (638, '2011-06-10', 30, 61, 175, 466, 0, 0);
INSERT INTO storage.operations_complex VALUES (640, '2011-06-10', 61, 62, 175, 466, 28, 0);
INSERT INTO storage.operations_complex VALUES (641, '2011-06-10', 62, 8, 175, 438, 0, 0);
INSERT INTO storage.operations_complex VALUES (642, '2011-06-10', 30, 37, 141, 200, 0, 0);
INSERT INTO storage.operations_complex VALUES (643, '2011-06-10', 37, 38, 143, 42, 0, 0);
INSERT INTO storage.operations_complex VALUES (707, '2011-04-28', 147, 12, 88, 627, 0, 0);
INSERT INTO storage.operations_complex VALUES (644, '2011-06-11', 30, 37, 143, 151, 0, 0);
INSERT INTO storage.operations_complex VALUES (645, '2011-06-11', 37, 38, 143, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (646, '2011-06-13', 30, 37, 143, 150, 0, 0);
INSERT INTO storage.operations_complex VALUES (647, '2011-06-13', 37, 38, 143, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (648, '2011-06-14', 30, 37, 143, 175, 0, 0);
INSERT INTO storage.operations_complex VALUES (649, '2011-06-14', 37, 38, 143, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (650, '2011-06-14', 37, 38, 143, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (651, '2011-06-15', 30, 37, 141, 142, 8, 0);
INSERT INTO storage.operations_complex VALUES (652, '2011-06-15', 37, 38, 143, 60, 0, 0);
INSERT INTO storage.operations_complex VALUES (653, '2011-06-15', 30, 37, 141, 180, 0, 0);
INSERT INTO storage.operations_complex VALUES (654, '2011-06-15', 37, 38, 143, 60, 0, 0);
INSERT INTO storage.operations_complex VALUES (655, '2011-06-16', 30, 37, 141, 194, 6, 0);
INSERT INTO storage.operations_complex VALUES (656, '2011-06-16', 30, 37, 141, 140, 1, 0);
INSERT INTO storage.operations_complex VALUES (657, '2011-06-16', 37, 38, 143, 65, 0, 0);
INSERT INTO storage.operations_complex VALUES (658, '2011-06-16', 37, 38, 140, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (659, '2011-06-17', 37, 38, 140, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (660, '2011-06-17', 30, 37, 143, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (685, '2011-06-03', 62, 8, 143, 12, 0, 0);
INSERT INTO storage.operations_complex VALUES (661, '2011-06-17', 37, 38, 140, 70, 0, 0);
INSERT INTO storage.operations_complex VALUES (662, '2011-06-17', 30, 37, 141, 44, 0, 0);
INSERT INTO storage.operations_complex VALUES (686, '2011-06-03', 61, 37, 142, 140, 0, 0);
INSERT INTO storage.operations_complex VALUES (664, '2011-06-18', 37, 38, 140, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (708, '2011-04-28', 147, 12, 89, 1413, 0, 0);
INSERT INTO storage.operations_complex VALUES (665, '2011-06-18', 30, 37, 143, 149, 7, 0);
INSERT INTO storage.operations_complex VALUES (666, '2011-06-18', 37, 38, 140, 42, 0, 0);
INSERT INTO storage.operations_complex VALUES (709, '2011-04-28', 147, 12, 90, 1420, 0, 0);
INSERT INTO storage.operations_complex VALUES (667, '2011-06-18', 30, 37, 141, 125, 0, 0);
INSERT INTO storage.operations_complex VALUES (687, '2011-06-03', 38, 62, 175, 444, 14, 0);
INSERT INTO storage.operations_complex VALUES (668, '2011-06-18', 37, 38, 141, 15, 0, 0);
INSERT INTO storage.operations_complex VALUES (669, '2011-06-19', 30, 61, 174, 484, 5, 0);
INSERT INTO storage.operations_complex VALUES (688, '2011-06-03', 62, 8, 175, 430, 0, 0);
INSERT INTO storage.operations_complex VALUES (670, '2011-06-19', 30, 37, 141, 200, 4, 0);
INSERT INTO storage.operations_complex VALUES (671, '2011-06-19', 37, 38, 141, 60, 0, 0);
INSERT INTO storage.operations_complex VALUES (710, '2011-04-28', 147, 12, 91, 682, 0, 0);
INSERT INTO storage.operations_complex VALUES (672, '2011-06-20', 37, 38, 141, 36, 0, 0);
INSERT INTO storage.operations_complex VALUES (711, '2011-04-28', 147, 12, 228, 1000, 0, 0);
INSERT INTO storage.operations_complex VALUES (712, '2011-04-28', 147, 12, 351, 1000, 0, 0);
INSERT INTO storage.operations_complex VALUES (713, '2011-04-28', 147, 12, 95, 373, 0, 0);
INSERT INTO storage.operations_complex VALUES (676, '2011-06-20', 30, 37, 141, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (677, '2011-06-20', 37, 38, 141, 73, 0, 0);
INSERT INTO storage.operations_complex VALUES (678, '2011-06-20', 37, 38, 174, 484, 8, 0);
INSERT INTO storage.operations_complex VALUES (714, '2011-04-28', 147, 12, 99, 337, 0, 0);
INSERT INTO storage.operations_complex VALUES (679, '2011-06-20', 30, 37, 140, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (680, '2011-06-20', 30, 37, 141, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (681, '2011-06-01', 62, 8, 174, 264, 0, 0);
INSERT INTO storage.operations_complex VALUES (682, '2011-06-01', 37, 38, 143, 58, 0, 0);
INSERT INTO storage.operations_complex VALUES (690, '2011-06-01', 61, 37, 174, 264, 0, 0);
INSERT INTO storage.operations_complex VALUES (691, '2011-06-04', 62, 8, 175, 400, 0, 0);
INSERT INTO storage.operations_complex VALUES (698, '2011-05-26', 62, 8, 174, 85, 0, 0);
INSERT INTO storage.operations_complex VALUES (699, '2011-05-31', 61, 37, 174, 89, 0, 0);
INSERT INTO storage.operations_complex VALUES (692, '2011-06-07', 37, 38, 175, 323, 0, 0);
INSERT INTO storage.operations_complex VALUES (693, '2011-06-09', 62, 8, 175, 250, 0, 0);
INSERT INTO storage.operations_complex VALUES (700, '2011-05-31', 62, 8, 174, 81, 0, 0);
INSERT INTO storage.operations_complex VALUES (701, '2011-06-01', 35, 83, 174, 138, 0, 0);
INSERT INTO storage.operations_complex VALUES (702, '2011-06-01', 35, 83, 175, 150, 0, 0);
INSERT INTO storage.operations_complex VALUES (703, '2011-05-18', 8, 353, 84, 1000, 0, 0);
INSERT INTO storage.operations_complex VALUES (704, '2011-05-18', 8, 353, 85, 1000, 0, 0);
INSERT INTO storage.operations_complex VALUES (705, '2011-05-18', 8, 353, 86, 1000, 0, 0);
INSERT INTO storage.operations_complex VALUES (706, '2011-05-18', 8, 353, 87, 1000, 0, 0);
INSERT INTO storage.operations_complex VALUES (715, '2011-04-28', 147, 12, 97, 330, 0, 0);
INSERT INTO storage.operations_complex VALUES (716, '2011-04-28', 147, 12, 98, 318, 0, 0);
INSERT INTO storage.operations_complex VALUES (717, '2011-05-10', 147, 12, 88, 75, 0, 0);
INSERT INTO storage.operations_complex VALUES (718, '2011-05-10', 147, 12, 89, 127, 0, 0);
INSERT INTO storage.operations_complex VALUES (719, '2011-05-10', 147, 12, 90, 126, 0, 0);
INSERT INTO storage.operations_complex VALUES (720, '2011-05-10', 147, 12, 91, 234, 0, 0);
INSERT INTO storage.operations_complex VALUES (721, '2011-05-10', 147, 12, 330, 140, 0, 0);
INSERT INTO storage.operations_complex VALUES (723, '2011-05-11', 8, 147, 85, 500, 0, 0);
INSERT INTO storage.operations_complex VALUES (724, '2011-05-11', 8, 147, 86, 1500, 0, 0);
INSERT INTO storage.operations_complex VALUES (725, '2011-05-11', 8, 147, 142, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (726, '2011-05-11', 8, 147, 140, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (727, '2011-05-11', 8, 147, NULL, 0, 0, 0);
INSERT INTO storage.operations_complex VALUES (722, '2011-05-11', 8, 147, 84, 1200, 0, 0);
INSERT INTO storage.operations_complex VALUES (1250, '2011-07-05', 61, 37, 84, 57, 0, 0);
INSERT INTO storage.operations_complex VALUES (1251, '2011-07-05', 61, 37, 86, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (728, '2011-05-10', 147, 12, 120, 140, 0, 0);
INSERT INTO storage.operations_complex VALUES (729, '2011-04-19', 12, 355, 186, 32, 0, 0);
INSERT INTO storage.operations_complex VALUES (730, '2011-04-19', 12, 355, 205, 32, 0, 0);
INSERT INTO storage.operations_complex VALUES (731, '2011-04-19', 12, 355, 210, 32, 0, 0);
INSERT INTO storage.operations_complex VALUES (732, '2011-04-19', 12, 355, 217, 32, 0, 0);
INSERT INTO storage.operations_complex VALUES (733, '2011-04-19', 12, 355, 176, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (734, '2011-04-19', 12, 355, 181, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (735, '2011-04-19', 12, 355, 195, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (736, '2011-04-19', 12, 355, 200, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (737, '2011-04-19', 12, 355, 236, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (738, '2011-04-19', 12, 355, 241, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (739, '2011-04-19', 12, 355, 246, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (740, '2011-04-19', 12, 355, 251, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (741, '2011-04-19', 12, 355, 113, 32, 0, 0);
INSERT INTO storage.operations_complex VALUES (742, '2011-04-19', 12, 355, 114, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (743, '2011-04-19', 12, 355, 115, 20, 0, 0);
INSERT INTO storage.operations_complex VALUES (744, '2011-04-19', 12, 355, 116, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (1252, '2011-07-05', 61, 37, 87, 14, 0, 0);
INSERT INTO storage.operations_complex VALUES (1253, '2011-07-05', 37, 38, 86, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (1254, '2011-07-05', 37, 38, 87, 156, 0, 0);
INSERT INTO storage.operations_complex VALUES (1255, '2011-07-05', 35, 83, 84, 92, 0, 0);
INSERT INTO storage.operations_complex VALUES (1256, '2011-07-05', 35, 83, 87, 166, 0, 0);
INSERT INTO storage.operations_complex VALUES (1257, '2011-07-05', 83, 30, 84, 92, 0, 0);
INSERT INTO storage.operations_complex VALUES (1258, '2011-07-05', 83, 30, 87, 166, 0, 0);
INSERT INTO storage.operations_complex VALUES (1259, '2011-07-05', 30, 61, 84, 92, 0, 0);
INSERT INTO storage.operations_complex VALUES (1261, '2011-07-05', 30, 61, 87, 166, 0, 0);
INSERT INTO storage.operations_complex VALUES (1262, '2011-07-05', 61, 37, 84, 92, 0, 0);
INSERT INTO storage.operations_complex VALUES (1263, '2011-07-05', 61, 37, 87, 166, 0, 0);
INSERT INTO storage.operations_complex VALUES (1264, '2011-07-05', 37, 38, 84, 92, 0, 0);
INSERT INTO storage.operations_complex VALUES (745, '2011-05-18', 12, 359, 181, 250, 0, 0);
INSERT INTO storage.operations_complex VALUES (746, '2011-05-18', 12, 359, 195, 250, 0, 0);
INSERT INTO storage.operations_complex VALUES (747, '2011-05-18', 12, 359, 200, 250, 0, 0);
INSERT INTO storage.operations_complex VALUES (748, '2011-05-18', 12, 359, NULL, 0, 0, 0);
INSERT INTO storage.operations_complex VALUES (749, '2011-05-05', 12, 358, 186, 30, 0, 0);
INSERT INTO storage.operations_complex VALUES (750, '2011-05-05', 12, 358, 205, 40, 0, 0);
INSERT INTO storage.operations_complex VALUES (751, '2011-05-05', 12, 358, 210, 40, 0, 0);
INSERT INTO storage.operations_complex VALUES (752, '2011-05-05', 12, 358, 217, 30, 0, 0);
INSERT INTO storage.operations_complex VALUES (753, '2011-05-05', 12, 358, 280, 40, 0, 0);
INSERT INTO storage.operations_complex VALUES (754, '2011-05-05', 12, 358, 285, 40, 0, 0);
INSERT INTO storage.operations_complex VALUES (755, '2011-05-05', 12, 358, 290, 32, 0, 0);
INSERT INTO storage.operations_complex VALUES (756, '2011-05-05', 12, 358, 295, 32, 0, 0);
INSERT INTO storage.operations_complex VALUES (764, '2011-05-05', 12, 354, 295, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (760, '2011-05-05', 12, 354, 210, 30, 0, 0);
INSERT INTO storage.operations_complex VALUES (770, '2011-05-05', 12, 356, 274, 5, 0, 0);
INSERT INTO storage.operations_complex VALUES (774, '2011-06-15', 12, 361, 274, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (778, '2011-06-27', 12, 360, 290, 5, 0, 0);
INSERT INTO storage.operations_complex VALUES (789, '2011-06-17', 12, 368, 205, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (792, '2011-06-17', 12, 368, 262, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (796, '2011-06-17', 12, 368, 256, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (799, '2011-06-17', 12, 368, 274, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (800, '2011-05-05', 12, 369, 210, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (802, '2011-05-05', 12, 369, 217, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (806, '2011-06-29', 12, 356, 285, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (805, '2011-06-29', 12, 356, 290, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (807, '2011-06-29', 12, 356, 333, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (804, '2011-06-29', 12, 356, 347, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (809, '2011-06-29', 12, 356, 318, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (811, '2011-06-29', 12, 356, 324, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (813, '2011-06-29', 12, 356, 321, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (815, '2011-06-29', 12, 356, 327, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (823, '2011-05-20', 12, 146, 195, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (821, '2011-05-20', 12, 146, 280, 56, 0, 0);
INSERT INTO storage.operations_complex VALUES (824, '2011-05-20', 12, 146, 285, 48, 0, 0);
INSERT INTO storage.operations_complex VALUES (820, '2011-05-20', 12, 146, 295, 32, 0, 0);
INSERT INTO storage.operations_complex VALUES (826, '2011-06-03', 12, 368, 262, 3, 0, 0);
INSERT INTO storage.operations_complex VALUES (828, '2011-06-03', 12, 368, 268, 3, 0, 0);
INSERT INTO storage.operations_complex VALUES (829, '2011-06-03', 12, 368, 347, 3, 0, 0);
INSERT INTO storage.operations_complex VALUES (830, '2011-06-03', 12, 368, 230, 3, 0, 0);
INSERT INTO storage.operations_complex VALUES (831, '2011-06-09', 12, 371, 186, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (832, '2011-06-09', 12, 371, 217, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (833, '2011-06-09', 12, 371, 347, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (834, '2011-04-20', 12, 374, 176, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (835, '2011-04-20', 12, 374, 181, 32, 0, 0);
INSERT INTO storage.operations_complex VALUES (836, '2011-04-20', 12, 374, 195, 32, 0, 0);
INSERT INTO storage.operations_complex VALUES (837, '2011-04-20', 12, 374, 200, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (838, '2011-04-20', 12, 374, 236, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (839, '2011-04-20', 12, 374, 241, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (840, '2011-04-20', 12, 374, 246, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (841, '2011-04-20', 12, 374, 251, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (842, '2011-04-20', 12, 374, 280, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (843, '2011-04-20', 12, 374, 285, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (844, '2011-04-20', 12, 374, 290, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (845, '2011-04-20', 12, 374, 295, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (859, '2011-05-20', 12, 146, 233, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (860, '2011-05-20', 12, 146, 321, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (861, '2011-05-20', 12, 146, 333, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (862, '2011-05-20', 12, 146, 347, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (863, '2011-05-20', 12, 146, 318, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (825, '2011-05-20', 12, 146, 176, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (822, '2011-05-20', 12, 146, 181, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (819, '2011-05-20', 12, 146, 290, 48, 0, 0);
INSERT INTO storage.operations_complex VALUES (1265, '2011-07-05', 37, 38, 87, 166, 0, 0);
INSERT INTO storage.operations_complex VALUES (864, '2011-05-24', 12, 359, 333, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (865, '2011-05-24', 12, 359, 186, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (866, '2011-05-24', 12, 359, 181, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (867, '2011-05-24', 12, 359, 262, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (868, '2011-05-24', 12, 359, 210, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (869, '2011-05-24', 12, 359, 195, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (870, '2011-05-24', 12, 359, 192, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (871, '2011-05-24', 12, 359, 233, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (872, '2011-05-24', 12, 359, 230, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1266, '2011-07-05', 38, 62, 84, 149, 0, 0);
INSERT INTO storage.operations_complex VALUES (1267, '2011-07-05', 38, 62, 87, 322, 0, 0);
INSERT INTO storage.operations_complex VALUES (1268, '2011-07-05', 62, 8, 84, 149, 0, 0);
INSERT INTO storage.operations_complex VALUES (1269, '2011-07-05', 62, 8, 87, 322, 0, 0);
INSERT INTO storage.operations_complex VALUES (1270, '2011-07-06', 35, 83, 84, 63, 0, 0);
INSERT INTO storage.operations_complex VALUES (1271, '2011-07-06', 35, 83, 87, 196, 0, 0);
INSERT INTO storage.operations_complex VALUES (1272, '2011-07-06', 83, 30, 84, 63, 0, 0);
INSERT INTO storage.operations_complex VALUES (1273, '2011-07-06', 83, 30, 87, 196, 0, 0);
INSERT INTO storage.operations_complex VALUES (1274, '2011-07-06', 30, 61, 84, 63, 1, 0);
INSERT INTO storage.operations_complex VALUES (1275, '2011-07-06', 30, 61, 87, 196, 0, 0);
INSERT INTO storage.operations_complex VALUES (1291, '2011-08-01', 35, 83, NULL, 0, 0, 0);
INSERT INTO storage.operations_complex VALUES (1276, '2011-07-06', 61, 37, 84, 62, 0, 0);
INSERT INTO storage.operations_complex VALUES (1277, '2011-07-06', 61, 37, 87, 196, 0, 0);
INSERT INTO storage.operations_complex VALUES (1278, '2011-07-06', 37, 38, 87, 196, 0, 0);
INSERT INTO storage.operations_complex VALUES (1280, '2011-07-06', 35, 83, 84, 72, 0, 0);
INSERT INTO storage.operations_complex VALUES (1281, '2011-07-06', 35, 83, 87, 161, 0, 0);
INSERT INTO storage.operations_complex VALUES (1282, '2011-07-06', 83, 30, 84, 72, 0, 0);
INSERT INTO storage.operations_complex VALUES (1283, '2011-07-06', 83, 30, 87, 161, 1, 0);
INSERT INTO storage.operations_complex VALUES (1284, '2011-07-06', 30, 61, 84, 72, 0, 0);
INSERT INTO storage.operations_complex VALUES (1285, '2011-07-06', 30, 61, 87, 160, 0, 0);
INSERT INTO storage.operations_complex VALUES (1286, '2011-07-06', 61, 37, 84, 72, 0, 0);
INSERT INTO storage.operations_complex VALUES (1287, '2011-07-06', 61, 37, 87, 160, 0, 0);
INSERT INTO storage.operations_complex VALUES (1288, '2011-07-06', 37, 38, 87, 160, 0, 0);
INSERT INTO storage.operations_complex VALUES (1289, '2011-07-06', 38, 62, 87, 356, 0, 0);
INSERT INTO storage.operations_complex VALUES (1290, '2011-07-06', 62, 8, 87, 356, 0, 0);
INSERT INTO storage.operations_complex VALUES (1292, '2011-08-01', 35, 83, 381, 92, 0, 0);
INSERT INTO storage.operations_complex VALUES (1293, '2011-08-01', 83, 30, 381, 92, 1, 0);
INSERT INTO storage.operations_complex VALUES (1294, '2011-08-01', 30, 61, 381, 91, 0, 0);
INSERT INTO storage.operations_complex VALUES (1295, '2011-08-01', 61, 37, 381, 91, 0, 0);
INSERT INTO storage.operations_complex VALUES (1296, '2011-08-01', 37, 38, 381, 91, 0, 0);
INSERT INTO storage.operations_complex VALUES (1297, '2011-08-02', 35, 83, 381, 131, 0, 0);
INSERT INTO storage.operations_complex VALUES (1298, '2011-08-02', 83, 30, 381, 131, 0, 0);
INSERT INTO storage.operations_complex VALUES (1299, '2011-08-02', 30, 61, 381, 131, 0, 0);
INSERT INTO storage.operations_complex VALUES (1300, '2011-08-02', 61, 37, 381, 131, 0, 0);
INSERT INTO storage.operations_complex VALUES (1301, '2011-08-02', 37, 38, 381, 131, 0, 0);
INSERT INTO storage.operations_complex VALUES (1302, '2011-08-02', 35, 83, 381, 63, 0, 0);
INSERT INTO storage.operations_complex VALUES (909, '2011-06-22', 12, 371, 186, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (910, '2011-06-22', 12, 371, 217, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (911, '2011-06-22', 12, 371, 181, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (912, '2011-06-22', 12, 371, 210, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (913, '2011-06-09', 12, 356, 256, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (914, '2011-06-09', 12, 356, 262, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (915, '2011-06-09', 12, 356, 268, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (916, '2011-06-30', 12, 371, 233, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (917, '2011-06-30', 12, 371, 241, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (918, '2011-06-30', 12, 371, 274, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (919, '2011-06-30', 12, 371, 268, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (920, '2011-06-10', 12, 372, 205, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (921, '2011-06-10', 12, 372, 210, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (922, '2011-06-10', 12, 372, 230, 18, 0, 0);
INSERT INTO storage.operations_complex VALUES (923, '2011-06-10', 12, 372, 262, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (924, '2011-06-10', 12, 372, 274, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (938, '2011-06-21', 37, 38, 140, 51, 0, 0);
INSERT INTO storage.operations_complex VALUES (939, '2011-06-21', 37, 38, 141, 25, 0, 0);
INSERT INTO storage.operations_complex VALUES (931, '2011-06-09', 8, 147, 87, 1500, 0, 0);
INSERT INTO storage.operations_complex VALUES (932, '2011-06-09', 8, 147, 174, 500, 0, 0);
INSERT INTO storage.operations_complex VALUES (933, '2011-06-09', 8, 147, 175, 500, 0, 0);
INSERT INTO storage.operations_complex VALUES (934, '2011-06-09', 8, 147, 140, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (940, '2011-06-22', 38, 62, 140, 51, 0, 0);
INSERT INTO storage.operations_complex VALUES (936, '2011-06-21', 62, 8, 140, 142, 0, 0);
INSERT INTO storage.operations_complex VALUES (941, '2011-06-22', 62, 8, 140, 51, 0, 0);
INSERT INTO storage.operations_complex VALUES (942, '2011-06-22', 37, 38, 141, 60, 0, 0);
INSERT INTO storage.operations_complex VALUES (943, '2011-06-22', 38, 62, 141, 85, 5, 0);
INSERT INTO storage.operations_complex VALUES (944, '2011-06-22', 62, 8, 141, 80, 0, 0);
INSERT INTO storage.operations_complex VALUES (945, '2011-06-22', 37, 38, 140, 140, 0, 0);
INSERT INTO storage.operations_complex VALUES (947, '2011-06-23', 38, 62, 140, 140, 0, 0);
INSERT INTO storage.operations_complex VALUES (948, '2011-06-23', 62, 8, 140, 140, 0, 0);
INSERT INTO storage.operations_complex VALUES (950, '2011-06-24', 37, 38, 141, 40, 0, 0);
INSERT INTO storage.operations_complex VALUES (949, '2011-06-23', 37, 38, 143, 195, 0, 0);
INSERT INTO storage.operations_complex VALUES (951, '2011-06-24', 38, 62, 141, 40, 0, 0);
INSERT INTO storage.operations_complex VALUES (952, '2011-06-24', 62, 8, 141, 40, 0, 0);
INSERT INTO storage.operations_complex VALUES (953, '2011-06-24', 37, 38, 141, 77, 0, 0);
INSERT INTO storage.operations_complex VALUES (954, '2011-06-24', 37, 38, 143, 34, 0, 0);
INSERT INTO storage.operations_complex VALUES (955, '2011-06-24', 38, 62, 143, 229, 8, 0);
INSERT INTO storage.operations_complex VALUES (956, '2011-06-24', 62, 8, 143, 221, 0, 0);
INSERT INTO storage.operations_complex VALUES (957, '2011-06-25', 38, 62, 141, 77, 2, 0);
INSERT INTO storage.operations_complex VALUES (958, '2011-06-25', 62, 8, 141, 75, 0, 0);
INSERT INTO storage.operations_complex VALUES (959, '2011-06-25', 37, 38, 142, 86, 0, 0);
INSERT INTO storage.operations_complex VALUES (960, '2011-06-26', 38, 62, 142, 86, 1, 0);
INSERT INTO storage.operations_complex VALUES (961, '2011-06-26', 62, 8, 142, 85, 0, 0);
INSERT INTO storage.operations_complex VALUES (962, '2011-06-27', 37, 38, 140, 44, 0, 0);
INSERT INTO storage.operations_complex VALUES (963, '2011-06-27', 38, 62, 140, 44, 0, 0);
INSERT INTO storage.operations_complex VALUES (964, '2011-06-27', 62, 8, 140, 44, 0, 0);
INSERT INTO storage.operations_complex VALUES (965, '2011-06-27', 30, 37, 140, 160, 0, 0);
INSERT INTO storage.operations_complex VALUES (966, '2011-06-27', 37, 38, 140, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (967, '2011-06-28', 37, 38, 140, 116, 0, 0);
INSERT INTO storage.operations_complex VALUES (968, '2011-06-28', 38, 62, 140, 116, 5, 0);
INSERT INTO storage.operations_complex VALUES (969, '2011-06-28', 62, 8, 140, 111, 0, 0);
INSERT INTO storage.operations_complex VALUES (970, '2011-06-28', 30, 37, 140, 15, 0, 0);
INSERT INTO storage.operations_complex VALUES (971, '2011-06-28', 37, 38, 140, 70, 0, 0);
INSERT INTO storage.operations_complex VALUES (972, '2011-06-29', 38, 62, 140, 70, 0, 0);
INSERT INTO storage.operations_complex VALUES (973, '2011-06-29', 62, 8, 140, 70, 0, 0);
INSERT INTO storage.operations_complex VALUES (974, '2011-06-30', 37, 38, 140, 25, 0, 0);
INSERT INTO storage.operations_complex VALUES (975, '2011-06-30', 37, 38, 141, 10, 0, 0);
INSERT INTO storage.operations_complex VALUES (976, '2011-06-30', 35, 83, 87, 92, 0, 0);
INSERT INTO storage.operations_complex VALUES (977, '2011-06-30', 83, 30, 87, 92, 1, 0);
INSERT INTO storage.operations_complex VALUES (978, '2011-06-30', 30, 61, 87, 91, 0, 0);
INSERT INTO storage.operations_complex VALUES (979, '2011-06-30', 61, 37, 87, 91, 0, 0);
INSERT INTO storage.operations_complex VALUES (980, '2011-06-30', 37, 38, 87, 91, 0, 0);
INSERT INTO storage.operations_complex VALUES (981, '2011-07-01', 35, 83, 86, 38, 0, 0);
INSERT INTO storage.operations_complex VALUES (982, '2011-07-01', 83, 30, 86, 38, 0, 0);
INSERT INTO storage.operations_complex VALUES (983, '2011-07-01', 30, 61, 86, 38, 0, 0);
INSERT INTO storage.operations_complex VALUES (984, '2011-07-01', 61, 37, 86, 38, 1, 0);
INSERT INTO storage.operations_complex VALUES (1005, '2011-07-01', 37, 38, 87, 63, 0, 0);
INSERT INTO storage.operations_complex VALUES (985, '2011-07-01', 37, 38, 86, 37, 0, 0);
INSERT INTO storage.operations_complex VALUES (986, '2011-07-01', 35, 83, 87, 131, 0, 0);
INSERT INTO storage.operations_complex VALUES (987, '2011-07-01', 83, 30, 87, 131, 0, 0);
INSERT INTO storage.operations_complex VALUES (988, '2011-07-01', 30, 61, 87, 131, 0, 0);
INSERT INTO storage.operations_complex VALUES (989, '2011-07-01', 61, 37, 87, 131, 0, 0);
INSERT INTO storage.operations_complex VALUES (990, '2011-07-01', 37, 38, 87, 131, 0, 0);
INSERT INTO storage.operations_complex VALUES (991, '2011-07-01', 35, 83, 84, 94, 0, 0);
INSERT INTO storage.operations_complex VALUES (992, '2011-07-01', 83, 30, 84, 94, 0, 0);
INSERT INTO storage.operations_complex VALUES (993, '2011-07-01', 30, 61, 84, 94, 0, 0);
INSERT INTO storage.operations_complex VALUES (994, '2011-07-01', 61, 37, 84, 94, 0, 0);
INSERT INTO storage.operations_complex VALUES (995, '2011-07-01', 37, 38, 84, 94, 0, 0);
INSERT INTO storage.operations_complex VALUES (996, '2011-07-01', 35, 83, 86, 56, 0, 0);
INSERT INTO storage.operations_complex VALUES (997, '2011-07-01', 83, 30, 86, 56, 1, 0);
INSERT INTO storage.operations_complex VALUES (1006, '2011-07-01', 38, 62, 87, 285, 0, 0);
INSERT INTO storage.operations_complex VALUES (998, '2011-07-01', 30, 61, 86, 55, 1, 0);
INSERT INTO storage.operations_complex VALUES (999, '2011-07-01', 61, 37, 86, 54, 0, 0);
INSERT INTO storage.operations_complex VALUES (1000, '2011-07-01', 37, 38, 86, 54, 0, 0);
INSERT INTO storage.operations_complex VALUES (1001, '2011-07-01', 35, 83, 87, 63, 0, 0);
INSERT INTO storage.operations_complex VALUES (1002, '2011-07-01', 83, 30, 87, 63, 0, 0);
INSERT INTO storage.operations_complex VALUES (1003, '2011-07-01', 30, 61, 87, 63, 0, 0);
INSERT INTO storage.operations_complex VALUES (1004, '2011-07-01', 61, 37, 87, 63, 0, 0);
INSERT INTO storage.operations_complex VALUES (1007, '2011-07-01', 62, 8, 87, 285, 0, 0);
INSERT INTO storage.operations_complex VALUES (1008, '2011-07-02', 35, 83, 84, 118, 0, 0);
INSERT INTO storage.operations_complex VALUES (1009, '2011-07-02', 83, 30, 84, 118, 0, 0);
INSERT INTO storage.operations_complex VALUES (1011, '2011-07-02', 30, 61, 84, 118, 0, 0);
INSERT INTO storage.operations_complex VALUES (1012, '2011-07-02', 61, 37, 84, 118, 0, 0);
INSERT INTO storage.operations_complex VALUES (1013, '2011-07-02', 37, 38, 84, 118, 0, 0);
INSERT INTO storage.operations_complex VALUES (1014, '2011-07-02', 35, 83, 86, 90, 0, 0);
INSERT INTO storage.operations_complex VALUES (1015, '2011-07-02', 83, 30, 86, 90, 0, 0);
INSERT INTO storage.operations_complex VALUES (1016, '2011-07-02', 30, 61, 86, 90, 0, 0);
INSERT INTO storage.operations_complex VALUES (1017, '2011-07-02', 61, 37, 86, 90, 0, 0);
INSERT INTO storage.operations_complex VALUES (1018, '2011-07-02', 37, 38, 86, 90, 0, 0);
INSERT INTO storage.operations_complex VALUES (1019, '2011-07-02', 35, 83, 87, 82, 0, 0);
INSERT INTO storage.operations_complex VALUES (1020, '2011-07-02', 83, 30, 87, 82, 0, 0);
INSERT INTO storage.operations_complex VALUES (1021, '2011-07-02', 30, 61, 87, 82, 0, 0);
INSERT INTO storage.operations_complex VALUES (1022, '2011-07-02', 61, 37, 87, 82, 0, 0);
INSERT INTO storage.operations_complex VALUES (1023, '2011-07-02', 37, 38, 87, 82, 0, 0);
INSERT INTO storage.operations_complex VALUES (1024, '2011-07-02', 35, 83, 84, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (1025, '2011-07-02', 83, 30, 84, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (1026, '2011-07-02', 30, 61, 84, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (1027, '2011-07-02', 61, 37, 84, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (1028, '2011-07-02', 37, 38, 84, 50, 0, 0);
INSERT INTO storage.operations_complex VALUES (1029, '2011-07-02', 38, 62, 84, 212, 0, 0);
INSERT INTO storage.operations_complex VALUES (1030, '2011-07-02', 62, 8, 84, 212, 0, 0);
INSERT INTO storage.operations_complex VALUES (1031, '2011-07-02', 35, 83, 86, 49, 0, 0);
INSERT INTO storage.operations_complex VALUES (1032, '2011-07-02', 83, 30, 86, 49, 0, 0);
INSERT INTO storage.operations_complex VALUES (1033, '2011-07-02', 30, 61, 86, 49, 0, 0);
INSERT INTO storage.operations_complex VALUES (1034, '2011-07-02', 61, 37, 86, 49, 0, 0);
INSERT INTO storage.operations_complex VALUES (1035, '2011-07-02', 37, 38, 86, 49, 0, 0);
INSERT INTO storage.operations_complex VALUES (1036, '2011-07-02', 35, 83, 87, 41, 0, 0);
INSERT INTO storage.operations_complex VALUES (1037, '2011-07-02', 83, 30, 87, 41, 0, 0);
INSERT INTO storage.operations_complex VALUES (1038, '2011-07-02', 30, 61, 87, 41, 0, 0);
INSERT INTO storage.operations_complex VALUES (1039, '2011-07-02', 61, 37, 87, 41, 0, 0);
INSERT INTO storage.operations_complex VALUES (1040, '2011-07-02', 37, 38, 87, 41, 0, 0);
INSERT INTO storage.operations_complex VALUES (1041, '2011-07-03', 35, 83, 84, 35, 0, 0);
INSERT INTO storage.operations_complex VALUES (1042, '2011-07-03', 35, 83, 86, 7, 0, 0);
INSERT INTO storage.operations_complex VALUES (1043, '2011-07-03', 35, 83, 87, 19, 0, 0);
INSERT INTO storage.operations_complex VALUES (1044, '2011-07-04', 83, 30, 84, 35, 0, 0);
INSERT INTO storage.operations_complex VALUES (1045, '2011-07-04', 83, 30, 86, 7, 0, 0);
INSERT INTO storage.operations_complex VALUES (1046, '2011-07-04', 83, 30, 87, 19, 0, 0);
INSERT INTO storage.operations_complex VALUES (1047, '2011-07-04', 30, 61, 84, 35, 0, 0);
INSERT INTO storage.operations_complex VALUES (1048, '2011-07-04', 30, 61, 86, 7, 1, 0);
INSERT INTO storage.operations_complex VALUES (1049, '2011-07-04', 30, 61, 87, 19, 0, 0);
INSERT INTO storage.operations_complex VALUES (1050, '2011-07-04', 61, 37, 84, 35, 0, 0);
INSERT INTO storage.operations_complex VALUES (1051, '2011-07-04', 61, 37, 86, 6, 0, 0);
INSERT INTO storage.operations_complex VALUES (1052, '2011-07-04', 61, 37, 87, 19, 0, 0);
INSERT INTO storage.operations_complex VALUES (1053, '2011-07-04', 37, 38, 84, 35, 0, 0);
INSERT INTO storage.operations_complex VALUES (1054, '2011-07-04', 37, 38, 86, 6, 0, 0);
INSERT INTO storage.operations_complex VALUES (1055, '2011-07-04', 37, 38, 87, 19, 0, 0);
INSERT INTO storage.operations_complex VALUES (1303, '2011-08-02', 83, 30, 381, 63, 0, 0);
INSERT INTO storage.operations_complex VALUES (1304, '2011-08-02', 30, 61, 381, 63, 0, 0);
INSERT INTO storage.operations_complex VALUES (1305, '2011-08-02', 61, 37, 381, 63, 0, 0);
INSERT INTO storage.operations_complex VALUES (1056, '2011-06-15', 12, 373, 176, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (1057, '2011-06-15', 12, 373, 181, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (1058, '2011-06-15', 12, 373, 195, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (1059, '2011-06-15', 12, 373, 200, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (1060, '2011-06-15', 12, 373, 186, 18, 0, 0);
INSERT INTO storage.operations_complex VALUES (1061, '2011-06-15', 12, 373, 205, 12, 0, 0);
INSERT INTO storage.operations_complex VALUES (1062, '2011-06-15', 12, 373, 210, 12, 0, 0);
INSERT INTO storage.operations_complex VALUES (1063, '2011-06-15', 12, 373, 217, 12, 0, 0);
INSERT INTO storage.operations_complex VALUES (1064, '2011-06-15', 12, 373, 230, 6, 0, 0);
INSERT INTO storage.operations_complex VALUES (1065, '2011-06-15', 12, 373, 233, 6, 0, 0);
INSERT INTO storage.operations_complex VALUES (1066, '2011-06-15', 12, 373, 333, 20, 0, 0);
INSERT INTO storage.operations_complex VALUES (1067, '2011-06-15', 12, 373, 347, 20, 0, 0);
INSERT INTO storage.operations_complex VALUES (1068, '2011-06-15', 12, 373, 236, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (1069, '2011-06-15', 12, 373, 241, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (1070, '2011-06-15', 12, 373, 246, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (1071, '2011-06-15', 12, 373, 251, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (1072, '2011-06-15', 12, 373, 256, 18, 0, 0);
INSERT INTO storage.operations_complex VALUES (1073, '2011-06-15', 12, 373, 262, 12, 0, 0);
INSERT INTO storage.operations_complex VALUES (1074, '2011-06-15', 12, 373, 268, 12, 0, 0);
INSERT INTO storage.operations_complex VALUES (1075, '2011-06-15', 12, 373, 274, 12, 0, 0);
INSERT INTO storage.operations_complex VALUES (1076, '2011-06-15', 12, 373, 280, 36, 0, 0);
INSERT INTO storage.operations_complex VALUES (1077, '2011-06-15', 12, 373, 285, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (1078, '2011-06-15', 12, 373, 290, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (1079, '2011-06-15', 12, 373, 300, 27, 0, 0);
INSERT INTO storage.operations_complex VALUES (1080, '2011-06-15', 12, 373, 306, 18, 0, 0);
INSERT INTO storage.operations_complex VALUES (1081, '2011-06-15', 12, 373, 312, 18, 0, 0);
INSERT INTO storage.operations_complex VALUES (1082, '2011-06-15', 12, 373, 318, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (1083, '2011-06-15', 12, 373, 324, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (1084, '2011-06-15', 12, 373, 321, 15, 0, 0);
INSERT INTO storage.operations_complex VALUES (1085, '2011-06-15', 12, 373, 327, 15, 0, 0);
INSERT INTO storage.operations_complex VALUES (1086, '2011-06-15', 12, 373, 112, 40, 0, 0);
INSERT INTO storage.operations_complex VALUES (1087, '2011-06-15', 12, 373, 113, 48, 0, 0);
INSERT INTO storage.operations_complex VALUES (1088, '2011-06-15', 12, 373, 114, 36, 0, 0);
INSERT INTO storage.operations_complex VALUES (1089, '2011-06-15', 12, 373, 115, 30, 0, 0);
INSERT INTO storage.operations_complex VALUES (1306, '2011-08-02', 37, 38, 381, 63, 0, 0);
INSERT INTO storage.operations_complex VALUES (1307, '2011-08-02', 38, 62, 381, 285, 0, 0);
INSERT INTO storage.operations_complex VALUES (1308, '2011-08-02', 62, 8, 381, 285, 0, 0);
INSERT INTO storage.operations_complex VALUES (1148, '2011-07-07', 12, 356, 268, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1146, '2011-07-07', 12, 356, 192, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (1149, '2011-07-08', 12, 146, 176, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (1150, '2011-07-08', 12, 146, 181, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (1151, '2011-07-08', 12, 146, 195, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (1152, '2011-07-08', 12, 146, 200, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (1153, '2011-07-08', 12, 146, 233, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (1090, '2011-06-15', 12, 373, 116, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (1091, '2011-06-15', 12, 373, 262, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (1093, '2011-06-29', 12, 371, 176, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (1094, '2011-06-29', 12, 371, 181, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (1095, '2011-06-29', 12, 371, 195, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (1096, '2011-06-29', 12, 371, 200, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (1097, '2011-06-29', 12, 371, 280, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (1098, '2011-06-29', 12, 371, 285, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (1099, '2011-06-29', 12, 371, 290, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (1100, '2011-06-29', 12, 371, 333, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (1101, '2011-06-29', 12, 371, 347, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (1102, '2011-06-29', 12, 371, 318, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1103, '2011-06-29', 12, 371, 327, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1104, '2011-06-29', 12, 371, 321, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1105, '2011-06-29', 12, 371, 324, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1125, '2011-07-05', 12, 377, 186, 27, 0, 0);
INSERT INTO storage.operations_complex VALUES (1126, '2011-07-05', 12, 377, 205, 36, 0, 0);
INSERT INTO storage.operations_complex VALUES (1119, '2011-06-30', 12, 375, 224, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1120, '2011-06-30', 12, 376, 192, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1121, '2011-06-30', 12, 376, 112, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1122, '2011-07-01', 12, 371, 233, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1123, '2011-07-05', 12, 377, 210, 36, 0, 0);
INSERT INTO storage.operations_complex VALUES (1124, '2011-07-05', 12, 377, 217, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (1127, '2011-07-05', 12, 377, 256, 18, 0, 0);
INSERT INTO storage.operations_complex VALUES (1128, '2011-07-05', 12, 377, 262, 36, 0, 0);
INSERT INTO storage.operations_complex VALUES (1129, '2011-07-05', 12, 377, 268, 36, 0, 0);
INSERT INTO storage.operations_complex VALUES (1130, '2011-07-05', 12, 377, 274, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (1131, '2011-07-05', 12, 377, 306, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (1132, '2011-07-05', 12, 377, 312, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (1133, '2011-07-05', 12, 377, 321, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (1134, '2011-07-05', 12, 377, 321, 12, 0, 0);
INSERT INTO storage.operations_complex VALUES (1135, '2011-07-05', 12, 358, 186, 45, 0, 0);
INSERT INTO storage.operations_complex VALUES (1136, '2011-07-05', 12, 358, 205, 42, 0, 0);
INSERT INTO storage.operations_complex VALUES (1137, '2011-07-05', 12, 358, 210, 42, 0, 0);
INSERT INTO storage.operations_complex VALUES (1138, '2011-07-05', 12, 358, 217, 30, 0, 0);
INSERT INTO storage.operations_complex VALUES (1139, '2011-07-05', 12, 358, 192, 16, 0, 0);
INSERT INTO storage.operations_complex VALUES (1140, '2011-07-05', 12, 358, 230, 15, 0, 0);
INSERT INTO storage.operations_complex VALUES (1141, '2011-07-05', 12, 358, 333, 40, 0, 0);
INSERT INTO storage.operations_complex VALUES (1142, '2011-07-05', 12, 358, 251, 40, 0, 0);
INSERT INTO storage.operations_complex VALUES (1143, '2011-07-06', 12, 371, 274, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1144, '2011-07-07', 12, 375, 192, 4, 0, 0);
INSERT INTO storage.operations_complex VALUES (1145, '2011-07-07', 12, 375, 112, 4, 0, 0);
INSERT INTO storage.operations_complex VALUES (1147, '2011-07-07', 12, 356, 262, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1154, '2011-07-08', 12, 146, 333, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (1155, '2011-07-08', 12, 146, 236, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (1156, '2011-07-08', 12, 146, 241, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (1157, '2011-07-08', 12, 146, 246, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (1158, '2011-07-08', 12, 146, 251, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (1159, '2011-07-08', 12, 146, 280, 56, 0, 0);
INSERT INTO storage.operations_complex VALUES (1160, '2011-07-08', 12, 146, 285, 56, 0, 0);
INSERT INTO storage.operations_complex VALUES (1161, '2011-07-08', 12, 146, 290, 56, 0, 0);
INSERT INTO storage.operations_complex VALUES (1162, '2011-07-08', 12, 146, 295, 40, 0, 0);
INSERT INTO storage.operations_complex VALUES (1163, '2011-07-08', 12, 146, 318, 26, 0, 0);
INSERT INTO storage.operations_complex VALUES (1164, '2011-07-08', 12, 146, 321, 7, 0, 0);
INSERT INTO storage.operations_complex VALUES (1166, '2011-05-16', 378, 12, 335, 2000, 0, 0);
INSERT INTO storage.operations_complex VALUES (1167, '2011-05-16', 378, 12, 334, 2000, 0, 0);
INSERT INTO storage.operations_complex VALUES (1169, '2011-07-08', 12, 358, 186, 36, 0, 0);
INSERT INTO storage.operations_complex VALUES (1170, '2011-07-08', 12, 358, 205, 30, 0, 0);
INSERT INTO storage.operations_complex VALUES (1171, '2011-07-08', 12, 358, 210, 30, 0, 0);
INSERT INTO storage.operations_complex VALUES (1172, '2011-07-08', 12, 358, 217, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (1173, '2011-07-08', 12, 358, 192, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (1174, '2011-07-08', 12, 358, 230, 9, 0, 0);
INSERT INTO storage.operations_complex VALUES (1175, '2011-07-08', 12, 358, 333, 20, 0, 0);
INSERT INTO storage.operations_complex VALUES (1176, '2011-07-08', 12, 358, 347, 40, 0, 0);
INSERT INTO storage.operations_complex VALUES (1177, '2011-07-08', 12, 358, 280, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (1178, '2011-07-08', 12, 358, 285, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (1179, '2011-07-08', 12, 358, 290, 24, 0, 0);
INSERT INTO storage.operations_complex VALUES (1181, '2011-05-18', 12, 356, 262, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1182, '2011-05-18', 12, 376, 268, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1183, '2011-05-20', 12, 371, 210, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1184, '2011-05-20', 12, 371, NULL, 0, 0, 0);
INSERT INTO storage.operations_complex VALUES (1185, '2011-05-17', 12, 378, 268, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1186, '2011-05-20', 12, 379, 186, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1187, '2011-05-20', 12, 379, 210, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1188, '2011-05-20', 12, 379, 200, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1189, '2011-05-20', 12, 379, 200, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1190, '2011-05-20', 12, 379, 210, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1191, '2011-05-20', 12, 379, NULL, 0, 0, 0);
INSERT INTO storage.operations_complex VALUES (1192, '2011-06-03', 12, 375, 321, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1193, '2011-05-30', 12, 375, 230, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1194, '2011-05-30', 12, 375, 114, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1195, '2011-05-30', 12, 375, 217, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1197, '2011-05-31', 12, 356, 274, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1198, '2011-06-07', 12, 375, 230, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1199, '2011-05-31', 12, 378, 230, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1200, '2011-05-31', 12, 378, 186, 5, 0, 0);
INSERT INTO storage.operations_complex VALUES (1201, '2011-05-31', 12, 378, 205, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1202, '2011-05-31', 12, 378, 181, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1203, '2011-05-31', 12, 378, 210, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1204, '2011-05-31', 12, 378, 217, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1205, '2011-05-31', 12, 378, 280, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1206, '2011-06-10', 12, 379, 205, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1207, '2011-06-10', 12, 379, 230, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1208, '2011-06-10', 12, 379, 114, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1209, '2011-06-14', 12, 378, 290, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1210, '2011-06-14', 12, 378, 285, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1211, '2011-06-14', 12, 378, 230, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1212, '2011-06-14', 12, 378, 192, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1214, '2011-06-20', 12, 356, 256, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1215, '2011-06-21', 12, 375, 217, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1216, '2011-05-30', 12, 379, 233, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (1217, '2011-05-30', 12, 371, 217, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1218, '2011-05-30', 12, 379, 210, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1219, '2011-05-30', 12, 380, 230, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1220, '2011-05-30', 12, 380, 274, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1221, '2011-05-30', 12, 380, 210, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1222, '2011-05-30', 12, 375, 236, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1223, '2011-05-30', 12, 375, 268, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1224, '2011-05-30', 12, 375, 205, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1225, '2011-05-30', 12, 375, 114, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1226, '2011-05-30', 12, 375, 217, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1227, '2011-05-30', 12, 375, 236, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1228, '2011-05-30', 12, 375, 230, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1229, '2011-05-30', 12, 379, 210, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1230, '2011-05-30', 12, 378, 217, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1231, '2011-05-30', 12, 356, 256, 2, 0, 0);
INSERT INTO storage.operations_complex VALUES (1232, '2011-05-30', 12, 375, 205, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1233, '2011-05-30', 12, 378, 262, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1234, '2011-05-30', 12, 378, 268, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1235, '2011-05-30', 12, 375, 256, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1236, '2011-05-30', 12, 371, 205, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1237, '2011-05-30', 12, 371, 210, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1238, '2011-05-30', 12, 376, 186, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1239, '2011-05-30', 12, 375, 256, 1, 0, 0);
INSERT INTO storage.operations_complex VALUES (1240, '2011-06-09', 8, 147, 142, 100, 0, 0);
INSERT INTO storage.operations_complex VALUES (1241, '2011-07-05', 35, 83, 84, 57, 0, 0);
INSERT INTO storage.operations_complex VALUES (1242, '2011-07-05', 35, 83, 86, 8, 0, 0);
INSERT INTO storage.operations_complex VALUES (1243, '2011-07-05', 35, 83, 87, 14, 0, 0);


--
-- Name: base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sansa
--

SELECT pg_catalog.setval('public.base_id_seq', 381, true);


--
-- Name: operations_complex_id_seq; Type: SEQUENCE SET; Schema: storage; Owner: sansa
--

SELECT pg_catalog.setval('storage.operations_complex_id_seq', 1308, true);


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
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: sansa
--

GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

