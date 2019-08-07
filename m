Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB22B84277
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 04:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BB16E5B4;
	Wed,  7 Aug 2019 02:31:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730070.outbound.protection.outlook.com [40.107.73.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E049A6E592
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 02:31:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OiyloxxaAbBN6DFx8NM+I0ScFGrX0k8ii7qbk3xk0YrkxGfWEPY4HtR+dBrqGu8WBGki6+uM0WPu8tg/zDW5bdiQB0sdQnbNHdcLfrHTlYjvLFzM9k9NZooC5Yv2x2NBTfCg5K+7Xuae8IU9X14BhYUdVpBzPTO3bLi1LBHMHRw8y+M2cmfKXFRSApa3Fd43GyRiaZYjvlg8ZwtHyRoPaJJLAukYRV1yapRlpbY+boqAn6AE226YNHiwERObCqHXxSE6h75GZqsmfqq2Fy3AMqruU1S22+PafVqIsq0P96exgQXYljgEmrZy6/RmgnFa/0VuKV/HjcZTarJh6+23Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfIlSntbRKLY6PiWByQnairnqOWqmR6rB03KiTM8F6Q=;
 b=JdzF/4KXwZjPXKM5lAvJY6bvB/n1tWJA3CRzpcidbDlSozF1OOPwBP9fAY0UJsEK6QtXD37WKhqlD2BgLwnXxo2beHJ4mdRHl2lcZV9AS5gAXa3ViMUyLroG/bqk3YlgUfTLyfVMTS6CeRoih4L3sQxL7IEmQKtSZuUPryc/6W1XsTZQwm7CzeG3hJLFhugnQ/3lqFwbFk0NVlmKXMKGAQazwyYkqkVa8209TStghdf+6MiYRMGFhrezJbJ8eRrC0Xn6tJr4RPXBaosNn7HoR35o7aQTlY2sdEXpwYkl1W7NylmndcaELqODLBUoNikbGg4kXAxM7Mwnuh8OE8XPbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2404.namprd12.prod.outlook.com (52.132.10.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Wed, 7 Aug 2019 02:31:10 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 02:31:10 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/5] drm/amdgpu: Support new arcturus mtype
Thread-Topic: [PATCH 2/5] drm/amdgpu: Support new arcturus mtype
Thread-Index: AQHVTMgsgUD+t9U31kSKN6Yvdme53Q==
Date: Wed, 7 Aug 2019 02:31:10 +0000
Message-ID: <1565145062-16674-2-git-send-email-Oak.Zeng@amd.com>
References: <1565145062-16674-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1565145062-16674-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 772a2955-93b4-43bc-4c2e-08d71adf4f31
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2404; 
x-ms-traffictypediagnostic: BL0PR12MB2404:
x-microsoft-antispam-prvs: <BL0PR12MB24043501B6323C63A4E8A9CB80D40@BL0PR12MB2404.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(366004)(39850400004)(396003)(189003)(199004)(54906003)(5640700003)(2616005)(36756003)(2351001)(64756008)(66476007)(66946007)(186003)(99286004)(66446008)(11346002)(6436002)(66556008)(6486002)(3846002)(26005)(486006)(476003)(76176011)(66066001)(6916009)(6512007)(446003)(2501003)(52116002)(305945005)(86362001)(53936002)(2906002)(102836004)(68736007)(7736002)(6116002)(6506007)(316002)(386003)(71200400001)(50226002)(4326008)(14444005)(81156014)(81166006)(478600001)(71190400001)(5660300002)(14454004)(25786009)(8676002)(8936002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2404;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zup5xuMEItCgAhBC35zOL6nlKtnPscOfjOYZTx37AhCrPKo+nVCn4e/zgkIEDuNWCMv+hOa/DaA0wArApm4u8UlosbIMcs4Amm87o/igusmIZMdA/TFBxwRt7b0qcU3CYrAMXQVEPgWNY3COp//o8OB8tmJbafPPk5TcQyt23I5jb7WUg0NQVUKpivEH6EDp2MmxF1sHQTgxOblYnzmlDel5BJow5NP0pK2UFkXT8RXYoVP0G4HUonaYrNHmbwb5Cwegts7JPSvA+jEBs/0NbVo+DsEWbt/dc16b3Vt8FrbbyEPLR+rtAs+VpPoD0ZRt4qLuYVAZILIOM5VNtyv59El07QLfdYr/+iGkVFVDcL2Nz83PLaetKbHWFoMzMtDmDOTcLPSep6q33o0Jmf868tzHrB6T8P2NrMJFCe4uxT0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772a2955-93b4-43bc-4c2e-08d71adf4f31
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 02:31:10.6283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2404
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfIlSntbRKLY6PiWByQnairnqOWqmR6rB03KiTM8F6Q=;
 b=EEhCIXADJjebtQoxGKGE+vVOUH6PDg35Habe7zxwCtdDuI1ulR+ywz5uoAXcriZ11sFuFEpX9nTeZEYFYzBzo8efc/hx9Exa/Boi246cU8AU92PzpOiMvZaQzhb8b3jyCPzj1WKwNEYFhaU0q+JdFG2KG7YngyT+CO/iNS78I5I=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Keely,
 Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QXJjdHVydXMgcmVwdXJwb3NlZCBtdHlwZSBXQyB0byBSVy4gTW9kaWZ5IGdtYyBmdW5jdGlvbnMK
dG8gc3VwcG9ydCB0aGUgbmV3IG10eXBlCgpDaGFuZ2UtSWQ6IElkYzMzOGU1Mzg2YTU3MDIwZjQ1
MjYyMDI1ZTI2NjRhYjRiYTlmMjkxClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0Bh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICAgIHwg
NjEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9p
bmNsdWRlL3ZlZ2ExMF9lbnVtLmggfCAgNyArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDY3IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
YwppbmRleCBhMmFhMzVlLi44OTA2NGQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMKQEAgLTU5OSw2ICs1OTksNTAgQEAgc3RhdGljIHVpbnQ2NF90IGdtY192OV8wX2dldF92
bV9wdGVfZmxhZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJcmV0dXJuIHB0ZV9mbGFn
OwogfQogCitzdGF0aWMgdWludDY0X3QgZ21jX3Y5XzBfYXJjdHVydXNfZ2V0X3ZtX3B0ZV9mbGFn
cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCQkJCXVpbnQzMl90IGZsYWdzKQorCit7
CisJdWludDY0X3QgcHRlX2ZsYWcgPSAwOworCisJaWYgKGZsYWdzICYgQU1ER1BVX1ZNX1BBR0Vf
RVhFQ1VUQUJMRSkKKwkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9FWEVDVVRBQkxFOworCWlmIChm
bGFncyAmIEFNREdQVV9WTV9QQUdFX1JFQURBQkxFKQorCQlwdGVfZmxhZyB8PSBBTURHUFVfUFRF
X1JFQURBQkxFOworCWlmIChmbGFncyAmIEFNREdQVV9WTV9QQUdFX1dSSVRFQUJMRSkKKwkJcHRl
X2ZsYWcgfD0gQU1ER1BVX1BURV9XUklURUFCTEU7CisKKwlpZiAoYWRldi0+Z21jLnpmYl9zaXpl
ID4gMCkKKwkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9TWVNURU07CisKKwlzd2l0Y2ggKGZsYWdz
ICYgQU1ER1BVX1ZNX01UWVBFX01BU0spIHsKKwljYXNlIEFNREdQVV9WTV9NVFlQRV9ERUZBVUxU
OgorCQlwdGVfZmxhZyB8PSBBTURHUFVfUFRFX01UWVBFX1ZHMTAoTVRZUEVfQVJDVFVSVVNfTkMp
OworCQlicmVhazsKKwljYXNlIEFNREdQVV9WTV9NVFlQRV9OQzoKKwkJcHRlX2ZsYWcgfD0gQU1E
R1BVX1BURV9NVFlQRV9WRzEwKE1UWVBFX0FSQ1RVUlVTX05DKTsKKwkJYnJlYWs7CisJY2FzZSBB
TURHUFVfVk1fTVRZUEVfUlc6CisJCXB0ZV9mbGFnIHw9IEFNREdQVV9QVEVfTVRZUEVfVkcxMChN
VFlQRV9BUkNUVVJVU19SVyk7CisJCWJyZWFrOworCWNhc2UgQU1ER1BVX1ZNX01UWVBFX0NDOgor
CQlwdGVfZmxhZyB8PSBBTURHUFVfUFRFX01UWVBFX1ZHMTAoTVRZUEVfQVJDVFVSVVNfQ0MpOwor
CQlicmVhazsKKwljYXNlIEFNREdQVV9WTV9NVFlQRV9VQzoKKwkJcHRlX2ZsYWcgfD0gQU1ER1BV
X1BURV9NVFlQRV9WRzEwKE1UWVBFX0FSQ1RVUlVTX1VDKTsKKwkJYnJlYWs7CisJZGVmYXVsdDoK
KwkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9NVFlQRV9WRzEwKE1UWVBFX0FSQ1RVUlVTX05DKTsK
KwkJYnJlYWs7CisJfQorCisJaWYgKGZsYWdzICYgQU1ER1BVX1ZNX1BBR0VfUFJUKQorCQlwdGVf
ZmxhZyB8PSBBTURHUFVfUFRFX1BSVDsKKworCXJldHVybiBwdGVfZmxhZzsKK30KKworCiBzdGF0
aWMgdm9pZCBnbWNfdjlfMF9nZXRfdm1fcGRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBp
bnQgbGV2ZWwsCiAJCQkJdWludDY0X3QgKmFkZHIsIHVpbnQ2NF90ICpmbGFncykKIHsKQEAgLTYz
MSw5ICs2NzUsMjQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIGdtY192
OV8wX2dtY19mdW5jcyA9IHsKIAkuZ2V0X3ZtX3BkZSA9IGdtY192OV8wX2dldF92bV9wZGUKIH07
CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2dtY19mdW5jcyBnbWNfdjlfMF9hcmN0dXJ1
c19nbWNfZnVuY3MgPSB7CisJLmZsdXNoX2dwdV90bGIgPSBnbWNfdjlfMF9mbHVzaF9ncHVfdGxi
LAorCS5lbWl0X2ZsdXNoX2dwdV90bGIgPSBnbWNfdjlfMF9lbWl0X2ZsdXNoX2dwdV90bGIsCisJ
LmVtaXRfcGFzaWRfbWFwcGluZyA9IGdtY192OV8wX2VtaXRfcGFzaWRfbWFwcGluZywKKwkuZ2V0
X3ZtX3B0ZV9mbGFncyA9IGdtY192OV8wX2FyY3R1cnVzX2dldF92bV9wdGVfZmxhZ3MsCisJLmdl
dF92bV9wZGUgPSBnbWNfdjlfMF9nZXRfdm1fcGRlCit9OworCiBzdGF0aWMgdm9pZCBnbWNfdjlf
MF9zZXRfZ21jX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewotCWFkZXYtPmdt
Yy5nbWNfZnVuY3MgPSAmZ21jX3Y5XzBfZ21jX2Z1bmNzOworCXN3aXRjaCAoYWRldi0+YXNpY190
eXBlKSB7CisJY2FzZSBDSElQX0FSQ1RVUlVTOgorCQlhZGV2LT5nbWMuZ21jX2Z1bmNzID0gJmdt
Y192OV8wX2FyY3R1cnVzX2dtY19mdW5jczsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJYWRldi0+
Z21jLmdtY19mdW5jcyA9ICZnbWNfdjlfMF9nbWNfZnVuY3M7CisJCWJyZWFrOworCX0KIH0KIAog
c3RhdGljIHZvaWQgZ21jX3Y5XzBfc2V0X3VtY19mdW5jcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS92ZWdhMTBfZW51
bS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3ZlZ2ExMF9lbnVtLmgKaW5kZXggYzE0
YmE2NS4uMGQ2ZDk3ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3Zl
Z2ExMF9lbnVtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3ZlZ2ExMF9lbnVt
LmgKQEAgLTEwNDEsNiArMTA0MSwxMyBAQCBNVFlQRV9DQyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgID0gMHgwMDAwMDAwMiwKIE1UWVBFX1VDICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgPSAweDAwMDAwMDAzLAogfSBNVFlQRTsKIAordHlwZWRlZiBlbnVtIE1UWVBFX0FS
Q1RVUlVTIHsKK01UWVBFX0FSQ1RVUlVTX05DICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPSAweDAwMDAwMDAwLAorTVRZUEVfQVJDVFVSVVNfUlcgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA9IDB4MDAwMDAwMDEsCitNVFlQRV9BUkNUVVJVU19DQyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgID0gMHgwMDAwMDAwMiwKK01UWVBFX0FSQ1RVUlVTX1VDICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAweDAwMDAwMDAzLAorfSBNVFlQRV9BUkNUVVJV
UzsKKwogLyoKICAqIFJNSV9DSUQgZW51bQogICovCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
