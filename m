Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8374585B1C
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 08:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2732C89180;
	Thu,  8 Aug 2019 06:54:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720073.outbound.protection.outlook.com [40.107.72.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E783D88E46
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 06:54:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkwJ/kd12rm2Bxy+xP+PTrEaaXFpOppcrIpR3htWydzrM7AG50N+smO+jr+PzYmCYuu8u00khD48//0TJ0n6B+aT9Zn7P3ozqazrekoWiSqNzTTWwKXEzSN2h2bxsPDSu/H9csn611Yhfn904czPF4aPKTdpmasHDchTD108HQkXAM8vkRQV0C4vSirt+mBX1z/2BXBfevPmfhS+TbxVRvXNJyv1i12bqqgMkJ7wXBCSCrqsXXG9IhSPI34A/h77Ae/BquwD5+/IRTYpv7WWRhiOpBNC/ZsM2GZiTHaOAy3YTmAp4TGRtcSyFCt6zAY+gaYxX3/8VQvuanoSLB6Vtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfkAOInbMqlSAIEdoNcS1/HfYzUqqk6t/AGu/EeECFA=;
 b=J+MwuSzEWECMi/EIXlgWUV3F/g72+/3oBfMVsKwDwRl9Xv+kOOtsXtp+BdMaAHpXyT1plXQdi15Oh/lSVD+dKtf7ii9EPpd3xsQFnkDXOjif+0MHWQNjZ1VD66G0WxgtxKH/E+7Wzs/9S32Ywl4NF0WbDmDyoeIKmqqScVqKd/XNqbEzNk/2nK6TiWZ5WvmRsuXbt+yqKqLPwbIQ4lFKESdj3Qr+880G3iS7NexPFCMDHUaCpOqQiCstFTKphmwRU4blDlIc13zYhEInvlhrCEVMJHd7AIOiqpsO4gt0rkZkFaewH1NULr2U8Xw7Dm4fAtd7SbYjZwPdSRnAw0pFmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0008.namprd12.prod.outlook.com (2603:10b6:5:1c0::21)
 by MWHSPR00MB239.namprd12.prod.outlook.com (2603:10b6:301:11::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.13; Thu, 8 Aug
 2019 06:54:22 +0000
Received: from DM3NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by DM6PR12CA0008.outlook.office365.com
 (2603:10b6:5:1c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.14 via Frontend
 Transport; Thu, 8 Aug 2019 06:54:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT007.mail.protection.outlook.com (10.152.82.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Thu, 8 Aug 2019 06:54:21 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 8 Aug 2019
 01:54:20 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <guchun.chen@amd.com>, <dennis.li@amd.com>, <xinhui.pan@amd.com>,
 <john.clements@amd.com>
Subject: [PATCH 2/3] drm/amdgpu: support mmhub ras in amdgpu ras
Date: Thu, 8 Aug 2019 14:53:50 +0800
Message-ID: <20190808065351.510-2-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190808065351.510-1-tao.zhou1@amd.com>
References: <20190808065351.510-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(396003)(2980300002)(428003)(199004)(189003)(356004)(4744005)(70206006)(6666004)(70586007)(426003)(486006)(76176011)(26005)(47776003)(186003)(16586007)(316002)(1076003)(11346002)(2906002)(2201001)(36756003)(476003)(2616005)(126002)(4326008)(6636002)(478600001)(8936002)(50226002)(53936002)(305945005)(8676002)(50466002)(336012)(446003)(110136005)(51416003)(7696005)(5660300002)(53416004)(81166006)(81156014)(86362001)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHSPR00MB239; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4751fd0-1628-4120-0ae3-08d71bcd3ded
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHSPR00MB239; 
X-MS-TrafficTypeDiagnostic: MWHSPR00MB239:
X-Microsoft-Antispam-PRVS: <MWHSPR00MB239C2527253F3582983B2F8B0D70@MWHSPR00MB239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-Forefront-PRVS: 012349AD1C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: NlicaP+sVXIioZXxMYO5ewtF+YEKqNqEAmQUFkQ0q05xzGEPS/lKgADDkq2nv4VQ73tZVKWck+lHS0ygcFeeWGDYGXF6FnJnqNXBWE7ixY8KATvz4VM/Fwydm++2aLmSrMGJiVaG8lx0TsEt6s5oHmX88ZJlOXTuYKvAfBeqvsAaNkjmL6jnsKqMMM8a6jlqIF4QI8+xnYXFnGxvigC3NCAox35bN403Qytsvo95wSVEPVq7z3yiYjFKLf1xM66Swf7CBmtOi2NFHUlO1fG1pq6zpjO6cdLrmX7W581ACT+cwQRovlrrm1/UyJE2M187ZwgVkQ9UOXUIhwdpePS7+SdNM7FqbOkJGrs41aI7JaR/bzGDc9HqVGENKpxk8S/LUppWSYQv56u3iK3mCycLV2P/PkPfBphKpOQDRmHLCTE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2019 06:54:21.5914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4751fd0-1628-4120-0ae3-08d71bcd3ded
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHSPR00MB239
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfkAOInbMqlSAIEdoNcS1/HfYzUqqk6t/AGu/EeECFA=;
 b=gc0V5axntsztNRwDBfa6hPQfNgp5WIbw+ftXA+f9yJW43lCK0d5Jt3ZlPqeFhg4tCHyAKx4z9K2YFP98lxxLStQB1zWjKfclZclAX/x/4ZvlAk0P9xN24RgutmLNnMV7g87B8aXvVjaTBsFR1dohIYn5e6P3xIakiB99gAv+3eA=
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Y2FsbCBtbWh1YiByYXMgcXVlcnkvaW5qZWN0IGluIGFtZGdwdSByYXMKClNpZ25lZC1vZmYtYnk6
IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcmFzLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCmluZGV4IGJjNzY2Y2Ri
ZWFhZS4uYmU1OTEwMjUyNmExIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5jCkBAIC02MTIsNiArNjEyLDEwIEBAIGludCBhbWRncHVfcmFzX2Vycm9yX3F1ZXJ5KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LAogCQlpZiAoYWRldi0+Z2Z4LmZ1bmNzLT5xdWVyeV9yYXNf
ZXJyb3JfY291bnQpCiAJCQlhZGV2LT5nZnguZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9jb3VudChh
ZGV2LCAmZXJyX2RhdGEpOwogCQlicmVhazsKKwljYXNlIEFNREdQVV9SQVNfQkxPQ0tfX01NSFVC
OgorCQlpZiAoYWRldi0+bW1odWJfZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9jb3VudCkKKwkJCWFk
ZXYtPm1taHViX2Z1bmNzLT5xdWVyeV9yYXNfZXJyb3JfY291bnQoYWRldiwgJmVycl9kYXRhKTsK
KwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJYnJlYWs7CiAJfQpAQCAtNjU3LDYgKzY2MSw3IEBAIGlu
dCBhbWRncHVfcmFzX2Vycm9yX2luamVjdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJ
CXJldCA9IC1FSU5WQUw7CiAJCWJyZWFrOwogCWNhc2UgQU1ER1BVX1JBU19CTE9DS19fVU1DOgor
CWNhc2UgQU1ER1BVX1JBU19CTE9DS19fTU1IVUI6CiAJCXJldCA9IHBzcF9yYXNfdHJpZ2dlcl9l
cnJvcigmYWRldi0+cHNwLCAmYmxvY2tfaW5mbyk7CiAJCWJyZWFrOwogCWRlZmF1bHQ6Ci0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
