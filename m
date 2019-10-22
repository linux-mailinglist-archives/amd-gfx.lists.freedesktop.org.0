Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A98DE0638
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 16:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2F96E825;
	Tue, 22 Oct 2019 14:19:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720059.outbound.protection.outlook.com [40.107.72.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF98C6E825
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 14:19:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oD1yIcNbSw70vkIyYlGOtFTSSk4YZZ1Ygsqt1KUPxJdJvOGDLekjV0NCh75Zphl4Zu+7TvMTQ4nufo7vkRVWLaEwpJiU+nXYOnsDVUJvWifv93NiiSLFl7iiM/wu1Y5+PDPJUdPsF0n3fDp6eYniT9OwWUiHaMoRrBfS/SYicDeW7yOkaByUn4uSMxLxpfldcRTNbMGVIe+C/25LSNkVln3sIlnrLDZpMJ0yoX5YHtiZ8bFeEQlpVevb+dL+l4/Zy4ZWF7ee8kkvrTsckha+tPLlzNa4YMvLBRgEH6c2zFs/2SaNGUQI/e4JtFMZUgoB5gngW3Z9joTcotksJzeruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq7KQ/nOkYKU4QpSJs6JrwWEIDAMl3LFXSsGJPy4WR0=;
 b=NOgV0SWOII/cSwyMPgpLy/WOyqACnfJEdTreRde1T+U6fXZJngxQH6k3dFmFbaiZupXOY15dOlXirApq+DQGY1EUkoZ2gyJs1dBDqFMTYkArlt837qlWcXqSUpl9BT7sF5tsvCCPinNO+JS8lt1WATSwP4OGHY4QKB/FAkhEvspqkbig6yd5YfdBK2vz5VE9B1bFvTXejMNb52eNPy2odlwk6SOJQLcyLeFCQ2KiOvGtWzWYeLPFwfsNcd19uoYNaNdhgFrIfl0P33eUu75xuf1bAGLtmy0y1RkanHqakoJRA5fDD3WK3+U2zEw3RyalHjO/53tnLefJyLE2tdloYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3062.namprd12.prod.outlook.com (20.178.196.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Tue, 22 Oct 2019 14:19:12 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::5598:12d2:404c:5373]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::5598:12d2:404c:5373%7]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 14:19:11 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Li, Roman" <Roman.Li@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/amdgpu/display: add dc feature mask for psr enablement
Thread-Topic: [PATCH] drm/amdgpu/display: add dc feature mask for psr
 enablement
Thread-Index: AQHViFjUqPNmWSMlBUmkk5pZ4xQsN6dmmqqAgAAPWACAAAyhAA==
Date: Tue, 22 Oct 2019 14:19:11 +0000
Message-ID: <434b9682-b35a-f983-b8e4-7e8216de3df1@amd.com>
References: <1571694305-14820-1-git-send-email-Roman.Li@amd.com>
 <f446a637-23b0-a876-7e6d-899483d0bdc6@amd.com>
 <BL0PR12MB28204625E85855DA3144096F89680@BL0PR12MB2820.namprd12.prod.outlook.com>
