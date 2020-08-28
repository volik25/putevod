import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { MainPageComponent } from './main-page/main-page.component';
import { SearchPageComponent } from './search-page/search-page.component';
import { ApiService } from './services/api.service';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { NgbModule, NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { AnswerPageComponent } from './answer-page/answer-page.component';
import { EnterFormComponent } from './enter-form/enter-form.component';
import { AdminComponent } from './admin/admin.component';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { AdminSecurity } from './services/admin.security';
import { LoadingService } from './services/loading.service';
import { AuthService } from './services/auth.service';
import { CKEditorModule } from '@ckeditor/ckeditor5-angular';
import { FilesManagerComponent } from './files-manager/files-manager.component';
import { AuthInterceptor } from './interceptors/auth.interceptor';
import { LoaderComponent } from './loader/loader.component';
import { PutevodAlertComponent } from './alert/alert.component';
import { AlertModule } from 'ngx-bootstrap';
import { AlertService } from './services/alert.service';

@NgModule({
  declarations: [
    AppComponent,
    MainPageComponent,
    SearchPageComponent,
    AnswerPageComponent,
    EnterFormComponent,
    AdminComponent,
    LoaderComponent,
    FilesManagerComponent,
    PutevodAlertComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    NgbModule,
    ReactiveFormsModule,
    FormsModule,
    CKEditorModule,
    AlertModule.forRoot()
  ],
  providers: [
    ApiService,
    NgbActiveModal,
    AdminSecurity,
    LoadingService,
    AuthService,
    AlertService,
    { provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true },
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
