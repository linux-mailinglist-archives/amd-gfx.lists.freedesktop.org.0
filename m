Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAD044481
	for <lists+amd-gfx@lfdr.de>; Thu, 13 Jun 2019 18:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8F98934F;
	Thu, 13 Jun 2019 16:37:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C12B8934F
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 Jun 2019 16:37:36 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2681.namprd12.prod.outlook.com (20.176.116.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 13 Jun 2019 16:37:34 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.010; Thu, 13 Jun 2019
 16:37:34 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Yang, Philip" <Philip.Yang@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not
 required
Thread-Topic: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not
 required
Thread-Index: AQHVITFaKjzrw3xsHkSdhatf91RqQKaYZ8eAgAAdTACAAMOkAIAAdsyAgAAKsgA=
Date: Thu, 13 Jun 2019 16:37:34 +0000
Message-ID: <e2242be6-0ec4-e5b9-6efc-cad958b666a4@amd.com>
References: <20190612151250.816-1-Philip.Yang@amd.com>
 <5eae5f5a-73f3-4d6e-2a20-892aed285359@gmail.com>
 <8af5593f-10aa-5654-76d3-7be9622dae4e@amd.com>
 <21c5935a-513f-be45-8513-de45fa0fed4d@amd.com>
 <9841bd53-6cfd-acef-c786-2d46df903598@amd.com>
In-Reply-To: <9841bd53-6cfd-acef-c786-2d46df903598@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.53.123]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: BYAPR04CA0032.namprd04.prod.outlook.com
 (2603:10b6:a03:40::45) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 300c5675-aa61-4f5d-47c2-08d6f01d6fca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2681; 
x-ms-traffictypediagnostic: DM6PR12MB2681:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB2681B1F78837067C63D8067E92EF0@DM6PR12MB2681.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(396003)(136003)(366004)(189003)(199004)(51914003)(478600001)(305945005)(86362001)(72206003)(8936002)(110136005)(31686004)(36756003)(476003)(26005)(2616005)(64126003)(8676002)(186003)(58126008)(66574012)(6116002)(3846002)(31696002)(11346002)(446003)(102836004)(2501003)(81156014)(81166006)(68736007)(486006)(99286004)(53936002)(66066001)(6436002)(229853002)(71190400001)(2906002)(966005)(65806001)(52116002)(256004)(6486002)(5660300002)(7736002)(71200400001)(316002)(66946007)(66476007)(66446008)(6512007)(76176011)(66556008)(64756008)(6246003)(73956011)(53546011)(14454004)(25786009)(65826007)(6506007)(6306002)(386003)(65956001)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2681;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3jbMbsBTm1FIeMkUe97D8zGnqVW1QMkzAiSOfzA5hbCfs51oKNGYon2QozOnvF5m+iJt7HhVJzXe9oGbJT+vPBR/wH4n2cOWiNHWjUYgl045nNS6CaKfeImG5Nhb+K41uW1pll3Uwzpd0Vjm5dCh9aZy+VrmpYIfLlyBfbteGmG+iwBcbXohubIKp3cu671ctVqFy+hg49mJ+7blfxArfzLilHwgx4tgHfDAw4ica8Td3a2lPrFUA7RA21a3hfB/2XlQ8y/7ZCLrvDfrfStxGjTkFLLtx5WMIWhIdlMtBtYTufWG240uKGswtmF0jaVDzoMZrcqoB+lv+x1Fbarz++zQztE13Xqkzt7T8ZPYAxF0H9aQXbg9ua3xBrQ5AQp1OwtA60IdXKX2sCayzA7+N17tA3GNtu/pvW6DlTe3IEQ=
Content-ID: <74B379B3FA00D64BA8540488EC684590@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 300c5675-aa61-4f5d-47c2-08d6f01d6fca
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 16:37:34.4196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2681
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BufJ5HW+39JG+JP5a4m7pJ5ru68FXaKCd/7DIxR9S0=;
 b=Gc0M1Wepu6Kng9SwE7/Sjsj5rgd9XPV4P+aW/JAolL4ukb434hq/OVl9HWk+I0cRyuo+3UftU7jgw0p0oluw9gzhPPUlBC1B3oIXmV1YESQzmyXrJLvbzFKapSDcf4v6S+0Q3HlkmieGu/wdt9qhYqs6WnQFt8VCVo9FiVXSq3w=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0xMyA4OjU5LCBZYW5nLCBQaGlsaXAgd3JvdGU6DQo+IE9uIDIwMTktMDYtMTMg
