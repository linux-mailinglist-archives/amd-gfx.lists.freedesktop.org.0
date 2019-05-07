Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BBC15768
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 03:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218C589C52;
	Tue,  7 May 2019 01:48:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740059.outbound.protection.outlook.com [40.107.74.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC5A89C52
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 01:48:23 +0000 (UTC)
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3712.namprd12.prod.outlook.com (10.255.236.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 7 May 2019 01:48:20 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::c93d:cf5d:3f72:aff6]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::c93d:cf5d:3f72:aff6%2]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 01:48:20 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: treat negative lockup timeout as 'infinite
 timeout'
Thread-Topic: [PATCH] drm/amdgpu: treat negative lockup timeout as 'infinite
 timeout'
Thread-Index: AQHVA04vUXNS+6SheEicHxkh/FfquaZd9nqAgADvalA=
Date: Tue, 7 May 2019 01:48:20 +0000
Message-ID: <MN2PR12MB3344ED1CC8D0C5ABCB935135E4310@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190505142353.30369-1-evan.quan@amd.com>
 <03378dca-c0bb-443e-818a-3a01b69dcccb@gmail.com>
In-Reply-To: <03378dca-c0bb-443e-818a-3a01b69dcccb@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [210.13.97.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 353320cb-51f4-4ed8-656c-08d6d28e154e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3712; 
x-ms-traffictypediagnostic: MN2PR12MB3712:
x-microsoft-antispam-prvs: <MN2PR12MB37120858626F1912A2074CF3E4310@MN2PR12MB3712.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(136003)(39860400002)(376002)(366004)(189003)(199004)(13464003)(6246003)(6436002)(229853002)(25786009)(6116002)(3846002)(66574012)(8676002)(66556008)(53936002)(99286004)(81156014)(55016002)(66476007)(8936002)(76176011)(76116006)(66946007)(66446008)(7696005)(73956011)(68736007)(64756008)(81166006)(52536014)(256004)(72206003)(5660300002)(446003)(478600001)(9686003)(11346002)(476003)(316002)(486006)(33656002)(6506007)(102836004)(86362001)(2501003)(53546011)(71190400001)(71200400001)(66066001)(2906002)(26005)(186003)(14454004)(305945005)(110136005)(7736002)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3712;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 33JjKKSMVspL0vQeI8aXgXJk8til3/tV/KTU0WbycZ0jStnJeKPnw5PVzut27XOGwIh/FBudjFIInBSeUAQ6pR7Rc5yMSEzM0WwQfpkII/OLyzDsut2fmzI2ohGZzLbq+gGQVOcTL898dZ0b9hGk8qfg3rsVW8TllvfHE3RsQGOshM6ZjcbC86dvMDZ//hRlBmQDWgpXwdIJ/4GNIzyVI7csO0DNTLTcDYzRVWEGunMMz+hqxmCC40B3iVHwxvHhQLAykWXj92BTUQUMrGWrPK6DarnGYf68wMgiugk3pC+cQ0DqepqGZQgZqUg7KNKHbk1obxyR++mbELV8u85VeFtIFI0uWpZyRXQcoHZ3e2ke1KplG36wsYQMZpbpNdkhVZvZWGXoJuM5ZUs3dQ/LtoKHVYivm4DFEF4T1DLKpfk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 353320cb-51f4-4ed8-656c-08d6d28e154e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 01:48:20.3001 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3712
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wntf9kSnICnoepX9ruB0j/iOfi/1zwQil6Q2iL8W2qE=;
 b=rAFKYATZ+luRXzjXvbgja4u53UXz96VOGt+IhTtEzIk3UdjiwV4Nvjj5m8ZEOjTPbHztMkUJmlkJZpZxLBV922FIY1z2pkeII67o5PKZcewp1aA0cWzMvCww+9+/kEuQyiMX+B24g06bZRSq2pUwV18zwIvwgG+OH0o8EJ0YUpk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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

VGhhbmtzISBKdXN0IHNlbnQgb3V0IGEgVjIgdmVyc2lvbiB3aXRoIHRoaXMgYWRkcmVzc2VkLg0K
DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENocmlzdGlhbiBLw7ZuaWcg
PGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPg0KPiBTZW50OiAyMDE55bm0NeaciDbm
l6UgMTk6MjYNCj4gVG86IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPjsgYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4u
S29lbmlnQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IHRyZWF0
IG5lZ2F0aXZlIGxvY2t1cCB0aW1lb3V0IGFzICdpbmZpbml0ZQ0KPiB0aW1lb3V0Jw0KPiANCj4g
W0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KPiANCj4gQW0gMDUuMDUuMTkgdW0gMTY6MjMgc2No
cmllYiBFdmFuIFF1YW46DQo+ID4gTmVnYXRpdmUgbG9ja3VwIHRpbWVvdXQgaXMgdmFsaWQgYW5k
IHdpbGwgYmUgdHJlYXRlZCBhcyAnaW5maW5pdGUNCj4gPiB0aW1lb3V0Jy4NCj4gPg0KPiA+IENo
YW5nZS1JZDogSTBkODM4Nzk1NmE5Yzc0NDA3M2MwMjgxZWYyZTFhNTQ3ZDRmMTZkZWMNCj4gPiBT
aWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0KPiA+IC0tLQ0KPiA+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMTQgKysrKysrKysr
Ky0tLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5j
DQo+ID4gaW5kZXggNWIwM2UxN2U2ZTA2Li40ZDZkZmY2ODU1ZjggMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQo+ID4gQEAgLTIzMywxMyArMjMzLDE0
IEBAIG1vZHVsZV9wYXJhbV9uYW1lZChtc2ksIGFtZGdwdV9tc2ksIGludCwNCj4gMDQ0NCk7DQo+
ID4gICAgKiBTZXQgR1BVIHNjaGVkdWxlciB0aW1lb3V0IHZhbHVlIGluIG1zLg0KPiA+ICAgICoN
Cj4gPiAgICAqIFRoZSBmb3JtYXQgY2FuIGJlIFtOb24tQ29tcHV0ZV0gb3IgW0dGWCxDb21wdXRl
LFNETUEsVmlkZW9dLg0KPiBUaGF0DQo+ID4gaXMgdGhlcmUgY2FuIGJlIG9uZSBvcg0KPiA+IC0g
KiBtdWx0aXBsZSB2YWx1ZXMgc3BlY2lmaWVkLiAwIGFuZCBuZWdhdGl2ZSB2YWx1ZXMgYXJlIGlu
dmFsaWRhdGVkLg0KPiA+IFRoZXkgd2lsbCBiZSBhZGp1c3RlZA0KPiA+IC0gKiB0byBkZWZhdWx0
IHRpbWVvdXQuDQo+ID4gKyAqIG11bHRpcGxlIHZhbHVlcyBzcGVjaWZpZWQuDQo+ID4gICAgKiAg
LSBXaXRoIG9uZSB2YWx1ZSBzcGVjaWZpZWQsIHRoZSBzZXR0aW5nIHdpbGwgYXBwbHkgdG8gYWxs
IG5vbi1jb21wdXRlDQo+IGpvYnMuDQo+ID4gICAgKiAgLSBXaXRoIG11bHRpcGxlIHZhbHVlcyBz
cGVjaWZpZWQsIHRoZSBmaXJzdCBvbmUgd2lsbCBiZSBmb3IgR0ZYLiBUaGUNCj4gc2Vjb25kIG9u
ZSBpcyBmb3IgQ29tcHV0ZS4NCj4gPiAgICAqICAgIEFuZCB0aGUgdGhpcmQgYW5kIGZvdXJ0aCBv
bmVzIGFyZSBmb3IgU0RNQSBhbmQgVmlkZW8uDQo+ID4gICAgKiBCeSBkZWZhdWx0KHdpdGggbm8g
bG9ja3VwX3RpbWVvdXQgc2V0dGluZ3MpLCB0aGUgdGltZW91dCBmb3IgYWxsIG5vbi0NCj4gY29t
cHV0ZShHRlgsIFNETUEgYW5kIFZpZGVvKQ0KPiA+ICAgICogam9icyBpcyAxMDAwMC4gQW5kIHRo
ZXJlIGlzIG5vIHRpbWVvdXQgZW5mb3JjZWQgb24gY29tcHV0ZSBqb2JzLg0KPiA+ICsgKiBWYWx1
ZSAwIGlzIGludmFsaWRhdGVkLCB3aWxsIGJlIGFkanVzdGVkIHRvIGRlZmF1bHQgdGltZW91dCBz
ZXR0aW5ncy4NCj4gPiArICogTmVnYXRpdmUgdmFsdWVzIG1lYW4gJ2luZmluaXRlIHRpbWVvdXQn
IChNQVhfSklGRllfT0ZGU0VUKS4NCj4gPiAgICAqLw0KPiA+ICAgTU9EVUxFX1BBUk1fREVTQyhs
b2NrdXBfdGltZW91dCwgIkdQVSBsb2NrdXAgdGltZW91dCBpbiBtcw0KPiAoZGVmYXVsdDogMTAw
MDAgZm9yIG5vbi1jb21wdXRlIGpvYnMgYW5kIG5vIHRpbWVvdXQgZm9yIGNvbXB1dGUgam9icyks
ICINCj4gPiAgICAgICAgICAgICAgICJmb3JtYXQgaXMgW05vbi1Db21wdXRlXSBvciBbR0ZYLENv
bXB1dGUsU0RNQSxWaWRlb10iKTsNCj4gPiBAQCAtMTI0OCwxMSArMTI0OSwxNiBAQCBpbnQNCj4g
YW1kZ3B1X2RldmljZV9nZXRfam9iX3RpbWVvdXRfc2V0dGluZ3Moc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQpDQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPg0KPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAvKiBJbnZhbGlkYXRlIDAgYW5kIG5lZ2F0aXZlIHZhbHVlcyAqLw0KPiA+IC0g
ICAgICAgICAgICAgICAgICAgICBpZiAodGltZW91dCA8PSAwKSB7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIC8qDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAqIFZhbHVlIDAgd2lsbCBi
ZSBhZGp1c3RlZCB0byBkZWZhdWx0IHRpbWVvdXQgc2V0dGluZ3MuDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAqIE5lZ2F0aXZlIHZhbHVlcyBtZWFuICdpbmZpbml0ZSB0aW1lb3V0JyAoTUFY
X0pJRkZZX09GRlNFVCkuDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAqLw0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBpZiAoIXRpbWVvdXQpIHsNCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbmRleCsrOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICB9DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGlmICh0aW1lb3V0IDwgMCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB0aW1lb3V0ID0gTUFYX0pJRkZZX09GRlNFVDsNCj4gDQo+IFRoaXMgaXMgc3VwZXJmbHVvdXMg
YW5kIG1heWJlIGV2ZW4gaGFybWZ1bCwgbXNlY3NfdG9famlmZmllcygpIHNob3VsZCB0YWtlDQo+
IGNhcmUgb2YgdGhpcyBjb252ZXJzaW9uLg0KPiANCj4gTWF5YmUgZXZlbiBjb252ZXJ0IHRoZSB2
YWx1ZXMgZGlyZWN0bHkgaGVyZS4NCj4gDQo+IENocmlzdGlhbi4NCj4gDQo+ID4NCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgc3dpdGNoIChpbmRleCsrKSB7DQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgIGNhc2UgMDoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
