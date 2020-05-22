import { Injectable } from '@angular/core';
import { Client } from 'src/app/core/model/client.model';

@Injectable({
  providedIn: 'root'
})
export class ClientApiService {

  clients: Client[] = [];

  constructor() { }

  getClients(): Client[] {
    this.clients[0] = new Client(1, 'Joao', 'correio');
    this.clients[1] = new Client(2, 'Maria', 'correio');
    this.clients[2] = new Client(3, 'Ana', 'correio');
    this.clients[3] = new Client(4, 'Paulo', 'correio');
    this.clients[4] = new Client(5, 'Marcio', 'correio');
    this.clients[5] = new Client(6, 'Alfredo', 'correio');
    return this.clients;
  }
}
