Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DD57513D
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 16:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BA76E2A9;
	Thu, 25 Jul 2019 14:33:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710087.outbound.protection.outlook.com [40.107.71.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194766E2A9
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 14:33:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQL/zZ9MdH0vQIj8h8LiERRGFFoei12F5bnWU+IedtJbuN3wm88xHjOltaythc2Ipvnn8vsiTNMDGl215q7Tlc23eg0S4m0xScR6j1TIDXIj7zhWPvSjquHeTQb58SFkJJM8vb8NQnFcBEYuusDdaZkmlxyvEuADU1y9v9gHJTdG4Umm2lqC7mW5keDify25SWGbWRYrDjR2ro7YrJFccx3D6f4ORLtlzRSnKaDw9iPnfpTuDm5WhhsAHfa1X0noVS99XiYnPOuoasbEn4SVLM+svBEaT3vTZr1gPuJFGpb0GoiDaViRBpp29X5n6KaKjzp0EPm8l21W/RmmX7x6Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miEshLjSn3CYq7RXiAZGze8MzMMF9p78PfumelpOYvg=;
 b=gppJnSjsoWOL9DwZOYhqW1S202U7HB4fpaS9vNWC7ayT7iUQk7ldwDweL35Ih30GwvF3Nqou4v8uNDp60GIiJ0CQwx8I4XWZTVHhaI9fKCV3e+JVaGR6wx52gBGsd9+NKatkCVu9H+jfgcxMbAK0qE/IDvMul0JiGE47E4eGHWNTTcLHpm74//QDzZUlcynOAWLq0H6f0vNitgjSLI5c4pouQQufDd4415gBYIIQQ9gk6dNzle8pFJjkQX7iVO4Czcosk5GA36VJadabLcHzLWGAoSq6oO+eFsfavaDhdwyf0/8jVwcRzJaT3fmoXRFC0ipU6WZZFIgmVK4W4tyUug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB2694.namprd12.prod.outlook.com (20.176.255.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Thu, 25 Jul 2019 14:33:00 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::8581:1f0c:2002:db97]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::8581:1f0c:2002:db97%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 14:33:00 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v5 4/4] drm/amd/display: enable S/G for RAVEN chip
Thread-Topic: [PATCH v5 4/4] drm/amd/display: enable S/G for RAVEN chip
Thread-Index: AQHVQvTP8tLTHXznnkGpl7QcomdXrqbbZcsA
Date: Thu, 25 Jul 2019 14:33:00 +0000
Message-ID: <d22b6d60-5a14-aa5d-47f7-1bcd46595e60@amd.com>
References: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
 <1564064683-31796-5-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1564064683-31796-5-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::41) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 638f4abe-c41f-49fe-bd81-08d7110cfe9a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2694; 
x-ms-traffictypediagnostic: BYAPR12MB2694:
x-microsoft-antispam-prvs: <BYAPR12MB2694F28E794095CA0612B269ECC10@BYAPR12MB2694.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:655;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(189003)(199004)(446003)(11346002)(2501003)(486006)(186003)(53546011)(26005)(8676002)(6506007)(386003)(102836004)(2616005)(71190400001)(71200400001)(25786009)(476003)(52116002)(76176011)(66446008)(8936002)(31696002)(86362001)(81156014)(2906002)(81166006)(68736007)(6246003)(3846002)(6116002)(36756003)(256004)(14444005)(99286004)(66556008)(66476007)(53936002)(66946007)(64756008)(5660300002)(7736002)(14454004)(229853002)(4326008)(66066001)(305945005)(6436002)(54906003)(110136005)(31686004)(6512007)(6486002)(478600001)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2694;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RZ5k5R0j69UktYNIRn+dk87wFslvzuA+3c652MQLXXjXbOmye1FA0fUkgswgv9rKLPFoD9YGXFg55PCNGFcO79ceGQtkwOJ87FxB+vA4M2JK06HzmjeFXyKQ7/4qD8hBmdWwtV08CUBCl+1o+BoeckHAlcV7Uq9SPiWzSvSJAF/T967hXbePvn2TCP7/5BLVQ+7Z98awWO09VgiBeKt6Hblszmp+mXalw7spHYNCTy/SsjiDM5N/eqTxwO6mYv8yRi7nV8qNrDgGlBTsxTaBi9Eehiw1h3xqsOsMhCbMlBANAfZmWwRSPpRcJJ9pWC1GxNmFQ+WL4AE4TSOuJKvBiwGA6nlOjwN6H00hDuX1a5pnuZ1/xaM/qpTc4JD8w0mTzkLqvQO4n78H6ocDpMJrAUo+PsQGwCxjyUpc/DOKDhA=
Content-ID: <9154885EAFA08547B9202D53B222E44E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 638f4abe-c41f-49fe-bd81-08d7110cfe9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 14:33:00.7516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2694
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miEshLjSn3CYq7RXiAZGze8MzMMF9p78PfumelpOYvg=;
 b=ekqohPJSA+RQ1LgjN5HBPQw/abd7i1CrrrzvXfBwsUnt8suDWSBtjykzEYnPtzoMBExSXG6NcLU0msBHXWf6Qsz0fZVeFAVu0il932I5ZCNRaI05qxwHJOgtG5qoQ+1VMSxvGRtD49rJm9pdnBgSX8rTUiui2QrXGaRKCzpGCM0=
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
 "michel@daenzer.net" <michel@daenzer.net>, "Wu, Hersen" <hersenxs.wu@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "S,
 Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gNy8yNS8xOSAxMDoyNCBBTSwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6DQo+IEZyb206IFNo
