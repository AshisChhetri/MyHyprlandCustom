import { Component, OnInit } from '@angular/core';
import { ITEMS } from '../shared/itemsdata';
import { Item } from '../shared/item';
import { Subitem } from '../shared/subitem';
import { Router,RouterLink, RouterLinkActive, RouterOutlet } from '@angular/router';
import { Inventory, food_n_Bav, frontRoutes } from '../app.routes';


@Component({
  selector: 'app-navbar',
  standalone: true,
  imports: [ RouterOutlet,RouterLink,RouterLinkActive],
  templateUrl: './navbar.component.html',
  styleUrl: './navbar.component.scss'
})
export class NavbarComponent{
  constructor(private router: Router) {}

  items: Item[] = ITEMS;

  selectedItem: Item | undefined;


  OnSelect(item: Item){
    this.selectedItem = item;
  }
  navigateTo(subitem: Subitem | undefined,id:any | undefined) {
    if(subitem!=null && subitem.id >=0 && id==0){
      const routePath=frontRoutes[subitem.id].path
      this.router.navigate([routePath]);
    } 
    else if(subitem!=null && subitem.id >=0 && id==1){
      const routePath=food_n_Bav[subitem.id].path
      this.router.navigate([routePath]);
    }
    else if(subitem!=null && subitem.id >=0 && id==2){
      const routePath=Inventory[subitem.id].path
      this.router.navigate([routePath]);
    }
    else{
    console.error('Invalid route Link..');
    }
  }


}
