Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80A018933
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 13:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF8289BA1;
	Thu,  9 May 2019 11:45:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680083.outbound.protection.outlook.com [40.107.68.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28DE89BA1
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 11:45:20 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1692.namprd12.prod.outlook.com (10.172.34.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Thu, 9 May 2019 11:45:19 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba%10]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 11:45:19 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Liu, Monk" <Monk.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/sched: fix the duplicated TMO message for one IB
Thread-Topic: [PATCH] drm/sched: fix the duplicated TMO message for one IB
Thread-Index: AQHVBiApks2+wxa9uUu9tWDK7+Bjf6ZiYnKAgAAz74CAAAGpAIAAAQYQgAAFx4CAAABa0IAAA9QAgAAH02CAAAIyAA==
Date: Thu, 9 May 2019 11:45:18 +0000
Message-ID: <f7e39c67-b5ec-0e18-97b0-c34fef640806@amd.com>
References: <1557376305-24294-1-git-send-email-Monk.Liu@amd.com>
 <ca57f69d-eced-8e9d-5a07-42a642d96a0f@gmail.com>
 <BYAPR12MB3301677254798D131BC7E8FB84330@BYAPR12MB3301.namprd12.prod.outlook.com>
 <4b0c90d0-6535-9942-e140-666a4c0ff4b7@gmail.com>
 <BYAPR12MB3301D3741595A6AEE81F184884330@BYAPR12MB3301.namprd12.prod.outlook.com>
 <2a65cd8c-78ef-8f99-8c6c-67fe02afc062@amd.com>
 <BYAPR12MB33012AC49AC6DB8F728BA43084330@BYAPR12MB3301.namprd12.prod.outlook.com>
 <afac6e4d-5002-2a47-85d8-52e5359b2b22@gmail.com>
 <BYAPR12MB33019D428603A443D11A398384330@BYAPR12MB3301.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB33019D428603A443D11A398384330@BYAPR12MB3301.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::14) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ae9c2c2-b0a1-4dff-9e63-08d6d473cf43
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1692; 
x-ms-traffictypediagnostic: DM5PR12MB1692:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB169249D8BB5BB9441B96522083330@DM5PR12MB1692.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(376002)(39860400002)(366004)(396003)(199004)(189003)(13464003)(486006)(2616005)(476003)(52116002)(15650500001)(6486002)(76176011)(68736007)(11346002)(31696002)(446003)(478600001)(99286004)(2501003)(6116002)(14444005)(86362001)(65956001)(65806001)(71190400001)(71200400001)(8676002)(81156014)(81166006)(256004)(8936002)(36756003)(966005)(5660300002)(31686004)(72206003)(6506007)(102836004)(46003)(66574012)(53546011)(14454004)(186003)(386003)(64126003)(305945005)(6436002)(7736002)(110136005)(316002)(58126008)(6246003)(53936002)(25786009)(229853002)(66446008)(64756008)(66556008)(66476007)(73956011)(66946007)(6306002)(6512007)(65826007)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1692;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PeusB92iYIkIQ/XPe+QSYU81SNpO3YZOR3PcUrYOd5cDvUGAK1jiQQJnsQ6B7z0ks1Qq8MsOyYKM+FHi2wV0svXt7wL/93oFqlQZu+pgKVYmxk4ms6qQ8qIlbFHP0GEcB+XICNrEWKpWOu8rfFTUrEc6C+a9XouwZJ3GALSM1qEFJK1zkKm02WGO87M9fYTc1l/jSCN1UXdXk71ijDdCUED7LiKJ0q/2vS4MeWDRGb/tYQyzhWXbLAn2sRB0kaeeRY/W+CIJgklqH2mvi01wl/zZcqmeuNToJ0ZXcJrlQc/oVoI85UpJveXycPEkXz/hA2Ipyow8PqoY7lS/lh9Pq0PjbDfRhQpcSuUVgt21xyaZpZjixWFpvV/rJwhZeqZr4PKMYLtBngpOKHxjNVBl7dJnikMqGaiCHg9PMyE1Dhc=
Content-ID: <DE1AD2B632C8EF49A4A5BF1ED595559A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae9c2c2-b0a1-4dff-9e63-08d6d473cf43
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 11:45:18.8911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1692
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0H/Ppa71LGElTgE6DoUCvfY9kZIEmeN4WNuOtP2kKDM=;
 b=UtKzTxRw40noHGU+0lJnyMiZvkig5cIh3qvS3y0vP53cDxlGUlUKjRAdN2K3aNnbcHhHXQ1oBBdNLtIDB05aubb+hw/It+G9ykdModi6Y1pieL+lQ0XPMRpywYYN47Bzulfq1zoieINWeSipLkAWaeovlGxvofIrT9kmUU8OQxM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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

