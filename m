Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3122837F17
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72AD892CF;
	Thu,  6 Jun 2019 20:55:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740053.outbound.protection.outlook.com [40.107.74.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2646D8991C
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:30 +0000 (UTC)
Received: from CY4PR12CA0034.namprd12.prod.outlook.com (2603:10b6:903:129::20)
 by BN6PR12MB1267.namprd12.prod.outlook.com (2603:10b6:404:17::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12; Thu, 6 Jun
 2019 20:55:28 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by CY4PR12CA0034.outlook.office365.com
 (2603:10b6:903:129::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:27 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:11 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 20/24] drm/amd/display: Use stream opp_id instead of hubp
Date: Thu, 6 Jun 2019 16:54:57 -0400
Message-ID: <20190606205501.16505-21-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(136003)(346002)(396003)(2980300002)(428003)(189003)(199004)(8676002)(50466002)(2351001)(48376002)(6916009)(126002)(53416004)(11346002)(53936002)(2616005)(2906002)(81166006)(14444005)(336012)(8936002)(50226002)(72206003)(486006)(6666004)(81156014)(476003)(446003)(70586007)(426003)(70206006)(478600001)(305945005)(1076003)(316002)(16586007)(356004)(26005)(5660300002)(7696005)(77096007)(76176011)(51416003)(68736007)(36756003)(186003)(4326008)(47776003)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1267; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 075dca91-fc48-4bc0-d0b8-08d6eac14e18
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1267; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1267:
X-Microsoft-Antispam-PRVS: <BN6PR12MB126791C9D4EF27202BFE7E3BF9170@BN6PR12MB1267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: a9togwCBA0C4Vs4bg+Aok0zbCexIejm3TN4ClD/IT2axBxmDsnl47cxnCV7SbvfI4iFpHeftPRLlqXJQFCKWd9YOWBNSo1/Sa+P/pZl4+gV7aWitOuAOUyzSkOK7S/nUbpuJD8xVXOu14TkGWDODC3+nY1uFXYnzXVXs4J5YrWVKgqSZY0ZW+7wb0ykNUqLLqIkmLZy5oBiUGmZOYjfkW0i4JmkAEz6lO2eBhunO6zt8XXYBY1UAj6JPZsah/k9sezM+aV5TRNjm2G+tkA86ZPJZKGgRZGjdXe+7CkfNuvcp0aPXhi1wUE0MXqjtpNGz6f2XCezU3+BfM1HGD3Td9Qn+oPNJm1Jfu9e9ZFyAXk9tccy+oaxexbD3lX+YYsoLvSLW5frdbz+kiVwbK13vlc0KB48ZTZB5rEemUunI7zU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:27.7989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 075dca91-fc48-4bc0-d0b8-08d6eac14e18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1267
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThslwQkrkshH6teliYUcdW5K+VS/9v35uzo1kfygnbQ=;
 b=d7VGfLdsePYD/LqVgZB078+5uNhQI+FtQIVMTle3DzduJ0vnn/c5eYn1X1L1Ac0b1Pk6QE+Quo0CDvCiNpRiFwGc2VfVluzLCScq6N81c0fCvF4uGDmJpbG8DGeUg9k21DudhIF8wqH7cEtRYvcELjU1oQkJzOqXNyFql61iRY4=
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
Cc: Wesley Chalmers <Wesley.Chalmers@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VzbGV5IENoYWxtZXJzIDxXZXNsZXkuQ2hhbG1lcnNAYW1kLmNvbT4KCltXSFldCkJ5
IHRoZSB0aW1lIG91dHB1dCBjc2MgbWF0cml4IGlzIGJlaW5nIHByb2dyYW1tZWQsIHN0cmVhbSBj
b25uZWN0aW9uIHRvCk9QUCBoYXMgYmVlbiBlc3RhYmxpc2hlZCwgYnV0IHRoaXMgaW5mb3JtYXRp
b24gaGFzIG5vdCBiZWVuIHJlbGF5ZWQgYmFjawp0byBIVUJQLgoKU2lnbmVkLW9mZi1ieTogV2Vz
bGV5IENoYWxtZXJzIDxXZXNsZXkuQ2hhbG1lcnNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFudGhv
bnkgS29vIDxBbnRob255Lktvb0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEg
PEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CkFja2VkLWJ5OiBLcnVub3NsYXYgS292YWMgPEty
dW5vc2xhdi5Lb3ZhY0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jb3JlL2RjLmMgICAgICAgICAgICAgICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYyB8IDIgKy0KIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kYy5jCmluZGV4IDQ1YjU0MmI1ZDkyMC4uYmY2NGE3M2YxNDgyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKQEAgLTQ1Nyw3ICs0NTcs
NyBAQCBib29sIGRjX3N0cmVhbV9wcm9ncmFtX2NzY19tYXRyaXgoc3RydWN0IGRjICpkYywgc3Ry
dWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtKQogCQkJCQlwaXBlcywKIAkJCQkJc3RyZWFtLT5v
dXRwdXRfY29sb3Jfc3BhY2UsCiAJCQkJCXN0cmVhbS0+Y3NjX2NvbG9yX21hdHJpeC5tYXRyaXgs
Ci0JCQkJCXBpcGVzLT5wbGFuZV9yZXMuaHVicCA/IHBpcGVzLT5wbGFuZV9yZXMuaHVicC0+b3Bw
X2lkIDogMCk7CisJCQkJCXBpcGVzLT5zdHJlYW1fcmVzLm9wcC0+aW5zdCk7CiAJCQlyZXQgPSB0
cnVlOwogCQl9CiAJfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCmluZGV4IGYzMzQ3NTZjMWNlMy4uZDIzNTI5
NDljMDZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAv
ZGNuMTBfaHdfc2VxdWVuY2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCkBAIC0yMTY5LDcgKzIxNjksNyBAQCB2b2lkIHVw
ZGF0ZV9kY2h1YnBfZHBwKAogCQkJCXBpcGVfY3R4LAogCQkJCXBpcGVfY3R4LT5zdHJlYW0tPm91
dHB1dF9jb2xvcl9zcGFjZSwKIAkJCQlwaXBlX2N0eC0+c3RyZWFtLT5jc2NfY29sb3JfbWF0cml4
Lm1hdHJpeCwKLQkJCQlodWJwLT5vcHBfaWQpOworCQkJCXBpcGVfY3R4LT5zdHJlYW1fcmVzLm9w
cC0+aW5zdCk7CiAJfQogCiAJaWYgKHBsYW5lX3N0YXRlLT51cGRhdGVfZmxhZ3MuYml0cy5mdWxs
X3VwZGF0ZSB8fAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
