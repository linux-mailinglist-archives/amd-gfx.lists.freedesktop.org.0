Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4CA91DA8
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 09:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2396E09E;
	Mon, 19 Aug 2019 07:17:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760052.outbound.protection.outlook.com [40.107.76.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F2E6E09E
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 07:17:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXgQfsWhMAm6DUErODEEzAldaiwr48YTOwpbegimgj+HTEBhBmRKBRk14tE6YN1hanRd43hkoAUYIwWM2/qtPKY8BuGJYAuDMvn7TpEOM6/cwB3bYd1y8bOtCWDA5qh2TusOY5cgJYxAd4ZzC+5dCETGOQ9P6kOoCrOm+foPtX8W4FUFyYTgXej2KJ8E70N6ljm5gjgR7n1QrdKT0mRSTEMMcBsftX4S5GhRYwyPFzWnIndAT+Pv7eWS7cMuZ42rbMFa6duucoWFuNzVbxQIWlJm5XSpnaFtnaWK/eDBcvsxfPEAhUh73yua3638ob+/ueFvJIuvPpk4vRTB35sTbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWtB9ns571eaBaSzXvM0An7lOPHc9C50lMYJKOMELLg=;
 b=fyIyoCRglghXEnLEgYn7XUOHZYwRO+fTG6mEosiIJQZcmkLGdaBvJc9QWc4M3zleUGP8pgAFoRSrxPMXtmh0vYQTG89U/N8UJ1w49RshA+tgxB8+TT8ghJV0IqZIeErr+0+JFT+PgLeujx3QMUgxB9liOmKyezKikuYbTdYKfdypvfwwaDLtWEyENxvscOT4DEbOkO/DVtteUpHreBQdgdpzWkUCB3Bv7i1occNnBnKpNnCxulrHBax0P2+B5AZhtKt/Axvm3ExgyC3qGGZp9xtRrNwJ5+M9O0R6ZzpLHa4EEs7Y5TOxZA5mMffdFva2EJdWg/6YV8/V3+LKAwM3Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3718.namprd12.prod.outlook.com (52.132.244.84) by
 CH2PR12MB3813.namprd12.prod.outlook.com (52.132.245.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 07:17:01 +0000
Received: from CH2PR12MB3718.namprd12.prod.outlook.com
 ([fe80::3d37:5989:ecd9:2383]) by CH2PR12MB3718.namprd12.prod.outlook.com
 ([fe80::3d37:5989:ecd9:2383%5]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 07:17:01 +0000
From: "Min, Frank" <Frank.Min@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggMy8zXSBhbWQvYW1kZ3B1OiBzZXBlcmF0ZSBzcmlv?=
 =?utf-8?Q?v_fb_aperture_setting?=
Thread-Topic: [PATCH 3/3] amd/amdgpu: seperate sriov fb aperture setting
Thread-Index: AQHVVBD7OVOkVDXT0ka+nq6rZ+1VmqcCEV+AgAAAnEA=
Date: Mon, 19 Aug 2019 07:17:00 +0000
Message-ID: <CH2PR12MB371826055B2DB3CB600787E2E9A80@CH2PR12MB3718.namprd12.prod.outlook.com>
References: <1565945960-21236-1-git-send-email-Frank.Min@amd.com>
 <1565945960-21236-3-git-send-email-Frank.Min@amd.com>
 <4c7208b2-f693-b283-16fb-cd44e88833cd@gmail.com>
In-Reply-To: <4c7208b2-f693-b283-16fb-cd44e88833cd@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [101.85.213.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0759194f-20f1-452e-3aa3-08d724753aac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3813; 
x-ms-traffictypediagnostic: CH2PR12MB3813:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB38139944A066AA6807AB4385E9A80@CH2PR12MB3813.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(199004)(189003)(9686003)(74316002)(7736002)(305945005)(186003)(55016002)(446003)(11346002)(8936002)(81156014)(66946007)(476003)(66066001)(478600001)(81166006)(25786009)(102836004)(256004)(33656002)(6506007)(53936002)(86362001)(224303003)(26005)(2906002)(71200400001)(6116002)(3846002)(5660300002)(99286004)(316002)(52536014)(110136005)(2501003)(64756008)(66446008)(66476007)(66556008)(6436002)(71190400001)(76116006)(486006)(14454004)(76176011)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3813;
 H:CH2PR12MB3718.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 44LV047VS1Z1BPvg3XjOOYwN+GZUQCHcsjsep1Rs1QCew8dDlLNiTriBw3vIl848sWkxCscHJSk0mSolY7dUqLlQuDk+CqwwuKPdHfqWYxX5TiGBIviYVUWLnkDH9rnqM3E++amN2P3UHJ1cvYfhuHPrTqXgHjSIChMFsaxShiTWH6Ml1kWetp3bv2JrAbjRQmNUw8qR09PfXPCnU2B9JMVH9GLPHqIRNhe8CdHcHvdD6RnUYCkxF0PjaKIAZvMfvfHFwvwucTutH8CR/tAbf+Rs+cTKeTqUiYrPxiR+h20yGqnxaV3E3RHzTn0wh9/Jq+NOzNHerCKHuK6lUkxGgRi8ElFumLseGTuJ1Ihz2dAmdaoVhvqjjOZOgpB/hVFprFwQMrkMzlthaQfjxQPUAkhaGwZ5304Ecv8uJfyr0eU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0759194f-20f1-452e-3aa3-08d724753aac
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 07:17:00.8544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6kyab3KEizOJsa8uLs3DIF/6QVLoZFORe1qH7wFGgbPQDVkkyp8mki7WOA7SmOAJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3813
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWtB9ns571eaBaSzXvM0An7lOPHc9C50lMYJKOMELLg=;
 b=xaJ1B/4R2aeV/NKV9Lru92lW0T9LWdSA7M0zmzcdMFKnhIyP8f7dptuTNi2HO4g/nl9UmX2c34dPjizTaxzodnWR1JAW1Xlax3/9XEKPakja0J0hBOT5rjVA+obH99wIqCt6wo/bQy01KaAS9DV4XDzGlOZnQJWM/Nq9C3j3pYo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Frank.Min@amd.com; 
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

SGkgQ2hyaXN0aWFuLA0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCkZvciBTUklPViwgYW1kZ3B1
X2dtY19hZ3BfbG9jYXRpb24oKSB3b3VsZCBub3QgYmUgY2FsbGVkLCBzaW5jZSBpdCBkbyBub3Qg
dXNlIEFHUC4gQWxzbyB0aGVyZSBpcyBubyBuZWVkIHRvIHVzZSB0aGUgbWluIGFuZCBtYXggdG8g
anVkZ2Ugd2hpY2ggcmFuZ2UgaXMgY29ycmVjdCBmb3IgdXNpbmcuDQoNCkJlc3QgUmVnYXJkcywN
CkZyYW5rDQoNCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IA0K5Y+R6YCB5pe26Ze0OiAy
MDE55bm0OOaciDE55pelIDE1OjA3DQrmlLbku7bkuro6IE1pbiwgRnJhbmsgPEZyYW5rLk1pbkBh
bWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCuS4u+mimDogUmU6IFtQQVRD
SCAzLzNdIGFtZC9hbWRncHU6IHNlcGVyYXRlIHNyaW92IGZiIGFwZXJ0dXJlIHNldHRpbmcNCg0K
QW0gMTYuMDguMTkgdW0gMTA6NTkgc2NocmllYiBGcmFuay5NaW46DQo+IHNyaW92IHdvdWxkIG5v
dCB1c2UgYWdwLCBzbyBzZXBlcmF0ZSB0aGUgZmIgYXBlcnR1cmUgc2V0dGluZy4NCg0KVGhhdCB3
b24ndCB3b3JrIGNvcnJlY3RseS4gVGhpcyB3YXkgd2UgZG9uJ3QgcHJvZ3JhbSB0aGUgQUdQIHNw
YWNlIGludG8gdGhlIGhhcmR3YXJlIGFueSBtb3JlLCBidXQgd291bGQgc3RpbGwgdHJ5IHRvIHVz
ZSBpdC4NCg0KV2UgcmF0aGVyIG5lZWQgdG8gYWRqdXN0IHRoZSBhbWRncHVfZ21jX2FncF9sb2Nh
dGlvbigpIGZ1bmN0aW9uIG9yIGl0J3MgY2FsbGVyIHRvIG5vdCBhc3NpZ24gYW4gQUdQIHNwYWNl
IGluIHRoZSBmaXJzdCBwbGFjZS4NCg0KQ2hyaXN0aWFuLg0KDQo+DQo+IENoYW5nZS1JZDogSTEz
NzJjZDM1NTMyNjczMWEzMTM2MWJmZjEzZDc5ZTEyMTIxYjg2NTENCj4gU2lnbmVkLW9mZi1ieTog
RnJhbmsuTWluIDxGcmFuay5NaW5AYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4aHViX3YxXzAuYyB8IDM5ICsrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAgICB8IDEy
ICsrKysrLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMg
IHwgMjcgKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgNDkgaW5z
ZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhodWJfdjFfMC5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeGh1Yl92MV8wLmMNCj4gaW5kZXggNmNlMzdjZS4uZWM3OGM4YiAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YxXzAuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhodWJfdjFfMC5jDQo+IEBAIC03NSwyMyArNzUs
MzIgQEAgc3RhdGljIHZvaWQgZ2Z4aHViX3YxXzBfaW5pdF9zeXN0ZW1fYXBlcnR1cmVfcmVncyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICAJV1JFRzMyX1NPQzE1X1JMQyhHQywgMCwg
bW1NQ19WTV9BR1BfQk9ULCBhZGV2LT5nbWMuYWdwX3N0YXJ0ID4+IDI0KTsNCj4gICAJV1JFRzMy
X1NPQzE1X1JMQyhHQywgMCwgbW1NQ19WTV9BR1BfVE9QLCBhZGV2LT5nbWMuYWdwX2VuZCA+PiAy
NCk7DQo+ICAgDQo+IC0JLyogUHJvZ3JhbSB0aGUgc3lzdGVtIGFwZXJ0dXJlIGxvdyBsb2dpY2Fs
IHBhZ2UgbnVtYmVyLiAqLw0KPiAtCVdSRUczMl9TT0MxNV9STEMoR0MsIDAsIG1tTUNfVk1fU1lT
VEVNX0FQRVJUVVJFX0xPV19BRERSLA0KPiAtCQkgICAgIG1pbihhZGV2LT5nbWMuZmJfc3RhcnQs
IGFkZXYtPmdtYy5hZ3Bfc3RhcnQpID4+IDE4KTsNCj4gKwlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFk
ZXYpKSB7DQo+ICsJCS8qIFByb2dyYW0gdGhlIHN5c3RlbSBhcGVydHVyZSBsb3cgbG9naWNhbCBw
YWdlIG51bWJlci4gKi8NCj4gKwkJV1JFRzMyX1NPQzE1X1JMQyhHQywgMCwgbW1NQ19WTV9TWVNU
RU1fQVBFUlRVUkVfTE9XX0FERFIsDQo+ICsJCQkJIGFkZXYtPmdtYy5mYl9zdGFydCA+PiAxOCk7
DQo+ICAgDQo+IC0JaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1JBVkVOICYmIGFkZXYtPnJl
dl9pZCA+PSAweDgpDQo+IC0JCS8qDQo+IC0JCSAqIFJhdmVuMiBoYXMgYSBIVyBpc3N1ZSB0aGF0
IGl0IGlzIHVuYWJsZSB0byB1c2UgdGhlIHZyYW0gd2hpY2gNCj4gLQkJICogaXMgb3V0IG9mIE1D
X1ZNX1NZU1RFTV9BUEVSVFVSRV9ISUdIX0FERFIuIFNvIGhlcmUgaXMgdGhlDQo+IC0JCSAqIHdv
cmthcm91bmQgdGhhdCBpbmNyZWFzZSBzeXN0ZW0gYXBlcnR1cmUgaGlnaCBhZGRyZXNzIChhZGQg
MSkNCj4gLQkJICogdG8gZ2V0IHJpZCBvZiB0aGUgVk0gZmF1bHQgYW5kIGhhcmR3YXJlIGhhbmcu
DQo+IC0JCSAqLw0KPiAgIAkJV1JFRzMyX1NPQzE1X1JMQyhHQywgMCwgbW1NQ19WTV9TWVNURU1f
QVBFUlRVUkVfSElHSF9BRERSLA0KPiAtCQkJICAgICBtYXgoKGFkZXYtPmdtYy5mYl9lbmQgPj4g
MTgpICsgMHgxLA0KPiAtCQkJCSBhZGV2LT5nbWMuYWdwX2VuZCA+PiAxOCkpOw0KPiAtCWVsc2UN
Cj4gLQkJV1JFRzMyX1NPQzE1X1JMQyhHQywgMCwgbW1NQ19WTV9TWVNURU1fQVBFUlRVUkVfSElH
SF9BRERSLA0KPiAtCQkJICAgICBtYXgoYWRldi0+Z21jLmZiX2VuZCwgYWRldi0+Z21jLmFncF9l
bmQpID4+IDE4KTsNCj4gKwkJCQkgYWRldi0+Z21jLmZiX2VuZCA+PiAxOCk7DQo+ICsJfSBlbHNl
IHsNCj4gKwkJLyogUHJvZ3JhbSB0aGUgc3lzdGVtIGFwZXJ0dXJlIGxvdyBsb2dpY2FsIHBhZ2Ug
bnVtYmVyLiAqLw0KPiArCQlXUkVHMzJfU09DMTVfUkxDKEdDLCAwLCBtbU1DX1ZNX1NZU1RFTV9B
UEVSVFVSRV9MT1dfQUREUiwNCj4gKwkJCSAgICAgbWluKGFkZXYtPmdtYy5mYl9zdGFydCwgYWRl
di0+Z21jLmFncF9zdGFydCkgPj4gMTgpOw0KPiArDQo+ICsJCWlmIChhZGV2LT5hc2ljX3R5cGUg
PT0gQ0hJUF9SQVZFTiAmJiBhZGV2LT5yZXZfaWQgPj0gMHg4KQ0KPiArCQkJLyoNCj4gKwkJCSAq
IFJhdmVuMiBoYXMgYSBIVyBpc3N1ZSB0aGF0IGl0IGlzIHVuYWJsZSB0byB1c2UgdGhlIHZyYW0g
d2hpY2gNCj4gKwkJCSAqIGlzIG91dCBvZiBNQ19WTV9TWVNURU1fQVBFUlRVUkVfSElHSF9BRERS
LiBTbyBoZXJlIGlzIHRoZQ0KPiArCQkJICogd29ya2Fyb3VuZCB0aGF0IGluY3JlYXNlIHN5c3Rl
bSBhcGVydHVyZSBoaWdoIGFkZHJlc3MgKGFkZCAxKQ0KPiArCQkJICogdG8gZ2V0IHJpZCBvZiB0
aGUgVk0gZmF1bHQgYW5kIGhhcmR3YXJlIGhhbmcuDQo+ICsJCQkgKi8NCj4gKwkJCVdSRUczMl9T
T0MxNV9STEMoR0MsIDAsIG1tTUNfVk1fU1lTVEVNX0FQRVJUVVJFX0hJR0hfQUREUiwNCj4gKwkJ
CQkgICAgIG1heCgoYWRldi0+Z21jLmZiX2VuZCA+PiAxOCkgKyAweDEsDQo+ICsJCQkJCSBhZGV2
LT5nbWMuYWdwX2VuZCA+PiAxOCkpOw0KPiArCQllbHNlDQo+ICsJCQlXUkVHMzJfU09DMTVfUkxD
KEdDLCAwLCBtbU1DX1ZNX1NZU1RFTV9BUEVSVFVSRV9ISUdIX0FERFIsDQo+ICsJCQkJICAgICBt
YXgoYWRldi0+Z21jLmZiX2VuZCwgYWRldi0+Z21jLmFncF9lbmQpID4+IDE4KTsNCj4gKwl9DQo+
ICAgDQo+ICAgCS8qIFNldCBkZWZhdWx0IHBhZ2UgYWRkcmVzcy4gKi8NCj4gICAJdmFsdWUgPSBh
ZGV2LT52cmFtX3NjcmF0Y2guZ3B1X2FkZHIgLSBhZGV2LT5nbWMudnJhbV9zdGFydCBkaWZmIA0K
PiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgDQo+IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiBpbmRleCA2ZGUxNzI2Li4xZjhi
ZGZhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4gQEAgLTky
MCwxMiArOTIwLDEyIEBAIHN0YXRpYyB2b2lkIGdtY192OV8wX3ZyYW1fZ3R0X2xvY2F0aW9uKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIAkJCQkJc3RydWN0IGFtZGdwdV9nbWMgKm1j
KQ0KPiAgIHsNCj4gICAJdTY0IGJhc2UgPSAwOw0KPiAtCWlmICghYW1kZ3B1X3NyaW92X3ZmKGFk
ZXYpKSB7DQo+IC0JCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUykNCj4gLQkJ
CWJhc2UgPSBtbWh1Yl92OV80X2dldF9mYl9sb2NhdGlvbihhZGV2KTsNCj4gLQkJZWxzZQ0KPiAt
CQkJYmFzZSA9IG1taHViX3YxXzBfZ2V0X2ZiX2xvY2F0aW9uKGFkZXYpOw0KPiAtCX0NCj4gKw0K
PiArCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUykNCj4gKwkJYmFzZSA9IG1t
aHViX3Y5XzRfZ2V0X2ZiX2xvY2F0aW9uKGFkZXYpOw0KPiArCWVsc2UNCj4gKwkJYmFzZSA9IG1t
aHViX3YxXzBfZ2V0X2ZiX2xvY2F0aW9uKGFkZXYpOw0KPiArDQo+ICAgCS8qIGFkZCB0aGUgeGdt
aSBvZmZzZXQgb2YgdGhlIHBoeXNpY2FsIG5vZGUgKi8NCj4gICAJYmFzZSArPSBhZGV2LT5nbWMu
eGdtaS5waHlzaWNhbF9ub2RlX2lkICogYWRldi0+Z21jLnhnbWkubm9kZV9zZWdtZW50X3NpemU7
DQo+ICAgCWFtZGdwdV9nbWNfdnJhbV9sb2NhdGlvbihhZGV2LCBtYywgYmFzZSk7IGRpZmYgLS1n
aXQgDQo+IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjlfNC5jIA0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Y5XzQuYw0KPiBpbmRleCAwY2Y3ZWY0Li5l
YTMzNTlmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92
OV80LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjlfNC5jDQo+
IEBAIC0xMTgsMTQgKzExOCwyNSBAQCBzdGF0aWMgdm9pZCBtbWh1Yl92OV80X2luaXRfc3lzdGVt
X2FwZXJ0dXJlX3JlZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgCQkJICAgIGFk
ZXYtPmdtYy5hZ3Bfc3RhcnQgPj4gMjQpOw0KPiAgIA0KPiAgIAkvKiBQcm9ncmFtIHRoZSBzeXN0
ZW0gYXBlcnR1cmUgbG93IGxvZ2ljYWwgcGFnZSBudW1iZXIuICovDQo+IC0JV1JFRzMyX1NPQzE1
X09GRlNFVChNTUhVQiwgMCwNCj4gLQkJCSAgICBtbVZNU0hBUkVEVkMwX01DX1ZNX1NZU1RFTV9B
UEVSVFVSRV9MT1dfQUREUiwNCj4gLQkJCSAgICBodWJpZCAqIE1NSFVCX0lOU1RBTkNFX1JFR0lT
VEVSX09GRlNFVCwNCj4gLQkJCSAgICBtaW4oYWRldi0+Z21jLmZiX3N0YXJ0LCBhZGV2LT5nbWMu
YWdwX3N0YXJ0KSA+PiAxOCk7DQo+IC0JV1JFRzMyX1NPQzE1X09GRlNFVChNTUhVQiwgMCwNCj4g
LQkJCSAgICBtbVZNU0hBUkVEVkMwX01DX1ZNX1NZU1RFTV9BUEVSVFVSRV9ISUdIX0FERFIsDQo+
IC0JCQkgICAgaHViaWQgKiBNTUhVQl9JTlNUQU5DRV9SRUdJU1RFUl9PRkZTRVQsDQo+IC0JCQkg
ICAgbWF4KGFkZXYtPmdtYy5mYl9lbmQsIGFkZXYtPmdtYy5hZ3BfZW5kKSA+PiAxOCk7DQo+ICsJ
aWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkgew0KPiArCQlXUkVHMzJfU09DMTVfT0ZGU0VUKE1N
SFVCLCAwLA0KPiArCQkJCQltbVZNU0hBUkVEVkMwX01DX1ZNX1NZU1RFTV9BUEVSVFVSRV9MT1df
QUREUiwNCj4gKwkJCQkJaHViaWQgKiBNTUhVQl9JTlNUQU5DRV9SRUdJU1RFUl9PRkZTRVQsDQo+
ICsJCQkJCWFkZXYtPmdtYy5mYl9zdGFydCA+PiAxOCk7DQo+ICsJCVdSRUczMl9TT0MxNV9PRkZT
RVQoTU1IVUIsIDAsDQo+ICsJCQkJCW1tVk1TSEFSRURWQzBfTUNfVk1fU1lTVEVNX0FQRVJUVVJF
X0hJR0hfQUREUiwNCj4gKwkJCQkJaHViaWQgKiBNTUhVQl9JTlNUQU5DRV9SRUdJU1RFUl9PRkZT
RVQsDQo+ICsJCQkJCWFkZXYtPmdtYy5mYl9lbmQgPj4gMTgpOw0KPiArCX0gZWxzZSB7DQo+ICsJ
CVdSRUczMl9TT0MxNV9PRkZTRVQoTU1IVUIsIDAsDQo+ICsJCQkJICAgIG1tVk1TSEFSRURWQzBf
TUNfVk1fU1lTVEVNX0FQRVJUVVJFX0xPV19BRERSLA0KPiArCQkJCSAgICBodWJpZCAqIE1NSFVC
X0lOU1RBTkNFX1JFR0lTVEVSX09GRlNFVCwNCj4gKwkJCQkgICAgbWluKGFkZXYtPmdtYy5mYl9z
dGFydCwgYWRldi0+Z21jLmFncF9zdGFydCkgPj4gMTgpOw0KPiArCQlXUkVHMzJfU09DMTVfT0ZG
U0VUKE1NSFVCLCAwLA0KPiArCQkJCSAgICBtbVZNU0hBUkVEVkMwX01DX1ZNX1NZU1RFTV9BUEVS
VFVSRV9ISUdIX0FERFIsDQo+ICsJCQkJICAgIGh1YmlkICogTU1IVUJfSU5TVEFOQ0VfUkVHSVNU
RVJfT0ZGU0VULA0KPiArCQkJCSAgICBtYXgoYWRldi0+Z21jLmZiX2VuZCwgYWRldi0+Z21jLmFn
cF9lbmQpID4+IDE4KTsNCj4gKwl9DQo+ICAgDQo+ICAgCS8qIFNldCBkZWZhdWx0IHBhZ2UgYWRk
cmVzcy4gKi8NCj4gICAJdmFsdWUgPSBhZGV2LT52cmFtX3NjcmF0Y2guZ3B1X2FkZHIgLSBhZGV2
LT5nbWMudnJhbV9zdGFydCArDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
