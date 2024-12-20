% Hechos de Productos
producto(1, 'Laptop', 1200.50).
producto(2, 'Smartphone', 850.00).
producto(3, 'Tablet', 600.25).
producto(4, 'Auriculares', 150.75).
producto(5, 'Monitor', 300.99).

% Hechos de Vendedores
vendedor(1, 'Juan Pérez', 'Norte').
vendedor(2, 'María López', 'Sur').
vendedor(3, 'Carlos Gómez', 'Este').
vendedor(4, 'Ana Ramírez', 'Oeste').
vendedor(5, 'Luis Torres', 'Centro').

% Hechos de Ventas
venta(1, 1, 3, '2024-12-01').
venta(2, 2, 5, '2024-12-02').
venta(3, 3, 2, '2024-12-03').
venta(4, 4, 10, '2024-12-04').
venta(5, 5, 1, '2024-12-05').
venta(6, 1, 2, '2024-12-06').
venta(7, 3, 4, '2024-12-07').
venta(8, 2, 3, '2024-12-08').
venta(9, 5, 6, '2024-12-09').
venta(10, 4, 7, '2024-12-10').

% 1.- Ingresos totales generados por cada producto
ingresosTotalesProducto(Nombre, IngresosTotales) :-
    producto(IDProducto, Nombre, Precio),
    findall(Cantidad, venta(_, IDProducto, Cantidad, _), Cantidades),
    sum_list(Cantidades, TotalCantidad),
    IngresosTotales is TotalCantidad * Precio.

% 2.- Cinco fechas con mayor cantidad de ventas
ventasPorFecha(Fecha, TotalVentas) :-
    findall(Cantidad, venta(_, _, Cantidad, Fecha), Cantidades),
    sum_list(Cantidades, TotalVentas).

topFechasVentas(Fechas) :-
    findall([Fecha, TotalVentas], ventasPorFecha(Fecha, TotalVentas), Lista),
    sort(2, @>=, Lista, FechasOrdenadas),
    length(FechasOrdenadas, L),
    take(5, FechasOrdenadas, Fechas).

% Predicado auxiliar para tomar las primeras N entradas de una lista
take(0, _, []).
take(N, [X|Xs], [X|Ys]) :- N > 0, N1 is N - 1, take(N1, Xs, Ys).

% 3.- Lista de productos vendidos por un vendedor (X)
productosVendidosPorVendedor(IDVendedor, Nombre, Cantidad) :-
    venta(_, IDProducto, Cantidad, _),
    producto(IDProducto, Nombre, _),
    vendedor(IDVendedor, _, _).

% 4.- Vendedores con cero ventas
vendedoresSinVentas(Nombre) :-
    vendedor(IDVendedor, Nombre, _),
    \+ venta(_, IDVendedor, _, _).

% 5.- Región con mayor ingresos
ingresosPorRegion(Region, IngresosTotales) :-
    vendedor(IDVendedor, _, Region),
    findall(Ingreso, (venta(_, IDProducto, Cantidad, _), producto(IDProducto, _, Precio), Ingreso is Cantidad * Precio), Ingresos),
    sum_list(Ingresos, IngresosTotales).

topRegion(Region) :-
    findall([Region, IngresosTotales], ingresosPorRegion(Region, IngresosTotales), Lista),
    sort(2, @>=, Lista, [Region|_]).

% 6.- Vendedores con más de X ventas totales
ventasTotalesVendedor(IDVendedor, TotalVentas) :-
    findall(Cantidad, venta(_, IDVendedor, Cantidad, _), Cantidades),
    sum_list(Cantidades, TotalVentas).

vendedoresConVentasMayoresQue(X, Nombre) :-
    vendedor(IDVendedor, Nombre, _),
    ventasTotalesVendedor(IDVendedor, TotalVentas),
    TotalVentas > X.

% 7.- Cantidad de ventas de productos por región
ventasPorRegionProducto(Producto, Region, TotalCantidad) :-
    producto(IDProducto, Producto, _),
    vendedor(IDVendedor, _, Region),
    findall(Cantidad, venta(_, IDProducto, Cantidad, _), Cantidades),
    sum_list(Cantidades, TotalCantidad).

% 8.- Las regiones donde se vendió X producto
regionesProducto(IDProducto, Regiones) :-
    findall(Region, (venta(_, IDProducto, _, _), vendedor(IDVendedor, _, Region), venta(_, IDProducto, _, _)), RegionesUnicas),
    list_to_set(RegionesUnicas, Regiones).

% 9.- Vendedores que solo han hecho ventas en X región
vendedoresRegionUnica(Region, Nombre) :-
    vendedor(IDVendedor, Nombre, Region),
    \+ (venta(_, IDProducto, _, _), vendedor(IDVendedor, _, OtraRegion), OtraRegion \= Region).

% 10.- Ventas donde se superaron ingresos de 2,000 por producto vendido
ventasMayoresQue2000(IDVenta, Producto, Vendedor, Ingresos) :-
    venta(IDVenta, IDProducto, Cantidad, _),
    producto(IDProducto, Producto, Precio),
    vendedor(IDVendedor, Vendedor, _),
    Ingresos is Cantidad * Precio,
    Ingresos > 2000.