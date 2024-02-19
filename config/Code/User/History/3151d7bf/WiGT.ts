import { Component, OnInit } from '@angular/core';
import { ITEMS } from '../shared/itemsdata';
import { Item } from '../shared/setupitem';
import { Subitem } from '../shared/subitem';
import { Router,RouterLink, RouterLinkActive, RouterOutlet } from '@angular/router';
import { frontRoutes } from '../app.routes';


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
  navigateTo(subitem: Subitem | undefined) {
    if(subitem!=null && subitem.id >=0){
      const routePath=frontRoutes[subitem.id].path
      this.router.navigate([routePath]);
    } else{
    console.error('Invalid route Link..');
    }
  }


}
