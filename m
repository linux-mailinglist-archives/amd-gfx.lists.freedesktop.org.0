Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95F873226
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9116E5BC;
	Wed, 24 Jul 2019 14:49:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800080.outbound.protection.outlook.com [40.107.80.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180E56E5BC
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:49:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HiKQ85CdY/2s4fzx8zYj8VeRvNs/gDCkBVPC9m2oOlMZGx53zJHs//XeLzHq3jqxQYM37X+6EkRvE5OdsrMFF5R0SjFD50vb+oGfQLqPiatKbqrNa5SIBguaQFWvIbYIsQYHftNMSwzJbCJ/lFRJC+VYBnfbZ9LtFkjJql/1m957SqEyJx9rhJ5HeyLAbdgmSHSxNbTcE31cGCr6Cl4N7gkZnZQbXosaSbLLo3RwCIK8tgxTf6qOZnhwgA0XejLEIEy1zNNGaXcyxE13VbMoKWljW2n9lbhmYWOoRM1M2TD4BSEemLeXCN93pMcoF0/TLhuqKztQnO1zWYv+a2w3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqTkUJ6keCSp2LfLxH2KWAwbgQOpvecNIMPTRHdI9ws=;
 b=hTFLO7yVpVTM1fFlGnVi6/SbsNRcu3NT9XHH9r3PRecP/5q1AxrLy8wfpKkhHkAnIufWhMQ1ygzwloRImyUBekTb9FxXPfPxxltgwZSdVOQsgkXuv6e52zWOkabgScByCdSL49FT2ulosZm4cbBOvld6JDTLn5aX4Dd9uZFdktmbHbenwsZLGdaJDXsuWJ2AxHJs7U+HzqPu3XNlSly2NXKO/174qAM2ok5l0qNxa1rg6GHmJR6duTeoYLksv9euFJLPgNDT8vOevNl83S9MprQ3/r+waN5vT3EWJyy0l7m6LWKWO+3NA+GAzKFaGz6bzBS9/bEI1ahgoOm1hC3IGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1952.namprd12.prod.outlook.com (10.175.56.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.15; Wed, 24 Jul 2019 14:49:41 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::59df:2c5b:b1e2:8845]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::59df:2c5b:b1e2:8845%3]) with mapi id 15.20.2094.017; Wed, 24 Jul 2019
 14:49:41 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/3] drm/amd: enable S/G for RAVEN chip
Thread-Topic: [PATCH v3 3/3] drm/amd: enable S/G for RAVEN chip
Thread-Index: AQHVQimxqk1YeojMgkC1mpHwDMisxqbZ0tSAgAACGICAAAJrAIAAAlqA
Date: Wed, 24 Jul 2019 14:49:41 +0000
Message-ID: <e1e8be97-8f77-e30e-1aa4-f8a76e3fe675@amd.com>
References: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563977442-4809-4-git-send-email-andrey.grodzovsky@amd.com>
 <492b52b5-36e0-f957-88e1-c2479f8c56c4@amd.com>
 <e8a4de40-e60c-152a-ba4b-9ef7b1b553c1@amd.com>
 <fc3eb460-934a-afed-b654-b33021d32aa0@amd.com>
