Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA013B72A
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 16:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99558916D;
	Mon, 10 Jun 2019 14:21:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720047.outbound.protection.outlook.com [40.107.72.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F4A8916D
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jun 2019 14:21:10 +0000 (UTC)
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com (10.172.77.148) by
 CY4PR1201MB0024.namprd12.prod.outlook.com (10.172.77.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Mon, 10 Jun 2019 14:21:09 +0000
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9]) by CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9%8]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 14:21:09 +0000
From: James Zhu <jamesz@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Shamis, Leonid"
 <Leonid.Shamis@amd.com>, "Zhu, James" <James.Zhu@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Add GDS clearing workaround in later init for
 gfx9
Thread-Topic: [PATCH] drm/amdgpu: Add GDS clearing workaround in later init
 for gfx9
Thread-Index: AQHVHU9fi+Ptg8J/EEmosJ0MSRUp9KaQf4CAgAAP5oCAAAgmgP//xoqAgAFYs4CAAz4UgA==
Date: Mon, 10 Jun 2019 14:21:08 +0000
Message-ID: <7fb6953d-a7ae-301f-a5c3-e303fb77d286@amd.com>
References: <1559925472-20077-1-git-send-email-James.Zhu@amd.com>
 <CADnq5_NBWcUtXsBbQP5uBvaOFgWXw3Lhj=ZOisVyTctqZph=xQ@mail.gmail.com>
 <19203faa-970e-732b-a0e0-d2d1fe69ce30@amd.com>
 <65266293-ac7a-c3ef-752b-1691299b1f28@amd.com>
 <3598A781-7AF5-4DDE-83AE-8835E85573D3@amd.com>
 <3ab2a128-3433-0e45-b555-2aff0892f8e6@gmail.com>
In-Reply-To: <3ab2a128-3433-0e45-b555-2aff0892f8e6@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::44) To CY4PR1201MB0102.namprd12.prod.outlook.com
 (2603:10b6:910:1b::20)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3989d3ed-6b0f-4369-39a1-08d6edaee1bc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0024; 
x-ms-traffictypediagnostic: CY4PR1201MB0024:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR1201MB0024C488C0439FF30B533514E4130@CY4PR1201MB0024.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(376002)(346002)(396003)(366004)(199004)(189003)(68736007)(229853002)(2906002)(3846002)(6116002)(99286004)(6306002)(26005)(71190400001)(71200400001)(486006)(14454004)(6436002)(186003)(25786009)(316002)(4326008)(476003)(446003)(386003)(6506007)(53546011)(6486002)(36756003)(11346002)(2616005)(7736002)(66574012)(76176011)(966005)(31686004)(53936002)(305945005)(6246003)(72206003)(256004)(54906003)(66066001)(102836004)(66946007)(81166006)(66446008)(81156014)(5660300002)(66476007)(66556008)(64756008)(478600001)(8676002)(14444005)(8936002)(6512007)(110136005)(73956011)(52116002)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0024;
 H:CY4PR1201MB0102.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +xEP/lo3oMAf6kJepiRBXezfazo5NohPNENbTw88FYBsX7Qq/0NEj81viLvauFDCQ7Fol/TyOXQWqVOi5a1+kYrprP/ln+2KIxgmaza9MUyMam5Pa+Ku3iX3j3ZS6JS2rqgLpfKsN724GKAa8/o+jecAQxPJc7tnAiy0NNnGF2OG6I02QCuK7c+e6NsuGo5lT5k/cgLF/7zCHJIDfeGt0n12ryTwL/QgMqdMul0isdBuWNankCyhZWrOO1wG2+bXa1fY4bqUR9F5J98PuHZDwsTB3/mk+ue7fpo0B4CADOrRPsyy2Q6q8QSorPOWtYTykvIjuEFK+jw+LFqlXhFs5vXGC1Vfk7VMTph+uZFoPLNgQKWHbWvhJhGokKsy1uBmQsBh5793019SlajKFjkBH5CPOxPvO6sBkLKEHI0Ceus=
