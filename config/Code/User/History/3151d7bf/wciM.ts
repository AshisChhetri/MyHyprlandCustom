import { Component, OnInit } from '@angular/core';
import { ITEMS } from '../shared/itemsdata';
import { Item } from '../shared/setupitem';
import { Route } from '@angular/router';
@Component({
  selector: 'app-navbar',
  standalone: true,
  imports: [],
  templateUrl: './navbar.component.html',
  styleUrl: './navbar.component.scss'
})
export class NavbarComponent{
  
  items: Item[] = ITEMS;

  selectedItem: Item | undefined;

  OnSelect(item: Item){
    this.selectedItem = item;
  }


}
