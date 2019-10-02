Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40674C907C
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6768D6E18F;
	Wed,  2 Oct 2019 18:16:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740089.outbound.protection.outlook.com [40.107.74.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E496E15A
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LP+co9OEMPGrPmyaGOCYGusk/HgyzacnK082kflMvqX+4UYW8JSdQxkmVUAxqkMhcwPY7af1qMg2NpeXG3BHIf/qW1yfMEKyueUpHR6abbElmXe1YuHNBo1280QRyFkqKmkV7fh2/+EVIzpOzM/bcLbN4yh6TMrPiH/XlBZACLwzMlrHJC5EKseARvj32cVcJHIANteIqlFYQ8217oWg0gVu5n1ftwArYWJxmWQY/lSAzrVyDaGzZ+nfejPJmPyQpZa+yRjQbDhlnr78kgqJIGXRkjsAM1PIMJmzlX9w2TUlbvULMit7If8boaZQpCMqjRcJj7BC8jbktnJfETyk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f//h5Aou5W7pM3HPTBBLC22F/a4bXzJ68KOfrnJyxvI=;
 b=CN1xH04CVO9dTPI2rv58boZanMnZni3HTq6W3tnkGblWWO+BjrvddtmZ00p/U7vpobXLvP7wC1mEB1lQoYmtPEXbouIqn79LKiJw9cPdHX7dVWabRsujqPH8krCqN7B6ohjXsHd+an8zRELHa73oryiUZy49fmSME3Sw1z6aV9J4WfZVO6dMxPR97Nf/WzINDH27+byEwXO+vP7uQNYC4FsKvLkHc+gnVDmPOUy2QFudgMVmwLbNtPTkrBT2CYvIYL78ZOIg5ACbd1rq013XpV5iYK0+46VCzRRK3p6dv3iN1H5gstlix6rynBfMQzAO6MJ7Nfu8p5oTNGHct0nb7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0131.namprd12.prod.outlook.com (2603:10b6:0:51::27) by
 BYAPR12MB2694.namprd12.prod.outlook.com (2603:10b6:a03:69::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 18:16:37 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by DM3PR12CA0131.outlook.office365.com
 (2603:10b6:0:51::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:37 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:37 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:36 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/38] drm/amd/display: skip enable stream on disconnected
 display
Date: Wed, 2 Oct 2019 14:15:58 -0400
Message-ID: <20191002181633.22805-4-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(346002)(428003)(199004)(189003)(6666004)(26005)(8936002)(47776003)(186003)(446003)(86362001)(1076003)(2351001)(4326008)(2906002)(6916009)(11346002)(81166006)(81156014)(8676002)(486006)(476003)(2616005)(336012)(51416003)(426003)(478600001)(50226002)(126002)(7696005)(76176011)(53416004)(70206006)(70586007)(16586007)(316002)(5660300002)(5024004)(14444005)(305945005)(48376002)(356004)(36756003)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2694; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55f887b2-1371-4731-2c08-08d74764aa54
X-MS-TrafficTypeDiagnostic: BYAPR12MB2694:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2694279C912FC79F5904E3BAF99C0@BYAPR12MB2694.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hAARU4JfeH/D4n9XGP7yy4saPsJMwuFqY0BFJUHl3cAf0Rt8lHDTa6Wx7DpfhmHX7TVryYRCcBCPJ7dbZlvjnqEmIDTqaueEGSPn60QZmjDPE/ZJ9jVm2284ZJm74Lyt/ajGV+dXkLQWh7ApNjMz2X3gUC9V1GyHKrEVYvNGX6NksRAOMHO/neLiPlKAeKDyfZtU6zat4Cx0kxegZU8XShlpW3nt82g5q0LCruK2ifPoJfm9CqmI2byAz55+OfHzgRBNbwQn6+4X/RJpmCYwQAcKrvpt8sRYX4YbIzoBszOrdNBL89D0lb6jK0CnTEgpFGV4yI51kgQbRVr8A/orMAHjzFQp8z6GWD8LqAU9IzEtUU5V0Ef2z0E1JqZSC2P5Qxr93VK5qAtotLea3VGrj5f+pZGf5zQ9c+fUG1QJTvc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:37.5238 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f887b2-1371-4731-2c08-08d74764aa54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2694
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f//h5Aou5W7pM3HPTBBLC22F/a4bXzJ68KOfrnJyxvI=;
 b=y+hZuu5QjE51FmCjdGGbVhjU8i1t2dBU/dua+JXekZsy+9SsHtdZC1Uo8EgOEcPi4jgrIUXInVN2IoUxsZxkw4EX6fR3pqt4smYmStaN4I5a3mtUWQ46vD5qFCxVx24e3vmASv/WGf6o73CJxohGmJz8xjxeaC3ElxElUbuW1tg=
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
Cc: Wenjing Liu <Wenjing.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+Cgpbd2h5XQpWaXJ0dWFsIHNp
Z25hbCBtZWFucyB0aGVyZSBpcyBubyBkaXNwbGF5IGF0dGFjaGVkLgpJbiB0aGlzIGNhc2Ugd2Ug
d2lsbCBhc3NpZ24gYSB2aXJ0dWFsIHNpZ25hbCB0eXBlIHRvIHRoZSBzdHJlYW0uCldlIHNob3Vs
ZCBvbmx5IGVuYWJsZSB0aGUgZnJvbnQgZW5kIG9mIHRoZSBzdHJlYW0gYnV0IG5vdCB0aGUgYmFj
ayBlbmQuCgpbaG93XQpXaGVuIHN0cmVhbSBpcyBlbmFibGluZyB3aXRoIHZpcnR1YWwgc2lnbmFs
IHR5cGUsIHNraXAgYmFja2VuZCBwcm9ncmFtbWluZy4KCkNoYW5nZS1JZDogSThlMWZlODVhNjZl
YWE3NTdhZWM4OGUxYTAzNjBmMWZhNmNlZTMzOTcKU2lnbmVkLW9mZi1ieTogV2VuamluZyBMaXUg
PFdlbmppbmcuTGl1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBKdW4gTGVpIDxKdW4uTGVpQGFtZC5j
b20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgfCA4
ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCmluZGV4IDMzZDRjYzQ5NWFkMS4u
MTdjOTcyY2E2YmViIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUv
ZGNfbGluay5jCkBAIC0yNzE4LDYgKzI3MTgsMTAgQEAgdm9pZCBjb3JlX2xpbmtfZW5hYmxlX3N0
cmVhbSgKIAllbnVtIGRjX3N0YXR1cyBzdGF0dXM7CiAJRENfTE9HR0VSX0lOSVQocGlwZV9jdHgt
PnN0cmVhbS0+Y3R4LT5sb2dnZXIpOwogCisJaWYgKCFJU19GUEdBX01BWElNVVNfREMoY29yZV9k
Yy0+Y3R4LT5kY2VfZW52aXJvbm1lbnQpICYmCisJCQlkY19pc192aXJ0dWFsX3NpZ25hbChwaXBl
X2N0eC0+c3RyZWFtLT5zaWduYWwpKQorCQlyZXR1cm47CisKIAlpZiAoIWRjX2lzX3ZpcnR1YWxf
c2lnbmFsKHBpcGVfY3R4LT5zdHJlYW0tPnNpZ25hbCkpIHsKIAkJc3RyZWFtLT5saW5rLT5saW5r
X2VuYy0+ZnVuY3MtPnNldHVwKAogCQkJc3RyZWFtLT5saW5rLT5saW5rX2VuYywKQEAgLTI4NjAs
NiArMjg2NCwxMCBAQCB2b2lkIGNvcmVfbGlua19kaXNhYmxlX3N0cmVhbShzdHJ1Y3QgcGlwZV9j
dHggKnBpcGVfY3R4KQogCXN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVhbSA9IHBpcGVfY3R4
LT5zdHJlYW07CiAJc3RydWN0IGRjX2xpbmsgKmxpbmsgPSBzdHJlYW0tPnNpbmstPmxpbms7CiAK
KwlpZiAoIUlTX0ZQR0FfTUFYSU1VU19EQyhjb3JlX2RjLT5jdHgtPmRjZV9lbnZpcm9ubWVudCkg
JiYKKwkJCWRjX2lzX3ZpcnR1YWxfc2lnbmFsKHBpcGVfY3R4LT5zdHJlYW0tPnNpZ25hbCkpCisJ
CXJldHVybjsKKwogI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfRENfSERDUCkKIAl1cGRhdGVf
cHNwX3N0cmVhbV9jb25maWcocGlwZV9jdHgsIHRydWUpOwogI2VuZGlmCi0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
