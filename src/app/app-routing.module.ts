import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { MainPageComponent } from './main-page/main-page.component';
import { AnswerPageComponent } from './answer-page/answer-page.component';
import { AdminComponent } from './admin/admin.component';
import { EnterFormComponent } from './enter-form/enter-form.component';
import { AdminSecurity } from './services/admin.security';


const routes: Routes = [
  {path: '', component: MainPageComponent},
  {path: 'answer-page', component: AnswerPageComponent},
  {path: 'admin', component: AdminComponent, canActivate: [AdminSecurity]},
  {path: 'enter-form', component: EnterFormComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
