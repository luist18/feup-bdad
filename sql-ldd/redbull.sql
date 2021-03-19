PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS team;

DROP TABLE IF EXISTS aircraft;

DROP TABLE IF EXISTS pilot;

DROP TABLE IF EXISTS race;

DROP TABLE IF EXISTS participation;

DROP TABLE IF EXISTS duel;

CREATE TABLE team (
  name TEXT,
  country TEXT,

  CONSTRAINT team_pk PRIMARY KEY (name)
);

CREATE TABLE aircraft (
  model TEXT,
  hoursepower INTEGER,
  topspeed REAL,
  width REAL,
  height REAL,
  weight REAL,

  CONSTRAINT aircraft_pk PRIMARY KEY (model)
);

CREATE TABLE pilot (
  num INTEGER,
  firstname TEXT,
  surname TEXT,
  nationality TEXT,
  birthday DATE,
  name TEXT,
  model TEXT,

  CONSTRAINT pilot_team_fk FOREIGN KEY (name) REFERENCES team,
  CONSTRAINT pilot_aircraft_fk FOREIGN KEY (model) REFERENCES aircraft
);

CREATE TABLE race (
  location TEXT,
  edition TEXT,
  country TEXT,
  date DATE UNIQUE,
  gates INTEGER,
  eliminations INTEGER,

  CONSTRAINT race_pk PRIMARY KEY (location, edition)
);

CREATE TABLE participation (
  num INTEGER,
  location TEXT,
  edition TEXT,
  trainingtime REAL CHECK (trainingtime >= 0),
  trainingpos INTEGER CHECK (trainingpos > 0),
  trainingpenalty REAL,
  qualificationtime REAL CHECK (qualificationtime >= 0),
  qualificationpos INTEGER CHECK (qualificationpos > 0),
  qualificationpenalty REAL,
  eliminationtime REAL CHECK (eliminationtime >= 0),
  eliminationpos INTEGER CHECK (eliminationpos > 0),
  eliminationpenalty REAL,

  CONSTRAINT participation_pk PRIMARY KEY (num, location, edition),
  CONSTRAINT participation_pilot_fk FOREIGN KEY (num) REFERENCES pilot,
  CONSTRAINT participation_race_fk FOREIGN KEY (location, edition) REFERENCES race,
  CONSTRAINT trainingtime_check CHECK (trainingtime IS NULL OR trainingpos IS NOT NULL),
  CONSTRAINT qualificationtime_check CHECK (qualificationtime IS NULL OR qualificationpos IS NOT NULL),
  CONSTRAINT eliminationtime_check CHECK (eliminationtime IS NULL OR eliminationpos IS NOT NULL)
);

CREATE TABLE duel (
  numpilot1 INTEGER,
  numpilot2 INTEGER,
  location TEXT,
  edition TEXT,
  dueltype TEXT,
  timepilot1 REAL,
  timepilot2 REAL,
  penaltypilot1 REAL,
  penaltypilot2 REAL,
  
  CONSTRAINT duel_pk PRIMARY KEY (numpilot1, numpilot2, location, edition),
  CONSTRAINT duel_pilot1_fk FOREIGN KEY (numpilot1) REFERENCES pilot,
  CONSTRAINT duel_pilot2_fk FOREIGN KEY (numpilot2) REFERENCES pilot,
  CONSTRAINT duel_race_fk FOREIGN KEY (location, edition) REFERENCES race
);