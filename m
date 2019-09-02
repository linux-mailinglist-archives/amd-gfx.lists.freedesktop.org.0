Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DDDA4FD1
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Sep 2019 09:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B068926C;
	Mon,  2 Sep 2019 07:24:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150045.outbound.protection.outlook.com [40.107.15.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C1E89BD2
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Sep 2019 06:19:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bj5h1tiWkSi18KzV8gWEp0Mpqfm6SlyfuGJMOqv0hOYjEPMt9QdEHlLtOUXQFhKrbEg4UpENjWiS5KDZgph2gRzWVnwI5WYwH+IeMzFqo8ocOvgZzOtE4apBrED5JIfV6xWdg0JMjb+lRMZSXZJR0GPlnyzK/HQIMbJTItEXJhruL8f7Lg0kTt75vz+fBFFey62ODL5PSWLN8N1zWp3+Xcmf5Tge3YvAsCVytLMDZpsgmN9fHafcjCUYOYEpoAJAX7MlxcD9NlC+ggcN442XSitIIJHgSse3VlEXqsIGbXHRb0NBYbW9C2lOlNdISHzPMWxPSRsFhm5B+/6IjimITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91oiwu2b/8LHxJt1OsslKr/Ngh2ALflJJ+rWxVxSvdk=;
 b=Y9CU2Oakz85YH3xyIFeU8X96oTaTq5U7U3gDmnaCe7QIb3c3yIAPSUVisJsRtHKdOdFiubtSWywhvmTPR81L3Jy71l/mHgyduZNJiGMJTllt1l/pJFPTp7DZYnRQOUlg3qxGx6ZEufuZPM22LXLgRIdpoZS7vd4DfAQl6TgxhNTqc14UmjrjxIqD8VG7bqv57+Qkz5/AIpLWplh3mTof8g5Z2KZScWVe0qoCmYu6qQJ9dqAGOLwimyPQAe92Sgb7KLAtNldSHFPCqMEHdf5SmF6+64wKMKxzyo0f/99hwrJY+BvPzUn2TaD+xx+OaCr2CR7ZNj6yw2FyUj8WT7XA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6336.eurprd05.prod.outlook.com (20.179.25.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Mon, 2 Sep 2019 06:19:00 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::79a3:d971:d1f3:ab6f]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::79a3:d971:d1f3:ab6f%7]) with mapi id 15.20.2220.020; Mon, 2 Sep 2019
 06:19:00 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Petr Cvek <petrcvekcz@gmail.com>
Subject: Re: [BUG, regression] Dereferencing of NULL pointer in
 radeon_mn_unregister()
Thread-Topic: [BUG, regression] Dereferencing of NULL pointer in
 radeon_mn_unregister()
Thread-Index: AQHVYKj5mlPClEJW+0KT4THjk5vfeqcW2u2AgAAdLwCAAPMtAA==
Date: Mon, 2 Sep 2019 06:19:00 +0000
Message-ID: <20190902061858.GI24116@mellanox.com>
References: <dad0e51a-0f06-e2b0-cef7-3587207c2045@gmail.com>
 <20190901140409.GA1251@mellanox.com>
 <2fc7ef14-e89a-1f2d-381d-1c9b05da02d3@gmail.com>
