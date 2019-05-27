Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479C22AE93
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 08:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A193D892C1;
	Mon, 27 May 2019 06:26:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710082.outbound.protection.outlook.com [40.107.71.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588A6892C1
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 06:26:06 +0000 (UTC)
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB2958.namprd12.prod.outlook.com (20.179.80.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.20; Mon, 27 May 2019 06:26:05 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::18c6:70fa:9f7e:7018]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::18c6:70fa:9f7e:7018%2]) with mapi id 15.20.1922.018; Mon, 27 May 2019
 06:26:05 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Topic: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Index: AQHVEhwkO7SauQcPcUOqxoEv6VWNH6Z+TsYAgAA2xZA=
Date: Mon, 27 May 2019 06:26:04 +0000
Message-ID: <MN2PR12MB3344F1FD64F0A54BF34A1852E41D0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1558694002-19915-1-git-send-email-Emily.Deng@amd.com>
 <MWHPR12MB1326D8B853B29C387FC1874B8F1D0@MWHPR12MB1326.namprd12.prod.outlook.com>
In-Reply-To: <MWHPR12MB1326D8B853B29C387FC1874B8F1D0@MWHPR12MB1326.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f725aaa-d01b-46fd-6c43-08d6e26c327f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2958; 
x-ms-traffictypediagnostic: MN2PR12MB2958:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB29584FDB5CDE7E9989F588A0E41D0@MN2PR12MB2958.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-forefront-prvs: 0050CEFE70
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(136003)(39860400002)(396003)(366004)(199004)(189003)(13464003)(72206003)(99286004)(25786009)(966005)(478600001)(14444005)(256004)(7736002)(6116002)(305945005)(66476007)(229853002)(52536014)(71200400001)(81156014)(81166006)(71190400001)(5660300002)(66066001)(316002)(6436002)(33656002)(3846002)(2501003)(74316002)(14454004)(8676002)(8936002)(86362001)(9686003)(6306002)(6246003)(102836004)(6506007)(486006)(476003)(68736007)(2906002)(55016002)(53546011)(446003)(11346002)(73956011)(66946007)(53936002)(66556008)(64756008)(66446008)(110136005)(76176011)(7696005)(76116006)(186003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2958;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sduOxdSuxTzVxEx+I6TvlFd7gPO9FN0p+UOJxV+z1M6yBc6IP9fM1/GAb5AWLd0fN3G20vDgS9ODQ+HE52xvBUskxnTGiL6upfkKZ24TTOesG3f5c9zUaCFFUG7R1gq32dSiSQnVONOBqFZhheZGU4JIdLQXEBp3zR3o10TJQLxydOP80URx88X7hvIhewHOodvqKhjW3Xr6EVgPWHWZYgLgmh6VgMO2dEGlOLCNgUm0hIV9wr8FnjyqARmlSPCZ9uQT89OCJQCGZHDtqMDhvpvVKjyhvproT9UkrUUIiHLdm8nfJbJytBqPRUwY++qcJwjeRDjvcI/mC0jod1TfYCM1PDwXPhMUX0vwV8mI01LTZofSZD1fPdgG+1AO/PPmN0oVIwc1ZKLj6hXY02/hKobEo+nXoDKB7BdbeDa5vKg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f725aaa-d01b-46fd-6c43-08d6e26c327f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2019 06:26:04.8542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2958
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZJ9IUfr63wUesK/LlFGDLg4PKo+nj5JQ33mejTWRuw=;
 b=QvtAaaX0AbD3cjTr5KRf7f8CRFNlJI57A/gTc8cYkI+FZ2W5Pc3Cj//VFK+a4SLdgIzLhyM7/EvYoGXbqR1u4A9dKTP7Rz+7U7AVSgQVTqVvfva1i8cuE57pB9tb0PW1KcMCzmKKVlfjB8ev8hSDpU3Vbi6t6Mqz/X0DSenUJGY=
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

RGlkIHlvdSBldmVyIHRlc3QgUzMgc3VzcGVuZC9yZXN1bWU/IE9uIFMzIHN1c3BlbmQvcmVzdW1l
IHBhdGgsIG9ubHkgaHdfZmluaSB3YXMgY2FsbGVkLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3Rv
cC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBEZW5nLCBFbWlseQ0KPiBTZW50OiBNb25kYXksIE1heSAy
NywgMjAxOSAxMTowOSBBTQ0KPiBUbzogRGVuZywgRW1pbHkgPEVtaWx5LkRlbmdAYW1kLmNvbT47
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRy
bS9hbWRncHU6IERvbid0IG5lZWQgdG8gY2FsbCBjc2JfdnJhbV91bnBpbg0KPiANCj4gUGluZy4u
Li4uLg0KPiANCj4gQmVzdCB3aXNoZXMNCj4gRW1pbHkgRGVuZw0KPiA+LS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiA+RW1pbHkgRGVuZw0KPiA+U2VudDogRnJpZGF5
LCBNYXkgMjQsIDIwMTkgNjozMyBQTQ0KPiA+VG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+ID5DYzogRGVuZywgRW1pbHkgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCj4gPlN1YmplY3Q6
IFtQQVRDSF0gZHJtL2FtZGdwdTogRG9uJ3QgbmVlZCB0byBjYWxsIGNzYl92cmFtX3VucGluDQo+
ID4NCj4gPltDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4gPg0KPiA+QXMgaXQgd2lsbCBkZXN0
b3J5IGNsZWFyX3N0YXRlX29iaiwgYW5kIGFsc28gd2lsbCB1bnBpbiBpdCBpbiB0aGUNCj4gPmdm
eF92OV8wX3N3X2ZpbmksIHNvIGRvbid0IG5lZWQgdG8gY2FsbCBjc2JfdnJhbSB1bnBpbiBpbg0K
PiA+Z2Z4X3Y5XzBfaHdfZmluaSwgb3IgaXQgd2lsbCBoYXZlIHVucGluIHdhcm5pbmcuDQo+ID4N
Cj4gPlNpZ25lZC1vZmYtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCj4gPi0t
LQ0KPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCAxNiAtLS0tLS0t
LS0tLS0tLS0tDQo+ID4gMSBmaWxlIGNoYW5nZWQsIDE2IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID5k
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPiA+Yi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+ID5pbmRleCBjNzYzNzMzLi4y
MzFiOWUwIDEwMDY0NA0KPiA+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5
XzAuYw0KPiA+KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPiA+
QEAgLTExNTQsMjAgKzExNTQsNiBAQCBzdGF0aWMgaW50IGdmeF92OV8wX2NzYl92cmFtX3Bpbihz
dHJ1Y3QNCj4gPmFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ID4gICAgICAgIHJldHVybiByOw0KPiA+
IH0NCj4gPg0KPiA+LXN0YXRpYyB2b2lkIGdmeF92OV8wX2NzYl92cmFtX3VucGluKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KSAtew0KPiA+LSAgICAgICBpbnQgcjsNCj4gPi0NCj4gPi0gICAg
ICAgaWYgKCFhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaikNCj4gPi0gICAgICAgICAgICAg
ICByZXR1cm47DQo+ID4tDQo+ID4tICAgICAgIHIgPSBhbWRncHVfYm9fcmVzZXJ2ZShhZGV2LT5n
ZngucmxjLmNsZWFyX3N0YXRlX29iaiwgdHJ1ZSk7DQo+ID4tICAgICAgIGlmIChsaWtlbHkociA9
PSAwKSkgew0KPiA+LSAgICAgICAgICAgICAgIGFtZGdwdV9ib191bnBpbihhZGV2LT5nZngucmxj
LmNsZWFyX3N0YXRlX29iaik7DQo+ID4tICAgICAgICAgICAgICAgYW1kZ3B1X2JvX3VucmVzZXJ2
ZShhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaik7DQo+ID4tICAgICAgIH0NCj4gPi19DQo+
ID4tDQo+ID4gc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfbWVjX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpICB7DQo+ID4gICAgICAgIGFtZGdwdV9ib19mcmVlX2tlcm5lbCgmYWRldi0+Z2Z4
Lm1lYy5ocGRfZW9wX29iaiwgTlVMTCwgTlVMTCk7DQo+ID5AQCAtMzM4NSw4ICszMzcxLDYgQEAg
c3RhdGljIGludCBnZnhfdjlfMF9od19maW5pKHZvaWQgKmhhbmRsZSkNCj4gPiAgICAgICAgZ2Z4
X3Y5XzBfY3BfZW5hYmxlKGFkZXYsIGZhbHNlKTsNCj4gPiAgICAgICAgYWRldi0+Z2Z4LnJsYy5m
dW5jcy0+c3RvcChhZGV2KTsNCj4gPg0KPiA+LSAgICAgICBnZnhfdjlfMF9jc2JfdnJhbV91bnBp
bihhZGV2KTsNCj4gPi0NCj4gPiAgICAgICAgcmV0dXJuIDA7DQo+ID4gfQ0KPiA+DQo+ID4tLQ0K
PiA+Mi43LjQNCj4gPg0KPiA+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCj4gPmFtZC1nZnggbWFpbGluZyBsaXN0DQo+ID5hbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiA+aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
