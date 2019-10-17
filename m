Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C27DA40C
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 04:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823886E40A;
	Thu, 17 Oct 2019 02:54:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720061.outbound.protection.outlook.com [40.107.72.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51C86E40A
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 02:54:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWGB3Vj/FPUkuH6lucFy6s0PvGF/IwtWa0ulJtibYmBtwUPJBeamg9w91IkppnXGGustspvG4OJZbTGFbxHIvuzd9cStTZH5A8L74pclbRrac8+rd02RsMybss2qOghXmC4elRsXdENapiwXKH+OpmEb6oQVUftveeFsU6Px1uU8XHhxAHrwNsqD79oE96/WGASUux3wphxouRQCZ12HrvkD64lSz2tTiplwVJKtpNNHus6mok6ULA631/X85OTLcXJ6cyWxTk/gS3qMUm8PKds1wmPQaGiXugZGEXwcq827KHx5bmuWtVNbrL25VuyXdliaqyIuSnZmIen85iEFqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jzVE/tqxnbHYlkmVCK2SOcHXE/Asj3dZ33hkw5QnIQ=;
 b=Or9goLFCZUAUfAp0Zrj1UH3tDQcdMhdMPc7B36jskQLFnCIYhJJHU/3TfU0IuIBHH0sD6pkZJa6z89MvDK9EA3B9zBi/dounkveoVF4J2a6Lca4dbTZwDsWm+D8UJTIs+UdyNiwVpDEw5ATJStsj+4qr8aTskdM/4xhONLdyU9pDMOSDUYQmcvWDI5dgv9z1eMfr/0de54Zb85r2269xnIZjjyt28aWzTGSD98ZrOj7KgEKAPpFTAUwL4GOqWGqBwQz5cRhzF1uAsQGXSLfiRj5G+ROFo8E33TH9i6phPs7vHtlRGYAT1ZOkr8W5CRUUGYd4oF/Hp0xwv2tXVAjPew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3295.namprd12.prod.outlook.com (20.179.81.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 02:54:05 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d%5]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 02:54:05 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: disable c-states on xgmi perfmons
Thread-Topic: [PATCH] drm/amdgpu: disable c-states on xgmi perfmons
Thread-Index: AQHVhI9wMQL/TKmDH0aicDX3Ey3L26deIwgg
Date: Thu, 17 Oct 2019 02:54:05 +0000
Message-ID: <MN2PR12MB3344351F622660278D69F612E46D0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20191017020555.52200-1-jonathan.kim@amd.com>
In-Reply-To: <20191017020555.52200-1-jonathan.kim@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dffaa142-e883-49a6-166a-08d752ad4646
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3295:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3295F4C7E93B97490177EF85E46D0@MN2PR12MB3295.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(199004)(189003)(13464003)(99286004)(478600001)(76176011)(25786009)(14444005)(7736002)(256004)(7696005)(229853002)(4326008)(305945005)(2501003)(53546011)(5660300002)(2906002)(6506007)(74316002)(102836004)(6436002)(71190400001)(71200400001)(14454004)(6246003)(8676002)(6116002)(26005)(86362001)(316002)(52536014)(186003)(81166006)(76116006)(55016002)(9686003)(486006)(8936002)(11346002)(446003)(66066001)(66476007)(66556008)(64756008)(81156014)(476003)(33656002)(110136005)(66446008)(66946007)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3295;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KVKR7eftQSFry89oPRbyik8ux4/DE/O5B4i52e/2O3a8DLmg8c94ZH6WRmPXN4raE4NGQYWVj4q1+QPlF8OUpj5h1NG0taS+wdUKwGHO/g8R6YxQKYJyI1dR1TOQj71jLpBVFBzUNU7FVX7unpDLrLvFuShQpD7AEWSrNZ6JJADAeztwG5OhewfL5zSEX6SLDYnt3qqNQJ+sRdTb0qMs2izFiusYniuVWH33k60timvC6Hmub67PqCzceGebDnMOqnrnkN4nAPmckqYKp8fXqakwETyVXV6N9+54ZKqU1BKWnDZO4OA1hEbc3+x77F3qHk0rRVsS7aFDfOSwtnPNBn0jwYvg6mhmSJlQJMmeCIPeF5IPzF0Jbb3Ya0tMX4/p15vNTLyDshwm8LuiCeCo3drWlWGBbvntmemEQSWggR0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dffaa142-e883-49a6-166a-08d752ad4646
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 02:54:05.6433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P7YLNlw1TpSwlt24ahrYZKwbPb+67ge8RUfb16yqDc+ZcAsUfire0OgzU6FXIb1q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3295
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jzVE/tqxnbHYlkmVCK2SOcHXE/Asj3dZ33hkw5QnIQ=;
 b=b/mPmxUCW1BoXhN5s80ExS/18nUEBpW8kxSxfFLVBUBYvCHqjvI1a9LGpyFJWmhBDyboo9Gkia0YZ+R5SswvaVpH2Gbze4f2LPChLLwYt/YQntebuzn+2vL5KyPxivByWXr/vY0gZ4+bsjfJ2wLqG1ZYOfyEgkp9+mtqp2ofeG8=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2ltLCBKb25hdGhhbiA8Sm9uYXRoYW4uS2ltQGFt
ZC5jb20+DQo+IFNlbnQ6IDIwMTnlubQxMOaciDE35pelIDEwOjA2DQo+IFRvOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGlu
Z0BhbWQuY29tPjsgUXVhbiwgRXZhbg0KPiA8RXZhbi5RdWFuQGFtZC5jb20+OyBLaW0sIEpvbmF0
aGFuIDxKb25hdGhhbi5LaW1AYW1kLmNvbT47IEtpbSwNCj4gSm9uYXRoYW4gPEpvbmF0aGFuLktp
bUBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IGRpc2FibGUgYy1zdGF0
ZXMgb24geGdtaSBwZXJmbW9ucw0KPiANCj4gcmVhZCBvciB3cml0ZXMgdG8gZGYgcmVnaXN0ZXJz
IHdoZW4gZ3B1IGRmIGlzIGluIGMtc3RhdGVzIHdpbGwgcmVzdWx0IGluDQo+IGhhbmcuICBkZiBj
LXN0YXRlcyBzaG91bGQgYmUgZGlzYWJsZWQgcHJpb3IgdG8gcmVhZCBvciB3cml0ZXMgdGhlbg0K
PiByZS1lbmFibGVkIGFmdGVyIHJlYWQgb3Igd3JpdGVzLg0KPiANCj4gdjI6IHVzZSBvbGQgcG93
ZXJwbGF5IHJvdXRpbmVzIGZvciB2ZWdhMjANCj4gDQo+IENoYW5nZS1JZDogSTZkNWE4M2U0ZmUx
M2UyOWM3M2RmYjAzYTk0ZmU3YzYxMWU4NjdmZWMNCj4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4g
S2ltIDxKb25hdGhhbi5LaW1AYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9kZl92M182LmMgfCAzNg0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYw0KPiBpbmRleCAxNmZiZDJiYzhhZDEu
LmY0MDNjNjJjOTQ0ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
ZGZfdjNfNi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYw0K
PiBAQCAtOTMsNiArOTMsMjEgQEAgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqZGZfdjNf
Nl9hdHRyX2dyb3Vwc1tdID0NCj4gew0KPiAgCQlOVUxMDQo+ICB9Ow0KPiANCj4gK3N0YXRpYyBk
Zl92M182X3NldF9kZl9jc3RhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBhbGxv
dykNCj4gK3sNCj4gKwlpbnQgciA9IDA7DQo+ICsNCj4gKwlpZiAoaXNfc3VwcG9ydF9zd19zbXUo
YWRldikpIHsNCj4gKwkJciA9IHNtdV9zZXRfZGZfY3N0YXRlKCZhZGV2LT5zbXUsIGFsbG93KTsN
Cj4gKwl9IGVsc2UgaWYgKGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcw0KPiArCQkJJiYgYWRldi0+
cG93ZXJwbGF5LnBwX2Z1bmNzLT5zZXRfZGZfY3N0YXRlKSB7DQo+ICsJCXIgPSBhZGV2LT5wb3dl
cnBsYXkucHBfZnVuY3MtPnNldF9kZl9jc3RhdGUoDQo+ICsJCQlhZGV2LT5wb3dlcnBsYXkucHBf
aGFuZGxlLCBhbGxvdyk7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIHI7DQo+ICt9DQo+ICsNCj4g
IHN0YXRpYyB1aW50NjRfdCBkZl92M182X2dldF9maWNhKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LA0KPiAgCQkJCSB1aW50MzJfdCBmaWNhYV92YWwpDQo+ICB7DQo+IEBAIC0xMDIsNiArMTE3
LDkgQEAgc3RhdGljIHVpbnQ2NF90IGRmX3YzXzZfZ2V0X2ZpY2Eoc3RydWN0DQo+IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsDQo+ICAJYWRkcmVzcyA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2llX2lu
ZGV4X29mZnNldChhZGV2KTsNCj4gIAlkYXRhID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVf
ZGF0YV9vZmZzZXQoYWRldik7DQo+IA0KPiArCWlmIChkZl92M182X3NldF9kZl9jc3RhdGUoYWRl
diwgREZfQ1NUQVRFX0RJU0FMTE9XKSkNCj4gKwkJcmV0dXJuIDB4RkZGRkZGRkZGRkZGRkZGRjsN
Cj4gKw0KPiAgCXNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7
DQo+ICAJV1JFRzMyKGFkZHJlc3MsDQo+IHNtbkRGX1BJRV9BT05fRmFicmljSW5kaXJlY3RDb25m
aWdBY2Nlc3NBZGRyZXNzMyk7DQo+ICAJV1JFRzMyKGRhdGEsIGZpY2FhX3ZhbCk7DQo+IEBAIC0x
MTQsNiArMTMyLDggQEAgc3RhdGljIHVpbnQ2NF90IGRmX3YzXzZfZ2V0X2ZpY2Eoc3RydWN0DQo+
IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+IA0KPiAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFk
ZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsNCj4gDQo+ICsJZGZfdjNfNl9zZXRfZGZfY3N0YXRl
KGFkZXYsIERGX0NTVEFURV9BTExPVyk7DQo+ICsNCj4gIAlyZXR1cm4gKCgoZmljYWRoX3ZhbCAm
IDB4RkZGRkZGRkZGRkZGRkZGRikgPDwgMzIpIHwgZmljYWRsX3ZhbCk7DQo+ICB9DQo+IA0KPiBA
QCAtMTI1LDYgKzE0NSw5IEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZfc2V0X2ZpY2Eoc3RydWN0IGFt
ZGdwdV9kZXZpY2UNCj4gKmFkZXYsIHVpbnQzMl90IGZpY2FhX3ZhbCwNCj4gIAlhZGRyZXNzID0g
YWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfaW5kZXhfb2Zmc2V0KGFkZXYpOw0KPiAgCWRhdGEg
PSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9kYXRhX29mZnNldChhZGV2KTsNCj4gDQo+ICsJ
aWYgKGRmX3YzXzZfc2V0X2RmX2NzdGF0ZShhZGV2LCBERl9DU1RBVEVfRElTQUxMT1cpKQ0KPiAr
CQlyZXR1cm47DQo+ICsNCj4gIAlzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+cGNpZV9pZHhfbG9j
aywgZmxhZ3MpOw0KPiAgCVdSRUczMihhZGRyZXNzLA0KPiBzbW5ERl9QSUVfQU9OX0ZhYnJpY0lu
ZGlyZWN0Q29uZmlnQWNjZXNzQWRkcmVzczMpOw0KPiAgCVdSRUczMihkYXRhLCBmaWNhYV92YWwp
Ow0KPiBAQCAtMTM0LDggKzE1Nyw5IEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZfc2V0X2ZpY2Eoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UNCj4gKmFkZXYsIHVpbnQzMl90IGZpY2FhX3ZhbCwNCj4gDQo+ICAJ
V1JFRzMyKGFkZHJlc3MsDQo+IHNtbkRGX1BJRV9BT05fRmFicmljSW5kaXJlY3RDb25maWdBY2Nl
c3NEYXRhSGkzKTsNCj4gIAlXUkVHMzIoZGF0YSwgZmljYWRoX3ZhbCk7DQo+IC0NCj4gIAlzcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7DQo+ICsNCj4g
KwlkZl92M182X3NldF9kZl9jc3RhdGUoYWRldiwgREZfQ1NUQVRFX0FMTE9XKTsNCj4gIH0NCj4g
DQo+ICAvKg0KPiBAQCAtMTUzLDEyICsxNzcsMTcgQEAgc3RhdGljIHZvaWQgZGZfdjNfNl9wZXJm
bW9uX3JyZWcoc3RydWN0DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAJYWRkcmVzcyA9IGFk
ZXYtPm5iaW8uZnVuY3MtPmdldF9wY2llX2luZGV4X29mZnNldChhZGV2KTsNCj4gIAlkYXRhID0g
YWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfZGF0YV9vZmZzZXQoYWRldik7DQo+IA0KPiArCWlm
IChkZl92M182X3NldF9kZl9jc3RhdGUoYWRldiwgREZfQ1NUQVRFX0RJU0FMTE9XKSkNCj4gKwkJ
cmV0dXJuOw0KPiArDQo+ICAJc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ss
IGZsYWdzKTsNCj4gIAlXUkVHMzIoYWRkcmVzcywgbG9fYWRkcik7DQo+ICAJKmxvX3ZhbCA9IFJS
RUczMihkYXRhKTsNCj4gIAlXUkVHMzIoYWRkcmVzcywgaGlfYWRkcik7DQo+ICAJKmhpX3ZhbCA9
IFJSRUczMihkYXRhKTsNCj4gIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT5wY2llX2lk
eF9sb2NrLCBmbGFncyk7DQo+ICsNCj4gKwlkZl92M182X3NldF9kZl9jc3RhdGUoYWRldiwgREZf
Q1NUQVRFX0FMTE9XKTsNCj4gIH0NCj4gDQo+ICAvKg0KPiBAQCAtMTc1LDEyICsyMDQsMTcgQEAg
c3RhdGljIHZvaWQgZGZfdjNfNl9wZXJmbW9uX3dyZWcoc3RydWN0DQo+IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIHVpbnQzMl90IGxvX2FkZHIsDQo+ICAJYWRkcmVzcyA9IGFkZXYtPm5iaW8uZnVuY3Mt
PmdldF9wY2llX2luZGV4X29mZnNldChhZGV2KTsNCj4gIAlkYXRhID0gYWRldi0+bmJpby5mdW5j
cy0+Z2V0X3BjaWVfZGF0YV9vZmZzZXQoYWRldik7DQo+IA0KPiArCWlmIChkZl92M182X3NldF9k
Zl9jc3RhdGUoYWRldiwgREZfQ1NUQVRFX0RJU0FMTE9XKSkNCj4gKwkJcmV0dXJuOw0KPiArDQo+
ICAJc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsNCj4gIAlX
UkVHMzIoYWRkcmVzcywgbG9fYWRkcik7DQo+ICAJV1JFRzMyKGRhdGEsIGxvX3ZhbCk7DQo+ICAJ
V1JFRzMyKGFkZHJlc3MsIGhpX2FkZHIpOw0KPiAgCVdSRUczMihkYXRhLCBoaV92YWwpOw0KPiAg
CXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsNCj4g
Kw0KPiArCWRmX3YzXzZfc2V0X2RmX2NzdGF0ZShhZGV2LCBERl9DU1RBVEVfQUxMT1cpOw0KPiAg
fQ0KPiANCj4gIC8qIGdldCB0aGUgbnVtYmVyIG9mIGRmIGNvdW50ZXJzIGF2YWlsYWJsZSAqLw0K
PiAtLQ0KPiAyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
