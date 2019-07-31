Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0B87B85C
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 05:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05A66E667;
	Wed, 31 Jul 2019 03:53:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750042.outbound.protection.outlook.com [40.107.75.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3496E667
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 03:53:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1AWZ1QUecoICZVsnwG0T+F/nL5K8RMCRzYTiMJXLSCt1hwRksnTVkqvJpKe2on83sdGJC73ow0ePmoL1NUUGhHdsuKAXYHiQLw5QSWZcG6qyVn5x2Gry8EHqz2sWPkk99MnuJ7nrDiZG++KoDU1lJ1kyYlMWvAUBM24kBFcddTpEguhwkOTtuLFylUrq4la/n149sFT/laRtHCunIC/c7d/EIDpnGmm+cat4tGj4cAM9/6AluZlf9AUCoa6Z2vmBMsDSwxQ/4kQxsF26MIDkXvaJIhgTrFdQg6ueCC162bkC30nyfFRNs7f2bEiE1H8gbGOwt1a8k8uOeXPBY/Tig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBVGmuS8tHwiruVQoE1i+DvY2aLjDlIh9qsSwEkDmF0=;
 b=lsm52ThWGRT6E3MdK8333WOcwDJFSGgKKCMdVuPd7pGFXdb26Tf0fPliB1g/TqCYwfjrdWU1PhXWSVGEEh2Hs6fNMkMPJQu744hnjO1pBsGIlXhdANGMAOz6MV5+B9QftA08jag5ayBkw1VZoOkwgnfbki7GSyX3BbOAf2w8Las6D9hqg6/RCrzhlJ8HnxN3Zwe8mksKTw+hs42mlpc60ui1nm4qJuC3KtG0L6ZSMWbMlzr9+LCPN9abrWcHhWwDGfCW5bcOwT52I5JcbSwp9DMaP0R0PW9weC1gNVnuakdPq+6AfxbR2RCk6iyq+RC9HhWUxBDzAzYgLlmFY1IFAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from SN1PR12CA0080.namprd12.prod.outlook.com (2603:10b6:802:21::15)
 by BL0PR12MB2529.namprd12.prod.outlook.com (2603:10b6:207:4e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Wed, 31 Jul
 2019 03:53:56 +0000
Received: from CO1NAM03FT004.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by SN1PR12CA0080.outlook.office365.com
 (2603:10b6:802:21::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2115.15 via Frontend
 Transport; Wed, 31 Jul 2019 03:53:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT004.mail.protection.outlook.com (10.152.80.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Wed, 31 Jul 2019 03:53:55 +0000
Received: from monk-build.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Jul 2019
 22:53:54 -0500
From: Monk Liu <Monk.Liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amdgpu: fix incorrect judge on sos fw version
Date: Wed, 31 Jul 2019 11:53:45 +0800
Message-ID: <1564545226-2633-2-git-send-email-Monk.Liu@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564545226-2633-1-git-send-email-Monk.Liu@amd.com>
References: <1564545226-2633-1-git-send-email-Monk.Liu@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(2980300002)(428003)(189003)(199004)(2906002)(50226002)(8676002)(316002)(68736007)(7696005)(2616005)(26005)(4326008)(11346002)(14444005)(6916009)(81156014)(81166006)(476003)(86362001)(4744005)(478600001)(8936002)(446003)(50466002)(126002)(47776003)(5660300002)(356004)(6666004)(16586007)(53936002)(70206006)(36756003)(186003)(48376002)(2351001)(53416004)(426003)(76176011)(305945005)(51416003)(70586007)(336012)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2529; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77afed8e-7b8c-4e75-d639-08d7156ab5e8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BL0PR12MB2529; 
X-MS-TrafficTypeDiagnostic: BL0PR12MB2529:
X-Microsoft-Antispam-PRVS: <BL0PR12MB25291F96587EFC2FB6AB81ED84DF0@BL0PR12MB2529.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 011579F31F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: HvXEzMIR0d8JeuuRwT1b2GICHXb/aUT1+du/wYpDa5WNNGRokZ/XZ6JED4mgBzowijVbme4vGMjRnhAHTiW89kM7EtoNJVcWbG1gxgDGFJsmmx+MVpoWO+DmKZZnY4biaA2C2zx9tTuWNn57lrgQDJ/8/KOheULE9B8IpfhTamRgvkwONgzUKEAzGvhGgsuCxghwgyl8JtIlgYxpKY3hVy1FmFh7SU8FzAEFPEZII/GgJ9+SdbkzRB/Z7gyeLtv0WvI4uerd2RpybjYJErgenGyVM1V3Y11jrSIxPr6VyVPRyCvmjn36loN9HifDxV9tUfhZWVlASNdTXRsIpIElUGrwqydypD/UgzpEQJivgZiPWs0WSGV+6+u5BpuBJsWgx5BJO7RvrjzolIk9jo3b8VNounmxS+glo+iZAUbXcN4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2019 03:53:55.6999 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77afed8e-7b8c-4e75-d639-08d7156ab5e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2529
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBVGmuS8tHwiruVQoE1i+DvY2aLjDlIh9qsSwEkDmF0=;
 b=VndCXt/aCjWXTE18xyRmq9FTz2i4QY3xuCdl+kNqBzIZ+3zN6yPB30RdTvJC7p4bTZW38imHoLL1aR+jd4tg11Q0NN+jKYTo1QxO+RQtbYY8RvPPn3jWSldfZQa6RY9dqMAlpdJQIjOq5XNZ+8xn3GEm+0NAOUXF1A1r2idi2p0=
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
Cc: Monk Liu <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Zm9yIFNSSU9WIHRoZSBTT1MgZncgb2YgUFNQIGlzIGxvYWRlZCBpbiBoeXBlcnZpc29yIHRodXMK
Z3Vlc3Qgd29uJ3QgdGVsbCB0aGUgdmVyc2lvbiBvZiBpdCwgYW5kIGp1ZGdpbmcgZmVhdHVyZSBi
eQpyZWFkaW5nIHRoZSBzb3MgZncgdmVyc2lvbiBpbiBndWVzdCBzaWRlIGlzIGNvbXBsZXRlbHkg
d3JvbmcKClNpZ25lZC1vZmYtYnk6IE1vbmsgTGl1IDxNb25rLkxpdUBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92M18xLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9wc3BfdjNfMS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
cHNwX3YzXzEuYwppbmRleCBlYzNhMDU2Li5iYTMyNzU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9wc3BfdjNfMS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3BzcF92M18xLmMKQEAgLTYzNCw3ICs2MzQsNyBAQCBzdGF0aWMgaW50IHBzcF92M18xX21v
ZGUxX3Jlc2V0KHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQogCiBzdGF0aWMgYm9vbCBwc3BfdjNf
MV9zdXBwb3J0X3Ztcl9yaW5nKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQogewotCWlmIChhbWRn
cHVfc3Jpb3ZfdmYocHNwLT5hZGV2KSAmJiBwc3AtPnNvc19md192ZXJzaW9uID49IDB4ODA0NTUp
CisJaWYgKGFtZGdwdV9zcmlvdl92Zihwc3AtPmFkZXYpKQogCQlyZXR1cm4gdHJ1ZTsKIAogCXJl
dHVybiBmYWxzZTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
