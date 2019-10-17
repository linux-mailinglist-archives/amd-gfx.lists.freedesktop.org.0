Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F31DB583
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 20:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF176EA17;
	Thu, 17 Oct 2019 18:07:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123CD6EA17
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 18:07:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nV6TdzEmrOErdbbJfhhf5GZXp6TbAXmpNv69g8u+1Zkw8O6c4i7NBuMktiHD3JxWIppL93wjO1RCM9BjMvrZOB34gIMtGgSCiVI0Nx6AvTegXOEZB5dJgU0LPdDC9kxVRYgRPmt0d4wa/Xzu6q0ktn8y3hhplpezzAn3zuK8pwO6QezyUT0UbHKh+BaqzYDEbe8dfe6uCShWJkwVpz3/ombFF55XMlRIIlq9nlo9wZOrGo44h4UKY7nnweiqkS5CqxgOKpT7NYmhqG2pewLjRtpAplDk3IEDz1lG6tCcoKCY3vM4mQJ7CoXb21PbSogm5g/28Cb2qDhl687Ng3i4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Djed5K8JUDb8QjH+z2FU3iW+U+jCRygF3MGaf57unKY=;
 b=ZAcZIMoXUlsWUc4JJ02UxKLYFuD5Z32NVPwctmGuAz8F0Y+xhOeRiHv5SU+I/o+arj9ue6dzXDgsIfIYE2mG3ksN+RYj57K/rKVv7aNLBOCXHOXHcER07Eg/nFgxyJkSbmHHg1htL2vLNtBHw5FGeGxUtpJR5ZQjyPtuaxtqBHRr776+R4nhuGTvvWLrhHtJBlD8J8xB5DwaiKn6o6CuoOiPt9iAKi9CfsNrwhyfsdZF5RF/DIvJY5zV/I/jWQkG8QgVzHy3fOl+SRt5lqgoRMjmSerlHGoDtksxGJpw09VHgnyxU8/EFeSpPjBS0WZg8KvWCoCfuswZEtGw5zhurw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB4030.namprd12.prod.outlook.com (10.255.86.25) by
 CY4SPR01MB029.namprd12.prod.outlook.com (10.171.247.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.23; Thu, 17 Oct 2019 18:07:05 +0000
Received: from MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9]) by MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9%5]) with mapi id 15.20.2347.024; Thu, 17 Oct 2019
 18:07:05 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: fix compiler warnings for df perfmons
