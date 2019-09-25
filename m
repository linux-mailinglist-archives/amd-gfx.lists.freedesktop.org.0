Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158E8BDF6E
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 15:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883896E84B;
	Wed, 25 Sep 2019 13:51:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680067.outbound.protection.outlook.com [40.107.68.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94D86E84B
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 13:51:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqJjo6zXs58zxHo3TRJU1Ybwg3dsAqA6/8kTtOcmYfZFzyFe/OwO2tHfY66CrCOMN5taxBFwEmMF20edqL9VL1a0HhMA1W/XEzJqCEYoPadJTvZqlcijuMrqQeTWPHKZ50uzB1bO/UXKnV4kxL30vKTPj315C7z7C451xdcs5ijmwgDJPnKGJcIlXY1tGRmknA4/REQk/81HgsJyKijd6bptYzXOXFgsydWkCVKxlJgJkUPAahe3/qe8QYgj4tiKc/pB+o5cQK2Z2RF2BaPLsIWDxnuzwj+zUSZO5a6BCZvoqlPWkKee/Mc7hzgOFxkAG4tSZJtziAPjfCNtLlISUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY6Xe6GGcaznX35DJjJF1+3M46bIwCdDshwACM4ZNC8=;
 b=n+MuJ/8my5x65/iXy3eL0Q5pYiC1Nfd+IlOgs/zA2/STJvySKzqK1r+V6sD9nTsKWwaBlkPtX8SK7YbqzJSA26GTEeUjemNld8bsZ02ygNtUQ5OEPKskkzVHml7TaV+c7dXmj2qfUoVkeLoF+bNMOnug8AzQ83TBm4PITPF78FCiQ8U2t6ekbr89pfyRTP6sA0Ayx9kP7uRanXEm2t/Qse2yw5LcO3+ZtxQwkBOAWpTiRo1QGOh3LteWQXmDhfN2VO0UDP6RQkcs7IlPyH8AkizeHnBE2TJd3B1UB5zHyDB0uG92X4iDPJDHbHuh9vzMOs50h3EbLWnGmfz03KQkNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3933.namprd12.prod.outlook.com (10.255.238.94) by
 MN2PR12MB3984.namprd12.prod.outlook.com (10.255.238.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 13:51:34 +0000
Received: from MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::a4d2:a803:ad8d:d341]) by MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::a4d2:a803:ad8d:d341%5]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 13:51:34 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: fix potential VM faults
Thread-Topic: [PATCH] drm/amdgpu: fix potential VM faults
Thread-Index: AQHVbsYR0dwgpJUIOESc2xGLhHGy1Kc8cpvQ
Date: Wed, 25 Sep 2019 13:51:33 +0000
Message-ID: <MN2PR12MB393312A21B75620C726F18DF84870@MN2PR12MB3933.namprd12.prod.outlook.com>
References: <20190919084136.82658-1-christian.koenig@amd.com>
In-Reply-To: <20190919084136.82658-1-christian.koenig@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [101.87.148.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40043c24-a476-400e-b9eb-08d741bf7a3e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3984; 
x-ms-traffictypediagnostic: MN2PR12MB3984:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB39841EC3AC5082D0C221771384870@MN2PR12MB3984.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(13464003)(199004)(189003)(76176011)(486006)(6436002)(14454004)(66556008)(64756008)(66946007)(7736002)(7696005)(8676002)(81166006)(66446008)(66476007)(11346002)(76116006)(81156014)(66066001)(102836004)(6506007)(476003)(966005)(14444005)(25786009)(186003)(53546011)(26005)(9686003)(446003)(8936002)(305945005)(478600001)(2906002)(256004)(6246003)(52536014)(86362001)(229853002)(5660300002)(2501003)(55016002)(316002)(66574012)(6306002)(33656002)(99286004)(6116002)(74316002)(71200400001)(110136005)(71190400001)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3984;
 H:MN2PR12MB3933.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: B1X09ZnGc6+qfKOa6RLIccKbAs+QV48VSQUNlho8cBqlpUMYxqO+9+SS0MDFQ6gChl25YHr8LNceb9bIaHYD11QYCje6yuz2spEFQtTdK+xqsEzfEBmvtmucQzZzLdxlfPuyS7bxbT0uu8hBHc9B4QlpjwSF84wiSRa9R7icUDUBfO/ppRRO1OsvwNTCU7m7SsBVWyuB8A3q5wZAQC87JlAH2Tl2dMjc6A3iAo6NIUDZrLjk32Rhj52/pEyolYqMEXRMVDTNT3jvbN2GQWQzpKheR4YR07yr6+cPpkbNzS2TC7OBNZfk0ppyPxCGoMufeMjrCETvt/81H9ObcJdt2/iZlUC+9f5h8fYgREpy+qDo/HGu+Ct9CgJsUicSYYaoQwC/bm11k8gIAwOZvj6lH7uyPmv488kFKIa7NKcFXXVT6jxxB0Dm9XGjwSvVP1ornB8mzAFpS1PwK7Br3I4T1w==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40043c24-a476-400e-b9eb-08d741bf7a3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 13:51:33.8186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N8ubxZ8VLUZAILZ0utsCITW/wVZLp9s4HPceb0JpgH0kuAN90bjdQI3S2u+PLLgr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3984
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY6Xe6GGcaznX35DJjJF1+3M46bIwCdDshwACM4ZNC8=;
 b=MvgFMMzKPNCPjDVT2k+RFoPLj5Ag4qHjp6qSt7gG2XjKW/k75i/QVbhnPvzIIddfhxBpdwMU/G3mUkZ9pPvJDke4yMXYymfaFsWHX5vW0ZIj7ws8QcQo2Lhzn4jjJXjqwBZ1v58lf2S5hXNURz1sDD2UWbEskcJevJKJkmyUlUs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Monk.Liu@amd.com; 
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

SGkgQ2hyaXN0aWFuDQoNClRoZW9yZXRpY2FsbHkgdGhlIHZtIHB0L3BkIHNob3VsZCBiZSBhbGxv
d2VkIHRvIGJlIGV2aWN0ZWQgbGlrZSBvdGhlciBCT3MgLi4NCg0KSWYgeW91IGVuY291bnRlcmVk
IHBhZ2UgZmF1bHQgYW5kIGNvdWxkIGJlIGF2b2lkZWQgYnkgdGhpcyBwYXRjaCwgdGhhdCBtZWFu
cyB0aGVyZSBpcyBidWcgaW4gdGhlIFZNL3R0bSBzeXN0ZW0gLCBhbmQgeW91ciBwYXRjaCBzaW1w
bHkNCg0Kdy9hIHRoZSByb290IGNhdXNlLg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQpNb25rIExpdXxHUFUgVmlydHVhbGl6YXRpb24gVGVhbSB8QU1EDQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0Bs
aXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBDaHJpc3RpYW4gSz9uaWcNClNlbnQ6
IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTksIDIwMTkgNDo0MiBQTQ0KVG86IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IGZpeCBwb3RlbnRp
YWwgVk0gZmF1bHRzDQoNCldoZW4gd2UgYWxsb2NhdGUgbmV3IHBhZ2UgdGFibGVzIHVuZGVyIG1l
bW9yeSBwcmVzc3VyZSB3ZSBzaG91bGQgbm90IGV2aWN0IG9sZCBvbmVzLg0KDQpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQotLS0NCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMgfCAzICsrLQ0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYw0KaW5kZXggNzBkNDVkNDg5MDdhLi44ZTQ0
ZWNhYWRhMzUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
b2JqZWN0LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3Qu
Yw0KQEAgLTUxNCw3ICs1MTQsOCBAQCBzdGF0aWMgaW50IGFtZGdwdV9ib19kb19jcmVhdGUoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQogCQkuaW50ZXJydXB0aWJsZSA9IChicC0+dHlwZSAh
PSB0dG1fYm9fdHlwZV9rZXJuZWwpLA0KIAkJLm5vX3dhaXRfZ3B1ID0gYnAtPm5vX3dhaXRfZ3B1
LA0KIAkJLnJlc3YgPSBicC0+cmVzdiwNCi0JCS5mbGFncyA9IFRUTV9PUFRfRkxBR19BTExPV19S
RVNfRVZJQ1QNCisJCS5mbGFncyA9IGJwLT50eXBlICE9IHR0bV9ib190eXBlX2tlcm5lbCA/DQor
CQkJVFRNX09QVF9GTEFHX0FMTE9XX1JFU19FVklDVCA6IDANCiAJfTsNCiAJc3RydWN0IGFtZGdw
dV9ibyAqYm87DQogCXVuc2lnbmVkIGxvbmcgcGFnZV9hbGlnbiwgc2l6ZSA9IGJwLT5zaXplOw0K
LS0NCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
