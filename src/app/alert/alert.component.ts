import { Component, OnInit } from '@angular/core';
import { AlertComponent } from 'ngx-bootstrap/alert';

@Component({
  selector: 'putevod-alert',
  templateUrl: './alert.component.html',
  styleUrls: ['./alert.component.less']
})
export class PutevodAlertComponent implements OnInit {
  alerts: any[] = [];
  constructor() { }
  ngOnInit() {
  }

  showAlert(alert:Alert){
    this.alerts.push(alert);

  }
 
  onClosed(dismissedAlert: AlertComponent): void {
    this.alerts = this.alerts.filter(alert => alert !== dismissedAlert);
  }
}

export interface Alert{
  type:AlertType;
  message: string;
} 

export enum AlertType{
  Success = "success",
  Warning = "warning",
  Info = "info",
  Danger = "danger"
}