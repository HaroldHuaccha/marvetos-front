import { Component, OnInit } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";

//Services
import { ProductsService } from "../../services/products.service";
import { LoginService } from "../../services/login.service";
import { LocalstorageService } from "../../services/localstorage.service";
import { AllService } from "../../services/all.service";

//Componentes
import { HeaderComponent } from "../header/header.component";
import { EmailConfirmationService } from "../../services/email-confirmation.service";

//Models
import { Products } from "../../model/products";
import { Categoria } from "../../model/categoria";
import { Distrito } from "../../model/distrito";
import { DetalleCarrito } from "../../model/detallecarrito";
import { Orden } from "../../model/orden";

//Alert's - Notifications
import Swal from "sweetalert2";
import { THIS_EXPR } from "@angular/compiler/src/output/output_ast";

@Component({
  selector: "app-shoppingcar",
  templateUrl: "./shoppingcar.component.html",
  styleUrls: ["./shoppingcar.component.css"],
})
export class ShoppingcarComponent implements OnInit {
  //Carrito
  carrito: any = [];
  cantProducto: any = [];
  suma: any = 0;
  resultadoTotal: number = 0;
  datoNota: any = "";
  //Distritos
  getDistrito: any = [];
  Distritos: any = [];
  nameDistrito = "";
  index = 0;
  arregloNota: any=[];
  tnote="";
  //Comentario y Direccion
  direccion = "";
  comentario = "";

  //FormaPago
  pago: any = [];
  idPago = 0;
  
  iDDUbicacion = 0;

  //Vendedores
  vendedores: any = [];
  idVendG = 0;

  //Delivery
  CostDelivery: boolean = false;
  descuentoShow: boolean = false;
  Descuento = "25%";
  DeliveryPrecio: number = 0;
  DescuentoTotal: number = 0;

  //Objetos DetalleCarrito y Orden
  Objdetallecarrito = {
    idDetalleCarrito: 0,
    idOrden: 0,
    idProducto: 0,
    subTotal: 0,
    cantProducto: 0,
    TNote: "",
  };

  obj_or = {
    idOrden: 0,
    idEstado: 0,
    idConductor: 0,
    idVendedor: 0,
    idUser: 0,
    fechaOrden: "",
    fechaEntrega: "",
    Comentario: "",
    Direccion: "",
    PrecioTotal: 1,
    idPago: 1,
    idUbicacion: 1,
    bDescuento: 0,
  };

  getCantxProducto() {
    /*  OBJETOS DE LOS PRODUCTOS AGREGADOS EN EL LOCALSTORAGE CON SU CANTIDAD  */
    this.carrito = JSON.parse(localStorage.getItem("carrito"));

    var getObject = (id) => {
      for (let i = 0; i < this.carrito.length; i++) {
        if (id === this.carrito[i].idProducto) {
          return this.carrito[i];
        }
      }
    };

    /* Arreglo carrito con contador */
    const group = (arr) => {
      const reduced = arr.reduce((acc, curr) => {
        const text = curr.idProducto;
        acc[text] = acc[text] || 0;
        acc[text]++;
        return acc;
      }, {});

      return Object.getOwnPropertyNames(reduced).map((prop) => ({
        producto: getObject(parseInt(prop)),
        count: reduced[prop],
      }));
    };

    var grouped = group(this.carrito);
    console.log(JSON.stringify(grouped, null, 4));
    (this.cantProducto = grouped), null, 4;
  }

  //Inicio del constructor
  constructor(
    private productsService: ProductsService,
    private router: Router,
    private activtedRoute: ActivatedRoute,
    private loginservice: LoginService,
    private emailservice: EmailConfirmationService,
    private localstorageservice: LocalstorageService,
    private allService: AllService
  ) {
    //Get products from localstorage
    this.getCantxProducto();

    //getSubtotal
    for (let i = 0; i < this.cantProducto.length; i++) {
      this.suma =
        this.suma +
        this.cantProducto[i].producto.precio * this.cantProducto[i].count;
        this.resultadoTotal =this.suma; 
    }

    //Get data "Forma de Pago"
    this.productsService.getFormaPago().subscribe(
      (res) => {
        this.pago = res;
      },
      (err) => {
        console.log(err);
      }
    );

    //Get data "Distritos"
    this.productsService.getDistritos().subscribe(
      (res) => {
        this.Distritos = res;
      },
      (err) => {
        console.log(err);
      }
    );

    //Get Vendores
    this.allService.getVendedores().subscribe(
      (res) => {
        this.vendedores = res;
      },
      (err) => {
        console.log(err);
      }
    );
    //Promesa
    this.Vendedores();

    console.log(this.idVendG);
  }

