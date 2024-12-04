
CREATE DATABASE universe;
CREATE TABLE galaxy(
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL,
    description VARCHAR(100),
    has_life BOOLEAN,
    is_spherical BOOLEAN,
    age_in_millions_of_year NUMERIC,
    galaxy_type TEXT,
    distance_from_earth INT NOT NULL
);

CREATE TABLE star(
    galaxy_id INT,
    FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id),
    star_id SERIAL UNIQUE PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL,
    description VARCHAR(100),
    has_life BOOLEAN,
    is_spherical BOOLEAN,
    age_in_millions_of_year NUMERIC,
    star_type TEXT,
    distance_from_earth INT NOT NULL
);

CREATE TABLE planet(
    star_id INT,
    FOREIGN KEY(star_id) REFERENCES star(star_id),
    planet_id SERIAL UNIQUE PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL,
    description VARCHAR(100),
    has_life BOOLEAN,
    is_spherical BOOLEAN,
    age_in_millions_of_year NUMERIC,
    planet_type TEXT,
    distance_from_earth INT NOT NULL
);

CREATE TABLE moon(
    planet_id INT,
    FOREIGN KEY(planet_id) REFERENCES planet(planet_id),
    moon_id SERIAL UNIQUE PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL,
    description VARCHAR(100),
    has_life BOOLEAN,
    is_spherical BOOLEAN,
    age_in_millions_of_year NUMERIC,
    moon_type TEXT,
    distance_from_earth INT NOT NULL
);
CREATE TABLE more_celestial_bodies(
    more_celestial_bodies_id SERIAL PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL,
    description VARCHAR(100) UNIQUE NOT NULL,
    distance_from_earth INT NOT NULL
);
--Insert galaxy
INSERT INTO galaxy (name, description, has_life, is_spherical, age_in_millions_of_year,  galaxy_type, distance_from_earth)
VALUES ('Andromeda Galaxy', 'Closest spiral galaxy to Milky Way', FALSE, TRUE, 13000, 'Spiral', 2.5);

INSERT INTO galaxy (name, description, has_life, is_spherical, age_in_millions_of_year,  galaxy_type, distance_from_earth)
VALUES ('Milky Way Galaxy', 'Our home galaxy', TRUE, NULL, 13500,  'Spiral', 0);

INSERT INTO galaxy (name, description, has_life, is_spherical, age_in_millions_of_year,  galaxy_type, distance_from_earth)
VALUES ('Messier 87', 'Elliptical galaxy with supermassive black hole', NULL, TRUE, 15000,  'Elliptical', 54);

INSERT INTO galaxy (name, description, has_life, is_spherical, age_in_millions_of_year,  galaxy_type, distance_from_earth)
VALUES ('Triangulum Galaxy', 'Third largest galaxy in Local Group', NULL, TRUE, 11000,  'Spiral', 3);

INSERT INTO galaxy (name, description, has_life, is_spherical, age_in_millions_of_year,  galaxy_type, distance_from_earth)
VALUES ('Centaurus A', 'Elliptical galaxy with dust lanes', NULL, TRUE, 16000, 'Elliptical', 16);

INSERT INTO galaxy (name, description, has_life, is_spherical, age_in_millions_of_year,  galaxy_type, distance_from_earth)
VALUES ('Large Magellanic Cloud', 'Irregular dwarf galaxy', NULL, NULL, 16500,  'Irregular', 165);

--Insert Stars
INSERT INTO star (galaxy_id, name, description, has_life, is_spherical, age_in_millions_of_year, star_type, distance_from_earth)
VALUES (1, 'Sol', 'Our Sun, a yellow dwarf star', TRUE, TRUE, 4600, 'Yellow dwarf', 0);

INSERT INTO star (galaxy_id, name, description, has_life, is_spherical, age_in_millions_of_year, star_type, distance_from_earth)
VALUES (2, 'Proxima Centauri', 'Closest star to Sun', NULL, TRUE, 4800, 'Red dwarf', 4.24);

INSERT INTO star (galaxy_id, name, description, has_life, is_spherical, age_in_millions_of_year, star_type, distance_from_earth)
VALUES (3, 'M87*', 'Supermassive black hole at center of Messier 87', NULL, TRUE, NULL, 'Supermassive black hole', 54);

INSERT INTO star (galaxy_id, name, description, has_life, is_spherical, age_in_millions_of_year, star_type, distance_from_earth)
VALUES (1, 'Sirius', 'Brightest star in night sky', NULL, TRUE, 250, 'White dwarf', 8.6);

INSERT INTO star (galaxy_id, name, description, has_life, is_spherical, age_in_millions_of_year, star_type, distance_from_earth)
VALUES (1, 'Betelgeuse', 'Red supergiant star nearing end of its life', NULL, TRUE, 600, 'Red supergiant', 640);

