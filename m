Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0C39994E
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 18:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC8E6E526;
	Thu, 22 Aug 2019 16:35:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820042.outbound.protection.outlook.com [40.107.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E705A6E526
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 16:35:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7NqVBGgmi1OgU8OqTJxb/ZPJBlPsSK1BZ1yBuPJB+78PLVlhiY4ZRyigwpsx0i2HY5X+94FLjTqge7kDhjAJ6yS+r6Ul5bLT4H7pG8IdFCYktV0m/70LLALkw35QYQeG0gl5UZ96XrwW6A6AxueY1sSn7vvUHhAykrys8eKL0mxe5IhaQhvz/RGgd7AoXq5hPtci8ok6yT4pT1+dxWU1mAWLpnaQ9VbNpNLTqjHmLhacc9rfbKEdoSJhiuGBSm8ZLvio6GWyNn6OTF17UZMseMBvkcmBSNi/FnyF09dFpOjMGBsfJtiDEEbAs9ItyPo7IiR0nLBa2VjqrjoZWt0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/C5PG4K3p7Aa42olT7L7bihcvnn1S5XzuAhebC2NTA=;
 b=hZaCbt/DUJw4GLJurjFIFnDkDFmFQ74sM7by4jo3QdIh8JNHR9Ed0e1fWzzGOZGFDCKgq+h0u5cSHBG4BrRW7m6nU45H941LOY/flIV3Jogv5y6Qc3Iw+azty9JB5OVUuKjbcCE1VKDTNTHRhmFP3d7hbgf/RObaT0XKxTYmiWSRHj77DuCwa822UrtdUDBG+z0RO9n9VglkNXIyrAwqftRFLZmkZ9dj7zpmCm0g7asPIVM3M0zE8RVC1ynSWl6M21J2armmUSx8WP+5xEzmqGbvZ4KN2S3AFu1+qeRLjTI6Jnt0KoxIMG5ILwBb5EvHcdR68BZ1yAfQOYxFkpsqVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3622.namprd12.prod.outlook.com (20.178.54.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.19; Thu, 22 Aug 2019 16:35:38 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82%5]) with mapi id 15.20.2178.018; Thu, 22 Aug 2019
 16:35:38 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 3/3] drm/amd/display: update bw_calcs to take pipe sync
 into account (v2)
Thread-Topic: [PATCH 3/3] drm/amd/display: update bw_calcs to take pipe sync
 into account (v2)
Thread-Index: AQHVWP9y3tMU8IgIm0OVQzclyRV6pqcHWoKAgAABuACAAAEGAA==
Date: Thu, 22 Aug 2019 16:35:37 +0000
Message-ID: <192d802d-352a-60dd-488e-81bd2c5b7fee@amd.com>
References: <20190822153645.3296-1-alexander.deucher@amd.com>
 <20190822153645.3296-4-alexander.deucher@amd.com>
 <6c011b85-27c8-4ff5-12b5-4d034878c916@amd.com>
 <CADnq5_MmDXmchA=WoQpKzkFp0+WpVDSOoBMqqo8pppB9ky_AvA@mail.gmail.com>
