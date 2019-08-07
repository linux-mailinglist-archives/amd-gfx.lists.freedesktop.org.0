Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E87842AF
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 04:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212E96E59D;
	Wed,  7 Aug 2019 02:56:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760082.outbound.protection.outlook.com [40.107.76.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAA06E59D
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 02:56:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWPdnakyhnR74NSGjGh6eeOnrfGShlgsES5yCt5u9qW8CiGVa5Oi03XDhefr9DvPvPdXQpbZqzMa86Uv9VlrE+86fxrRHb9cPZiTl43uKUrKKNj9HIkYOea3/jLxZWWolAM+Qdupc9Xo92ZINI4Wf6i1YdTxTiIIrAx7YpU8BVASWV3QdgTr8ZPPKAXOvPfE8eO+QmIAtfoDAYIbrD/rO+u86E2E1OQ767uuCtGAZObSypgEMaPxC6wx4IyBh2APfzo2PKRK8spuqTb/60lN1oSU7c0N4m95V+9yUBmeLOXLz+KLoWiDFR/tOLFjK3Mc8tYd83Usp5FqpDajaaz2hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yky6w6/M4SeHS15mmKKQtpK5alww9+bmfDk4qJna3/I=;
 b=iZsglEpD5wGKBLonXv4jYlGzYDUHXZ4UP+HUvqAu497fFWCGfFffwc3vA7E4Xc/BfqJU0rYMQNHduYzqajW1XpEWuTZitbDdPdmGtPN9xsaxg3K5eMeaOrED7UscDRPIr2xlI/vtszhrU8oJi8PS9k6lMHFxVRdBeQj4Ynlz/Nl1ShPtdTK43/Be6q98VAwhpjQYC5gcGM4A6RfIke1QHLFuGJ7O2U4k6xnHrJQbEboLdnrS2CG507uqLxFSIeRfGjb7tAB8TokITvW8hALzkhGSJDjU/x6Z/tWoNedMCdQnTQk5EZUMI8OluwwXQ2eqNjC4s3CvDH1PQb1ZeeQS2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linaro.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR1201CA0021.namprd12.prod.outlook.com
 (2603:10b6:301:4a::31) by BYAPR12MB2710.namprd12.prod.outlook.com
 (2603:10b6:a03:68::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.19; Wed, 7 Aug
 2019 02:56:50 +0000
Received: from BY2NAM03FT043.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by MWHPR1201CA0021.outlook.office365.com
 (2603:10b6:301:4a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.13 via Frontend
 Transport; Wed, 7 Aug 2019 02:56:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT043.mail.protection.outlook.com (10.152.85.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Wed, 7 Aug 2019 02:56:49 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 6 Aug 2019
 21:56:47 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <alexander.deucher@amd.com>,
 <hawking.zhang@amd.com>, <dennis.li@amd.com>, <broonie@kernel.org>,
 <akpm@linux-foundation.org>, <christian.koenig@amd.com>
Subject: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
Date: Wed, 7 Aug 2019 10:56:40 +0800
Message-ID: <20190807025640.682-1-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(68736007)(2201001)(486006)(50466002)(48376002)(476003)(53416004)(6666004)(2616005)(356004)(426003)(126002)(336012)(186003)(86362001)(6636002)(47776003)(478600001)(4326008)(26005)(70206006)(316002)(54906003)(1076003)(16586007)(110136005)(5660300002)(7696005)(51416003)(53936002)(8676002)(70586007)(36756003)(8936002)(81166006)(81156014)(50226002)(305945005)(2906002)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2710; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bdaf23d-67ff-4dfa-a56e-08d71ae2e4dd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2710; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2710:
X-Microsoft-Antispam-PRVS: <BYAPR12MB271044796759B6AE287FF480B0D40@BYAPR12MB2710.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-Forefront-PRVS: 01221E3973
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: cM6Rs+5qRQZU+kNfIqs1zxyQY8bCl0jE7pJBdn2dOoL7uQ0LruNrBOw1lEKvQZXFLXNGI739+x63BVBLi4mfxLNtCygclmDn4+993i156ejaccChEvYksXAQ7cySfYFBON0654AeDjYezo4N7XoWJWMNRwgKZgqly/cjgz8Kozti2tmYZXasvj14Y9sx9fRSsCtwDFG+xCsNePlyWt7Pv0unWS4z2DOtrkgUnkWfPT/rp9r0I+gi+YYI2rcOAhDa4bWzYHqujH8iYXTTXFXOKXOUgzQPVm56LW/GNxD4iSNz/+naXSAb+WC4Hyg5pV70H9QWXSEzsXqM3clZ9ev0IL5xEeTIiNrSP5bmOVXRmt92lW+cgRpMEsFxNw9JcdT9tGrRybvHQQaRTGxH0en6TzlnmJS6xFXQ+sV89QXr1LI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2019 02:56:49.9265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdaf23d-67ff-4dfa-a56e-08d71ae2e4dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2710
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yky6w6/M4SeHS15mmKKQtpK5alww9+bmfDk4qJna3/I=;
 b=01vV5quKFaefE/H7PL5mupPTZ/YJQG+6uE8GW8OsGfFU2XJbyfvgAMNKtyE4GICgc6ejbFBSYjM3bNPbLj1KT2JKOpwY0jxVB54/WdLBkUkpMg57POJmGTrLAW3AH9EvzIJ/DTFjqCYZUXYZu7pi8g7he/9aW4qc2VJHdv0LLEw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=permerror action=none
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
Cc: Tao Zhou <tao.zhou1@amd.com>, linux-next@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cmVhZHEvd3JpdGVxIGFyZSBub3Qgc3VwcG9ydGVkIG9uIGFsbCBhcmNoaXRlY3R1cmVzCgpTaWdu
ZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgOCArKy0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggNTU4ZmU2ZDA5MWVkLi43ZWI5ZTBiOTIzNWEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTI3Miwx
NCArMjcyLDEwIEBAIHZvaWQgYW1kZ3B1X21tX3dyZWcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsIHVpbnQzMl90IHJlZywgdWludDMyX3QgdiwKICAqLwogdWludDY0X3QgYW1kZ3B1X21tX3Jy
ZWc2NChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgcmVnKQogewotCXVpbnQ2
NF90IHJldDsKLQogCWlmICgocmVnICogNCkgPCBhZGV2LT5ybW1pb19zaXplKQotCQlyZXQgPSBy
ZWFkcSgoKHZvaWQgX19pb21lbSAqKWFkZXYtPnJtbWlvKSArIChyZWcgKiA0KSk7CisJCXJldHVy
biBhdG9taWM2NF9yZWFkKChhdG9taWM2NF90ICopKGFkZXYtPnJtbWlvICsgKHJlZyAqIDQpKSk7
CiAJZWxzZQogCQlCVUcoKTsKLQotCXJldHVybiByZXQ7CiB9CiAKIC8qKgpAQCAtMjk0LDcgKzI5
MCw3IEBAIHVpbnQ2NF90IGFtZGdwdV9tbV9ycmVnNjQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsIHVpbnQzMl90IHJlZykKIHZvaWQgYW1kZ3B1X21tX3dyZWc2NChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwgdWludDMyX3QgcmVnLCB1aW50NjRfdCB2KQogewogCWlmICgocmVnICogNCkg
PCBhZGV2LT5ybW1pb19zaXplKQotCQl3cml0ZXEodiwgKCh2b2lkIF9faW9tZW0gKilhZGV2LT5y
bW1pbykgKyAocmVnICogNCkpOworCQlhdG9taWM2NF9zZXQoKGF0b21pYzY0X3QgKikoYWRldi0+
cm1taW8gKyAocmVnICogNCkpLCB2KTsKIAllbHNlCiAJCUJVRygpOwogfQotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
