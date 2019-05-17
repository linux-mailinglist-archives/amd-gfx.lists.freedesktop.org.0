Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D04213E2
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 08:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC64189854;
	Fri, 17 May 2019 06:53:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam04on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4e::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFBA89854
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 06:53:37 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1545.namprd12.prod.outlook.com (10.172.35.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Fri, 17 May 2019 06:53:35 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 06:53:35 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Tao, Yintian" <Yintian.Tao@amd.com>
Subject: Re: [PATCH] drm/amdgpu: skip fw pri bo alloc for SRIOV
Thread-Topic: [PATCH] drm/amdgpu: skip fw pri bo alloc for SRIOV
Thread-Index: AQHVC94FavSrKvZPp0CPl1uF2nyUjaZunC7ggABGjYA=
Date: Fri, 17 May 2019 06:53:35 +0000
Message-ID: <f77131be-9a53-789d-0f1e-c743c80dc11a@amd.com>
References: <1558007618-24482-1-git-send-email-yttao@amd.com>
 <MN2PR12MB3039EAC37D6BB17BD3582D77E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3039EAC37D6BB17BD3582D77E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM5P194CA0015.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::25) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3af0ead2-b54e-49f1-cdd3-08d6da946211
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1545; 
x-ms-traffictypediagnostic: DM5PR12MB1545:
x-microsoft-antispam-prvs: <DM5PR12MB154518FF67D6A3BB12A13935830B0@DM5PR12MB1545.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(366004)(376002)(39860400002)(346002)(51874003)(199004)(189003)(13464003)(99286004)(76176011)(71200400001)(8936002)(66476007)(14454004)(64756008)(66556008)(52116002)(64126003)(6116002)(73956011)(66946007)(6436002)(486006)(66446008)(65826007)(6486002)(81156014)(81166006)(8676002)(68736007)(7736002)(478600001)(229853002)(4326008)(58126008)(31686004)(37006003)(6636002)(36756003)(305945005)(54906003)(2616005)(6506007)(72206003)(2906002)(71190400001)(86362001)(6246003)(316002)(6512007)(476003)(386003)(53546011)(102836004)(446003)(11346002)(65806001)(186003)(256004)(53936002)(25786009)(65956001)(6862004)(46003)(31696002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1545;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1r5IEhhYb0fXCUnzxXp5XtRGJ/t3X8rz1TixpZOARA4U0IbiLZy7Lb3FW2yKThdMdFjlLkMczjR1aMbEm6s4v98Jjyn8JZPTztRHANFmVyhj3MMY8ZD0/6LUiuYfPkIAPwe7tGddz4J4ODE+aWKs2+vIuqYFeth7czMqUvVzm7CleIjRZwUaWIq9mvaWSqBReFpJBJ5eC1WsISfYJK94qmdzce44mYp2bngTSfslvT+ujecWUs7tgIXU010EBRxbXE2GKTmU/tQwxWhtIcVhNOGr9Enpg4lX3xDhX9fi4zoB2aRxWFaU4PffUkqJwnq41ISYRZEEPptC60+nwdK9YrhKd9JUgoCBX7PEyv55dUbt7x8bn6y08w5h/3SoLNzsDwkHhaUhfJscN1w5uaiitXFXnwwsangNPgmsAKWpSys=
Content-ID: <E8A89CEB601C4B4CA78A120955226427@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af0ead2-b54e-49f1-cdd3-08d6da946211
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 06:53:35.8215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1545
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/pXRLD58FVi334Q5E/IVF+hS47Lxvbdd9imuIuEZ+A=;
 b=FbTVssYktaI71A7brJDI1h/8/Zg6czBbw6YF2HmXAcRK0/JB0iRRZ6Yp/hiDVERE10DUgVxWwsSQVwxgFQx8GDlLYa+nsHttmbf3HhEkDop4rzB0uekHszIes0DslhlbJjUQJoPQagfW/gWSeP2gZ0yixLO9d2+lcuwT2R+kGuQ=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Monk" <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TG9va3MgZ29vZCB0byBtZSBub3csIGJ1dCBJIGRvbid0IGtub3cgdGhlIHRlY2huaWNhbCBiYWNr
Z3JvdW5kIHdoeSB0aGlzIA0KQk8gaXMgbm90IG5lZWRlZCB1bmRlciBTUklPVi4NCg0KU28gdGhp
cyBwYXRjaCBpcyBBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPi4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KQW0gMTcuMDUuMTkgdW0gMDQ6NDEg
c2NocmllYiBUYW8sIFlpbnRpYW46DQo+IEhpIENocmlzdGlhbg0KPg0KPg0KPiBJIGhhdmUgbW9k
aWZpZWQgaXQgYWNjb3JkaW5nIHRvIHlvdXIgc3VnZ2VzdGlvbi4gQ2FuIHlvdSBoZWxwIHJldmll
dyB0aGlzIGFnYWluPyBUaGFua3MgaW4gYWR2YW5jZS4NCj4NCj4NCj4gQmVzdCBSZWdhcmRzDQo+
IFlpbnRpYW4gVGFvDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFlp
bnRpYW4gVGFvIDx5dHRhb0BhbWQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDE2LCAyMDE5
IDc6NTQgUE0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBUYW8s
IFlpbnRpYW4gPFlpbnRpYW4uVGFvQGFtZC5jb20+OyBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5j
b20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogc2tpcCBmdyBwcmkgYm8gYWxsb2Mg
Zm9yIFNSSU9WDQo+DQo+IFBTUCBmdyBwcmltYXJ5IGJ1ZmZlciBpcyBub3QgdXNlZCB1bmRlciBT
UklPVi4NCj4gVGhlcmVmb3JlLCB3ZSBkb24ndCBuZWVkIHRvIGFsbG9jYXRlIG1lbW9yeSBmb3Ig
aXQuDQo+DQo+IHYyOiByZW1vdmUgc3VwZXJmbHVvdXMgY2hlY2sgZm9yIGFtZGdwdV9ib19mcmVl
X2tlcm5lbCgpLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZaW50aWFuIFRhbyA8eXR0YW9AYW1kLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogTW9uayBMaXUgPE1vbmsuTGl1QGFtZC5jb20+DQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyB8IDE3ICsrKysrKysr
KystLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcHNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMNCj4gaW5k
ZXggYzU2N2E1NS4uYWY5ODM1YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BzcC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wc3AuYw0KPiBAQCAtOTA1LDEzICs5MDUsMTYgQEAgc3RhdGljIGludCBwc3BfbG9hZF9m
dyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICAJaWYgKCFwc3AtPmNtZCkNCj4gICAJ
CXJldHVybiAtRU5PTUVNOw0KPiAgIA0KPiAtCXJldCA9IGFtZGdwdV9ib19jcmVhdGVfa2VybmVs
KGFkZXYsIFBTUF8xX01FRywgUFNQXzFfTUVHLA0KPiAtCQkJCQlBTURHUFVfR0VNX0RPTUFJTl9H
VFQsDQo+IC0JCQkJCSZwc3AtPmZ3X3ByaV9ibywNCj4gLQkJCQkJJnBzcC0+ZndfcHJpX21jX2Fk
ZHIsDQo+IC0JCQkJCSZwc3AtPmZ3X3ByaV9idWYpOw0KPiAtCWlmIChyZXQpDQo+IC0JCWdvdG8g
ZmFpbGVkOw0KPiArCS8qIHRoaXMgZncgcHJpIGJvIGlzIG5vdCB1c2VkIHVuZGVyIFNSSU9WICov
DQo+ICsJaWYgKCFhbWRncHVfc3Jpb3ZfdmYocHNwLT5hZGV2KSkgew0KPiArCQlyZXQgPSBhbWRn
cHVfYm9fY3JlYXRlX2tlcm5lbChhZGV2LCBQU1BfMV9NRUcsIFBTUF8xX01FRywNCj4gKwkJCQkJ
ICAgICAgQU1ER1BVX0dFTV9ET01BSU5fR1RULA0KPiArCQkJCQkgICAgICAmcHNwLT5md19wcmlf
Ym8sDQo+ICsJCQkJCSAgICAgICZwc3AtPmZ3X3ByaV9tY19hZGRyLA0KPiArCQkJCQkgICAgICAm
cHNwLT5md19wcmlfYnVmKTsNCj4gKwkJaWYgKHJldCkNCj4gKwkJCWdvdG8gZmFpbGVkOw0KPiAr
CX0NCj4gICANCj4gICAJcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwoYWRldiwgUFNQX0ZF
TkNFX0JVRkZFUl9TSVpFLCBQQUdFX1NJWkUsDQo+ICAgCQkJCQlBTURHUFVfR0VNX0RPTUFJTl9W
UkFNLA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