In-Reply-To: <2fc7ef14-e89a-1f2d-381d-1c9b05da02d3@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0061.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::25) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa291b75-8401-4bff-ef15-08d72f6d71ef
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6336; 
x-ms-traffictypediagnostic: VI1PR05MB6336:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR05MB63369FFEE8DBE355C0F5C186CFBE0@VI1PR05MB6336.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:381;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(199004)(189003)(6512007)(6246003)(66556008)(386003)(25786009)(6486002)(1411001)(64756008)(102836004)(52116002)(53936002)(66946007)(53546011)(6436002)(229853002)(66476007)(6306002)(8936002)(71190400001)(81156014)(81166006)(8676002)(6116002)(36756003)(26005)(4326008)(1076003)(3846002)(54906003)(14444005)(11346002)(86362001)(966005)(478600001)(66066001)(14454004)(256004)(6506007)(71200400001)(486006)(2906002)(6916009)(99286004)(66446008)(76176011)(186003)(33656002)(476003)(7736002)(316002)(5660300002)(2616005)(305945005)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6336;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: I7Z17+rjbPXTqadTgoSuigjk6VyF1VtCkfqxjKYLQikUv6dFrNAA+rQvi5Bik82pHVT34DOywb8FhbHe1ibGeQB9mf3OK1NDEj9i0CkFhv8r9rObz2LbdrixLOWUi0O86Z7mDGA8Voj748Vfn5nMd62lo7IaKCJag+mWHOq43MIDuywLn+4k9SaWRZTtf+J+tJ9tk/FC/dT/ILmtS3c9g961l7ThqbKLFx/NGtYpMl2v/RPWhI3LWR+Vyn+q7LxSVhYk7gzmN+ExnGCyTjZUF+ykUyo1abShpV9A1PuTvggSyjivRhrA1F9c8EFiCkkXE9/HC111pOhsP9g1ICKt8AMDI/65JoEkoGMbV4pSsGDFVBE/Ar8+I3hsA20nrWpwSQN8zTIftsVPnqKO/Uy5fyoPYlARYH1UzPOb7HjaVns=
x-ms-exchange-transport-forked: True
Content-ID: <5058CDA8ED05BB47B1A8F7D738A584D8@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa291b75-8401-4bff-ef15-08d72f6d71ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 06:19:00.6824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9wpvvisQ1mAZeH+0SaP1B9//X25OvKZM/61KVtKKd7QGMtS+JrZg6CWAGsqKQ0Q3EZZW0GKhO1ME13JgmLh+wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6336
X-Mailman-Approved-At: Mon, 02 Sep 2019 07:24:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91oiwu2b/8LHxJt1OsslKr/Ngh2ALflJJ+rWxVxSvdk=;
 b=btqiUAG0PYxxdZgjTdK58tq/0JQMaoz8eeWkJ7r9Wm3qW3y/MKhH2wDfBLdsdfGYFH7V2R/luVbwph2Et0EWs7yq2vX6cF+OBMHt7xqrj0BAgpPmDZ3dCXvhhysiTFapMMKX78VCDd7zhkLM+QcR3nuIPvKnDct7YCD+Vhfc4Mg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
 "David1.Zhou@amd.com" <David1.Zhou@amd.com>, "Koenig,
 Christian" <christian.koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMDEsIDIwMTkgYXQgMDU6NDg6MzZQTSArMDIwMCwgUGV0ciBDdmVrIHdyb3Rl
