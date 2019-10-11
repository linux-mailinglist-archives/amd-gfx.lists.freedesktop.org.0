Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B5FD380D
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 05:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F476EB97;
	Fri, 11 Oct 2019 03:51:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690083.outbound.protection.outlook.com [40.107.69.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DD16EB97
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 03:51:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkFEImctic39HGtq6uoj+5snYNZRTQN/d+Nm1odhevzHf7torv/1N6rTSGBtPUt2ZuyCk7iqHwWqI/pc0VRYuEruSzTyxWT/LKRlwcz0RYNfRggD6uENYehFl13pt0Me+QqIUlXHCTMC2vsoQ4NqaWEHSvYBXGr5XuO1vBgT9RA13SMurdHktyC9V5cxQsVgcGHH5MgO3mAqKd+ibSAcuvuzN/mnkkVt8XVpnSL+JbGM3KmkI5UFRvcumV4ZdxRc1Zx8AWZO8LxCKLm+57cKlUG+N6wFdPQ+z/HpUGeHxHhRDCITM9+CHvrW/C9eSPeWY6zyZveBbF0bgFmQGOCezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXcLQ8IsjJ3Yds7bRUgKakxvJD9OSdVK01wqRQJII8o=;
 b=LHMSaRkrkbeIYlmtM+XwphneHJuN7NQ22Idee4BXmzMGfUTa+2hwF0fSYPS16ygdwCrjcwsT461JZge/S2PfLVOQCYIUSDwpDWrvHWpyMylSzPNQI3aA+c8HMVpGOrA/toLTFs0o7BOwHzyKlND4A+BTmLHbcfht3f7PICzWkKmboa/l7ARNA6X6/zFtVdDZ5+dSHuRcALdcbbj5V0AVQij5vVfynDkEwbMaoCXZ36lvQk1PJHYk1erVVUSWJyDQBlNDP1T6syInR6qdj8JF2F+sTvaHCF9OcoEcm6oJweZRS+8ca/fDFSON+NxsaCfR93WJ1kDBdxG8XFEjiZqxPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0006.namprd12.prod.outlook.com
 (2603:10b6:405:4c::16) by MN2PR12MB3246.namprd12.prod.outlook.com
 (2603:10b6:208:af::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 03:51:05 +0000
Received: from BY2NAM03FT033.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by BN6PR1201CA0006.outlook.office365.com
 (2603:10b6:405:4c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17 via Frontend
 Transport; Fri, 11 Oct 2019 03:51:05 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT033.mail.protection.outlook.com (10.152.84.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 11 Oct 2019 03:51:05 +0000
Received: from rico-code.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 10 Oct 2019
 22:51:03 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 6/8] drm/amdgpu: add psp memory training callbacks and macro
Date: Fri, 11 Oct 2019 11:50:31 +0800
Message-ID: <20191011035033.24935-6-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011035033.24935-1-tianci.yin@amd.com>
References: <20191011035033.24935-1-tianci.yin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(136003)(39860400002)(376002)(346002)(428003)(199004)(189003)(11346002)(476003)(316002)(486006)(26005)(356004)(50466002)(76176011)(44832011)(7696005)(446003)(6666004)(2616005)(2351001)(51416003)(336012)(126002)(426003)(305945005)(48376002)(186003)(86362001)(70586007)(2906002)(14444005)(70206006)(8936002)(5660300002)(36756003)(1076003)(54906003)(478600001)(47776003)(50226002)(6916009)(8676002)(4326008)(81156014)(81166006)(16586007)(53416004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3246; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf5a0280-1675-4464-fbf4-08d74dfe3dec
X-MS-TrafficTypeDiagnostic: MN2PR12MB3246:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3246DCEEBBCCAED0E7A49E9895970@MN2PR12MB3246.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fm/p7rdjrwt0AUK4fYSNqfsmeo9M1Ov+LFKqAt//EqMdErqiZck7Z3ttqBsasS3l/wiDq2swY8BCSdkzyX8bau43+GPoyAbI6olRXjsBUxVrglzD+oAihvHsYz7DpAobp7zfHEMUcLSu2BUHepVZWdHZiwAq0thWePkkBU+pmabVFN+P7h9hXLfsMCqYrUVbW5VASI3Yq8CZqzHrCcATDnco4hRDumU4sAvhKjKXdFbWCc2LphWjtAbB00iLoICYEsibGhw5p+601cLuoBrUzW1FrCWerfdYIk9nf3ZCwYLTGId58SPu+yaRhhPKgM+PXRo+I/IPl81DXsAKJTbgETU3dZkO2/fnvTbAPZoOJNdUQsfY9/rzChmkK3bW04kfqVgPUOAkzF/Vh8POhJZF1J252qNnLkLk3aF8GAMgN94=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 03:51:05.0616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5a0280-1675-4464-fbf4-08d74dfe3dec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3246
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXcLQ8IsjJ3Yds7bRUgKakxvJD9OSdVK01wqRQJII8o=;
 b=C2mnBufK15u0p1BPLDBbfNITQxEVdZr9PQ6l4NLoZmK4aJotn0UdsfbI2QUb4D498acR/uEZr95bGcI3RTWExMsWtdDo2E87J3Kwh1fWEZIMzJ9OEzYEZIRY8BooF5tQb81OdH6NcJCae9YcaK4QkBP+shZv6PgWDkC1UwYUYus=
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
Cc: Deucher Alexander <Alexander.Deucher@amd.com>,
 Tuikov Luben <Luben.Tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tianci Yin <tianci.yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgphZGQgaW50ZXJmYWNlIGZv
ciBtZW1vcnkgdHJhaW5pbmcuCgpDaGFuZ2UtSWQ6IEliYjZkMWQyNGViNjUxZGY3OTZiYzJiYjM0
MTlhNDQ5MzdhZjYwMjQyClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFRpYW5jaS5ZaW4gPHRpYW5jaS55aW5AYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgfCAxOCArKysr
KysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oIHwgNTUgKysrKysr
KysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCmluZGV4IDM3ZmZlZDVlMjE3MS4u
Yjk5NmI1YmM1ODA0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcHNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCkBA
IC04OCw2ICs4OCwxNyBAQCBzdGF0aWMgaW50IHBzcF9zd19pbml0KHZvaWQgKmhhbmRsZSkKIAkJ
cmV0dXJuIHJldDsKIAl9CiAKKwlyZXQgPSBwc3BfbWVtX3RyYWluaW5nX2luaXQocHNwKTsKKwlp
ZiAocmV0KSB7CisJCURSTV9FUlJPUigiRmFpbGVkIHRvIGluaXRsaWF6ZSBtZW1vcnkgdHJhaW5p
bmchXG4iKTsKKwkJcmV0dXJuIHJldDsKKwl9CisJcmV0ID0gcHNwX21lbV90cmFpbmluZyhwc3As
IFBTUF9NRU1fVFJBSU5fQ09MRF9CT09UKTsKKwlpZiAocmV0KSB7CisJCURSTV9FUlJPUigiRmFp
bGVkIHRvIHByb2Nlc3MgbWVtb3J5IHRyYWluaW5nIVxuIik7CisJCXJldHVybiByZXQ7CisJfQor
CiAJcmV0dXJuIDA7CiB9CiAKQEAgLTk1LDYgKzEwNiw3IEBAIHN0YXRpYyBpbnQgcHNwX3N3X2Zp
bmkodm9pZCAqaGFuZGxlKQogewogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVj
dCBhbWRncHVfZGV2aWNlICopaGFuZGxlOwogCisJcHNwX21lbV90cmFpbmluZ19maW5pKCZhZGV2
LT5wc3ApOwogCXJlbGVhc2VfZmlybXdhcmUoYWRldi0+cHNwLnNvc19mdyk7CiAJYWRldi0+cHNw
LnNvc19mdyA9IE5VTEw7CiAJcmVsZWFzZV9maXJtd2FyZShhZGV2LT5wc3AuYXNkX2Z3KTsKQEAg
LTE2MDgsNiArMTYyMCwxMiBAQCBzdGF0aWMgaW50IHBzcF9yZXN1bWUodm9pZCAqaGFuZGxlKQog
CiAJRFJNX0lORk8oIlBTUCBpcyByZXN1bWluZy4uLlxuIik7CiAKKwlyZXQgPSBwc3BfbWVtX3Ry
YWluaW5nKHBzcCwgUFNQX01FTV9UUkFJTl9SRVNVTUUpOworCWlmIChyZXQpIHsKKwkJRFJNX0VS
Uk9SKCJGYWlsZWQgdG8gcHJvY2VzcyBtZW1vcnkgdHJhaW5pbmchXG4iKTsKKwkJcmV0dXJuIHJl
dDsKKwl9CisKIAltdXRleF9sb2NrKCZhZGV2LT5maXJtd2FyZS5tdXRleCk7CiAKIAlyZXQgPSBw
c3BfaHdfc3RhcnQocHNwKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9wc3AuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaApp
bmRleCA3ZGQ5YWU3ZGJiZTQuLmM2ZjE3ZDYzMTBkNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9wc3AuaApAQCAtNDksNiArNDksOCBAQCBlbnVtIHBzcF9ib290bG9hZGVyX2Nt
ZCB7CiAJUFNQX0JMX19MT0FEX1NZU0RSVgkJPSAweDEwMDAwLAogCVBTUF9CTF9fTE9BRF9TT1NE
UlYJCT0gMHgyMDAwMCwKIAlQU1BfQkxfX0xPQURfS0VZX0RBVEFCQVNFCT0gMHg4MDAwMCwKKwlQ
U1BfQkxfX0RSQU1fTE9OR19UUkFJTgkJPSAweDEwMDAwMCwKKwlQU1BfQkxfX0RSQU1fU0hPUlRf
VFJBSU4JPSAweDIwMDAwMCwKIH07CiAKIGVudW0gcHNwX3JpbmdfdHlwZQpAQCAtMTExLDYgKzEx
Myw5IEBAIHN0cnVjdCBwc3BfZnVuY3MKIAkJCXN0cnVjdCB0YV9yYXNfdHJpZ2dlcl9lcnJvcl9p
bnB1dCAqaW5mbyk7CiAJaW50ICgqcmFzX2N1cmVfcG9zaW9uKShzdHJ1Y3QgcHNwX2NvbnRleHQg
KnBzcCwgdWludDY0X3QgKm1vZGVfcHRyKTsKIAlpbnQgKCpybGNfYXV0b2xvYWRfc3RhcnQpKHN0
cnVjdCBwc3BfY29udGV4dCAqcHNwKTsKKwlpbnQgKCptZW1fdHJhaW5pbmdfaW5pdCkoc3RydWN0
IHBzcF9jb250ZXh0ICpwc3ApOworCWludCAoKm1lbV90cmFpbmluZ19maW5pKShzdHJ1Y3QgcHNw
X2NvbnRleHQgKnBzcCk7CisJaW50ICgqbWVtX3RyYWluaW5nKShzdHJ1Y3QgcHNwX2NvbnRleHQg
KnBzcCwgdWludDMyX3Qgb3BzKTsKIH07CiAKICNkZWZpbmUgQU1ER1BVX1hHTUlfTUFYX0NPTk5F
Q1RFRF9OT0RFUwkJNjQKQEAgLTE2MSw2ICsxNjYsNDkgQEAgc3RydWN0IHBzcF9kdG1fY29udGV4
dCB7CiAJdm9pZAkJCSpkdG1fc2hhcmVkX2J1ZjsKIH07CiAKKyNkZWZpbmUgTUVNX1RSQUlOX1NZ
U1RFTV9TSUdOQVRVUkUJCTB4NTQ1MzQ5NDIKKyNkZWZpbmUgR0REUjZfTUVNX1RSQUlOSU5HX0RB
VEFfU0laRV9JTl9CWVRFUwkweDEwMDAKKyNkZWZpbmUgR0REUjZfTUVNX1RSQUlOSU5HX09GRlNF
VAkJMHg4MDAwCisKK2VudW0gcHNwX21lbW9yeV90cmFpbmluZ19pbml0X2ZsYWcgeworCVBTUF9N
RU1fVFJBSU5fTk9UX1NVUFBPUlQJPSAweDAsCisJUFNQX01FTV9UUkFJTl9TVVBQT1JUCQk9IDB4
MSwKKwlQU1BfTUVNX1RSQUlOX0lOSVRfRkFJTEVECT0gMHgyLAorCVBTUF9NRU1fVFJBSU5fUkVT
RVJWRV9TVUNDRVNTCT0gMHg0LAorCVBTUF9NRU1fVFJBSU5fSU5JVF9TVUNDRVNTCT0gMHg4LAor
fTsKKworZW51bSBwc3BfbWVtb3J5X3RyYWluaW5nX29wcyB7CisJUFNQX01FTV9UUkFJTl9TRU5E
X0xPTkdfTVNHCT0gMHgxLAorCVBTUF9NRU1fVFJBSU5fU0FWRQkJPSAweDIsCisJUFNQX01FTV9U
UkFJTl9SRVNUT1JFCQk9IDB4NCwKKwlQU1BfTUVNX1RSQUlOX1NFTkRfU0hPUlRfTVNHCT0gMHg4
LAorCVBTUF9NRU1fVFJBSU5fQ09MRF9CT09UCQk9IFBTUF9NRU1fVFJBSU5fU0VORF9MT05HX01T
RywKKwlQU1BfTUVNX1RSQUlOX1JFU1VNRQkJPSBQU1BfTUVNX1RSQUlOX1NFTkRfU0hPUlRfTVNH
LAorfTsKKworc3RydWN0IHBzcF9tZW1vcnlfdHJhaW5pbmdfY29udGV4dCB7CisJLyp0cmFpbmlu
ZyBkYXRhIHNpemUqLworCXU2NCB0cmFpbl9kYXRhX3NpemU7CisJLyoKKwkgKiBzeXNfY2FjaGUK
KwkgKiBjcHUgdmlydHVhbCBhZGRyZXNzCisJICogc3lzdGVtIG1lbW9yeSBidWZmZXIgdGhhdCB1
c2VkIHRvIHN0b3JlIHRoZSB0cmFpbmluZyBkYXRhLgorCSAqLworCXZvaWQgKnN5c19jYWNoZTsK
KworCS8qdnJhbSBvZmZzZXQgb2YgdGhlIHAyYyB0cmFpbmluZyBkYXRhKi8KKwl1NjQgcDJjX3Ry
YWluX2RhdGFfb2Zmc2V0OworCXN0cnVjdCBhbWRncHVfYm8gKnAyY19ibzsKKworCS8qdnJhbSBv
ZmZzZXQgb2YgdGhlIGMycCB0cmFpbmluZyBkYXRhKi8KKwl1NjQgYzJwX3RyYWluX2RhdGFfb2Zm
c2V0OworCXN0cnVjdCBhbWRncHVfYm8gKmMycF9ibzsKKworCWVudW0gcHNwX21lbW9yeV90cmFp
bmluZ19pbml0X2ZsYWcgaW5pdDsKKwl1MzIgdHJhaW5pbmdfY250OworfTsKKwogc3RydWN0IHBz
cF9jb250ZXh0CiB7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgICAgICAgICAgICAqYWRldjsKQEAg
LTIzOSw2ICsyODcsNyBAQCBzdHJ1Y3QgcHNwX2NvbnRleHQKIAlzdHJ1Y3QgcHNwX2hkY3BfY29u
dGV4dCAJaGRjcF9jb250ZXh0OwogCXN0cnVjdCBwc3BfZHRtX2NvbnRleHQJCWR0bV9jb250ZXh0
OwogCXN0cnVjdCBtdXRleAkJCW11dGV4OworCXN0cnVjdCBwc3BfbWVtb3J5X3RyYWluaW5nX2Nv
bnRleHQgbWVtX3RyYWluX2N0eDsKIH07CiAKIHN0cnVjdCBhbWRncHVfcHNwX2Z1bmNzIHsKQEAg
LTI4MSw2ICszMzAsMTIgQEAgc3RydWN0IGFtZGdwdV9wc3BfZnVuY3MgewogCQkocHNwKS0+ZnVu
Y3MtPnhnbWlfc2V0X3RvcG9sb2d5X2luZm8oKHBzcCksIChudW1fZGV2aWNlKSwgKHRvcG9sb2d5
KSkgOiAtRUlOVkFMKQogI2RlZmluZSBwc3BfcmxjX2F1dG9sb2FkKHBzcCkgXAogCQkoKHBzcCkt
PmZ1bmNzLT5ybGNfYXV0b2xvYWRfc3RhcnQgPyAocHNwKS0+ZnVuY3MtPnJsY19hdXRvbG9hZF9z
dGFydCgocHNwKSkgOiAwKQorI2RlZmluZSBwc3BfbWVtX3RyYWluaW5nX2luaXQocHNwKSBcCisJ
KChwc3ApLT5mdW5jcy0+bWVtX3RyYWluaW5nX2luaXQgPyAocHNwKS0+ZnVuY3MtPm1lbV90cmFp
bmluZ19pbml0KChwc3ApKSA6IDApCisjZGVmaW5lIHBzcF9tZW1fdHJhaW5pbmdfZmluaShwc3Ap
IFwKKwkoKHBzcCktPmZ1bmNzLT5tZW1fdHJhaW5pbmdfZmluaSA/IChwc3ApLT5mdW5jcy0+bWVt
X3RyYWluaW5nX2ZpbmkoKHBzcCkpIDogMCkKKyNkZWZpbmUgcHNwX21lbV90cmFpbmluZyhwc3As
IG9wcykgXAorCSgocHNwKS0+ZnVuY3MtPm1lbV90cmFpbmluZyA/IChwc3ApLT5mdW5jcy0+bWVt
X3RyYWluaW5nKChwc3ApLCAob3BzKSkgOiAwKQogCiAjZGVmaW5lIGFtZGdwdV9wc3BfY2hlY2tf
ZndfbG9hZGluZ19zdGF0dXMoYWRldiwgaSkgKGFkZXYpLT5maXJtd2FyZS5mdW5jcy0+Y2hlY2tf
ZndfbG9hZGluZ19zdGF0dXMoKGFkZXYpLCAoaSkpCiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
