Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28C3A00D8
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 13:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33832899E8;
	Wed, 28 Aug 2019 11:40:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740043.outbound.protection.outlook.com [40.107.74.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DC3899E8
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 11:40:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0L79R3NLsCtv/PbhZ83GJl9h+NvVYIqd+K7DUv5+pT/f76mjVRR6uvxqEYp2b/t5nGshBNzDyDEe3UOir4qEiqFzXxYl95vTR/t6GrZUWbJoL44PEPgfjRj3abIGyeYYefVpZ4MulTk/ypfIg/ZTI26pzLbqQ5tC3LERCDCLEiM9GAXeeQWOd4Q9rJ0zASJVskV1hiEdBZ/nNiqUF3/xe+eO0ZGkKL7hfcymHFBiU2DKpFLS0iRKXu1uPSm2GqnF/MvegIPoVmLY1VeNVfZ4WT6f4B/ivrJE2iMirwWM4Y0AzGs3Tyzk8Xci+jz0QTe53FNPqlAuG0HIIR0JcTARg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQL928+bx2MyhvEKbXh4RiZLhpJXjqfJ/s2ddrnhR2s=;
 b=crwr07l+hPQL5yr3oRVDxt4BGEoT87UhzDELp6vOcaOmhdcyFvMZ1uQF02nlwJfzzjVZCqlLb2d4WfL77N515kK+xOMIMOThJUDbnSgjUG+8VOeZu0R1V/oKOu6oxygklePWKtZaMDhidwO371gvJ8aUJxbK6rIaMVjo/6JV+sD8S2bkfK+1Aobyelsz6+hxUZQ1ZeIqp3vq4mnyfudKUnShUsr87GfoPn4kqGRM7grNky/a+FMaNemcgPOe8rPtBfi0ynbYcHEJAC+CgtoSQuEgRb3VgPg+rbxK2JL8zcKH7fKyA0EEnqSQgFfAVoQhJCYzmQSAqFN+ezGqRJKZbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0070.namprd12.prod.outlook.com (2603:10b6:802:20::41)
 by MWHPR12MB1535.namprd12.prod.outlook.com (2603:10b6:301:5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Wed, 28 Aug
 2019 11:40:32 +0000
Received: from DM3NAM03FT039.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by SN1PR12CA0070.outlook.office365.com
 (2603:10b6:802:20::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.18 via Frontend
 Transport; Wed, 28 Aug 2019 11:40:32 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT039.mail.protection.outlook.com (10.152.83.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 28 Aug 2019 11:40:31 +0000
Received: from rico-code.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 28 Aug 2019
 06:40:29 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: keep the stolen memory in visible vram region
Date: Wed, 28 Aug 2019 19:40:21 +0800
Message-ID: <1566992421-30581-2-git-send-email-tianci.yin@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566992421-30581-1-git-send-email-tianci.yin@amd.com>
References: <1566992421-30581-1-git-send-email-tianci.yin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(2980300002)(428003)(189003)(199004)(336012)(186003)(16586007)(6916009)(305945005)(8676002)(86362001)(81166006)(81156014)(26005)(44832011)(6666004)(14444005)(53936002)(36756003)(356004)(2906002)(446003)(7696005)(50466002)(54906003)(76176011)(478600001)(11346002)(51416003)(8936002)(426003)(47776003)(316002)(476003)(70206006)(486006)(2616005)(70586007)(2351001)(5660300002)(4326008)(53416004)(48376002)(126002)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1535; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 781b50ea-3598-47a9-3f75-08d72bac887a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MWHPR12MB1535; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1535:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1535707238C8950C2C13638E95A30@MWHPR12MB1535.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: cKm84qDeMWi67bYd9gAzglSH8x/pN5eNc9cR0HxJqo0KC0zBtlOwW0y/rKWCiN1q92+LMFJNzGBgaQx0Im9TaB1lKWCDJ5pNNvzbxhWuXNXb3vhqBzMHCOfNai+43mTsaB8DIA+0pr59Ch7oH5EpDD7f5HScuXKqxK0WAt7ZDsWxPcW43p2i3iijI783d8KMcU//uxAIPni6S5W3H4e1GlglXzPX9V+nonAdEf0ha7mgAazNHLub9pUZyg55jxGQ59/4RIToxyAnBCqogoBuQA8TeAJONRI2MhkpRU5/K25LhtM+FRn0ihYGsBdlHkAwuMOcXep5wm4GdCVZbEVNEtcGTH5faMZzc6Kb3VxFB8kSKDSlso9Vqa/BuYeJ3aQEELCtB2jXlSvc+aHxJQgu0FvLbatZxkeuXGznilzz4zA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 11:40:31.8945 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 781b50ea-3598-47a9-3f75-08d72bac887a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1535
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQL928+bx2MyhvEKbXh4RiZLhpJXjqfJ/s2ddrnhR2s=;
 b=hpaY6eyqmZqMqK8AlEvyFH0rYf4m4G5StTxyJgEOiBVm8CNl0LCgG+jN8nnB5pqBY5w4dJGPmtXS4w+wfts5KxSqXvTq7LoB3kn6q5DG+DCecdz8oit+VXDX2uIkRGOxpVEP3ACtRJJWseMHFZWfeYiFp0sKh+x1aMjd9Z3/6wY=
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
Cc: Feifei Xu <Feifei.Xu@amd.com>, "Le
 . Ma" <Le.Ma@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Tianci Yin <tianci.yin@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgpzdG9sZW4gbWVtb3J5IHNo
b3VsZCBiZSBmaXhlZCBpbiB2aXNpYmxlIHJlZ2lvbi4KCkNoYW5nZS1JZDogSWNiYmJkMzlmZDEx
M2U5MzQyM2FhZDhkMjU1NWY0MDczYzA4MDIwZTUKU2lnbmVkLW9mZi1ieTogVGlhbmNpLllpbiA8
dGlhbmNpLnlpbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYyB8IDYgKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5j
ICAgfCAzICsrLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCmluZGV4IDgwMWY5MTIu
LmRjZDMyZDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKQEAgLTE3
MzMsNiArMTczMyw3IEBAIGludCBhbWRncHVfdHRtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCiAJdWludDY0X3QgZ3R0X3NpemU7CiAJaW50IHI7CiAJdTY0IHZpc192cmFtX2xpbWl0
OworCXZvaWQgKnN0b2xlbl92Z2FfYnVmOwogCiAJbXV0ZXhfaW5pdCgmYWRldi0+bW1hbi5ndHRf
d2luZG93X2xvY2spOwogCkBAIC0xNzg3LDcgKzE3ODgsNyBAQCBpbnQgYW1kZ3B1X3R0bV9pbml0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXIgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5l
bChhZGV2LCBhZGV2LT5nbWMuc3RvbGVuX3NpemUsIFBBR0VfU0laRSwKIAkJCQkgICAgQU1ER1BV
X0dFTV9ET01BSU5fVlJBTSwKIAkJCQkgICAgJmFkZXYtPnN0b2xlbl92Z2FfbWVtb3J5LAotCQkJ
CSAgICBOVUxMLCBOVUxMKTsKKwkJCQkgICAgTlVMTCwgJnN0b2xlbl92Z2FfYnVmKTsKIAlpZiAo
cikKIAkJcmV0dXJuIHI7CiAJRFJNX0lORk8oImFtZGdwdTogJXVNIG9mIFZSQU0gbWVtb3J5IHJl
YWR5XG4iLApAQCAtMTg1MSw4ICsxODUyLDkgQEAgaW50IGFtZGdwdV90dG1faW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKICAqLwogdm9pZCBhbWRncHVfdHRtX2xhdGVfaW5pdChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKKwl2b2lkICpzdG9sZW5fdmdhX2J1ZjsKIAkvKiBy
ZXR1cm4gdGhlIFZHQSBzdG9sZW4gbWVtb3J5IChpZiBhbnkpIGJhY2sgdG8gVlJBTSAqLwotCWFt
ZGdwdV9ib19mcmVlX2tlcm5lbCgmYWRldi0+c3RvbGVuX3ZnYV9tZW1vcnksIE5VTEwsIE5VTEwp
OworCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmYWRldi0+c3RvbGVuX3ZnYV9tZW1vcnksIE5VTEws
ICZzdG9sZW5fdmdhX2J1Zik7CiB9CiAKIC8qKgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMKaW5kZXggZjc3MTM4Yi4uYWI0M2FlMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jCkBAIC0xMjQ4LDYgKzEyNDgsNyBAQCBzdGF0aWMgaW50IGdtY192OV8wX3N3X2lu
aXQodm9pZCAqaGFuZGxlKQogc3RhdGljIGludCBnbWNfdjlfMF9zd19maW5pKHZvaWQgKmhhbmRs
ZSkKIHsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqKWhhbmRsZTsKKwl2b2lkICpzdG9sZW5fdmdhX2J1ZjsKIAogCWlmIChhbWRncHVfcmFzX2lz
X3N1cHBvcnRlZChhZGV2LCBBTURHUFVfUkFTX0JMT0NLX19VTUMpICYmCiAJCQlhZGV2LT5nbWMu
dW1jX3Jhc19pZikgewpAQCAtMTI4MCw3ICsxMjgxLDcgQEAgc3RhdGljIGludCBnbWNfdjlfMF9z
d19maW5pKHZvaWQgKmhhbmRsZSkKIAlhbWRncHVfdm1fbWFuYWdlcl9maW5pKGFkZXYpOwogCiAJ
aWYgKGdtY192OV8wX2tlZXBfc3RvbGVuX21lbW9yeShhZGV2KSkKLQkJYW1kZ3B1X2JvX2ZyZWVf
a2VybmVsKCZhZGV2LT5zdG9sZW5fdmdhX21lbW9yeSwgTlVMTCwgTlVMTCk7CisJCWFtZGdwdV9i
b19mcmVlX2tlcm5lbCgmYWRldi0+c3RvbGVuX3ZnYV9tZW1vcnksIE5VTEwsICZzdG9sZW5fdmdh
X2J1Zik7CiAKIAlhbWRncHVfZ2FydF90YWJsZV92cmFtX2ZyZWUoYWRldik7CiAJYW1kZ3B1X2Jv
X2ZpbmkoYWRldik7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
