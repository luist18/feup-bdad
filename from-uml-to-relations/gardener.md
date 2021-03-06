**Gardener**

- Place (<ins>address</ins>)
- Client (<ins>id</ins>, nif, placeId->Place)
- Garden (<ins>id</ins>, name, area, placeId->Place, clientId->Client)
- Explorer (<ins>gardenId</ins>->Garden, clientId->Client)
- GardenFlora (<ins>gardenId</ins>->Garden, amount, totalArea)
- PlantOccurence (<ins>id</ins>, area, plantId->Plant)
- Plant (<ins>scientificName</ins>)
- Plague (<ins>id</ins>, name, plantId->Plant)
- Season (<ins>id</ins>, startDate, endDate)
- EffectiveTreatment (<ins>id</ins>, name)
- PlagueTreatmentSeason (<ins>plagueId</ins>->Plague, <ins>treatmentId</ins>->EffectiveTreatment, <ins>seasonId</ins>->Season)