  async Vendedores() {
    var dataD = await this.allService.getVendedores().toPromise();
    var min = 0;
    var max = JSON.parse(JSON.stringify(dataD)).length - 1;
    var random = Math.floor(Math.random() * (+max + 1 - +min)) + +min;
    this.idVendG = this.vendedores[random].idVendedor;
  }

  ngOnInit() {}

  hayDescuento(p_list, dia, distrito) {
    for (let i = 0; i < p_list.length; i++) {
      if (p_list[i].name == dia) {
        if (p_list[i].Distrito == distrito) {
          return true;
          break;
        }
      }
    }
    return false;
  }

  onEditClickDistrito(skill: any) {
    
    this.nameDistrito = skill;
    if(skill ==  ''){
      this.CostDelivery = false;
      this.descuentoShow = false;
    }else{
      this.CostDelivery = true;
    
    //Costo delivery e idDistrito
    for (let i = 0; i < this.Distritos.length; i++) {
      if (this.Distritos[i].Distrito == skill) {
        this.iDDUbicacion = this.Distritos[i].idUbicacion;
        this.DeliveryPrecio = this.Distritos[i].Precio;

        console.log(this.DeliveryPrecio);
      }
    }
    this.DescuentoTotal = this.DeliveryPrecio * 0.25;
    //Distritos
    this.productsService.getDescuentos().subscribe(
      (res) => {
        var diasSemana = [
          "Domingo",
          "Lunes",
          "Martes",
          "Miércoles",
          "Jueves",
          "Viernes",
          "Sábado",
        ];
        var f = new Date();
        var b_Discount = this.hayDescuento(
          res,
          diasSemana[f.getDay()],
          this.nameDistrito
        );
        /*         console.log("Hay descuento?");
        console.log(b_Discount); */
        
        b_Discount == true
          ? (this.descuentoShow = true)
          : (this.descuentoShow = false);

        b_Discount == true
          ? (this.resultadoTotal =
              this.DeliveryPrecio*0.75 +
              (this.suma))
          : (this.resultadoTotal =
              this.suma + this.DeliveryPrecio).toFixed(2);
      },
      (err) => {
        console.log(err);
      }
    );
    }
  }

  onEditClick(skill: any) {
    this.idPago = skill;
  }

  //Recargar componente
  reloadComponent() {
    this.router.routeReuseStrategy.shouldReuseRoute = () => false;
    this.router.onSameUrlNavigation = "reload";
    this.router.navigate(["/carrito"]);
  }

  //CRUD Products on LocalStorage
  limpiarCarrito() {
    Swal.fire({
      title: "Estas seguro que quieres vaciar los producto del carrito?",

      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Si, estoy seguro",
    }).then((result) => {
      if (result.value) {
        this.localstorageservice.limpiarCarrito();
        this.reloadComponent();
        this.router.navigateByUrl("/productos");
        Swal.fire("Carrito Eliminado", "", "success");
      }
    });
  }
  eliminarProducto(id: number) {
    this.localstorageservice.eliminarProducto(id);
    this.reloadComponent();
  }
  disminuirCant(id: number) {
    this.localstorageservice.disminuirCant(id);
    this.reloadComponent();
  }
  AumentarCant(id: number) {
    this.localstorageservice.AumentarCant(id);
    this.reloadComponent();
  }

  //Determinar aleatorio vendedor

  //Alert's
  alertContinue(pText, pTitle) {
    Swal.fire({
      text: pText,
      title: pTitle,
      icon: "warning",
      confirmButtonColor: "#3085d6",
      confirmButtonText: "Lo entiendo",
    }).then((result) => {
      if (result.value) {
      }
    });
  }
  async alertConfirmBuy() {
    var respuesta = "";
    await Swal.fire({
      title: "¿Deseas confirmar la comprar?",
      text: "Estas a un paso de tu proxima compra!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Si,Comprar!",
    }).then((result) => {
      respuesta = String(result.value);
    });

    return respuesta;
  }

