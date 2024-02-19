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
navigateTo(arg0: string|undefined) {
throw new Error('Method not implemented.');
}
  
  items: Item[] = ITEMS;

  selectedItem: Item | undefined;

  OnSelect(item: Item){
    this.selectedItem = item;
  }


}
