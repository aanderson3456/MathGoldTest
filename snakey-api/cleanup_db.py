from database import SessionLocal, Strategy, MatchResult

db = SessionLocal()
strategies = db.query(Strategy).order_by(Strategy.elo.desc()).all()
seen = set()
to_delete = []

for s in strategies:
    if s.author in seen:
        to_delete.append(s)
    else:
        seen.add(s.author)

for s in to_delete:
    db.query(MatchResult).filter((MatchResult.strategy1_id == s.id) | (MatchResult.strategy2_id == s.id)).delete()
    db.delete(s)

db.commit()
db.close()
print(f"Deleted {len(to_delete)} duplicate strategies.")
