/*
Nombre Completo: Darien Damery Velásquez Vielman
Clase: Taller II
Código Técnico: IN5AV
Fecha de Creación: 01-02-2022
Fecha de Modificación: 04-02-2022

*/
Drop database if exists DBSportStore2021489;
Create database DBSportStore2021489;

Use DBSportStore2021489;

Create table Categorias(
    codigoCategoria int not null auto_increment,
	descripcion varchar(150) not null,
	primary key PK_codigoCategoria (codigocategoria)
);

Create table Marcas(
	codigoMarca int not null auto_increment,
	descripcion varchar(150) not null,
	primary key PK_codigoMarca (codigoMarca)
);

Create table Tallas(
	codigoTalla int not null auto_increment,
	descripcion varchar(150) not null,
	primary key PK_codigoTalla (codigoTalla)
);

Create table Productos(
	codigoProducto int not null auto_increment,
	descripcion varchar(150) not null,
	existencia int not null,
	precioUnitario decimal (10,2) not null default 0.00, -- 40%
	precioPorDocena decimal (10,2) not null default 0.00, -- 35% 
	PrecioPorMayor decimal(10,2) not null default 0.00, -- 25%
	codigoCategoria int not null,
	codigoMarca int not null,
	codigoTalla int not null,
	primary key PK_codigoProducto(codigoProducto),
	constraint FK_Productos_Categorias foreign key (codigoCategoria)
		references Categorias(codigoCategoria),
	constraint FK_Productos_Marcas foreign key (codigoMarca)
		references Marcas(codigoMarca),
	constraint FK_Productos_Tallas foreign key (codigoTalla)
		references Tallas(codigoTalla)
);

-- ---------------- Procedimiento AgregarCategoria ----------------
Delimiter $$
	Create procedure sp_AgregarCategoria(in descripcion varchar(150))
		Begin
			Insert into Categorias (descripcion)
				values(descripcion);
		End$$
Delimiter ;

call sp_AgregarCategoria('Ropa de dama');
call sp_AgregarCategoria('Ropa de caballero');
call sp_AgregarCategoria('Ropa de bebé');
call sp_AgregarCategoria('Ropa de niño');
call sp_AgregarCategoria('Ropa deportiva');
call sp_AgregarCategoria('Ropa artística');


-- ------------------ Procedimiento ListarCategoria ------------------
Delimiter $$
	Create procedure sp_ListarCategoria()
		Begin 
			Select
				C.codigoCategoria,
                C.descripcion
                from Categorias C;
		End$$
Delimiter ;

call sp_ListarCategoria();
call sp_ListarCategoria;

-- ---------------- Procedimeinto BuscarCategoria ----------------

Delimiter $$
	Create procedure sp_BuscarCategoria(in codCat int )
		Begin
			Select 
				C.codigoCategoria,
                C.descripcion
				From Categorias C where codigoCategoria = codCat;
		End$$
Delimiter ;

call sp_BuscarCategoria(5);

-- --------------- Procedimiento EliminarCategoria -----------------

Delimiter $$
	Create procedure sp_EliminarCategoria(in codCat int)
		Begin
			Delete From Categorias 
				where codigoCategoria = codCat;
		End$$
Delimiter ;

call sp_EliminarCategoria(6);
call sp_ListarCategoria();

-- --------------- Procedimiento EditarCategoria -----------------

Delimiter $$ 
	Create procedure sp_EditarCategoria(in codCat int, in descr varchar(150))
		Begin 
			update Categorias C 
				set descripcion =descr
                where codigoCategoria = codCat;
        End$$

Delimiter ;

call sp_EditarCategoria(2, 'Ropa de caballero');
call sp_ListarCategoria();

-- --------------- Procedimiento AgregarMarcas -----------------

Delimiter $$
	Create procedure sp_AgregarMarca(in descripcion varchar(150))
		Begin
			Insert into Marcas (descripcion)
				values(descripcion);
		End$$
Delimiter ;

call sp_AgregarMarca('Givenchy');
call sp_AgregarMarca('Balmain');
call sp_AgregarMarca('kiabi');
call sp_AgregarMarca('Carter´s');
call sp_AgregarMarca('Adidas');
call sp_AgregarMarca('Velmost');


