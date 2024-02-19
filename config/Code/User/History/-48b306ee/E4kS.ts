import { Component } from '@angular/core';
import { array1 } from '../app.routes';
import { Router } from 'express';
@Component({
  selector: 'app-home',
  standalone: true,
  imports: [],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeComponent {
 array1=array1;
}