In-Reply-To: <CADnq5_MmDXmchA=WoQpKzkFp0+WpVDSOoBMqqo8pppB9ky_AvA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::15) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f723fb5-a9bd-4e12-b997-08d7271ec36f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR12MB3622; 
x-ms-traffictypediagnostic: BYAPR12MB3622:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3622CA50CF6313E80BE06CE9ECA50@BYAPR12MB3622.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(199004)(189003)(446003)(6246003)(53546011)(64756008)(316002)(102836004)(386003)(54906003)(476003)(52116002)(71200400001)(6436002)(6486002)(99286004)(25786009)(71190400001)(86362001)(256004)(76176011)(66946007)(229853002)(305945005)(7736002)(8676002)(6916009)(478600001)(66556008)(486006)(1411001)(81166006)(4326008)(81156014)(2906002)(66066001)(31696002)(14454004)(66446008)(3846002)(26005)(36756003)(31686004)(6116002)(8936002)(5660300002)(53936002)(66476007)(2616005)(186003)(6512007)(6506007)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3622;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RsyE3aK5OZMdlXjaFKJUSVKZx+aVd+0DxI3/E7sm2LS/0e2FAnq8xReEWHyRKLL4DRvEykXL/jOFpI9kPdTMm/ZGUyhjVaows1c2My/Nql8kBDVg5668VnUvFfyqFVEAs372jGfhJnVfImyjvHRHl5c2AlToXEv55XUlY4835EeY5PyWdxmFNmniWSqVGRLP/GdaukOo0tX8DE+OPBa1dkng1oRWSLPtmTpKLGZ1iI97II0NLvLqVIky5Qmx1jhlUXB2opJFLQ3jdnUzJ8d4Y+ykyeS9fPMX1zY5pPTyIo6NW47Jf6g+JKlwF+mehDTZ2WRUJSFy1btjKTenGY4i8QS15mc11E+Wo4NNV2Jjx9s/T0LEHTH8AsSo4/fjE1WVUnY8mU8Ww0JV1I8ME1fdjyIBfj3lwdep/PhlyHR9+bY=
Content-ID: <166A04634A35804D8095DB9E01D66E9E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f723fb5-a9bd-4e12-b997-08d7271ec36f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 16:35:37.9324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8irIIjAK8100sU5FrKrxJ27gXDNXykKcgcJuaCEK2Z+UdKe762T8u+anlRdBUgmOEQAxPSUCCQ6mtHI/ArpBxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3622
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/C5PG4K3p7Aa42olT7L7bihcvnn1S5XzuAhebC2NTA=;
 b=pVshOJei8Vd8fk5bweJP3MkdOto9m6ZkD8jqlT0chBIzMNrJ/35MQ5WxcAsIZoR7Soi8kJN9AGU520KXXOxueMnV28gQRRmIYubjdK+Cj/gBIxDddNKcG7bA3CNapycwjBjvNr/lQSxXcWs9damOye6CLBrnYNVyxp6WENy3Ugk=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gOC8yMi8xOSAxMjozMSBQTSwgQWxleCBEZXVjaGVyIHdyb3RlOg0KPiBPbiBUaHUsIEF1ZyAy
