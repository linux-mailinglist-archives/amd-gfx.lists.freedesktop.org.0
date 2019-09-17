Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090BAB45C3
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 04:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916556EABB;
	Tue, 17 Sep 2019 02:58:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720046.outbound.protection.outlook.com [40.107.72.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCF16EABB
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 02:58:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=joWBi/vGi+6p1Tud3vBlBeTYHZ+GyJXgdRYrTERhMVqPKY3T4T5SdUZWll1tA0xrLXnUKHficUZyJd4NOLykQjhCV8MoJ/A0BI9wm7OPY1LD2lGvoJH/8gwwzp1Anee35NVaLnfNB2AW9/yNSe9MdjhxsUVe0ROfyRUZg80rWuuVH3gwdMAu4wck7b5XedprRuwG05qsjEemHp84EB1TCZlazkcJYAZ0ydi9bsg/JGTfljW+ASSnpPIF9e3/OgOIvrcml6d4xdqftqva7aNNLtzaAwqnVcvrTTnOM5eW00j3uLts1V0/81ZEto+X6quyYV2CtTru5sRwq9bp8jwCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s18oHOvIpiMKvDlXAEkndNtcHxe5z4gt0EVjUItTJio=;
 b=MUJdns2BFUMSFsQOkalnJ/iQ4Bu7UmcTI2uVGeW8I6/wpYh4MwYaPiPdGBi5a3tOKzrHMcVpQ7zBE0xhpmsjfLI8orSHeaCb7XVWn0Q9bItjlGYr+vJkzEk0D8JjQT52Ku2zoqafmxikaoDTq5yovQ8jlqORvh0HRnF9fuUac1HbMQTHxy1DkuOBSRZVQAGMYGz/jMD43LNuL6N/bIRNdd8xBD4DE9/a9+VDt2s3ldxbvPGoDZ0d7e8np3Q2t/aucQGHA4UgkW4ObdlxyUXlW3FMjMF0qKd5WySa3z6Q8prhtpyqTQxm6AzmldAaIWpfw6lDN10q3wF0lAPoAO1dYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3519.namprd12.prod.outlook.com (20.179.83.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.21; Tue, 17 Sep 2019 02:58:53 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 02:58:53 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/ras: use GPU PAGE_SIZE/SHIFT for reserving
 pages
Thread-Topic: [PATCH] drm/amdgpu/ras: use GPU PAGE_SIZE/SHIFT for reserving
 pages
Thread-Index: AQHVbMgWizqtFzzUuU6zihJZIH13UqcvLeHw
Date: Tue, 17 Sep 2019 02:58:53 +0000
Message-ID: <MN2PR12MB3054673035FF49D74A6BA9F3B08F0@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190916195052.29281-1-alexander.deucher@amd.com>
In-Reply-To: <20190916195052.29281-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35ac5bdb-2818-4bbc-ce1c-08d73b1af936
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3519; 
x-ms-traffictypediagnostic: MN2PR12MB3519:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3519F3302EBFD2A5A08E7BF1B08F0@MN2PR12MB3519.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(13464003)(189003)(199004)(102836004)(7696005)(256004)(81166006)(14444005)(52536014)(81156014)(14454004)(86362001)(966005)(5660300002)(8936002)(25786009)(316002)(4326008)(66066001)(110136005)(64756008)(66946007)(478600001)(6246003)(66446008)(66476007)(486006)(66556008)(446003)(11346002)(476003)(2906002)(229853002)(74316002)(2501003)(33656002)(99286004)(76116006)(6506007)(6116002)(53546011)(3846002)(7736002)(76176011)(55016002)(71190400001)(186003)(6306002)(305945005)(26005)(71200400001)(9686003)(6436002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3519;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0FHd6Vl6m9ecyifDI/qPDfgP0voXfZ+hhg4Yh+FsAjkrAxDFTCtU2GUFULI1LeUAPLWZCgpEjXt+QCLOq6Ek8nQ9DZ/REFsxsqc4Y2t991JV+qA5dR6ZdxpVMM3TdbhYkP1OFkXmnB7ceN+I4rR9mo4l4kPV9nFll1ATHAehlCvnuDWGD8xcHZVKfg0h1pYoZCrOZRJG9wgYAlZoQ9fw1gxeqEg+YL2HP6NjWkW+0BYLONhonvRwN0lSvSzJ0OqXnNPEduEM3H862QU3IlRcNg7QLUEfGlAsfDXGB7LJhQ+6hVW+S1rDWAhOdgKuCcUuLvS7phIi5rWl9Znznq3knBy1YUYFb+ktifBdvcL1HKT5CjHRgMTt4W7sQHQxIQkGd6Oocvzl6IMH8TCMpe7CJn7ZDU2++/d9815RUR3Y0vw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ac5bdb-2818-4bbc-ce1c-08d73b1af936
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 02:58:53.0962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E/P99BNZKtAsko1GhwFs4gM5ZStRNhlmTbWhJGiJqEfS/OvhqB2VD8LbAbXCgQAP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3519
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s18oHOvIpiMKvDlXAEkndNtcHxe5z4gt0EVjUItTJio=;
 b=MczYaAcF1eNhoGzMNOzCqFzzAAplrZn2qsgnQgNK/z1hdnopDGWdR1AMdI+z8XpKKNOV9NKjAPxl5ynIsKF9UCyq7Efz2rdzqn5ixtvNwvA10WX6FIoOdZ6haX0cTj8uh9wGhPgIKmMdpaYmtWOCC1Q/QYkMZTixmh73GsLkR1Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQWxleA0KPiBEZXVjaGVyDQo+IFNlbnQ6IDIw
MTnlubQ55pyIMTfml6UgMzo1MQ0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NCj4g
U3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1L3JhczogdXNlIEdQVSBQQUdFX1NJWkUvU0hJRlQg
Zm9yIHJlc2VydmluZw0KPiBwYWdlcw0KPiANCj4gV2UgYXJlIHJlc2VydmluZyB2cmFtIHBhZ2Vz
IHNvIHRoZXkgc2hvdWxkIGJlIGFsaWduZWQgdG8gdGhlIEdQVSBwYWdlIHNpemUuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+
IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMyArKy0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gaW5kZXggZmYxZmMw
ODRmZmUxLi4xMzFjNTNmYThlZmYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmMNCj4gQEAgLTE0MDksNyArMTQwOSw4IEBAIGludCBhbWRncHVfcmFzX3Jlc2Vy
dmVfYmFkX3BhZ2VzKHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgCWZvciAoaSA9
IGRhdGEtPmxhc3RfcmVzZXJ2ZWQ7IGkgPCBkYXRhLT5jb3VudDsgaSsrKSB7DQo+ICAJCWJwID0g
ZGF0YS0+YnBzW2ldLnJldGlyZWRfcGFnZTsNCj4gDQo+IC0JCWlmIChhbWRncHVfYm9fY3JlYXRl
X2tlcm5lbF9hdChhZGV2LCBicCA8PCBQQUdFX1NISUZULA0KPiBQQUdFX1NJWkUsDQo+ICsJCWlm
IChhbWRncHVfYm9fY3JlYXRlX2tlcm5lbF9hdChhZGV2LCBicCA8PA0KPiBBTURHUFVfR1BVX1BB
R0VfU0hJRlQsDQo+ICsJCQkJCSAgICAgICBBTURHUFVfR1BVX1BBR0VfU0laRSwNCj4gIAkJCQkJ
ICAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sDQo+ICAJCQkJCSAgICAgICAmYm8sIE5VTEwp
KQ0KPiAgCQkJRFJNX0VSUk9SKCJSQVMgRVJST1I6IHJlc2VydmUgdnJhbSAlbGx4IGZhaWxcbiIs
DQo+IGJwKTsNCj4gLS0NCj4gMi4yMC4xDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
