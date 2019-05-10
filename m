Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF661A23B
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 19:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7365689D9A;
	Fri, 10 May 2019 17:20:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770042.outbound.protection.outlook.com [40.107.77.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FB589FD3
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 17:20:28 +0000 (UTC)
Received: from DM3PR12CA0061.namprd12.prod.outlook.com (2603:10b6:0:56::29) by
 MWHPR12MB1279.namprd12.prod.outlook.com (2603:10b6:300:10::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Fri, 10 May 2019 17:20:26 +0000
Received: from CO1NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by DM3PR12CA0061.outlook.office365.com
 (2603:10b6:0:56::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Fri, 10 May 2019 17:20:26 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT005.mail.protection.outlook.com (10.152.80.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Fri, 10 May 2019 17:20:26 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 10 May 2019
 12:20:16 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/16] drm/amd/display: Rename EDID_BLOCK_SIZE to
 DC_EDID_BLOCK_SIZE
Date: Fri, 10 May 2019 13:19:31 -0400
Message-ID: <20190510171935.19792-13-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510171935.19792-1-Bhawanpreet.Lakha@amd.com>
References: <20190510171935.19792-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(376002)(346002)(136003)(396003)(39860400002)(2980300002)(428003)(189003)(199004)(47776003)(53416004)(1076003)(2351001)(81166006)(14444005)(2906002)(316002)(16586007)(6916009)(50226002)(8936002)(305945005)(8676002)(81156014)(86362001)(70206006)(70586007)(336012)(76176011)(72206003)(48376002)(50466002)(51416003)(7696005)(68736007)(478600001)(5660300002)(26005)(356004)(6666004)(426003)(476003)(486006)(126002)(2616005)(11346002)(446003)(186003)(4326008)(77096007)(53936002)(36756003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1279; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ff708d7-41c2-4746-0dc1-08d6d56bcaed
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:MWHPR12MB1279; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1279:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1279486DAF9E1F7280338B3EF90C0@MWHPR12MB1279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-Forefront-PRVS: 0033AAD26D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: pgL4QtlAk1OAboLrnxBjerqPjYB0or1l4p7Lo6KxfzZVoSbeidITQp/AKNccTTaBk+PkIBfcoipDBQ7nwjFIJM/jRZLM1xQ3h9XlHIahDwHJQfxQB8dATJbx0fCbR9DZagnxWGPGLJ/DDoW/ekNlqC7ffdlqSL/sQFRkyP9v8CPeD8Z73sUokO57AFMWzZ4Lqa045lzSmEuIkEgN1ilJfdqepgjrErwiWetE7YWGxygUWtnR7KsREIzqbp7W6GZ8Sp2lI7oA4Mx7VagWqEed0ZT/y+lh2WrlMjiaBGjd9LChNExVYjmpdvwqu9g2wZRH8NM9EVHgMdDSYAZDn1TSRobm8BmI1u6vUAn2KLQ93t3FqqXLBCBlN6rMoNvqFcN1sKI+o+CDbUUo2cVnlmcz6kg6AbPf3yNU1NfQF49z8ds=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2019 17:20:26.0342 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff708d7-41c2-4746-0dc1-08d6d56bcaed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1279
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGO3ZNgRGxDL57/ccXjJKjVf6gK1GC2nLM0qhf5+Bkg=;
 b=x7NsxdNwNTSt5K/vuLwOkeiOlLrK28uehml1dlufaOgllE5ixmW2pqthxxmE7i5cZoybRTwEOz1NfozoHSF2iCwNjEmBf7bWFI6RZpGKcnc6lMY0eSJw4sY+oEH4Vy72czJA6JIWqfAh09+8QVKpg/tv2TNDmcCj/iIz1xeU9RY=
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
Cc: Joshua Aberback <joshua.aberback@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zaHVhIEFiZXJiYWNrIDxqb3NodWEuYWJlcmJhY2tAYW1kLmNvbT4KClNpZ25lZC1v
ZmYtYnk6IEpvc2h1YSBBYmVyYmFjayA8am9zaHVhLmFiZXJiYWNrQGFtZC5jb20+ClJldmlld2Vk
LWJ5OiBBYmRvdWxheWUgQmVydGhlIDxBYmRvdWxheWUuQmVydGhlQGFtZC5jb20+CkFja2VkLWJ5
OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgfCA2ICsrKy0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX3R5cGVzLmggICAgIHwgMiArLQogMiBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCmluZGV4IDZiOGRjNzJhNzg2MS4u
ZTcyMzY1MzlmODY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUv
ZGNfbGluay5jCkBAIC05MDcsMTAgKzkwNywxMCBAQCBib29sIGRjX2xpbmtfZGV0ZWN0KHN0cnVj
dCBkY19saW5rICpsaW5rLCBlbnVtIGRjX2RldGVjdF9yZWFzb24gcmVhc29uKQogCQkJc2luay0+
c2lua19zaWduYWwgPSBTSUdOQUxfVFlQRV9EVklfU0lOR0xFX0xJTks7CiAKIAkJLyogQ29ubmVj
dGl2aXR5IGxvZzogZGV0ZWN0aW9uICovCi0JCWZvciAoaSA9IDA7IGkgPCBzaW5rLT5kY19lZGlk
Lmxlbmd0aCAvIEVESURfQkxPQ0tfU0laRTsgaSsrKSB7CisJCWZvciAoaSA9IDA7IGkgPCBzaW5r
LT5kY19lZGlkLmxlbmd0aCAvIERDX0VESURfQkxPQ0tfU0laRTsgaSsrKSB7CiAJCQlDT05OX0RB
VEFfREVURUNUKGxpbmssCi0JCQkJCSZzaW5rLT5kY19lZGlkLnJhd19lZGlkW2kgKiBFRElEX0JM
T0NLX1NJWkVdLAotCQkJCQlFRElEX0JMT0NLX1NJWkUsCisJCQkJCSZzaW5rLT5kY19lZGlkLnJh
d19lZGlkW2kgKiBEQ19FRElEX0JMT0NLX1NJWkVdLAorCQkJCQlEQ19FRElEX0JMT0NLX1NJWkUs
CiAJCQkJCSIlczogW0Jsb2NrICVkXSAiLCBzaW5rLT5lZGlkX2NhcHMuZGlzcGxheV9uYW1lLCBp
KTsKIAkJfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNf
dHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY190eXBlcy5oCmluZGV4
IDc0MDJmNWFkYThiNi4uNTFhOWRjNWQ5YzhlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNfdHlwZXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNfdHlwZXMuaApAQCAtMTEzLDcgKzExMyw3IEBAIHN0cnVjdCBkY19jb250ZXh0IHsK
IAogCiAjZGVmaW5lIERDX01BWF9FRElEX0JVRkZFUl9TSVpFIDEwMjQKLSNkZWZpbmUgRURJRF9C
TE9DS19TSVpFIDEyOAorI2RlZmluZSBEQ19FRElEX0JMT0NLX1NJWkUgMTI4CiAjZGVmaW5lIE1B
WF9TVVJGQUNFX05VTSA0CiAjZGVmaW5lIE5VTV9QSVhFTF9GT1JNQVRTIDEwCiAKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
