import {Component, OnInit} from '@angular/core';
import {Client} from '../../../../core/model/client.model';
import { ClientApiService } from 'src/app/core/services/api/client-api.service';

@Component({
  selector: 'app-list',
  templateUrl: './list.page.html',
  styleUrls: ['./list.page.scss'],
})
export class ListPage implements OnInit {
  clients: Client[] = [];

  constructor(private clientsApi: ClientApiService) {
  
    this.clients = this.clientsApi.getClients();
  }

  ngOnInit() {}
}
