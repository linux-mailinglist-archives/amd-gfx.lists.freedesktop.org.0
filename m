Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE06D0618
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 05:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397FA6E8D0;
	Wed,  9 Oct 2019 03:44:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810055.outbound.protection.outlook.com [40.107.81.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDA16E8D0
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 03:44:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKUs3pSPNcDqHFbAu+NmzdPmngtuFaT9NaO4jkpUxpKma5saf6rsXBqSHmsiWnRV4cdKlD6kZK9ScYkHwwy4YYHCTlYe9dYr9hY+1VjCijra0cbZS8xgN0mDsDD+TThWKRPIv9jmDP2tOqJw0DrIW1T7tYJzxNzuPtBC+PzCLNfyXdf1wrkuWvAtHqhFmxnBIEySKBxz3Q3Z9X+g4rzA240Ra5g1a6YnHsdHkbMk4Cm1k4JSfs6oI6nQCHGDAta5uPVNPjkiHDwLlYepRT7L55sFiwPJRzJmBjhahgdV2c1I6BAelQj38gk9l4Wfhxsq2xZZgzhxba6evolVQyu9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMuk8WlNeysFRyT1x17bELc/OB6pegLlgKkbAIVSlxU=;
 b=KKvuSuG8AJXNGFqi2Vhy7l/u8qYIcg72xEjCJ9FiETKpeLp+k29LHXPwASE8IbAUmNbjV71iqWt9BgM95yE6V8tHaQx7z3JgvZ8ws+k7hGUOf/lpHuE67bmjQuQviHNI50NKcoTpuY/Cdz/277noloJNYkPAViqutWyfcU/wVh1ufYnRQ1sIHjIXUgOpACVsCmS2pMULLzjmO5eX9J19S1SydwYXq++NhYfxrmw+6oNgrV6jfuM5hPH5LEQLelPAvNA75jKYtJ0T4xJeSEESXn7LvGRmCnRHOQjm/E1s40JJ+LiZuZCzFFH3oW1SzUAeht49Yx0/0gOgwDzb0sMgOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB4152.namprd12.prod.outlook.com (20.180.6.72) by
 CH2PR12MB3847.namprd12.prod.outlook.com (52.132.247.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 9 Oct 2019 03:44:43 +0000
Received: from CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::80b1:7ed1:2bd5:4bd4]) by CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::80b1:7ed1:2bd5:4bd4%3]) with mapi id 15.20.2327.026; Wed, 9 Oct 2019
 03:44:42 +0000
From: "Tuikov, Luben" <Luben.Tuikov@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
Thread-Topic: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
Thread-Index: AQHVfg7ESSaCetind02kHZ9eBxxGsKdRq6WA
Date: Wed, 9 Oct 2019 03:44:42 +0000
Message-ID: <a9d04519-0ec0-41f6-289f-be156caccf76@amd.com>
References: <20191008192934.5481-1-alexander.deucher@amd.com>
 <20191008192934.5481-8-alexander.deucher@amd.com>
