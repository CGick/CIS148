
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, ForeignKey, DECIMAL
from sqlalchemy.orm import relationship

Base = declarative_base()

class Place_Types(Base):
    __tablename__ = "place_type"

    place_type_id = Column(Integer, primary_key=True)
    place_type_dscp = Column(String)

    def __repr__(self):
        return "<Place_Type( " \
               "place_type_id='{}', " \
               "place_type_dscp='{}'" \
               ")>".format(
                    self.place_type_id,
                    self.place_type_dscp
                )


class Places(Base):
    __tablename__ = "places"

    place_id = Column(Integer, primary_key=True)
    place_type = Column(Integer, ForeignKey('place_type.place_type_id'))
    place_name = Column(String)
    place_address_line1 = Column(String)
    place_address_line2 = Column(String)
    city = Column(String)
    state = Column(String)
    zip_code = Column(Integer)


class Locations(Base):
    __tablename__ = "locations"

    place_id = Column(Integer, ForeignKey('places.place_id'))
    lat = Column(DECIMAL)
    long = Column(DECIMAL)


class Drinks(Base):
    __tablename__ = "drinks"

    drink_id = Column(Integer, primary_key=True)
    maker_id = Column(Integer, ForeignKey("places.place_id"))
    drink_name = Column(String)

class Drink_Types(Base):
    __tablename__ = "drink_types"

    drink_type_id = Column(Integer, primary_key=True)
    drink_type_dscp = Column(String)

class Drink_Stats(Base):
    __tablename__ = "drink_stats"

    drink_id = Column(Integer, ForeignKey("drinks.drink_id"))
    drink_type_id = Column(Integer, ForeignKey("drink_types.drink_type_id"))
    drink_abv = Column(DECIMAL)
    drink_ibu = Column(Integer)
    drink_variation = Column(String)

class Serve_Types(Base):
    __tablename__ = "serve_types"

    serve_type_id = Column(Integer, primary_key=True)
    serve_type_dscp = Column(String)

class Places_Drinks(Base):
    __tablename__ = "places_drinks"

    place_id = Column(Integer, ForeignKey("places.place_id"))
    drink_id = Column(Integer, ForeignKey("drinks.drink_id"))