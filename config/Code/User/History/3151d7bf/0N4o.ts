import { Component, OnInit } from '@angular/core';
import { ITEMS } from '../shared/itemsdata';
import { Item } from '../shared/item';
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


  navigateTo(selectedItem: Item | undefined) {
    if(subitem!=null && subitem.id >=0){
      const routePath=frontRoutes[subitem.id].path
      this.router.navigate([routePath]);
    } else{
    console.error('Invalid route Link..');
    }
  }


}
