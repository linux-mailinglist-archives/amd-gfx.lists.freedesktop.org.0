Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B13D29E3D6
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 11:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407D18984E;
	Tue, 27 Aug 2019 09:20:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800040.outbound.protection.outlook.com [40.107.80.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684388984E
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 09:20:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pic64DnyZu6yIIbJJUxeiBsm03UIajgp3nrvuZUp6vJAtV68CQN88m3gOM3yIt3VQ3hjfTc/6NqByGBzfGLghHMgLRXJY6VkEv/xXxp+i9+QQaGxlPALBnOhXuNnLrTKIH04LonBGTxh7Xig9kkauiGXKoZC5/kgsFHtbNzkhif9ivXb3SdnHNNO4lk49B0wg1fP6nBytkxc30gNuc9tVmnXIyfS3M6HZ/OXE0yfl//pGCj9ToRIJW6GIfdhY7a6zBASIH6DBniiTHkYjHhqoL2AIRsi/cSxeDJQN6ZMnw7JzkWD3E7o6k66IoJgX+BjQnyF0/nwWH+OTAfFfxsP0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZNvuBApAGHEwbREJN27QhGpeYBBOfncZdMXrc/fjrs=;
 b=Nt1UH+9Ycja5cv6h0ZvOt3STkPKrVnM/catmcWeuKQxP2ky3t8utEgJ5r8Wm5ydjUtRPHvJg0gaqpmrHELo0K3f+Cv9pxY0XlKzCAzCme56Jz5dA9kl9fIzJC4bJXGMbCBV+PgAzexcE3AMsGixyyvxDjqBe30jPT3Ed6EIpFXoKgMq826S1PJhvfcNY1f37t81by5P9HH8MvgI8Jdu3vrLCaj7NNlqMSgIgriwuKJ6s4Yu2J47J8cGm0ddofhz5Qty5WgMQRcpsqiPts/V/UufoUdIbJ9XqYbZSXuk5IvazDljml33RopnbS638cbghrs4gHsycGANL89M+Jbeb+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0002.namprd12.prod.outlook.com (2603:10b6:4:1::12) by
 CY4PR12MB1270.namprd12.prod.outlook.com (2603:10b6:903:43::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 27 Aug 2019 09:20:05 +0000
Received: from CO1NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by DM5PR12CA0002.outlook.office365.com
 (2603:10b6:4:1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Tue, 27 Aug 2019 09:20:05 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT048.mail.protection.outlook.com (10.152.81.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 27 Aug 2019 09:20:05 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 27 Aug 2019 04:20:04 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: correct in_suspend setting for navi series
Date: Tue, 27 Aug 2019 17:19:53 +0800
Message-ID: <1566897593-2630-1-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(2980300002)(428003)(189003)(199004)(305945005)(26005)(70586007)(2906002)(16586007)(6916009)(316002)(70206006)(47776003)(356004)(6666004)(51416003)(7696005)(50226002)(5660300002)(14444005)(86362001)(48376002)(53416004)(2616005)(486006)(81156014)(81166006)(8676002)(476003)(36756003)(8936002)(186003)(2351001)(426003)(50466002)(53936002)(478600001)(336012)(126002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1270; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60f1b649-528b-411f-6b05-08d72acfbf67
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CY4PR12MB1270; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1270:
X-Microsoft-Antispam-PRVS: <CY4PR12MB127066FCAAF165A9537CCB99FCA00@CY4PR12MB1270.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 0142F22657
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: vinrde+KSPJ4+si7sRS+VjeVQCuWpf+GJ0mOqYBqC2a8kfzvxoFQVH8eW+utijfRSHV07wi9pt+HRnLL1cHNJ/SxI0zKu11dNQaYyVxoYRRTuwtHtLQdVEvcdgELpC08Zg0jXSvLJQ8INMwCQ4Ldm32hpXq/DFtCdRXaSD+NDNCHgFwib+gyROzZF+yLvJZFtPK72TA4+kH7XXfv+RLmpWJyLhVb6XkHpEU59AK1sZmsbdTm67R60txiKmzwEKZVhYTE33Pxl7Wdip/NBhxpewFYwppyo9PpGjAxgIT/3IOnPwuaJRr0P5or4Q5rx5WJvrmgOuE+E6U2eGJJqtw8p6VRPTqY0RRukl16VDdd1uOK6LPjmlefKRtdVqYZBMqQSnX0NLlhADtzCS5xu50N1XmS6Axbd6TScvpJM8yc9r4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2019 09:20:05.2105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f1b649-528b-411f-6b05-08d72acfbf67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1270
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZNvuBApAGHEwbREJN27QhGpeYBBOfncZdMXrc/fjrs=;
 b=1M3c46DPQawZZ4ifPRdCc8g9KYch3wPfgdaipZ9MADCupLgAhyjX2QyA+Dl1VNoo0ultEhOdX2rWhe5lVJ9zFU9yntaIU508/4VJ2F3Zs/nTbFd1qUpIHKfzvu6wyUI5lL06zhvvn47HpDr8IJM9UgWZ3+a+2huvBkpeT3YOTUM=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

aW5fc3VzcGVuZCBmbGFnIHNob3VsZCBiZSBzZXQgaW4gYW1kZ3B1X2RldmljZV9zdXNwZW5kL3Jl
c3VtZSBpbiBwYWlycywKaW5zdGVhZCBvZiBnZngxMCBpcCBzdXNwZW5kL3Jlc3VtZSBmdW5jdGlv
bi4KClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyB8IDEyICsrLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCBmNzA4OTEyLi5hMmY0ZmYx
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwpAQCAtMzc2OCwyMCArMzc2
OCwxMiBAQCBzdGF0aWMgaW50IGdmeF92MTBfMF9od19maW5pKHZvaWQgKmhhbmRsZSkKIAogc3Rh
dGljIGludCBnZnhfdjEwXzBfc3VzcGVuZCh2b2lkICpoYW5kbGUpCiB7Ci0Jc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7Ci0KLQlhZGV2
LT5pbl9zdXNwZW5kID0gdHJ1ZTsKLQlyZXR1cm4gZ2Z4X3YxMF8wX2h3X2ZpbmkoYWRldik7CisJ
cmV0dXJuIGdmeF92MTBfMF9od19maW5pKGhhbmRsZSk7CiB9CiAKIHN0YXRpYyBpbnQgZ2Z4X3Yx
MF8wX3Jlc3VtZSh2b2lkICpoYW5kbGUpCiB7Ci0Jc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYg
PSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7Ci0JaW50IHI7Ci0KLQlyID0gZ2Z4X3Yx
MF8wX2h3X2luaXQoYWRldik7Ci0JYWRldi0+aW5fc3VzcGVuZCA9IGZhbHNlOwotCXJldHVybiBy
OworCXJldHVybiBnZnhfdjEwXzBfaHdfaW5pdChoYW5kbGUpOwogfQogCiBzdGF0aWMgYm9vbCBn
ZnhfdjEwXzBfaXNfaWRsZSh2b2lkICpoYW5kbGUpCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
