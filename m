Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5DDD727F
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 11:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0606E7A0;
	Tue, 15 Oct 2019 09:50:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720052.outbound.protection.outlook.com [40.107.72.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0CC6E7A3
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 09:50:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9YSbIcyheyNr+3SIN4N5GjxrNO2d17VLqlR2eF1IZ5GyUIrUpIsaVnIbjn3XY+iM/dFnpjDvsPAS9xLMA24nKiRwiNuKBZqRJoFo51ZC7Iid09gFhDbzjqaSvR1PwwjoAbck84HR8Col1h1Eejp3lkh6Lu5Xy8Hc8UNwUUE2rYBaQrCVKgWTy02TE4e8xQc0ncbu6aSBp909P1yyGoT+ZN4yaTi3nZwSx9e2PfYLtNw2pmqcFyDQGt9fXp0FR2ytjFMv7ySnpKg1XfUBdVqncCE1U7UCpqVy5bkcHZH5hofoeWDgEBWZJiQvYXjZYCWTUGXFsxxZmErFislICrNnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+ehSrW1a72wpEwWTGINosejDhxglNyCW+USiLjOSpA=;
 b=AXFguVq2v+S4Nm+dDGeRLCt68CN5IoQRZ5+0zks/Jeg9YOwO2A11BiJA+7eTBrWNcidfBhlulqG4MfcKQ4OWZqgwSBZUVZb0Pu1utzLGoSXJ3HHeItTPeDorUTcKnkV//4R0YYAqlgIu8joKHUS8a4E2ymMenadcooNdrvpeqRsXzHN3Q3O9ql80ueFBS+S2kMR0SCTB+bk/LEyYiMmaaYoTLxL871Kzw3+HwSISNa0hh/JMdEHjQzORygVbHkZrmvTvBy40Nsp0AFcmU/jh+JE6Ck6Fp1Qr73AonrzOLAtgX5HeRgBHK1LGCaBppKQ4DhrOeJ0aIc+D+gUBJs59cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3613.namprd12.prod.outlook.com (20.178.240.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Tue, 15 Oct 2019 09:50:21 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::9d94:f2eb:23ce:2ec3]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::9d94:f2eb:23ce:2ec3%5]) with mapi id 15.20.2347.021; Tue, 15 Oct 2019
 09:50:21 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: add GFX_PIPELINE capacity check for updating
 gfx cgpg
Thread-Topic: [PATCH 1/2] drm/amdgpu: add GFX_PIPELINE capacity check for
 updating gfx cgpg
Thread-Index: AQHVgz318e4aF3za/0uRK0h+sFXqKw==
Date: Tue, 15 Oct 2019 09:50:21 +0000
Message-ID: <1571133012-19837-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::20) To MN2PR12MB3536.namprd12.prod.outlook.com
 (2603:10b6:208:104::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 422fbeac-281c-4d71-c55d-08d7515517eb
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3613:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3613FDF212C6BEDA6C9B7D45FB930@MN2PR12MB3613.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:813;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(199004)(189003)(64756008)(66946007)(305945005)(2906002)(36756003)(6116002)(6916009)(26005)(2351001)(6436002)(478600001)(5660300002)(6506007)(386003)(102836004)(4744005)(66446008)(66476007)(52116002)(66556008)(7736002)(6486002)(3846002)(186003)(66066001)(71190400001)(71200400001)(99286004)(14454004)(2501003)(2616005)(486006)(6512007)(4326008)(5640700003)(476003)(81166006)(8676002)(81156014)(50226002)(316002)(25786009)(14444005)(86362001)(54906003)(256004)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3613;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MklJn8lgE0iSNi/SQXUmn9fOi/T5bfgWXLqt4PDPxPyzZCqLdjYGLGpseu/ZLX/MkanTFkKdzDJ9oVkL58O0VIQBE879df5K7jWah1zOsMglB47k4HNOggyvOaI1OTE3UyR7LASFhScHEJVmxaBHeGM6Bsq1xW06wtdyhzEeOa+vzGTEjrZDcHSRCbzU5YTmUaWvZiQH1pbXUFHzJYaD1hWCh9b0WgW6He3NQnlFPotZ8T/vVfsvHIx0B+hLXLIFej2F1SZn3Dd3oM2Jyd8BkZ97pvnBKLFUKQ42zh69Y1Vqs4b6AD5CDWaemrEnCMAyG3WH+ulTf5o4D3uaAbxhZZr/47rRrWtGf6nrx+a62y3eWhxFukM8NfoWfTdJbyMxmR7NlavnTejZ5MdHJBXOqM80VIa6kd9IjL3IAdLnb0E=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422fbeac-281c-4d71-c55d-08d7515517eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 09:50:21.6429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SINQITSeCaISbu4GqKRSPhXZ11lkWRUhKcSr17abJuD22DpWTqoQ67eL107V8Foe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3613
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+ehSrW1a72wpEwWTGINosejDhxglNyCW+USiLjOSpA=;
 b=FBUWiPf0JsQgdE8llY/w4mbDAXTT6cByAXqHSZ64uKN00XO8cvZJrRmoPuAkK4LU1EEar4ek8fnokf/l2U4iqXjCAUbBaQz4Yol+AGdlHPgPApM2xWhGccjwm1vaHS6rXYMylANC2VZCiRqB6+fUzwoVJfW4GuqH+PS6aAZSTN0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Liang, Prike" <Prike.Liang@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QmVmb3JlIGRpc2FibGUgZ2Z4IHBpcGVsaW5lIHBvd2VyIGdhdGluZyBuZWVkIGNoZWNrIHRoZSBm
bGFnIEFNRF9QR19TVVBQT1JUX0dGWF9QSVBFTElORS4KClNpZ25lZC1vZmYtYnk6IFByaWtlIExp
YW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92OV8wLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IGI1Nzdi
NjkuLmRlOGY5ZDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwpAQCAtNDI5
Niw3ICs0Mjk2LDggQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfdXBkYXRlX2dmeF9jZ19wb3dlcl9n
YXRpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQlnZnhfdjlfMF9lbmFibGVfZ2Z4
X3BpcGVsaW5lX3Bvd2VyZ2F0aW5nKGFkZXYsIHRydWUpOwogCX0gZWxzZSB7CiAJCWdmeF92OV8w
X2VuYWJsZV9nZnhfY2dfcG93ZXJfZ2F0aW5nKGFkZXYsIGZhbHNlKTsKLQkJZ2Z4X3Y5XzBfZW5h
YmxlX2dmeF9waXBlbGluZV9wb3dlcmdhdGluZyhhZGV2LCBmYWxzZSk7CisJCWlmIChhZGV2LT5w
Z19mbGFncyAmIEFNRF9QR19TVVBQT1JUX0dGWF9QSVBFTElORSkKKwkJCWdmeF92OV8wX2VuYWJs
ZV9nZnhfcGlwZWxpbmVfcG93ZXJnYXRpbmcoYWRldiwgZmFsc2UpOwogCX0KIAogCWFtZGdwdV9n
ZnhfcmxjX2V4aXRfc2FmZV9tb2RlKGFkZXYpOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
