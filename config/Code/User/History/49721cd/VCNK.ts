import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { PurchaseDetailsComponent } from './purchase-details/purchase-details.component';
import { NavbarComponent } from "./navbar/navbar.component";

@Component({
    selector: 'app-root',
    standalone: true,
    templateUrl: './app.component.html',
    styleUrl: './app.component.scss',
    imports: [CommonModule, RouterModule, PurchaseDetailsComponent, NavbarComponent]
})
export class AppComponent {
  title = 'E-Commerce';
}