In-Reply-To: <fc3eb460-934a-afed-b654-b33021d32aa0@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::30) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89a47590-538b-41ad-5cee-08d7104628aa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1952; 
x-ms-traffictypediagnostic: MWHPR12MB1952:
x-microsoft-antispam-prvs: <MWHPR12MB1952652F474A80A1247BE0CBEAC60@MWHPR12MB1952.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(54906003)(81166006)(53546011)(102836004)(2616005)(2501003)(99286004)(386003)(11346002)(2906002)(446003)(36756003)(6506007)(14454004)(68736007)(8676002)(31686004)(76176011)(81156014)(3846002)(71200400001)(186003)(316002)(476003)(8936002)(26005)(6116002)(110136005)(52116002)(6512007)(71190400001)(53936002)(229853002)(478600001)(6246003)(66066001)(5660300002)(66946007)(64756008)(66556008)(66446008)(6436002)(66476007)(4326008)(14444005)(7736002)(86362001)(31696002)(6486002)(486006)(25786009)(305945005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1952;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eqjD4+O1YGHybYh6mBHhrz08btmtqdVDf+sthjSS80R5Nvj/8sQ1NK9TqJ1EcAGQ6fUh8JoUBNhO0JJXcwJwHCEq6NBQGKyrgZp3IAL9AwbsWXlUsMZNXtLj6DCh3iDp74RbQ9qa9OjR1uiB9XekmzkO7qqyfD49T+DCQou+KYSz3QX4fDfTE8AoAcShBfKLTIGRgZfsCqCuAHEAOsgJqrCVAdKmfKkpAvwTuQEemPEF8tHlSlCLA6zACY25782wCPAeXDbQ0rnxG9qN7oUIY/kIHzY3eXfKrwlR02ugLUqfwXmSWhPoeQz7z0/9g5nqgM3RmU4aZhCa4OvSUGeGeUv5+Hm40E7OIsGF5o+BHW93ng9YXuAYwlBkkwVMBDb2v7dHS5nzstjmOqmF0/mtLC312YpgIq0QemRlc9MdDMQ=
Content-ID: <E4A63CDD2BF977439A74C0A7B75958B0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a47590-538b-41ad-5cee-08d7104628aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 14:49:41.4865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agrodzov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1952
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqTkUJ6keCSp2LfLxH2KWAwbgQOpvecNIMPTRHdI9ws=;
 b=coUk+kHVjG3YsNfCrr2nRZvbS9gj4OsZW1jcCwZK+2lcta+/lgvSHF42n16tRbJv6Kj1g9ZeUqMUzKNE7bINYYO7/vR0bn+Z2tUfM1zA/jj110GtG+XkJhoO4bYEz/wwkKJAX4O8u+qEoXir2Nq3fmSWn9DiirnmmjYklYwpERQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Wu,
 Hersen" <hersenxs.wu@amd.com>, "S, Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QU1ER1BVDQoNCk9uIDcvMjQvMTkgMTA6NDEgQU0sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0K
PiBBbSAyNC4wNy4xOSB1bSAxNjozMiBzY2hyaWViIEdyb2R6b3Zza3ksIEFuZHJleToNCj4+IE9u
IDcvMjQvMTkgMTA6MjUgQU0sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4+IEFtIDI0LjA3
LjE5IHVtIDE2OjEwIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6DQo+Pj4+IEZyb206IFNoaXJp
c2ggUyA8c2hpcmlzaC5zQGFtZC5jb20+DQo+Pj4+DQo+Pj4+IGVuYWJsZXMgZ3B1X3ZtX3N1cHBv
cnQgaW4gZG0gYW5kIGFkZHMNCj4+Pj4gQU1ER1BVX0dFTV9ET01BSU5fR1RUIGFzIHN1cHBvcnRl
ZCBkb21haW4NCj4+Pj4NCj4+Pj4gdjI6DQo+Pj4+IE1vdmUgQk8gcGxhY2VtZW50IGxvZ2ljIGlu
dG8gYW1kZ3B1X2Rpc3BsYXlfc3VwcG9ydGVkX2RvbWFpbnMNCj4+Pj4NCj4+Pj4gdjM6DQo+Pj4+
IFVzZSBhbWRncHVfYm9fdmFsaWRhdGVfdXN3YyBpbiBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRf
ZG9tYWlucy4NCj4+Pj4NCj4+Pj4gQ2hhbmdlLUlkOiBJZjM0MzAwYmVhYTYwYmUyZDM2MTcwYjdi
NWIwOTZlYzY0NDUwMmIyMA0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBTaGlyaXNoIFMgPHNoaXJpc2gu
c0BhbWQuY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5
Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCj4+PiBBY3R1YWxseSB0aGF0IGRvZXNuJ3QgbG9vayBsaWtl
IGEgZ29vZCBpZGVhIHRvIG1lLg0KPj4+DQo+Pj4gSXQgaXMgc3RpbGwgcGVyZmVjdGx5IHBvc3Np
YmxlIChhbmQgd2FudGVkISkgdGhhdCB0aGUgVVNXQyBmbGFnIHdhcyBub3QNCj4+PiBzZXQgaW4g
dGhlIGZpcnN0IHBsYWNlIGJ5IHVzZXJzcGFjZS4NCj4+Pg0KPj4+IElzIHRoYXQgc3RpbGwgY2hl
Y2tlZCBzb21ld2hlcmU/DQo+Pj4NCj4+PiBSZWdhcmRzLA0KPj4+IENocmlzdGlhbi4NCj4+IE5v
dCBzdXJlIEkgdW5kZXJzdGFuZCBoZXJlLCBjYW4geW91IGVsYWJvcmF0ZSA/DQo+IEl0J3Mgc3Rp
bGwgcG9zc2libGUgdGhhdCB1c2Vyc3BhY2UgZG9lc24ndCBzZXQgdGhlIFVTV0MgZmxhZyBhbmQg
dGhlcmUNCj4gYWN0dWFsbHkgbWlnaHQgYmUgZ29vZCByZWFzb25zIGZvciB0aGF0Lg0KPg0KPiBE
byB3ZSBzdGlsbCBoYXZlIGEgY2hlY2sgZm9yIHRoaXMgY2FzZSBzb21ld2hlcmU/DQo+DQo+IENo
cmlzdGlhbi4NCg0KDQpJIGRvbid0IHNlZSBob3cgdGhpcyByZWxhdGVzIHBhdGNoIGluIHBhcnRp
Y3VsYXIuwqAgQUZBSUsgdXNlciBzcGFjZSB3aWxsIA0KZ28gdGhyb3VnaCBhbWRncHVfZ2VtX2Ny
ZWF0ZV9pb2N0bCB3aGljaCBJIGRpZG4ndCB0b3VjaCBpdCBhbmQgZG9uJ3QgDQpmb3JjZSBBTURH
UFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0MgdGhlcmUsIHdlIG9ubHkgZm9yY2XCoCANCkFNREdQ
VV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQyBmb3IgRkIgY29uc29sZSBCTyBjcmVhdGlvbiBpbiAN
CmFtZGdwdWZiX2NyZWF0ZV9waW5uZWRfb2JqZWN0IGFuZCBhbWRncHVfbW9kZV9kdW1iX2NyZWF0
ZS4NCg0KQW5kcmV5DQoNCg0KPg0KPg0KPj4gQW5kcmV5DQo+Pg0KPj4NCj4+Pj4gLS0tDQo+Pj4+
ICAgICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYyAgICAgICB8
IDE2ICsrKysrKysrKysrKysrLS0NCj4+Pj4gICAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgIDIgKy0NCj4+Pj4gICAgICAyIGZpbGVzIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYw0KPj4+PiBpbmRleCA3NjdlZTY5
OS4uMjNiODA0NiAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rpc3BsYXkuYw0KPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGlzcGxheS5jDQo+Pj4+IEBAIC0zNyw2ICszNyw3IEBADQo+Pj4+ICAgICAgI2luY2x1
ZGUgPGRybS9kcm1fZWRpZC5oPg0KPj4+PiAgICAgICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFt
ZWJ1ZmZlcl9oZWxwZXIuaD4NCj4+Pj4gICAgICAjaW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIu
aD4NCj4+Pj4gKyNpbmNsdWRlIDxkcm0vZHJtX2NhY2hlLmg+DQo+Pj4+ICAgICAgDQo+Pj4+ICAg
ICAgc3RhdGljIHZvaWQgYW1kZ3B1X2Rpc3BsYXlfZmxpcF9jYWxsYmFjayhzdHJ1Y3QgZG1hX2Zl
bmNlICpmLA0KPj4+PiAgICAgIAkJCQkJIHN0cnVjdCBkbWFfZmVuY2VfY2IgKmNiKQ0KPj4+PiBA
QCAtNDk2LDEwICs0OTcsMjEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXJf
ZnVuY3MgYW1kZ3B1X2ZiX2Z1bmNzID0gew0KPj4+PiAgICAgIHVpbnQzMl90IGFtZGdwdV9kaXNw
bGF5X3N1cHBvcnRlZF9kb21haW5zKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPj4+PiAg
ICAgIHsNCj4+Pj4gICAgICAJdWludDMyX3QgZG9tYWluID0gQU1ER1BVX0dFTV9ET01BSU5fVlJB
TTsNCj4+Pj4gKwl1NjQgdXN3Y19mbGFnID0gQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dD
Ow0KPj4+PiAgICAgIA0KPj4+PiAgICAgICNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDKQ0K
Pj4+PiAtCWlmIChhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9DQVJSSVpPICYmIGFkZXYtPmFzaWNf
dHlwZSA8IENISVBfUkFWRU4gJiYNCj4+Pj4gLQkgICAgYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBV
ICYmDQo+Pj4+ICsJLyoNCj4+Pj4gKwkgKiBpZiBhbWRncHVfYm9fdmFsaWRhdGVfdXN3YyBjbGVh
cnMgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIGl0DQo+Pj4+ICsJICogbWVhbnMgdGhh
dCBVU1dDIG1hcHBpbmdzDQo+Pj4+ICsJICogaXMgbm90IHN1cHBvcnRlZCBmb3IgdGhpcyBib2Fy
ZC4gQnV0IHRoaXMgbWFwcGluZyBpcyByZXF1aXJlZA0KPj4+PiArCSAqIHRvIGF2b2lkIGhhbmcg
Y2F1c2VkIGJ5IHBsYWNlbWVudCBvZiBzY2Fub3V0IEJPIGluIEdUVCBvbiBjZXJ0YWluDQo+Pj4+
ICsJICogQVBVcy4gU28gZm9yY2UgdGhlIEJPIHBsYWNlbWVudCB0byBWUkFNIGluIGNhc2UgdGhp
cyBhcmNoaXRlY3R1cmUNCj4+Pj4gKwkgKiB3aWxsIG5vdCBhbGxvdyBVU1dDIG1hcHBpbmdzLg0K
Pj4+PiArCSAqLw0KPj4+PiArCWFtZGdwdV9ib192YWxpZGF0ZV91c3djKCZ1c3djX2ZsYWcpOw0K
Pj4+PiArDQo+Pj4+ICsJaWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX0NBUlJJWk8gJiYgYWRl
di0+YXNpY190eXBlIDw9IENISVBfUkFWRU4gJiYNCj4+Pj4gKwkgICAgYWRldi0+ZmxhZ3MgJiBB
TURfSVNfQVBVICYmIHVzd2NfZmxhZyAmJg0KPj4+PiAgICAgIAkgICAgYW1kZ3B1X2RldmljZV9h
c2ljX2hhc19kY19zdXBwb3J0KGFkZXYtPmFzaWNfdHlwZSkpDQo+Pj4+ICAgICAgCQlkb21haW4g
fD0gQU1ER1BVX0dFTV9ET01BSU5fR1RUOw0KPj4+PiAgICAgICNlbmRpZg0KPj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4+Pj4g
aW5kZXggNDkyMjU4OS4uZjAzODdjZTEgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4+Pj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPj4+PiBAQCAtNjg2LDcg
KzY4Niw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpDQo+Pj4+ICAgICAgCSAqLw0KPj4+PiAgICAgIAlpZiAoYWRldi0+ZmxhZ3MgJiBBTURf
SVNfQVBVICYmDQo+Pj4+ICAgICAgCSAgICBhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9DQVJSSVpP
ICYmDQo+Pj4+IC0JICAgIGFkZXYtPmFzaWNfdHlwZSA8IENISVBfUkFWRU4pDQo+Pj4+ICsJICAg
IGFkZXYtPmFzaWNfdHlwZSA8PSBDSElQX1JBVkVOKQ0KPj4+PiAgICAgIAkJaW5pdF9kYXRhLmZs
YWdzLmdwdV92bV9zdXBwb3J0ID0gdHJ1ZTsNCj4+Pj4gICAgICANCj4+Pj4gICAgICAJaWYgKGFt
ZGdwdV9kY19mZWF0dXJlX21hc2sgJiBEQ19GQkNfTUFTSykNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
