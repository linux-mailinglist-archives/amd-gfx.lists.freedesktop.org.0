Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A041D1A8D
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C74C6EA63;
	Wed,  9 Oct 2019 21:06:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750040.outbound.protection.outlook.com [40.107.75.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FDB6EA67
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcePlLJF/IwRvPrLzDSPD7HFZRInieqH9ZUOF7JUY3SbZbXfb8d2r8onQQ9x58dx9GLeoMZT2cs3EJgHoiOqs9r3spiIwCH1kgZAYeNUFJsbEF1ZU9TN5GH1NJjyAOwTbg/+b8e18jO3g9OB2Q7+ZMmrwH2RrqIsvO9aTBSRrTD6cO42//tmwNZEbMPeseyP7Go+dXg4ooexVqeOqUqtEq5XI9i3kWTT2srnWIyOBcwmo8TPx9j5AkuFQbB8adGXWz6S4B+Y/8C/jLIOx5MH7wG8GZNkvHxzeDpqc0kWBaaEJM6soRzi6iqBRbKEG9XJYcdW4IjnjRZHWSAGTzirwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xLfg14JFIAJfNKoSld4IFZ8TjXeKNwLduqr3XnDNcI=;
 b=h0MhXIMg1EhYDOOTrvAkj2J/gUDQ/qNDBaOb1fg/NhVxoOJctZ8w0I1XYXyzWMPZLdHLRThapkYae2gd8WLHe/Zx6jfqgtNLvUp2tZ9pr/yoytO/t68mgIb6N2OjQ5my4OUe4S2boiA1KmNBn7iAJ/7yWlqO7sEC4AfPzNOas6rfbBkg4at6+nFcmf1gJ3a8WtfYH5ffjlk0ayTp89Lja8erfuBThpyF+aBNSaCW6AGIYr87oqe7MFe2vea2VFbGLZFTT8impVYB2oZPO8XrS7ZPYg7/4iEhRr1CChvixRWm8yUJs8ib/Ztm25ljJzDaAflnTQbkvAjarABs7b05Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:5:1c0::42)
 by MWHPR12MB1502.namprd12.prod.outlook.com (2603:10b6:301:10::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.25; Wed, 9 Oct
 2019 21:06:27 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM6PR12CA0029.outlook.office365.com
 (2603:10b6:5:1c0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:27 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:26 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/26] drm/amd/display: add detile buffer size for renoir
Date: Wed, 9 Oct 2019 17:06:02 -0400
Message-ID: <20191009210613.17929-16-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(428003)(189003)(199004)(1076003)(54906003)(8676002)(16586007)(50226002)(47776003)(8936002)(316002)(446003)(2351001)(478600001)(81166006)(305945005)(50466002)(86362001)(6916009)(2616005)(26005)(186003)(81156014)(11346002)(4744005)(53416004)(70586007)(70206006)(476003)(426003)(6666004)(336012)(7696005)(126002)(5660300002)(4326008)(2906002)(48376002)(486006)(76176011)(36756003)(356004)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1502; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbc33058-6293-4989-0011-08d74cfc8cc4
X-MS-TrafficTypeDiagnostic: MWHPR12MB1502:
X-Microsoft-Antispam-PRVS: <MWHPR12MB150215F768A6842363930AD7F9950@MWHPR12MB1502.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CXsHRJsDjgSpVMukcMkdjGnUcAHT2tPDKxnYV4207BqE1nUcUcewS/LsT0wCEa7S4KjJ+M9tO+5SSf9uUgx5JTABC2tvedKJ4DdY7fZigOhqC+xFy3aOPuRBLB8b4ZZuQ2UWaN624VPBXtNDHW91cxKASdoMNqEmAWG51qOpW91xKPa5GLmuAcJAf2jeV003SiEryAY8wzXJWDkQhJB2abrKCpoLDe2aPQADUAtUGdAVAe/Nvq8yDCXrFiRatPlW75Kfz8l0jZDQJxROZFqpR5kWtJ+NJvs4IyAgFph9TxlX+oXBC2atbvLT+03nvEhE+ZV+lN2Em1IQBCfJHAQKRdXvm0NZN9CmRyJNWy+Jg9sOH9VWgNufWOzIRDtZ4Krc1LVLdrHz4znd1BEYWe+XYhQEMGkfdJ8K8TvsjLsflxY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:27.2028 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc33058-6293-4989-0011-08d74cfc8cc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1502
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xLfg14JFIAJfNKoSld4IFZ8TjXeKNwLduqr3XnDNcI=;
 b=DI/Emvg9W+n6L5BO9Q/2yFdrCemAmMPgMEf/4zjxsYtwOeLUrHf/aH9rXm3Y60Ht/DBXjAzE9hL1yh9COmx33ZSjC/rbZeOTyoD8EjaJrOYznZA4DRh7ozttmXVZ7LYInUBMK3oaxZCRvNjFXBTMu/Hzss7atFWRsMQHV8mDbos=
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
Cc: sunpeng.li@amd.com, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RGV0aWxlIGJ1ZmZlciBzaXplIGFmZmVjdHMgZGNjIGNhcHMsIGl0IHdhcyBhbHJlYWR5IGFkZGVk
IGZvcgpkY24yLiBOb3cgYWRkIGl0IGZvciBkY24yMQoKU2lnbmVkLW9mZi1ieTogQmhhd2FucHJl
ZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX2h1YmJ1Yi5jIHwgMSArCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjEvZGNuMjFfaHViYnViLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjEvZGNuMjFfaHViYnViLmMKaW5kZXggYWViNWRlNmY0NTMwLi5mNTQ2MjYwYzE1Yjcg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9o
dWJidWIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFf
aHViYnViLmMKQEAgLTY1Myw0ICs2NTMsNSBAQCB2b2lkIGh1YmJ1YjIxX2NvbnN0cnVjdChzdHJ1
Y3QgZGNuMjBfaHViYnViICpodWJidWIsCiAJaHViYnViLT5tYXNrcyA9IGh1YmJ1Yl9tYXNrOwog
CiAJaHViYnViLT5kZWJ1Z190ZXN0X2luZGV4X3BzdGF0ZSA9IDB4QjsKKwlodWJidWItPmRldGls
ZV9idWZfc2l6ZSA9IDE2NCAqIDEwMjQ7IC8qIDE2NEtCIGZvciBEQ04yLjAgKi8KIH0KLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
