Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF3AA2CAC
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 04:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B38C6E226;
	Fri, 30 Aug 2019 02:11:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680062.outbound.protection.outlook.com [40.107.68.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F126E226
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 02:11:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWCaqkwNIBUsv3HZ3TfW74OI5/x7gUBw+qugb6RkAckT9D86y9WoiRbzc3eba2Aa68edKz72T3fEaHNo29z8sIGJrkoMXdv4C/EeByC3ay7c6pGeBlOypIwzrIsbJcJwmflIDI683VqZdEgQQd2v4rMOXjyudP17OvGMJs6LvFuDYsxsdZgkG1ttzBp6WBsL9hqP8gDCJp7Z2nTuXBHElwYWrrJPcvGzE6mcWv4yPBGCk1KypUlM0dg2nAST9Ymts2yMewcL454jDigBKjsFosJHakPLvaltgPb+wufkUfZw41+qz0l0YWnIzRmMBu31/Q6X4aFt/c6j/4i0Ca3tFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWT6UGAPOszkMvoYNok/rOXyCJaWT9vnw+f2n1I1Lnk=;
 b=NSV/oRgxtqBDBKNIYFYJt8iHX+W+Ruods1PDa4qq3Nvolx733+cUBcqJCFqFcmMz2Yq58lFmWtAxiGgTQPA2n1Q38v+BQei7cHKkGxWbC7ypQBt26BIfxP8xsdzxe+MgmY2h4z4hvuTnpRQ3d4a7DuPqmZ4DivYslILPRS9hNSkdrf3Z9gR3sra4q/ppzG2sHI6OysVYHq/afLVEHpopVzpr1fXqFP3jwMEwLCa5ZbTo3TlgEkkYyOuwLSDVkCEukBABuJqQcq+0YFIynyHMHohQJgvNsch3Syc1VWOTfKcCrkX6g7tnS13d+iByIwvlU9QqBWmwfsv6Zz42kggDeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3120.namprd12.prod.outlook.com (20.178.243.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Fri, 30 Aug 2019 02:11:54 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 02:11:54 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Liu, Aaron" <Aaron.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH V2] drm/amd/powerplay: SMU_MSG_OverridePcieParameters is
 unsupport for APU
Thread-Topic: [PATCH V2] drm/amd/powerplay: SMU_MSG_OverridePcieParameters is
 unsupport for APU
Thread-Index: AQHVXtgmDQyPlt/TuEWxbnEBTQ0xOKcS8rSw
Date: Fri, 30 Aug 2019 02:11:54 +0000
Message-ID: <MN2PR12MB334467454DF871D12B7A4E5AE4BD0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1567131024-7241-1-git-send-email-aaron.liu@amd.com>
In-Reply-To: <1567131024-7241-1-git-send-email-aaron.liu@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41c42b3a-72b7-4722-b5e9-08d72cef6dad
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3120; 
x-ms-traffictypediagnostic: MN2PR12MB3120:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3120C7309D93BE6D990282F8E4BD0@MN2PR12MB3120.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:480;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(13464003)(189003)(199004)(2906002)(86362001)(81166006)(71190400001)(71200400001)(6506007)(486006)(54906003)(53936002)(81156014)(74316002)(25786009)(7696005)(316002)(6306002)(52536014)(3846002)(55016002)(5660300002)(33656002)(14454004)(99286004)(11346002)(229853002)(26005)(476003)(6246003)(2501003)(4326008)(76176011)(102836004)(9686003)(305945005)(66066001)(7736002)(478600001)(8936002)(256004)(186003)(76116006)(64756008)(110136005)(8676002)(66556008)(66446008)(966005)(66946007)(53546011)(6116002)(6436002)(66476007)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3120;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q3i3y2bHtRoN/Ge/ckatNw1TN/Qf1rrJ7w9YPdOv+gctfkl+Y8Myc5xIcodbZJR3bIT/VJ0VE48xN55DHEC1dp9+KsxvjQBGDtAifHnnn4vBmFo5BtJOVYhnOMsYhOr/TQ1fUnaKqqerO4316lhZYoFw+E5B2ouldLhDdJBBej7m9maMLRYFHBjLZDmrCR7R+j75rRR8+kt1mDi36lQyv92dPBDXNDTX6HmWdQnJKLQFlm5F7uYY4E6bs+TnLomN7lc/ugJbuxqsAR3WueWOjARCoDEvmmKNy23PfTOJuvc6iTpn5v1RyPfhV6avYUt7o+5fv3FZjBFpon6KUhLJOcPjDItGOl06v1b3vGgVKz5eWjHF8Hj/HDXsoCmLkHXEwZxt1kdUhXWui3KkYbLFc2jhjvjRRREkFN4qqwkxyAI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c42b3a-72b7-4722-b5e9-08d72cef6dad
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 02:11:54.3732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1BGa+kjvPSKvZ4cf0hFErEMjXX0H9kzj3UsQNCKE/px80bteO0bFD7T4+FrMMFo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3120
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWT6UGAPOszkMvoYNok/rOXyCJaWT9vnw+f2n1I1Lnk=;
 b=bSKwWVBe6im7iuHGPY3l8sHIRRchA0S43NvJ0ccVO0pr7orGIwAQ98NkdC/KLg3w0CGsmXWdMqLSzb5treC5p4oyZqrtOTn1BDusz3xG/3pUvQQNzRbclzYeOjjL30j/TZJFqnogBwtgF4j4OiTNug8DNnHemf2bJq7YlDx6IfY=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQWFyb24gTGl1DQpTZW50OiBGcmlkYXksIEF1Z3Vz
dCAzMCwgMjAxOSAxMDoxMCBBTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpD
YzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgSHVhbmcs
IFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBMaXUsIEFhcm9uIDxBYXJvbi5MaXVAYW1kLmNvbT4N
ClN1YmplY3Q6IFtQQVRDSCBWMl0gZHJtL2FtZC9wb3dlcnBsYXk6IFNNVV9NU0dfT3ZlcnJpZGVQ
Y2llUGFyYW1ldGVycyBpcyB1bnN1cHBvcnQgZm9yIEFQVQ0KDQpGb3IgYXB1LCBTTVVfTVNHX092
ZXJyaWRlUGNpZVBhcmFtZXRlcnMgaXMgdW5zdXBwb3J0Lg0KU28gcmV0dXJuIGRpcmVjdGx5IGlu
IHNtdV9vdmVycmlkZV9wY2llX3BhcmFtZXRlcnMgZnVuY3Rpb24uDQoNClNpZ25lZC1vZmYtYnk6
IEFhcm9uIExpdSA8YWFyb24ubGl1QGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hbWRncHVfc211LmMgfCAzICsrKw0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0K
aW5kZXggOGM2MTc3OC4uYjcyNjU2NSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYW1kZ3B1X3NtdS5jDQpAQCAtMTAwMSw2ICsxMDAxLDkgQEAgc3RhdGljIGludCBzbXVfb3Zl
cnJpZGVfcGNpZV9wYXJhbWV0ZXJzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQ0KIAl1aW50MzJf
dCBwY2llX2dlbiA9IDAsIHBjaWVfd2lkdGggPSAwLCBzbXVfcGNpZV9hcmc7DQogCWludCByZXQ7
DQogDQorCWlmIChhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpDQorCQlyZXR1cm4gMDsNCisNCiAJ
aWYgKGFkZXYtPnBtLnBjaWVfZ2VuX21hc2sgJiBDQUlMX1BDSUVfTElOS19TUEVFRF9TVVBQT1JU
X0dFTjQpDQogCQlwY2llX2dlbiA9IDM7DQogCWVsc2UgaWYgKGFkZXYtPnBtLnBjaWVfZ2VuX21h
c2sgJiBDQUlMX1BDSUVfTElOS19TUEVFRF9TVVBQT1JUX0dFTjMpDQotLSANCjIuNy40DQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1h
aWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