MiwgMjAxOSBhdCAxMjoyNSBQTSBLYXpsYXVza2FzLCBOaWNob2xhcw0KPiA8TmljaG9sYXMuS2F6
bGF1c2thc0BhbWQuY29tPiB3cm90ZToNCj4+DQo+PiBPbiA4LzIyLzE5IDExOjM2IEFNLCBBbGV4
IERldWNoZXIgd3JvdGU6DQo+Pj4gUHJvcGVybHkgc2V0IGFsbF9kaXNwbGF5c19pbl9zeW5jIHNv
IHRoYXQgd2hlbiB0aGUgZGF0YSBpcw0KPj4+IHByb3BhZ2F0ZWQgdG8gcG93ZXJwbGF5LCBpdCdz
IHNldCBwcm9wZXJseSBhbmQgd2UgY2FuIGVuYWJsZQ0KPj4+IG1jbGsgc3dpdGNoaW5nIHdoZW4g
YWxsIG1vbml0b3JzIGFyZSBpbiBzeW5jLg0KPj4+DQo+Pj4gdjI6IGZpeCBsb2dpYywgY2xlYW4g
dXANCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4NCj4+PiAtLS0NCj4+PiAgICAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
YWxjcy9kY2VfY2FsY3MuYyAgfCA0OSArKysrKysrKysrKysrKysrKystDQo+Pj4gICAgMSBmaWxl
IGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jDQo+Pj4g
aW5kZXggOWYxMmUyMWY4YjliLi44ZDkwNDY0N2ZiMGYgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jDQo+Pj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jDQo+Pj4gQEAgLTI1
LDYgKzI1LDcgQEANCj4+Pg0KPj4+ICAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+Pj4NCj4+
PiArI2luY2x1ZGUgInJlc291cmNlLmgiDQo+Pj4gICAgI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgi
DQo+Pj4gICAgI2luY2x1ZGUgImRjZV9jYWxjcy5oIg0KPj4+ICAgICNpbmNsdWRlICJkYy5oIg0K
Pj4+IEBAIC0yOTc3LDYgKzI5NzgsNTAgQEAgc3RhdGljIHZvaWQgcG9wdWxhdGVfaW5pdGlhbF9k
YXRhKA0KPj4+ICAgICAgICBkYXRhLT5udW1iZXJfb2ZfZGlzcGxheXMgPSBudW1fZGlzcGxheXM7
DQo+Pj4gICAgfQ0KPj4+DQo+Pj4gK3N0YXRpYyBib29sIGFsbF9kaXNwbGF5c19pbl9zeW5jKGNv
bnN0IHN0cnVjdCBwaXBlX2N0eCBwaXBlW10sDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGludCBwaXBlX2NvdW50LA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1aW50MzJfdCBudW1iZXJfb2ZfZGlzcGxheXMpDQo+Pj4gK3sNCj4+PiArICAgICBjb25zdCBz
dHJ1Y3QgcGlwZV9jdHggKnVuc3luY2VkX3BpcGVzW01BWF9QSVBFU10gPSB7IE5VTEwgfTsNCj4+
PiArICAgICBpbnQgZ3JvdXBfc2l6ZSA9IDE7DQo+Pj4gKyAgICAgaW50IGksIGo7DQo+Pj4gKw0K
Pj4+ICsgICAgIGZvciAoaSA9IDA7IGkgPCBwaXBlX2NvdW50OyBpKyspIHsNCj4+PiArICAgICAg
ICAgICAgIGlmICghcGlwZVtpXS5zdHJlYW0pDQo+Pg0KPj4gVGhpcyBiaXQgZGlmZmVycyBmcm9t
IHByb2dyYW1fdGltaW5nX3N5bmMsIGJ1dCBzaW5jZSB0aGlzIGlzIGZvciBkY2UgYW5kDQo+PiB3
ZSBkb24ndCBkbyBwaXBlIHNwbGl0IG9yIE1QTyBJIHRoaW5rIGl0J3MgcHJvYmFibHkgZmluZSB0
aGF0IHlvdSdyZSBub3QNCj4+IGNoZWNraW5nIHRvcF9waXBlIGhlcmUuDQo+Pg0KPj4gV291bGRu
J3QgaHVydCB0byBoYXZlIHRoYXQgbG9naWMgaGVyZSB0aG91Z2guDQo+Pg0KPiANCj4gSSBoYWQg
Y2hlY2tlZCBmb3IgdG9wX3BpcGUgaGVyZSBvcmlnaW5hbGx5LCBidXQgaXQgd2FzIGFsd2F5cyBO
VUxMIHNvDQo+IHVuc3luY2VkX3BpcGVzIG5ldmVyIGdvdCBwb3B1bGF0ZWQuICBNYXliZSB0aGF0
IGlzIG5vdCBwb3B1bGF0ZWQNCj4gcHJvcGVybHkgYXQgdGhpcyBwb2ludD8NCg0KVGhlIHByZXNl
bmNlIG9mIGEgdG9wX3BpcGUgb24gYSBwaXBlIGluZGljYXRlcyB0aGF0IHRoZSBwaXBlIGlzIHBh
cnQgb2YgDQphIGJsZW5kaW5nIGNoYWluLiBBIE5VTEwgdG9wX3BpcGUgdmFsdWUgaW5kaWNhdGVz
IHRoYXQgdGhlIGN1cnJlbnQgcGlwZSANCmlzIHRoZSB0b3Agb2YgdGhlIGNoYWluLg0KDQpJdCBz
aG91bGQgYmUgTlVMTCBmb3IgYWxsIHBpcGVzIG9uIERDRSBBU0lDcy4NCg0KTmljaG9sYXMgS2F6
bGF1c2thcw0KDQo+IA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4+PiAr
DQo+Pj4gKyAgICAgICAgICAgICB1bnN5bmNlZF9waXBlc1tpXSA9ICZwaXBlW2ldOw0KPj4+ICsg
ICAgIH0NCj4+PiArDQo+Pj4gKyAgICAgZm9yIChpID0gMDsgaSA8IHBpcGVfY291bnQ7IGkrKykg
ew0KPj4+ICsgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHBpcGVfY3R4ICpwaXBlX3NldFtNQVhf
UElQRVNdOw0KPj4+ICsNCj4+PiArICAgICAgICAgICAgIGlmICghdW5zeW5jZWRfcGlwZXNbaV0p
DQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4+ICsNCj4+PiArICAgICAg
ICAgICAgIHBpcGVfc2V0WzBdID0gdW5zeW5jZWRfcGlwZXNbaV07DQo+Pj4gKyAgICAgICAgICAg
ICB1bnN5bmNlZF9waXBlc1tpXSA9IE5VTEw7DQo+Pj4gKw0KPj4+ICsgICAgICAgICAgICAgLyog
QWRkIHRnIHRvIHRoZSBzZXQsIHNlYXJjaCByZXN0IG9mIHRoZSB0ZydzIGZvciBvbmVzIHdpdGgN
Cj4+PiArICAgICAgICAgICAgICAqIHNhbWUgdGltaW5nLCBhZGQgYWxsIHRncyB3aXRoIHNhbWUg
dGltaW5nIHRvIHRoZSBncm91cA0KPj4+ICsgICAgICAgICAgICAgICovDQo+Pj4gKyAgICAgICAg
ICAgICBmb3IgKGogPSBpICsgMTsgaiA8IHBpcGVfY291bnQ7IGorKykgew0KPj4+ICsgICAgICAg
ICAgICAgICAgICAgICBpZiAoIXVuc3luY2VkX3BpcGVzW2pdKQ0KPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4+ICsNCj4+PiArICAgICAgICAgICAgICAgICAg
ICAgaWYgKHJlc291cmNlX2FyZV9zdHJlYW1zX3RpbWluZ19zeW5jaHJvbml6YWJsZSgNCj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc3luY2VkX3BpcGVzW2pdLT5z
dHJlYW0sDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaXBlX3Nl
dFswXS0+c3RyZWFtKSkgew0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBpcGVf
c2V0W2dyb3VwX3NpemVdID0gdW5zeW5jZWRfcGlwZXNbal07DQo+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zeW5jZWRfcGlwZXNbal0gPSBOVUxMOw0KPj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGdyb3VwX3NpemUrKzsNCj4+PiArICAgICAgICAgICAgICAgICAg
ICAgfQ0KPj4+ICsgICAgICAgICAgICAgfQ0KPj4+ICsgICAgIH0NCj4+PiArDQo+Pj4gKyAgICAg
cmV0dXJuIChncm91cF9zaXplID09IG51bWJlcl9vZl9kaXNwbGF5cykgPyB0cnVlIDogZmFsc2U7
DQo+Pg0KPj4gSSB0aGluayB0aGlzIGxvZ2ljIGlzIGZ1bmN0aW9uYWwgYnV0IGl0IGxvb2tzIGlu
Y29ycmVjdCBhdCBmaXJzdCBnbGFuY2UNCj4+IGJlY2F1c2UgZ3JvdXBfc2l6ZSBkb2Vzbid0IGdl
dCByZXNldC4gV2hhdCBlbmRzIHVwIGhhcHBlbmluZyBpcyB0aGUNCj4+IGZpcnN0IHBpcGUgb2Yg
ZWFjaCBncm91cCBkb2Vzbid0IGdldCBhZGRlZCB0byBncm91cF9zaXplLg0KPj4NCj4+IEkgZmVl
bCB0aGF0IHRoaXMgd291bGQgYmUgbW9yZSBjbGVhciBhczoNCj4+DQo+PiBzdGF0aWMgYm9vbCBh
bGxfZGlzcGxheXNfaW5fc3luYyhjb25zdCBzdHJ1Y3QgcGlwZV9jdHggcGlwZVtdLCBpbnQNCj4+
IHBpcGVfY291bnQpDQo+PiB7DQo+PiAgICAgICAgICBjb25zdCBzdHJ1Y3QgcGlwZV9jdHggKmFj
dGl2ZV9waXBlc1tNQVhfUElQRVNdOw0KPj4gICAgICAgICAgaW50IGksIG51bV9hY3RpdmVfcGlw
ZXMgPSAwOw0KPj4NCj4+ICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBwaXBlX2NvdW50OyBpKysp
IHsNCj4+ICAgICAgICAgICAgICAgICAgaWYgKCFwaXBlW2ldLnN0cmVhbSB8fCBwaXBlW2ldLnRv
cF9waXBlKQ0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4NCj4+ICAg
ICAgICAgICAgICAgICAgYWN0aXZlX3BpcGVzW251bV9hY3RpdmVfcGlwZXMrK10gPSAmcGlwZVtp
XTsNCj4+ICAgICAgICAgIH0NCj4+DQo+PiAgICAgICAgICBpZiAoIW51bV9hY3RpdmVfcGlwZXMp
DQo+PiAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4+DQo+PiAgICAgICAgICBmb3Ig
KGkgPSAxOyBpIDwgbnVtX2FjdGl2ZV9waXBlczsgKytpKQ0KPj4gICAgICAgICAgICAgICAgICBp
ZiAoIXJlc291cmNlX2FyZV9zdHJlYW1zX3RpbWluZ19zeW5jaHJvbml6YWJsZSgNCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYWN0aXZlX3BpcGVzWzBdLT5zdHJlYW0sIGFjdGl2ZV9w
aXBlc1tpXS0+c3RyZWFtKSkNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZmFs
c2U7DQo+Pg0KPj4gICAgICAgICAgcmV0dXJuIHRydWU7DQo+PiB9DQo+IA0KPiBZZXMsIHRoYXQn
cyBtdWNoIGNsZWFuZXIuICBUaGFua3MhDQo+IA0KPiBBbGV4DQo+IA0KPj4NCj4+IEJ1dCBJIGhh
dmVuJ3QgdGVzdGVkIHRoaXMuDQo+Pg0KPj4gTmljaG9sYXMgS2F6bGF1c2thcw0KPj4NCj4+DQo+
Pj4gK30NCj4+PiArDQo+Pj4gICAgLyoqDQo+Pj4gICAgICogUmV0dXJuOg0KPj4+ICAgICAqICB0
cnVlIC0gIERpc3BsYXkocykgY29uZmlndXJhdGlvbiBzdXBwb3J0ZWQuDQo+Pj4gQEAgLTI5OTgs
OCArMzA0Myw4IEBAIGJvb2wgYndfY2FsY3Moc3RydWN0IGRjX2NvbnRleHQgKmN0eCwNCj4+Pg0K
Pj4+ICAgICAgICBwb3B1bGF0ZV9pbml0aWFsX2RhdGEocGlwZSwgcGlwZV9jb3VudCwgZGF0YSk7
DQo+Pj4NCj4+PiAtICAgICAvKlRPRE86IHRoaXMgc2hvdWxkIGJlIHRha2VuIG91dCBjYWxjcyBv
dXRwdXQgYW5kIGFzc2lnbmVkIGR1cmluZyB0aW1pbmcgc3luYyBmb3IgcHBsaWIgdXNlKi8NCj4+
PiAtICAgICBjYWxjc19vdXRwdXQtPmFsbF9kaXNwbGF5c19pbl9zeW5jID0gZmFsc2U7DQo+Pj4g
KyAgICAgY2FsY3Nfb3V0cHV0LT5hbGxfZGlzcGxheXNfaW5fc3luYyA9IGFsbF9kaXNwbGF5c19p
bl9zeW5jKHBpcGUsIHBpcGVfY291bnQsDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRhdGEtPm51bWJlcl9vZl9kaXNw
bGF5cyk7DQo+Pj4NCj4+PiAgICAgICAgaWYgKGRhdGEtPm51bWJlcl9vZl9kaXNwbGF5cyAhPSAw
KSB7DQo+Pj4gICAgICAgICAgICAgICAgdWludDhfdCB5Y2xrX2x2bCwgc2Nsa19sdmw7DQo+Pj4N
Cj4+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
