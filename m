Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A3E4DF00
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Jun 2019 04:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF396E7EC;
	Fri, 21 Jun 2019 02:07:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820081.outbound.protection.outlook.com [40.107.82.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209CC6E7EC
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Jun 2019 02:07:25 +0000 (UTC)
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 DM6PR12MB2665.namprd12.prod.outlook.com (2603:10b6:5:4a::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Fri, 21 Jun 2019 02:07:20 +0000
Received: from BY2NAM03FT038.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.13 via Frontend
 Transport; Fri, 21 Jun 2019 02:07:20 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT038.mail.protection.outlook.com (10.152.84.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2008.13 via Frontend Transport; Fri, 21 Jun 2019 02:07:20 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 20 Jun 2019
 21:07:18 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: no memory activity support on Vega10
Date: Fri, 21 Jun 2019 10:07:09 +0800
Message-ID: <20190621020709.24778-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(36756003)(70586007)(7696005)(2906002)(8676002)(50226002)(72206003)(51416003)(316002)(478600001)(53416004)(4326008)(8936002)(48376002)(86362001)(44832011)(81156014)(81166006)(126002)(26005)(77096007)(336012)(68736007)(6916009)(356004)(1076003)(476003)(486006)(2351001)(47776003)(6666004)(305945005)(50466002)(2870700001)(53936002)(186003)(426003)(5660300002)(70206006)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2665; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fb5a5e4-ee41-4b43-adba-08d6f5ed3150
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2665; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2665:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2665C6C9D40080AC4285D823E4E70@DM6PR12MB2665.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:226;
X-Forefront-PRVS: 0075CB064E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Tz1TNUXPHEy730y9UQgenjTLYWvnGIG9pB4512mVvb4IO64yMzCcIoFKGCjZ7HeZAOOIVBY5pJN80pZonmxZYFBUWUzu9r5fUN3GmVIwDwSq+MEuYyQoKIYeGtBF9TW+Q5RZUVSJ/a/Yp5y8wlEZWeCOVX2INpb8YH7oYq0qB6OrAzz25Gk/XXQl/d6jstDHFL+o3O6VCr27iiOvisqSNv3GQnHM0s2b89Zifzq68ftDh3HeAPgu6TNPNDX0N/oOHtynSIc989ng3NCdhmQ3KZBeYMjfG2JuDNnpyBny9UE1QaDmPT8W5YazNnjEmQ4ExVrfg2Ap1vUPCHirhu/EGyVOXTbrqs/udkjjfwhbxbBP+dCXA56MqCtvNbrBN9hFtc/NtU9PwRcnC2s0RR8poapfbFWDj24P+XO/ITWckH8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2019 02:07:20.1137 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb5a5e4-ee41-4b43-adba-08d6f5ed3150
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2665
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qArVeCwrhfE/G3QMRXKTpy1g8lNsMPc1+WGSF7dmrQ=;
 b=zHlQ0nzO6r6vMPXIvWtRYMBgkFNJcZIM80ttYuIYQ4RNPpT0+oBzi/FgyPb7pWOQ69W5d0EaKSG8HWIA74vzpMR35w4c6cYPbqux7okCh18G2UTDmPfzVvnyuZ89rMGYjydKE/JhlD08nGdqK8pf99AFzi1y/WowycxZSX3/jV8=
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

TWFrZSBtZW1fYnVzeV9wZXJjZW50IHN5c2ZzIGludGVyZmFjZSBpbnZpc2libGUgb24gVmVnYTEw
LgoKQ2hhbmdlLUlkOiBJZTM5YzMyMTdiNDk3YTExMGIwYjE2ZTFiMDgwMzMwMjliZGNmMmZjOApT
aWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcG0uYwppbmRleCA3ZWQ4NDczNmNjYzkuLmJjZjZlMDg5ZGMyZSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMKQEAgLTI5NDUsNyArMjk0NSw4IEBAIGludCBh
bWRncHVfcG1fc3lzZnNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJcmV0dXJu
IHJldDsKIAl9CiAJLyogQVBVIGRvZXMgbm90IGhhdmUgaXRzIG93biBkZWRpY2F0ZWQgbWVtb3J5
ICovCi0JaWYgKCEoYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVKSkgeworCWlmICghKGFkZXYtPmZs
YWdzICYgQU1EX0lTX0FQVSkgJiYKKwkgICAgIChhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9WRUdB
MTApKSB7CiAJCXJldCA9IGRldmljZV9jcmVhdGVfZmlsZShhZGV2LT5kZXYsCiAJCQkJJmRldl9h
dHRyX21lbV9idXN5X3BlcmNlbnQpOwogCQlpZiAocmV0KSB7CkBAIC0zMDI1LDcgKzMwMjYsOCBA
QCB2b2lkIGFtZGdwdV9wbV9zeXNmc19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQog
CQlkZXZpY2VfcmVtb3ZlX2ZpbGUoYWRldi0+ZGV2LAogCQkJCSZkZXZfYXR0cl9wcF9vZF9jbGtf
dm9sdGFnZSk7CiAJZGV2aWNlX3JlbW92ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX2dwdV9i
dXN5X3BlcmNlbnQpOwotCWlmICghKGFkZXYtPmZsYWdzICYgQU1EX0lTX0FQVSkpCisJaWYgKCEo
YWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVKSAmJgorCSAgICAgKGFkZXYtPmFzaWNfdHlwZSAhPSBD
SElQX1ZFR0ExMCkpCiAJCWRldmljZV9yZW1vdmVfZmlsZShhZGV2LT5kZXYsICZkZXZfYXR0cl9t
ZW1fYnVzeV9wZXJjZW50KTsKIAlpZiAoIShhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpKQogCQlk
ZXZpY2VfcmVtb3ZlX2ZpbGUoYWRldi0+ZGV2LCAmZGV2X2F0dHJfcGNpZV9idyk7Ci0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
