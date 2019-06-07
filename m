Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D369538A33
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 14:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA9789D79;
	Fri,  7 Jun 2019 12:26:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740044.outbound.protection.outlook.com [40.107.74.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF0B89D79
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 12:26:15 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB2789.namprd12.prod.outlook.com (20.177.126.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Fri, 7 Jun 2019 12:26:10 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e%6]) with mapi id 15.20.1943.023; Fri, 7 Jun 2019
 12:26:10 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>
Subject: Re: [PATCH 10/24] drm/amd/display: Rework CRTC color management
Thread-Topic: [PATCH 10/24] drm/amd/display: Rework CRTC color management
Thread-Index: AQHVHKoryWYuyhFROUaW7aLp+KrRDqaP1EaAgABKwoA=
Date: Fri, 7 Jun 2019 12:26:10 +0000
Message-ID: <9c82a91b-971f-9531-0d12-77fcf6dbf46b@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
 <20190606205501.16505-11-Bhawanpreet.Lakha@amd.com>
 <a9b95680-66f6-6f1e-5741-0786c6eb6240@daenzer.net>
In-Reply-To: <a9b95680-66f6-6f1e-5741-0786c6eb6240@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::48) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6579476a-0fab-4591-4d55-08d6eb4352c4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2789; 
x-ms-traffictypediagnostic: BYAPR12MB2789:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB2789B1A0CBAD1671026E9352EC100@BYAPR12MB2789.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(39860400002)(376002)(136003)(346002)(199004)(189003)(3846002)(99286004)(102836004)(31686004)(486006)(6116002)(186003)(68736007)(6436002)(52116002)(229853002)(6506007)(386003)(53546011)(6916009)(6486002)(36756003)(316002)(14454004)(8676002)(81166006)(81156014)(8936002)(72206003)(476003)(478600001)(2616005)(26005)(31696002)(446003)(86362001)(11346002)(966005)(305945005)(76176011)(5660300002)(6246003)(2906002)(53936002)(71190400001)(71200400001)(7736002)(256004)(66066001)(64756008)(66556008)(25786009)(6306002)(4326008)(66446008)(6512007)(66946007)(73956011)(66476007)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2789;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jQmTVOcULNLvfuIV5jd+ufNV8omPzDDaQF0aSYWmbSwth3wBdMyKWR5alQLiJwFA5iDn55HgkDK26+3k2dj0P2G27XOW6iUdCPmtdGwwPwVBKl9SMinwftMnj1Pei4WtSRXFAexfsYA0hegPpAYtDSqW8pxRilHJGQEq6xkfNFOePcDPeRlhPx8JoftIfOwYoBTGVvOIMVeCOSmS+2xze9r2rk1xNIP2PL3oaUcLR3/iq+bhLmzvtq2KRxlHfDIFJ5Ysl2UipEcNAMTCDueEH4Ohp5itEt5Msb5nL3SsFtb7VnS0VNdKD5KG2tIiqEBMkl7Y1YEflZsuTPEgu5UZkbwOl7osif1ICZjIwVJhtyz56A1lGz19c+lIWJRw3ZZxmNstFvO9nBs3OIESXFPUFd/cbrTTinsniOcFsXS193s=
Content-ID: <7CA1AB118B63514DAD9A45CFBD3460C5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6579476a-0fab-4591-4d55-08d6eb4352c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 12:26:10.6854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2789
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKk5ySNOBZUTZUiyz6JwghbXjdI5M4A73/rmIUQHQnI=;
 b=flW7rk/u1hptI+ktsyXRNBF2VeyYMbC2vqMe+dL0UmR8xBUMe8ZDBe5I9z3SN08utpZOKyOxI2SXr5ljy4ieaugcKRWpU7uzhzB93goLSfL72xbo4nz0c1yLlm/pgYzhabORy8FbqzkBrIl+0Fte/nBJ7/kSAr2u7AfQKVYVt0g=
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
Cc: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gNi83LzE5IDM6NTggQU0sIE1pY2hlbCBEw6RuemVyIHdyb3RlOg0KPiBPbiAyMDE5LTA2LTA2
IDEwOjU0IHAubS4sIEJoYXdhbnByZWV0IExha2hhIHdyb3RlOg0KPj4gRnJvbTogTmljaG9sYXMg
S2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPg0KPj4NCj4+IFtXaHldDQo+
PiBUbyBwcmVwYXJlIGZvciB0aGUgdXBjb21pbmcgRFJNIHBsYW5lIGNvbG9yIG1hbmFnZW1lbnQg
cHJvcGVydGllcw0KPj4gd2UgbmVlZCB0byBjb3JyZWN0IGEgbG90IG9mIHdyb25nIGJlaGF2aW9y
IGFuZCBhc3N1bXB0aW9ucyBtYWRlIGZvcg0KPj4gQ1JUQyBjb2xvciBtYW5hZ2VtZW50Lg0KPj4N
Cj4+IFRoZSBkb2N1bWVudGF0aW9uIGFkZGVkIGJ5IHRoaXMgY29tbWl0IGluIGFtZGdwdV9kbV9j
b2xvciBleHBsYWlucw0KPj4gaG93IHRoZSBIVyBjb2xvciBwaXBlbGluZSB3b3JrcyBhbmQgaXRz
IGxpbWl0YXRpb25zIHdpdGggdGhlIERSTQ0KPj4gaW50ZXJmYWNlLg0KPj4NCj4+IFRoZSBjdXJy
ZW50IGltcGxlbWVudGF0aW9uIGRvZXMgdGhlIGZvbGxvd2luZyB3cm9uZzoNCj4+IC0gSW1wbGlj
aXQgc1JHQiBER00gd2hlbiBubyBDUlRDIERHTSBpcyBzZXQNCj4+IC0gSW1wbGljaXQgc1JHQiBS
R00gd2hlbiBubyBDUlRDIFJHTSBpcyBzZXQNCj4+IC0gTm8gd2F5IHRvIHNwZWNpZnkgYSBub24t
bGluZWFyIERHTSBtYXRyaXggdGhhdCBwcm9kdWNlcyBjb3JyZWN0IG91dHB1dA0KPj4gLSBObyB3
YXkgdG8gc3BlY2lmeSBhIGNvcnJlY3QgUkdNIHdoZW4gYSBsaW5lYXIgREdNIGlzIHVzZWQNCj4+
DQo+PiBXZSBoYWQgd29ya2Fyb3VuZHMgZm9yIHBhc3Npbmcga21zX2NvbG9yIHRlc3RzIGJ1dCBu
b3QgYWxsIG9mIHRoZQ0KPj4gYmVoYXZpb3Igd2UgaGFkIHdyb25nIHdhcyBjb3ZlcmVkIGJ5IHRo
ZXNlIHRlc3RzIChlc3BlY2lhbGx5IHdoZW4NCj4+IGl0IGNvbWVzIHRvIG5vbi1saW5lYXIgREdN
KS4gVGVzdGluZyBib3RoIERHTSBhbmQgUkdNIGF0IHRoZSBzYW1lIHRpbWUNCj4+IGlzbid0IHNv
bWV0aGluZyBrbXNfY29sb3IgdGVzdHMgd2VsbCBlaXRoZXIuDQo+Pg0KPj4gW0hvd10NCj4+IFRo
ZSBzcGVjaWZpY3MgZm9yIGhvdyBjb2xvciBtYW5hZ2VtZW50IHdvcmtzIGluIEFNREdQVSBhbmQg
dGhlIG5ldw0KPj4gYmVoYXZpb3IgY2FuIGJlIGZvdW5kIGJ5IHJlYWRpbmcgdGhlIGRvY3VtZW50
YXRpb24gYWRkZWQgdG8NCj4+IGFtZGdwdV9kbV9jb2xvci5jIGZyb20gdGhpcyBwYXRjaC4NCj4+
DQo+PiBBbGwgb2YgdGhlIGluY29ycmVjdCBjYXNlcyBmcm9tIHRoZSBvbGQgaW1wbGVtZW50YXRp
b24gaGF2ZSBiZWVuDQo+PiBhZGRyZXNzZWQgZm9yIHRoZSBhdG9taWMgaW50ZXJmYWNlLCBidXQg
dGhlcmUgc3RpbGwgYSBmZXcgVE9ET3MgZm9yDQo+PiB0aGUgbGVnYWN5IG9uZS4NCj4+DQo+PiBO
b3RlOiB0aGlzIGRvZXMgY2F1c2UgcmVncmVzc2lvbnMgZm9yIGttc19jb2xvckBwaXBlLWEtY3Rt
LSogb3ZlciBIRE1JLg0KPj4NCj4+IFRoZSByZXN1bHQgbG9va3MgY29ycmVjdCBmcm9tIHZpc3Vh
bCBpbnNwZWN0aW9uIGJ1dCB0aGUgQ1JDIG5vIGxvbmdlcg0KPj4gbWF0Y2hlcy4gRm9yIHJlZmVy
ZW5jZSwgdGhlIHRlc3Qgd2FzIHByZXZpb3VzbHkgZG9pbmcgdGhlIGZvbGxvd2luZzoNCj4+DQo+
PiBsaW5lYXIgZGVnYW1tYSAtPiBDVE0gLT4gc1JHQiByZWdhbW1hIC0+IFJHQiB0byBZVVYgKDcw
OSkgLT4gLi4uDQo+Pg0KPj4gTm93IHRoZSB0ZXN0IGlzIGRvaW5nOg0KPj4NCj4+IGxpbmVhciBk
ZWdhbW1hIC0+IENUTSAtPiBsaW5lYXIgcmVnYW1tYSAtPiBSR0IgdG8gWVVWICg3MDkpIC0+IC4u
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmth
emxhdXNrYXNAYW1kLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBTdW4gcGVuZyBMaSA8U3VucGVuZy5M
aUBhbWQuY29tPg0KPj4gQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5M
YWtoYUBhbWQuY29tPg0KPiANCj4gRG9lcyB0aGlzIGFkZHJlc3MgaHR0cHM6Ly9idWdzLmZyZWVk
ZXNrdG9wLm9yZy8xMTA2NzcgPyBJZiBzbywgY2FuIHlvdQ0KPiBhZGQgYSByZWZlcmVuY2UgdG8g
dGhlIGNvbW1pdCBsb2c/DQo+IA0KPiANCg0KSXQgdW5mb3J0dW5hdGVseSBkb2VzIG5vdC4gVGhl
cmUgYXJlIHN0aWxsIHNvbWUgcmVtYWluaW5nIGlzc3VlcyB3aXRoIA0KbGVnYWN5IGdhbW1hIHN1
cHBvcnQgdGhhdCBJIGludGVuZCB0byBhZGRyZXNzIGF0IHNvbWUgcG9pbnQgLSB3aGljaCBJIA0K
bGVmdCBpbiB0aGlzIHBhdGNoIGFzIFRPRE9zLg0KDQpOaWNob2xhcyBLYXpsYXVza2FzDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
