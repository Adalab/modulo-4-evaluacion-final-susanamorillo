create database disney;

use disney;

CREATE TABLE `disney`.`personajes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `peliculas` VARCHAR(1024) NULL,
  `sinopsis` VARCHAR(1024) NULL,
  PRIMARY KEY (`id`));
  
  INSERT INTO `personajes` (nombre, peliculas, sinopsis) VALUES ('Mickey', 'Fantasía','Varias secuencias de los dibujos animados de Disney son acompañadas por música clásica e incluyen a Mickey Mouse en "El Aprendiz de Brujo". Descubre cómo la música cobra vida, escucha las imágenes convertirse en canciones y comparte la emoción.');
  INSERT INTO `personajes` (nombre, peliculas, sinopsis) VALUES ('Mérida', 'Brave','Merida es una joven arquera, hija del rey Fergus y de la reina Elinor. Decidida a forjar su propio camino en la vida, Merida desafía una antigua costumbre de los señores de la tierra, desencadenando el caos en el reino.');
  SELECT * FROM disney.personajes;
INSERT INTO personajes(nombre, peliculas, sinopsis) 
VALUES ("Mulán", "Mulán", "El ejército de los Hunos, encabezado por el malvado Shun Yiu, quiere conquistar China. El emperador, para impedírselo, ha mandado a filas a todos los varones con el fin de proteger el imperio. Por otra parte, Mulán es una chica joven y valiente que vive en una aldea. Su padre está enfermo pero a pesar de ello quiere luchar por su país. Mulán no lo va a consentir y se fugará de casa con la intención de hacerse pasar por un chico y combatir en lugar de su padre.");

UPDATE personajes SET nombre= "Tala ", peliculas= "Vaiana", sinopsis= "Vaiana Waialiki es una joven entusiasta del mar y la única hija de un jefe marinero. Cuando los marineros de su aldea no pueden pescar ningún pez y todas las cosechas fallan, Vaiana descubre que el semidiós Maui causó el infortunio después de robar el corazón de la diosa Te Fiti. La única manera de salvar el destino de la isla es persuadiendo a Maui para que le devuelva el corazón a Te Fiti. Entonces, Vaiana emprende una arriesgada aventura para salvar a su aldea junto al semidiós Maui." 
WHERE id = 1;

DELETE FROM personajes WHERE id= 4