In-Reply-To: <20191008192934.5481-8-alexander.deucher@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::32) To CH2PR12MB4152.namprd12.prod.outlook.com
 (2603:10b6:610:a7::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f62b4a3f-084a-417a-d22f-08d74c6b0502
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CH2PR12MB3847:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB38478D528BAD95C9C3C514A499950@CH2PR12MB3847.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(189003)(199004)(7736002)(386003)(305945005)(26005)(316002)(186003)(11346002)(446003)(256004)(25786009)(3846002)(76176011)(6116002)(8676002)(53546011)(5660300002)(8936002)(54906003)(6246003)(52116002)(102836004)(81156014)(14454004)(99286004)(110136005)(4326008)(6506007)(81166006)(66066001)(71190400001)(71200400001)(66446008)(64756008)(66556008)(66476007)(478600001)(36756003)(6436002)(66946007)(2501003)(31696002)(31686004)(229853002)(6512007)(2906002)(6486002)(2616005)(476003)(486006)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3847;
 H:CH2PR12MB4152.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WRDdihWwV6WIrzwQP2q6qVuo+QI0jOBsGEPx8W17BhqLWTyrXuU/i1/Qe8m/du8xSqXvjYmEX0nRQitsJ0M1HqTOrGB7FDCyFMEVMyuifqEUANAUbSKx3950R/NWXZUI1qJkcM5l/zA+zNz5J3YlhZmdMUkra97y2FYt1IaDtRyAJL7WWNMo7OrHxOetggekn97rIpsAyFOQdkmLbINvBf38ijssd4B/tH5ZsqO8rhnhQwyD3VkDxxnPUufkKHYr7B++qpECuAMbrWitIGPme+lQfkfpM9L1foHQadh8+0YVf1R8ZhU38O00c/6AF+K2vSHIH8BYkr0fXY1jm7cLZXynvQmMRIIrDrB5lc5eM+fwetjdC1I7RK45wueXoepwByeDpmast11l6fYgTPgmaMCNvl7/UnMCdtAzvD7l62E=
Content-ID: <897C035E3FAD0B40BF4E36B2B64D3948@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f62b4a3f-084a-417a-d22f-08d74c6b0502
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 03:44:42.6688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5h45gGyf97+y/hLEmVj7YyllcgZM2SwPdJCzdTE0k92aqALpQ8MWSjo1jApbs8qx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3847
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMuk8WlNeysFRyT1x17bELc/OB6pegLlgKkbAIVSlxU=;
 b=cIzrZEN8rjqG+ebLnlB6KuNq2Js23JFlY014t6kW5hhCfTNTGFB0Lp9ZYwHrHoT9mcaUpHixw+joc01ONO/t0bQ57M0McTomZ1omwYTI0zfBBTJnHIqxcK18TMxuNd4IYewhRT4BhNWZY9g+nSZIjIUiwsMlmkkuZnK1fr9Uajg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luben.Tuikov@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0wOCAzOjI5IHAubS4sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gRnJvbTogIlRp
YW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+DQo+IA0KPiBtZW1vcnkgdHJhaW5pbmcgdXNp
bmcgc3BlY2lmaWMgZml4ZWQgdnJhbSBzZWdtZW50LCByZXNlcnZlIHRoZXNlDQo+IHNlZ21lbnRz
IGJlZm9yZSBhbnlvbmUgbWF5IGFsbG9jYXRlIGl0Lg0KPiANCj4gQ2hhbmdlLUlkOiBJMTQzNjc1
NTgxM2E1NjU2MDhhMjg1N2E2ODNmNTM1Mzc3NjIwYTYzNw0KPiBSZXZpZXdlZC1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBUaWFu
Y2kuWWluIDx0aWFuY2kueWluQGFtZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgOTYgKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAg
MSBmaWxlIGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmMNCj4gaW5kZXggNzRhOWJkOTRmMTBjLi4wODE5NzIxYWYxNmUg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4gQEAgLTE2
NjcsNiArMTY2Nyw5MyBAQCBzdGF0aWMgaW50IGFtZGdwdV90dG1fZndfcmVzZXJ2ZV92cmFtX2lu
aXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAJCQkJCSAgJmFkZXYtPmZ3X3ZyYW1f
dXNhZ2UudmEpOw0KPiAgfQ0KPiAgDQo+ICsvKg0KPiArICogTWVtb3kgdHJhaW5pbmcgcmVzZXJ2
YXRpb24gZnVuY3Rpb25zDQo+ICsgKi8NCg0KSW5jbHVkZSBhbiBlbXB0eSBsaW5lIGJldHdlZW4g
dGhlIHR3byBjb21tZW50cywganVzdCBhcyB5b3Ugd291bGQNCmEgcGFyYWdyYXBoIGluIHdyaXR0
ZW4gdGV4dC4NCg0KPiArLyoqDQo+ICsgKiBhbWRncHVfdHRtX3RyYWluaW5nX3Jlc2VydmVfdnJh
bV9maW5pIC0gZnJlZSBtZW1vcnkgdHJhaW5pbmcgcmVzZXJ2ZWQgdnJhbQ0KPiArICoNCj4gKyAq
IEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXINCj4gKyAqDQo+ICsgKiBmcmVlIG1lbW9yeSB0
cmFpbmluZyByZXNlcnZlZCB2cmFtIGlmIGl0IGhhcyBiZWVuIHJlc2VydmVkLg0KPiArICovDQo+
ICtzdGF0aWMgaW50IGFtZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2Zpbmkoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICt7DQo+ICsJaW50IHJldCA9IDA7DQo+ICsJc3RydWN0
IHBzcF9tZW1vcnlfdHJhaW5pbmdfY29udGV4dCAqY3R4ID0gJmFkZXYtPnBzcC5tZW1fdHJhaW5f
Y3R4Ow0KPiArDQo+ICsJY3R4LT5pbml0ID0gUFNQX01FTV9UUkFJTl9OT1RfU1VQUE9SVDsNCj4g
KwlpZihjdHgtPmMycF9ibykgew0KDQpTcGFjZSBhZnRlciBrZXl3b3JkcywgYWNjb3JkaW5nIHRv
IExLQ1M6DQppZiAoLi4uKQ0KDQo+ICsJCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmY3R4LT5jMnBf
Ym8sIE5VTEwsIE5VTEwpOw0KPiArCQljdHgtPmMycF9ibyA9IE5VTEw7DQo+ICsJfQ0KPiArCWlm
KGN0eC0+cDJjX2JvKSB7DQoNClNwYWNlIGFmdGVyIGtleXdvcmRzLCBhY2NvcmRpbmcgdG8gTEtD
UzoNCmlmICguLi4pDQoNCj4gKwkJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZjdHgtPnAyY19ibywg
TlVMTCwgTlVMTCk7DQo+ICsJCWN0eC0+cDJjX2JvID0gTlVMTDsNCj4gKwl9DQo+ICsNCj4gKwly
ZXR1cm4gcmV0Ow0KPiArfQ0KDQpHZXQgcmlkIG9mICJyZXQiIHZhcmlhYmxlIGFsdG9nZXRoZXIg
YXMgaXQgaXMgbm90IHVzZWQgaW4gdGhpcyBmdW5jdGlvbi4NCg0KPiArDQo+ICsvKioNCj4gKyAq
IGFtZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2luaXQgLSBjcmVhdGUgYm8gdnJhbSBy
ZXNlcnZhdGlvbiBmcm9tIG1lbW9yeSB0cmFpbmluZw0KPiArICoNCj4gKyAqIEBhZGV2OiBhbWRn
cHVfZGV2aWNlIHBvaW50ZXINCj4gKyAqDQo+ICsgKiBjcmVhdGUgYm8gdnJhbSByZXNlcnZhdGlv
biBmcm9tIG1lbW9yeSB0cmFpbmluZy4NCj4gKyAqLw0KPiArc3RhdGljIGludCBhbWRncHVfdHRt
X3RyYWluaW5nX3Jlc2VydmVfdnJhbV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0K
PiArew0KPiArCWludCByZXQgPSAwOw0KDQpETyBOT1QgcHJlaW5pdGlhbGl6ZSByZXQuDQoNCj4g
KwlzdHJ1Y3QgcHNwX21lbW9yeV90cmFpbmluZ19jb250ZXh0ICpjdHggPSAmYWRldi0+cHNwLm1l
bV90cmFpbl9jdHg7DQo+ICsNCj4gKwltZW1zZXQoY3R4LCAwLCBzaXplb2YoKmN0eCkpOw0KPiAr
CWlmKCFhZGV2LT5md192cmFtX3VzYWdlLm1lbV90cmFpbl9zdXBwb3J0KSB7DQoNClNwYWNlIGFm
dGVyIGtleXdvcmRzOiAiaWYgKCIuDQoNCj4gKwkJRFJNX0RFQlVHKCJtZW1vcnkgdHJhaW5pbmcg
ZG9lcyBub3Qgc3VwcG9ydCFcbiIpOw0KPiArCQlyZXR1cm4gMDsNCj4gKwl9DQo+ICsNCj4gKwlj
dHgtPmMycF90cmFpbl9kYXRhX29mZnNldCA9IGFkZXYtPmZ3X3ZyYW1fdXNhZ2UubWVtX3RyYWlu
X2ZiX2xvYzsNCj4gKwljdHgtPnAyY190cmFpbl9kYXRhX29mZnNldCA9IChhZGV2LT5nbWMubWNf
dnJhbV9zaXplIC0gR0REUjZfTUVNX1RSQUlOSU5HX09GRlNFVCk7DQo+ICsJY3R4LT50cmFpbl9k
YXRhX3NpemUgPSBHRERSNl9NRU1fVFJBSU5JTkdfREFUQV9TSVpFX0lOX0JZVEVTOw0KPiArDQo+
ICsJRFJNX0RFQlVHKCJ0cmFpbl9kYXRhX3NpemU6JWxseCxwMmNfdHJhaW5fZGF0YV9vZmZzZXQ6
JWxseCxjMnBfdHJhaW5fZGF0YV9vZmZzZXQ6JWxseC5cbiIsDQo+ICsJCSAgY3R4LT50cmFpbl9k
YXRhX3NpemUsDQo+ICsJCSAgY3R4LT5wMmNfdHJhaW5fZGF0YV9vZmZzZXQsDQo+ICsJCSAgY3R4
LT5jMnBfdHJhaW5fZGF0YV9vZmZzZXQpOw0KPiArDQo+ICsJcmV0ID0gYW1kZ3B1X2JvX2NyZWF0
ZV9rZXJuZWxfYXQoYWRldiwNCg0KSGVyZSBpcyB3aGVyZSB5b3UgZGVmaW5pdGl2ZWx5IHNldCAi
cmV0IiBzbyBETyBOT1QgcHJlaW5pdGlhbGl6ZSBpdCB0byAwLA0KanVzdCB0byBhdm9pZCAicGVz
a3kgY29tcGlsZXIgdW5pbmluaXRpYWxpemVkIHZhcmlhYmxlIHdhcm5pbmdzIi0tdGhvc2UNCmFy
ZSBoZWxwZnVsIHRvIG1ha2UgdGhlIGNvZGUgbW9yZSBzZWN1cmU6IGEgdmFyaWFibGUgc2hvdWxk
IGJlIGludGVudGlvbmFsbHkNCmluaXRpYWxpemVkIGluIGFsbCBwYXRocy4NCg0KPiArCQkJCQkg
Y3R4LT5wMmNfdHJhaW5fZGF0YV9vZmZzZXQsDQo+ICsJCQkJCSBjdHgtPnRyYWluX2RhdGFfc2l6
ZSwNCj4gKwkJCQkJIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sDQo+ICsJCQkJCSAmY3R4LT5wMmNf
Ym8sDQo+ICsJCQkJCSBOVUxMKTsNCj4gKwlpZihyZXQpIHsNCg0KU3BhY2UgYWZ0ZXIga2V5d29y
ZHMgImlmICgiLg0KDQo+ICsJCURSTV9FUlJPUigiYWxsb2MgcDJjX2JvIGZhaWxlZCglZCkhXG4i
LCByZXQpOw0KPiArCQlyZXQgPSAtRU5PTUVNOw0KPiArCQlnb3RvIGVycl9vdXQ7DQo+ICsJfQ0K
PiArDQo+ICsJcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoYWRldiwNCj4gKwkJCQkJ
IGN0eC0+YzJwX3RyYWluX2RhdGFfb2Zmc2V0LA0KPiArCQkJCQkgY3R4LT50cmFpbl9kYXRhX3Np
emUsDQo+ICsJCQkJCSBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLA0KPiArCQkJCQkgJmN0eC0+YzJw
X2JvLA0KPiArCQkJCQkgTlVMTCk7DQo+ICsJaWYocmV0KSB7DQoNClNwYWNlIGFmdGVyIGtleXdv
cmRzOiAiaWYgKCIsIGFjY29yZGluZyB0byBMS0NTLg0KDQpSZWdhcmRzLA0KTHViZW4NCg0KPiAr
CQlEUk1fRVJST1IoImFsbG9jIGMycF9ibyBmYWlsZWQoJWQpIVxuIiwgcmV0KTsNCj4gKwkJcmV0
ID0gLUVOT01FTTsNCj4gKwkJZ290byBlcnJfb3V0Ow0KPiArCX0NCj4gKw0KPiArCWN0eC0+aW5p
dCA9IFBTUF9NRU1fVFJBSU5fUkVTRVJWRV9TVUNDRVNTOw0KPiArCXJldHVybiAwOw0KPiArDQo+
ICtlcnJfb3V0Og0KPiArCWFtZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2ZpbmkoYWRl
dik7DQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiAgLyoqDQo+ICAgKiBhbWRncHVfdHRt
X2luaXQgLSBJbml0IHRoZSBtZW1vcnkgbWFuYWdlbWVudCAodHRtKSBhcyB3ZWxsIGFzIHZhcmlv
dXMNCj4gICAqIGd0dC92cmFtIHJlbGF0ZWQgZmllbGRzLg0KPiBAQCAtMTc0MCw2ICsxODI3LDE0
IEBAIGludCBhbWRncHVfdHRtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAJ
CXJldHVybiByOw0KPiAgCX0NCj4gIA0KPiArCS8qDQo+ICsJICpUaGUgcmVzZXJ2ZWQgdnJhbSBm
b3IgbWVtb3J5IHRyYWluaW5nIG11c3QgYmUgcGlubmVkIHRvIHRoZSBzcGVjaWZpZWQNCj4gKwkg
KnBsYWNlIG9uIHRoZSBWUkFNLCBzbyByZXNlcnZlIGl0IGVhcmx5Lg0KPiArCSAqLw0KPiArCXIg
PSBhbWRncHVfdHRtX3RyYWluaW5nX3Jlc2VydmVfdnJhbV9pbml0KGFkZXYpOw0KPiArCWlmIChy
KQ0KPiArCQlyZXR1cm4gcjsNCj4gKw0KPiAgCS8qIGFsbG9jYXRlIG1lbW9yeSBhcyByZXF1aXJl
ZCBmb3IgVkdBDQo+ICAJICogVGhpcyBpcyB1c2VkIGZvciBWR0EgZW11bGF0aW9uIGFuZCBwcmUt
T1Mgc2Nhbm91dCBidWZmZXJzIHRvDQo+ICAJICogYXZvaWQgZGlzcGxheSBhcnRpZmFjdHMgd2hp
bGUgdHJhbnNpdGlvbmluZyBiZXR3ZWVuIHByZS1PUw0KPiBAQCAtMTgyNSw2ICsxOTIwLDcgQEAg
dm9pZCBhbWRncHVfdHRtX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAJCXJl
dHVybjsNCj4gIA0KPiAgCWFtZGdwdV90dG1fZGVidWdmc19maW5pKGFkZXYpOw0KPiArCWFtZGdw
dV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2ZpbmkoYWRldik7DQo+ICAJYW1kZ3B1X3R0bV9m
d19yZXNlcnZlX3ZyYW1fZmluaShhZGV2KTsNCj4gIAlpZiAoYWRldi0+bW1hbi5hcGVyX2Jhc2Vf
a2FkZHIpDQo+ICAJCWlvdW5tYXAoYWRldi0+bW1hbi5hcGVyX2Jhc2Vfa2FkZHIpOw0KPiANCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
