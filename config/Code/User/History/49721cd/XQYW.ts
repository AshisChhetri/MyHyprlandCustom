import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink, RouterLinkActive, RouterModule, RouterOutlet } from '@angular/router';
import { PurchaseDetailsComponent } from './purchase-details/purchase-details.component';
import { NavbarComponent } from "./navbar/navbar.component";
import { OptionsComponent } from "./options/options.component";
import { ReservationsComponent } from "./trans/front/reservations/reservations.component";

@Component({
    selector: 'app-root',
    standalone: true,
    templateUrl: './app.component.html',
    styleUrl: './app.component.scss',
    imports: [CommonModule, RouterModule,PurchaseDetailsComponent, NavbarComponent, OptionsComponent, ReservationsComponent]
})
export class AppComponent {
  title = 'E-Commerce';
}
