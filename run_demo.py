"""Builds the SQLite database and runs all example queries.
Usage: python run_demo.py
"""
import re
import sqlite3
from pathlib import Path

DB = "kyc.db"
Path(DB).unlink(missing_ok=True)

con = sqlite3.connect(DB)
con.executescript(Path("schema.sql").read_text())
con.executescript(Path("seed.sql").read_text())
print("Database kyc.db created.\n")

text = Path("queries.sql").read_text()
# split by the "-- Q<n>: title" lines
parts = re.split(r"^-- (Q\d+: .*)$", text, flags=re.MULTILINE)
for title, sql in zip(parts[1::2], parts[2::2]):
    cur = con.execute(sql.strip().rstrip(";"))
    cols = [d[0] for d in cur.description]
    rows = cur.fetchall()
    print(f"### {title}")
    print(" | ".join(cols))
    for row in rows:
        print(" | ".join(str(x) for x in row))
    if not rows:
        print("(no rows)")
    print()
con.close()
