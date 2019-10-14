Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9412D59E3
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Oct 2019 05:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3A86E1CF;
	Mon, 14 Oct 2019 03:21:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730069.outbound.protection.outlook.com [40.107.73.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03BD6E1D3
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 03:21:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0jIQdktUyZJBsS8wQH75+CU4rE60paEMI/nC6nfJl2rwPdNAllpNaOl/3JGMrF3W4WlYeC9udebA2pPSf6KVL+7QzTiHbllXImA+WXa1MMDV9me2Gkna3k8rtnzWvhNaDVsE2OBqSGw4DDPRD4OdTiz+TMRVIAgTlvdGLe2WoPf4Qamrpvv+bH6Q7hH4uk+Qkd/ZzTG9fk6jsnO29Sxzv88eKD74j5ajHdW2Q/g/aUwu1V1yac9djIopQOxC/Wdlm88tzYjJqBaSvTnSTayZKmXGRRR+JdJhuNV8/RJeNyv5HJZUIwWUlpuuz5VefewkqWq+AItHwtYkKqMVAzmNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXcLQ8IsjJ3Yds7bRUgKakxvJD9OSdVK01wqRQJII8o=;
 b=d+eXQ4rKllKPk1Xm3MlsYP8PmLBvZTGVVjTPxBcPvPHtfD6tHCdQDacGYvYDoAomoiJuUi4bYqrVGtC5Cg6ZOQShiV39jbxgRtGjCkn7N1eykJipYSXm0zbv1uKsK2DPlvNlCN57WK+Yjcj4yD61evCE+2I1zQnXEKYwCRpLHUOzvMembxXnEP9ruZL97MonDVBtZbc9PtmvPxqvffUXureSUYSeT66YubcRNH0AjAG80M7ZQ3g3SrGKNVxy+2w0fnWoOHwnoeC0E4V3/EO+mWgxUHemXkw3OiXNzgghNEJxH1u7cqA9VPY+ea5Mzx0PsAlPEvzfN5dEv5n+OrJksg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0093.namprd12.prod.outlook.com (2603:10b6:0:55::13) by
 BN8PR12MB3554.namprd12.prod.outlook.com (2603:10b6:408:65::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Mon, 14 Oct 2019 03:21:34 +0000
Received: from CO1NAM03FT050.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM3PR12CA0093.outlook.office365.com
 (2603:10b6:0:55::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Mon, 14 Oct 2019 03:21:33 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT050.mail.protection.outlook.com (10.152.81.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2347.21 via Frontend Transport; Mon, 14 Oct 2019 03:21:33 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 13 Oct
 2019 22:21:32 -0500
Received: from rico-code.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sun, 13 Oct 2019 22:21:30 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 6/8] drm/amdgpu: add psp memory training callbacks and macro
Date: Mon, 14 Oct 2019 11:21:16 +0800
Message-ID: <20191014032118.14020-6-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191014032118.14020-1-tianci.yin@amd.com>
References: <20191014032118.14020-1-tianci.yin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(428003)(199004)(189003)(356004)(336012)(6916009)(4326008)(6666004)(14444005)(7696005)(51416003)(76176011)(316002)(305945005)(2906002)(186003)(53416004)(478600001)(26005)(446003)(11346002)(86362001)(48376002)(486006)(50466002)(8676002)(50226002)(8936002)(47776003)(81166006)(81156014)(5660300002)(54906003)(1076003)(2616005)(126002)(476003)(2351001)(44832011)(70586007)(16586007)(70206006)(36756003)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3554; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe0fdfef-8361-4e51-9f7b-08d750559cf2
X-MS-TrafficTypeDiagnostic: BN8PR12MB3554:
X-Microsoft-Antispam-PRVS: <BN8PR12MB35549B087BBE6AF32A7F6F9595900@BN8PR12MB3554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01901B3451
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UW2bcbnUN4vkexyuh1hz0eu3ou3mvty5BuNNhkoWG2pAPb4O8YsVu1DaOL5Ll/c1IvcVmi1HaPfgVaFm3qS9AB+V4XSDI5Yf+ek4VFFpeLVuhb+JZL4R8f6c560ejxtGIC62XItSuj2opXLHadUB+GblNhVaOuaRstmXFapKa+b2Ry32/wiJW/fJ2lguN8JnG1E6XDXWV981QDJgC+wrMeCBp2WN0ctccQXAuOjvpbK5bkzbnzSVeyzLa6Rb16PJeN6GQH8ndBVjtONpvu1yfR9EVs1q/IrWy27TEwl1YlLu8WypJTtT8O3BTnvPJPA+fyXU6jBtL9RJZL1iirbGdj+IAq4Xz2I3kZLe67LnmC7IAruPhWApLFO7TUUkFridWqc64nhroE7e5SsQ4Js//YC6wELszK0YupmF77AchH8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2019 03:21:33.0141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0fdfef-8361-4e51-9f7b-08d750559cf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3554
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXcLQ8IsjJ3Yds7bRUgKakxvJD9OSdVK01wqRQJII8o=;
 b=vKtEo9j3VjnLf5+eJxwDLFXl1NtlleT9BmrsM/yNYM++HVtxMLsraqzhF3DYgFaJ8+THg2vvvnOSuiBgHJgY91dsrWw1ljGg0Un9dLOVJchOxsURforanryZinXI7raLdKTrmU02Cqfwc3sGVc8zXdH5G+394LbS4mP/TNiKEwU=
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
