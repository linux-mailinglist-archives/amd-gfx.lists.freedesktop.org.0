Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B783FB07AD
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 06:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545156EC11;
	Thu, 12 Sep 2019 04:12:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700055.outbound.protection.outlook.com [40.107.70.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDF36E02C
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 21:59:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBUG+InSIXrmLD1doBdQ1PBOzPaUSlhbGLkGhBiQTinjO4f29fKJfEZk0+vGuKvqp0iy4NPj9Led8Sru30Pu4WtlYO7KYd8HTCzDqdwey5PCO0i4i8QofclN6uG2iKz+awXy5lVHPTtKFSNQRL3BBIEDRxE2TwARY08kefIgXtB4vqJHpBuleFhm/Qscj6D+znNxtsVgXRgkiJgmA27I+b1uImTLGrE7AhJUXiVsLKOc3rMLMIYA/JX3FIUKmtX68BWN/NsQozgEg0euCHBMpPRMGeH96BK/wLFbOIzK2pL5ljTtaB21XFaHwpkYNgdDbQ8Oq3PA5uoRysuqBgG20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zY2kia0FBoJQEJiW4ZdxZIWTTWflOnsOs2tg99jK4ng=;
 b=XsdWlHnzRJnVftASFMeV44j8LAoPdGl+U1O7fSSicLMLqnaplIJCoulVYdqD+b5QHYBudX81yg5wc0DntJFfz52VMeCdSfuWdkAVPa7sEM4T6ijkut0XGT0X7gErr8rnmoDQhrseCKUaEDMYCw/I4K2ITOfqEMFU7Q4BGoDbpDuQlYm+xmwzMDZFpVSGIUxMNFx8ksKdvGIWcAOWuTJ0Z7ecnpaXr4NU84uQPR6DyZns4j9tahaWSsHa9x7c7Rz+/CY66/C+sfFChvDrNWEXEGQTURnvclXK/Vnniwgpim/Z8n6/RshK/WFXZpLhpL2ZB7dfwabEffiBPS90wEuxjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3962.namprd12.prod.outlook.com (10.255.174.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Wed, 11 Sep 2019 21:59:16 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 21:59:16 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "S, Shirish" <Shirish.S@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix build error without CONFIG_HSA_AMD (V2)
Thread-Topic: [PATCH] drm/amdgpu: fix build error without CONFIG_HSA_AMD (V2)
Thread-Index: AQHVaG2HB6z7JcsTPE2B5uyPrFeG+acnB3KA
Date: Wed, 11 Sep 2019 21:59:16 +0000
Message-ID: <f78eeb5d-bc32-b72b-8d1b-3fdee9ea43db@amd.com>
References: <1568184761-20949-1-git-send-email-shirish.s@amd.com>
In-Reply-To: <1568184761-20949-1-git-send-email-shirish.s@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTBPR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::33) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52a3e162-54b7-4e9a-43b8-08d737034a34
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3962; 
x-ms-traffictypediagnostic: DM6PR12MB3962:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3962096C8E34D4B56F3F737D92B10@DM6PR12MB3962.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(199004)(189003)(81156014)(81166006)(66556008)(53936002)(229853002)(71190400001)(71200400001)(305945005)(478600001)(7736002)(14454004)(110136005)(11346002)(58126008)(3846002)(31686004)(65806001)(65956001)(6116002)(66066001)(5660300002)(66476007)(6512007)(2906002)(6486002)(66946007)(66446008)(6636002)(256004)(52116002)(446003)(64756008)(31696002)(316002)(6246003)(6506007)(8676002)(6436002)(86362001)(102836004)(386003)(26005)(76176011)(53546011)(4326008)(36756003)(8936002)(2616005)(99286004)(476003)(186003)(25786009)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3962;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Xlkihlyx8f/W4pxQfuwme2KrR2BCe1xGRR0h8s/gCG6oJ+czfMk8SyJ3B5kg/ZnQeb5WwnG8Yg03GumhaI7Wb81JJD4Q/+yd0GibBLO0QwqanVFiVC6t0uaoipblT38h+yrI1JLmLX9M4LkhM9yOQhfF4h/jxOuDV1fHd83tGrR2hN0vLnwrh6RFBzMgJ0PNWvn8xGEQDZc/uK/URhzmSWXFtmGeYLRIQ/+bDSdc9UuBKxtHhsotKQJ7MbmQkHRx8ZQ1TCgCyYVH/e9KXReTVqipLNCaF0nnt02BHXqW3YD7XAHNaN8kDJmdrxPzfrURecgyRop2GHblYNkZnbcgifXRVf8SxsjWY215VKbXrCbUECjZ0vFJSPdRaRnYmiKgKJx+mC3xAgDwmfyhP63qh+R6JThvOw+dJOo6kfAQeeQ=
Content-ID: <FFCF8502A074E74D854891414A58F257@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a3e162-54b7-4e9a-43b8-08d737034a34
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 21:59:16.7502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7GDCo/cxtP/7He83uJUpSYLluM5egdJHCZbZYvlxH1OeMdd73sGrZQ06mICtTmSy2PQjOYRvjesWywnly8miKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3962
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zY2kia0FBoJQEJiW4ZdxZIWTTWflOnsOs2tg99jK4ng=;
 b=16OpksJxA3779wKA3kNM+wbPUhL/YiA6kPyJfRTWCH89pTp91WDDCowwjQbASXhc/iGIuxNva0WdhAN8rGsSNVA8EODEFhCKzONK6OnFnMXbUu3B1sRtmXIK6xnBZ1SWw4sXlGokjqPM3nAvJxI1ZvM5b59ilbe9unMKa4+dwOk=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0xMSAyOjUyIGEubS4sIFMsIFNoaXJpc2ggd3JvdGU6DQo+IElmIENPTkZJR19I
U0FfQU1EIGlzIG5vdCBzZXQsIGJ1aWxkIGZhaWxzOg0KPg0KPiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLm86IEluIGZ1bmN0aW9uIGBhbWRncHVfZGV2aWNlX2lwX2Vh
cmx5X2luaXQnOg0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmM6
MTYyNjogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgc2NoZWRfcG9saWN5Jw0KPg0KPiBVc2UgQ09O
RklHX0hTQV9BTUQgdG8gZ3VhcmQgdGhpcy4NCj4NCj4gRml4ZXM6IDFhYmI2ODBhZDM3MSAoImRy
bS9hbWRncHU6IGRpc2FibGUgZ2Z4b2ZmIHdoaWxlIHVzZSBubyBIL1cgc2NoZWR1bGluZyBwb2xp
Y3kiKQ0KPg0KPiBWMjogZGVjbGFyZSBzY2hlZF9wb2xpY3kgaW4gYW1kZ3B1LmggYW5kIHJlbW92
ZSBjaGFuZ2VzIGluIGFtZGdwdV9kZXZpY2UuYw0KDQpXaGljaCBicmFuY2ggaXMgdGhpcyBmb3Iu
IFYxIG9mIHRoaXMgcGF0Y2ggd2FzIGFscmVhZHkgc3VibWl0dGVkIHRvIA0KYW1kLXN0YWdpbmct
ZHJtLW5leHQuIFNvIHVubGVzcyB5b3UncmUgcGxhbm5pbmcgdG8gcmV2ZXJ0IHYxIGFuZCBzdWJt
aXQgDQp2MiwgSSB3YXMgZXhwZWN0aW5nIHRvIHNlZSBhIGNoYW5nZSB0aGF0IGZpeGVzIHVwIHRo
ZSBwcmV2aW91cyBwYXRjaCwgDQpyYXRoZXIgdGhhbiBhIHBhdGNoIHRoYXQgcmVwbGFjZXMgaXQu
DQoNClJlZ2FyZHMsDQogwqAgRmVsaXgNCg0KDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFNoaXJpc2gg
UyA8c2hpcmlzaC5zQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oIHwgNCArKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1Lmgg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPiBpbmRleCAxMDMwY2IzLi42
ZmYwMmJiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUu
aA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPiBAQCAtMTY5
LDcgKzE2OSwxMSBAQCBleHRlcm4gaW50IGFtZGdwdV9kaXNjb3Zlcnk7DQo+ICAgZXh0ZXJuIGlu
dCBhbWRncHVfbWVzOw0KPiAgIGV4dGVybiBpbnQgYW1kZ3B1X25vcmV0cnk7DQo+ICAgZXh0ZXJu
IGludCBhbWRncHVfZm9yY2VfYXNpY190eXBlOw0KPiArI2lmZGVmIENPTkZJR19IU0FfQU1EDQo+
ICAgZXh0ZXJuIGludCBzY2hlZF9wb2xpY3k7DQo+ICsjZWxzZQ0KPiArc3RhdGljIGNvbnN0IGlu
dCBzY2hlZF9wb2xpY3kgPSBLRkRfU0NIRURfUE9MSUNZX0hXUzsNCj4gKyNlbmRpZg0KPiAgIA0K
PiAgICNpZmRlZiBDT05GSUdfRFJNX0FNREdQVV9TSQ0KPiAgIGV4dGVybiBpbnQgYW1kZ3B1X3Np
X3N1cHBvcnQ7DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
