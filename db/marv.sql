CREATE DATABASE marv;
Use marv;

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `categoria` (`idCategoria`, `name`) VALUES
(1, 'Frutas y Verduras'),
(2, 'Abarrotes'),
(3, 'Carnes aves y pescado'),
(4, 'Lacteos'),
(5, 'Aguas y Bebidas'),
(6, 'Limpieza');


CREATE TABLE `conductor` (
  `idConductor` int(11) NOT NULL,
  `Nombres` varchar(20) NOT NULL,
  `Apellidos` varchar(20) NOT NULL,
  `DNI` varchar(8) NOT NULL,
  `telefono` int(11) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `conductor` (`idConductor`, `Nombres`, `Apellidos`, `DNI`, `telefono`, `email`) VALUES
(3, 'Luz', 'Torres Paz', '62191212', 986141854, 'luz@unmsm.edu.pe');


CREATE TABLE `contacto` (
  `idContacto` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `mensaje` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `diadescuento` (
  `idDiaDescuento` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `pDescuento` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `diadescuento` (`idDiaDescuento`, `name`, `pDescuento`) VALUES
(1, 'Lunes', '9.99'),
(2, 'Martes', '9.99'),
(3, 'Miercoles', '9.99'),
(4, 'Jueves', '9.99');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL,
  `Estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`idEstado`, `Estado`) VALUES
(1, 'Pendiente'),
(2, 'Confirmado'),
(3, 'En camino'),
(4, 'Entregado'),
(5, 'Promovido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formapago`
--

CREATE TABLE `formapago` (
  `idPago` int(11) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `formapago`
--

INSERT INTO `formapago` (`idPago`, `name`) VALUES
(1, 'Transferencia'),
(2, 'Contraentrega');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idMarca`, `Name`) VALUES
(1, 'Beltran'),
(2, 'Otros'),
(3, 'costeño'),
(4, 'huevo la calera'),
(5, 'lejia sapolio'),
(6, 'agua cielo'),
(7, 'ajinomen'),
(8, 'herbi'),
(9, 'campo mar'),
(10, 'café kirma'),
(11, 'doña gusta'),
(12, 'bells'),
(13, 'gloria'),
(14, 'alacena'),
(15, 'molitalia'),
(16, 'sillao'),
(17, 'queirolo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `nombreRol` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `nombreRol`) VALUES
(1, 'Empresa'),
(2, 'Persona Natura'),
(3, 'Vendedor'),
(4, 'Conductor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria`
--

CREATE TABLE `subcategoria` (
  `idSubCategoria` int(11) NOT NULL,
  `T_NameCategoria` varchar(100) NOT NULL,
  `idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `subcategoria`
--

INSERT INTO `subcategoria` (`idSubCategoria`, `T_NameCategoria`, `idCategoria`) VALUES
(1, 'Frutas', 1),
(2, 'Verduras', 1),
(3, 'Aceites', 2),
(4, 'Alimentos conserva', 2),
(5, 'Arroz', 2),
(6, 'Canastas y packs', 2),
(7, 'Chocolateria', 2),
(8, 'Condimentos vinagres y comida', 2),
(9, 'Instantánea', 2),
(10, 'Fideos pastas y salsas', 2),
(11, 'Galletas snacks y Golosinas', 2),
(12, 'Menestras', 2),
(13, 'Reposteria', 2),
(14, 'Desayuno', 2),
(15, 'Aves, Huevos', 3),
(16, 'Cerdo', 3),
(17, 'Hamburguesa y apanados', 3),
(18, 'Pescados y Mariscos', 3),
(19, 'res y otras carnes', 3),
(20, 'Queseria', 4),
(21, 'Leches', 4),
(22, 'Mantequillas', 4),
(23, 'Yogures', 4),
(24, 'Aguas', 5),
(25, 'Bebidas Regeneradoras', 5),
(26, 'Gaseosas', 5),
(27, 'Hielo', 5),
(28, 'Jugos y otras Bebidas', 5),
(29, 'Accesorios de Limpieza', 6),
(30, 'Aereosoles', 6),
(31, 'Cuidado de ropa', 6),
(32, 'Cuidado del hogar', 6),
(33, 'Limpieza de baño', 6),
(34, 'Limpieza de cocina', 6),
(35, 'Limpieza de calzado', 6),
(36, 'Papel para el hogar', 6),
(37, 'Tuberculos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `idUbicacion` int(11) NOT NULL,
  `idDiaDescuento` int(11) NOT NULL,
  `Distrito` varchar(25) NOT NULL,
  `Precio` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`idUbicacion`, `idDiaDescuento`, `Distrito`, `Precio`) VALUES
(1, 1, 'San Miguel', '12.00'),
(2, 1, 'Bellavista', '8.00'),
(3, 1, 'La Perla', '10.00'),
(4, 3, 'San Isidro', '16.00'),
(5, 2, 'Los Olivos', '18.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

CREATE TABLE `unidad` (
  `idUnidad` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`idUnidad`, `name`) VALUES
(1, 'KG'),
(2, 'UND'),
(3, 'PAQUETE'),
(4, 'ATADO'),
(5, 'PLANCHA'),
(6, 'CAJA'),
(7, 'GR'),
(8, 'SOBRE'),
(9, 'POTE'),
(10, 'SACO'),
(11, 'TARRO'),
(12, 'BOLSA'),
(13, 'BOTELLA'),
(14, 'GALÓN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` varchar(8) NOT NULL,
  `RUC` varchar(11) DEFAULT NULL,
  `DNI` varchar(8) DEFAULT NULL,
  `Apellidos` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `Nombres` varchar(20) NOT NULL,
  `idRol` int(11) NOT NULL,
  `NombreEmpresa` varchar(100) DEFAULT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`idUser`, `email`, `pass`, `RUC`, `DNI`, `Apellidos`, `Nombres`, `idRol`, `NombreEmpresa`, `telefono`) VALUES
(1, 'harold.huaccha@unmsm.edu.pe', '12345', '', '41241412', 'Huaccha Tene', 'Harold Andre', 2, '', 978803091),
(2, 'erik.muñico@unmsm.edu.pe', '12345', NULL, '23412124', 'Munico Galvan', 'Erik Antony', 3, NULL, 978123412),
(3, 'luz@unmsm.edu.pe', '12345', NULL, '62191212', 'Torres Paz', 'Luz', 4, NULL, 986141854);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `idVendedor` int(11) NOT NULL,
  `Nombres` varchar(20) NOT NULL,
  `Apellidos` varchar(20) NOT NULL,
  `DNI` varchar(8) NOT NULL,
  `telefono` int(11) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vendedor`
--

INSERT INTO `vendedor` (`idVendedor`, `Nombres`, `Apellidos`, `DNI`, `telefono`, `email`) VALUES
(2, 'Erik Antony', 'Munico Galvan', '23412124', 978123412, 'erik.muñico@unmsm.com');




CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(600) NOT NULL,
  `precio` double(5,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `idUnidad` int(11) NOT NULL,
  `descripcion` varchar(600) NOT NULL,
  `idMarca` int(11) NOT NULL,
  `idSubCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `name`, `image`, `precio`, `stock`, `idUnidad`, `descripcion`, `idMarca`, `idSubCategoria`) VALUES
(1, 'Aceite Beltrán', 'https://as.com/buenavida/imagenes/2017/02/23/portada/1487869214_661327_1487869888_noticia_normal.jpg', 7.00, 54, 1, 'abarrotes', 1, 3),
(2, 'Manzana de agua', 'https://collecta.com.co/408-large_default/manzana-de-agua.jpg', 3.00, 23, 1, 'asdasdasdasd', 2, 1),
(3, 'Chuño', 'https://vivanda.vteximg.com.br/arquivos/ids/167486-1000-1000/915750.jpg?v=636137840882270000', 9.00, 16, 1, 'asdasdasdasd', 2, 14),
(4, 'Brocoli', 'https://mercadoborbon.odoo.com/web/image/product.template/110/image', 5.00, 30, 1, 'asdasdasdasd', 2, 2),
(5, 'Cebolla Blanca', 'https://www.toponions.com/l/es/library/download/urn:uuid:0a616ef8-a95f-4853-afa2-71cf0c00ee00/witte-ui_01.jpg', 3.50, 55, 1, 'verdura saludable', 2, 2),
(6, 'Espinaca', 'https://www.gob.mx/cms/uploads/article/main_image/11271/espinass.jpg', 5.50, 20, 1, 'Verdura saludable', 2, 2),
(7, 'Pimiento', 'https://www.hogarmania.com/archivos/201211/440-nutricion-pimientos-xl-668x400x80xX.jpg', 1.50, 20, 1, 'Pimiento rico', 2, 2),
(8, 'Maracuya', 'https://assets.cdnelnuevodiario.com/legacy/1321324244_maracuya.jpg', 3.00, 36, 1, 'Rica Fruta Jugosa', 2, 1),
(10, 'Vainita', 'https://wongfood.vteximg.com.br/arquivos/ids/165297-512-512/Vainita-Wong-1-7329.jpg?v=636415351435000000', 3.50, 50, 1, '', 2, 2),
(11, 'Maiz Morado', 'https://vivanda.vteximg.com.br/arquivos/ids/165065-1000-1000/60110.jpg?v=636137790322770000', 3.50, 50, 1, '', 2, 2),
(12, 'Palta Fuerte', 'https://www.normita.com/wp-content/uploads/2020/05/palta-fuerte.jpg', 8.00, 35, 1, '', 2, 1),
(15, 'Piña Hawaiana', 'https://s3.amazonaws.com/mitiendape/uploads/tienda_004167/tienda_004167_951cf5f56007dc77461390286b496e0cf298099e_producto_medium_80.jpg', 3.00, 50, 1, '', 2, 1),
(16, 'Naranja de Jugo', 'https://tunuevacompra.com.pe/wp-content/uploads/2020/05/naranja-para-jugo.jpg', 2.80, 50, 1, '', 2, 1),
(17, 'Garbanzo', 'https://elportugues.com.ar/122/garbanzo-blanco-lechoso-grande-x-1-kg.jpg', 7.60, 50, 1, '', 2, 12),
(18, 'Frejol Panamito', 'https://smartket.club/image/cache/catalog/menestras/panamito-900x800-800x800.jpg', 10.00, 39, 1, '', 2, 12),
(19, 'Lenteja BB', 'https://www.gomarket360.com/uploads/product_image/product_429_1.jpg', 7.00, 52, 1, '', 2, 12),
(20, 'Maicena', 'https://vivanda.vteximg.com.br/arquivos/ids/168290-1000-1000/944661.jpg?v=636137846531800000', 5.20, 50, 1, '', 2, 14),
(21, 'Pallares', 'https://smartket.club/image/cache/catalog/menestras/pallar-900x800.jpg', 11.00, 50, 1, '', 2, 12),
(22, 'Arroz', 'https://plazavea.vteximg.com.br/arquivos/ids/192038-450-450/20131000.jpg?v=636439437687600000', 3.40, 45, 1, '', 3, 5),
(23, 'Avena', 'https://wongfood.vteximg.com.br/arquivos/ids/354332-750-750/Avena-Natural-Santa-Catalina-Bolsa-1-kg-1-19167294.jpg?v=637232724801700000', 10.00, 50, 1, '', 2, 14),
(24, 'Azucar', 'https://dojiw2m9tvv09.cloudfront.net/23194/product/azucar-blanca-costen-o1kg1838.jpg', 3.40, 49, 1, '', 3, 14),
(25, 'Fideo Codito', 'https://vivanda.vteximg.com.br/arquivos/ids/172340-1000-1000/20120437.jpg?v=636401341300570000', 3.40, 50, 1, '', 2, 10),
(26, 'Fideo Tornillo', 'https://plazavea.vteximg.com.br/arquivos/ids/169950-450-450/1042744012.jpg?v=635774861002270000', 3.40, 50, 1, '', 2, 10),
(27, 'Camote Amarillo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSBX5upFPLxwhZPjS6T3hczf4-ujIHemunYlw&usqp=CAU', 3.50, 50, 1, '', 2, 37),
(28, 'Kion', 'https://wongfood.vteximg.com.br/arquivos/ids/212592-750-750/Kion-x-kg-KION-1-146203.jpg?v=636568076067430000', 5.00, 39, 1, '', 2, 2),
(30, 'Papa Amarilla', 'https://vacasfelices.com/images/productos/verduras/18.jpg', 3.00, 50, 1, '', 2, 37),
(31, 'Zanahoria', 'https://i2.wp.com/verdedelirio.com/wp-content/uploads/2019/08/zanahoria.jpg?fit=1000%2C1000&ssl=1', 2.50, 50, 1, '', 2, 2),
(32, 'Papa Blanca', 'https://vivanda.vteximg.com.br/arquivos/ids/176642-1000-1000/990852.jpg?v=636840278539270000', 1.20, 50, 1, '', 2, 37),
(33, 'Huevos la calera', 'https://www.vacasfelices.com/images/productos/pollo/huevos-1kg.jpg', 7.00, 100, 1, '', 4, 15),
(34, 'Pollo Entero', 'https://i1.wp.com/layuad.com/wp-content/uploads/2018/10/pollo-1kg.jpg?fit=450%2C450&ssl=1', 13.20, 45, 1, '', 2, 15),
(35, '2 Pollos Entero', 'https://previews.123rf.com/images/griffin024/griffin0241212/griffin024121200058/16642162-dos-pollos-crudos-en-una-bandeja-de-pl%C3%A1stico-aislados-contra-blancos.jpg', 26.40, 50, 1, '', 2, 15),
(36, 'Ayudín (520gr)', 'https://chely.pe/wp-content/uploads/2020/04/AYUDIN-LAVAVAJILLA-POTE-X-520-GR.-LIMON.jpg', 6.00, 50, 2, '', 2, 34),
(37, 'Lejia 1L', 'https://wongfood.vteximg.com.br/arquivos/ids/156123-750-750/Lejia-Sapolio-Original-Botella-1-L-145469.jpg?v=636052223458900000', 6.50, 50, 2, '', 5, 34),
(38, 'Papel Mega Rollo', 'https://cdn.shopify.com/s/files/1/0097/5808/1105/products/D46A4575-847E-4DDE-9C14-FEAAB7AF2140_1024x.jpg?v=1558242915', 4.00, 50, 2, '', 2, 36),
(39, 'Papa Rosada', 'https://geant.vteximg.com.br/arquivos/ids/252430-700-700/400957.jpg?v=637281903468170000', 2.50, 50, 1, '', 2, 37),
(40, 'Olluco Rosado', 'https://www.tuberculos.org/wp-content/uploads/2018/05/olluco-1200x900.jpg', 4.00, 50, 1, '', 2, 37),
(42, 'Frijol Caballero', 'https://cdn.palbin.com/users/38707/images/frijol-caballero-1592194137.jpg.thumb', 9.00, 50, 1, '', 2, 12),
(43, 'Papa Seca', 'https://perudelights.com/wp-content/uploads/2013/02/IMG_3527.jpg', 7.50, 50, 1, '', 2, 37),
(44, 'Quinua', 'https://img.freepik.com/foto-gratis/quinoa-real_1368-9186.jpg?size=626&ext=jpg', 18.00, 50, 1, '', 2, 12),
(45, 'Soya', 'https://ua.all.biz/img/ua/catalog/14926884.jpg', 4.00, 50, 1, '', 2, 14),
(46, 'Trigo', 'https://www.elmercadoentucasa.pe/wp-content/uploads/Trigo-Moron-1-kg.jpg', 7.00, 50, 1, '', 2, 12),
(47, 'Ajo Entero', 'https://s3.amazonaws.com/imagenes-sellers-mercado-ripley/2020/05/20141130/2441.jpg', 18.00, 50, 1, '', 2, 2),
(49, 'Atado Culantro', 'https://vegetables.odoo.com/web/image/product.template/91/image_1024?unique=733d690', 1.00, 50, 2, '', 2, 2),
(50, 'Pepino', 'https://www.bidfoodiberia.com/media/catalog/product/cache/1/image/600x/17f82f742ffe127f42dca9de82fb58b1/e/c/ecopep.jpg', 1.00, 50, 2, '', 2, 2),
(54, 'Atado de Betarraga', 'https://mallkupe.com/wp-content/uploads/2020/05/BETARRAGA-min.jpg', 3.50, 50, 2, '', 2, 2),
(61, 'Apio', 'https://www.westchesterhispano.net/wp-content/uploads/2018/01/Apio.jpg', 2.00, 50, 2, '', 2, 2),
(64, 'Atado Perejil', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQLgqL1jEWWZgPJgB_B1Iy7Y3szKRC_AJayyA&usqp=CAU', 1.00, 50, 2, '', 2, 2),
(66, 'Poro', 'https://dojiw2m9tvv09.cloudfront.net/41548/product/poro5670.jpg', 1.50, 50, 2, '', 2, 2),
(67, 'Rocoto', 'https://plazavea.vteximg.com.br/arquivos/ids/226521-450-450/135973.jpg?v=636977898030200000', 1.00, 50, 2, '', 2, 2),
(68, 'Zapallo', 'https://vivanda.vteximg.com.br/arquivos/ids/178024-618-618/20017639.jpg?v=636905875673230000', 3.00, 50, 1, '', 2, 2),
(69, 'Agua Cielo', 'https://minimarket.pe/wp-content/uploads/2019/12/agua_cielo.jpg', 1.20, 50, 2, '', 6, 24),
(70, 'Ají Panca', 'https://www.tienda-peruana.com/1497-tm_thickbox_default/panquita-aji-panca-especial-sin-picante-sibarita-sabor-del-peru.jpg', 1.40, 50, 2, '', 2, 8),
(71, 'Ajinomen', 'https://chely.pe/wp-content/uploads/2019/03/frontal-3623.jpg', 1.40, 50, 2, '', 7, 9),
(72, 'Anís Herbi', 'https://wongfood.vteximg.com.br/arquivos/ids/258823-750-750/32131-1.jpg?v=636784330415370000', 2.50, 50, 2, '', 8, 14),
(73, 'Atun Campomar', 'https://plazavea.vteximg.com.br/arquivos/ids/244931-1000-1000/20145074.jpg?v=637052316005530000', 6.50, 50, 2, '', 9, 4),
(74, 'Kafe Kirma', 'https://plazavea.vteximg.com.br/arquivos/ids/319779-450-450/20110224.jpg?v=637244679292130000', 18.00, 50, 2, '', 10, 14),
(75, 'Cancha Serrana', 'https://www.tienda-peruana.com/1222-tm_home_default/maiz-cancha-serrana-el-plebeyo-500g.jpg', 8.00, 50, 1, '', 2, 4),
(76, 'Sobre Colapiz', 'https://www.julcap.com/images/colapiz/colapiz.jpg', 2.00, 50, 2, '', 2, 13),
(77, 'Sobre Comino', 'https://i2.wp.com/www.comprame.pe/wp-content/uploads/2020/06/Comino-SIBARITA-Sobre-4.05g.png?fit=1152%2C720&ssl=1', 1.00, 50, 2, '', 2, 8),
(78, 'Doña Gusta Pescado', 'https://d20f60vzbd93dl.cloudfront.net/uploads/tienda_003842/tienda_003842_437e5c887bc470420610fa015cccaf5a049588ca_producto_large.jpg', 1.00, 50, 2, '', 11, 8),
(79, 'Doña Gusta Carne', 'https://dojiw2m9tvv09.cloudfront.net/23194/product/X_15414507884250230.png?57', 1.00, 50, 2, '', 11, 8),
(80, 'Doña Gusta Gallina', 'https://swissbrothers.com/799-home_default/dona-gusta-caldo-sabor-a-gallina-en-polvo-7g.jpg', 1.00, 50, 2, '', 11, 8),
(81, 'Harina Bells', 'https://vivanda.vteximg.com.br/arquivos/ids/164540-1000-1000/22005.jpg?v=636137784434370000', 5.00, 50, 2, '', 12, 13),
(82, 'Harina sin preparar', 'https://vivanda.vteximg.com.br/arquivos/ids/161032-1000-1000/10443.jpg?v=636137716623600000', 5.00, 50, 1, '', 2, 13),
(83, 'Leche Condensada', 'https://vivanda.vteximg.com.br/arquivos/ids/163499-1000-1000/20070084.jpg?v=636137753258370000', 5.50, 50, 2, '', 13, 13),
(84, 'Bolsa Leche Gloria Light', 'https://plazavea.vteximg.com.br/arquivos/ids/264379-450-450/94974.jpg?v=637086775013370000', 4.50, 50, 1, '', 13, 21),
(85, 'Tarro Leche Gloria Roja', 'https://cdn.joinnus.com/files/2020/05/PO6So8eTu0JoBSP.jpg', 3.80, 50, 1, '', 13, 21),
(86, 'Mantequilla Glo', 'https://chely.pe/wp-content/uploads/2020/04/Mantequilla-Gloria-pote-x-400-g.png', 9.50, 50, 2, '', 13, 22),
(87, 'Mayonesa Alacena', 'https://vivanda.vteximg.com.br/arquivos/ids/179150-618-618/994930.jpg?v=637006398811070000', 13.00, 50, 2, '', 14, 8),
(88, 'Polvo para Hornear', 'https://www.llevateloya.pe/1060-home_default/polvo-hornear-universal-sobre-x-25-gr.jpg', 1.50, 50, 2, '', 2, 13),
(89, 'Pomarola Molitalia', 'https://cdn.shopify.com/s/files/1/1534/3917/products/130016SalsaPomarolaMolitaliax160gr.png?v=1587346497', 2.20, 50, 2, '', 15, 10),
(90, 'Sal', 'https://plazavea.vteximg.com.br/arquivos/ids/197525-1000-1000/20130447.jpg?v=636621785258170000', 1.50, 50, 1, '', 2, 8),
(91, 'Spaghetti', 'https://www.perushop.com.pe/wp-content/uploads/2020/04/fid.don-vittorio-spag.-1kg-12bol_2.jpg', 3.60, 50, 1, '', 2, 10),
(92, 'Botellita Sillao', 'https://vivanda.vteximg.com.br/arquivos/ids/169979-618-618/20096654.jpg?v=636142105651270000', 2.20, 50, 2, '', 16, 10),
(93, 'Vainilla Escencial', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTEyFEGle4iZoqNzvytRh9Ln2aHQShxqUepyQ&usqp=CAU', 2.00, 50, 2, '', 2, 13),
(94, 'Vino tinto queirolo', 'https://oechsle.vteximg.com.br/arquivos/ids/1348289-1000-1000/image-b06128e953694b91aaacb191e7015d99.jpg?v=637122662403430000', 22.00, 50, 2, '', 17, 28);


CREATE TABLE `orden` (
  `idOrden` int(11) NOT NULL,
  `idEstado` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `fechaOrden` varchar(60) NOT NULL,
  `fechaEntrega` varchar(60) NOT NULL,
  `Comentario` varchar(200) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `PrecioTotal` decimal(6,2) NOT NULL,
  `idPago` int(11) NOT NULL,
  `bDescuento` tinyint(1) NOT NULL,
  `idConductor` int(11) DEFAULT NULL,
  `idUbicacion` int(11) NOT NULL,
  `idVendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `detallecarrito` (
  `idDetalleCarrito` int(11) NOT NULL,
  `idOrden` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `subTotal` decimal(6,2) NOT NULL,
  `cantProducto` int(11) NOT NULL,
  `TNote` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;





--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `conductor`
--
ALTER TABLE `conductor`
  ADD PRIMARY KEY (`idConductor`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`idContacto`);

--
-- Indices de la tabla `detallecarrito`
--
ALTER TABLE `detallecarrito`
  ADD PRIMARY KEY (`idDetalleCarrito`,`idOrden`,`idProducto`),
  ADD KEY `DetalleCarrito_Orden` (`idOrden`),
  ADD KEY `DetalleCarrito_Producto` (`idProducto`);

--
-- Indices de la tabla `diadescuento`
--
ALTER TABLE `diadescuento`
  ADD PRIMARY KEY (`idDiaDescuento`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `formapago`
--
ALTER TABLE `formapago`
  ADD PRIMARY KEY (`idPago`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idMarca`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`idOrden`),
  ADD KEY `Orden_Conductor` (`idConductor`),
  ADD KEY `Orden_Estado` (`idEstado`),
  ADD KEY `Orden_FormaPago` (`idPago`),
  ADD KEY `Orden_Ubicacion` (`idUbicacion`),
  ADD KEY `Orden_User` (`idUser`),
  ADD KEY `Orden_Vendedor` (`idVendedor`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `Producto_Marca` (`idMarca`),
  ADD KEY `Producto_SubCategoria` (`idSubCategoria`),
  ADD KEY `Producto_Unidad` (`idUnidad`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD PRIMARY KEY (`idSubCategoria`),
  ADD KEY `SubCategoria_Categoria` (`idCategoria`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`idUbicacion`),
  ADD KEY `Ubicacion_DiaDescuento` (`idDiaDescuento`);

--
-- Indices de la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD PRIMARY KEY (`idUnidad`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `User_Table_24` (`idRol`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`idVendedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detallecarrito`
--
ALTER TABLE `detallecarrito`
  MODIFY `idDetalleCarrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT de la tabla `diadescuento`
--
ALTER TABLE `diadescuento`
  MODIFY `idDiaDescuento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `formapago`
--
ALTER TABLE `formapago`
  MODIFY `idPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `idOrden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `idUbicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `unidad`
--
ALTER TABLE `unidad`
  MODIFY `idUnidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallecarrito`
--
ALTER TABLE `detallecarrito`
  ADD CONSTRAINT `DetalleCarrito_Orden` FOREIGN KEY (`idOrden`) REFERENCES `orden` (`idOrden`),
  ADD CONSTRAINT `DetalleCarrito_Producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `Orden_Conductor` FOREIGN KEY (`idConductor`) REFERENCES `conductor` (`idConductor`),
  ADD CONSTRAINT `Orden_Estado` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`),
  ADD CONSTRAINT `Orden_FormaPago` FOREIGN KEY (`idPago`) REFERENCES `formapago` (`idPago`),
  ADD CONSTRAINT `Orden_Ubicacion` FOREIGN KEY (`idUbicacion`) REFERENCES `ubicacion` (`idUbicacion`),
  ADD CONSTRAINT `Orden_User` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`),
  ADD CONSTRAINT `Orden_Vendedor` FOREIGN KEY (`idVendedor`) REFERENCES `vendedor` (`idVendedor`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `Producto_Marca` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`),
  ADD CONSTRAINT `Producto_SubCategoria` FOREIGN KEY (`idSubCategoria`) REFERENCES `subcategoria` (`idSubCategoria`),
  ADD CONSTRAINT `Producto_Unidad` FOREIGN KEY (`idUnidad`) REFERENCES `unidad` (`idUnidad`);

--
-- Filtros para la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD CONSTRAINT `SubCategoria_Categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`);

--
-- Filtros para la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD CONSTRAINT `Ubicacion_DiaDescuento` FOREIGN KEY (`idDiaDescuento`) REFERENCES `diadescuento` (`idDiaDescuento`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `User_Table_24` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`);
COMMIT;
