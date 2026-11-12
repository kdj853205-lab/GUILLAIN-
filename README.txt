GUILLAIN NEWS — FULL CLOUDFLARE PAGES PROJECT
================================================

Iyi ni project yuzuye y'itangiriro (deployable full-stack) ikoresha:
- Cloudflare Pages + Pages Functions
- Cloudflare D1 database
- Admin imwe + konti z'abasomyi
- Kwinjira/kwiyandikisha, sessions, comments
- Gushyiraho no gusiba inkuru muri Admin
- Indimi RW / EN / FR, ibyiciro 10, search, share
- Responsive design kuri telefoni na mudasobwa

IBYO UGOMBA KUMENYA
-------------------
Nta muntu ushobora kubika database kuri ZIP gusa. Ugomba gukora Cloudflare account,
D1 database, gushyiraho secrets, gukora setup ya admin, hanyuma deploy. Ntitwashyize
password yawe muri ZIP. Admin password ibikwa muri Cloudflare secret.

1. Fungura https://dash.cloudflare.com/ hanyuma winjire cyangwa wiyandikishe.
2. Jya kuri Workers & Pages > D1 SQL Database > Create database.
   Izina: guillain-news-db
3. Fungura database, ujye kuri Console, ushyiremo ibiri muri schema.sql, ukore Run.
4. Muri project, fungura wrangler.toml, usimbuze PASTE_YOUR_D1_DATABASE_ID_HERE
   na Database ID uhabwa na Cloudflare.
5. Jya kuri Workers & Pages > Create application > Pages > Upload assets / Direct Upload.
   Uburyo bworoshye ni ugukoresha Wrangler CLI:
      npm install -g wrangler
      wrangler login
      wrangler pages deploy . --project-name guillain-news
   (koresha terminal uri muri folder ya project).
6. Muri Cloudflare Pages project > Settings > Variables and Secrets, ongeramo:
   ADMIN_EMAIL = email yawe
   ADMIN_PASSWORD = password ikomeye y'inyuguti nibura 12
   SETUP_KEY = urundi rufunguzo rukomeye, rutandukanye na password
   D1 binding: Variable name DB, hitamo database ya guillain-news-db.
   Ibi ubishyireho kuri Production (na Preview niba uyikoresha).
7. Deploy/redeploy kugira ngo settings zitangire gukora.
8. Fungura urubuga rwawe: https://guillain-news.pages.dev
9. Gukora admin bwa mbere: ohereza POST kuri:
   https://URUBUGA.pages.dev/api/admin/setup
   JSON body: {"setup_key":"AGACIRO_KA_SETUP_KEY"}
   Ushobora kubikora muri browser API tool nka Postman/Thunder Client.
   Setup endpoint ikora rimwe gusa; admin yamaze kuboneka, irafungwa.
10. Injira kuri website ukoresheje ADMIN_EMAIL na ADMIN_PASSWORD.
    Admin panel izagaragara munsi y'inkuru.

GUKORESHA
---------
- Abasomyi bakanda Iyandikishe, bakuzuza izina, email na password.
- Abasomyi binjiye bashobora gutanga ibitekerezo.
- Admin yinjira akabona panel yo gushyiraho inkuru.
- Shyiraho image URL ya HTTPS (URL y'ifoto iri kuri internet).
- Amakuru abikwa muri D1 kandi asomwa n'abasura bose.
- Gusiba inkuru bikorwa na admin gusa.

IBITARIMO / IBIKENeye KUNOZWA
-----------------------------
- Ubu amafoto ashyirwamo hakoreshejwe image URL. Kugira ngo wohereze amafoto
  uhereye kuri telefoni, hakenewe Cloudflare R2 upload integration.
- Nta email verification, password reset, cyangwa moderation dashboard y'ibitekerezo
  birimo. Ibi byongerwaho mbere yo gukoresha ku rwego runini.
- Ubu comments zigaragara ako kanya; admin ashobora gusiba inkuru ariko ntarabona
  panel yo kwemeza/gusiba comments.
- Cloudflare account, D1 database, secrets na deployment ntibikorwa n'iyi ZIP
  yonyine. Bisaba ko nyir'urubuga abikora muri konti ye.
- Nyuma yo deploy, gerageza registration, login, comment, article creation,
  logout n'admin setup. Bika secrets ahantu hizewe.

UMUTEKANO
---------
- Passwords z'abakoresha ntizibikwa uko zanditse; zikoresha PBKDF2-SHA256 + salt.
- Session token ibikwa muri HttpOnly Secure SameSite cookie; muri D1 habikwa hash yayo.
- Admin role igenzurwa kuri server buri gihe.
- Setup key na admin password ntibishyirwa muri source code.
- Iyi ni version ya mbere ikora; mbere yo kwamamaza cyane, ongeraho rate limiting,
  email verification, CAPTCHA, backup, privacy policy na moderation.
