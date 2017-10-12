from sqlalchemy import create_engine


password = ""

create_engine(
    "postgresql+psycopg2://brewsclues_admin:" + password + "@/brewscluesdb",
    echo=True
)

