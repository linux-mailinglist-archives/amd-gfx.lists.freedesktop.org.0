Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A583089A76
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 11:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B1C6E405;
	Mon, 12 Aug 2019 09:51:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690061.outbound.protection.outlook.com [40.107.69.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF35D6E405
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 09:51:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpfxdyxM37fprRjaURrxpBGYGsQ1yERN5fCehgrc+lxefT1ELIkL4aU8RpURB9MC28WW3a7gjBqHfA4WY6oGVfBDkhoIpdPp2Tz0zShyj3d80Y2601ztUL6fNf4hBhPmNlJ2kikoIUhr040P8ptiika3d+vKjWRLtdqLzb5xZhJW0flxFnYIUmKKFhcrlMsRgt9r2Wofwt5MlORhCG+E/iTkNG05XzgeLoJP0BqZKE9wb6OnQBOA4XRTRQcwAQWTU8kpnygya8WSsdazkE9nxNPsYPT8ulyHsPi/1vczwStM0C0aJuXFdef/dDaqZhgyIz3FQjUXOIKGatiS1kityw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwnggNWWtCTrQ9lR4gXdPVbmiWCo8Dk72lxPsJBBcps=;
 b=ibrKFRmyHvpPfmBmi6y1mDDlx5BM2SUJUKHUWYGscMY++PdGNPnkOVHYuWCceCtRC1VsytU4gpnpmyhWxXm4h1z4hpJxw8szWIa+WxpQlOw0XFCc6xr+41jIicKwavAEkTHH3rlKky5HHmbZa0PDO5IFvTmVw0d++AyVVHz4zLxOMH+pBfw6IkF03nHDzmVwXFkrsM9LrldgFp69KjGPAf0EEaBOg1QKti/x3OFkHllJSMK+5i/+07ZHpSghELiD8DqDDciofqEpCcY7fZ1hVbt3TTbQ75moP4slNQ2su6nwwuMny5roOo5yW5j2+A60vASImviKxTavWueKkFdDwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3582.namprd12.prod.outlook.com (20.178.243.76) by
 MN2PR12MB3071.namprd12.prod.outlook.com (20.178.243.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.13; Mon, 12 Aug 2019 09:51:18 +0000
Received: from MN2PR12MB3582.namprd12.prod.outlook.com
 ([fe80::6d71:d888:128c:7318]) by MN2PR12MB3582.namprd12.prod.outlook.com
 ([fe80::6d71:d888:128c:7318%5]) with mapi id 15.20.2136.018; Mon, 12 Aug 2019
 09:51:18 +0000
From: "Gui, Jack" <Jack.Gui@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: add arcturus_is_dpm_running
 function for arcturus
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: add arcturus_is_dpm_running
 function for arcturus
Thread-Index: AQHVUOcfyapJKI9hJEqc8fS1oALYaKb3QbcAgAACZgA=
Date: Mon, 12 Aug 2019 09:51:17 +0000
Message-ID: <MN2PR12MB35820DB4E84513D7F47606088BD30@MN2PR12MB3582.namprd12.prod.outlook.com>
References: <1565598138-13844-1-git-send-email-Jack.Gui@amd.com>
 <1565598138-13844-2-git-send-email-Jack.Gui@amd.com>
 <MN2PR12MB33441DEDEEB00F8F321F72BBE4D30@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB33441DEDEEB00F8F321F72BBE4D30@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3e35036-44b6-4e82-da11-08d71f0a9f64
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3071; 
x-ms-traffictypediagnostic: MN2PR12MB3071:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB30711A475AEF616A0E88741B8BD30@MN2PR12MB3071.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(13464003)(189003)(199004)(229853002)(81166006)(81156014)(305945005)(71200400001)(71190400001)(256004)(33656002)(14444005)(26005)(86362001)(74316002)(7696005)(76176011)(8936002)(446003)(11346002)(478600001)(25786009)(14454004)(102836004)(6246003)(966005)(2501003)(8676002)(53936002)(6306002)(9686003)(55016002)(2906002)(7736002)(99286004)(486006)(6506007)(6116002)(186003)(3846002)(53546011)(476003)(110136005)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(5660300002)(52536014)(66066001)(6436002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3071;
 H:MN2PR12MB3582.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eAkAaaG7tMj91WVNeeH6Lyn8fGGAQWR6L2s8yI5+kzpHHBpdadnoc3oSx+2t8dzrZf0F4OyY4MrejRyP1l/s5fmZJMaiuNdJk8D743Y4AvZZhmGPpz5Y2IEpd7epFah13bBsBJ1w1qeEZLG7My36boQGsoaKE6L3mtuKJwJbbSzYtZxOED/KGgOAdnYANKhD2gNCjQetTOJ2CSxIrRSoP20gH8YXe62edsUkChz+cmbRvI7mydZ6pZd6pO2fjifxkIsAZNfTSW0OufHSWs1FFczcs2X6UC/+WgewkguDPK9vnJEb1F/PuUjzxbzH8NGg2oZr5S/wnfFO8vK95/UnT4fsxUNQ0c2+ogD6k9j+B2L0xHVzczmiYKlO8YLW+KraFDwF0MfKSIMn6Wg4W8KAClqA5ZjawC2J2M8ebuO42I8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e35036-44b6-4e82-da11-08d71f0a9f64
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 09:51:17.9365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3071
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwnggNWWtCTrQ9lR4gXdPVbmiWCo8Dk72lxPsJBBcps=;
 b=cPmTjgoAZsspZ67QZwW8SaNC9zrCEBy13ozfIsxT4jUHllXfaynGVsAPJbot/c5MqIQl5GfebQWpkepxWc98NnEqCWtFHOSZKg06+msKu+UkXtsLNFUgkOivSev82wUy3ZxF4jYQBFmFlWZCE7V4jfKfN0XwMIAyBGEDbV6uz/4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Gui@amd.com; 
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

SGkgRXZhbiwNCg0KQWxsIHN1cHBvcnRlZCBmZWF0dXJlIGNhbiBiZSBzZXQgdGhlcmUsIA0KQW55
b25lIG9mIHRoZXNlIGZlYXR1cmVzIGlzIHJ1bm5pbmcsIHdlIGNhbiBqdWRnZSBkcG0gaXMgcnVu
bmluZy4gIA0KDQpCUiwNCkphY2sgR3VpDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT4gDQpTZW50OiBNb25kYXksIEF1Z3Vz
dCAxMiwgMjAxOSA1OjM5IFBNDQpUbzogR3VpLCBKYWNrIDxKYWNrLkd1aUBhbWQuY29tPjsgYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBHdWksIEphY2sgPEphY2suR3VpQGFtZC5j
b20+DQpTdWJqZWN0OiBSRTogW1BBVENIIDIvMl0gZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBhcmN0
dXJ1c19pc19kcG1fcnVubmluZyBmdW5jdGlvbiBmb3IgYXJjdHVydXMNCg0KUGxlYXNlIHNldCBG
RUFUVVJFX0RQTV9QUkVGRVRDSEVSX01BU0sgfCBGRUFUVVJFX0RQTV9HRlhDTEtfTUFTSyBvbmx5
LiBGb3Igbm93LCBvbmx5IHRoZXNlIHR3byBhcmUgZW5hYmxlZCBvbiBhcmN0dXJ1cy4NCg0KV2l0
aCB0aGF0IGZpeGVkLCB0aGUgcGF0Y2ggaXMgcmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5x
dWFuQGFtZC5jb20+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFtZC1n
ZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiAN
Cj4gQ2hlbmdtaW5nIEd1aQ0KPiBTZW50OiBNb25kYXksIEF1Z3VzdCAxMiwgMjAxOSA0OjIyIFBN
DQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogR3VpLCBKYWNrIDxK
YWNrLkd1aUBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMi8yXSBkcm0vYW1kL3Bvd2VycGxh
eTogYWRkIGFyY3R1cnVzX2lzX2RwbV9ydW5uaW5nIA0KPiBmdW5jdGlvbiBmb3IgYXJjdHVydXMN
Cj4gDQo+IGFkZCBhcmN0dXJ1c19pc19kcG1fcnVubmluZyBmdW5jdGlvbg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogQ2hlbmdtaW5nIEd1aSA8SmFjay5HdWlAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyB8IDIxDQo+ICsrKysrKysr
KysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQu
Yw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jDQo+IGlu
ZGV4IDAzY2U4NzEuLjkxMDdiZWIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FyY3R1cnVzX3BwdC5jDQo+IEBAIC01MSw2ICs1MSwxNSBAQA0KPiAgI2RlZmluZSBT
TVVfRkVBVFVSRVNfSElHSF9NQVNLICAgICAgIDB4RkZGRkZGRkYwMDAwMDAwMA0KPiAgI2RlZmlu
ZSBTTVVfRkVBVFVSRVNfSElHSF9TSElGVCAgICAgIDMyDQo+IA0KPiArI2RlZmluZSBTTUNfRFBN
X0ZFQVRVUkUgKCBcDQo+ICsJRkVBVFVSRV9EUE1fUFJFRkVUQ0hFUl9NQVNLIHwgXA0KPiArCUZF
QVRVUkVfRFBNX0dGWENMS19NQVNLIHwgXA0KPiArCUZFQVRVUkVfRFBNX1VDTEtfTUFTSyB8IFwN
Cj4gKwlGRUFUVVJFX0RQTV9TT0NDTEtfTUFTSyB8IFwNCj4gKwlGRUFUVVJFX0RQTV9NUDBDTEtf
TUFTSyB8IFwNCj4gKwlGRUFUVVJFX0RQTV9GQ0xLX01BU0sgfCBcDQo+ICsJRkVBVFVSRV9EUE1f
WEdNSV9NQVNLKQ0KPiArDQo+ICAvKiBwb3NzaWJsZSBmcmVxdWVuY3kgZHJpZnQgKDFNaHopICov
DQo+ICAjZGVmaW5lIEVQU0lMT04JCQkJMQ0KPiANCj4gQEAgLTE4NzMsNiArMTg4MiwxNyBAQCBz
dGF0aWMgdm9pZCBhcmN0dXJ1c19kdW1wX3BwdGFibGUoc3RydWN0IA0KPiBzbXVfY29udGV4dCAq
c211KQ0KPiANCj4gIH0NCj4gDQo+ICtzdGF0aWMgYm9vbCBhcmN0dXJ1c19pc19kcG1fcnVubmlu
ZyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkgew0KPiArCWludCByZXQgPSAwOw0KPiArCXVpbnQz
Ml90IGZlYXR1cmVfbWFza1syXTsNCj4gKwl1bnNpZ25lZCBsb25nIGZlYXR1cmVfZW5hYmxlZDsN
Cj4gKwlyZXQgPSBzbXVfZmVhdHVyZV9nZXRfZW5hYmxlZF9tYXNrKHNtdSwgZmVhdHVyZV9tYXNr
LCAyKTsNCj4gKwlmZWF0dXJlX2VuYWJsZWQgPSAodW5zaWduZWQgbG9uZykoKHVpbnQ2NF90KWZl
YXR1cmVfbWFza1swXSB8DQo+ICsJCQkgICAoKHVpbnQ2NF90KWZlYXR1cmVfbWFza1sxXSA8PCAz
MikpOw0KPiArCXJldHVybiAhIShmZWF0dXJlX2VuYWJsZWQgJiBTTUNfRFBNX0ZFQVRVUkUpOyB9
DQo+ICsNCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyBhcmN0dXJ1c19wcHRf
ZnVuY3MgPSB7DQo+ICAJLyogdHJhbnNsYXRlIHNtdSBpbmRleCBpbnRvIGFyY3R1cnVzIHNwZWNp
ZmljIGluZGV4ICovDQo+ICAJLmdldF9zbXVfbXNnX2luZGV4ID0gYXJjdHVydXNfZ2V0X3NtdV9t
c2dfaW5kZXgsIEBAIC0xOTEwLDYNCj4gKzE5MzAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBw
dGFibGVfZnVuY3MgYXJjdHVydXNfcHB0X2Z1bmNzID0gew0KPiAgCS8qIGRlYnVnIChpbnRlcm5h
bCB1c2VkKSAqLw0KPiAgCS5kdW1wX3BwdGFibGUgPSBhcmN0dXJ1c19kdW1wX3BwdGFibGUsDQo+
ICAJLmdldF9wb3dlcl9saW1pdCA9IGFyY3R1cnVzX2dldF9wb3dlcl9saW1pdCwNCj4gKwkuaXNf
ZHBtX3J1bm5pbmcgPSBhcmN0dXJ1c19pc19kcG1fcnVubmluZywNCj4gIH07DQo+IA0KPiAgdm9p
ZCBhcmN0dXJ1c19zZXRfcHB0X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQ0KPiAtLQ0K
PiAyLjcuNA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