aXJpc2ggUyA8c2hpcmlzaC5zQGFtZC5jb20+DQo+IA0KPiBlbmFibGVzIGdwdV92bV9zdXBwb3J0
IGluIGRtIGFuZCBhZGRzDQo+IEFNREdQVV9HRU1fRE9NQUlOX0dUVCBhcyBzdXBwb3J0ZWQgZG9t
YWluDQo+IA0KPiB2MjoNCj4gTW92ZSBCTyBwbGFjZW1lbnQgbG9naWMgaW50byBhbWRncHVfZGlz
cGxheV9zdXBwb3J0ZWRfZG9tYWlucw0KPiANCj4gdjM6DQo+IFVzZSBhbWRncHVfYm9fdmFsaWRh
dGVfdXN3YyBpbiBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucy4NCj4gDQo+IHY0Og0K
PiBhbWRncHVfYm9fdmFsaWRhdGVfdXN3YyBtb3ZlZCB0byBzZXBwZXJhdGUgcGF0Y2guDQo+IA0K
PiBDaGFuZ2UtSWQ6IElmMzQzMDBiZWFhNjBiZTJkMzYxNzBiN2I1YjA5NmVjNjQ0NTAyYjIwDQo+
IFNpZ25lZC1vZmYtYnk6IFNoaXJpc2ggUyA8c2hpcmlzaC5zQGFtZC5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0KPiAt
LS0NCg0KUmV2aWV3ZWQtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNr
YXNAYW1kLmNvbT4NCg0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNw
bGF5LmMgICAgICAgfCAyICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYyB8IDIgKy0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rpc3BsYXkuYw0KPiBpbmRleCBjYWM5OTc1Li43MzA0NWEzIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMNCj4gQEAgLTUwNSw3ICs1
MDUsNyBAQCB1aW50MzJfdCBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikNCj4gICAJICogQVBVcy4gU28gZm9yY2UgdGhlIEJPIHBsYWNl
bWVudCB0byBWUkFNIGluIGNhc2UgdGhpcyBhcmNoaXRlY3R1cmUNCj4gICAJICogd2lsbCBub3Qg
YWxsb3cgVVNXQyBtYXBwaW5ncy4NCj4gICAJICovDQo+IC0JaWYgKGFkZXYtPmFzaWNfdHlwZSA+
PSBDSElQX0NBUlJJWk8gJiYgYWRldi0+YXNpY190eXBlIDwgQ0hJUF9SQVZFTiAmJg0KPiArCWlm
IChhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9DQVJSSVpPICYmIGFkZXYtPmFzaWNfdHlwZSA8PSBD
SElQX1JBVkVOICYmDQo+ICAgCSAgICBhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUgJiYgYW1kZ3B1
X2JvX3N1cHBvcnRfdXN3YygwKSAmJg0KPiAgIAkgICAgYW1kZ3B1X2RldmljZV9hc2ljX2hhc19k
Y19zdXBwb3J0KGFkZXYtPmFzaWNfdHlwZSkpDQo+ICAgCQlkb21haW4gfD0gQU1ER1BVX0dFTV9E
T01BSU5fR1RUOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMNCj4gaW5kZXggNDkyMjU4OS4uZjAzODdjZTEgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiBA
QCAtNjg2LDcgKzY4Niw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpDQo+ICAgCSAqLw0KPiAgIAlpZiAoYWRldi0+ZmxhZ3MgJiBBTURfSVNf
QVBVICYmDQo+ICAgCSAgICBhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9DQVJSSVpPICYmDQo+IC0J
ICAgIGFkZXYtPmFzaWNfdHlwZSA8IENISVBfUkFWRU4pDQo+ICsJICAgIGFkZXYtPmFzaWNfdHlw
ZSA8PSBDSElQX1JBVkVOKQ0KPiAgIAkJaW5pdF9kYXRhLmZsYWdzLmdwdV92bV9zdXBwb3J0ID0g
dHJ1ZTsNCj4gICANCj4gICAJaWYgKGFtZGdwdV9kY19mZWF0dXJlX21hc2sgJiBEQ19GQkNfTUFT
SykNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
