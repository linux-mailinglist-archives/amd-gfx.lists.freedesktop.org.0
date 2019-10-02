Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A490DC9096
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A856E96B;
	Wed,  2 Oct 2019 18:16:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710053.outbound.protection.outlook.com [40.107.71.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1526E974
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrFIDRcLL/+XO1uwLpF1hZVKcXQAOSDV72v3mMWYXQCY2bnnWzsspHUrdfuc5sKxtJBBsndFjBKLjzel0hcF/l8WZVRMpoYV0hQ7/kPAhQfJkH3WgViMUiGJNgd3wTFP8OXZvXZ0240rNR+KPJnkaKeoZZuNVjK3DH5hWOUhocFiOxtcTY/a6/GmwYx6khzwOBrAdvCFo4dqxkhRoQwAhu0Q7+bGOp11553SeMsX6xWgLcTLwn5ikHmF54jqX+UUcV/zflY5zVw5G4dkefYHGaL0wla6k2KV7PxY1Ue104jGj1qnZyfyx2WceTJachWY4fk2vYc2ItPRzv2o7IiO4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvOA1n55xt2I63Yn5PV9mdcHfT358aZfToAt4IBNmys=;
 b=G2p15C38UnrbQmRTg7e4eh2r1TUB4yOygNGa7UkAV09/L8Vl4oLqpv5RZ0jl8I9lHdoWKsMN+F4issJd44PWH5QERXkzTk8Pua9At5j7sMVNfC2b1IE+FSWeGGIk2/lYnpRCi/aL9rjp16sGOWOhDpiGaI13pCNJOWrgd6uETm20icaU+XVy4gm1sZtvg3FRTjxeRbIzmG9nvL5qh+wuckUoFtFgEfAtA2bCExlT+qFTy2PcI7Uu6kND9Sxr1AXnIIT1XCiZhGgVQHniMa5h5b2ejUhKqO8AXG1sttryk9g0jgob5337xAzHfrlc8ZZ4Ug72r11ftUDk4GbSQSA4+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0020.namprd12.prod.outlook.com (2603:10b6:4:1::30) by
 BN8PR12MB2898.namprd12.prod.outlook.com (2603:10b6:408:9a::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 18:16:49 +0000
Received: from DM3NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by DM5PR12CA0020.outlook.office365.com
 (2603:10b6:4:1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT005.mail.protection.outlook.com (10.152.82.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:49 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:47 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 29/38] drm/amd/display: Fix maybe-uninitialized warning
Date: Wed, 2 Oct 2019 14:16:24 -0400
Message-ID: <20191002181633.22805-30-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(428003)(199004)(189003)(50226002)(1076003)(26005)(426003)(486006)(446003)(51416003)(86362001)(476003)(126002)(14444005)(11346002)(2616005)(186003)(4326008)(48376002)(8936002)(47776003)(6916009)(305945005)(5660300002)(6666004)(50466002)(53416004)(2351001)(76176011)(70586007)(478600001)(70206006)(356004)(316002)(8676002)(36756003)(81166006)(7696005)(2906002)(81156014)(16586007)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2898; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33c36c46-d59e-450f-3fa5-08d74764b134
X-MS-TrafficTypeDiagnostic: BN8PR12MB2898:
X-Microsoft-Antispam-PRVS: <BN8PR12MB28987861F2ECC4385CB3E4CFF99C0@BN8PR12MB2898.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T9lcLHbKs96GBkmO4X445Gv32tpK6s1uPc5NPUX3gHa/I3VnZJ/ZSkUF72Z4pEhyVsdq1GLK+7hIaMm4sZDFwr56DBX0LDfAIQJg7IhiyK6AgbFbrvZlrbm+CkYXCX62sqjJiu7XX6hysN4cACCtHX8cxQKbzTyv8IGdp+BsCZNeyFocdqZeweRmL4LplACXNYnrdx1GBVigHeyiWta0xf+ycUOWdoOpMcP7suHS62ltR74LwhrwTYaJfgC24qxUHjmJ3oYMLCHKqeQ4cSwN3x3XzuXn40qzf0Tm5wiYswGOjyASlEFG0jWgxC6YWM8yT8Rh5au0e/3XFshk//+MG8AM5kICLod4AGJ9d9GR8nfhtYYXil2BR41vnMiAqu4B2TQ+K9BvWmFMZUgkNTnuuPsaqnqe+Z1Ec8SvYDrFRiM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:49.0156 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c36c46-d59e-450f-3fa5-08d74764b134
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2898
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvOA1n55xt2I63Yn5PV9mdcHfT358aZfToAt4IBNmys=;
 b=xj4rMUQCgR03mK3iAwT3flAVyKnZrcfLQUzVf6Be3wXMshLxMvegz2P4JwIsl29p6FDY3XKJecOAT4MnM+5vHwHZu5oY1kBevSli6I7y0KIuWbRWDl/Un4yLp9msxgqP0RdsxECoNXr6N0V9rIrOj8PnJczsaFbSskRvfKiLM7c=
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
Cc: Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpbV2h5XQoKQ29tcGlsaW5nIHdpdGgg
R0NDIDkuMS4wIGdpdmVzIHRoZSBmb2xsb3dpbmcgd2FybmluZyAoSSBoYXZlCndhcm5pbmdzLWFz
LWVycm9ycyBlbmFibGVkKToKCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2RhbC1kZXYv
ZGMvY29yZS9kYy5jOiBJbiBmdW5jdGlvbiAnZGNfdmFsaWRhdGVfc2VhbWxlc3NfYm9vdF90aW1p
bmcnOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kYWwtZGV2L2RjL2NvcmUvZGMuYzox
MTgwOjg6IGVycm9yOiAnc2UnIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5j
dGlvbiBbLVdlcnJvcj1tYXliZS11bmluaXRpYWxpemVkXQogMTE4MCB8ICAgaWYgKCFzZS0+ZnVu
Y3MtPmRwX2dldF9waXhlbF9mb3JtYXQoCiAgICAgIHwgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KIDExODEgfCAgICBzZSwKICAgICAgfCAgICB+fn4KIDExODIgfCAgICAm
aHdfY3J0Y190aW1pbmcucGl4ZWxfZW5jb2RpbmcsCiAgICAgIHwgICAgfn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fgogMTE4MyB8ICAgICZod19jcnRjX3RpbWluZy5kaXNwbGF5X2NvbG9y
X2RlcHRoKSkKCltIb3ddCgpJbml0aWFsaXplIHNlIHRvIE5VTEwuCgpDaGFuZ2UtSWQ6IEk3OWQ4
OWVhNTE4Zjg2MmE5NDc5NTgxNTI5ZGJiZTg5NzdlMjI0Y2UyClNpZ25lZC1vZmYtYnk6IExlbyBM
aSA8c3VucGVuZy5saUBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPEhhcnJ5
LldlbnRsYW5kQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJl
ZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kYy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKaW5kZXggMzQxNmM4
YmQwOWFlLi44MjRjMGQzYjIxMDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jb3JlL2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGMuYwpAQCAtMTAwNCw3ICsxMDA0LDcgQEAgYm9vbCBkY192YWxpZGF0ZV9zZWFtbGVzc19i
b290X3RpbWluZyhjb25zdCBzdHJ1Y3QgZGMgKmRjLAogCQkJCXN0cnVjdCBkY19jcnRjX3RpbWlu
ZyAqY3J0Y190aW1pbmcpCiB7CiAJc3RydWN0IHRpbWluZ19nZW5lcmF0b3IgKnRnOwotCXN0cnVj
dCBzdHJlYW1fZW5jb2RlciAqc2U7CisJc3RydWN0IHN0cmVhbV9lbmNvZGVyICpzZSA9IE5VTEw7
CiAKIAlzdHJ1Y3QgZGNfY3J0Y190aW1pbmcgaHdfY3J0Y190aW1pbmcgPSB7MH07CiAKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
