Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B23C9D614
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 20:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFFC6E2A0;
	Mon, 26 Aug 2019 18:57:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760045.outbound.protection.outlook.com [40.107.76.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CCF6E2A0
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 18:57:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAqw5PURBUhGYgMp3qrpN5YrnT8Xfnu+dOmBg9Yb4fyofwpsq8x14akZ9Gu9rLejqfjfgG+xRTV1cl4QTTpobVXZ1HT9jMYJGAFP0/7cCzMUFzvm8vc+JbUxQBCRbo7uTq1ZqsyRv4YClsUJ0GHNY44P97mA0i9Kl9GIWZ6fNo9nP1ac+PDsyE9Fs5rrs6/5qkDX3ScBVFDH0j31VdlG7Y+2SIXkNuuMcT7Mb10oyJ9MxeUqusA/G+fYcoXlaac5h5NfF62mN7vXBV1qvioGPHBeV/GJHDbFPns4mZ8rSvV85s+8/mLGoydk/9li8h/GVZx666kPZyhfgBxekpGJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEbnbOUiuOmXvCdZZ68nbTMkr8tDExVMMCPWDAp91vQ=;
 b=IZmnoQXeEfaWhqB9DIebT0cNzBqIebJgWKGWI6tmFp7H4/acJC6WczYdBn9lxhUcsnbdO1sd+QzoDHuU5Bpjr9DsnAzAvLP3CvCHKdYLoA6m9wv98Ddd/ThVophYMx8kj0OdHRm02Uz+XnFmZgwo/DbHVe/834Atv7c9fahvTgUVRREf5e7lvCdueAeLhXcPDy/Q84i1Czh98GAZJdNHzSfKtABWIsxex/1TWDvtq/3kAoix+tAOnPvefqF9HnsnfmmsXgws0P/O6TzZ60DvJuLPDZ3YAe6LMOuq/nloqsbup6ZwXob5CKC1f2Xm1cF6Ui7QPw/P52PaZhSayQ5hag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1552.namprd12.prod.outlook.com (10.172.53.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 18:57:11 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4047:39c1:ac17:3813]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4047:39c1:ac17:3813%6]) with mapi id 15.20.2199.020; Mon, 26 Aug 2019
 18:57:11 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: fix a warning in smu11 i2c code
