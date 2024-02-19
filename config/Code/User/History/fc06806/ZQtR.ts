import { Routes } from '@angular/router';
import { PurchaseDetailsComponent } from './purchase-details/purchase-details.component';
import { ReservationsComponent } from './trans/front/reservations/reservations.component';

export const routes: Routes = [
    {path: 'purchase_details', component: PurchaseDetailsComponent},
    {path: 'reservations', component: ReservationsComponent}
];