In-Reply-To: <BL0PR12MB28204625E85855DA3144096F89680@BL0PR12MB2820.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::39) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 419fda74-63dc-40b8-7d10-08d756facf20
x-ms-traffictypediagnostic: BYAPR12MB3062:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB306246C1451F3D79B20B250AEC680@BYAPR12MB3062.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(189003)(13464003)(199004)(25786009)(256004)(14444005)(66066001)(316002)(110136005)(54906003)(6116002)(2906002)(3846002)(31696002)(86362001)(386003)(66476007)(64756008)(71190400001)(71200400001)(66446008)(66556008)(66946007)(6246003)(31686004)(6506007)(53546011)(4001150100001)(76176011)(81166006)(81156014)(52116002)(99286004)(8936002)(6512007)(446003)(11346002)(486006)(476003)(2616005)(6306002)(6636002)(26005)(186003)(102836004)(6436002)(966005)(8676002)(229853002)(14454004)(2501003)(4326008)(478600001)(5660300002)(305945005)(6486002)(36756003)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3062;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VV1EjyBJDXn1vu7h93WFaMEEigVOkfsz9nd9OwDN5JIl4MjG+ykDHwV3R1XFkmh+d5XmITczW3YMPLtewfVCoz6cEsiuzHS+cuZJN/pAObQGYJsiTtElSyzNjnKkYA8xVI4cXfCTDGNyAMxJZzmkn2HaCyNkUfPaYRGJCDyMlXSHGiGhYrlHHxCoeIPnvCdu0jO+nrJf4Ey6KFmOG1tBFoIreHo6WohxcBYx/01VONrWyzr+vAmQDg0pPpDKFRyw7nm1VyvsSHmdIzgo+3wWisAkio6Fqkh6ROPhoxAOvTTplYn3+tFIHGFe3gyZmxn6dEEMwQTnpfX29RLc0rl6eLO1jXllPmI+2UuMYgKLFGkk/l/oqUB9fn1htHrRq6G0s1VsxRHxHCtpzab4YlxgT68k9r75Xyx1eyneyNHj41BAe+U5XxKdVuOSae5njhvrAlDdKVFPJoanzJIyWiI967C0wZG+auZ1sICeymwclM8=
Content-ID: <7BF9584EB1E5B44983E72C752F88DF8F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 419fda74-63dc-40b8-7d10-08d756facf20
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 14:19:11.5968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PMC5c7FucAHtkeNOYQjtiiRKtBxDBSlei93snhUYOqsG8gZjV6geNxIu/z0xQixUFLT1YX4X1wrcFJbvFAkX9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3062
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq7KQ/nOkYKU4QpSJs6JrwWEIDAMl3LFXSsGJPy4WR0=;
 b=wJS8m20DxhzdiEORoCiFgbvmpglcKGH5j5ZEjZ36r78ShAUKMz0u+5ET+SLC6spfRERyI4Qah6vahs/g1AAH2UoLj+PvwB0lh8zT6o+eyoK3ZM6YtDiM9A0HO4jAhhQWciU2BjqobphdDPyGHknYmFhFkl3isqjalNL7WTtpTkg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0yMiA5OjMzIGEubS4sIExpLCBSb21hbiB3cm90ZToNCj4+IEFueSByZWFzb24g