Thread-Topic: [PATCH] drm/amdgpu: fix a warning in smu11 i2c code
Thread-Index: AQHVXD/KTHXOmo0xB0GxWgKGc1baeKcNx54A
Date: Mon, 26 Aug 2019 18:57:11 +0000
Message-ID: <a078caa8-f588-de9a-86aa-277e12ee9193@amd.com>
References: <20190826185453.1793-1-alexander.deucher@amd.com>
In-Reply-To: <20190826185453.1793-1-alexander.deucher@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::38) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ed843b0-df93-4586-e261-08d72a573379
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1552; 
x-ms-traffictypediagnostic: MWHPR12MB1552:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB155221F67E1231494267C905EAA10@MWHPR12MB1552.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(189003)(199004)(71200400001)(71190400001)(66946007)(66446008)(64756008)(66556008)(66476007)(81166006)(4744005)(5660300002)(2906002)(256004)(14444005)(14454004)(36756003)(305945005)(66066001)(478600001)(7736002)(26005)(186003)(316002)(53936002)(31686004)(6512007)(31696002)(2616005)(446003)(486006)(11346002)(86362001)(476003)(6486002)(6436002)(4326008)(2501003)(6116002)(76176011)(102836004)(229853002)(25786009)(6506007)(386003)(110136005)(53546011)(8936002)(52116002)(99286004)(8676002)(6246003)(3846002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1552;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JuYVvA7AO/CjuCwpkNn0vj1oNwMdRQuVWjmUaIYkWDLv/fGnCEk6ajGjND7qRw+4iU4gNBn4BePDYtBxM0DONBfscIwl8AqI5ev0EkdJRwnDq7Q6EiI4eBcp2a9KK0R8jP41nW8v+UW9Bf7txxDd6Gdlnh2hcf2de7BAyAc6jFc3HA/QWpliAheAFxu0ZEUZFXbDiQsxUMQ4+S8h2PD5SlBKpXGOrYSBLD+GvPwAqkBGcm91IfvIUh8NwVFZ3K0Fn/NMgwaH4fZYtL0izSqAGQUFo3kn2fEU9gzIMjQdUtEZhqHZPWDpRBE/wWikCFpiOr8ihXBrg5P6P27UKbH47ZAybr4tFjsE8y0g9sRawXgu6QpCz1v7pydPahIT0sjDHw6O0kc1LDmf16iAGv6lN9TBT4inNd2d4HHZ75QFXVA=
Content-ID: <E6C485D2B91BCE4CB25140D8F79C62A7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed843b0-df93-4586-e261-08d72a573379
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 18:57:11.2750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pTOOqc9JMu7iUGDvhi7THyF+vFKCMJfjtqhS37i8ePRfDcBdczUhMsl6jYplBpUbdMmwQZSm7bovNp0lOeBWDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1552
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEbnbOUiuOmXvCdZZ68nbTMkr8tDExVMMCPWDAp91vQ=;
 b=2VyJPQ0y0eBMcG2CYOrY5GIUBeOqmwXf4bBBm6jSCeuUxJkMrtvJ5okaCBrqy7EkcCvZIxKAqirHQU78/Aa2u/c0ap7jJKFeYCzDAcv8zaeh2oXDLf/N9K0B/yOlFl07UWYIP+V3UtmAY8fq30fFwnVZjm2LDZvkI/0PgMG7L+Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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

SG1tLCBteSBjb21waWxlciBkaWRuJ3Qgc2VudCBhIHdhcm5pbmcgYWJvdXQgdGhpcy4uLg0KDQpU
aGFua3MuDQoNClJldmlld2VkLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zz
a3lAYW1kLmNvbT4NCg0KQW5kcmV5DQoNCk9uIDgvMjYvMTkgMjo1NCBQTSwgQWxleCBEZXVjaGVy
IHdyb3RlOg0KPiBtYWtlIHN1cmUgcmVnIGlzIGluaXRpYWxpemVkIGluIHNtdV92MTFfMF9pMmNf
c2V0X2Nsb2NrX2dhdGluZy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9zbXVfdjExXzBfaTJjLmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zbXVfdjExXzBfaTJjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
bXVfdjExXzBfaTJjLmMNCj4gaW5kZXggNGNmY2VmMGZlZmY4Li43ZDBkNGM1N2IzMTUgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NtdV92MTFfMF9pMmMuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zbXVfdjExXzBfaTJjLmMNCj4gQEAgLTUw
LDcgKzUwLDcgQEANCj4gICBzdGF0aWMgdm9pZCBzbXVfdjExXzBfaTJjX3NldF9jbG9ja19nYXRp
bmcoc3RydWN0IGkyY19hZGFwdGVyICpjb250cm9sLCBib29sIGVuKQ0KPiAgIHsNCj4gICAJc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSB0b19hbWRncHVfZGV2aWNlKGNvbnRyb2wpOw0KPiAt
CXVpbnQzMl90IHJlZzsNCj4gKwl1aW50MzJfdCByZWcgPSBSUkVHMzJfU09DMTUoU01VSU8sIDAs
IG1tU01VSU9fUFdSTUdUKTsNCj4gICANCj4gICAJcmVnID0gUkVHX1NFVF9GSUVMRChyZWcsIFNN
VUlPX1BXUk1HVCwgaTJjX2Nsa19nYXRlX2VuLCBlbiA/IDEgOiAwKTsNCj4gICAJV1JFRzMyX1NP
QzE1KFNNVUlPLCAwLCBtbVNNVUlPX1BXUk1HVCwgcmVnKTsNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
