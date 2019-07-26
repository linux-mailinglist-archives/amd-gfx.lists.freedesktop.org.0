Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA8D75EB7
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 08:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406796E886;
	Fri, 26 Jul 2019 06:03:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680046.outbound.protection.outlook.com [40.107.68.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DB56E886
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 06:03:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n114ZCK0hPW6cGYDqIR0AxEnn8vyH82po+1ITTqJn7KeNDgOjM67wyU+U3vx7poigclGjSrj8TNop7FM0qM+TCxGleUFmNWmsA2pCX16GuHIuShfkoHFmia2NIHTP+7s7eenlSmZdtJYsUMxQ5hWJQR5Hy4eJjRYKwaVyLTHrDxfodXaTHGYX2ZYwN0yx1+QnBD7qQdfaRCk4DPrtJXUBV1Dk/ZLlopUoOMBvKyielkktYMm+WEGF28pnkckq5rP+jTsdS+2UgsLAhTsY7clUWsV2gfVEBrKnOdFHmArD+Z6SXqBCs9pLLzwIa/15YSEEzhxGr96SDzZAWJgBYfjXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUlnWK6wU3lzU84q9GkV4xKKhrjGeboet/MmzDK875s=;
 b=OrsS7wc1q1YpjaSjDmRBI2IHdSqxClBld3+DskVwjo6wVIcB0yXl7QmwirOeEEFT8b3BknSq9ojtQOVjwyEb0q41GIT9o7sVrhyeoxsuR1/3FMn6EiKqsUd5FGSDk37qA2YepMZVUnaZ+kVRhFGy8KBL93iqd3+WDD5IcKkcuJK6aqJzD3M/ed9nCaxM1UpIkuSkiAJu1mt+m7xxBB7V+V6/GA2Jmbf8CEJRz6kKRQMyD0PEXzP+8YhEsmy1oqcGh72Hi95cYXeiydruPbv5biMA5aSNk6MQRLg1B0i0cxlxqbOlmDxn9DRAVqcqy9QAirxvdKp9aLHwtaieOf2l6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3070.namprd12.prod.outlook.com (20.178.240.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Fri, 26 Jul 2019 06:03:55 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26%7]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 06:03:55 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/powerplay: use proper revision id for navi
Thread-Topic: [PATCH] drm/amdgpu/powerplay: use proper revision id for navi
Thread-Index: AQHVQ2ggA7oGC04WTk22S0bACW9aMabcaNvQ
Date: Fri, 26 Jul 2019 06:03:54 +0000
Message-ID: <MN2PR12MB3344EA1CBE8AA39513726D9EE4C00@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190726041041.4023-1-alexander.deucher@amd.com>
In-Reply-To: <20190726041041.4023-1-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59fb3cc0-4cdb-417d-b1cc-08d7118f0a93
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3070; 
x-ms-traffictypediagnostic: MN2PR12MB3070:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3070D729E77530C3BF56FFD8E4C00@MN2PR12MB3070.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(199004)(189003)(13464003)(102836004)(55016002)(66556008)(64756008)(2906002)(66476007)(5660300002)(66946007)(186003)(76176011)(9686003)(66446008)(6436002)(6506007)(229853002)(14454004)(7696005)(476003)(68736007)(52536014)(486006)(76116006)(4326008)(53936002)(8676002)(110136005)(8936002)(478600001)(74316002)(6116002)(3846002)(6306002)(305945005)(71190400001)(2501003)(81166006)(11346002)(66066001)(256004)(53546011)(71200400001)(7736002)(26005)(316002)(25786009)(33656002)(966005)(86362001)(81156014)(99286004)(14444005)(6246003)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3070;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 41Qj9wJ9TBTqUm7j7bFPM/vO4yN3NxYVx+fLRHtEoR6e3S210jI6zlsHg/NhL74avfYBQfZRjKsfuqi2DDfBgU1wjTjSR4ncC18E23wmjcpomnGXA2zTIsORYQKlL5p5DdVbQsOzuv8C6rzaPb1uz008F6RIY2owb/OvphD2PDvzOLZExdPO1U+xKmIScj5Q5RAVKWw/YXAQRN0wwjGDPUlXXlIotoI2RW5ZYhOIv0gBxuPDj4axkEsw8w1fLj5VUjF8vXlPcloJbm+qJHv025KZIcRUEKgoK+RmorvZYORbQTNJcuwB3NOcTtDNpcMCJ6SmUe6Y1R8GO4REeaGj1ZZ17MWG8qXxEUEskwRJQIjq0y1d7ybIpXuTH/6J253sZqali1A+yg/J4xHmzF6+z/S/dGtCrpW4/FQavZNqHoI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fb3cc0-4cdb-417d-b1cc-08d7118f0a93
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 06:03:54.9962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3070
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUlnWK6wU3lzU84q9GkV4xKKhrjGeboet/MmzDK875s=;
 b=NyVvRKWTlJu9X9+1SAQUJTpdHJEq7WOw46yr4IBIIocemZuy85CaqzaxvRGjBRpUMfuGSSssDCbYbVB4g5KGJb65e+GG7D8dAZbl1fQt5oMct3iR9pJoisLPLVmdJJy24zTp4JiqFWpKlGQQGL9lMW6gbn1LHGtl6xfayMWvKVw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFsZXgNCj4gRGV1Y2hlcg0KPiBTZW50OiBG
cmlkYXksIEp1bHkgMjYsIDIwMTkgMTI6MTEgUE0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFt
ZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdS9wb3dlcnBsYXk6IHVzZSBwcm9w
ZXIgcmV2aXNpb24gaWQgZm9yIG5hdmkNCj4gDQo+IFRoZSBQQ0kgcmV2aXNpb24gaWQgZGV0ZXJt
aW5lcyB0aGUgc2t1Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L25hdmkxMF9wcHQuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L25hdmkxMF9wcHQuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYw0KPiBpbmRleCBjODczMjI4YmYwNWYuLmRiYWMyNGU0NDE3NCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYw0KPiBAQCAtMTU5
Miw3ICsxNTkyLDcgQEAgc3RhdGljIGludCBuYXZpMTBfc2V0X3BlYWtfY2xvY2tfYnlfZGV2aWNl
KHN0cnVjdA0KPiBzbXVfY29udGV4dCAqc211KQ0KPiAgCXVpbnQzMl90IHNjbGtfZnJlcSA9IDAs
IHVjbGtfZnJlcSA9IDA7DQo+ICAJdWludDMyX3QgdWNsa19sZXZlbCA9IDA7DQo+IA0KPiAtCXN3
aXRjaCAoYWRldi0+cmV2X2lkKSB7DQo+ICsJc3dpdGNoIChhZGV2LT5wZGV2LT5yZXZpc2lvbikg
ew0KPiAgCWNhc2UgMHhmMDogLyogWFRYICovDQo+ICAJY2FzZSAweGMwOg0KPiAgCQlzY2xrX2Zy
ZXEgPSBOQVZJMTBfUEVBS19TQ0xLX1hUWDsNCj4gLS0NCj4gMi4yMC4xDQo+IA0KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxp
bmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
