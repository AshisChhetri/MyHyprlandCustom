import { Component, OnInit } from '@angular/core';
import { ITEMS } from '../shared/itemsdata';
import { Item } from '../shared/setupitem';
import { Subitem } from '../shared/subitem';
import { RouterLink, RouterLinkActive, RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-navbar',
  standalone: true,
  imports: [ RouterOutlet,RouterLink,RouterLinkActive],
  templateUrl: './navbar.component.html',
  styleUrl: './navbar.component.scss'
})
export class NavbarComponent{

  items: Item[] = ITEMS;

  selectedItem: Item | undefined;
  router: any;

  OnSelect(item: Item){
    this.selectedItem = item;
  }
  navigateTo(subitem: Subitem | undefined) {
    if(subitem?.id=='0'){
      this.router.navigate()
    }
  }


}