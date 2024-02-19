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
import { ChartComponent } from './trans/front/chart/chart.component';
import { GuestComponent } from './trans/front/guest/guest.component';
import { MaintenanceComponent } from './trans/front/maintenance/maintenance.component';
import { AgentsComponent } from './trans/front/agents/agents.component';
import { ClAgentsComponent } from './trans/front/cl-agents/cl-agents.component';
import { NightAuditComponent } from './trans/front/night-audit/night-audit.component';
import { MessageComponent } from './trans/front/message/message.component';
import { CreditBillsComponent } from './trans/front/credit-bills/credit-bills.component';
import { SmsComponent } from './trans/front/sms/sms.component';
import { SmsSendComponent } from './trans/front/sms-send/sms-send.component';
import { HlsComponent } from './trans/front/hls/hls.component';

export const frontRoutes: Routes = [
    {path: 'reservations', component: ReservationsComponent},
    {path: 'roomRack',component:RoomRackComponent},
    {path: 'checkIn', component: CheckInComponent},
    {path: 'Chart', component: ChartComponent},
    {path: 'Maintenance', component: MaintenanceComponent},
    {path: 'Guest', component: GuestComponent},
    {path: 'Agents', component: AgentsComponent},
    {path: 'CL Agents', component: ClAgentsComponent},
    {path: 'Night Audit', component: NightAuditComponent},
    {path: 'Message', component: MessageComponent},
    {path: 'Credit Bills', component: CreditBillsComponent},
    {path: 'Cash Receipt', component: CashReceiptComponent},
    {path: 'Cash Payment', component: CashPaymentComponent},
    {path: 'SMS', component: SmsComponent},
    {path: 'SMS Send', component: SmsSendComponent},
    {path: 'HLS', component: HlsComponent},
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
export const routes: Routes=[
    {path: 'purchase_details', component: PurchaseDetailsComponent},
    {path:'',component: OptionsComponent}
];

export const Inventory: Routes=[
    { path:'Main Store', component:},
    { path:'Purchase', component:},
    { path:'Dept Requisition', component:},
    { path:'Issue', component:},
    { path:'Pur Requisition', component:},
    { path:'Pur Order', component:},
    { path:'GRN', component:},
    { path:'Pending PO', component:},
    { path:'Pur Return', component:},
    { path:'Dept Return', component:},
    { path:'Suppliers', component:}
];