INSERT INTO star (galaxy_id, name, description, has_life, is_spherical, age_in_millions_of_year, star_type, distance_from_earth)
VALUES (2, 'Trappist-1', 'Ultracool dwarf star with seven Earth-sized planets', NULL, TRUE, 8, 'Ultracool dwarf', 40);

INSERT INTO star (galaxy_id, name, description, has_life, is_spherical, age_in_millions_of_year, star_type, distance_from_earth)
VALUES (2, 'Proxima b', 'Closest exoplanet to Earth potentially habitable', NULL, NULL, 4.2, 'Earth-sized planet', 4.24);

INSERT INTO star (galaxy_id, name, description, has_life, is_spherical, age_in_millions_of_year, star_type, distance_from_earth)
VALUES (3, 'Polaris', 'North Star, used for navigation', NULL, TRUE, 460, 'Yellow dwarf', 434);

INSERT INTO star (galaxy_id, name, description, has_life, is_spherical, age_in_millions_of_year, star_type, distance_from_earth)
VALUES (3, 'Vega', 'Fifth brightest star in night sky', NULL, TRUE, 400, 'A-type star', 25);

INSERT INTO star (galaxy_id, name, description, has_life, is_spherical, age_in_millions_of_year, star_type, distance_from_earth)
VALUES (4, 'Arcturus', 'Fourth brightest star in night sky', NULL, TRUE, 25, 'Orange giant', 37);

INSERT INTO star (galaxy_id, name, description, has_life, is_spherical, age_in_millions_of_year, star_type, distance_from_earth)
VALUES (5, 'Canopus', 'Second brightest star in night sky', NULL, TRUE, 1500, 'Red giant', 79);

INSERT INTO star (galaxy_id, name, description, has_life, is_spherical, age_in_millions_of_year, star_type, distance_from_earth)
VALUES (6, 'Rigel', 'Seventh brightest star in night sky', NULL, TRUE, 20, 'Supergiant', 860);
--Insert planets
INSERT INTO planet (star_id, name, description, has_life, is_spherical, age_in_millions_of_year, planet_type, distance_from_earth)
VALUES (1, 'Mercury', 'Smallest planet in the Solar System and closest to the Sun', FALSE, TRUE, 4600, 'Terrestrial', 77);

INSERT INTO planet (star_id, name, description, has_life, is_spherical, age_in_millions_of_year, planet_type, distance_from_earth)
VALUES (1, 'Venus', 'Second planet from the Sun with a thick, toxic atmosphere', FALSE, TRUE, 4600, 'Terrestrial', 41);

INSERT INTO planet (star_id, name, description, has_life, is_spherical, age_in_millions_of_year, planet_type, distance_from_earth)
VALUES (1, 'Earth', 'Our home planet, the only one known to support life', TRUE, TRUE, 4600, 'Terrestrial', 0);

INSERT INTO planet (star_id, name, description, has_life, is_spherical, age_in_millions_of_year, planet_type, distance_from_earth)
VALUES (1, 'Mars', 'The Red Planet, known for its iron oxide surface', FALSE, TRUE, 4600, 'Terrestrial', 225);

INSERT INTO planet (star_id, name, description, has_life, is_spherical, age_in_millions_of_year, planet_type, distance_from_earth)
VALUES (1, 'Jupiter', 'Largest planet in the Solar System with a Great Red Spot', FALSE, TRUE, 4600, 'Gas giant', 628);

INSERT INTO planet (star_id, name, description, has_life, is_spherical, age_in_millions_of_year, planet_type, distance_from_earth)
VALUES (1, 'Saturn', 'Known for its extensive ring system', FALSE, TRUE, 4600, 'Gas giant', 1277);

INSERT INTO planet (star_id, name, description, has_life, is_spherical, age_in_millions_of_year, planet_type, distance_from_earth)
VALUES (1, 'Uranus', 'An ice giant with a blue-green color due to methane', FALSE, TRUE, 4600, 'Ice giant', 2720);

INSERT INTO planet (star_id, name, description, has_life, is_spherical, age_in_millions_of_year, planet_type, distance_from_earth)
VALUES (1, 'Neptune', 'The farthest known planet in the Solar System', FALSE, TRUE, 4600, 'Ice giant', 4350);

INSERT INTO planet (star_id, name, description, has_life, is_spherical, age_in_millions_of_year, planet_type, distance_from_earth)
VALUES (2, 'Proxima b', 'Closest exoplanet to Earth, potentially habitable', NULL, TRUE, 4.2, 'Terrestrial', 4.24);

INSERT INTO planet (star_id, name, description, has_life, is_spherical, age_in_millions_of_year, planet_type, distance_from_earth)
VALUES (2, 'Proxima c', 'Second planet in the Proxima Centauri system, a potential super-Earth', NULL, TRUE, 5.3, 'Super-Earth', 4.24);

INSERT INTO planet (star_id, name, description, has_life, is_spherical, age_in_millions_of_year, planet_type, distance_from_earth)
VALUES (6, 'Gliese 581g', 'Exoplanet in the habitable zone of its star', NULL, TRUE, 7.0, 'Super-Earth', 20.3);