Thread-Topic: [PATCH] drm/amdgpu: fix compiler warnings for df perfmons
Thread-Index: AQHVhRQ/SuKRz7WQ10iBfoC6I7ZeuqdfITMA
Date: Thu, 17 Oct 2019 18:07:05 +0000
Message-ID: <a6e67448-2cbf-3a7e-5acc-7af704d197db@amd.com>
References: <20191017175637.74270-1-jonathan.kim@amd.com>
In-Reply-To: <20191017175637.74270-1-jonathan.kim@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::14) To MN2PR12MB4030.namprd12.prod.outlook.com
 (2603:10b6:208:159::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efb8a8f5-83e1-4802-d5a7-08d7532cd180
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4SPR01MB029:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4SPR01MB0293CE4CBED758959DA0ACDE66D0@CY4SPR01MB029.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(199004)(189003)(486006)(6486002)(110136005)(316002)(6512007)(31696002)(6436002)(229853002)(36756003)(86362001)(71190400001)(71200400001)(66946007)(31686004)(66476007)(66556008)(6246003)(64756008)(66446008)(5660300002)(2616005)(476003)(2501003)(478600001)(3846002)(6116002)(2906002)(4001150100001)(66066001)(102836004)(186003)(25786009)(446003)(305945005)(7736002)(11346002)(6506007)(386003)(53546011)(26005)(256004)(8936002)(76176011)(14454004)(81156014)(81166006)(99286004)(52116002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4SPR01MB029;
 H:MN2PR12MB4030.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EXNzx0/SBjyjSBPUIG/P3Bp4E2zzM1DF+Xidboh5NRhTLNdxl/jqBUyLTxIiLzeX/dQeum6U/O+LfYCh7z8Z0sFjoIGig+BNhyFjPX4EIlSAVGoosajyeSRPDt/0i+zbhv0h5LdSMsdYe1TKnCsdgnVeUv+KmP3dXjHJ7TrtNyP0lp+g4mZ6J4kj4L0Uw7VjxiyvJ+RtnHT1vd5aKi72ghWvc/+674BbOH3Njjut62tP3rgqtpIHCEDyENJr1DanSiQ1mYq875G19YumL4ev8jYFS6BoWw2TbgZcOyAKoCsS8WUCQgWifljhAi7ErIA0BeS8YDqqvW+TMmf7K73pGcz4fYdhufAphXfPpTHw4h+c2cjTAkbYERqyvlCVsPhwMA+fceqaLoa4eAEL4rcKgXM8EoFTGj/7oCtsqANnSN0=
Content-ID: <F49522EC9304B94888F70C4401C55D7E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efb8a8f5-83e1-4802-d5a7-08d7532cd180
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 18:07:05.7280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JzZ7TSOeV5qPGsyPeBy8PdXVKOKuMTsbQLjSJdbeJvJd5XS4OFzefSkWnqrbB70d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4SPR01MB029
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Djed5K8JUDb8QjH+z2FU3iW+U+jCRygF3MGaf57unKY=;
 b=MZNYK7StQVOpI19QoSk4DFr+GhAeV8J7WirsDDGBdYJFX4Ls2ORTlWwczpymr+xStLPU1dGZwUtXOByGotGo7tLKZm9msDA/2myEI8QAICFZUZOrMvVrSFpwvtQFGXiiNcwKOn3Yreix1sFYbSCOzb1cJyhFfm10MGHlF22dRBY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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

UmV2aWV3ZWQtYnk6IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPg0KDQpPbiAyMDE5
LTEwLTE3IDE6NTYgcC5tLiwgS2ltLCBKb25hdGhhbiB3cm90ZToNCj4gZml4aW5nIGNvbXBpbGVy
IHdhcm5pbmdzIGluIGRmIHYzLjYgZm9yIGMtc3RhdGUgdG9nZ2xlIGFuZCBwbWMgY291bnQuDQo+
IA0KPiBDaGFuZ2UtSWQ6IEk3NGY4ZjFlYWZjY2Y1MjNhODlkNjBkMDA1ZTM1NDkyMzVmNzVjNmI4
DQo+IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIEtpbSA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+DQo+
IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYyB8IDQgKystLQ0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jDQo+IGluZGV4IGY0MDNjNjJjOTQ0ZS4u
ZTFjZjdlOWM2MTZhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9k
Zl92M182LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jDQo+
IEBAIC05Myw3ICs5Myw3IEBAIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgKmRmX3YzXzZf
YXR0cl9ncm91cHNbXSA9IHsNCj4gICAJCU5VTEwNCj4gICB9Ow0KPiAgIA0KPiAtc3RhdGljIGRm
X3YzXzZfc2V0X2RmX2NzdGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGFsbG93
KQ0KPiArc3RhdGljIGludCBkZl92M182X3NldF9kZl9jc3RhdGUoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIGludCBhbGxvdykNCj4gICB7DQo+ICAgCWludCByID0gMDsNCj4gICANCj4gQEAg
LTU0Niw3ICs1NDYsNyBAQCBzdGF0aWMgdm9pZCBkZl92M182X3BtY19nZXRfY291bnQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgCQkJCSAgdWludDY0X3QgY29uZmlnLA0KPiAgIAkJ
CQkgIHVpbnQ2NF90ICpjb3VudCkNCj4gICB7DQo+IC0JdWludDMyX3QgbG9fYmFzZV9hZGRyLCBo
aV9iYXNlX2FkZHIsIGxvX3ZhbCwgaGlfdmFsOw0KPiArCXVpbnQzMl90IGxvX2Jhc2VfYWRkciwg
aGlfYmFzZV9hZGRyLCBsb192YWwgPSAwLCBoaV92YWwgPSAwOw0KPiAgIAkqY291bnQgPSAwOw0K
PiAgIA0KPiAgIAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgew0KPiANCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
