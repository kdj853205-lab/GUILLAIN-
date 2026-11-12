PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS users (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 name TEXT NOT NULL,
 email TEXT NOT NULL UNIQUE COLLATE NOCASE,
 password_hash TEXT NOT NULL,
 password_salt TEXT NOT NULL,
 role TEXT NOT NULL DEFAULT 'reader' CHECK(role IN ('reader','admin')),
 created_at INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS sessions (
 token_hash TEXT PRIMARY KEY,
 user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
 expires_at INTEGER NOT NULL
);
CREATE INDEX IF NOT EXISTS sessions_expiry ON sessions(expires_at);
CREATE TABLE IF NOT EXISTS articles (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 title_rw TEXT NOT NULL, title_en TEXT NOT NULL DEFAULT '', title_fr TEXT NOT NULL DEFAULT '',
 body_rw TEXT NOT NULL, body_en TEXT NOT NULL DEFAULT '', body_fr TEXT NOT NULL DEFAULT '',
 category TEXT NOT NULL, image_url TEXT NOT NULL DEFAULT '', author TEXT NOT NULL DEFAULT 'GUILLAIN NEWS',
 published INTEGER NOT NULL DEFAULT 1, created_at INTEGER NOT NULL
);
CREATE INDEX IF NOT EXISTS articles_latest ON articles(published,created_at);
CREATE TABLE IF NOT EXISTS comments (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 article_id INTEGER NOT NULL REFERENCES articles(id) ON DELETE CASCADE,
 user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
 body TEXT NOT NULL, status TEXT NOT NULL DEFAULT 'approved', created_at INTEGER NOT NULL
);
CREATE INDEX IF NOT EXISTS comments_article ON comments(article_id,status,created_at);