V2VsbCBwdXR0aW5nIHRoZSBvdGhlciBkcml2ZXJzIGFzaWRlIGZvciBtb21lbnQsIEkgd291bGQg
YWxzbyBzYXkgdGhhdCANCml0IGlzIGJhZCBkZXNpZ24gdG8gbm90IHJlc3RhcnQgdGhlIHRpbWVv
dXQuIFNvIGV2ZW4gdGhlbiBJIHdvdWxkIG5vdCANCnJldmlldyB0aGF0IHBhdGNoLg0KDQpRdWVz
dGlvbiBpcyByYXRoZXIgd2hhdCBhcmUgeW91IGFjdHVhbGx5IHRyeWluZyB0byBkbyBhbmQgd2h5
IGRvbid0IHlvdSANCndhbnQgdG8gY2hhbmdlIHlvdXIgZGVzaWduPw0KDQpEZXNpZ25zIHNob3Vs
ZCBiZSBkaXNjdXNzZWQgb24gdGhlIHB1YmxpYyBtYWlsaW5nIGxpc3QgYW5kIG5vdCBkb25lIA0K
aW50ZXJuYWxseS4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KQW0gMDkuMDUuMTkgdW0gMTM6
NDAgc2NocmllYiBMaXUsIE1vbms6DQo+Pj4gQW5kIG5vdCBvbmx5IG91ciBkcml2ZXIgaXMgcmVs
eWluZyBvbiB0aGF0IGJ1dCBhbHNvIHRoZSBBUk0gZHJpdmVycy4gU2VlIHRoZSBoaXN0b3J5IG9m
IHRoYXQgY2hhbmdlLg0KPiBUaGF0ICdzIHRoZSBpc3N1ZSBJIGRpZG4ndCBzZWUgZWFybGllciwg
aWYgQVJNIGRyaXZlcnMgZG9lc24ndCByZXN0YXJ0IHRpbWVyIGluIHRoZWlyIGpvYl90aW1lb3V0
KCkgaXQgaXMgYSBwcm9ibGVtDQo+DQo+IEJ1dCBJIGRvbid0IHdhbnQgdG8gY2hhbmdlIG15IHBs
YW4gb24gdGhhdCBmZWF0dXJlLCBzbyBjYW4geW91IGdpdmUgbW9yZSBleHBsYWluIG9uIHRoZSBh
c3BlY3QgZXhjZXB0IHRoaXMgIkFSTSIgZHJpdmVyID8NCj4gQmVjYXVzZSBJIGNhbm5vdCBldmVu
IGltcGxlbWVudCBpdCBteSB3YXkgaW4gdGhlIGN1c3RvbWVyIGJyYW5jaCBpZiAgZXhjZXB0IEFS
TSByZWFzb24gdGhlcmUgYXJlIG90aGVyIGJhZCBzaWRlIGVmZmVjdHMNCj4NCj4gL01vbmsNCj4N
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXkg
OSwgMjAxOSA3OjA5IFBNDQo+IFRvOiBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+OyBLb2Vu
aWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3NjaGVkOiBmaXggdGhl
IGR1cGxpY2F0ZWQgVE1PIG1lc3NhZ2UgZm9yIG9uZSBJQg0KPg0KPiBbQ0FVVElPTjogRXh0ZXJu
YWwgRW1haWxdDQo+DQo+IEhpIE1vbmssDQo+DQo+IHRoZSB0aW1lb3V0IGhhbmRsZXIgbWlnaHQg
b25seSBraWxsIHdhdmVzIHVudGlsIHdlIHNlZSBzb21lIHByb2dyZXNzIGFnYWluIGFuZCB0aGVu
IGNvbnRpbnVlLg0KPg0KPiBFLmcuIHdlIGRvbid0IG5lY2Vzc2FyeSBraWxsIHRoZSB3aG9sZSBq
b2IsIGJ1dCBtYXliZSBqdXN0IG9uZSBkcmF3aW5nL2NvbXB1dGluZyBvcGVyYXRpb25zLiBPciB0
aGUgc2FtZSBqb2IgaXMgc3VibWl0dGVkIGFub3RoZXIgdGltZS4NCj4gZXRjLi4uDQo+DQo+IEFz
IGxvbmcgYXMgdGhlcmUgaXMgYSBqb2IgcnVubmluZyBvbiB0aGUgaGFyZHdhcmUgdGhlcmUgc2hv
dWxkIGFsc28gYmUgYSB0aW1lciBydW5uaW5nLg0KPg0KPiBBbmQgbm90IG9ubHkgb3VyIGRyaXZl
ciBpcyByZWx5aW5nIG9uIHRoYXQgYnV0IGFsc28gdGhlIEFSTSBkcml2ZXJzLiBTZWUgdGhlIGhp
c3Rvcnkgb2YgdGhhdCBjaGFuZ2UuDQo+DQo+IFdoZW4gd2UgZG9uJ3Qgd2FudCB0aGUgdGltZW91
dCB0byBmaXJlIGFnYWluIGZvciB0aGlzIGpvYiB3ZSBzaG91bGQgcHJvYmFibHkgcmVtb3ZlIHRo
ZSBqb2IgZnJvbSB0aGUgcmluZyBtaXJyb3IgbGlzdCBhbmQgZGVzdHJveSBpdC4NCj4NCj4gQ2hy
aXN0aWFuLg0KPg0KPiBBbSAwOS4wNS4xOSB1bSAxMjo1NiBzY2hyaWViIExpdSwgTW9uazoNCj4+
IENocmlzdGlhbiwNCj4+IFdoeSB0aGlzIGlzIGludGVudGlvbmFsIHRoYXQgdGhlIHNhbWUgam9i
IGtlZXAgcmVwb3J0aW5nIHRpbWVvdXQgPw0KPj4gQW5kIHdoeSB3ZSBjYW5ub3QgY2hhbmdlIHRo
YXQgPw0KPj4NCj4+IFRoYXQncyBsb29rcyBqdXN0IGEgYnVnDQo+Pg0KPj4gL01vbmsNCj4+DQo+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1i
b3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+PiBLb2VuaWcsIENo
cmlzdGlhbg0KPj4gU2VudDogVGh1cnNkYXksIE1heSA5LCAyMDE5IDY6NTQgUE0NCj4+IFRvOiBM
aXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3NjaGVkOiBmaXggdGhlIGR1cGxpY2F0ZWQg
VE1PIG1lc3NhZ2UgZm9yIG9uZQ0KPj4gSUINCj4+DQo+PiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1h
aWxdDQo+Pg0KPj4gSGkgTW9uaywNCj4+DQo+PiBvayB5b3UgZG9uJ3Qgc2VlbSB0byB1bmRlcnN0
YW5kOiBJdCBpcyBpbnRlbnRpb25hbCB0aGF0IHRoZSBzYW1lIGpvYiB0aW1lcyBvdXQgbXVsdGlw
bGUgdGltZXMhIFNvIHdlIGNhbid0IHJlYWxseSBjaGFuZ2UgYW55dGhpbmcgaGVyZS4NCj4+DQo+
PiBXaGF0IHdlIGNhbiBkbyBpcyBpbnN0ZWFkIG9mIHNlbmRpbmcgYSBzaWduYWwgKHdoaWNoIGlz
IG5vdCBhIGdvb2QgaWRlYSBmcm9tIHRoZSB0aW1lb3V0IGhhbmRsZXIgYW55d2F5KSB3ZSBjYW4g
c3RhcnQgYSBiYWNrZ3JvdW5kIHNjcmlwdCB0byBkbyB0aGUgZHVtcGluZy4NCj4+DQo+PiBOb3cg
d2hlbiB0aGUgbmV4dCB0aW1lb3V0IGhhcHBlbnMgd2UgZG91YmxlIGNoZWNrIGlmIHRoZSBiYWNr
Z3JvdW5kIHNjcmlwdCBpcyBzdGlsbCBydW5uaW5nIGFuZCBpZiB5ZXMsIHNpbXBseSBpZ25vcmUg
dGhlIHRpbWVvdXQgYW5kIHdhaXQgZm9yIHRoZSBuZXh0IG9uZS4NCj4+DQo+PiBDaHJpc3RpYW4u
DQo+Pg0KPj4gQW0gMDkuMDUuMTkgdW0gMTI6NDkgc2NocmllYiBMaXUsIE1vbms6DQo+Pj4gSGFo
IC4uLiBJIHNlZSwgYnV0IG15IHJlcXVpcmVtZW50IGNhbm5vdCBiZSBzYXRpc2ZpZWQgd2l0aCBj
dXJyZW50IGRlc2lnbjoNCj4+Pg0KPj4+IFdoYXQgSSBuZWVkIHRvIGRvIGlzIHB1dCBhIHNpZ25h
bCBhcm1pbmcgaW4gam9iX3RpbWVvdXQoKSB0byBub3RpZnkgYSBVU0VSIFNQQUNFIGRhZW1vbiBh
cHAgLCB3aGljaCBmaW5hbGx5IGxldmVyYWdlICJVTVIiIHRvIERVTVAvcmV0cmlldmUgc3cvaHcg
aW5mb3JtYXRpb24gcmVsYXRlZCB3aXRoIHRoZSBUTU8vaGFuZyBhcyBtdWNoIGFzIHBvc3NpYmxl
IC4gIFRvIG1ha2UgaXQgc3RyYWlnaHQgZm9yd2FyZCBJIHdvdWxkIHNpZ25hbCBVU1IxIHRvIHRo
ZSByZWdpc3RlcmVkIGFwcCAodGhlIGRhZW1vbikgZXZlcnkgdGltZSBhIFRNTyBoYXBwZW5zLCAg
YW5kIHRoaXMgd291bGQgaW50cm9kdWNlIGxvdCBvZiB1bm5lY2Vzc2FyeSBEVU1QIGlmIHRoaXMg
ImJ1ZyIgY2Fubm90IHJlc29sdmVkLg0KPj4+DQo+Pj4gSSB0aGluayBrZWVwIHJlcG9ydGluZyBU
TU8gbWVzc2FnZSBmb3Igb25lIElCIGlzIGEgImJ1ZyIgdG8gbWUgZXZlbiBpdCBpcyBub3QgZm9y
IG15IGFib3ZlIGZlYXR1cmUuLi4NCj4+Pg0KPj4+IFRvIGFkZHJlc3MgeW91ciBjb25jZXJuLCB3
aGF0IGFib3V0IHRoaXMgb25lOg0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYw0KPj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2pvYi5jDQo+Pj4gaW5kZXggMTM5Nzk0Mi4uMzFkOTllOSAxMDA2NDQNCj4+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMNCj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMNCj4+PiBAQCAtMjgsNyArMjgs
NyBAQA0KPj4+ICAgICAjaW5jbHVkZSAiYW1kZ3B1LmgiDQo+Pj4gICAgICNpbmNsdWRlICJhbWRn
cHVfdHJhY2UuaCINCj4+Pg0KPj4+IC1zdGF0aWMgdm9pZCBhbWRncHVfam9iX3RpbWVkb3V0KHN0
cnVjdCBkcm1fc2NoZWRfam9iICpzX2pvYikNCj4+PiArc3RhdGljIGludCBhbWRncHVfam9iX3Rp
bWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpzX2pvYikNCj4+PiAgICAgew0KPj4+ICAgICAg
ICAgICAgc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0gdG9fYW1kZ3B1X3Jpbmcoc19qb2ItPnNj
aGVkKTsNCj4+PiAgICAgICAgICAgIHN0cnVjdCBhbWRncHVfam9iICpqb2IgPSB0b19hbWRncHVf
am9iKHNfam9iKTsgQEAgLTM5LDcNCj4+PiArMzksNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfam9i
X3RpbWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpzX2pvYikNCj4+PiAgICAgICAgICAgIGlm
IChhbWRncHVfcmluZ19zb2Z0X3JlY292ZXJ5KHJpbmcsIGpvYi0+dm1pZCwgc19qb2ItPnNfZmVu
Y2UtPnBhcmVudCkpIHsNCj4+PiAgICAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJyaW5nICVz
IHRpbWVvdXQsIGJ1dCBzb2Z0IHJlY292ZXJlZFxuIiwNCj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHNfam9iLT5zY2hlZC0+bmFtZSk7DQo+Pj4gLSAgICAgICAgICAgICAgIHJldHVy
bjsNCj4+PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+Pj4gICAgICAgICAgICB9
DQo+Pj4NCj4+PiAgICAgICAgICAgIGFtZGdwdV92bV9nZXRfdGFza19pbmZvKHJpbmctPmFkZXYs
IGpvYi0+cGFzaWQsICZ0aSk7IEBADQo+Pj4gLTUxLDYgKzUxLDggQEAgc3RhdGljIHZvaWQgYW1k
Z3B1X2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pvYg0KPj4+ICpzX2pvYikNCj4+Pg0K
Pj4+ICAgICAgICAgICAgaWYgKGFtZGdwdV9kZXZpY2Vfc2hvdWxkX3JlY292ZXJfZ3B1KHJpbmct
PmFkZXYpKQ0KPj4+ICAgICAgICAgICAgICAgICAgICBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVy
KHJpbmctPmFkZXYsIGpvYik7DQo+Pj4gKw0KPj4+ICsgICAgICAgcmV0dXJuIDA7DQo+Pj4gICAg
IH0NCj4+Pg0KPj4+ICAgICBpbnQgYW1kZ3B1X2pvYl9hbGxvYyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgdW5zaWduZWQgbnVtX2licywNCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVs
ZXIvc2NoZWRfbWFpbi5jDQo+Pj4gaW5kZXggYzFhYWY4NS4uYjkzZGViMSAxMDA2NDQNCj4+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+Pj4gQEAgLTMwOCwxOCArMzA4
LDIzIEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9qb2JfdGltZWRvdXQoc3RydWN0IHdvcmtfc3Ry
dWN0ICp3b3JrKQ0KPj4+ICAgICB7DQo+Pj4gICAgICAgICAgICBzdHJ1Y3QgZHJtX2dwdV9zY2hl
ZHVsZXIgKnNjaGVkOw0KPj4+ICAgICAgICAgICAgc3RydWN0IGRybV9zY2hlZF9qb2IgKmpvYjsN
Cj4+PiAtICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+Pj4gKyAgICAgICBpbnQgcmV0Ow0K
Pj4+DQo+Pj4gICAgICAgICAgICBzY2hlZCA9IGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgZHJt
X2dwdV9zY2hlZHVsZXIsIHdvcmtfdGRyLndvcmspOw0KPj4+ICAgICAgICAgICAgam9iID0gbGlz
dF9maXJzdF9lbnRyeV9vcl9udWxsKCZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCwNCj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2pv
Yiwgbm9kZSk7DQo+Pj4NCj4+PiAtICAgICAgIGlmIChqb2IpDQo+Pj4gLSAgICAgICAgICAgICAg
IGpvYi0+c2NoZWQtPm9wcy0+dGltZWRvdXRfam9iKGpvYik7DQo+Pj4gKyAgICAgICBpZiAoam9i
KSB7DQo+Pj4gKyAgICAgICAgICAgICAgIHJldCA9IGpvYi0+c2NoZWQtPm9wcy0+dGltZWRvdXRf
am9iKGpvYik7DQo+Pj4gKyAgICAgICAgICAgICAgIGlmIChyZXQpIHsNCj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPj4+DQo+Pj4gLSAgICAgICBzcGlu
X2xvY2tfaXJxc2F2ZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4+PiAtICAgICAg
IGRybV9zY2hlZF9zdGFydF90aW1lb3V0KHNjaGVkKTsNCj4+PiAtICAgICAgIHNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7DQo+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgLyogbWVhbnMgcmVjb3ZlcmVkLCByZXN0YXJ0IHRpbWVyIG5vdyAqLw0K
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+am9i
X2xpc3RfbG9jaywgZmxhZ3MpOw0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGRybV9zY2hl
ZF9zdGFydF90aW1lb3V0KHNjaGVkKTsNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICBzcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPj4+ICsg
ICAgICAgICAgICAgICB9DQo+Pj4gKyAgICAgICB9DQo+Pj4gICAgIH0NCj4+Pg0KPj4+ICAgICAg
LyoqDQo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaA0KPj4+IGIv
aW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oIGluZGV4IDljMmE5NTcuLmMzODg0YzMgMTAwNjQ0
DQo+Pj4gLS0tIGEvaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oDQo+Pj4gQEAgLTIyOSw3ICsy
MjksNyBAQCBzdHJ1Y3QgZHJtX3NjaGVkX2JhY2tlbmRfb3BzIHsNCj4+PiAgICAgICAgICAgICAg
KiBAdGltZWRvdXRfam9iOiBDYWxsZWQgd2hlbiBhIGpvYiBoYXMgdGFrZW4gdG9vIGxvbmcgdG8g
ZXhlY3V0ZSwNCj4+PiAgICAgICAgICAgICAgKiB0byB0cmlnZ2VyIEdQVSByZWNvdmVyeS4NCj4+
PiAgICAgICAgICAgICAqLw0KPj4+IC0gICAgICAgdm9pZCAoKnRpbWVkb3V0X2pvYikoc3RydWN0
IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYik7DQo+Pj4gKyAgICAgICBpbnQgKCp0aW1lZG91dF9q
b2IpKHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpOw0KPj4+DQo+Pj4gICAgICAgICAg
ICAvKioNCj4+PiAgICAgICAgICAgICAgKiBAZnJlZV9qb2I6IENhbGxlZCBvbmNlIHRoZSBqb2In
cyBmaW5pc2hlZCBmZW5jZSBoYXMNCj4+PiBiZWVuIHNpZ25hbGVkDQo+Pj4gKEVORCkNCj4+Pg0K
Pj4+DQo+Pj4gVGhhbmtzDQo+Pj4gL01vbmsNCj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPj4+IEZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21h
aWwuY29tPg0KPj4+IFNlbnQ6IFRodXJzZGF5LCBNYXkgOSwgMjAxOSA2OjMwIFBNDQo+Pj4gVG86
IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuDQo+Pj4gPENo
cmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
Pj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3NjaGVkOiBmaXggdGhlIGR1cGxpY2F0ZWQgVE1P
IG1lc3NhZ2UgZm9yDQo+Pj4gb25lIElCDQo+Pj4NCj4+PiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1h
aWxdDQo+Pj4NCj4+PiBkcm1fc2NoZWRfc3RhcnQoKSBpcyBub3QgbmVjZXNzYXJ5IGNhbGxlZCBm
cm9tIHRoZSB0aW1lb3V0IGhhbmRsZXIuDQo+Pj4NCj4+PiBJZiBhIHNvZnQgcmVjb3ZlcnkgaXMg
c3VmZmljaWVudCwgd2UganVzdCBjb250aW51ZSB3aXRob3V0IGEgY29tcGxldGUgcmVzZXQuDQo+
Pj4NCj4+PiBDaHJpc3RpYW4uDQo+Pj4NCj4+PiBBbSAwOS4wNS4xOSB1bSAxMjoyNSBzY2hyaWVi
IExpdSwgTW9uazoNCj4+Pj4gQ2hyaXN0aWFuDQo+Pj4+DQo+Pj4+IENoZWNrICJkcm1fc2NoZWRf
c3RhcnQiIHdoaWNoIGlzIGludm9rZWQgZnJvbSBncHVfcmVjb3ZlcigpICwgdGhlcmUNCj4+Pj4g
aXMgYSAiZHJtX3NjaGVkX3N0YXJ0X3RpbWVvdXQoKSIgaW4gdGhlIHRhaWwNCj4+Pj4NCj4+Pj4g
L01vbmsNCj4+Pj4NCj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+Pj4gRnJvbTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+DQo+Pj4+
IFNlbnQ6IFRodXJzZGF5LCBNYXkgOSwgMjAxOSAzOjE4IFBNDQo+Pj4+IFRvOiBMaXUsIE1vbmsg
PE1vbmsuTGl1QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4+PiBT
dWJqZWN0OiBSZTogW1BBVENIXSBkcm0vc2NoZWQ6IGZpeCB0aGUgZHVwbGljYXRlZCBUTU8gbWVz
c2FnZSBmb3INCj4+Pj4gb25lIElCDQo+Pj4+DQo+Pj4+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFp
bF0NCj4+Pj4NCj4+Pj4gQW0gMDkuMDUuMTkgdW0gMDY6MzEgc2NocmllYiBNb25rIExpdToNCj4+
Pj4+IHdlIGRvbid0IG5lZWQgZHVwbGljYXRlZCBJQidzIHRpbWVvdXQgZXJyb3IgbWVzc2FnZSBy
ZXBvcnRlZA0KPj4+Pj4gZW5kbGVzc2x5LCBqdXN0IG9uZSByZXBvcnQgcGVyIHRpbWVkb3V0IElC
IGlzIGVub3VnaA0KPj4+PiBXZWxsLCBOQUsuIFdlIGRvbid0IG5lZWQgbXVsdGlwbGUgdGltZW91
dCByZXBvcnRzLCBidXQgd2UgcmVhbGx5IG5lZWQgdG8gcmVzdGFydCB0aGUgdGltZW91dCBjb3Vu
dGVyIGFmdGVyIGhhbmRsaW5nIGl0Lg0KPj4+Pg0KPj4+PiBPdGhlcndpc2Ugd2Ugd2lsbCBuZXZl
ciBydW4gaW50byBhIHRpbWVvdXQgYWdhaW4gYWZ0ZXIgaGFuZGxpbmcgb25lIGFuZCBpdCBpc24n
dCB1bmxpa2VseSB0aGF0IG11bHRpcGxlIElCcyBpbiBhIHJvdyBkb2Vzbid0IHdvcmsgY29ycmVj
dGx5Lg0KPj4+Pg0KPj4+PiBDaHJpc3RpYW4uDQo+Pj4+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBN
b25rIExpdSA8TW9uay5MaXVAYW1kLmNvbT4NCj4+Pj4+IC0tLQ0KPj4+Pj4gICAgICAgZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCA1IC0tLS0tDQo+Pj4+PiAgICAgICAx
IGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkNCj4+Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+Pj4+IGIvZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+Pj4+IGluZGV4IGMxYWFmODUuLmQ2YzE3
ZjEgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21h
aW4uYw0KPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMN
Cj4+Pj4+IEBAIC0zMDgsNyArMzA4LDYgQEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX2pvYl90aW1l
ZG91dChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+Pj4+PiAgICAgICB7DQo+Pj4+PiAgICAg
ICAgICAgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZDsNCj4+Pj4+ICAgICAgICAgICBz
dHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iOw0KPj4+Pj4gLSAgICAgdW5zaWduZWQgbG9uZyBmbGFn
czsNCj4+Pj4+DQo+Pj4+PiAgICAgICAgICAgc2NoZWQgPSBjb250YWluZXJfb2Yod29yaywgc3Ry
dWN0IGRybV9ncHVfc2NoZWR1bGVyLCB3b3JrX3Rkci53b3JrKTsNCj4+Pj4+ICAgICAgICAgICBq
b2IgPSBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwoJnNjaGVkLT5yaW5nX21pcnJvcl9saXN0LA0K
Pj4+Pj4gQEAgLTMxNiwxMCArMzE1LDYgQEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX2pvYl90aW1l
ZG91dChzdHJ1Y3QNCj4+Pj4+IHdvcmtfc3RydWN0ICp3b3JrKQ0KPj4+Pj4NCj4+Pj4+ICAgICAg
ICAgICBpZiAoam9iKQ0KPj4+Pj4gICAgICAgICAgICAgICAgICAgam9iLT5zY2hlZC0+b3BzLT50
aW1lZG91dF9qb2Ioam9iKTsNCj4+Pj4+IC0NCj4+Pj4+IC0gICAgIHNwaW5fbG9ja19pcnFzYXZl
KCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPj4+Pj4gLSAgICAgZHJtX3NjaGVkX3N0
YXJ0X3RpbWVvdXQoc2NoZWQpOw0KPj4+Pj4gLSAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgm
c2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4+Pj4+ICAgICAgIH0NCj4+Pj4+DQo+Pj4+
PiAgICAgICAgLyoqDQo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+Pj4+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+Pj4+IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+Pj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA0KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+PiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4DQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KPj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4+IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZngNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
