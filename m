Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E748ACBB
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2019 04:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3726E611;
	Tue, 13 Aug 2019 02:34:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820077.outbound.protection.outlook.com [40.107.82.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3986E611
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2019 02:34:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8W1zxCa6JACRoeYc3K7PlggxNc59kwzpbFg/H1XLJ9j3/tqZjMA8cFrcDetUiih6CMvdtAHVJJ1PDLf4EDBIxtJNL5KehWaLNIgOnaD7rDbLDkFiCcozfATFpZH8bkNcgxmsA2FjPy29W2cZQsHC0xKKzhRRGPbivc9TZ7YhoZW+ePeDPzKdSYsbcBlKgKUMHSZ4zm4CJj9Sym/ige/qf0xuFUL+xQK7Ox/A2+YnxHPjW27xpLJq281uhIQESuHnPvlCTLKGjN39cwrANOS00jkNDXo0C5KG4ZmsdvVbpSWsplta6XJhVdS/AcLuwOHDX6Ea7GGJJZkjNKPPF/fOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJkaITRjDKFphaPARiPr7iL8MNsHu3HWVZWpGqyfX7M=;
 b=KDTH9AjY1MyxNT4Bd6FvhZCEcTB8/8kB8Yq2yM4pkPb8dO2Qb+kcdae/bmmqyNo3pru/yUOzPWwos/fazxNTm5CQZJPzNnZ7WHsXoFJcrbf0UZFEej43qmrNI9S/kM7XULMtGoi3zVEFicqteF8n1RKu0MP+AFHdIAmRVkBHc20TelTLQPgEvcD90koDkl6gFztDZEKADAsPazOtT8qUZE5z2M3NLKpfo1iNGsgQvEntcI6abXtV/kZnGmHD1EFwYehR+6yi99aR6mwGyfbrJTRMI9yCogUB2NE4HSIf5dyIWrvFu2qWygaUnMdlXvztIOSUdwRW8036KLUedAiTEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3552.namprd12.prod.outlook.com (20.179.80.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.13; Tue, 13 Aug 2019 02:34:07 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 02:34:07 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: dl.srdc_lnx_nv10 <dl.srdc_lnx_nv10@amd.com>
Subject: [PATCH] drm/amd/powerplay: fix message of SetHardMinByFreq failed
 when feature is disabled
Thread-Topic: [PATCH] drm/amd/powerplay: fix message of SetHardMinByFreq
 failed when feature is disabled
Thread-Index: AQHVUX+Uhc4UEmlSG0m/A3GeFpkTLg==
Date: Tue, 13 Aug 2019 02:34:06 +0000
Message-ID: <20190813023347.8666-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0141.apcprd02.prod.outlook.com
 (2603:1096:202:16::25) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57fc1ba0-d36f-4674-b482-08d71f96b6a3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3552; 
x-ms-traffictypediagnostic: MN2PR12MB3552:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3552F2EA5060A7D0E7C50FB5A2D20@MN2PR12MB3552.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6029001)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(189003)(199004)(305945005)(6636002)(7736002)(6486002)(50226002)(15650500001)(8936002)(8676002)(53936002)(4326008)(6862004)(86362001)(478600001)(81166006)(81156014)(14454004)(71190400001)(5660300002)(186003)(26005)(6506007)(386003)(6512007)(102836004)(71200400001)(66946007)(66066001)(1076003)(6116002)(476003)(52116002)(64756008)(66476007)(66556008)(66446008)(14444005)(99286004)(3846002)(316002)(486006)(2906002)(36756003)(6436002)(25786009)(2616005)(256004)(54906003)(37006003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3552;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cjzYHl2r4gKKVzGW65AjDOjBrPsdCfFGK/jCnjhGlPsGEcVI+SsiU3W9kXGZ3Yc3ohe1Cr4gEcxCsSryxUqfxw/bQjSI7z3tCNUMUS9O8uUTra/uBRw8YpS+QJv+GvZs9T0zA4qcqNc+gjEV3cvzHbUq5tgCjK57GjQn7/XvDjAOZHWOnd8wFftWs+UOmXzJEYaPaDJrUN/tbs67JWLa+RP1mitxTT9A/JWgjvNnaAbu73cnoBfXRGrQhh1lOXtcpaSA1GpsalNFHgedhauUXhhZcxsD4yG8pdDM/OhAN/shd5qOmqVFpBZig27MNsKiOjFut80MsOvWKdIwziVhts41l5GQP/Hex2o3P64v/SmyUOsg5NqhD5OGEuzQAfJ/bQsXhKraeQ/aPSDDQcUAS1y+5k0S4nmRYzDm/FwXahA=
Content-ID: <CDC251F03EB6534A8199FF4C9C13CB25@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57fc1ba0-d36f-4674-b482-08d71f96b6a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 02:34:07.1768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gJxSQCLx9gRGkm+ZEeelF7XbMO98RDDg9hoqksX2YGOccjiqONEuzg4iJIDtwxWl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3552
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJkaITRjDKFphaPARiPr7iL8MNsHu3HWVZWpGqyfX7M=;
 b=4HZPAsh0hrwwULkscykxvNJfyC0WIYSP0CYNXnZkVh6/Dvfz09RPvfWwNlhR6DlsKlL1+xAskyVY+bEWlOwGi/aJN3Lvj3NcERIgikuTRWUuW5k1I4SP49m8DUVPVkaJ/EcPDKm18AUpmziTvFn09MVOD7w0olC/Mqlr0820sIs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Feng, 
 Kenneth" <Kenneth.Feng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dGhlIGRpcmVjdCBzZW5kIG1lc3NhZ2UgdG8gc21jIHRvIHNldCBoYXJkIGNsb2tjIHdpbGwgZmFp
bGVkDQp3aGVuIHNtYyBjbG9jayBkcG0gZmVhdHVyZSBpcyBkaXNhYmxlZC4NCnNvIHVzZSBmdW5j
dGlvbiBvZiBzbXVfc2V0X2hhcmRfZnJlcV9yYW5nZSB0byByZXBsYWNlIGl0Lg0KdGhlIGZ1bmN0
aW9uIHdpbGwgY2hlY2sgZmVhdHVyZSBlbmFibGVtZW50Lg0KDQplZzogd2hlbiB1Y2xrIChtY2xr
KSBkcG0gZmVhdHVyZSBpcyBkaXNhYmxlZCBvbiBuYXZpMTANClvCoCAzMDAuNjc1OTAxXSBhbWRn
cHU6IFtwb3dlcnBsYXldIGZhaWxlZCBzZW5kIG1lc3NhZ2U6IFNldEhhcmRNaW5CeUZyZXEoMjgp
DQrCoMKgIHBhcmFtOiAweDAwMDIwMDY0IHJlc3BvbnNlIDB4ZmZmZmZmZmINCg0KU2lnbmVkLW9m
Zi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIHwgMTAgKy0tLS0tLS0tLQ0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCmluZGV4IDNhMDgxYWNkZjFhOC4uM2E0OWNhYmY3
MjZmIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8w
LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jDQpAQCAt
MTMwNiwxNiArMTMwNiw4IEBAIHNtdV92MTFfMF9kaXNwbGF5X2Nsb2NrX3ZvbHRhZ2VfcmVxdWVz
dChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwNCiAJCWlmIChjbGtfc2VsZWN0ID09IFNNVV9VQ0xL
ICYmIHNtdS0+ZGlzYWJsZV91Y2xrX3N3aXRjaCkNCiAJCQlyZXR1cm4gMDsNCiANCi0JCWNsa19p
ZCA9IHNtdV9jbGtfZ2V0X2luZGV4KHNtdSwgY2xrX3NlbGVjdCk7DQotCQlpZiAoY2xrX2lkIDwg
MCkgew0KLQkJCXJldCA9IC1FSU5WQUw7DQotCQkJZ290byBmYWlsZWQ7DQotCQl9DQotDQotDQog
CQltdXRleF9sb2NrKCZzbXUtPm11dGV4KTsNCi0JCXJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0
aF9wYXJhbShzbXUsIFNNVV9NU0dfU2V0SGFyZE1pbkJ5RnJlcSwNCi0JCQkoY2xrX2lkIDw8IDE2
KSB8IGNsa19mcmVxKTsNCisJCXJldCA9IHNtdV9zZXRfaGFyZF9mcmVxX3JhbmdlKHNtdSwgY2xr
X3NlbGVjdCwgMCwgY2xrX2ZyZXEpOw0KIAkJbXV0ZXhfdW5sb2NrKCZzbXUtPm11dGV4KTsNCiAN
CiAJCWlmKGNsa19zZWxlY3QgPT0gU01VX1VDTEspDQotLSANCjIuMjIuMA0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
