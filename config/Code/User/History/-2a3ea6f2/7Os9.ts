import { ApplicationConfig } from '@angular/core';
import { provideRouter } from '@angular/router';

import { frontRoutes,routes,food_n_Bav, Inventory } from './app.routes';
import { provideClientHydration } from '@angular/platform-browser';

export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(routes),
    provideRouter(frontRoutes),
    provideRouter(food_n_Bav),
    provideRouter(Inventory),
    provideClientHydration()]
};
