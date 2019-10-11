Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11253D48B6
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4E36ECA3;
	Fri, 11 Oct 2019 19:53:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700062.outbound.protection.outlook.com [40.107.70.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6F56EC90
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2BHXipXIZGUTeEMV0xEgcRvw1U2N8uOD0QYDuSTGBTPuppaaks/CnEYcoHS1jqwx9lvy/Hq/BlTeCQL6HqEoBiziCYM3DP/227knO1l4QXIszF4dXgSvlJ3Bgk5+eEJw4dkPcg/QC/qGvN6z3rC6jyPDdBpF93rB48RsDL2+vxdotqqGx+U+NLMASumm2BsuUa3YaPmpeKyTfVWXPP6yT/kEkACR9ViXO1QsPTZf5oXIOFgnn1CobOgqTuuEusVm+P7IuVh1HYf+fAzFeByqdI38i8hhzhZS2m3Z28HlVJqJ6E3squ7mcEybd32VWEntK6NTisfO7fMrlGSAzFvlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3msces00inZ3Fl77awXgw2MilSRHCTJxyS0kjKJEsw=;
 b=Qg1Mn9d1/KvpiEkQtnVYq0jChUoIT3AGrNff2q9qBWZp1Sir3r7jRmahe4E24ufWAymralWVJtU3pxU9mgETK1M2NRrWo4oh4gge5zJ9lGGwLkFTNmrEJD8lgvLp4uctiRHDIxZ57eVIRvjKGkizot7F4nRu1naUqCWDCGCfgbUk4+k0TS4JoXeX3/Aq8H6xUYR5eEbZKw4aDWghkRN17cdojS4djp0yvI7TbXTgm2j9mwBvKL17h/OrJGQruIe0UN8YDuV9ocbVZ4p+W2IwMkpbWXgt1XocpQwwNEBY9jZiGEJ6kbhmgibOmEiG+EpKD7xoTUu9Ijq4+0Wr9LsDvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0014.namprd12.prod.outlook.com
 (2603:10b6:405:4c::24) by DM5PR12MB2454.namprd12.prod.outlook.com
 (2603:10b6:4:ba::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 19:53:50 +0000
Received: from BY2NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by BN6PR1201CA0014.outlook.office365.com
 (2603:10b6:405:4c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT061.mail.protection.outlook.com (10.152.85.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:49 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:45 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/29] drm/amd/display: Temporary workaround to toggle
 watermark setting
Date: Fri, 11 Oct 2019 15:53:07 -0400
Message-ID: <20191011195324.16268-13-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(346002)(396003)(428003)(189003)(199004)(86362001)(305945005)(11346002)(36756003)(426003)(47776003)(2616005)(478600001)(53416004)(5660300002)(50226002)(2351001)(76176011)(6916009)(4326008)(51416003)(70206006)(316002)(70586007)(26005)(126002)(446003)(8936002)(2906002)(6666004)(476003)(16586007)(1076003)(81156014)(81166006)(48376002)(8676002)(14444005)(186003)(336012)(50466002)(486006)(356004)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2454; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44d34e52-f66d-43f2-a000-08d74e84bc33
X-MS-TrafficTypeDiagnostic: DM5PR12MB2454:
X-Microsoft-Antispam-PRVS: <DM5PR12MB24543A1EAE9562BD9692BEB2F9970@DM5PR12MB2454.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LNYy8t2LPGv8mBSr8oI5OIUfqX1RB6MPZHNXcb8GMJMPq0IjCoNyqFDtyy1A12iPDii5LRMD+hEasZxnZKZ2yIjcev2viIAtwgvyZIOPad1t4UQaaAAhy2nyHBnJUULRNCuaC0M/THrN9H18bfBrST8VcKYBFeKBLZ5RyTs1w7wMuuW6yileSSfUYeyp/sUgBs1XvgPpUBZuvRCqV+EtMm4ZzFGRGcVAbXDF/x0VfcDmQZGhHBo7QW0Zmqnn+ByUtCMCOrf8v3iY0MpoMIriFzA/0pfo0KwdPzS6NvrzQtO/RvZLQ8ehc9gUcNBRmEHUaOPJdhiyFPtdzIav125b/UloELn51lbeqJRfzAAHJF91IYkXTUYeEZP1zVsQVH/hml8EjlXzxFkID2oTav7tFeRoj26VzMEo45qANhA4hbc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:49.4742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d34e52-f66d-43f2-a000-08d74e84bc33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2454
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3msces00inZ3Fl77awXgw2MilSRHCTJxyS0kjKJEsw=;
 b=N7Jm+oKtelTEE9uEl2enhIBTw6qJZm72lsHx3XNn48S4nH6Sy1sDStKEHaJ+0da9JyS6vVQaPHF7LIQln/aHF3DfFJLugX6THlT0VlHXWk3bIwgBWNPp3yXJES6TqeMU7rEmX5ulametgP3T0bEyP6oZvcgmPiFxuFh3z3s3NMA=
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
Cc: Lewis Huang <Lewis.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGV3aXMgSHVhbmcgPExld2lzLkh1YW5nQGFtZC5jb20+CgpbV2h5XQpXYXRlcm1hcmtz
IG5vdCBwcm9wYWdhdGVkIHRvIERDSFVCUCBhZnRlciBpdCBpcyBwb3dlcmVkIG9uCgpbSG93XQpB
ZGQgdGVtb3ByYXJ5IGZ1bmN0aW9uIGFwcGx5X0RFRENOMjFfMTQ3X3dhIHRvIGFwcGx5IHdtIHNl
dHRpbmdzIGZvciBSZW5vaXIKClNpZ25lZC1vZmYtYnk6IExld2lzIEh1YW5nIDxMZXdpcy5IdWFu
Z0BhbWQuY29tPgpSZXZpZXdlZC1ieTogVG9ueSBDaGVuZyA8VG9ueS5DaGVuZ0BhbWQuY29tPgpB
Y2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgICAg
fCA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9odWJi
dWIuYyAgIHwgOSArKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MS9kY24yMV9yZXNvdXJjZS5jIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
aW5jL2h3L2RjaHViYnViLmggICAgICB8IDEgKwogNCBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX2h3c2VxLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfaHdzZXEuYwppbmRleCBjZTI1MzA1MDllMTIuLjYyMjlhOGNhMDAxMyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKQEAgLTE1
MzMsNiArMTUzMywxMCBAQCBzdGF0aWMgdm9pZCBkY24yMF9wcm9ncmFtX2Zyb250X2VuZF9mb3Jf
Y3R4KAogCQkJCW1zbGVlcCgxKTsKIAkJfQogCX0KKworCS8qIFdBIHRvIGFwcGx5IFdNIHNldHRp
bmcqLworCWlmIChkYy0+aHdzZXEtPndhLkRFR1ZJRENOMjEpCisJCWRjLT5yZXNfcG9vbC0+aHVi
YnViLT5mdW5jcy0+YXBwbHlfREVEQ04yMV8xNDdfd2EoZGMtPnJlc19wb29sLT5odWJidWIpOwog
fQogCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9k
Y24yMV9odWJidWIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24y
MV9odWJidWIuYwppbmRleCBmZGZiZGViMzI0NTkuLjIyMzJjY2YxNGJkZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX2h1YmJ1Yi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9odWJidWIuYwpAQCAt
NjE2LDYgKzYxNiwxNCBAQCB2b2lkIGh1YmJ1YjIxX3dtX3JlYWRfc3RhdGUoc3RydWN0IGh1YmJ1
YiAqaHViYnViLAogCQkJRENIVUJCVUJfQVJCX0FMTE9XX0RSQU1fQ0xLX0NIQU5HRV9XQVRFUk1B
UktfRCwgJnMtPmRyYW1fY2xrX2NoYW5hZ2UpOwogfQogCit2b2lkIGh1YmJ1YjIxX2FwcGx5X0RF
RENOMjFfMTQ3X3dhKHN0cnVjdCBodWJidWIgKmh1YmJ1YikKK3sKKwlzdHJ1Y3QgZGNuMjBfaHVi
YnViICpodWJidWIxID0gVE9fRENOMjBfSFVCQlVCKGh1YmJ1Yik7CisJdWludDMyX3QgcHJvZ193
bV92YWx1ZTsKKworCXByb2dfd21fdmFsdWUgPSBSRUdfUkVBRChEQ0hVQkJVQl9BUkJfREFUQV9V
UkdFTkNZX1dBVEVSTUFSS19BKTsKKwlSRUdfV1JJVEUoRENIVUJCVUJfQVJCX0RBVEFfVVJHRU5D
WV9XQVRFUk1BUktfQSwgcHJvZ193bV92YWx1ZSk7Cit9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
aHViYnViX2Z1bmNzIGh1YmJ1YjIxX2Z1bmNzID0gewogCS51cGRhdGVfZGNodWIgPSBodWJidWIy
X3VwZGF0ZV9kY2h1YiwKQEAgLTYyNyw2ICs2MzUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGh1
YmJ1Yl9mdW5jcyBodWJidWIyMV9mdW5jcyA9IHsKIAkud21fcmVhZF9zdGF0ZSA9IGh1YmJ1YjIx
X3dtX3JlYWRfc3RhdGUsCiAJLmdldF9kY2h1Yl9yZWZfZnJlcSA9IGh1YmJ1YjJfZ2V0X2RjaHVi
X3JlZl9mcmVxLAogCS5wcm9ncmFtX3dhdGVybWFya3MgPSBodWJidWIyMV9wcm9ncmFtX3dhdGVy
bWFya3MsCisJLmFwcGx5X0RFRENOMjFfMTQ3X3dhID0gaHViYnViMjFfYXBwbHlfREVEQ04yMV8x
NDdfd2EsCiB9OwogCiB2b2lkIGh1YmJ1YjIxX2NvbnN0cnVjdChzdHJ1Y3QgZGNuMjBfaHViYnVi
ICpodWJidWIsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjEvZGNuMjFfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MS9kY24yMV9yZXNvdXJjZS5jCmluZGV4IGUzOTk2MWQwZjI0ZS4uNWUxNWY4MDBhOWYxIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3Vy
Y2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVz
b3VyY2UuYwpAQCAtMTQ2OCw2ICsxNDY4LDcgQEAgc3RhdGljIHN0cnVjdCBkY2VfaHdzZXEgKmRj
bjIxX2h3c2VxX2NyZWF0ZSgKIAkJaHdzLT5yZWdzID0gJmh3c2VxX3JlZzsKIAkJaHdzLT5zaGlm
dHMgPSAmaHdzZXFfc2hpZnQ7CiAJCWh3cy0+bWFza3MgPSAmaHdzZXFfbWFzazsKKwkJaHdzLT53
YS5ERUdWSURDTjIxID0gdHJ1ZTsKIAl9CiAJcmV0dXJuIGh3czsKIH0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvZGNodWJidWIuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvZGNodWJidWIuaAppbmRleCBhNjI5NzIxOWQ3
ZmMuLmM4MWExN2FlYWEyNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2luYy9ody9kY2h1YmJ1Yi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9pbmMvaHcvZGNodWJidWIuaApAQCAtMTQ3LDYgKzE0Nyw3IEBAIHN0cnVjdCBodWJidWJfZnVu
Y3MgewogCWJvb2wgKCppc19hbGxvd19zZWxmX3JlZnJlc2hfZW5hYmxlZCkoc3RydWN0IGh1YmJ1
YiAqaHViYnViKTsKIAl2b2lkICgqYWxsb3dfc2VsZl9yZWZyZXNoX2NvbnRyb2wpKHN0cnVjdCBo
dWJidWIgKmh1YmJ1YiwgYm9vbCBhbGxvdyk7CiAKKwl2b2lkICgqYXBwbHlfREVEQ04yMV8xNDdf
d2EpKHN0cnVjdCBodWJidWIgKmh1YmJ1Yik7CiB9OwogCiBzdHJ1Y3QgaHViYnViIHsKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
