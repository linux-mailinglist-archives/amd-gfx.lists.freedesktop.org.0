Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4B7B14BA
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 21:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946836EE07;
	Thu, 12 Sep 2019 19:13:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700051.outbound.protection.outlook.com [40.107.70.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F21D6EE07
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 19:13:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNZ/xTseybsHxRdTGtR52pDVCnG/vTFxYwpSZb3bcDpLloW2S0tAu9knyO8jzoZlJWqIX5yb7JL7LBuuLM6qh/fbefEuidLQ/8n+FHC2bB/T4tyC/7ALEx+9+k8Q6wcRMxasfAsU4Yv6ul2+dXTC414oIJAvz/ZK3FDmJbfIARVJWjbMhquFbL7xNUIQ0D+fRuGTOOkUl7g1sfhwNxC8s1uZ+/xvCCeYw05977j0pcEaoSkum9tPJ48/8xayNRWpdH40RRJa4nmmCxULlKyUmHYEwWPVXlZQHLjxKFlo0unqCDfl1zRuMXDJzWQwmC2HNg/nfNU+wz67lq1q+A1Oeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zKjv8hwypuozqu8TjwJixyTDDfO3vplEopxJy9SG00=;
 b=FKORgmXhrqCiK/Hipx0Z2znQRf3ji/udhJTm6IOuka2wvZ03uf54LnOGEERU0Yuz/mYlZFgGfQcCBJ6hI3ZDxfii5y51z8PYn6tnaczrDrAnEVczqEOqe0s0YGoZTst0BgZUuCiXiYNKz4R7GVG2bIL2iBESEDBA9qNuQUqrKcPFMGMyzouxTT+iHH8jSHDQitLUVqDJyCPWusNSF7Z7A8EXXDoDxnm0Sz5jm10kLw5cBNa46ApjOlW0cEbWjsGcwY5OSlI1g+KjLVw7W/pfsz9kQyVooa79ij6hn4CR1OGA37xU99/RqsEpkk1lG4RCIalq/MB2viIQ/WTEo5cctw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3305.namprd12.prod.outlook.com (20.179.106.93) by
 DM6PR12MB3033.namprd12.prod.outlook.com (20.178.30.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Thu, 12 Sep 2019 19:13:01 +0000
Received: from DM6PR12MB3305.namprd12.prod.outlook.com
 ([fe80::f8f5:d12e:b532:da22]) by DM6PR12MB3305.namprd12.prod.outlook.com
 ([fe80::f8f5:d12e:b532:da22%6]) with mapi id 15.20.2241.022; Thu, 12 Sep 2019
 19:13:01 +0000
From: "Cornwall, Jay" <Jay.Cornwall@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: Swap trap temporary registers in gfx10 trap
 handler
Thread-Topic: [PATCH] drm/amdkfd: Swap trap temporary registers in gfx10 trap
 handler
Thread-Index: AQHVaZ4YtgmEUPuUwUymL939T39xOw==
Date: Thu, 12 Sep 2019 19:13:00 +0000
Message-ID: <1568315563-26870-1-git-send-email-jay.cornwall@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.78.1]
x-clientproxiedby: SN6PR04CA0043.namprd04.prod.outlook.com
 (2603:10b6:805:2a::20) To DM6PR12MB3305.namprd12.prod.outlook.com
 (2603:10b6:5:189::29)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2798dc8-2a36-40ca-9fac-08d737b53a5b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3033; 
x-ms-traffictypediagnostic: DM6PR12MB3033:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB30333079C8E4786936E3BB8D87B00@DM6PR12MB3033.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:245;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(199004)(189003)(7736002)(478600001)(66946007)(66476007)(386003)(6506007)(2906002)(99286004)(66446008)(66556008)(36756003)(186003)(66066001)(71190400001)(71200400001)(64756008)(102836004)(26005)(2616005)(52116002)(476003)(316002)(3846002)(6486002)(6116002)(6916009)(6436002)(5640700003)(256004)(53936002)(2501003)(5660300002)(486006)(25786009)(4326008)(2351001)(81156014)(50226002)(8676002)(81166006)(8936002)(6512007)(14454004)(305945005)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3033;
 H:DM6PR12MB3305.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fY9nIk7sbXbFHelNggfBznuGQ9EqYzuqvkxsNhoSFSWS/+W8PZeCf4eIrHw75qz1FY5mFABAS3pREOty2lbzDvR3SzYwssjvJPbOuAkEmmo3ba4yqveJ202wSlx87FhyvDYZrmdlo/m7ky8cYKQLwpvrdVoS6SJZsTewuP4fmAdEK+5PccJgkT6STgO5U4IPfQozqIUQM7bwh05dB5Gs1P9zYCv4UXmdhLNiMk6o9EUAdioaIyUuLTTjHEFnqD5xQQ7B6aFU/PoybFH5KHQ5XiqWb2X8HbJok1Bx+qjxk34QRQYOp0wVWteJTrf2fW96kQyBtyqHrzWvtBPlHa4OHW72cmyG0Ifk3qWy89w6JyfCS5Zx8rLmN0aXQM5+CuoF6eG3HHwMEj3MFLYE7wCSkZfYsIcna+QImjrFPxmF8X0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2798dc8-2a36-40ca-9fac-08d737b53a5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 19:13:00.9512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O6pnPN5Iiwq8OOrzYFhsfk5VuI5j/zOYZFis2aQAxkhzMPj/vZi3e/95bLOtptstrrLfkdzSIPIDk/D+ChyGQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3033
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zKjv8hwypuozqu8TjwJixyTDDfO3vplEopxJy9SG00=;
 b=MHRZCP2gAXcYsTbSS15YQ88Qb1jRFhU1xhGLiNA/yT96RpLiBq2wWJSEi/meGwRwdT62FCvFhsxil7AAWvGQHFdCSMi0ZDjZdxdA36ldJE0mOhtcx5LjdlHpgl94Uhs2MLMmI2NQuDkQ87tgRCbavw15q50MGVWKSyNWhtjIHeo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jay.Cornwall@amd.com; 
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
Cc: "Cornwall, Jay" <Jay.Cornwall@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dHRtcFs0OjVdIGhvbGQgaW5mb3JtYXRpb24gdXNlZnVsIHRvIHRoZSBkZWJ1Z2dlci4gVXNlIHR0
bXBbMTQ6MTVdCmluc3RlYWQsIGFsaWduaW5nIGltcGxlbWVudGF0aW9uIHdpdGggZ2Z4OSB0cmFw
IGhhbmRsZXIuCgpTaWduZWQtb2ZmLWJ5OiBKYXkgQ29ybndhbGwgPGpheS5jb3Jud2FsbEBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyLmgg
ICAgICAgICB8ICA2ICsrKy0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQvY3dzcl90cmFw
X2hhbmRsZXJfZ2Z4MTAuYXNtIHwgMTAgKysrKystLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQvY3dzcl90cmFwX2hhbmRsZXIuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2N3c3JfdHJhcF9oYW5kbGVyLmgKaW5kZXggYThjZjgyZC4uOTAxZmUzNSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQvY3dzcl90cmFwX2hhbmRsZXIuaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9jd3NyX3RyYXBfaGFuZGxlci5oCkBAIC02OTQsMTAg
KzY5NCwxMCBAQCBzdGF0aWMgY29uc3QgdWludDMyX3QgY3dzcl90cmFwX2dmeDEwX2hleFtdID0g
ewogCTB4MDAzZjgwMDAsIDB4OGY2Zjg5NmYsCiAJMHg4ODc3NmY3NywgMHg4YTZlZmY2ZSwKIAkw
eDAyM2Y4MDAwLCAweGI5ZWVmODA3LAotCTB4Yjk3MGY4MTIsIDB4Yjk3MWY4MTMsCi0JMHg4ZmYw
ODg3MCwgMHhmNDA1MWJiOCwKKwkweGI5N2FmODEyLCAweGI5N2JmODEzLAorCTB4OGZmYTg4N2Es
IDB4ZjQwNTFiYmQsCiAJMHhmYTAwMDAwMCwgMHhiZjhjYzA3ZiwKLQkweGY0MDUxYzM4LCAweGZh
MDAwMDA4LAorCTB4ZjQwNTFlYmQsIDB4ZmEwMDAwMDgsCiAJMHhiZjhjYzA3ZiwgMHg4N2VlNmU2
ZSwKIAkweGJmODQwMDAxLCAweGJlODAyMDZlLAogCTB4Yjk3MWY4MDMsIDB4ODc3MWZmNzEsCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9jd3NyX3RyYXBfaGFuZGxlcl9n
ZngxMC5hc20gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9jd3NyX3RyYXBfaGFuZGxlcl9n
ZngxMC5hc20KaW5kZXggMzU5ODYyMS4uY2RhYTUyMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQvY3dzcl90cmFwX2hhbmRsZXJfZ2Z4MTAuYXNtCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyX2dmeDEwLmFzbQpAQCAtMTg3LDEy
ICsxODcsMTIgQEAgTF9GRVRDSF8yTkRfVFJBUDoKIAkvLyBSZWFkIHNlY29uZC1sZXZlbCBUQkEv
VE1BIGZyb20gZmlyc3QtbGV2ZWwgVE1BIGFuZCBqdW1wIGlmIGF2YWlsYWJsZS4KIAkvLyB0dG1w
WzI6NV0gYW5kIHR0bXAxMiBjYW4gYmUgdXNlZCAob3RoZXJzIGhvbGQgU1BJLWluaXRpYWxpemVk
IGRlYnVnIGRhdGEpCiAJLy8gdHRtcDEyIGhvbGRzIFNRX1dBVkVfU1RBVFVTCi0Jc19nZXRyZWdf
YjMyCXR0bXA0LCBod3JlZyhIV19SRUdfU0hBREVSX1RNQV9MTykKLQlzX2dldHJlZ19iMzIJdHRt
cDUsIGh3cmVnKEhXX1JFR19TSEFERVJfVE1BX0hJKQotCXNfbHNobF9iNjQJW3R0bXA0LCB0dG1w
NV0sIFt0dG1wNCwgdHRtcDVdLCAweDgKLQlzX2xvYWRfZHdvcmR4MglbdHRtcDIsIHR0bXAzXSwg
W3R0bXA0LCB0dG1wNV0sIDB4MCBnbGM6MQkJLy8gc2Vjb25kLWxldmVsIFRCQQorCXNfZ2V0cmVn
X2IzMgl0dG1wMTQsIGh3cmVnKEhXX1JFR19TSEFERVJfVE1BX0xPKQorCXNfZ2V0cmVnX2IzMgl0
dG1wMTUsIGh3cmVnKEhXX1JFR19TSEFERVJfVE1BX0hJKQorCXNfbHNobF9iNjQJW3R0bXAxNCwg
dHRtcDE1XSwgW3R0bXAxNCwgdHRtcDE1XSwgMHg4CisJc19sb2FkX2R3b3JkeDIJW3R0bXAyLCB0
dG1wM10sIFt0dG1wMTQsIHR0bXAxNV0sIDB4MCBnbGM6MQkJLy8gc2Vjb25kLWxldmVsIFRCQQog
CXNfd2FpdGNudAlsZ2ttY250KDApCi0Jc19sb2FkX2R3b3JkeDIJW3R0bXA0LCB0dG1wNV0sIFt0
dG1wNCwgdHRtcDVdLCAweDggZ2xjOjEJCS8vIHNlY29uZC1sZXZlbCBUTUEKKwlzX2xvYWRfZHdv
cmR4MglbdHRtcDE0LCB0dG1wMTVdLCBbdHRtcDE0LCB0dG1wMTVdLCAweDggZ2xjOjEJCS8vIHNl
Y29uZC1sZXZlbCBUTUEKIAlzX3dhaXRjbnQJbGdrbWNudCgwKQogCXNfYW5kX2I2NAlbdHRtcDIs
IHR0bXAzXSwgW3R0bXAyLCB0dG1wM10sIFt0dG1wMiwgdHRtcDNdCiAJc19jYnJhbmNoX3NjYzAJ
TF9OT19ORVhUX1RSQVAJCQkJCQkvLyBzZWNvbmQtbGV2ZWwgdHJhcCBoYW5kbGVyIG5vdCBiZWVu
IHNldAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
