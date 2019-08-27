Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA109E2C3
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 10:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4AB88FA0;
	Tue, 27 Aug 2019 08:34:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770058.outbound.protection.outlook.com [40.107.77.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE5788FA0
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 08:34:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUO7bXlNCxacOZHUTwFW7pNMrCpOtbZ0lxmmgasIi4DYSgAIsYKvjr9aa0vJzo1WCUho+9qRocmCbmLgp2gTgqe1dMiR37M/0HddsmpGa6q9HW52+dWmdiQslPN4tnWuRcpdSkuZkiZm0g4d35fnXJE6ndwrMf74pbW11DwQLtu36S+opmWIrTdHSPCR9azEYOHRWTFxouoUI+LJKT6XPzlpkodoOeFQGgl/U9T24qGPd8YZOaxximFW5zUAKEl7p2HHeAS1LsR6X3vdOZa7etk4Ao2kNw+f5IsPJ9Z14FUZTwhqPkkehvnqdQJW9DEYERBp13vkKhNWf9FBwR7xug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJfkaPek3u1cDe9Ny3UYIOVthqt4bGWGcI7dAualmCM=;
 b=Vr1yu4edvTo2rDY/15Bo8Ultvtd7UXwflTat9RU0o7fw9ExIYukxs8Ap+Sf+WLaLZO0YpEbLXDQwD5Y4CiiUC74/bxFQrD5d0Zr3VdEQkm1K206Gf0Oo97rFMILYOx/HxXPilzx/wQkzaAH/gEDlfJ1IVwk3tpxW1y5i6/4s4ywrCYddzMq+dZGxKIj8bR904n6MpFuTtqixx9u0GiWnfWeIXi6UKq+K1PY/i1OOh0dN97GOF2Ow750EAoxC0SURrV2b74yndR9KLfV9uKb/4JshbHz8TGMN+l69BNl/6v8DrvbdvMKxPYB06707YJW4U1f0sGXzA1zg8NBYjudPmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0014.namprd12.prod.outlook.com (2603:10b6:5:1c0::27)
 by DM5PR12MB1530.namprd12.prod.outlook.com (2603:10b6:4:4::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Tue, 27 Aug 2019 08:34:38 +0000
Received: from DM3NAM03FT034.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by DM6PR12CA0014.outlook.office365.com
 (2603:10b6:5:1c0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.20 via Frontend
 Transport; Tue, 27 Aug 2019 08:34:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT034.mail.protection.outlook.com (10.152.82.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 27 Aug 2019 08:34:38 +0000
Received: from monk-build.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 27 Aug 2019
 03:34:37 -0500
From: Monk Liu <Monk.Liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: introduce vram lost for reset
Date: Tue, 27 Aug 2019 16:34:33 +0800
Message-ID: <1566894873-11178-1-git-send-email-Monk.Liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(2980300002)(428003)(199004)(189003)(36756003)(86362001)(81166006)(50466002)(486006)(50226002)(81156014)(316002)(7696005)(51416003)(336012)(48376002)(53936002)(2616005)(5660300002)(6916009)(126002)(2351001)(53416004)(476003)(47776003)(305945005)(4326008)(478600001)(186003)(8936002)(356004)(6666004)(8676002)(16586007)(70586007)(70206006)(26005)(426003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1530; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bc0ea57-edce-474e-54c7-08d72ac96625
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR12MB1530; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1530:
X-Microsoft-Antispam-PRVS: <DM5PR12MB15303120B6018C9B635DD57884A00@DM5PR12MB1530.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0142F22657
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: O8tn8C6PZDZ20DTgOcjNZ5aGdMp8V2HM8PKR0JfLtRgdVjw5sg1Uhqcs3ky2tIXt1pWl7iD3KFcFdj3SqAdXXbVEwLurGHgbeR03aSO0iwe1uynyPD/sbJ2nJ6j6+52CL2NetuUyxEGDRgI/L/aks2y+YRmEtdYrqrCQ21tdj5XYXKbO8yZabqBI12ST4ACSfx/FWAhCkrfwbULjcKbXC56cETMkvT1KFwKel6ecilcyZJ8vdrGNAICLzULbosafPvvSnC5TRe1DYl5N8za1GzkAvj4rmTQDh/sNtnr7kSIL8Zs8zBE4P0bCKprKxf9P1qaWw7OzdLZ+TtR/TF5y/5ELHyNcqfBr/SDDXKIVDVv8w/ECt/ViX2+cHyovFLdw+tW0W+0Deac6RQmEgH6XJi9KM9+DbO2RD9AMsS3EzAw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2019 08:34:38.5779 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc0ea57-edce-474e-54c7-08d72ac96625
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1530
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJfkaPek3u1cDe9Ny3UYIOVthqt4bGWGcI7dAualmCM=;
 b=G9yJNnKEB02agCCGPpgZtF2Ijo8Daj8RQtsR44oyhhkJdwS/gRb9PHHk2RQyukrZq6211BnOE7fFzh8Eywc+EhN9G0EBfYSzo8gUfKxma3QAJ81h6tbnYPdmEnNjuBeJ2dTwQx0H/RbftSbQ8gj78fPPim8pwg0LBGNDNvqV0gY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Monk Liu <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Zm9yIFNPQzE1L3ZlZ2ExMCB0aGUgQkFDTyByZXNldCAmIG1vZGUxIHdvdWxkIGludHJvZHVjZSB2
cmFtIGxvc3QKaW4gaGlnaCBlbmQgYWRkcmVzcyByYW5nZSwgY3VycmVudCBrbWQncyB2cmFtIGxv
c3QgY2hlY2tpbmcgY2Fubm90CmNhdGNoIGl0IHNpbmNlIGl0IG9ubHkgY2hlY2sgdmVyeSBhaGVh
ZCB2aXNpYmxlIGZyYW1lIGJ1ZmZlcgoKU2lnbmVkLW9mZi1ieTogTW9uayBMaXUgPE1vbmsuTGl1
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAgICAg
IHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA0ICsr
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgICAgICAgICB8IDIgKysKIDMg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1LmgKaW5kZXggZjZhZTU2NS4uMTFlMGZjMCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1LmgKQEAgLTExNTUsNiArMTE1NSw3IEBAIGludCBlbXVfc29jX2Fz
aWNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiAjZGVmaW5lIGFtZGdwdV9hc2lj
X2dldF9wY2llX3VzYWdlKGFkZXYsIGNudDAsIGNudDEpICgoYWRldiktPmFzaWNfZnVuY3MtPmdl
dF9wY2llX3VzYWdlKChhZGV2KSwgKGNudDApLCAoY250MSkpKQogI2RlZmluZSBhbWRncHVfYXNp
Y19uZWVkX3Jlc2V0X29uX2luaXQoYWRldikgKGFkZXYpLT5hc2ljX2Z1bmNzLT5uZWVkX3Jlc2V0
X29uX2luaXQoKGFkZXYpKQogI2RlZmluZSBhbWRncHVfYXNpY19nZXRfcGNpZV9yZXBsYXlfY291
bnQoYWRldikgKChhZGV2KS0+YXNpY19mdW5jcy0+Z2V0X3BjaWVfcmVwbGF5X2NvdW50KChhZGV2
KSkpCisjZGVmaW5lIGFtZGdwdV9pbmNfdnJhbV9sb3N0KGFkZXYpIGF0b21pY19pbmMoJigoYWRl
diktPnZyYW1fbG9zdF9jb3VudGVyKSk7CiAKIC8qIENvbW1vbiBmdW5jdGlvbnMgKi8KIGJvb2wg
YW1kZ3B1X2RldmljZV9zaG91bGRfcmVjb3Zlcl9ncHUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IDAy
YjNlN2QuLjMxNjkwZTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMKQEAgLTM0ODIsNyArMzQ4Miw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9yZXNl
dF9zcmlvdihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAlhbWRncHVfdmlydF9pbml0X2Rh
dGFfZXhjaGFuZ2UoYWRldik7CiAJYW1kZ3B1X3ZpcnRfcmVsZWFzZV9mdWxsX2dwdShhZGV2LCB0
cnVlKTsKIAlpZiAoIXIgJiYgYWRldi0+dmlydC5naW1fZmVhdHVyZSAmIEFNREdJTV9GRUFUVVJF
X0dJTV9GTFJfVlJBTUxPU1QpIHsKLQkJYXRvbWljX2luYygmYWRldi0+dnJhbV9sb3N0X2NvdW50
ZXIpOworCQlhbWRncHVfaW5jX3ZyYW1fbG9zdChhZGV2KTsKIAkJciA9IGFtZGdwdV9kZXZpY2Vf
cmVjb3Zlcl92cmFtKGFkZXYpOwogCX0KIApAQCAtMzY0OCw3ICszNjQ4LDcgQEAgc3RhdGljIGlu
dCBhbWRncHVfZG9fYXNpY19yZXNldChzdHJ1Y3QgYW1kZ3B1X2hpdmVfaW5mbyAqaGl2ZSwKIAkJ
CQl2cmFtX2xvc3QgPSBhbWRncHVfZGV2aWNlX2NoZWNrX3ZyYW1fbG9zdCh0bXBfYWRldik7CiAJ
CQkJaWYgKHZyYW1fbG9zdCkgewogCQkJCQlEUk1fSU5GTygiVlJBTSBpcyBsb3N0IGR1ZSB0byBH
UFUgcmVzZXQhXG4iKTsKLQkJCQkJYXRvbWljX2luYygmdG1wX2FkZXYtPnZyYW1fbG9zdF9jb3Vu
dGVyKTsKKwkJCQkJYW1kZ3B1X2luY192cmFtX2xvc3QodG1wX2FkZXYpOwogCQkJCX0KIAogCQkJ
CXIgPSBhbWRncHVfZ3R0X21ncl9yZWNvdmVyKApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMK
aW5kZXggZmUyMjEyZGYuLjhhZjc1MDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NvYzE1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpA
QCAtNTU3LDEwICs1NTcsMTIgQEAgc3RhdGljIGludCBzb2MxNV9hc2ljX3Jlc2V0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogewogCXN3aXRjaCAoc29jMTVfYXNpY19yZXNldF9tZXRob2Qo
YWRldikpIHsKIAkJY2FzZSBBTURfUkVTRVRfTUVUSE9EX0JBQ086CisJCQlhbWRncHVfaW5jX3Zy
YW1fbG9zdChhZGV2KTsKIAkJCXJldHVybiBzb2MxNV9hc2ljX2JhY29fcmVzZXQoYWRldik7CiAJ
CWNhc2UgQU1EX1JFU0VUX01FVEhPRF9NT0RFMjoKIAkJCXJldHVybiBzb2MxNV9tb2RlMl9yZXNl
dChhZGV2KTsKIAkJZGVmYXVsdDoKKwkJCWFtZGdwdV9pbmNfdnJhbV9sb3N0KGFkZXYpOwogCQkJ
cmV0dXJuIHNvYzE1X2FzaWNfbW9kZTFfcmVzZXQoYWRldik7CiAJfQogfQotLSAKMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
