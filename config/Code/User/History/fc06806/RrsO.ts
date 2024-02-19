import { Routes } from '@angular/router';
import { PurchaseDetailsComponent } from './purchase-details/purchase-details.component';
import { ReservationsComponent } from './trans/front/reservations/reservations.component';
import { CheckInComponent } from './trans/front/check-in/check-in.component';
import { RoomRackComponent } from './trans/front/room-rack/room-rack.component';
import { OptionsComponent } from './options/options.component';

export const routes: Routes = [
    {path: 'reservations', component: ReservationsComponent},
    {path: 'purchase_details', component: PurchaseDetailsComponent},
    
    {path: 'checkIn', component: CheckInComponent},
    {path: 'roomRack',component:RoomRackComponent},
    {path:'',component: OptionsComponent}
];
