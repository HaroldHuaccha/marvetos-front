import { Component, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from "@angular/router";
import Swal from "sweetalert2";
import { ProductsService } from '../../services/products.service';
import { Products } from '../../model/products';
import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';

// import * as $ from 'jquery';
// import * as bootstrap from 'bootstrap';
// import { NgbModal, NgbModalRef } from '@ng-bootstrap/ng-bootstrap';
@Component({
  selector: 'app-editarproductos',
  templateUrl: './editarproductos.component.html',
  styleUrls: ['./editarproductos.component.css']
})
export class EditarproductosComponent implements OnInit {
  @ViewChild('closebutton', {static: true}) closebutton;
  products: Products = {
    idProducto : 0,
   // idCategoria : 0,
    name: '',
    image: '',
    precio: 0,
    stock: 0
  }
  paginaActual : 1;
  productos: any = [];

  contacto2: FormGroup;
  submitted = false;
  
  constructor(
    private productsService: ProductsService,
    private router: Router,
    private formBuilder: FormBuilder,
    private activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    this.getProducts();
    this.contacto2 = this.formBuilder.group({
        titulo: ['', Validators.required],
        descripcion: ['', Validators.required],
        precio: ['', [Validators.required, Validators.max(200)]],
        stock: ['', [Validators.required, Validators.min(10), Validators.max(500)]],
    });
  }

  get f() { return this.contacto2.controls; }

  getProducts() {
      this.productsService.getListProducts().subscribe(
        (res) => {
          this.productos = res;
        },
        (err) => console.error(err)
      );
      // this.submitted = false;
  }
  
  getOneProduct(prod: any) {
    this.products.idProducto = prod.idProducto;
    this.products.name = prod.name;
    this.products.precio = prod.precio;
    this.products.stock = prod.stock;
    this.products.descripcion = prod.descripcion;
    //this.products.idCategoria = prod.idCategoria;
    this.products.image = prod.image;
    this.products.idUnidad = prod.idUnidad;
  }
  
  putProducts(){

    this.submitted = true;

    if(this.contacto2.invalid){
      return;
    }

    Swal.fire({
      title: "¿Desea modificar el producto?",
      // text: "You won't be able to revert this!",
      icon: "warning",
      showCancelButton: true,
      cancelButtonText: "Cancelar",
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",

      confirmButtonText: "Confirmar",
    }).then((result) => {
      if (result.value) {
        this.productsService.putProducts(this.products.idProducto, this.products).subscribe(
        (res) => {

          this.getProducts();
          Swal.fire(
          "Producto Modificado",
          "El producto se modificó correctamente",
          "success"
        );
        this.closebutton.nativeElement.click();
        this.limpiar();
        },
        (err) => console.error(err)
        );
        
        
      }
      
      this.getProducts();

    });
    
  }

  limpiar(){
    this.submitted = false;
  }
  


}
