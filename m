Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EAF955E4
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 06:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B86B6E5C8;
	Tue, 20 Aug 2019 04:24:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720085.outbound.protection.outlook.com [40.107.72.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80596E5C1
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 04:23:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bmn9pHuCsnvXyRAEJELfx06Fhza5qCREyHb2RDnx8YH+f75bvkXHz+/cbpTpUPHTjtCpmv5HqBHijCZoopFFi8zkQaHYgkkP4OOVQ0KJsf6VLXOhJ2nm6QvNVyf5ZSiQrjVv/NLgYN0LPgMWHSIRIwXShGg9d/jIrYj6UMCfne2nUXWz16Gxb/ljmSp2gCUWNXA+jeBbIXZzRFIZ5G+Wu+CYInGvtspWxK6vIbfASzbV3MhsI+vGzjqadrclCxMqUrw5Wvs6slhagqr1gBrvjOH/VFlPjeJ2y4cXk1/7WksODI2grY5fBN/lBm/bQP/35jYzOacKtw6jxdtOUyIdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1hUYFqxlhS26LXUfRDL+1+vs1e2t9y6bPBKkH0soOA=;
 b=BMZqWTodjuLwhwmMj/9ROgJjXwgShcw1lPnGJUtiiDi7dn7GZs2JVvMP6y2jwVo80PeTXxcEemiqmSETd6EHjxsVa1VuC6PXkrAh/2wwtyVT3UMHdP1AY6Mc/5UStw2uIUG0Mq7jZI6GwthZWuJw5NjIdVJUfRkzb/YUqd7aMOKB2f2o+67LnPwzZ1PJf4lnBMTfV+z++xqnG0eHH4iYZyt03/yDX2LhSZfXxv63aOI9NcWavTNIgMx2xJsF+Zk4DpNNSjvnr3kCuJTNcU7JfkGIimNrNQvJcB/3r8t8ORnYVSnEjZYM75UULCTIP3Y684Cd3bzH31FY9zaUCmvj+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0003.namprd12.prod.outlook.com (2603:10b6:408:60::16)
 by SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:70::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Tue, 20 Aug
 2019 04:23:57 +0000
Received: from CO1NAM03FT039.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by BN8PR12CA0003.outlook.office365.com
 (2603:10b6:408:60::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 04:23:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT039.mail.protection.outlook.com (10.152.81.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 04:23:56 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 23:23:54 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: correct typo
Date: Tue, 20 Aug 2019 12:23:50 +0800
Message-ID: <20190820042350.2697-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(2980300002)(428003)(189003)(199004)(4326008)(336012)(53416004)(8936002)(36756003)(6916009)(5660300002)(50226002)(316002)(86362001)(51416003)(14444005)(2906002)(2870700001)(7696005)(48376002)(50466002)(2351001)(476003)(126002)(426003)(486006)(305945005)(44832011)(47776003)(1076003)(81156014)(8676002)(81166006)(356004)(6666004)(70206006)(70586007)(2616005)(478600001)(53936002)(186003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2717; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dab08aa-ed5a-422f-b47c-08d72526374d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:SN6PR12MB2717; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2717:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2717E399E7EB3DFB713E5056E4AB0@SN6PR12MB2717.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:398;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: myBZya5oCtUaRxF9kiSuFyeSV57FgUnG3fvHYRKLYvsNM9IdntaIbwp+q3R3Z2ORIpof+8XElEW7oFJxRhdOSC9y0vyNltCCJshOZc5fDJRh4EXn1rXhv5usDF8vpPwYpRmzC1mXXZQW6jkEj2n0vrX9HHbYpuSmvopiULcc6TMmnZsnHNoJlOm4tKsCBktgng4UdqUkR7k3cFl6ke5GIudOSkmyugFwGh3YFxKkjSHt0aEYnTL0VKT9HD6rGb4gv18+YyOJyulJ83/H4e6yxzj18QY5xLjzbysaxVV7A+9NoXhbCLYDqHt67NS37yb0AsUGURGlODeWdPHduOwej/2htGaJ02/9ThMgrqKHt3aOan9JJ8osb1z8UX1+rZv0p4XF9NGmJhNkj7AwupZq9WpRBxybePSaZv9bsYtYRiY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 04:23:56.0957 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dab08aa-ed5a-422f-b47c-08d72526374d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2717
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1hUYFqxlhS26LXUfRDL+1+vs1e2t9y6bPBKkH0soOA=;
 b=DWZT4jjwLTxOJfc9FyKF//ifvXRz1z/VwfrrGC8hBByUBiuu7UzUrR9/w8uDtMfLleEFlooSjqTF/yQAhC/Q7lzC8fsSDkXnzaHTth5XhJUsf9qlttlyHmKQ211QqzN1yrAERmLK6iIPtLt5XBDyEjfbHFl449X5kfrlnHuj7sQ=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

IkNPTVBVVEUiIHdhcyB3cm9uZ2x5IHNwZWxsZWQgYXMgIkNVU1RPTSIuCgpDaGFuZ2UtSWQ6IEkx
MTY5M2MwZTU1YzJjZTVjODg5ZDU3YmI3NDExZmRmOTc5NWE4NzM5ClNpZ25lZC1vZmYtYnk6IEV2
YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYXJjdHVydXNfcHB0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9hcmN0dXJ1c19wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1
cnVzX3BwdC5jCmluZGV4IGIzZDRjZGMzODdjOC4uNmY5ZGFiMWRiMmMyIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYwpAQCAtMTgxLDcgKzE4MSw3IEBA
IHN0YXRpYyBzdHJ1Y3Qgc211XzExXzBfY21uMmFpc2NfbWFwcGluZyBhcmN0dXJ1c193b3JrbG9h
ZF9tYXBbUFBfU01DX1BPV0VSX1BST0ZJCiAJV09SS0xPQURfTUFQKFBQX1NNQ19QT1dFUl9QUk9G
SUxFX0JPT1RVUF9ERUZBVUxULAlXT1JLTE9BRF9QUExJQl9ERUZBVUxUX0JJVCksCiAJV09SS0xP
QURfTUFQKFBQX1NNQ19QT1dFUl9QUk9GSUxFX1BPV0VSU0FWSU5HLAkJV09SS0xPQURfUFBMSUJf
UE9XRVJfU0FWSU5HX0JJVCksCiAJV09SS0xPQURfTUFQKFBQX1NNQ19QT1dFUl9QUk9GSUxFX1ZJ
REVPLAkJV09SS0xPQURfUFBMSUJfVklERU9fQklUKSwKLQlXT1JLTE9BRF9NQVAoUFBfU01DX1BP
V0VSX1BST0ZJTEVfQ09NUFVURSwJCVdPUktMT0FEX1BQTElCX0NVU1RPTV9CSVQpLAorCVdPUktM
T0FEX01BUChQUF9TTUNfUE9XRVJfUFJPRklMRV9DT01QVVRFLAkJV09SS0xPQURfUFBMSUJfQ09N
UFVURV9CSVQpLAogCVdPUktMT0FEX01BUChQUF9TTUNfUE9XRVJfUFJPRklMRV9DVVNUT00sCQlX
T1JLTE9BRF9QUExJQl9DVVNUT01fQklUKSwKIH07CiAKLS0gCjIuMjIuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
