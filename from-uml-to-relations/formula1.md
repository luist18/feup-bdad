**Formula 1**

- Team (<ins>id</ins>, name, country)
- Car (<ins>id</ins>, weight, power, maxSpeed, team->Team)
- Pilot (<ins>id</ins>, name, address, birthday, points, age, carId->Car)
- Season (<ins>year</ins>)
- Race (<ins>id</ins>, laps, date, circuitId->Circuit, seasonId->Season)
- Circuit (<ins>id</ins>, name, local, country, perimeter)
- RaceOccurence (gridPosition, finalPosition, <ins>raceId</ins>->Race, <ins>pilotId</ins>->Pilot)
- DNF (lap, reason, <ins>raceId</ins>->Race, <ins>pilotId</ins>->Pilot)