d2h5IHdlJ3JlIHNraXBwaW5nIGEgZmxhZyBoZXJlIGdvaW5nIGZyb20gMHgyIHRvIDB4OD8NCj4g
DQo+IDB4NCBpcyByZXNlcnZlZCBmb3IgZnJhY3Rpb25hbCBwd20gIG1hc2s6DQo+IGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zMzY5MjMvDQoNCkFoLCBtaXNzZWQgdGhh
dCBwYXRjaC4gTm8gcHJvYmxlbSB0aGVuLCBmZWVsIGZyZWUgdG8gZ28gYWhlYWQgd2l0aCB0aGlz
Lg0KDQpOaWNob2xhcyBLYXpsYXVza2FzDQoNCj4gDQo+IFRoYW5rIHlvdSBOaWNob2xhcyBmb3Ig
dGhlIHJldmlldy4NCj4gDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEth
emxhdXNrYXMsIE5pY2hvbGFzIDxOaWNob2xhcy5LYXpsYXVza2FzQGFtZC5jb20+DQo+IFNlbnQ6
IFR1ZXNkYXksIE9jdG9iZXIgMjIsIDIwMTkgODozOSBBTQ0KPiBUbzogTGksIFJvbWFuIDxSb21h
bi5MaUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IERldWNoZXIsIEFs
ZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NCj4gQ2M6IFdlbnRsYW5kLCBIYXJy
eSA8SGFycnkuV2VudGxhbmRAYW1kLmNvbT47IExha2hhLCBCaGF3YW5wcmVldCA8Qmhhd2FucHJl
ZXQuTGFraGFAYW1kLmNvbT47IExpLCBTdW4gcGVuZyAoTGVvKSA8U3VucGVuZy5MaUBhbWQuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1L2Rpc3BsYXk6IGFkZCBkYyBmZWF0
dXJlIG1hc2sgZm9yIHBzciBlbmFibGVtZW50DQo+IA0KPiBPbiAyMDE5LTEwLTIxIDU6NDUgcC5t
LiwgUm9tYW4uTGlAYW1kLmNvbSB3cm90ZToNCj4+IEZyb206IFJvbWFuIExpIDxSb21hbi5MaUBh
bWQuY29tPg0KPj4NCj4+IFtXaHldDQo+PiBBZGRpbmcgcHNyIG1hc2sgdG8gZGMgZmVhdHVyZXMg
YWxsb3dzIHNlbGVjdGl2ZWx5IGRpc2FibGUvZW5hYmxlIHBzci4NCj4+IEN1cnJlbnQgcHNyIGlt
cGxlbWVudGF0aW9uIG1heSBub3Qgd29yayB3aXRoIG5vbi1wYWdlZmxpcHBpbmcgYXBwbGljYXRp
b24uDQo+PiBVbnRpbCByZXNvbHZlZCBpdCBzaG91bGQgYmUgZGlzYWJsZWQgYnkgZGVmYXVsdC4N
Cj4+DQo+PiBbSG93XQ0KPj4gQWRkIGRjZmVhdHVyZW1hc2sgZm9yIHBzciBlbmFibGVtZW50LiBE
aXNhYmxlIGJ5IGRlZmF1bHQuDQo+PiBUbyBlbmFibGUgc2V0IGFtZGdwdS5kY2ZlYXR1cmVtYXNr
PTB4OCBpbiBncnViIGtlcm5lbCBjb21tYW5kIGxpbmUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
Um9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAzICsrLQ0KPj4gICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaCAgICAgICAgICB8IDEgKw0KPj4gICAg
MiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYw0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jDQo+PiBpbmRleCAxY2Y0YmViLi4wZjA4ODc5IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPj4gQEAgLTI0MjQs
NyArMjQyNCw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2luaXRpYWxpemVfZHJtX2RldmljZShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4+ICAgIAkJfSBlbHNlIGlmIChkY19saW5rX2Rl
dGVjdChsaW5rLCBERVRFQ1RfUkVBU09OX0JPT1QpKSB7DQo+PiAgICAJCQlhbWRncHVfZG1fdXBk
YXRlX2Nvbm5lY3Rvcl9hZnRlcl9kZXRlY3QoYWNvbm5lY3Rvcik7DQo+PiAgICAJCQlyZWdpc3Rl
cl9iYWNrbGlnaHRfZGV2aWNlKGRtLCBsaW5rKTsNCj4+IC0JCQlhbWRncHVfZG1fc2V0X3Bzcl9j
YXBzKGxpbmspOw0KPj4gKwkJCWlmIChhbWRncHVfZGNfZmVhdHVyZV9tYXNrICYgRENfUFNSX01B
U0spDQo+PiArCQkJCWFtZGdwdV9kbV9zZXRfcHNyX2NhcHMobGluayk7DQo+PiAgICAJCX0NCj4+
ICAgIA0KPj4gICAgDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRl
L2FtZF9zaGFyZWQuaA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJl
ZC5oDQo+PiBpbmRleCA4ODg5YWFjLi4xZGFhMjIxIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaA0KPj4gQEAgLTE0Myw2ICsxNDMsNyBAQCBlbnVtIFBQ
X0ZFQVRVUkVfTUFTSyB7DQo+PiAgICBlbnVtIERDX0ZFQVRVUkVfTUFTSyB7DQo+PiAgICAJRENf
RkJDX01BU0sgPSAweDEsDQo+PiAgICAJRENfTVVMVElfTU9OX1BQX01DTEtfU1dJVENIX01BU0sg
PSAweDIsDQo+PiArCURDX1BTUl9NQVNLID0gMHg4LA0KPiANCj4gQ2FuIHRoaXMganVzdCBiZSAw
eDQgaW5zdGVhZD8gQW55IHJlYXNvbiB3aHkgd2UncmUgc2tpcHBpbmcgYSBmbGFnIGhlcmUgZ29p
bmcgZnJvbSAweDIgdG8gMHg4Pw0KPiANCj4gWW91IGNhbiBzdGlsbCBoYXZlIG15Og0KPiANCj4g
UmV2aWV3ZWQtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1k
LmNvbT4NCj4gDQo+IGJ1dCBteSBwcmVmZXJlbmNlIHdvdWxkIGJlIG9uIGZpeGluZyB0aGlzIHVw
IHRvIGEgMHg0IGZpcnN0IGluIHRoZSBjb21taXQgbWVzc2FnZSAvIERDX0ZFQVRVUkVfTUFTSy4N
Cj4gDQo+IE5pY2hvbGFzIEthemxhdXNrYXMNCj4gDQo+PiAgICB9Ow0KPj4gICAgDQo+PiAgICBl
bnVtIGFtZF9kcG1fZm9yY2VkX2xldmVsOw0KPj4NCj4gDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