Content-ID: <8F8922DAAE0CAC44A78D91AC71581A6C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3989d3ed-6b0f-4369-39a1-08d6edaee1bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 14:21:08.9817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jamesz@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0024
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjNqZw5xWLT/Pn9tF6lTWzX13Uj4IREkGoKpRcIvwCA=;
 b=kb+rnQ+a2IDdNLybJETjUDJgBlBofu0I3niMRi12x5Pg1D8fX3JPCEn4WW6Na+G6SpJH9Z8c/WwOkTeiUvi9N8IXzP04j3axMbDZgpLgxnBNNql9n1Fc+2Jffzf7QrgiIX8rwk2lPjJIS/JVWbpz3nClia5+jgbTCp+paDPvSQo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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
Cc: "Gabra, Maroun" <Maroun.Gabra@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiAyMDE5LTA2LTA4IDg6NTAgYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4gWWVh
aCwgdGhhdCB3b3VsZCBiZSBhIGdvb2QgaWRlYSBhcyB3ZWxsLg0KPg0KPiBBZGRpdGlvbmFsIHRv
IHRoYXQgSSBzdWdnZXN0IHRvIHVwZGF0ZSBHRFNfVk1JRDBfQkFTRS9fU0laRSB3aXRoIA0KPiBk
aXJlY3QgcmVnaXN0ZXIgd3JpdGVzIGluc3RlYWQgb2YgUE00IHBhY2tldHMuDQoNCkkgY2FuIGRv
IHNvLg0KDQpKYW1lcw0KDQo+DQo+IENocmlzdGlhbi4NCj4NCj4gQW0gMDcuMDYuMTkgdW0gMjI6
MTYgc2NocmllYiBTaGFtaXMsIExlb25pZDoNCj4+IEphbWVzLA0KPj4NCj4+IERvIHlvdSBzZXQg
R0RTX1ZNSUQwX0JBU0UgdG8gMD8uLiBJIGRvbid0IHNlZSBpdCBpbiB5b3VyIHBhdGNoLg0KPj4N
Cj4+IFJlZ2FyZHMsDQo+PiBMZW9uaWQNCj4+DQo+PiDvu79PbiAyMDE5LTA2LTA3LCAxNTo0Miwg
IlpodSwgSmFtZXMiIDxKYW1lcy5aaHVAYW1kLmNvbT4gd3JvdGU6DQo+Pg0KPj4gwqDCoMKgwqAg
wqDCoMKgwqAgT24gMjAxOS0wNi0wNyAzOjEyIHAubS4sIFpodSwgSmFtZXMgd3JvdGU6DQo+PiDC
oMKgwqDCoCA+IE9uIDIwMTktMDYtMDcgMjoxNiBwLm0uLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+
PiDCoMKgwqDCoCA+PiBPbiBGcmksIEp1biA3LCAyMDE5IGF0IDEyOjM4IFBNIFpodSwgSmFtZXMg
DQo+PiA8SmFtZXMuWmh1QGFtZC5jb20+IHdyb3RlOg0KPj4gwqDCoMKgwqAgPj4+IFNpbmNlIEhh
cmR3YXJlIGJ1ZywgR0RTIGV4aXN0IEVDQyBlcnJvciBhZnRlciBjb2xkIGJvb3QgdXAsDQo+PiDC
oMKgwqDCoCA+Pj4gYWRkaW5nIEdEUyBjbGVhcmluZyB3b3JrYXJvdW5kIGluIGxhdGVyIGluaXQg
Zm9yIGdmeDkuDQo+PiDCoMKgwqDCoCA+Pj4NCj4+IMKgwqDCoMKgID4+PiBTaWduZWQtb2ZmLWJ5
OiBKYW1lcyBaaHUgPEphbWVzLlpodUBhbWQuY29tPg0KPj4gwqDCoMKgwqAgPj4+IC0tLQ0KPj4g
wqDCoMKgwqAgPj4+wqDCoMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMg
fCA0OCANCj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiDCoMKgwqDC
oCA+Pj7CoMKgwqAgMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKykNCj4+IMKgwqDCoMKg
ID4+Pg0KPj4gwqDCoMKgwqAgPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjlfMC5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jDQo+PiDCoMKgwqDCoCA+Pj4gaW5kZXggNzY3MjJmYy4uODFmNmJhOCAxMDA2NDQNCj4+IMKg
wqDCoMKgID4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+
PiDCoMKgwqDCoCA+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAu
Yw0KPj4gwqDCoMKgwqAgPj4+IEBAIC0zNjM0LDYgKzM2MzQsNTAgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBzb2MxNV9yZWdfZW50cnkgDQo+PiBzZWNfZGVkX2NvdW50ZXJfcmVnaXN0ZXJzW10gPSB7
DQo+PiDCoMKgwqDCoCA+Pj7CoMKgwqDCoMKgwqAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1t
U1FDX0VEQ19DTlQzKSwgMCwgNCwgNn0sDQo+PiDCoMKgwqDCoCA+Pj7CoMKgwqAgfTsNCj4+IMKg
wqDCoMKgID4+Pg0KPj4gwqDCoMKgwqAgPj4+ICsNCj4+IMKgwqDCoMKgID4+PiArc3RhdGljIGlu
dCBnZnhfdjlfMF9kb19lZGNfZ2RzX3dvcmthcm91bmRzKHN0cnVjdCANCj4+IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpDQo+PiDCoMKgwqDCoCA+Pj4gK3sNCj4+IMKgwqDCoMKgID4+PiArwqDCoMKgwqDC
oMKgIHN0cnVjdCBhbWRncHVfcmluZyAqcmluZyA9ICZhZGV2LT5nZnguY29tcHV0ZV9yaW5nWzBd
Ow0KPj4gwqDCoMKgwqAgPj4+ICvCoMKgwqDCoMKgwqAgaW50IHI7DQo+PiDCoMKgwqDCoCA+Pj4g
Kw0KPj4gwqDCoMKgwqAgPj4+ICvCoMKgwqDCoMKgwqAgciA9IGFtZGdwdV9yaW5nX2FsbG9jKHJp
bmcsIDE3KTsNCj4+IMKgwqDCoMKgID4+PiArwqDCoMKgwqDCoMKgIGlmIChyKSB7DQo+PiDCoMKg
wqDCoCA+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX0VSUk9SKCJhbWRncHU6
IEdEUyB3b3JrYXJvdW5kcyBmYWlsZWQgdG8gDQo+PiBsb2NrIHJpbmcgJXMgKCVkKS5cbiIsDQo+
PiDCoMKgwqDCoCA+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJpbmctPm5hbWUsIHIpOw0KPj4gwqDCoMKgwqAgPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiByOw0KPj4gwqDCoMKgwqAgPj4+ICvCoMKgwqDCoMKgwqAgfQ0KPj4g
wqDCoMKgwqAgPj4+ICsNCj4+IMKgwqDCoMKgID4+PiArwqDCoMKgwqDCoMKgIGFtZGdwdV9yaW5n
X3dyaXRlKHJpbmcsIFBBQ0tFVDMoUEFDS0VUM19XUklURV9EQVRBLCANCj4+IDMpKTsNCj4+IMKg
wqDCoMKgID4+PiArwqDCoMKgwqDCoMKgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFdSSVRFX0RB
VEFfRU5HSU5FX1NFTCgwKSB8DQo+PiDCoMKgwqDCoCA+Pj4gKyBXUklURV9EQVRBX0RTVF9TRUwo
MCkpOw0KPj4gwqDCoMKgwqAgPj4+ICvCoMKgwqDCoMKgwqAgYW1kZ3B1X3Jpbmdfd3JpdGUocmlu
ZywgU09DMTVfUkVHX09GRlNFVChHQywgMCwgDQo+PiBtbUdEU19WTUlEMF9TSVpFKSk7DQo+PiDC
oMKgwqDCoCA+Pj4gK8KgwqDCoMKgwqDCoCBhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsNCj4+
IMKgwqDCoMKgID4+PiArwqDCoMKgwqDCoMKgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDB4MTAw
MDApOw0KPj4gwqDCoMKgwqAgPj4gaGFyZGNvZGVkIHNpemUsIHBsZWFzZSB1c2UgdGhlIHNpemUg
ZnJvbSB0aGUgZHJpdmVyLg0KPj4gwqDCoMKgwqAgPj4NCj4+IMKgwqDCoMKgID4+PiArDQo+PiDC
oMKgwqDCoCA+Pj4gK8KgwqDCoMKgwqDCoCBhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQz
KFBBQ0tFVDNfRE1BX0RBVEEsIDUpKTsNCj4+IMKgwqDCoMKgID4+PiArwqDCoMKgwqDCoMKgIGFt
ZGdwdV9yaW5nX3dyaXRlKHJpbmcsIChQQUNLRVQzX0RNQV9EQVRBX0NQX1NZTkMgfA0KPj4gwqDC
oMKgwqAgPj4+ICsgUEFDS0VUM19ETUFfREFUQV9EU1RfU0VMKDEpIHwNCj4+IMKgwqDCoMKgID4+
PiArIFBBQ0tFVDNfRE1BX0RBVEFfU1JDX1NFTCgyKSB8DQo+PiDCoMKgwqDCoCA+Pj4gKyBQQUNL
RVQzX0RNQV9EQVRBX0VOR0lORSgwKSkpOw0KPj4gwqDCoMKgwqAgPj4+ICvCoMKgwqDCoMKgwqAg
YW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMCk7DQo+PiDCoMKgwqDCoCA+Pj4gK8KgwqDCoMKgwqDC
oCBhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsNCj4+IMKgwqDCoMKgID4+PiArwqDCoMKgwqDC
oMKgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDApOw0KPj4gwqDCoMKgwqAgPj4+ICvCoMKgwqDC
oMKgwqAgYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMCk7DQo+PiDCoMKgwqDCoCA+Pj4gK8KgwqDC
oMKgwqDCoCBhbWRncHVfcmluZ193cml0ZShyaW5nLCANCj4+IFBBQ0tFVDNfRE1BX0RBVEFfQ01E
X1JBV19XQUlUIHwgMHgxMDAwMCk7DQo+PiDCoMKgwqDCoCA+PiBJbnN0ZWFkIG9mIGhhcmRjb2Rp
bmcgdGhlIHNpemUsIGNhbiB5b3UgdXNlIHRoZSBnZHMgc2l6ZSBmcm9tIA0KPj4gdGhlDQo+PiDC
oMKgwqDCoCA+PiBkcml2ZXIgKGFkZXYtPmdkcy5nZHNfc2l6ZSkuDQo+PiDCoMKgwqDCoCA+IEhp
IEFsZXgsDQo+PiDCoMKgwqDCoCA+DQo+PiDCoMKgwqDCoCA+IERvIHlvdSBtZWFuIGFkZXYtPmdk
cy5tZW0udG90YWxfc2l6ZT8NCj4+IMKgwqDCoMKgID4NCj4+IMKgwqDCoMKgID4gQnV0IEkgc2Vl
IGJlbG93IG9wZXJhdGlvbiBpbiBnZnhfdjlfMF9uZ2dfaW5pdC4NCj4+IMKgwqDCoMKgID4NCj4+
IMKgwqDCoMKgID4gYWRldi0+Z2RzLm1lbS50b3RhbF9zaXplIC09IC4uLi4NCj4+IMKgwqDCoMKg
ID4NCj4+IMKgwqDCoMKgID4gT3IgeW91IHdhbnQgbWUgdG8gYWRkIGdkc19zaXplIGluIHN0cnVj
dCBhbWRncHVfZ2RzPw0KPj4gwqDCoMKgwqAgPg0KPj4gwqDCoMKgwqAgPiBKYW1lcw0KPj4gwqDC
oMKgwqAgwqDCoMKgwqAgWWVhaCwgVGhlIGFtZC1zdGFnaW5nLWRybS1uZXh0IGJyYW5jaCBoYXMg
YWRldi0+Z2RzLmdkc19zaXplLg0KPj4gwqDCoMKgwqAgwqDCoMKgwqAgSmFtZXMNCj4+IMKgwqDC
oMKgIMKgwqDCoMKgID4NCj4+IMKgwqDCoMKgID4+IFdpdGggdGhhdCBmaXhlZDoNCj4+IMKgwqDC
oMKgID4+IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+DQo+PiDCoMKgwqDCoCA+Pg0KPj4gwqDCoMKgwqAgPj4+ICsNCj4+IMKgwqDCoMKgID4+PiAr
wqDCoMKgwqDCoMKgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDMoUEFDS0VUM19XUklU
RV9EQVRBLCANCj4+IDMpKTsNCj4+IMKgwqDCoMKgID4+PiArwqDCoMKgwqDCoMKgIGFtZGdwdV9y
aW5nX3dyaXRlKHJpbmcsIFdSSVRFX0RBVEFfRU5HSU5FX1NFTCgwKSB8DQo+PiDCoMKgwqDCoCA+
Pj4gKyBXUklURV9EQVRBX0RTVF9TRUwoMCkpOw0KPj4gwqDCoMKgwqAgPj4+ICvCoMKgwqDCoMKg
wqAgYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgU09DMTVfUkVHX09GRlNFVChHQywgMCwgDQo+PiBt
bUdEU19WTUlEMF9TSVpFKSk7DQo+PiDCoMKgwqDCoCA+Pj4gK8KgwqDCoMKgwqDCoCBhbWRncHVf
cmluZ193cml0ZShyaW5nLCAwKTsNCj4+IMKgwqDCoMKgID4+PiArwqDCoMKgwqDCoMKgIGFtZGdw
dV9yaW5nX3dyaXRlKHJpbmcsIDB4MCk7DQo+PiDCoMKgwqDCoCA+Pj4gKw0KPj4gwqDCoMKgwqAg
Pj4+ICvCoMKgwqDCoMKgwqAgYW1kZ3B1X3JpbmdfY29tbWl0KHJpbmcpOw0KPj4gwqDCoMKgwqAg
Pj4+ICsNCj4+IMKgwqDCoMKgID4+PiArwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4gwqDCoMKg
wqAgPj4+ICt9DQo+PiDCoMKgwqDCoCA+Pj4gKw0KPj4gwqDCoMKgwqAgPj4+ICsNCj4+IMKgwqDC
oMKgID4+PsKgwqDCoCBzdGF0aWMgaW50IGdmeF92OV8wX2RvX2VkY19ncHJfd29ya2Fyb3VuZHMo
c3RydWN0IA0KPj4gYW1kZ3B1X2RldmljZSAqYWRldikNCj4+IMKgwqDCoMKgID4+PsKgwqDCoCB7
DQo+PiDCoMKgwqDCoCA+Pj7CoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X3Jpbmcg
KnJpbmcgPSANCj4+ICZhZGV2LT5nZnguY29tcHV0ZV9yaW5nWzBdOw0KPj4gwqDCoMKgwqAgPj4+
IEBAIC0zODEwLDYgKzM4NTQsMTAgQEAgc3RhdGljIGludCANCj4+IGdmeF92OV8wX2VjY19sYXRl
X2luaXQodm9pZCAqaGFuZGxlKQ0KPj4gwqDCoMKgwqAgPj4+wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4gwqDCoMKgwqAgPj4+wqDCoMKgwqDCoMKgwqDC
oMKgwqAgfQ0KPj4gwqDCoMKgwqAgPj4+DQo+PiDCoMKgwqDCoCA+Pj4gK8KgwqDCoMKgwqDCoCBy
ID0gZ2Z4X3Y5XzBfZG9fZWRjX2dkc193b3JrYXJvdW5kcyhhZGV2KTsNCj4+IMKgwqDCoMKgID4+
PiArwqDCoMKgwqDCoMKgIGlmIChyKQ0KPj4gwqDCoMKgwqAgPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiByOw0KPj4gwqDCoMKgwqAgPj4+ICsNCj4+IMKgwqDCoMKgID4+
PsKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIHJlcXVpcmVzIElCcyBzbyBkbyBpbiBsYXRlIGluaXQg
YWZ0ZXIgSUIgcG9vbCANCj4+IGlzIGluaXRpYWxpemVkICovDQo+PiDCoMKgwqDCoCA+Pj7CoMKg
wqDCoMKgwqDCoMKgwqDCoCByID0gZ2Z4X3Y5XzBfZG9fZWRjX2dwcl93b3JrYXJvdW5kcyhhZGV2
KTsNCj4+IMKgwqDCoMKgID4+PsKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyKQ0KPj4gwqDCoMKg
wqAgPj4+IC0tDQo+PiDCoMKgwqDCoCA+Pj4gMi43LjQNCj4+IMKgwqDCoMKgID4+Pg0KPj4gwqDC
oMKgwqAgPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQo+PiDCoMKgwqDCoCA+Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4+IMKgwqDCoMKgID4+PiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gwqDCoMKgwqAgPj4+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KPj4NCj4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+PiBhbWQtZ2Z4IG1h
aWxpbmcgbGlzdA0KPj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KPg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