INSERT INTO planet (star_id, name, description, has_life, is_spherical, age_in_millions_of_year, planet_type, distance_from_earth)
VALUES (6, 'Gliese 667Cc', 'Potentially habitable exoplanet in a triple-star system', NULL, TRUE, 7.2, 'Super-Earth', 23.62);

--Insert Moon
INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (1, 'Luna', 'Earth natural satellite', FALSE, TRUE, 4500, 'Terrestrial', 0);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (2, 'Phobos', 'Larger and closer of Mars moons', FALSE, TRUE, 4500, 'Asteroid-like', 4.24);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (2, 'Deimos', 'Smaller and farther of Mars moons', FALSE, TRUE, 4500, 'Asteroid-like', 4.24);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (3, 'Io', 'Jupiters moon with intense volcanic activity', FALSE, TRUE, 4500, 'Volcanic', 628);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (3, 'Europa', 'Icy moon with potential subsurface ocean', FALSE, TRUE, 4500, 'Icy', 628);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (3, 'Ganymede', 'Largest moon in the solar system', FALSE, TRUE, 4500, 'Icy', 628);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (3, 'Callisto', 'Heavily cratered moon of Jupiter', FALSE, TRUE, 4500, 'Icy', 628);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (4, 'Titan', 'Largest moon of Saturn with thick atmosphere', FALSE, TRUE, 4500, 'Icy', 1400);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (4, 'Enceladus', 'Icy moon with geysers', FALSE, TRUE, 4500, 'Icy', 1400);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (4, 'Mimas', 'Moon of Saturn with large crater', FALSE, TRUE, 4500, 'Icy', 1400);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (4, 'Rhea', 'Second largest moon of Saturn', FALSE, TRUE, 4500, 'Icy', 1400);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (5, 'Triton', 'Largest moon of Neptune with retrograde orbit', FALSE, TRUE, 4500, 'Icy', 4500);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (5, 'Proteus', 'Second largest moon of Neptune', FALSE, TRUE, 4500, 'Icy', 4500);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (5, 'Nereid', 'Neptune moon with highly eccentric orbit', FALSE, TRUE, 4500, 'Icy', 4500);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (6, 'Charon', 'Largest moon of Pluto', FALSE, TRUE, 4500, 'Icy', 5900);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (6, 'Nix', 'Small moon of Pluto', FALSE, TRUE, 4500, 'Icy', 5900);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (6, 'Hydra', 'Outer moon of Pluto', FALSE, TRUE, 4500, 'Icy', 5900);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (6, 'Kerberos', 'Small moon of Pluto', FALSE, TRUE, 4500, 'Icy', 5900);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (6, 'Styx', 'Smallest moon of Pluto', FALSE, TRUE, 4500, 'Icy', 5900);

INSERT INTO moon (planet_id, name, description, has_life, is_spherical, age_in_millions_of_year, moon_type, distance_from_earth)
VALUES (7, 'Miranda', 'Smallest and innermost of Uranus major moons', FALSE, TRUE, 4500, 'Icy', 2870);

--More celestial bodies

INSERT INTO more_celestial_bodies (name, description, distance_from_earth)
VALUES ('Oumuamua', 'First known interstellar object detected passing through the Solar System', 23000000);

INSERT INTO more_celestial_bodies (name, description, distance_from_earth)
VALUES ('Tabbys Star', 'Star with unusual dimming patterns, sparking speculation about alien megastructures', 1470);

INSERT INTO more_celestial_bodies (name, description, distance_from_earth)
VALUES ('Pulsar PSR B1257+12', 'Pulsar hosting the first exoplanets ever discovered', 980);

INSERT INTO more_celestial_bodies (name, description, distance_from_earth)
VALUES ('Rogue Planet PSO J318.5-22', 'Planet without a parent star, wandering the galaxy', 80);

INSERT INTO more_celestial_bodies (name, description, distance_from_earth)
VALUES ('Hyperion', 'Saturn moon with a bizarre sponge-like appearance', 1200);

INSERT INTO more_celestial_bodies (name, description, distance_from_earth)
VALUES ('Haumea', 'Dwarf planet with a fast rotation and elongated shape', 6500);

INSERT INTO more_celestial_bodies (name, description, distance_from_earth)
VALUES ('Kepler-452b', 'Exoplanet often called Earth cousin due to its similarities in size and orbit', 1400);

INSERT INTO more_celestial_bodies (name, description, distance_from_earth)
VALUES ('KIC 8462852', 'Star exhibiting irregular and significant dips in brightness', 1470);

INSERT INTO more_celestial_bodies (name, description, distance_from_earth)
VALUES ('Hoags Object', 'A rare type of ring galaxy with a peculiar structure', 600);

INSERT INTO more_celestial_bodies (name, description, distance_from_earth)
VALUES ('Voyager 1', 'Human-made spacecraft that has entered interstellar space', 22700);