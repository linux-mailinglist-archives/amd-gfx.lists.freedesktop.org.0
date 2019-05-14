Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D598C1D086
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 22:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0648920F;
	Tue, 14 May 2019 20:24:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690060.outbound.protection.outlook.com [40.107.69.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0038920F
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 20:24:17 +0000 (UTC)
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2484.namprd12.prod.outlook.com (10.172.119.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Tue, 14 May 2019 20:24:15 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3%10]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 20:24:15 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/amd/display: Add ASICREV_IS_PICASSO
Thread-Topic: [PATCH 1/3] drm/amd/display: Add ASICREV_IS_PICASSO
Thread-Index: AQHVCn18L1Ft5U6rI0q+rvwPCOibwqZq7o+AgAAiWIA=
Date: Tue, 14 May 2019 20:24:15 +0000
Message-ID: <76f60775-72bd-7a36-a2d9-88b9475dd2eb@amd.com>
References: <20190514174935.28605-1-harry.wentland@amd.com>
 <387c6572-f872-44e1-3b41-de6ae957646d@amd.com>
In-Reply-To: <387c6572-f872-44e1-3b41-de6ae957646d@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTOPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::24) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca6e2f40-689b-4107-402e-08d6d8aa226f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB2484; 
x-ms-traffictypediagnostic: CY4PR1201MB2484:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR1201MB248425CFA176B048047E90C48C080@CY4PR1201MB2484.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(39860400002)(346002)(136003)(366004)(199004)(189003)(72206003)(66556008)(66476007)(71190400001)(6306002)(8676002)(6512007)(6486002)(64756008)(52116002)(71200400001)(66946007)(81166006)(81156014)(5660300002)(6436002)(73956011)(65826007)(186003)(8936002)(7736002)(305945005)(26005)(66446008)(229853002)(478600001)(31686004)(2616005)(11346002)(58126008)(2906002)(476003)(54906003)(110136005)(446003)(966005)(6246003)(53936002)(3846002)(6116002)(66066001)(65956001)(65806001)(53546011)(99286004)(2501003)(486006)(64126003)(386003)(6506007)(102836004)(14454004)(76176011)(256004)(316002)(31696002)(68736007)(4326008)(25786009)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2484;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Es9fR5o+wZvH8s61muqA+ujo7K4lpSKC9CLmr0rQuUzD4XMK8vfTPvL8YX+XFcOn4QwfZPdbjQuAs8MuCTKW5hg/lroNiEp/6PW+QZkj7+4/jUNrmHzqoLBSeWjPLmGbs9E0HSJGoqpKsP2ZZ+DLwtACJH7oIO2uQusOYRFcJkvpu+BcNQ2FU831AveOg1WqBm9UJB4/zyBcDCxBFAamBk27Z81qwkM/ibFiChwIqafZD4x+3ZnkySPCGTqk45ESFPkrHOkQmWm+zQDx1tlTsHbumzsFBWZnwpzKJeN7exNm8q5MC4B/hW94Kk+0rgr3/waTEcrxBtPKqzbWd+K5mHsGHv0Z9O5sBWdJJ4oq91z/rY36HoNlrNDPOMb+5lXOJL/EdfkHjAVCW6S94O5kon1nb5XjxvZtZTnoQY0Qgw4=
Content-ID: <84C21932DCCD1643A4D4C4503D560A02@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6e2f40-689b-4107-402e-08d6d8aa226f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 20:24:15.6512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2484
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYZDRMJKjSgINI1p2QkYRfYFrvZ01Kw7f410xp6Alns=;
 b=S68+K0nYFTMQ9dYZrm7Keg5sak3mNUTsT55ute8RlD5r3JhMO8sdeKuCyj5bP6Ox/9C5dm9CZFglAGah1a6LYLtC0IudPHAeGuP/tQGRqJs/ITyEyqpn5ty00zCAlvaALI92+svMdVCwVOgqqkWB96oan4D49onzhf6LhNMaFAU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Cheng,
 Tony" <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0xNCAyOjIwIHAubS4sIEthemxhdXNrYXMsIE5pY2hvbGFzIHdyb3RlOg0KPiBb
