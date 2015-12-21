ALTER TABLE package_names ALTER COLUMN id TYPE BIGINT;

ALTER TABLE packages
  ALTER COLUMN id TYPE BIGINT,
  ALTER COLUMN name_id TYPE BIGINT;

ALTER TABLE suites
  ALTER COLUMN id TYPE BIGINT,
  ALTER COLUMN package_id TYPE BIGINT;

ALTER TABLE files
  ALTER COLUMN id TYPE BIGINT,
  ALTER COLUMN package_id TYPE BIGINT;

ALTER TABLE checksums
  ALTER COLUMN id TYPE BIGINT,
  ALTER COLUMN package_id TYPE BIGINT,
  ALTER COLUMN file_id TYPE BIGINT;

ALTER TABLE binary_names ALTER COLUMN id TYPE BIGINT;

ALTER TABLE binaries
  ALTER COLUMN id TYPE BIGINT,
  ALTER COLUMN name_id TYPE BIGINT,
  ALTER COLUMN package_id TYPE BIGINT;

ALTER TABLE sloccounts
  ALTER COLUMN id TYPE BIGINT,
  ALTER COLUMN package_id TYPE BIGINT,
  ALTER COLUMN count TYPE BIGINT;

ALTER TABLE ctags
  ALTER COLUMN id TYPE BIGINT,
  ALTER COLUMN package_id TYPE BIGINT,
  ALTER COLUMN file_id TYPE BIGINT;

ALTER TABLE metrics
  ALTER COLUMN id TYPE BIGINT,
  ALTER COLUMN package_id TYPE BIGINT,
  ALTER COLUMN value_ TYPE BIGINT;

ALTER TABLE history_size
  ALTER COLUMN disk_usage TYPE BIGINT,
  ALTER COLUMN source_files TYPE BIGINT,
  ALTER COLUMN ctags TYPE BIGINT;

ALTER TABLE history_sloccount
  ALTER COLUMN lang_ada TYPE BIGINT,
  ALTER COLUMN lang_ansic TYPE BIGINT,
  ALTER COLUMN lang_asm TYPE BIGINT,
  ALTER COLUMN lang_awk TYPE BIGINT,
  ALTER COLUMN lang_cobol TYPE BIGINT,
  ALTER COLUMN lang_cpp TYPE BIGINT,
  ALTER COLUMN lang_cs TYPE BIGINT,
  ALTER COLUMN lang_csh TYPE BIGINT,
  ALTER COLUMN lang_erlang TYPE BIGINT,
  ALTER COLUMN lang_exp TYPE BIGINT,
  ALTER COLUMN lang_f90 TYPE BIGINT,
  ALTER COLUMN lang_fortran TYPE BIGINT,
  ALTER COLUMN lang_haskell TYPE BIGINT,
  ALTER COLUMN lang_java TYPE BIGINT,
  ALTER COLUMN lang_jsp TYPE BIGINT,
  ALTER COLUMN lang_lex TYPE BIGINT,
  ALTER COLUMN lang_lisp TYPE BIGINT,
  ALTER COLUMN lang_makefile TYPE BIGINT,
  ALTER COLUMN lang_ml TYPE BIGINT,
  ALTER COLUMN lang_modula3 TYPE BIGINT,
  ALTER COLUMN lang_objc TYPE BIGINT,
  ALTER COLUMN lang_pascal TYPE BIGINT,
  ALTER COLUMN lang_perl TYPE BIGINT,
  ALTER COLUMN lang_php TYPE BIGINT,
  ALTER COLUMN lang_python TYPE BIGINT,
  ALTER COLUMN lang_ruby TYPE BIGINT,
  ALTER COLUMN lang_sed TYPE BIGINT,
  ALTER COLUMN lang_sh TYPE BIGINT,
  ALTER COLUMN lang_sql TYPE BIGINT,
  ALTER COLUMN lang_tcl TYPE BIGINT,
  ALTER COLUMN lang_vhdl TYPE BIGINT,
  ALTER COLUMN lang_xml TYPE BIGINT,
  ALTER COLUMN lang_yacc TYPE BIGINT;

ALTER TABLE copyright
  ALTER COLUMN id TYPE BIGINT,
  ALTER COLUMN file_id TYPE BIGINT;

ALTER TABLE history_copyright
  ALTER COLUMN id TYPE BIGINT,
  ALTER COLUMN files TYPE BIGINT;
