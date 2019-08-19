Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 389DC926F7
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF2F6E170;
	Mon, 19 Aug 2019 14:35:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790080.outbound.protection.outlook.com [40.107.79.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E8F6E15C
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJiC2/datsUPeVHnJ/JG5nnBhDmNiAnG/8ZMPYybpsGP9ILNJAMIbl9535fe5snOT01rDicdqX9trKcrD3/f8mHDpxtnvESCasFJjrd8LUIfQvFlZ6fKhq93yS+Vdk5Bb0NOtkvQtjsXVdY9j/tXz9NfRtuTMtIS/lesaqgDDYny2wqIUG3WY4fT/ovzekjQX/Rq2+Tk/y7J3xadA6ZYDzkbsHAzV4ddUFeT3JeaZQL+K+8cOc+1lupSmucvfSzRKXylIim/6lOrUpGgyiF690UW09RjrdqyAnxH5vsyboQ6VmlDDqDhVr/LguSqzqwvncm75GvkZ00gI3C4E9X3OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/NwNLKBdW6ZgUzgFA86xgW3SDHjcS1EGwzFmOdcURc=;
 b=dKkjMCzMQKBPy7ZX08Qgv2FMNMkfeJJH/pb72rfMJUPh5aVkn36sjKb0vxPUBKmI7wamHHCxDkbQHglqVQZ7vw5ybsW6dItxkqNPpgKZKIvtbHE0o7M/wvxBJpA9kxmlO/hrQX5MYSTdl4vpEFIrhvmBHNqin4T7cVTvfPcc9tcUi30sbMNjqNa+8bT620l01adti9yiSPLGst9tegHrp3ctvVjMeivLZFPhVnItxYpSmfqoL6nY44L/VbqGPRNLpU59zU1bCLfARyuTpTCkbMXYARMjDye3LAQf5rU7t8bH8lkl01pCh2saiEdF7WY+eEJl48Cr9I8LhVEGox20+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0021.namprd12.prod.outlook.com (2603:10b6:4:1::31) by
 CY4PR12MB1269.namprd12.prod.outlook.com (2603:10b6:903:40::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 14:35:52 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM5PR12CA0021.outlook.office365.com
 (2603:10b6:4:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:35:51 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:43 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/36] drm/amd/display: remove unused function
Date: Mon, 19 Aug 2019 10:34:53 -0400
Message-ID: <20190819143515.21653-15-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(2980300002)(428003)(199004)(189003)(76176011)(26005)(8936002)(48376002)(50466002)(4326008)(2906002)(6666004)(356004)(7696005)(2351001)(50226002)(51416003)(47776003)(16586007)(316002)(478600001)(336012)(70206006)(53936002)(8676002)(53416004)(186003)(1076003)(36756003)(426003)(70586007)(305945005)(6916009)(446003)(5660300002)(81166006)(81156014)(86362001)(486006)(2616005)(476003)(11346002)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1269; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afbe8d22-fcab-402c-f979-08d724b28910
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1269; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1269:
X-Microsoft-Antispam-PRVS: <CY4PR12MB126983F22F68489F13DFD21FF9A80@CY4PR12MB1269.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:127;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: XwIh7icSFV2Ov7ESAW1tqe0em3mYaM6lNqLnYIn6hw6AwEgw/VhJpOvYMsTGA/K5XdMZWgrtk9eBI9nkwe/TVfh8fgMvg3NWFGgj58R323Z/FURO36k/VrCgTO5PGJdia/3OjK3THLUZeD414IPklT4SC+AiM0bH3+TmOKVm1fAlHeB65hUQiCYEEcazMfIYr8K6F9QFHUsXmGmUfS/R/1SGyrsCv7PPEunsO2IfYl9554uvzjRK4CxbC8WOBm5Ajt+3a+//nybJk6U9eWuYLRm0jF76wiPn/pEK8RCOf5PhuSWqQKJA8OnMGq7TdJxGDKW7mfqh38ovFioKbq9u9XuG5l+yFnCkU8p+xXdU0DWp8js7yLqhh+4MCZ+wtnq2acUbkVQPv6zSDflw+AdLJ1bwQxBSO9TQrg+UK09+Xxs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:51.7022 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afbe8d22-fcab-402c-f979-08d724b28910
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1269
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/NwNLKBdW6ZgUzgFA86xgW3SDHjcS1EGwzFmOdcURc=;
 b=SaxDQ2p/+CRUoyQc3iwO3KgIikgXyJQbQkVSaPIs1EZmrPLn4uALiuKFQ6H3FfCZir1XObsnycLGLehv2FJSs7m4rNry7onHo/BaXwLbmtboNKOR/QldjA/+DEGAxOjt4AebUxRo8LS9rxdPDax7aa8hWothfL3+jcCeEfmvyJo=
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
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUWluZ3FpbmcgWmh1byA8cWluZ3Fpbmcuemh1b0BhbWQuY29tPgoKW1doeV0KVGhpcyBm
dW5jdGlvbiBpcyBub3QgYmVpbmcgdXNlZCwgaXQgd2FzIGxlZnQgaW4Kd2hlbiBpbnRyb2R1Y2lu
ZyBEQ04yCgpbSG93XQpSZW1vdmUgdGhlIGZ1bmN0aW9uCgpTaWduZWQtb2ZmLWJ5OiBRaW5ncWlu
ZyBaaHVvIDxxaW5ncWluZy56aHVvQGFtZC5jb20+ClJldmlld2VkLWJ5OiBFcmljIEJlcm5zdGVp
biA8RXJpYy5CZXJuc3RlaW5AYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxC
aGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9vcHAuYyB8IDEgLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2luYy9ody9vcHAuaCAgICAgIHwgNSAtLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9vcHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9vcHAuYwppbmRleCBkOWU3YzcxMWE3MWMuLjQwMTY0ZWQwMTVlYSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX29wcC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9vcHAuYwpAQCAtMzMyLDcgKzMz
Miw2IEBAIHN0YXRpYyBzdHJ1Y3Qgb3BwX2Z1bmNzIGRjbjIwX29wcF9mdW5jcyA9IHsKIAkJLm9w
cF9zZXRfZGlzcF9wYXR0ZXJuX2dlbmVyYXRvciA9IG9wcDJfc2V0X2Rpc3BfcGF0dGVybl9nZW5l
cmF0b3IsCiAJCS5kcGdfaXNfYmxhbmtlZCA9IG9wcDJfZHBnX2lzX2JsYW5rZWQsCiAJCS5vcHBf
ZHBnX3NldF9ibGFua19jb2xvciA9IG9wcDJfZHBnX3NldF9ibGFua19jb2xvciwKLQkJLm9wcF9j
b252ZXJ0X3B0aSA9IE5VTEwsCiAJCS5vcHBfZGVzdHJveSA9IG9wcDFfZGVzdHJveSwKIAkJLm9w
cF9wcm9ncmFtX2xlZnRfZWRnZV9leHRyYV9waXhlbCA9IG9wcDJfcHJvZ3JhbV9sZWZ0X2VkZ2Vf
ZXh0cmFfcGl4ZWwsCiB9OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2luYy9ody9vcHAuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcv
b3BwLmgKaW5kZXggNWQ4YTdiY2NjYzZmLi45NTdlOTA0NzM4MWEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvb3BwLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9vcHAuaApAQCAtMzE2LDExICszMTYsNiBAQCBzdHJ1
Y3Qgb3BwX2Z1bmNzIHsKIAlib29sICgqZHBnX2lzX2JsYW5rZWQpKAogCQkJc3RydWN0IG91dHB1
dF9waXhlbF9wcm9jZXNzb3IgKm9wcCk7CiAKLQl2b2lkICgqb3BwX2NvbnZlcnRfcHRpKSgKLQkJ
c3RydWN0IG91dHB1dF9waXhlbF9wcm9jZXNzb3IgKm9wcCwKLQkJYm9vbCBlbmFibGUsCi0JCWJv
b2wgcG9sYXJpdHkpOwotCiAJdm9pZCAoKm9wcF9kcGdfc2V0X2JsYW5rX2NvbG9yKSgKIAkJCXN0
cnVjdCBvdXRwdXRfcGl4ZWxfcHJvY2Vzc29yICpvcHAsCiAJCQljb25zdCBzdHJ1Y3QgdGdfY29s
b3IgKmNvbG9yKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
