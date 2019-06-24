Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56D250A88
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 14:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F548987C;
	Mon, 24 Jun 2019 12:16:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690080.outbound.protection.outlook.com [40.107.69.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CDB8987C
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 12:16:04 +0000 (UTC)
Received: from SN1PR12CA0046.namprd12.prod.outlook.com (2603:10b6:802:20::17)
 by DM6PR12MB2666.namprd12.prod.outlook.com (2603:10b6:5:4a::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.13; Mon, 24 Jun
 2019 12:16:02 +0000
Received: from CO1NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by SN1PR12CA0046.outlook.office365.com
 (2603:10b6:802:20::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16 via Frontend
 Transport; Mon, 24 Jun 2019 12:16:02 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT027.mail.protection.outlook.com (10.152.80.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2008.13 via Frontend Transport; Mon, 24 Jun 2019 12:16:02 +0000
Received: from rico-code.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 24 Jun 2019
 07:16:00 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: disable gfxoff on navi10
Date: Mon, 24 Jun 2019 20:15:54 +0800
Message-ID: <1561378554-10083-1-git-send-email-tianci.yin@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(396003)(136003)(2980300002)(428003)(189003)(199004)(6666004)(53416004)(426003)(70586007)(26005)(305945005)(186003)(68736007)(476003)(126002)(486006)(44832011)(77096007)(356004)(81166006)(51416003)(70206006)(81156014)(8676002)(4326008)(2616005)(7696005)(478600001)(53936002)(2351001)(47776003)(8936002)(50226002)(72206003)(6916009)(2906002)(5660300002)(36756003)(16586007)(4744005)(316002)(86362001)(54906003)(50466002)(48376002)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2666; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6f2eae0-2ba4-44a4-48c7-08d6f89db953
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2666; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2666:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2666B9975E0836F13F5025CA95E00@DM6PR12MB2666.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-Forefront-PRVS: 007814487B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 2jzrJi/YuYJWNAmxeF1u4wscjEC39iTNRf3+Csvw/mUyjKZ2s7+TxAX5tYMSozjN10TkG9zBc5YEI6CbDbMFgvuAcH0mg7JNEYWNlGi9R/Kj1hOnjRmt1MNlf8lW+EBkelrrZsE0Ml5j/FW9YGXO6ZOBs4nMaeOn0uL6+9RpLRcXUDUY5SGCz5vPqBl02rpZswqX0M4/ckqIHDkWKM1O0pfwcHclHKIamds6BbUE9ZuB9PwNi7KC7XsnX9kSUkkLq6J4KV3Ny7LFvpg6iNllZfax8S9624oUMpE60iGjDvLSsmwL1m2R6T0c7DR/ALsKteVxy9BPNoz07kLmcpIpOrPuUta2DnCF7nN16jHNbtWMGt3WMNk/q0VhFzWJrJvNNE8iJ68M9ywMHEZQ1yFx8h3HJFZjt1spCmtOu0iCgSI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2019 12:16:02.0249 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f2eae0-2ba4-44a4-48c7-08d6f89db953
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2666
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYAhQWCaUW1dz5TmHxro+Hhs9AKRY1/EihW3XTBgyjI=;
 b=V7qVyYepvxde24B2g8TjuZenAiRsZmLNOL839/mIVEdXM6Urrj9PHAc+qQA8UUIyoo+3cCw8UW/aWCue3ZCOH2qG3EpiZtNjgDOqjNusqNT7ONsnls/n+2JeDB0XkrnIrC3vUKtHdF6TXg0zR482A3FBKTDxSQD37UDYTMryf00=
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
Cc: Tianci Yin <tianci.yin@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KClRoZSBnZnhvZmYgYnJpbmdzIHVu
c3RhYmlsaXR5LCBkaXNhYmxlIGl0IGJ5IGRlZmF1bHQKCkNoYW5nZS1JZDogSTQzYmRhYjBmOTNk
NjRmN2UyMDdmOTYxNTc2NjVhMmJiMjMyZjY5NTYKU2lnbmVkLW9mZi1ieTogdGlhbmN5aW4gPHRp
YW5jaS55aW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEw
XzAuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKaW5kZXggMDA5MGNiYS4u
MTZiMmJjYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8w
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTQ0Nyw5
ICs0NDcsNyBAQCBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfY2hlY2tfZ2Z4b2ZmX2ZsYWcoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsKIAlj
YXNlIENISVBfTkFWSTEwOgotCQlpZiAoKGFkZXYtPmdmeC5ybGNfZndfdmVyc2lvbiA8IDg1KSB8
fAotCQkJKGFkZXYtPnBtLmZ3X3ZlcnNpb24gPCAweDAwMkEwQzAwKSkKLQkJCWFkZXYtPnBtLnBw
X2ZlYXR1cmUgJj0gflBQX0dGWE9GRl9NQVNLOworCQlhZGV2LT5wbS5wcF9mZWF0dXJlICY9IH5Q
UF9HRlhPRkZfTUFTSzsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJYnJlYWs7Ci0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
