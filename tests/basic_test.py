from ..dbanalyzer.analyze import analyze

from sqlmodel import create_engine, Session, SQLModel, select
import sqlite3
from pytest import fixture


@fixture(params=['crm.sql', 'library.sql', 'project.sql'])
def engine(request):
    with open(request.param, 'r') as f: sql = f.read()
    engine = create_engine("sqlite://")
    with Session(engine) as session:
        for line in sql.split('\n\n'):
            session.execute(line)
        session.commit()
    yield engine

def test_sanity(engine):
    analyze(engine=engine)



    