-- ----------------- Procedimiento ListarMarcas -------------
Delimiter $$
	Create procedure sp_ListarMarcas()
		Begin 
			Select
				M.codigoMarca,
                M.descripcion
                from Marcas M;
		End$$
Delimiter ;

call sp_ListarMarcas();

-- ------------ Procedimiento BuscarMarcas ---------------------

Delimiter $$
	Create procedure sp_BuscarMarca(in codMarc int )
		Begin
			Select 
				m.codigoMarca,
                m.descripcion
				From Marcas m where codigoMarca = codMarc;
		End$$
Delimiter ;

call sp_BuscarMarca(3);

-- --------------- Procedimiento EliminarMarcas -----------------

Delimiter $$
	Create procedure sp_EliminarMarca(in codMarc int)
		Begin
			Delete From Marcas 
				where codigoMarca = codMarc;
		End$$
Delimiter ;

call sp_EliminarMarca(5);
call sp_ListarMarcas();

-- --------------- Procedimiento EditarMarcas -----------------

Delimiter $$ 
	Create procedure sp_EditarMarca(in codMarc int, in descr varchar(150))
		Begin 
			update Marcas
				set descripcion =descr
                where codigoMarca = codMarc;
        End$$

Delimiter ;

call sp_EditarMarca(4, 'Zara');
call sp_ListarMarcas();

-- --------------- Procedimiento AgregarTallas -----------------

Delimiter $$
	Create procedure sp_AgregarTalla(in descripcion varchar(150))
		Begin
			Insert into Tallas (descripcion)
				values(descripcion);
		End$$
Delimiter ;

call sp_AgregarTalla('XXL');
call sp_AgregarTalla('M');
call sp_AgregarTalla('X');
call sp_AgregarTalla('L');
call sp_AgregarTalla('XL');
call sp_AgregarTalla('XX');


-- ------------------ Procedimiento ListarTalla -----------------
Delimiter $$
	Create procedure sp_ListarTallas()
		Begin 
			Select
				t.codigoTalla,
                t.descripcion
                from Tallas t;
		End$$
Delimiter ;

call sp_ListarTallas();

-- ------------ Procedimiento BuscarTallas ---------------------

Delimiter $$
	Create procedure sp_BuscarTalla(in codTalla int )
		Begin
			Select 
				t.codigoTalla,
                t.descripcion
				From Tallas t where codigoTalla = codTalla;
		End$$
Delimiter ;

call sp_BuscarTalla(2);

-- --------------- Procedimiento EliminarTallas -----------------

Delimiter $$
	Create procedure sp_EliminarTalla(in codTalla int)
		Begin
			Delete From Tallas 
				where codigoTalla = codTalla;
		End$$
Delimiter ;

call sp_EliminarTalla(3);
call sp_ListarTallas();

-- --------------- Procedimiento EditarTallas -----------------

Delimiter $$ 
	Create procedure sp_EditarTalla(in codTalla int, in descr varchar(150))
		Begin 
			update Tallas
				set descripcion =descr
                where codigoTalla = codTalla;
        End$$

Delimiter ;

call sp_EditarTalla(4,'XL');
call sp_ListarTallas();

-- --------------- Procedimiento AgregarProductos -------------------

Delimiter $$
	Create procedure sp_AgregarProducto(in descripcion varchar(150), in existencia int, in codigoCategoria int, 
    in codigoMarca int, in codigoTalla int)
		Begin
			Insert into Productos (descripcion, existencia, codigoCategoria, codigoMarca, codigoTalla)
				values(descripcion, existencia, codigoCategoria, codigoMarca, codigoTalla);
		End$$
Delimiter ;

call sp_AgregarProducto('Vestido',5,1,1,1);
call sp_AgregarProducto('Camisa rayada',7,2,2,2);
call sp_AgregarProducto('Pijama',1,4,6,4);
call sp_AgregarProducto('Pantaloneta deportiva',3,4,4,4);
call sp_AgregarProducto('Sombrero',2,1,3,1);
call sp_AgregarProducto('Pantalon de lona',1,2,3,2);