Ogo+ID4gSXMganVzdCBhZGRpbmcgYQo+ID4gCj4gPiAgIGlmICghcm1uKQo+ID4gICAgICAgIHJl
dHJ1bgo+ID4gCj4gPiBUbyB0aGUgdG9wIG9mIHJhZGVvbl9tbl91bnJlZ2lzdGVyIGVub3VnaCB0
byBmaXggaXQ/Cj4gCj4gWWVhaCBpdCBzZWVtcyB0byB3b3JrLiBBIGZ1cnRoZXIgdGVzdCB3aXRo
IG1pbmV0ZXN0IHdvcmtzIHRvby4KCk9rYXksIEkgYWRkZWQgdGhpcyBwYXRjaCB0byB0aGUgaG1t
IHRyZWUsIHRoYW5rcy4KCkZyb20gODI5Mzk0ZDc3ZTMwMjZlMDhlNzg3OWZiMzdmMTRjOTBkZTdi
MGZkOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dA
bWVsbGFub3guY29tPgpEYXRlOiBNb24sIDIgU2VwIDIwMTkgMDM6MDE6MDMgLTAzMDAKU3ViamVj
dDogW1BBVENIXSBkcm0vcmFkZW9uOiBndWFyZCBhZ2FpbnN0IGNhbGxpbmcgYW4gdW5wYWlyZWQK
IHJhZGVvbl9tbl91bnJlZ2lzdGVyKCkKClRoaXMgY2hlY2sgd2FzIGFjY2lkZW50bHkgZGVsZXRl
ZCBpbiB0aGUgYmVsb3cgY29tbWl0LiBUaGVyZSBhcmUgY2FzZXMKd2hlcmUgdGhlIGRyaXZlciB3
aWxsIGNhbGwgdW5yZWdpc3RlciBldmVuIHRob3VnaCBpdCBoYXNuJ3QgcmVnaXN0ZXJlZAphbnl0
aGluZy4KCiBDUFUgMCBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2
aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMWMsIGVwYyA9PSA4MDhkZTZkNCwgcmEgPT0gODA0ZDMyZWMK
IENhbGwgVHJhY2U6CiBbPDgwOGRlNmQ0Pl0gbXV0ZXhfbG9jaysweDgvMHg0NAogWzw4MDRkMzJl
Yz5dIHJhZGVvbl9tbl91bnJlZ2lzdGVyKzB4M2MvMHhiMAogWzw4MDQxNTgzYz5dIHJhZGVvbl9n
ZW1fb2JqZWN0X2ZyZWUrMHgxOC8weDJjCiBbPDgwM2E0NTFjPl0gZHJtX2dlbV9vYmplY3RfcmVs
ZWFzZV9oYW5kbGUrMHg3NC8weGFjCiBbPDgwM2E0NWQwPl0gZHJtX2dlbV9oYW5kbGVfZGVsZXRl
KzB4N2MvMHgxMjgKIFs8ODAzYTViZjQ+XSBkcm1faW9jdGxfa2VybmVsKzB4YjAvMHgxMDgKIFs8
ODAzYTVlNzQ+XSBkcm1faW9jdGwrMHgyMDAvMHgzYTgKIFs8ODAzZTA3YjQ+XSByYWRlb25fZHJt
X2lvY3RsKzB4NTQvMHhjMAogWzw4MDEyMTRkYz5dIGRvX3Zmc19pb2N0bCsweDRlOC8weDgxYwog
Wzw4MDEyMTg2ND5dIGtzeXNfaW9jdGwrMHg1NC8weGIwCiBbPDgwMDExMDBjPl0gc3lzY2FsbF9j
b21tb24rMHgzNC8weDU4CgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzJmYzdlZjE0
LWU4OWEtMWYyZC0zODFkLTFjOWIwNWRhMDJkM0BnbWFpbC5jb20KRml4ZXM6IDUzNGU1Zjg0Yjdh
OSAoImRybS9yYWRlb246IHVzZSBtbXVfbm90aWZpZXJfZ2V0L3B1dCBmb3Igc3RydWN0IHJhZGVv
bl9tbiIpClJlcG9ydGVkLWJ5OiBQZXRyIEN2ZWsgPHBldHJjdmVrY3pAZ21haWwuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbW4uYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
bW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX21uLmMKaW5kZXggZmM4MjU0Mjcz
YTgwMGIuLjFlZTIwZDUyOGE3YzI0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9tbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX21uLmMKQEAg
LTIzNCw2ICsyMzQsOSBAQCB2b2lkIHJhZGVvbl9tbl91bnJlZ2lzdGVyKHN0cnVjdCByYWRlb25f
Ym8gKmJvKQogCXN0cnVjdCByYWRlb25fbW4gKnJtbiA9IGJvLT5tbjsKIAlzdHJ1Y3QgbGlzdF9o
ZWFkICpoZWFkOwogCisJaWYgKCFybW4pCisJCXJldHVybjsKKwogCW11dGV4X2xvY2soJnJtbi0+
bG9jayk7CiAJLyogc2F2ZSB0aGUgbmV4dCBsaXN0IGVudHJ5IGZvciBsYXRlciAqLwogCWhlYWQg
PSBiby0+bW5fbGlzdC5uZXh0OwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
