from sqlmodel import SQLModel, create_engine, Session, select
from rich import print

from itertools import chain
from collections import defaultdict

def analyze(constring:str=None, engine=None):
    '''

    '''
    assert (constring is None) ^ (engine is None), "Must provide one, and only one, option."

    if not engine:
        engine = create_engine(constring)

    # Bootstrap SQL model
    SQLModel.metadata.reflect(engine)
    SQLModel.metadata.create_all(engine)

    table_sets = {}

    with Session(engine) as session:
        tables = SQLModel.metadata.tables
        for table_name, table in tables.items():
            # TODO - add a check to the size of the table with row count or similar
            statement = select(table)

            rows = session.execute(statement).all()

            table_sets[table_name] = dict(zip([c.name for c in table.columns], [hash(frozenset(column)) for column in zip(*rows)]))
    
    column_datasets = list(chain.from_iterable([[(table, column, dataset) for column, dataset in table_data.items()] for table, table_data in table_sets.items()]))

    equal_sets = defaultdict(list)

    for table, column, data_hash in column_datasets:
        equal_sets[hash(data_hash)].append((table, column))
    

    return list(equal_sets.values())





