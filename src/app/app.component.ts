import { Component, HostListener, ChangeDetectorRef } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { LoadingService } from './services/loading.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.less']
})
export class AppComponent {
  @HostListener('document:keydown.control.m') doSth(){
    this.router.navigate(['/admin']);
  }
  title = 'putevod';
  constructor(public router:Router, public loadingService: LoadingService,
              private cdRef: ChangeDetectorRef){
    loadingService.changeDetectorRef = cdRef;
    this.router.events.subscribe((evt) => {
      if (!(evt instanceof NavigationEnd)) {
          return;
      }
      window.scrollTo(0,0);
     });
  }
}
