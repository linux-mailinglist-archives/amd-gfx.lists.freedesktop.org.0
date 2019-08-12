Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7D9895E1
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 05:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4B26E449;
	Mon, 12 Aug 2019 03:57:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740050.outbound.protection.outlook.com [40.107.74.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27C46E449
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 03:57:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/2FvlMB4I71MqrqAivAexPkJfan525gTE3Te+yfTeaM6BzvE4YikDngNVkt+9s5SKP6YqWgyOVLQYrjrwOGgeqb9D0Drl8nEGueUewxB0uSHmnmZJkig2/NqskhefY8aa+j8EkehD0T4iWRksUUanJDAIZGkS/pHx53T+jE8SZo93cp34OvQ2RH5MwP73QiDezXglIz/+zPOeB7H9tN8kiUxapHH1v826TiCiIu1zEESWbY+PgHA5H0J4yc3/Clx1cg8OZL2sYNSGd/9bmPwZs+ovtGlWBx+A4UxeBEKwagTgyff2bY3aBQSgRC1VrAMa3e5I1iBr6j/erT2M/a3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9aFSOx/4M2Na0YLhTwMekjpZQajpM5a3d5tgRAVMJY=;
 b=hQleFcbLk6P80SX5EGpXQME995QSqx0Y56Qd3vFYResBItkca1W3sm0xYIMSDbqh5nUewiyy9H2prkF/X6z2IJ9RgK0rzorOZgzN7pNJxpmoQolbAd7YP5YjeIncTf3Xar11onwStrc2L3Y0SXB67mBrKqAXOBGL7GpWlnNfxQIuDDDv4EsIj8XLQLLt+8XwlFr9HItTuHatA1alkHpfU5SgP5vDbXt6XGjoG241d/wk0DJOWWB/8b5ihskgRM9AfaACDQLATF058DPPIbWKQe0sGdkYlkpuYIXIhFYHf/4QPY8dqxcB0lQu65x+ttouMsZpJESLuJITjiA/scoV8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4158.namprd12.prod.outlook.com (10.255.224.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Mon, 12 Aug 2019 03:57:34 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e%7]) with mapi id 15.20.2136.018; Mon, 12 Aug 2019
 03:57:34 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 27/27] drm/amdgpu: flag renoir as experimental for now
Thread-Topic: [PATCH 27/27] drm/amdgpu: flag renoir as experimental for now
Thread-Index: AQHVTsqebkzzDFxI6Ee8avxStegEQqb25mzA
Date: Mon, 12 Aug 2019 03:57:34 +0000
Message-ID: <MN2PR12MB330913185AF2D65312F516EBECD30@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
 <20190809155302.4733-27-alexander.deucher@amd.com>
In-Reply-To: <20190809155302.4733-27-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50e1b2fc-a079-41cb-fd7d-08d71ed93530
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4158; 
x-ms-traffictypediagnostic: MN2PR12MB4158:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4158E05F7E42EB8694E85194ECD30@MN2PR12MB4158.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:751;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(189003)(13464003)(199004)(25786009)(5660300002)(476003)(110136005)(7736002)(14454004)(14444005)(2501003)(52536014)(86362001)(3846002)(446003)(11346002)(229853002)(316002)(9686003)(6306002)(8936002)(53936002)(26005)(66066001)(6246003)(2906002)(256004)(102836004)(66446008)(66556008)(4326008)(71200400001)(186003)(71190400001)(76116006)(53546011)(8676002)(81156014)(66946007)(64756008)(66476007)(99286004)(81166006)(478600001)(6506007)(76176011)(55016002)(74316002)(6116002)(7696005)(966005)(33656002)(305945005)(486006)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4158;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IBaNN4AJDCebslHoYo2TXQLfF341JYBfiDtqEVCzmV+c6FDSaBmCJ3oXsfQYMRzLLn+NJTOPEN6odTFpqhXWljydz5ncge83ytZfV+E9z9mBT5BG8EcQg0b3+Z140+tvus2oxf1BMSRp2efPIaRUBYp4N/XVxZMkNJ0NuQ5bXDC41bpgLHCBAm0GRmNbVYej6N9ag1TDdR2+fTJfevDmYIeW/gRRv66tXBsGK5d/6k5VxasJld4fVHv6zsNwbSroR4bhnNm3C2LMWvFo5QMDl9QZ8v9QEG4i85zIXYGGsVgZql7Cvm65/FYxw/dFwe1oXle66nd1iiQeLIk81lun+KZgVJUHM70lqkdBOjE8K9ZKz5vzeneaQ0Cy50DhrlCB9Xxs0/dxV6cSRq8Un/C5eOzG7GWbzSiiLMfAoQDgLQU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e1b2fc-a079-41cb-fd7d-08d71ed93530
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 03:57:34.3225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4158
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9aFSOx/4M2Na0YLhTwMekjpZQajpM5a3d5tgRAVMJY=;
 b=f5SzOuIc3XrOU6vslmCeTrEl2vbUSXcBmvVrXe59L2Wwuy3yVdxqicIaLjYRohyECy+WGOH+VMX0RzdTMGWcCup9wg+1WghYDp5+crCM+A52FCspJ2fG9fbg117LUt2YVREUjcZyI4lA9GxWOHRW3i+5p++B3Ays1sC/eX9IrlM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQWxleA0KPiBEZXVjaGVy
DQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDA5LCAyMDE5IDExOjUzIFBNDQo+IFRvOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5k
ZXIuRGV1Y2hlckBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMjcvMjddIGRybS9hbWRncHU6
IGZsYWcgcmVub2lyIGFzIGV4cGVyaW1lbnRhbCBmb3Igbm93DQo+IA0KPiBUaGUgY3VycmVudCBj
b2RlIHdvbid0IGxpa2VseSB3b3JrIG9uIHByb2R1Y3Rpb24gaHcgd2hlbiBpdCBzaGlwcyBzbyBs
ZWF2ZSBpdA0KPiBhcyBleHBlcmltZW50YWwgdW50aWwgaXQncyByZWFkeS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCg0KUmV2
aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQoNCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAyICstDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCj4gaW5kZXggMDY3NGNhOTBjOTUyLi42ZWU1Mjlk
MDEyNjMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCj4g
QEAgLTEwMTEsNyArMTAxMSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBw
Y2lpZGxpc3RbXSA9IHsNCj4gIAl7MHgxMDAyLCAweDczNDAsIFBDSV9BTllfSUQsIFBDSV9BTllf
SUQsIDAsIDAsIENISVBfTkFWSTE0fSwNCj4gDQo+ICAJLyogUmVub2lyICovDQo+IC0JezB4MTAw
MiwgMHgxNjM2LCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLA0KPiBDSElQX1JFTk9JUnxB
TURfSVNfQVBVfSwNCj4gKwl7MHgxMDAyLCAweDE2MzYsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQs
IDAsIDAsDQo+ICtDSElQX1JFTk9JUnxBTURfSVNfQVBVfEFNRF9FWFBfSFdfU1VQUE9SVH0sDQo+
IA0KPiAgCXswLCAwLCAwfQ0KPiAgfTsNCj4gLS0NCj4gMi4yMC4xDQo+IA0KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcg
bGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
