Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03804BADD4
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 08:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2496E0E0;
	Mon, 23 Sep 2019 06:30:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760081.outbound.protection.outlook.com [40.107.76.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3925D6E0E0
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 06:30:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YN1cAOIEBYdmAei9xONW+5P6jM2qNVWmqXTxonmkCg12A0ETa8zXhlHvK95/TBDV0So3ji5jqBODF8ot3pXznNNsJM8x/lIh42TjFPgd2dSRZws15aXAOMiLqR3QRHBZJM93WGE9uB7B6yBvNQX7B99ZQMEkIpQnnYOoJiZ6NcvisbYR663NoUAu+YbiOUjvv/2n+XMwaotmQUwMVLm7Sd0yjCjWPcDQDiP1O9MkBEa0RJCVfS0cHMF10K2RJaZjxwch9lRC8uMS7T65b5QCz46NyzmAACjISzVgDaacRMoZEYkk25ft8yC+FTvVBV37FSzb9/+0ubUjRlIeEX8GVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQ+B720oazx9onpvv/DdUsG1Oje/xAmilFhgcbJb+dw=;
 b=dhF75GITAyL6vgDpnGGmGIEks+2jsIYjOau6RWKy3q0SD+swpLJDEa6tKFFLR3BRNBRhQkyDkWVcqPvY3TrlEwFI636+RiiEDLvEsywjO9JlPugFpZllmyeNUrkfQZrJUeuSCEjjXlE+c/6X27ST4pY84lK9RHS92BGdPhZiV78ORZXcoS61NSclGJchR1rdlR853s/LYVr7+W4RN9OLm0oCCfqwO/SnXKcgS1585OyAVfF4RZhSqcI9cx6yYxkCpfhNvkq3vvt1/wrUPp70oq4vlQgDD9+oZ+2N5mHQG6oLZDLOzXTvaNnOhJ6f9zMLEmfnTcBP5yPEgrlk1yWe+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3838.namprd12.prod.outlook.com (10.255.237.95) by
 MN2PR12MB2944.namprd12.prod.outlook.com (20.179.81.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.21; Mon, 23 Sep 2019 06:30:33 +0000
Received: from MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a]) by MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a%5]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 06:30:33 +0000
From: "Liu, Aaron" <Aaron.Liu@amd.com>
To: "Gong, Curry" <Curry.Gong@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: Use mode2 mode to perform GPU RESET for
 Renoir
Thread-Topic: [PATCH 2/2] drm/amdgpu: Use mode2 mode to perform GPU RESET for
 Renoir
Thread-Index: AQHVcdYs24ISCqEh6E2gXgxS3ALMVqc4y91g
Date: Mon, 23 Sep 2019 06:30:32 +0000
Message-ID: <MN2PR12MB38387B7E3B8419F52FEE14DFF0850@MN2PR12MB3838.namprd12.prod.outlook.com>
References: <1569219248-29457-1-git-send-email-curry.gong@amd.com>
 <1569219248-29457-2-git-send-email-curry.gong@amd.com>
