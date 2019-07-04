Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3AF5FB75
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 18:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4256E372;
	Thu,  4 Jul 2019 16:06:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770055.outbound.protection.outlook.com [40.107.77.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4756E36F
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 16:06:15 +0000 (UTC)
Received: from SN1PR12CA0065.namprd12.prod.outlook.com (2603:10b6:802:20::36)
 by BN6PR12MB1844.namprd12.prod.outlook.com (2603:10b6:404:fc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2032.20; Thu, 4 Jul
 2019 16:06:14 +0000
Received: from BY2NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by SN1PR12CA0065.outlook.office365.com
 (2603:10b6:802:20::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Thu, 4 Jul 2019 16:06:14 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT052.mail.protection.outlook.com (10.152.85.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 16:06:13 +0000
Received: from navi10-uefi.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 4 Jul
 2019 11:05:56 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/17] drm/amdgpu: add vcn jpeg enc irq support
Date: Thu, 4 Jul 2019 12:04:18 -0400
Message-ID: <20190704160429.14758-6-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704160429.14758-1-boyuan.zhang@amd.com>
References: <20190704160429.14758-1-boyuan.zhang@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(36756003)(2906002)(8676002)(356004)(126002)(486006)(81166006)(2616005)(11346002)(446003)(2876002)(81156014)(6116002)(305945005)(53936002)(1076003)(86362001)(7736002)(476003)(2351001)(6666004)(8936002)(4326008)(426003)(47776003)(3846002)(14444005)(186003)(50226002)(16586007)(478600001)(7696005)(76176011)(77096007)(72206003)(316002)(16526019)(50466002)(53416004)(68736007)(26005)(51416003)(336012)(5660300002)(6916009)(70206006)(70586007)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1844; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f87ab0c-6b1f-40ae-2af6-08d7009989ba
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR12MB1844; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1844:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1844CD080163A23A1FBEA10A87FA0@BN6PR12MB1844.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: oZOWAQLPftoJKCbPcxB/S/fDKrX4kkXtnEfPOEf4p1eEKw7GxXsqHyOwFTzUoZHrnAXv4pNUw4wJgBmRMqiUcmEIX6KhwkNTyjEbs2Y/BcibVkh58Ytbk7tkBk10tepYZHEsHFeMrPRLYRJL9RGXpKPxGQJCyBbelWZNYqxTIL5/f2us6FO95k6lLb+oBs0SpX9t76FJw7QGZh6CDRnp/todgNDRrLqmwdS20szTINngbxaJA/acvfi3+Wrb7PfqIukpJlSLTd5OZIw8QoHGjMy0kzW8npr6g0V0Yy/41NLRJxy6zhkugl7X1F4AWJlOWdn1QPJv8UMVJA9oFzIY4/6LLXImXTCofwkJBkSWcZTE677DE9SltV4z250H7uDeOGwUBYdTC1OHOXCAr9t+iIYBt5WYgsTCAIcMf/NH2wM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 16:06:13.5268 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f87ab0c-6b1f-40ae-2af6-08d7009989ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1844
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHhoR3AHHpiKocaEL+0acPAjHfahs74LlpetvjjtL4c=;
 b=OFYY8DXib9CIM+JDP4+l+kY3xNuMVZDbO16reFa/M6DfhP1Kt9MZNxrtsTbOdXFRd4EQW5kMDe2J9qSSMM9A7SK8fJtFRPMg4tYabd0IYK0SpvrrkNkn2xd0zAiBT7gdQ91GUZ3RIQW0dTW5mntO460ey8VarmJ3pEPVn14Eb0I=
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
Cc: Boyuan Zhang <boyuan.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KCkFkZCBpcnEgc3VwcG9y
dCBmb3IganBlZyBlbmNvZGUgcmluZy4KClNpZ25lZC1vZmYtYnk6IEJveXVhbiBaaGFuZyA8Ym95
dWFuLnpoYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAu
YyB8IDEyICsrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25f
djJfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYwppbmRleCA4MmE5
MWY3M2UxNzUuLjc2N2Y4Y2U5Mjg3NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdmNuX3YyXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJf
MC5jCkBAIC0xNTIsNiArMTUyLDEzIEBAIHN0YXRpYyBpbnQgdmNuX3YyXzBfc3dfaW5pdCh2b2lk
ICpoYW5kbGUpCiAJaWYgKHIpCiAJCXJldHVybiByOwogCisJLyogVkNOIEpQRUcgRU5DIFRSQVAg
Ki8KKwlyID0gYW1kZ3B1X2lycV9hZGRfaWQoYWRldiwgU09DMTVfSUhfQ0xJRU5USURfVkNOLAor
CQkJICAgICAgVkNOXzJfMF9fU1JDSURfX0pQRUdfRU5DT0RFLAorCQkJICAgICAgJmFkZXYtPnZj
bi5pcnEpOworCWlmIChyKQorCQlyZXR1cm4gcjsKKwogCXIgPSBhbWRncHVfdmNuX3N3X2luaXQo
YWRldik7CiAJaWYgKHIpCiAJCXJldHVybiByOwpAQCAtMTk2NSw2ICsxOTcyLDkgQEAgc3RhdGlj
IGludCB2Y25fdjJfMF9wcm9jZXNzX2ludGVycnVwdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwKIAljYXNlIFZDTl8yXzBfX1NSQ0lEX19KUEVHX0RFQ09ERToKIAkJYW1kZ3B1X2ZlbmNlX3By
b2Nlc3MoJmFkZXYtPnZjbi5yaW5nX2pwZWcpOwogCQlicmVhazsKKwljYXNlIFZDTl8yXzBfX1NS
Q0lEX19KUEVHX0VOQ09ERToKKwkJYW1kZ3B1X2ZlbmNlX3Byb2Nlc3MoJmFkZXYtPnZjbi5yaW5n
X2pwZWdfZW5jKTsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJRFJNX0VSUk9SKCJVbmhhbmRsZWQg
aW50ZXJydXB0OiAlZCAlZFxuIiwKIAkJCSAgZW50cnktPnNyY19pZCwgZW50cnktPnNyY19kYXRh
WzBdKTsKQEAgLTIxNzUsNyArMjE4NSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2ly
cV9zcmNfZnVuY3MgdmNuX3YyXzBfaXJxX2Z1bmNzID0gewogCiBzdGF0aWMgdm9pZCB2Y25fdjJf
MF9zZXRfaXJxX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewotCWFkZXYtPnZj
bi5pcnEubnVtX3R5cGVzID0gYWRldi0+dmNuLm51bV9lbmNfcmluZ3MgKyAyOworCWFkZXYtPnZj
bi5pcnEubnVtX3R5cGVzID0gYWRldi0+dmNuLm51bV9lbmNfcmluZ3MgKyAzOwogCWFkZXYtPnZj
bi5pcnEuZnVuY3MgPSAmdmNuX3YyXzBfaXJxX2Z1bmNzOwogfQogCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
