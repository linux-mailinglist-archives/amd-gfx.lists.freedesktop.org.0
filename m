Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F48AE250
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 04:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E3489BFB;
	Tue, 10 Sep 2019 02:22:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820041.outbound.protection.outlook.com [40.107.82.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858E989BFB
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 02:22:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHUTD+XyrYnKn33/hBkS2l9/W4ZXme4+BdPom85BHp7RA37LLnWVDMkgBG2AI4nOlsb65igqWbt71mof4SEH6QKrKm1yaauC7gWe60dO9PmwcA34oFho6jGJl0rSv1D4R1vnF+zMNFdd43uGB7AYu+P6cIeNYXw/X4MCSzsUyyuyyg/tJuNs17kJNWwTJiVbiswOYwyPNcSbdCLllU0l79YVeQR4EI2NpC5kz+wbh/+HXfULWE0OoncwOMW21YJ77TKpc9HiuWujIaOW2rL4wf4Mb1SXKdrWpOt0HW8MJW4n9fejIRIcAqL5NSx7zACt+EN9IJa5DCsRaHJaNe4kjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3OkZToJxAMcvB1FQIfVaBYjv+Y3S/zbGa8dLofZYME=;
 b=npZ3+DlyDYhhIcWDt0P1JMMod+fUYMjSmNKbjXwhU8RtLZi6Q5DZbTyxxISpeXp/9F9vB9a5C/kkjBmsLMV76MpoDO2bLjHsEG2Fxc+yTAKTS8arW4xs69J7y93sarLHIKn54N28FL+28la6/TJS/frgc3cP+0JRQwJsccLwAxBoG5DpHoPJZuwzA/CDt7qPmTUWQUIF8262xtbs/LFltx3+JOKOYY1KwmaKQaL/uJyNWYHendww/4V/w/hePLJcOx0U56ckMQptlSeHI8nSG52gw9aj1aCgn/olFcE3fY/Elz1tsdJnTs3twmeZs4OGNKHDYGlietiNvTQOHGMLyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB2568.namprd12.prod.outlook.com (52.132.141.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Tue, 10 Sep 2019 02:22:43 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 02:22:43 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Chen, Guchun" <Guchun.Chen@amd.com>
Subject: RE: [PATCH 3/3] drm/amdgpu: rename umc ras_init to ras_asic_init
Thread-Topic: [PATCH 3/3] drm/amdgpu: rename umc ras_init to ras_asic_init
Thread-Index: AQHVZJGMpZCKe3I0uk2UMMuuD8uPeaciXkqQgAAEQZCAAEn1gIABhdyQ
Date: Tue, 10 Sep 2019 02:22:43 +0000
Message-ID: <DM5PR12MB1418B84323F3EFA248467985FCB60@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190906090011.20271-1-tao.zhou1@amd.com>
 <20190906090011.20271-3-tao.zhou1@amd.com>
 <MWHPR12MB14245D0D195BBF11C91D6BDEFCB40@MWHPR12MB1424.namprd12.prod.outlook.com>
 <MWHPR12MB1424CE4253553B5228629D15FCB40@MWHPR12MB1424.namprd12.prod.outlook.com>
 <MN2PR12MB3054F07E384BB173EAD69017B0B70@MN2PR12MB3054.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3054F07E384BB173EAD69017B0B70@MN2PR12MB3054.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a0828c9-0fe9-4140-a44e-08d73595c2ce
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2568; 
x-ms-traffictypediagnostic: DM5PR12MB2568:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2568DE70BCCD903A3C76AD87FCB60@DM5PR12MB2568.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(199004)(189003)(13464003)(81156014)(81166006)(256004)(99286004)(5660300002)(102836004)(6436002)(8936002)(476003)(86362001)(25786009)(486006)(52536014)(53936002)(53546011)(6506007)(7736002)(6116002)(3846002)(76176011)(7696005)(76116006)(26005)(316002)(6636002)(186003)(110136005)(966005)(55016002)(478600001)(6246003)(33656002)(74316002)(71200400001)(2501003)(71190400001)(229853002)(446003)(14454004)(2906002)(305945005)(11346002)(66556008)(64756008)(66446008)(8676002)(66476007)(66066001)(66946007)(9686003)(6306002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2568;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 63yAY+e3HRh/JOb3DDi6nXGaJjVhQr1YcruUevHLWSSU8ooROFh1cot51zkqYggXVYri9iPeLIQMrx3i+Ra5s77/c7AqrY+ZkM8/XDKfyCTHaIJqRaSYoQUPiagPLX2ZK0L1xxoxk3i7DUvdLFfZJw2paOLkxuvMMuGbW3o/YvOxwZrxBXHLXnvxGwJC5oI6aznGf7wdYsbfjJ4B0DPAo38CTq6Csm6xRd+k3/yjhIRy771I5ZNu4SX7ry0Vk1gfMd08deIteiVTEtzH75EtGBKu8ZYUT5/Elbuxssrv5VKVgW4svfyU9eB/Agz4t+JXFJZxcXf5VZRdJOpn1Pagwp9NFAySLweuAb+YDZJXJwd3V81yCYqE560wzB1vcNBhy/jVKufJSX9onfslkBPbzVqPHmaWdjo2VR1q8VF/GbU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a0828c9-0fe9-4140-a44e-08d73595c2ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 02:22:43.0446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qWq3U8+C6ChYxGhkPyX0gfDTP0dZ/IvDtgvP48dC5ehhqNEntDK12+nkP/I2r8vlsVR4V1GTAIn+1SMt1otv6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2568
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3OkZToJxAMcvB1FQIfVaBYjv+Y3S/zbGa8dLofZYME=;
 b=gIoWWuosfKxzPYiVYsMlhPuZqtdOY0734BJKev1cIwLhQQWWZPyIR/N7dIzVlNE/ilKdPk1K/+3xTEwpte5dgLn0oabCabm7JnB//WvHExHFqnuot3kOCNXMhVisT2CTpsxcE8CkscdMPb47DgsVJRA+DxziEPLLI1cWZO1RYQ4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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

UkUgLSBlcnJfY250X2luaXQgaXMgZ29vZCBmb3IgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBidXQg
bWF5IGJlIG5vdCBlbm91Z2ggZm9yIHRoZSBmdXR1cmUsIGhvdyBhYm91dCByZW5hbWUgaXQgdG8g
dW1jLmZ1bmNzLT5yYXNfaHdfaW5pdD8NCg0KSSB0aGluayBpdCdzIGJldHRlciB0aGF0IG9uZSBj
YWxsYmFjayBmdW5jdGlvbiBtYXAgdG8gb25lIHNwZWNpZmljIGh3IHNlcXVlbmNlLiBHb2luZyBm
b3J3YXJkLCBpZiB0aGVyZSBpcyBhZGRpdGlvbmFsIHByb2dyYW1taW5nIG5lZWRlZCBmb3IgYW5v
dGhlciBnZW5lcmF0aW9uIG9mIElQLCB3ZSBjYW4gYWRkIGl0IGFzIGEgbmV3IGNhbGxiYWNrIGZ1
bmN0aW9uLiBCdXQgZm9yIG5vdywgZXJyX2NudF9pbml0IGlzIGV4YWN0bHkgd2hhdCB3ZSBkaWQu
IA0KDQpSZWdhcmRzLA0KSGF3a2luZw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+IA0KU2VudDogMjAxOeW5tDnmnIg55pel
IDExOjAxDQpUbzogWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5j
b20+DQpTdWJqZWN0OiBSRTogW1BBVENIIDMvM10gZHJtL2FtZGdwdTogcmVuYW1lIHVtYyByYXNf
aW5pdCB0byByYXNfYXNpY19pbml0DQoNCnVtYy5mdW5jcy0+cmFzX2xhdGVfaW5pdCBpcyBjb21t
b24gZm9yIGFsbCB2ZXJzaW9ucyBvZiB1bWMsIHNvIGl0J3MgaW1wbGVtZW50ZWQgaW4gYW1kZ3B1
X3VtYy5jLCBidXQgcmFzX2FzaWNfaW5pdCBpcyBzcGVjaWZpYyB0byBlYWNoIHZlcnNpb24gb2Yg
dW1jIGFuZCBpcyBwbGFjZWQgaW4gdW1jX3Z4X3guYy4NCmVycl9jbnRfaW5pdCBpcyBnb29kIGZv
ciBjdXJyZW50IGltcGxlbWVudGF0aW9uIGJ1dCBtYXkgYmUgbm90IGVub3VnaCBmb3IgdGhlIGZ1
dHVyZSwgaG93IGFib3V0IHJlbmFtZSBpdCB0byB1bWMuZnVuY3MtPnJhc19od19pbml0Pw0KDQpS
ZWdhcmRzLA0KVGFvDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWmhh
bmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCj4gU2VudDogMjAxOeW5tDnmnIg5
5pelIDY6NDANCj4gVG86IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBa
aG91MSwgVGFvIA0KPiA8VGFvLlpob3UxQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgQ2hlbiwgR3VjaHVuIA0KPiA8R3VjaHVuLkNoZW5AYW1kLmNvbT4NCj4gU3ViamVj
dDogUkU6IFtQQVRDSCAzLzNdIGRybS9hbWRncHU6IHJlbmFtZSB1bWMgcmFzX2luaXQgdG8gDQo+
IHJhc19hc2ljX2luaXQNCj4gDQo+IE5ldmVyIG1pbmQuIEkgd2FzIGNvbmZ1c2VkIGJ5IHRoZSBu
YW1lICJyYXNfYXNpY19pbml0Ii4gVGhlIA0KPiBwcm9ncmFtbWluZyBzZXF1ZW5jZSBpcyBleGFj
dGx5IHdoYXQgd2UgZGlzY3Vzc2VkIGJlZm9yZS4gSSB0aGluayB3ZSANCj4gY2FuIHJlbmFtZSB0
aGlzIGZ1bmN0aW9uIHRvICJlcnJfY250X2luaXQiLg0KPiANCj4gUmVnYXJkcywNCj4gSGF3a2lu
Zw0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4
LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgDQo+IFpoYW5nLCBI
YXdraW5nDQo+IFNlbnQ6IDIwMTnlubQ55pyIOeaXpSA2OjIzDQo+IFRvOiBaaG91MSwgVGFvIDxU
YW8uWmhvdTFAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyANCj4gQ2hl
biwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIDMv
M10gZHJtL2FtZGdwdTogcmVuYW1lIHVtYyByYXNfaW5pdCB0byANCj4gcmFzX2FzaWNfaW5pdA0K
PiANCj4gVGhlIHJhcyBpbml0IChvciB0aGUgbmV3IGFzaWNfaW5pdCkgc2VlbXMgbm90IG5lY2Vz
c2FyeSBhcyBsYXN0IHRpbWUgDQo+IHdlIGRpc2N1c3NlZC4gQW55IFVNQyBSQVMgcmVnaXN0ZXIg
aW5pdGlhbGl6YXRpb24gaXMgc2FmZSBlbm91Z2ggdG8gYmUgDQo+IGNlbnRyYWxpemVkIHRvIHJh
c19sYXRlX2luaXQgaW50ZXJmYWNlLiBJIHdvdWxkIHN1Z2dlc3QgdG8gcmVkdWNlIHN1Y2ggDQo+
IGtpbmQgb2YgdW4tbmVjZXNzYXJ5IGludGVyZmFjZS4NCj4gDQo+IFJlZ2FyZHMsDQo+IEhhd2tp
bmcNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWmhvdTEsIFRhbyA8VGFv
Llpob3UxQGFtZC5jb20+DQo+IFNlbnQ6IDIwMTnlubQ55pyINuaXpSAxNzowMQ0KPiBUbzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpoYW5nLCBIYXdraW5nIA0KPiA8SGF3a2luZy5a
aGFuZ0BhbWQuY29tPjsgQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPg0KPiBDYzog
WmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAzLzNdIGRy
bS9hbWRncHU6IHJlbmFtZSB1bWMgcmFzX2luaXQgdG8gcmFzX2FzaWNfaW5pdA0KPiANCj4gdGhp
cyBpbnRlcmZhY2UgaXMgcmVsYXRlZCB0byBzcGVjaWZpYyB2ZXJzaW9uIG9mIHVtYywgZGlzdGlu
Z3Vpc2ggaXQgDQo+IGZyb20gcmFzX2xhdGVfaW5pdA0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGFv
IFpob3UgPHRhby56aG91MUBhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV91bWMuYyB8IDQgKystLSANCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3VtYy5oIHwgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1j
X3Y2XzEuYyAgIHwgMiArLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3VtYy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vt
Yy5jDQo+IGluZGV4IDU2ODNjNTE3MTBhYS4uYjFjN2Y2NDNmMTk4IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jDQo+IEBAIC02Myw4ICs2Myw4IEBAIGludCBh
bWRncHVfdW1jX3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgDQo+ICphZGV2LCB2
b2lkICpyYXNfaWhfaW5mbykNCj4gIAl9DQo+IA0KPiAgCS8qIHJhcyBpbml0IG9mIHNwZWNpZmlj
IHVtYyB2ZXJzaW9uICovDQo+IC0JaWYgKGFkZXYtPnVtYy5mdW5jcyAmJiBhZGV2LT51bWMuZnVu
Y3MtPnJhc19pbml0KQ0KPiAtCQlhZGV2LT51bWMuZnVuY3MtPnJhc19pbml0KGFkZXYpOw0KPiAr
CWlmIChhZGV2LT51bWMuZnVuY3MgJiYgYWRldi0+dW1jLmZ1bmNzLT5yYXNfYXNpY19pbml0KQ0K
PiArCQlhZGV2LT51bWMuZnVuY3MtPnJhc19hc2ljX2luaXQoYWRldik7DQo+IA0KPiAgCXJldHVy
biAwOw0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV91bWMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuaA0KPiBp
bmRleCA2ZjIyYzk3MDQ1NTUuLmE1ZTRkZjI0NDBiZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV91bWMuaA0KPiBAQCAtNTQsNyArNTQsNyBAQA0KPiAgCWFkZXYtPnVt
Yy5mdW5jcy0+ZGlzYWJsZV91bWNfaW5kZXhfbW9kZShhZGV2KTsNCj4gDQo+ICBzdHJ1Y3QgYW1k
Z3B1X3VtY19mdW5jcyB7DQo+IC0Jdm9pZCAoKnJhc19pbml0KShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldik7DQo+ICsJdm9pZCAoKnJhc19hc2ljX2luaXQpKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KTsNCj4gIAlpbnQgKCpyYXNfbGF0ZV9pbml0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwgdm9pZCAqcmFzX2loX2luZm8pOw0KPiAgCXZvaWQgKCpxdWVyeV9yYXNfZXJyb3JfY291
bnQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgCQkJCQl2b2lkICpyYXNfZXJyb3Jf
c3RhdHVzKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192
Nl8xLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jDQo+IGluZGV4
IDRjZGI1YzA0Y2QxNy4uOTJmM2IxNDhlMTgxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3VtY192Nl8xLmMNCj4gQEAgLTI3Miw3ICsyNzIsNyBAQCBzdGF0aWMgdm9pZCB1bWNfdjZf
MV9yYXNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZQ0KPiAqYWRldikgIH0NCj4gDQo+ICBjb25z
dCBzdHJ1Y3QgYW1kZ3B1X3VtY19mdW5jcyB1bWNfdjZfMV9mdW5jcyA9IHsNCj4gLQkucmFzX2lu
aXQgPSB1bWNfdjZfMV9yYXNfaW5pdCwNCj4gKwkucmFzX2FzaWNfaW5pdCA9IHVtY192Nl8xX3Jh
c19pbml0LA0KPiAgCS5yYXNfbGF0ZV9pbml0ID0gYW1kZ3B1X3VtY19yYXNfbGF0ZV9pbml0LA0K
PiAgCS5xdWVyeV9yYXNfZXJyb3JfY291bnQgPSB1bWNfdjZfMV9xdWVyeV9yYXNfZXJyb3JfY291
bnQsDQo+ICAJLnF1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzID0gdW1jX3Y2XzFfcXVlcnlfcmFzX2Vy
cm9yX2FkZHJlc3MsDQo+IC0tDQo+IDIuMTcuMQ0KPiANCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
