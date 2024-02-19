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
import { MainStoreComponent } from './trans/inventory/main-store/main-store.component';
import { DeptRequisitionComponent } from './trans/inventory/dept-requisition/dept-requisition.component';
import { IssueComponent } from './trans/inventory/issue/issue.component';
import { PurRequisitionComponent } from './trans/inventory/pur-requisition/pur-requisition.component';
import { PurOrderComponent } from './trans/inventory/pur-order/pur-order.component';
import { GrnComponent } from './trans/inventory/grn/grn.component';
import { PendingPoComponent } from './trans/inventory/pending-po/pending-po.component';
import { PurReturnComponent } from './trans/inventory/pur-return/pur-return.component';
import { DeptReturnComponent } from './trans/inventory/dept-return/dept-return.component';
import { SuppliersComponent } from './trans/inventory/suppliers/suppliers.component';

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
    { path:'Main Store', component: MainStoreComponent},
    { path:'Purchase', component: PurchaseDetailsComponent},
    { path:'Dept Requisition', component: DeptRequisitionComponent},
    { path:'Issue', component: IssueComponent},
    { path:'Pur Requisition', component: PurRequisitionComponent},
    { path:'Pur Order', component: PurOrderComponent},
    { path:'GRN', component: GrnComponent},
    { path:'Pending PO', component:PendingPoComponent},
    { path:'Pur Return', component: PurReturnComponent},
    { path:'Dept Return', component: DeptReturnComponent},
    { path:'Suppliers', component: SuppliersComponent}
];