select * from Productos;
-- --------- Procedimiento ListarProductos --------------

Delimiter $$
	Create procedure sp_ListarProductos()
		Begin 
			Select
				P.codigoProducto,
                P.descripcion,
				P.existencia,
				P.codigoCategoria,
				P.codigoMarca,
				P.codigoTalla
                from Productos P;
		End$$
Delimiter ;

call sp_ListarProductos();

-- ------------ Procedimiento BuscarProductos ---------------------

Delimiter $$
	Create procedure sp_BuscarProducto(in codProducto int )
		Begin
			Select 
				P.codigoProducto,
                P.descripcion,
				P.existencia,
				P.codigoCategoria,
				P.codigoMarca,
				P.codigoTalla
                from Productos P where codigoProducto = codProducto;
		End$$
Delimiter ;

call sp_BuscarProducto(3);

-- --------------- Procedimiento EliminarProductos -----------------

Delimiter $$
	Create procedure sp_EliminarProducto(in codProducto int)
		Begin
			Delete From Productos 
				where codigoProducto = codProducto;
		End$$
Delimiter ;

call sp_EliminarProducto(4);
call sp_ListarProductos();

-- --------------- Procedimiento EditarProductos -----------------

Delimiter $$ 
	Create procedure sp_EditarProducto(in codProducto int, in descr varchar(150), in existe int, in codCategoria int, in codMarca int, in codTalla int)
		Begin 
			update Productos
				set descripcion =descr, existencia = existe, codigoCategoria= codCategoria, codigoMarca = codMarca, codigoTalla= codTalla
                where codigoProducto = codProducto;
        End$$

Delimiter ;

call sp_EditarProducto(2,'Sueter',13,2,4,6);
call sp_ListarProductos();


-- --------- Procedimiento PrecioUnitario --------------------- 
Delimiter $$
	Create procedure sp_PrecioUnidad()
		begin 
			update Productos P
				set P.PrecioUnitario = (200*0.4)+200
					where codigoProducto = 1;
			update Productos P
				set P.PrecioUnitario = (170*0.4)+170
					where codigoProducto = 2;
			update Productos P
				set P.PrecioUnitario = (130*0.4)+130
					where codigoProducto = 3;
			update Productos P
				set P.PrecioUnitario = (220*0.4)+220
					where codigoProducto = 6;
			update Productos P
				set P.PrecioUnitario = (360*0.4)+360
					where codigoProducto = 5;
			end $$
Delimiter ;
call sp_PrecioUnidad();

-- --------- Procedimiento PrecioPorDocena --------------------- 
Delimiter $$
	Create procedure sp_PrecioPorDocena()
		begin 
			update Productos P
				set P.PrecioPorDocena = (200*0.35)+200
					where codigoProducto = 1;
			update Productos P
				set P.PrecioPorDocena = (170*0.35)+170
					where codigoProducto = 2;
			update Productos P
				set P.PrecioPorDocena = (130*0.35)+130
					where codigoProducto = 3;
			update Productos P
				set P.PrecioPorDocena = (220*0.35)+220
					where codigoProducto = 6;
			update Productos P
				set P.PrecioPorDocena = (360*0.35)+360
					where codigoProducto = 5;
			end $$
Delimiter ;
call sp_PrecioPorDocena();

-- ----------------- Procedimiento PrecioPorMayor ------------------
Delimiter $$
	Create procedure sp_PrecioPorMayor()
		begin 
			update Productos P
				set P.PrecioPorMayor = (200*0.25)+200
					where codigoProducto = 1;
			update Productos P
				set P.PrecioPorMayor = (170*0.25)+170
					where codigoProducto = 2;
			update Productos P
				set P.PrecioPorMayor = (130*0.25)+130
					where codigoProducto = 3;
			update Productos P
				set P.PrecioPorMayor = (220*0.25)+220
					where codigoProducto = 6;
			update Productos P
				set P.PrecioPorMayor = (360*0.25)+360
					where codigoProducto = 5;
			end $$
Delimiter ;
call sp_PrecioPorMayor();

select * from Productos;