NDo1NCBhLm0uLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4+IEFtIDEyLjA2LjE5IHVtIDIz
OjEzIHNjaHJpZWIgWWFuZywgUGhpbGlwOg0KPj4+IE9uIDIwMTktMDYtMTIgMzoyOCBwLm0uLCBD
aHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPj4+PiBBbSAxMi4wNi4xOSB1bSAxNzoxMyBzY2hyaWVi
IFlhbmcsIFBoaWxpcDoNCj4+Pj4+IFRUTSBjcmVhdGUgdHdvIHpvbmVzLCBrZXJuZWwgem9uZSBh
bmQgZG1hMzIgem9uZSBmb3Igc3lzdGVtIG1lbW9yeS4gSWYNCj4+Pj4+IHN5c3RlbSBtZW1vcnkg
YWRkcmVzcyBhbGxvY2F0ZWQgaXMgYmVsb3cgNEdCLCB0aGlzIGFjY291bnQgdG8gZG1hMzIgem9u
ZQ0KPj4+Pj4gYW5kIHdpbGwgZXhoYXVzdCBkbWEzMiB6b25lIGFuZCB0cmlnZ2VyIHVubmVzc3Nh
cnkgVFRNIGV2aWN0aW9uLg0KPj4+Pj4NCj4+Pj4+IFBhdGNoICJkcm0vdHRtOiBBY2NvdW50IGZv
ciBrZXJuZWwgYWxsb2NhdGlvbnMgaW4ga2VybmVsIHpvbmUgb25seSIgb25seQ0KPj4+Pj4gaGFu
ZGxlIHRoZSBhbGxvY2F0aW9uIGZvciBhY2Nfc2l6ZSwgdGhlIHN5c3RlbSBtZW1vcnkgcGFnZSBh
bGxvY2F0aW9uIGlzDQo+Pj4+PiB0aHJvdWdoIHR0bV9tZW1fZ2xvYmFsX2FsbG9jX3BhZ2Ugd2hp
Y2ggc3RpbGwgYWNjb3VudCB0byBkbWEzMiB6b25lIGlmDQo+Pj4+PiBwYWdlIGlzIGJlbG93IDRH
Qi4NCj4+Pj4gTkFLLCBhcyB0aGUgbmFtZSBzYXlzIHRoZSBtZW1fZ2xvYiBpcyBnbG9iYWwgZm9y
IGFsbCBkZXZpY2VzIGluIHRoZSBzeXN0ZW0uDQo+Pj4+DQo+Pj4+IFNvIHRoaXMgd2lsbCBicmVh
ayBpZiB5b3UgbWl4IERNQTMyIGFuZCBub24gRE1BMzIgaW4gdGhlIHNhbWUgc3lzdGVtDQo+Pj4+
IHdoaWNoIGlzIGV4YWN0bHkgdGhlIGNvbmZpZ3VyYXRpb24gbXkgbGFwdG9wIGhlcmUgaGFzIDoo
DQo+Pj4+DQo+Pj4gSSBkaWRuJ3QgZmluZCBwYXRoIHVzZSBkbWEzMiB6b25lLCBidXQgSSBtYXkg
bWlzc2VkIHNvbWV0aGluZy4NCj4+IFdlbGwgdGhlIHBvaW50IGlzIHRoZXJlIGlzIG5vbiBpbiBv
dXIgZHJpdmVyLCBidXQgbWFueSBkcml2ZXJzIGluIHRoZQ0KPj4gc3lzdGVtIHN0aWxsIG5lZWQg
RE1BMzIgbWVtb3J5Lg0KPj4NCj4+PiBUaGVyZSBpcw0KPj4+IGFuIGlzc3VlIGZvdW5kIGJ5IEtG
RFRlc3QuQmlnQnVmU3RyZXNzVGVzdCwgaXQgYWxsb2NhdGVzIGJ1ZmZlcnMgdXAgdG8NCj4+PiAz
Lzggb2YgdG90YWwgMjU2R0Igc3lzdGVtIG1lbW9yeSwgZWFjaCBidWZmZXIgc2l6ZSBpcyAxMjhN
QiwgdGhlbiB1c2UNCj4+PiBxdWV1ZSB0byB3cml0ZSB0byB0aGUgYnVmZmVycy4gSWYgdHRtX21l
bV9nbG9iYWxfYWxsb2NfcGFnZSBnZXQgcGFnZSBwZm4NCj4+PiBpcyBiZWxvdyA0R0IsIGl0IGFj
Y291bnQgdG8gZG1hMzIgem9uZSBhbmQgd2lsbCBleGhhdXN0IDJHQiBsaW1pdCwgdGhlbg0KPj4+
IHR0bV9jaGVja19zd2FwcGluZyB3aWxsIHNjaGVkdWxlIHR0bV9zaHJpbmtfd29yayB0byBzdGFy
dCBldmljdGlvbi4gSXQNCj4+PiB0YWtlcyBtaW51dGVzIHRvIGZpbmlzaCByZXN0b3JlIChyZXRy
eSBtYW55IHRpbWVzIGlmIGJ1c3kpLCB0aGUgdGVzdA0KPj4+IGZhaWxlZCBiZWNhdXNlIHF1ZXVl
IHRpbWVvdXQuIFRoaXMgZXZpY3Rpb24gaXMgdW5uZWNlc3NhcnkgYmVjYXVzZSB3ZQ0KPj4+IHN0
aWxsIGhhdmUgZW5vdWdoIGZyZWUgc3lzdGVtIG1lbW9yeS4NCj4+IE5vIHRoYXQgaXMgZGVmaW5p
dGVseSBuZWNlc3NhcnkuIEZvciBleGFtcGxlIG9uIG15IExhcHRvcCBpdCdzIHRoZSBzb3VuZA0K
Pj4gc3lzdGVtIHdoaWNoIG5lZWRzIERNQTMyLg0KPj4NCj4+IFdpdGhvdXQgdGhpcyB3aGVuIGFu
IGFwcGxpY2F0aW9uIHVzZXMgYSBsb3Qgb2YgbWVtb3J5IHdlIHJ1biBpbnRvIHRoZQ0KPj4gT09N
IGtpbGxlciBhcyBzb29uIGFzIHNvbWUgYXVkaW8gc3RhcnRzIHBsYXlpbmcuDQo+Pg0KPiBJIGRp
ZCBub3QgcmVhbGl6ZSBUVE0gaXMgdXNlZCBieSBvdGhlciBkcml2ZXJzLiBJIGFncmVlIHdlIGNh
bm5vdCByZW1vdmUNCj4gZG1hMzIgem9uZSwgdGhpcyB3aWxsIGJyZWFrIG90aGVyIGRldmljZSBk
cml2ZXJzIHdoaWNoIGRlcGVuZHMgb24gZG1hMzINCj4gem9uZS4NCg0KSWYgSSB1bmRlcnN0YW5k
IENocmlzdGlhbiBjb3JyZWN0bHksIHRoZSBwb2ludCBpcyBub3QgdGhhdCBvdGhlciBkcml2ZXJz
IA0KdXNlIFRUTSwgYnV0IG90aGVyIGRyaXZlcnMgbmVlZCBkbWEzMiBtZW1vcnkgKG1lbW9yeSB3
aXRoIDMyLWJpdCANCnBoeXNpY2FsIGFkZHJlc3NlcykuIElmIFRUTSB1c2VkIHVwIGFsbCB0aGF0
IG1lbW9yeSwgaXQgd291bGQgYnJlYWsgDQp0aG9zZSBvdGhlciBkcml2ZXJzLiBBcyBhIGdvb2Qg
c3Rld2FyZCBvZiBtZW1vcnksIFRUTSBsaW1pdHMgaXRzIHVzYWdlIA0Kb2YgZG1hMzIgbWVtb3J5
IGluIG9yZGVyIHRvIGFsbG93IG90aGVyIGRyaXZlcnMgdG8gaGF2ZSBhY2Nlc3MgdG8gaXQuDQoN
ClJlZ2FyZHMsDQogwqAgRmVsaXgNCg0KDQo+DQo+Pj4gSXQncyByYW5kb20gY2FzZSwgaGFwcGVu
cyBhYm91dCAxLzUuIEkgY2FuIGNoYW5nZSB0ZXN0IHRvIGluY3JlYXNlIHRoZQ0KPj4+IHRpbWVv
dXQgdmFsdWUgdG8gd29ya2Fyb3VuZCB0aGlzLCBidXQgdGhpcyBzZWVtcyBUVE0gYnVnLiBUaGlz
IHdpbGwgc2xvdw0KPj4+IGFwcGxpY2F0aW9uIHBlcmZvcm1hbmNlIGEgbG90IGlmIHRoaXMgcmFu
ZG9tIGlzc3VlIGhhcHBlbnMuDQo+PiBPbmUgdGhpbmcgd2UgY291bGQgdHJ5IGlzIHRvIGRpZyBp
bnRvIHdoeSB0aGUga2VybmVsIGdpdmVzIHVzIERNQTMyDQo+PiBwYWdlcyB3aGVuIHRoZXJlIGFy
ZSBzdGlsbCBvdGhlciBwYWdlcyBhdmFpbGFibGUuIFBsZWFzZSB0YWtlIGEgbG9vayBhdA0KPj4g
L3Byb2MvYnVkZHlpbmZvIG9uIHRoYXQgYm94IGZvciB0aGlzLg0KPj4NCj4gVGhhbmtzIGZvciB0
aGUgYWR2aXNlLCBmcm9tIGJ1ZGR5aW5mbywgdGhlIG1hY2hpbmUgaGFzIDQgbm9kZXMsIGVhY2gN
Cj4gbm9kZSBoYXMgNjRHQiBtZW1vcnksIGFuZCBkbWEzMiB6b25lIGlzIG9uIG5vZGUgMC4gQmln
QnVmU3RyZXNzVGVzdA0KPiBhbGxvY2F0ZSA5NkdCLiBJZiBJIGZvcmNlIHRoZSB0ZXN0IG9uIG5v
ZGUgMSwgIm51bWFjdGwgLS1jcHVub2RlYmluZD0xDQo+IC4va2ZkdGVzdCIsIG5vIGV2aWN0aW9u
IGF0IGFsbC4gSWYgSSBmb3JjZSB0aGUgdGVzdCBvbiBub2RlIDAsIGl0IGFsd2F5cw0KPiBoYXMg
ZXZpY3Rpb24gYW5kIHJlc3RvcmUgYmVjYXVzZSBpdCB1c2VkIHVwIGFsbCBtZW1vcnkgaW5jbHVk
aW5nIGRtYTMyDQo+IHpvbmUgZnJvbSBub2RlIDAuIEkgd2lsbCBjaGFuZ2UgdGVzdCBhcHAgdG8g
YXZvaWQgcnVubmluZyBvbiBub2RlIDAgdG8NCj4gd29ya2Fyb3VuZCB0aGlzLg0KPg0KPiBUaGFu
a3MsDQo+IFBoaWxpcA0KPg0KPj4gVGhlIG5leHQgdGhpbmcgY29taW5nIHRvIG1pbmQgaXMgdGhh
dCB3ZSBjYW4gbW9zdCBsaWtlbHkgY29tcGxldGVseSBza2lwDQo+PiB0aGlzIGlmIElPTU1VIGlz
IGFjdGl2ZS4NCj4+DQo+PiBUaGUgbGFzdCB0aGluZyBvZiBoYW5kIGNvbWluZyB0byBteSBtaW5k
IGlzIHRvIGltcHJvdmUgVFRNIHRvIGFjdHVhbGx5DQo+PiBvbmx5IGV2aWN0IEJPcyB3aGljaCB1
c2UgRE1BMzIgbWVtb3J5LCBjYXVzZSBjdXJyZW50bHkgd2UganVzdCBldmljdA0KPj4gc3R1ZmYg
cmFuZG9tbHkgYW5kIG5vdCBjaGVjayBpZiBpdHMgRE1BMzIgb3Igb3RoZXIgbWVtb3J5Lg0KPj4N
Cj4+IFJlZ2FyZHMsDQo+PiBDaHJpc3RpYW4uDQo+Pg0KPj4+IFRoYW5rcywNCj4+PiBQaGlsaXAN
Cj4+Pg0KPj4+DQo+Pj4+IENocmlzdGlhbi4NCj4+Pj4NCj4+Pj4+IENoYW5nZS1JZDogSTI4OWI4
NWQ4OTFiOGY2NGExNDIyYzQyYjFlYWIzOTgwOThhYjdlZjcNCj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPg0KPj4+Pj4gLS0tDQo+Pj4+PiAgICDC
oCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgfCA0ICsrKysNCj4+Pj4+
ICAgIMKgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4+Pj4+DQo+Pj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+Pj4+PiBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPj4+Pj4gaW5kZXggMjc3
OGZmNjNkOTdkLi43OWJiOWRmZTYxN2IgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPj4+Pj4gQEAgLTE2ODYsNiArMTY4NiwxMCBAQCBpbnQg
YW1kZ3B1X3R0bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPj4+Pj4gICAgwqDC
oMKgwqDCoCB9DQo+Pj4+PiAgICDCoMKgwqDCoMKgIGFkZXYtPm1tYW4uaW5pdGlhbGl6ZWQgPSB0
cnVlOw0KPj4+Pj4gK8KgwqDCoCAvKiBPbmx5IGtlcm5lbCB6b25lIChubyBkbWEzMiB6b25lKSBp
ZiBkZXZpY2UgZG9lcyBub3QgcmVxdWlyZQ0KPj4+Pj4gZG1hMzIgKi8NCj4+Pj4+ICvCoMKgwqAg
aWYgKCFhZGV2LT5uZWVkX2RtYTMyKQ0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGFkZXYtPm1tYW4u
YmRldi5nbG9iLT5tZW1fZ2xvYi0+bnVtX3pvbmVzID0gMTsNCj4+Pj4+ICsNCj4+Pj4+ICAgIMKg
wqDCoMKgwqAgLyogV2Ugb3B0IHRvIGF2b2lkIE9PTSBvbiBzeXN0ZW0gcGFnZXMgYWxsb2NhdGlv
bnMgKi8NCj4+Pj4+ICAgIMKgwqDCoMKgwqAgYWRldi0+bW1hbi5iZGV2Lm5vX3JldHJ5ID0gdHJ1
ZTsNCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4g
YW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
