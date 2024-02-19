import { Routes } from '@angular/router';
import { AboutComponent } from './about/about.component';
import { ContactComponent } from './contact/contact.component';


export const array1: Routes = [
    {path:'about',component: AboutComponent},
    {path:'contact',component: ContactComponent}
];

export const routes: Routes = [];
