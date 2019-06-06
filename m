Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 640B537F13
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C360A8990D;
	Thu,  6 Jun 2019 20:55:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720088.outbound.protection.outlook.com [40.107.72.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C2F898E4
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:26 +0000 (UTC)
Received: from CY4PR12CA0028.namprd12.prod.outlook.com (2603:10b6:903:129::14)
 by CY4PR12MB1271.namprd12.prod.outlook.com (2603:10b6:903:3d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Thu, 6 Jun
 2019 20:55:25 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by CY4PR12CA0028.outlook.office365.com
 (2603:10b6:903:129::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:24 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:09 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 16/24] drm/amd/display: Remove superflous error message
Date: Thu, 6 Jun 2019 16:54:53 -0400
Message-ID: <20190606205501.16505-17-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(396003)(346002)(376002)(2980300002)(428003)(199004)(189003)(6916009)(76176011)(1076003)(81166006)(8936002)(50226002)(8676002)(15650500001)(356004)(6666004)(86362001)(81156014)(68736007)(305945005)(7696005)(51416003)(47776003)(16586007)(48376002)(5660300002)(70206006)(70586007)(50466002)(72206003)(478600001)(53936002)(36756003)(2906002)(4326008)(11346002)(14444005)(26005)(77096007)(486006)(2616005)(186003)(476003)(126002)(446003)(316002)(336012)(2351001)(426003)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1271; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b996854e-8a11-42f2-ef6f-08d6eac14c56
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1271; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1271:
X-Microsoft-Antispam-PRVS: <CY4PR12MB12715EAFAD505FD5FF1E1C57F9170@CY4PR12MB1271.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: L0l+0oW+AqqDjM4TnJPCRnXYzGZMLMOC/FfT/YKNzOpGIYsd+ccqED3JMs4Uz+hUNI6E3txWl3/UtqSRMdoREMBfsupxziNCTL+WZJ5ScJO+HypephiXX58NB0v8AyTrCWVECrcZ9ECDATA5+Q8wNMmsAYWMW1C9Nr+50gC/CfGyMP9dkpFb+gVT4ytLxaV07+hyklOXy6Xi6zFouncLNGiCRF3czcMh4JRikwt2QDZHSXU7w4gCi+Nt6Sz+v2XU4NXIk1/zSZX4Ui+FiuqK6/J9NgX/Sh3sspPwm5FloY5L0U7qGeQdl1BEQjluako76xPeaWcDwpJ5nDbPlhnnjaPE+lnowtjvu3r2ys3NSmhYGRxCO7t0lnG5ZbzliXpAgPsQViXunIh+YC3pCDFkHSKu5hoREcYiSWVEs0+ry1k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:24.8526 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b996854e-8a11-42f2-ef6f-08d6eac14c56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1271
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjy5wX+b8EkOS8Sq04stPCYJWIzYzrN7YRTTxDp0lJ4=;
 b=PauRm+0effSlNC8UK7F70K0Av7l7v84yNEnIkGXMn9J+z75CA9t3+LJD1lyi5MUqzwHlLD+4srCDzgv3HE9AbQ08O4rEPf5hCen/3dUpSjQuO4ktgxlOwSRAdjQMfii75fMxRw1qEqDCr3+orjyGPMpDQfXX6FhAI5hFyzjlebA=
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
Cc: Jordan Lazare <Jordan.Lazare@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9yZGFuIExhemFyZSA8Sm9yZGFuLkxhemFyZUBhbWQuY29tPgoKW1doeV0KVkJpb3Mg
c29tZXRpbWVzIHJlcG9ydHMgaW5jb3JyZWN0IG9iamVjdCB0eXBlIGFzIGVuY29kZXIgaW5zdGVh
ZCBvZgpjb25uZWN0b3IKCltIb3ddCkNoYW5nZSBlcnJvciBtZXNzYWdlIHRvIGRlYnVnIG1lc3Nh
Z2UKClNpZ25lZC1vZmYtYnk6IEpvcmRhbiBMYXphcmUgPEpvcmRhbi5MYXphcmVAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPgpBY2tl
ZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCmluZGV4IDlmMzJkZGZkZTQxZS4u
MTA4MDdmYTQ2YWQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUv
ZGNfbGluay5jCkBAIC0xMTgwLDcgKzExODAsNyBAQCBzdGF0aWMgYm9vbCBjb25zdHJ1Y3QoCiAJ
bGluay0+bGlua19pZCA9IGJpb3MtPmZ1bmNzLT5nZXRfY29ubmVjdG9yX2lkKGJpb3MsIGluaXRf
cGFyYW1zLT5jb25uZWN0b3JfaW5kZXgpOwogCiAJaWYgKGxpbmstPmxpbmtfaWQudHlwZSAhPSBP
QkpFQ1RfVFlQRV9DT05ORUNUT1IpIHsKLQkJZG1fZXJyb3IoIiVzOiBJbnZhbGlkIENvbm5lY3Rv
ciBPYmplY3RJRCBmcm9tIEFkYXB0ZXIgU2VydmljZSBmb3IgY29ubmVjdG9yIGluZGV4OiVkISB0
eXBlICVkIGV4cGVjdGVkICVkXG4iLAorCQlkbV9vdXRwdXRfdG9fY29uc29sZSgiJXM6IEludmFs
aWQgQ29ubmVjdG9yIE9iamVjdElEIGZyb20gQWRhcHRlciBTZXJ2aWNlIGZvciBjb25uZWN0b3Ig
aW5kZXg6JWQhIHR5cGUgJWQgZXhwZWN0ZWQgJWRcbiIsCiAJCQkgX19mdW5jX18sIGluaXRfcGFy
YW1zLT5jb25uZWN0b3JfaW5kZXgsCiAJCQkgbGluay0+bGlua19pZC50eXBlLCBPQkpFQ1RfVFlQ
RV9DT05ORUNUT1IpOwogCQlnb3RvIGNyZWF0ZV9mYWlsOwotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