  //Send Email
  Mailto(pEmail: string, idOrder: number) {
    //Objet with address and district
    // var ObjEmail = {
    //   email: pEmail,
    //   direccion: this.direccion,
    //   distrito: this.nameDistrito,
    //   Orden: idOrder,
    // };
    // this.emailservice.sendEmailConfirmation(ObjEmail).subscribe(
    //   (res) => {
    //     console.log("Resultado email confirmacion");
    //     console.log(res);
    //   },
    //   (err) => {
    //     console.log(err);
    //   }
    // );
  }

  //Save Orden and DetailOrder
  async AgregarOrden() {
    //Validaciones
    if(this.loginservice.getToken() == ""){
      this.alertContinue("Debes ingresar con una cuenta!", "Lo sentimos");
    }
     else if (this.resultadoTotal < 80.0) {
      this.alertContinue("Minimo de precio S/. 80.00", "Lo sentimos");
    } else if (this.nameDistrito == "" || this.idPago == 0) {
      this.alertContinue("Distrito y/o pago no seleccionado.", "Lo sentimos");
    } else if (this.comentario == "" || this.direccion == "") {
      this.alertContinue(
        "Direccion y/o Comentario no ingresados.",
        "Lo sentimos"
      );
    }else {
        //Get Data Login
        var dataLoginToken = await this.loginservice.givemeData(
          this.loginservice.getToken()
        );
        //wait for response (true buy or undefined)
        var data = "";
        data = await this.alertConfirmBuy();

        //True Buy -> Confirm order
        if (data == "true") {
          //Save order
          await this.SaveOrder(dataLoginToken);

          //Get Last ID
          var lastid = await this.lastIDOrder();

          //Save Details order
          for (let index = 0; index < this.cantProducto.length; index++) {
            this.Objdetallecarrito.idDetalleCarrito = 1;
            this.Objdetallecarrito.idOrden = parseInt(lastid);
            this.Objdetallecarrito.idProducto = this.cantProducto[index][
              "producto"
            ].idProducto;

            this.Objdetallecarrito.TNote = this.arregloNota[index];
            console.log(this.Objdetallecarrito.TNote);
            this.Objdetallecarrito.subTotal =
              this.cantProducto[index]["producto"].precio *
              this.cantProducto[index]["count"];
            this.Objdetallecarrito.cantProducto = this.cantProducto[index][
              "count"
            ];

            delete this.Objdetallecarrito.idDetalleCarrito;

            //Save DetailsProducts on DB

            await this.productsService
              .postDetalleCarrito(this.Objdetallecarrito)
              .toPromise();
          }

          //Eliminar carrito del localstorage
          this.localstorageservice.limpiarCarrito();

          //Send Email
          // this.Mailto(dataLoginToken.email, lastid + 1);
          Swal.fire(
            "Comprado!",
            "Se realizó la compra correctamente",
            "success"
          );

          //Redirecting
          this.router.navigateByUrl(
            `/orden/confirmacion/${this.Objdetallecarrito.idOrden}`
          );
        }
     
    }
  }

  comprarProducto() {
    this.router.navigateByUrl("/productos");
  }

  async SaveOrder(pdataLoginToken) {
    this.obj_or.idOrden = 1;
    this.obj_or.idEstado = 1;
    this.obj_or.idConductor = null;
    this.obj_or.idVendedor = this.idVendG;
    this.obj_or.idUser = parseInt(pdataLoginToken.id);
    this.obj_or.fechaOrden = String(new Date());
    this.obj_or.fechaEntrega = "";
    this.obj_or.Comentario = this.comentario;
    this.obj_or.Direccion = this.direccion;
    this.obj_or.PrecioTotal = this.resultadoTotal;
    this.obj_or.idPago = this.idPago;
    this.obj_or.idUbicacion = this.iDDUbicacion;
    this.obj_or.bDescuento = 0;
    
    console.log(this.Objdetallecarrito.TNote);
    delete this.obj_or.fechaEntrega;

    delete this.obj_or.idOrden;

    //Save Order on DB
    var rsp = await this.productsService.postOrden(this.obj_or).toPromise();
  }

  async lastIDOrder() {
    var data = await this.productsService.getUltimoID().toPromise();

    return data[0]["max(idOrden)"];
  }

  asignarNota(ind, valor){
    this.arregloNota[ind] = valor.target.value;
   
    console.log(this.arregloNota);
    console.log(ind);
    
  }

}
