Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 501362AD3F
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 05:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8D0893BC;
	Mon, 27 May 2019 03:08:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750089.outbound.protection.outlook.com [40.107.75.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE838893BC
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 03:08:51 +0000 (UTC)
Received: from MWHPR12MB1326.namprd12.prod.outlook.com (10.169.205.19) by
 MWHPR12MB1616.namprd12.prod.outlook.com (10.172.53.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Mon, 27 May 2019 03:08:46 +0000
Received: from MWHPR12MB1326.namprd12.prod.outlook.com
 ([fe80::2c1a:62f0:b1bd:74d7]) by MWHPR12MB1326.namprd12.prod.outlook.com
 ([fe80::2c1a:62f0:b1bd:74d7%2]) with mapi id 15.20.1922.021; Mon, 27 May 2019
 03:08:46 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Topic: [PATCH] drm/amdgpu: Don't need to call csb_vram_unpin
Thread-Index: AQHVEhwkIof8G6RteEy5z4Muf2//YaZ+TrVQ
Date: Mon, 27 May 2019 03:08:46 +0000
Message-ID: <MWHPR12MB1326D8B853B29C387FC1874B8F1D0@MWHPR12MB1326.namprd12.prod.outlook.com>
References: <1558694002-19915-1-git-send-email-Emily.Deng@amd.com>
In-Reply-To: <1558694002-19915-1-git-send-email-Emily.Deng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50cf860a-5895-440a-fb64-08d6e250a252
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1616; 
x-ms-traffictypediagnostic: MWHPR12MB1616:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR12MB16161076AED1D8F385A677CF8F1D0@MWHPR12MB1616.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0050CEFE70
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(346002)(376002)(396003)(136003)(13464003)(189003)(199004)(476003)(86362001)(66446008)(102836004)(74316002)(486006)(81156014)(81166006)(186003)(14444005)(8676002)(26005)(478600001)(76176011)(52536014)(72206003)(5660300002)(8936002)(53936002)(71190400001)(14454004)(71200400001)(256004)(6306002)(229853002)(316002)(33656002)(2906002)(7696005)(110136005)(66066001)(68736007)(9686003)(25786009)(305945005)(66476007)(6246003)(73956011)(66556008)(6506007)(76116006)(2501003)(446003)(66946007)(64756008)(11346002)(7736002)(99286004)(6436002)(3846002)(6116002)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1616;
 H:MWHPR12MB1326.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ej6CtcqKVZYelNCyBWMFxmnsRo8MFbkIHbB7HBQnuX72uyY2NmWfMGTGM3HyGSX1wMeaowcqX4b9t+9r1zoHm8OmjURkNlZpUG3GRt8IUd4ZPfoFl7c8UVlJdTBUxT8ygLIWVhqtEcVf3gWO4fHPWrhOZGojr0+tJFQrXAEQdy7PHw0502EBnufg9ZSRm4BGvStMu3OqrK2aWcORxfFMA1Z4p6tjdcVYFbRHfE6IvO3w9BCJQYuFzT175pYwWqj6KKsN3iryS0V0fqhHN8D0+NmgNB20dpgj+2z5ekAdgjpDGE8UAW5UiBFnhD3yxn6nhJqVKVivm2L1Zct9hc60lenas8MLnh/OYyWwk8kgh43K5DOR+uJSOVEw9ogMqJLO+tvQD8IneC4C/wdGNK9FO2tFam1GGuaEM4W8fCRXmig=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50cf860a-5895-440a-fb64-08d6e250a252
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2019 03:08:46.6681 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqdeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1616
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bmazBT0+bvjxeaclGcQKgJ1mMGBZQncnYvjl4zteU0=;
 b=BXgZ2U13Z5Fo98IUm2N7ukeIYrE7Ay4qKOJs7H1EisDQi3xWpwR6kSPBgchsg4B7lZYCqQWRNrUMt6ROcPYj4TasIK/79ejt9JTIqS06Y916WYLoDB8+T1FbT2O3fpQFS6kuD3G7//gBnYxIcoQFyIytSkOmTn40nieGFrInSnw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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

UGluZy4uLi4uLg0KDQpCZXN0IHdpc2hlcw0KRW1pbHkgRGVuZw0KPi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+RnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz4gT24gQmVoYWxmIE9mIEVtaWx5DQo+RGVuZw0KPlNlbnQ6IEZyaWRheSwgTWF5IDI0
LCAyMDE5IDY6MzMgUE0NCj5UbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj5DYzog
RGVuZywgRW1pbHkgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCj5TdWJqZWN0OiBbUEFUQ0hdIGRybS9h
bWRncHU6IERvbid0IG5lZWQgdG8gY2FsbCBjc2JfdnJhbV91bnBpbg0KPg0KPltDQVVUSU9OOiBF
eHRlcm5hbCBFbWFpbF0NCj4NCj5BcyBpdCB3aWxsIGRlc3RvcnkgY2xlYXJfc3RhdGVfb2JqLCBh
bmQgYWxzbyB3aWxsIHVucGluIGl0IGluIHRoZSBnZnhfdjlfMF9zd19maW5pLA0KPnNvIGRvbid0
IG5lZWQgdG8gY2FsbCBjc2JfdnJhbSB1bnBpbiBpbiBnZnhfdjlfMF9od19maW5pLCBvciBpdCB3
aWxsIGhhdmUgdW5waW4NCj53YXJuaW5nLg0KPg0KPlNpZ25lZC1vZmYtYnk6IEVtaWx5IERlbmcg
PEVtaWx5LkRlbmdAYW1kLmNvbT4NCj4tLS0NCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3Y5XzAuYyB8IDE2IC0tLS0tLS0tLS0tLS0tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDE2IGRl
bGV0aW9ucygtKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjlfMC5jDQo+Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+aW5k
ZXggYzc2MzczMy4uMjMxYjllMCAxMDA2NDQNCj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjlfMC5jDQo+KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5
XzAuYw0KPkBAIC0xMTU0LDIwICsxMTU0LDYgQEAgc3RhdGljIGludCBnZnhfdjlfMF9jc2JfdnJh
bV9waW4oc3RydWN0DQo+YW1kZ3B1X2RldmljZSAqYWRldikNCj4gICAgICAgIHJldHVybiByOw0K
PiB9DQo+DQo+LXN0YXRpYyB2b2lkIGdmeF92OV8wX2NzYl92cmFtX3VucGluKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KSAtew0KPi0gICAgICAgaW50IHI7DQo+LQ0KPi0gICAgICAgaWYgKCFh
ZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaikNCj4tICAgICAgICAgICAgICAgcmV0dXJuOw0K
Pi0NCj4tICAgICAgIHIgPSBhbWRncHVfYm9fcmVzZXJ2ZShhZGV2LT5nZngucmxjLmNsZWFyX3N0
YXRlX29iaiwgdHJ1ZSk7DQo+LSAgICAgICBpZiAobGlrZWx5KHIgPT0gMCkpIHsNCj4tICAgICAg
ICAgICAgICAgYW1kZ3B1X2JvX3VucGluKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqKTsN
Cj4tICAgICAgICAgICAgICAgYW1kZ3B1X2JvX3VucmVzZXJ2ZShhZGV2LT5nZngucmxjLmNsZWFy
X3N0YXRlX29iaik7DQo+LSAgICAgICB9DQo+LX0NCj4tDQo+IHN0YXRpYyB2b2lkIGdmeF92OV8w
X21lY19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSAgew0KPiAgICAgICAgYW1kZ3B1
X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5nZngubWVjLmhwZF9lb3Bfb2JqLCBOVUxMLCBOVUxMKTsN
Cj5AQCAtMzM4NSw4ICszMzcxLDYgQEAgc3RhdGljIGludCBnZnhfdjlfMF9od19maW5pKHZvaWQg
KmhhbmRsZSkNCj4gICAgICAgIGdmeF92OV8wX2NwX2VuYWJsZShhZGV2LCBmYWxzZSk7DQo+ICAg
ICAgICBhZGV2LT5nZngucmxjLmZ1bmNzLT5zdG9wKGFkZXYpOw0KPg0KPi0gICAgICAgZ2Z4X3Y5
XzBfY3NiX3ZyYW1fdW5waW4oYWRldik7DQo+LQ0KPiAgICAgICAgcmV0dXJuIDA7DQo+IH0NCj4N
Cj4tLQ0KPjIuNy40DQo+DQo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCj5hbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
