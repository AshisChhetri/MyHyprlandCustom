import { Routes } from '@angular/router';
import { PurchaseDetailsComponent } from './purchase-details/purchase-details.component';
import { ReservationsComponent } from './trans/front/reservations/reservations.component';
import { CheckInComponent } from './trans/front/check-in/check-in.component';
import { RoomRackComponent } from './trans/front/room-rack/room-rack.component';
import { OptionsComponent } from './options/options.component';
import { FbSalesComponent } from './trans/food-Bav/fb-sales/fb-sales.component';
import { TableRackComponent } from './trans/food-Bav/table-rack/table-rack.component';
import { SalesHistoryComponent } from './trans/food-Bav/sales-history/sales-history.component';
import { FNBViewComponent } from './trans/food-Bav/f-n-b-view/f-n-b-view.component';
import { CancellationsComponent } from './trans/food-Bav/cancellations/cancellations.component';
import { CreditsBillsComponent } from './trans/food-Bav/credits-bills/credits-bills.component';
import { CashReceiptComponent } from './trans/food-Bav/cash-receipt/cash-receipt.component';
import { CashPaymentComponent } from './trans/food-Bav/cash-payment/cash-payment.component';

export const frontRoutes: Routes = [
    {path: 'reservations', component: ReservationsComponent},
    {path: 'roomRack',component:RoomRackComponent},
    {path: 'checkIn', component: CheckInComponent},
    {path: 'purchase_details', component: PurchaseDetailsComponent},
    {path:'',component: OptionsComponent},
];
export const food_n_Bav: Routes =[
    {path:'FB Sales',component:FbSalesComponent},
    {path:'Table Rack',component:TableRackComponent},
    {path:'Sales History', component:SalesHistoryComponent},
    {path:'F and B views',component:FNBViewComponent},
    {path:'Cancellations',component:CancellationsComponent},
    {path:'Credit Bills',component:CreditsBillsComponent},
    {path:'Cash Receipt',component:CashReceiptComponent},
    {path:'Cash Payment',component:CashPaymentComponent}
];
export const routes: Routes=[];