import { ApplicationConfig } from '@angular/core';
import { provideRouter } from '@angular/router';

import { array1, routes } from './app.routes';
import { provideClientHydration } from '@angular/platform-browser';

export const appConfig: ApplicationConfig = {
  providers: [provideRouter(routes),
    provideRouter(array1),
    provideClientHydration()]
};