In-Reply-To: <1569219248-29457-2-git-send-email-curry.gong@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 901533c7-c0fd-4122-66cf-08d73fef8966
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2944; 
x-ms-traffictypediagnostic: MN2PR12MB2944:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB29441288039507A152ECC979F0850@MN2PR12MB2944.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(13464003)(189003)(199004)(229853002)(64756008)(66446008)(14454004)(76176011)(8936002)(81166006)(81156014)(446003)(478600001)(99286004)(2906002)(486006)(7696005)(71190400001)(71200400001)(6506007)(53546011)(966005)(26005)(305945005)(33656002)(25786009)(66556008)(86362001)(74316002)(8676002)(256004)(186003)(11346002)(2501003)(52536014)(5660300002)(102836004)(476003)(7736002)(4326008)(316002)(66066001)(6436002)(76116006)(66946007)(6306002)(66476007)(110136005)(6246003)(6116002)(3846002)(9686003)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2944;
 H:MN2PR12MB3838.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GAIulYOJhoVn8LhJw1jUVRdHHOLN74pU5o/dZXWWwV7VqpU3/kHdX5oW15xSvcU0HuFDkv38BmD1xiPswYb9KA1q6qpsGD+kb2RXSDNY3jebj7ZfqBTDppjt+GMY4RivPV3UjVw5P8NazgQ1GPkgTIq2cdhMFbwOydfpnw8+5CPchVfxels4thcfcPXtWuhfdFb+rwkGKZJAzmU5wdWpD5K334gklMO4efMefl3nKBNcTf8uXtrMyJZf4oxJKdtHpYTnOvZjaA8y3q9tF2g1Fm4M21hTGPuFMn/u0fqpcePkgpSNclkawfxcX/SQEhwjsgR5zQzIfpjiTwlKgs8NinRwD5/XV+a8VmQW6bQ52VwLt3z7OpJBztkdBdzrKeq+gJvteN2vMU6jp3ucfPf114kY70MDnmWuU9g/SW0X8zs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 901533c7-c0fd-4122-66cf-08d73fef8966
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 06:30:32.9938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0FDcM3DSEzH7qPIpPjFnd9VgVdc/2plhxw48LFUIdQKRTdh+k5aLilSuukZBR1hf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2944
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQ+B720oazx9onpvv/DdUsG1Oje/xAmilFhgcbJb+dw=;
 b=R87tY4546Gazg67Dt5mr2t7Uo1syH+SRUc09n9uKPoG2JcGV5C5xazjLPXdTHneJLnBZ6FcjtkrNvdzegOMqz8DQMYyIy1KtUu3uCwIP3stWLNzCLzKJqoRhyK56XZUSWJKjUrmuI2E+QZyjcqVHpui+cRMkM80r4NnWmTVYsc8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Aaron.Liu@amd.com; 
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
Cc: "Gong, Curry" <Curry.Gong@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEFhcm9uIExpdSA8YWFyb24ubGl1QGFtZC5jb20+DQoNCkJSLA0KQWFyb24g
TGl1DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1k
LWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIGNoZW4NCj4g
Z29uZw0KPiBTZW50OiBNb25kYXksIFNlcHRlbWJlciAyMywgMjAxOSAyOjE0IFBNDQo+IFRvOiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogR29uZywgQ3VycnkgPEN1cnJ5Lkdv
bmdAYW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDIvMl0gZHJtL2FtZGdwdTogVXNlIG1vZGUy
IG1vZGUgdG8gcGVyZm9ybSBHUFUgUkVTRVQNCj4gZm9yIFJlbm9pcg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogY2hlbiBnb25nIDxjdXJyeS5nb25nQGFtZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDMgKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc29jMTUuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCj4gaW5k
ZXggNTg4MTg3NjEuLjBmNjM5ZGY5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zb2MxNS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
LmMNCj4gQEAgLTUxNCw2ICs1MTQsOCBAQCBzdGF0aWMgaW50IHNvYzE1X2FzaWNfYmFjb19yZXNl
dChzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldikNCj4gDQo+ICBzdGF0aWMgaW50IHNvYzE1
X21vZGUyX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSAgew0KPiArCWlmIChpc19z
dXBwb3J0X3N3X3NtdShhZGV2KSkNCj4gKwkJcmV0dXJuIHNtdV9tb2RlMl9yZXNldCgmYWRldi0+
c211KTsNCj4gIAlpZiAoIWFkZXYtPnBvd2VycGxheS5wcF9mdW5jcyB8fA0KPiAgCSAgICAhYWRl
di0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5hc2ljX3Jlc2V0X21vZGVfMikNCj4gIAkJcmV0dXJuIC1F
Tk9FTlQ7DQo+IEBAIC01MjgsNiArNTMwLDcgQEAgc29jMTVfYXNpY19yZXNldF9tZXRob2Qoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UNCj4gKmFkZXYpDQo+IA0KPiAgCXN3aXRjaCAoYWRldi0+YXNpY190
eXBlKSB7DQo+ICAJY2FzZSBDSElQX1JBVkVOOg0KPiArCWNhc2UgQ0hJUF9SRU5PSVI6DQo+ICAJ
CXJldHVybiBBTURfUkVTRVRfTUVUSE9EX01PREUyOw0KPiAgCWNhc2UgQ0hJUF9WRUdBMTA6DQo+
ICAJY2FzZSBDSElQX1ZFR0ExMjoNCj4gLS0NCj4gMi43LjQNCj4gDQo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0
DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