Q0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQo+IA0KPiBPbiA1LzE0LzE5IDE6NDkgUE0sIEhhcnJ5
IFdlbnRsYW5kIHdyb3RlOg0KPj4NCj4+IFtXSFldDQo+PiBXZSBvbmx5IHdhbnQgdG8gbG9hZCBE
TUNVIEZXIG9uIFBpY2Fzc28gYW5kIFJhdmVuIDIsIG5vdCBvbiBSYXZlbiAxLg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0KPj4g
LS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RhbF9hc2ljX2lk
LmggfCA3ICsrKystLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2luY2x1ZGUvZGFsX2FzaWNfaWQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9p
bmNsdWRlL2RhbF9hc2ljX2lkLmgNCj4+IGluZGV4IDFhOWI3NTA3Nzg0Zi4uMDcyZDhkN2RlYmY1
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGFs
X2FzaWNfaWQuaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUv
ZGFsX2FzaWNfaWQuaA0KPj4gQEAgLTEzOSwxMyArMTM5LDE0IEBADQo+PiAgICNkZWZpbmUgUkFW
RU4xX0YwIDB4RjANCj4+ICAgI2RlZmluZSBSQVZFTl9VTktOT1dOIDB4RkYNCj4+DQo+PiAtI2lm
IGRlZmluZWQoQ09ORklHX0RSTV9BTURfRENfRENOMV8wMSkNCj4+IC0jZGVmaW5lIEFTSUNSRVZf
SVNfUkFWRU4yKGVDaGlwUmV2KSAoKGVDaGlwUmV2ID49IFJBVkVOMl9BMCkgJiYgKGVDaGlwUmV2
IDwgMHhGMCkpDQo+PiAtI2VuZGlmIC8qIERDTjFfMDEgKi8NCj4+ICAgI2RlZmluZSBBU0lDX1JF
Vl9JU19SQVZFTihlQ2hpcFJldikgKChlQ2hpcFJldiA+PSBSQVZFTl9BMCkgJiYgZUNoaXBSZXYg
PCBSQVZFTl9VTktOT1dOKQ0KPj4gICAjZGVmaW5lIFJBVkVOMV9GMCAweEYwDQo+PiAgICNkZWZp
bmUgQVNJQ1JFVl9JU19SVjFfRjAoZUNoaXBSZXYpICgoZUNoaXBSZXYgPj0gUkFWRU4xX0YwKSAm
JiAoZUNoaXBSZXYgPCBSQVZFTl9VTktOT1dOKSkNCj4+DQo+PiArI2lmIGRlZmluZWQoQ09ORklH
X0RSTV9BTURfRENfRENOMV8wMSkNCj4+ICsjZGVmaW5lIEFTSUNSRVZfSVNfUElDQVNTTyhlQ2hp
cFJldikgKChlQ2hpcFJldiA+PSBQSUNBU1NPX0EwKSAmJiAoZUNoaXBSZXYgPCBSQVZFTjJfQTAp
KQ0KPj4gKyNkZWZpbmUgQVNJQ1JFVl9JU19SQVZFTjIoZUNoaXBSZXYpICgoZUNoaXBSZXYgPj0g
UkFWRU4yX0EwKSAmJiAoZUNoaXBSZXYgPCAweEYwKSkNCj4+ICsjZW5kaWYgLyogRENOMV8wMSAq
Lw0KPiANCj4gQWN0dWFsbHksIEkganVzdCByZWFsaXplZCBhIHByb2JsZW0gd2l0aCBkb2luZyB0
aGlzLiBZb3UnbGwgYnJlYWsgYnVpbGRzDQo+IHRoYXQgZG9uJ3QgaGF2ZSBEQ04gZW5hYmxlZCB3
aXRoIHRoZSBzZWNvbmQgcGF0Y2ggYmVjYXVzZSB5b3UncmUNCj4gZ3VhcmRpbmcgdGhlc2UgYmVo
aW5kIHRoZSBkZWZpbmUgYW5kIHRoZSBzZWNvbmQgcGF0Y2ggY2hlY2tzDQo+IEFTSUNSRVZfSVNf
UElDQVNTTyBvdXRzaWRlIG9mIGFueSBndWFyZCBhdCBhbGwuDQo+IA0KDQpXaG9vcHMuIEkgbWlz
c2VkIHRoYXQuIFRoZSBzdWJzZXF1ZW50IGNoYW5nZSAoIkRyb3AgRENOMV8wMSBndWFyZHMiKQ0K
Zml4ZXMgdGhhdC4NCg0KSSBwcm9iYWJseSBzaG91bGQndmUgb3JkZXJlZCB0aGVzZSBkaWZmZXJl
bnRseS4NCg0KSGFycnkNCg0KPiBOaWNob2xhcyBLYXpsYXVza2FzDQo+IA0KPj4NCj4+ICAgI2Rl
ZmluZSBGQU1JTFlfUlYgMTQyIC8qIERDTiAxKi8NCj4+DQo+PiAtLQ0KPj4gMi4yMS4wDQo+Pg0K
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGFt
ZC1nZnggbWFpbGluZyBsaXN0DQo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQo+
Pg0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
DQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
