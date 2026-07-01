from sqlalchemy import create_engine, Column, Integer, String, Text, ForeignKey, Float
from sqlalchemy.orm import declarative_base, sessionmaker

SQLALCHEMY_DATABASE_URL = "sqlite:///./tournament.db"

engine = create_engine(
    SQLALCHEMY_DATABASE_URL, connect_args={"check_same_thread": False}
)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

class Strategy(Base):
    __tablename__ = "strategies"

    id = Column(Integer, primary_key=True, index=True)
    author = Column(String, index=True)
    code = Column(Text)
    elo = Column(Float, default=1200.0)
    wins = Column(Integer, default=0)
    losses = Column(Integer, default=0)
    losses_as_maker = Column(Integer, default=0)

class MatchResult(Base):
    __tablename__ = "match_results"

    id = Column(Integer, primary_key=True, index=True)
    strategy1_id = Column(Integer, ForeignKey("strategies.id"))
    strategy2_id = Column(Integer, ForeignKey("strategies.id"))
    winner_id = Column(Integer, ForeignKey("strategies.id"))

Base.metadata.create_all(bind=engine)
