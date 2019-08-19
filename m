Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB119270F
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F316E183;
	Mon, 19 Aug 2019 14:36:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740047.outbound.protection.outlook.com [40.107.74.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127186E174
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:36:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocGwbxaMZskLAYXEAd6PaCJCgZzz1S6AmqEhQfmP50S2nPUt9bzGK7UUSdjGi3vtvV3oaLBfpqzfvJ5BnCC2OcUBJ8khlEbviyF3p5jWpduMOTWnKN7EUKJIxu49lAQ6CVz6ffsbAKa4sMenGfGyZrNoje4wlXeuY3l3yyQf7XJ1kNlzXt9vS+e8YBqEDaEddCrYGbbUN1TEOUARPTP+FZoXxje6nKTFjhAXpLIWWC157q3YerTi5DOaZKB+VZmoXuU5GOjddMRWchiHVXZ2sGC3qeeoEA2A2kwnzoQYjKxDaFYgiXck/I+nTJxIIuATO9LHc8gq1k2EPsS6ScEAkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQoPMqhLNml50ER27SIgAE/yuGb0bW4B7LJeFYEBc8A=;
 b=RVRV6Wrpd+fbGvESfZ70o1KNpSCOPN/9cRCSyGShYJYHyk29j5VoPVq7ieNDcvd1wJinI/rxSNxCvAjMyFkIyXGxYhQdsbHlk7MTjio4QZlkvsHFEK3r3DBJ/jJOkF3IAQqH2ur7BePB8GQeTV5qu0RB2MFTml2lROlQyLXgs7gNO7qO+i0XgcHN3njFqJ16xr39kmqf3+u+Z/PIpETShmUbLvvpS4IOLt+UZTtMM8gIGBrr4y+JU7DTFvnFpGjerfMPOflOz1sGVHO6GgTnvVqOFDCqrWpnpUMCk4PoFzqLQpZTVQecdvaOlVRv9pH0eT1BvK+uY7WNynlYVAhJJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:405:70::15)
 by BYAPR12MB2712.namprd12.prod.outlook.com (2603:10b6:a03:68::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Mon, 19 Aug
 2019 14:36:04 +0000
Received: from BY2NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by BN6PR12CA0029.outlook.office365.com
 (2603:10b6:405:70::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:36:04 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT016.mail.protection.outlook.com (10.152.84.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:36:03 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:49 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 30/36] drm/amd/display: fix DML not calculating delivery time
Date: Mon, 19 Aug 2019 10:35:09 -0400
Message-ID: <20190819143515.21653-31-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(2980300002)(428003)(189003)(199004)(478600001)(2906002)(305945005)(426003)(2616005)(476003)(70206006)(126002)(446003)(70586007)(53416004)(336012)(11346002)(6916009)(8676002)(50226002)(6666004)(356004)(8936002)(36756003)(81166006)(81156014)(186003)(7696005)(316002)(486006)(76176011)(4326008)(48376002)(50466002)(16586007)(53936002)(51416003)(5660300002)(86362001)(1076003)(47776003)(2351001)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2712; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92aa1d81-96bc-4927-8783-08d724b2902f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2712; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2712:
X-Microsoft-Antispam-PRVS: <BYAPR12MB271269A918D81D2CE6FC09CAF9A80@BYAPR12MB2712.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: NVrKc8j3H1msKHRL5ZBkasKjpLCFfMeuijU7HrpWQRwjbtyleYhwW2yWxo3k2OhRiuquElhpFcsc47JMr+PC8Ij5nnUJHNfvNUpHD3eNWEikV6HHkE+ENYQO2yowbxkhy4gDQ5o2iRMGK26FnLoX1NYbJEHTuiLUBqt+5DGk6uqQi2/VYaU+NW5rudV0eSfjGd8P8KMS6fzl0gBj5szbEOOR9nVbRZP4AcPFvH/PAe0K1riTYGNZzkbUDl8ln/verG4HbBiObtaHUl3p5PgtbvZeziV9J1On7oToPzu8yZ6NA26K1n0e15OZJiUStdCKDhg0qKApRoQMjyOHQ3iZ2eRj4Rq2bn1eGvdjNdSd+LHFCckDD2H/1OZhTbyreHksFLUMohzqRLB5qAXCchBADnc1ToxeKxf/ANGWnpVT2OU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:36:03.6535 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92aa1d81-96bc-4927-8783-08d724b2902f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2712
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQoPMqhLNml50ER27SIgAE/yuGb0bW4B7LJeFYEBc8A=;
 b=EKSEzPEpkz+CLPvisgJnoc7Ry756vONgy5FjBsCOmVG0DXoI2sf+dAiD8vte6CFj1VTnb1TFHkelOVs1pVmnniijrSI1u+neF3Hn6Oa8L/hIN65p36Cc0BoIgsFkMlafWZU2ceuoQvqHs5FnMP3J0cnfaqYVA0Xu2MSfdpg/gsw=
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
Cc: Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KQ2FsY3VsYXRpbmcgRENGQ0xL
IERTIHRpbWUgcmVxdWlyZXMgY2FsY3VsYXRpbmcKZGVsaXZlcnkgdGltZSBmb3IgbHVtYS9jaHJv
bWEsIGJ1dCB0aGlzIHZhbHVlIGlzCm5vdCBjYWxjdWxhdGVkIGluIERNTHYyLCBpdCB3YXMgaW5h
ZHZlcnRlbnRseQpyZW1vdmVkIHdoZW4gcG9ydGluZyBETUx2MgoKW2hvd10KQWRkIHRoZSBjYWxj
dWxhdGlvbiBiYWNrCgpTaWduZWQtb2ZmLWJ5OiBKdW4gTGVpIDxKdW4uTGVpQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBEbXl0cm8gTGFrdHl1c2hraW4gPERteXRyby5MYWt0eXVzaGtpbkBhbWQuY29t
PgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+
Ci0tLQogLi4uL2RjL2RtbC9kY24yMC9kaXNwbGF5X21vZGVfdmJhXzIwdjIuYyAgICAgIHwgMjcg
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjIwL2Rpc3Bs
YXlfbW9kZV92YmFfMjB2Mi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9k
Y24yMC9kaXNwbGF5X21vZGVfdmJhXzIwdjIuYwppbmRleCAyMjQ1NWRiNTQ5ODAuLjBmYWZkNjkz
ZmZiNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24y
MC9kaXNwbGF5X21vZGVfdmJhXzIwdjIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZG1sL2RjbjIwL2Rpc3BsYXlfbW9kZV92YmFfMjB2Mi5jCkBAIC0xNDc1LDYgKzE0NzUs
MzMgQEAgc3RhdGljIHZvaWQgZG1sMjB2Ml9ESVNQQ0xLRFBQQ0xLRENGQ0xLRGVlcFNsZWVwUHJl
ZmV0Y2hQYXJhbWV0ZXJzV2F0ZXJtYXJrc0FuZFAKIAkJCQkJCQkvIG1vZGVfbGliLT52YmEuUmV0
dXJuQlc7CiAKIAltb2RlX2xpYi0+dmJhLkxhc3RQaXhlbE9mTGluZUV4dHJhV2F0ZXJtYXJrID0g
MDsKKwlmb3IgKGsgPSAwOyBrIDwgbW9kZV9saWItPnZiYS5OdW1iZXJPZkFjdGl2ZVBsYW5lczsg
KytrKSB7CisJCQlpZiAobW9kZV9saWItPnZiYS5WUmF0aW9ba10gPD0gMS4wKQorCQkJCW1vZGVf
bGliLT52YmEuRGlzcGxheVBpcGVMaW5lRGVsaXZlcnlUaW1lTHVtYVtrXSA9CisJCQkJCQkoZG91
YmxlKSBtb2RlX2xpYi0+dmJhLlN3YXRoV2lkdGhZW2tdCisJCQkJCQkJCSogbW9kZV9saWItPnZi
YS5EUFBQZXJQbGFuZVtrXQorCQkJCQkJCQkvIG1vZGVfbGliLT52YmEuSFJhdGlvW2tdCisJCQkJ
CQkJCS8gbW9kZV9saWItPnZiYS5QaXhlbENsb2NrW2tdOworCQkJZWxzZQorCQkJCW1vZGVfbGli
LT52YmEuRGlzcGxheVBpcGVMaW5lRGVsaXZlcnlUaW1lTHVtYVtrXSA9CisJCQkJCQkoZG91Ymxl
KSBtb2RlX2xpYi0+dmJhLlN3YXRoV2lkdGhZW2tdCisJCQkJCQkJCS8gbW9kZV9saWItPnZiYS5Q
U0NMX1RIUk9VR0hQVVRfTFVNQVtrXQorCQkJCQkJCQkvIG1vZGVfbGliLT52YmEuRFBQQ0xLW2td
OworCisJCQlpZiAobW9kZV9saWItPnZiYS5CeXRlUGVyUGl4ZWxERVRDW2tdID09IDApCisJCQkJ
bW9kZV9saWItPnZiYS5EaXNwbGF5UGlwZUxpbmVEZWxpdmVyeVRpbWVDaHJvbWFba10gPSAwLjA7
CisJCQllbHNlIGlmIChtb2RlX2xpYi0+dmJhLlZSYXRpb1trXSAvIDIuMCA8PSAxLjApCisJCQkJ
bW9kZV9saWItPnZiYS5EaXNwbGF5UGlwZUxpbmVEZWxpdmVyeVRpbWVDaHJvbWFba10gPQorCQkJ
CQkJbW9kZV9saWItPnZiYS5Td2F0aFdpZHRoWVtrXSAvIDIuMAorCQkJCQkJCQkqIG1vZGVfbGli
LT52YmEuRFBQUGVyUGxhbmVba10KKwkJCQkJCQkJLyAobW9kZV9saWItPnZiYS5IUmF0aW9ba10g
LyAyLjApCisJCQkJCQkJCS8gbW9kZV9saWItPnZiYS5QaXhlbENsb2NrW2tdOworCQkJZWxzZQor
CQkJCW1vZGVfbGliLT52YmEuRGlzcGxheVBpcGVMaW5lRGVsaXZlcnlUaW1lQ2hyb21hW2tdID0K
KwkJCQkJCW1vZGVfbGliLT52YmEuU3dhdGhXaWR0aFlba10gLyAyLjAKKwkJCQkJCQkJLyBtb2Rl
X2xpYi0+dmJhLlBTQ0xfVEhST1VHSFBVVF9DSFJPTUFba10KKwkJCQkJCQkJLyBtb2RlX2xpYi0+
dmJhLkRQUENMS1trXTsKKwkJfQogCiAJbW9kZV9saWItPnZiYS5VcmdlbnRFeHRyYUxhdGVuY3kg
PSBtb2RlX2xpYi0+dmJhLlVyZ2VudFJvdW5kVHJpcEFuZE91dE9mT3JkZXJMYXRlbmN5CiAJCQkr
IChtb2RlX2xpYi0+dmJhLlRvdGFsQWN0aXZlRFBQICogbW9kZV9saWItPnZiYS5QaXhlbENodW5r
U2l6ZUluS0J5dGUKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
