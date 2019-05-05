Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D09413CEB
	for <lists+amd-gfx@lfdr.de>; Sun,  5 May 2019 05:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A7689483;
	Sun,  5 May 2019 03:19:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810043.outbound.protection.outlook.com [40.107.81.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E6789483
 for <amd-gfx@lists.freedesktop.org>; Sun,  5 May 2019 03:19:54 +0000 (UTC)
Received: from DM3PR12CA0084.namprd12.prod.outlook.com (2603:10b6:0:57::28) by
 MWHPR12MB1232.namprd12.prod.outlook.com (2603:10b6:300:f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Sun, 5 May 2019 03:19:52 +0000
Received: from DM3NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by DM3PR12CA0084.outlook.office365.com
 (2603:10b6:0:57::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Sun, 5 May 2019 03:19:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT048.mail.protection.outlook.com (10.152.83.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Sun, 5 May 2019 03:19:51 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Sat, 4 May 2019
 22:19:49 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: check for invalid profile_exit setting
Date: Sun, 5 May 2019 11:19:45 +0800
Message-ID: <20190505031945.5355-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(376002)(396003)(346002)(2980300002)(428003)(199004)(189003)(44832011)(476003)(2616005)(126002)(478600001)(53416004)(486006)(1076003)(48376002)(2351001)(186003)(51416003)(77096007)(26005)(426003)(316002)(8936002)(336012)(70586007)(70206006)(68736007)(50226002)(14444005)(54906003)(356004)(6666004)(7696005)(36756003)(6916009)(86362001)(2870700001)(8676002)(81156014)(81166006)(305945005)(2906002)(5660300002)(4326008)(72206003)(47776003)(50466002)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1232; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74d09868-e202-4d72-fbca-08d6d108897c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:MWHPR12MB1232; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1232:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12329806C96D41B8F9D9E469E4370@MWHPR12MB1232.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 00286C0CA6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: w5Sv7K/P8rEcSWFBE+ol/ThPNMA6u2JBH5Uv/rkrE4wx0B8PdVr87k7YfBjKL3J/DkloPoFpUCWuhfysN+GbfMweRjmuyxQHHbA6phFzxZg92pBWERsLIhES2aKalwc69uTK7zqUOgU9J0VhNH62RIwUFItv6hLbwktkfbdwJB1lItlwW1gVfLTtCFfp8eNUTqRP+r6BMb24WcrLqI4KDffGkgAoyXHfB/Xn+yHD2VrQo2L6z1hgbF8HA4Y1yIDNDvwmTAHFVU9eZyQYTXLTXgn0Tw/ZiVkRmPWCqEu18/mCe4TgH8iM54gdjJ4qAJVKKIFENsoa+KnoTm6+nd8l4HChOBCUA+qhsoCp6prj4fsFRh8KaUvhjHxfs6pCviuLUin/8MGlhABpZTlJGlrxF6+pLvmQXzfLjCeao+GCKsM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2019 03:19:51.4984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d09868-e202-4d72-fbca-08d6d108897c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1232
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHX9StKLyZDBwNQd73EN2mAJLt/APe99flaBcO2IneE=;
 b=1DuI3VfAa6aB/iJ2TSX862stTkxTXpGxOPjHWi9u3Yt4/xFS5HgD00b+7OORrwOlTmrm/w90U7YlvhNMm5hjPUHDjaM56+tV6btnVdM16mbip85cmaw88PgkSTMIWH5jwkxWVY9UCiKNNQjzMcGcy+69OUi/tySEEZ//DXoSL58=
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
Cc: Tao.Zhou1@amd.com, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cHJvZmlsZV9leGl0IHBlcmZvcm1hbmNlIGxldmVsIHNldHRpbmcgaXMgdmFsaWQgb25seQp3aGVu
IGN1cnJlbnQgbW9kZSBpcyBpbiBwcm9maWxlIG1vZGUuCgpDaGFuZ2UtSWQ6IEk2OTQwMTAyZDM4
ZGJiN2E0YjAyMzNmY2U1Mjc3ZTE3MDQ2NzJkOGY0ClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8
ZXZhbi5xdWFuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3BtLmMgfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMKaW5kZXggYjgwODczMzQ4NjI0Li5k
Zjc4MzcyMjk2YmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jCkBAIC00
MDQsNiArNDA0LDE2IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9zZXRfZHBtX2ZvcmNlZF9wZXJm
b3JtYW5jZV9sZXZlbChzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJaWYgKGN1cnJlbnRfbGV2ZWwgPT0g
bGV2ZWwpCiAJCXJldHVybiBjb3VudDsKIAorCS8qIHByb2ZpbGVfZXhpdCBzZXR0aW5nIGlzIHZh
bGlkIG9ubHkgd2hlbiBjdXJyZW50IG1vZGUgaXMgaW4gcHJvZmlsZSBtb2RlICovCisJaWYgKCEo
Y3VycmVudF9sZXZlbCAmIChBTURfRFBNX0ZPUkNFRF9MRVZFTF9QUk9GSUxFX1NUQU5EQVJEIHwK
KwkgICAgQU1EX0RQTV9GT1JDRURfTEVWRUxfUFJPRklMRV9NSU5fU0NMSyB8CisJICAgIEFNRF9E
UE1fRk9SQ0VEX0xFVkVMX1BST0ZJTEVfTUlOX01DTEsgfAorCSAgICBBTURfRFBNX0ZPUkNFRF9M
RVZFTF9QUk9GSUxFX1BFQUspKSAmJgorCSAgICAobGV2ZWwgPT0gQU1EX0RQTV9GT1JDRURfTEVW
RUxfUFJPRklMRV9FWElUKSkgeworCQlwcl9lcnIoIkN1cnJlbnRseSBub3QgaW4gYW55IHByb2Zp
bGUgbW9kZSFcbiIpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKIAlpZiAoaXNfc3VwcG9ydF9z
d19zbXUoYWRldikpIHsKIAkJbXV0ZXhfbG9jaygmYWRldi0+cG0ubXV0ZXgpOwogCQlpZiAoYWRl
di0+cG0uZHBtLnRoZXJtYWxfYWN0aXZlKSB7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
