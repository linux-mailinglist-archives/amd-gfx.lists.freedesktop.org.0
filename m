Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A2F75D9A
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 06:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E986E87A;
	Fri, 26 Jul 2019 04:20:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690079.outbound.protection.outlook.com [40.107.69.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986716E87A
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 04:20:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XE0NZnAyudgnCD3n/DsqQwi3Xcm+sFgGbKTPaECHWBgbHtdLstbDw/BvBbQeYZe3CfloBgsbSHNP+bmzcVr0Gw0VI3Ncjq+dBI8V30B2f4g1A7VvgpfUVfkgWD2lBzMX7bxJ5qODNWIN+oWmbdRVYj+Q52i1ePLcDvRPNi18z6ra0UTvMmetNT4ZxmwtRNvs+tXrw5biuzyFqypQKPOfBTYvQhAN06wx4LaoJaAmBBkXsLyewP6h+9b7veyz0inSkEKwDJKNUipeRyRTBib43p2p92v0wWam5GI+0XcTT/d0LYfxvGoF0V4r/avequDxt2V5oLMjjOimajy+uN56WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ul91cXNjkoJZfXG+HJqssaCHE9AB9v2SL0KkbCmvHtk=;
 b=eSMpdk4pVFE/Ffuu1ramMM6dXd4AuTcliUJPHQRFjmGiq5d9kTrHRZ9owPwh5VJ1fdml/jUOr++FxD5btA5XNGd853zEQXmyAF5Kdx11rgpqzwxq1F8Y/PtpsACQ672o08QWCGL4HiI3iCYmcgmR4xZMfadlRx0zOhHMQZvbr0t3QWVlzXj/udgfKjD28TkShTa+bIDbxb98K0c9PP2HInRvamP/4ImItMHkEzMJdxg7ONDLKPCw+xv5CV7dzSCf2NR6l0mpNu93V7tAL3+R7q7Y1gBw2dGhiU96Fs7BHXJ2Fh4eB0A4JLFC1fo0rLxXRrSMa2MUEc7BELVX9hWsQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (10.255.236.208) by
 MN2PR12MB3949.namprd12.prod.outlook.com (10.255.238.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Fri, 26 Jul 2019 04:20:51 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f818:ed02:abc9:32a3]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f818:ed02:abc9:32a3%7]) with mapi id 15.20.2094.013; Fri, 26 Jul 2019
 04:20:51 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/powerplay: use proper revision id for navi
Thread-Topic: [PATCH] drm/amdgpu/powerplay: use proper revision id for navi
Thread-Index: AQHVQ2gg0i3w4FDfqkWqUCxUNaLpgabcTB1Q
Date: Fri, 26 Jul 2019 04:20:51 +0000
Message-ID: <MN2PR12MB3775A0024DE6CC275E1AA4AFFEC00@MN2PR12MB3775.namprd12.prod.outlook.com>
References: <20190726041041.4023-1-alexander.deucher@amd.com>
In-Reply-To: <20190726041041.4023-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ecaae6a9-ce35-4b7e-cc80-08d71180a4ec
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3949; 
x-ms-traffictypediagnostic: MN2PR12MB3949:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB39494657E315BB2088E8F83DFEC00@MN2PR12MB3949.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(13464003)(199004)(189003)(71190400001)(446003)(74316002)(53546011)(55016002)(305945005)(7736002)(6246003)(6116002)(186003)(486006)(4326008)(14454004)(71200400001)(6506007)(3846002)(229853002)(256004)(14444005)(9686003)(11346002)(6306002)(476003)(7696005)(68736007)(81156014)(81166006)(52536014)(76176011)(316002)(110136005)(478600001)(86362001)(2501003)(33656002)(25786009)(76116006)(5660300002)(66556008)(66446008)(102836004)(53936002)(26005)(966005)(66946007)(64756008)(8676002)(99286004)(66476007)(6436002)(2906002)(8936002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3949;
 H:MN2PR12MB3775.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 51axf7CsQmCm+iGDlf8q7LvJ+S6xpV6tlPhuPS1cUGOpDwVxaBjooX8tjwkLevf7c/EKiTLvOSYy2+dSYWfJTOy+5wGysA1tdUZKtyc3SpmgrO1EpiZnKBHIUOaBYqDIXTBd6tQGG3TQ85YrqWbwC11rkW/b+YatZyNFkV5dAac+wRAvMHCknk3uTZFSDNkpXaFENj8NcZl2y/7/QR3mzP/7OCLuUY+vgJDBXF5pkhGnmIwblyimXnsBMVR2QvsqfISR4Djgq+7TkdwC3TMp+4iA3QZ3OlRPa4MC70qImrRJ0LOUMQl5dqvGbmVZDHOhf16U6hJzHvxsYOpMF1KWfGUuag8ft/JrM15SN35aRv2ysnOuZt9LXeLs624e4oa0EoTsNKEv8kCBVhcs9NSldY0BaoJ05jEm937tvLKrKX0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecaae6a9-ce35-4b7e-cc80-08d71180a4ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 04:20:51.6173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feifxu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3949
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ul91cXNjkoJZfXG+HJqssaCHE9AB9v2SL0KkbCmvHtk=;
 b=T5TOGPnGyB/sSQzYYpLh0QusEMZdMjhh9zYI7oKXy0pqulj88q4ttzcf0yK2s8LOFogTq5jLOHcqMoWZCLAo6ozLOq75nUo1hx74F7EXZE4VsRxZDMnALSk6+o6of3aj/mnZnSX0FlV6vYxVcY4wXZPVaAFcW8DA+/4zrz2wcoE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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

DQpSZXZpZXdlZC1ieTogRmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNvbT4NCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5m
cmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4IERldWNoZXINClNlbnQ6IEZyaWRheSwg
SnVseSAyNiwgMjAxOSAxMjoxMSBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQpDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KU3Vi
amVjdDogW1BBVENIXSBkcm0vYW1kZ3B1L3Bvd2VycGxheTogdXNlIHByb3BlciByZXZpc2lvbiBp
ZCBmb3IgbmF2aQ0KDQpUaGUgUENJIHJldmlzaW9uIGlkIGRldGVybWluZXMgdGhlIHNrdS4NCg0K
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0K
LS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgMiArLQ0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jDQppbmRleCBjODczMjI4YmYwNWYu
LmRiYWMyNGU0NDE3NCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEw
X3BwdC5jDQpAQCAtMTU5Miw3ICsxNTkyLDcgQEAgc3RhdGljIGludCBuYXZpMTBfc2V0X3BlYWtf
Y2xvY2tfYnlfZGV2aWNlKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQ0KIAl1aW50MzJfdCBzY2xr
X2ZyZXEgPSAwLCB1Y2xrX2ZyZXEgPSAwOw0KIAl1aW50MzJfdCB1Y2xrX2xldmVsID0gMDsNCiAN
Ci0Jc3dpdGNoIChhZGV2LT5yZXZfaWQpIHsNCisJc3dpdGNoIChhZGV2LT5wZGV2LT5yZXZpc2lv
bikgew0KIAljYXNlIDB4ZjA6IC8qIFhUWCAqLw0KIAljYXNlIDB4YzA6DQogCQlzY2xrX2ZyZXEg
PSBOQVZJMTBfUEVBS19TQ0xLX1hUWDsNCi0tIA0KMi4yMC4xDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
