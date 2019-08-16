Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E3B8FE9E
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 10:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778E689129;
	Fri, 16 Aug 2019 08:59:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5133189129
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 08:59:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=giCZjk9WsETU77md8aodAhyx/whsp+RNNfsWRjPOHROuOJ/W2JO98qeNHfi/81l4iZhXCJOya/Xb/K54YE5ZPe+XiSWA1JnmLGlntB+nQS+Ldh06vVu9oQkU+VSrKFVmlt5lWXiAy7zKTqSay6RIogD9vWrt9U/P9CosaNDJkG8r+pwnZUPiENH0YIMREyMbh3DbCHLXkw1pS7e9l45eWe4j/WIGlONYXzgtHRWAwWj/25a9Q7MS2r+Xa6TVfqM2JsMWasKI/iZxu7th7f8vewv4VkuIn80seytJFQsbnW7HddK2nzy2cXl8e/Y+a6LvX80luhcyksNIixUF7UkVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rzcANORzZTB3GcP0TlZrv0uW5VCyMbo3Km2LdHbMi8=;
 b=UfXLZtrXOnk5DNOtYuSk/2yWX69KW7mNrr5tJsY4GBqqdOtGZt1H3m+qmSOxu6XpEW7RZ+dorpRfRQAuQl7ANv3WLSxnnLOVNSfKAO4QNGRboiCvXFjRDmR+AGcYwrR9WuwPO7dXc7rN4tqZe+C3jK5ZeLH62Wy+2OCqrhXlgyuMIey0P6FwrMlnqex86+19yNUypgSx/7TT5lyDN8bf8rhjMa/Y5gvKy6KeF7AeLKehG/aJElLqMLZDYydcDHWj5ietzCoZDcVFIOlgCsRzh4O147JAiQqHRy+yigXpRviYobDrg4fpMrppLXfRFIfW589UqGqx+ly1Utw9WU9FeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0072.namprd12.prod.outlook.com (2603:10b6:300:103::34)
 by MWHPR12MB1278.namprd12.prod.outlook.com (2603:10b6:300:10::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17; Fri, 16 Aug
 2019 08:59:36 +0000
Received: from DM3NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by MWHPR12CA0072.outlook.office365.com
 (2603:10b6:300:103::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Fri, 16 Aug 2019 08:59:36 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT028.mail.protection.outlook.com (10.152.82.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Fri, 16 Aug 2019 08:59:35 +0000
Received: from gigabyte-debug.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 16 Aug 2019
 03:59:34 -0500
From: Frank.Min <Frank.Min@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] amd/amdkfd: add Arcturus vf DID support
Date: Fri, 16 Aug 2019 16:59:19 +0800
Message-ID: <1565945960-21236-2-git-send-email-Frank.Min@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565945960-21236-1-git-send-email-Frank.Min@amd.com>
References: <1565945960-21236-1-git-send-email-Frank.Min@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(47776003)(70206006)(2906002)(26005)(8676002)(81156014)(5660300002)(53416004)(81166006)(478600001)(70586007)(336012)(6916009)(426003)(51416003)(76176011)(6666004)(2616005)(356004)(476003)(446003)(7696005)(48376002)(50466002)(2351001)(186003)(11346002)(126002)(486006)(4326008)(316002)(16586007)(86362001)(4744005)(36756003)(8936002)(53936002)(50226002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1278; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7382fce9-7f70-4628-aec0-08d722280fec
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MWHPR12MB1278; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1278:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12786FE2A60B3963EE58B22EE9AF0@MWHPR12MB1278.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0131D22242
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 5Civ/x5UE9G9bdqJ5naXCnqwuiQL3Oy9y8BiU5BjQXp6yw386Cp6hexN9phr7sxqSy+rK12e9XJjH9jnFiGVF/QSWkmrlDpQaQ/wZArC1Z48Oo64u5Rr1W4BTXJIY0Ya0txy/nM3CQrUeYI0kL/5fu9RdEza6k/2i/NzqXqIs6X8Gn+HKEeAKC+E9atURuVpnk6iLzUhbBOnQiRGFQsRk7kg8bOS4WW8pFUowpnHL1knzQuuGidK65T5AaA+bAZqZTBhjprBinmzb1MF+nhsgGURmCldSNn8nLFi6wPLLW6xNGhqxUUn6ldw53vp4TtDjaUUr0Fqa6IP15iXCkPFVp6h+kG5CXPGlNVdnTFD/HI3O2QMcN5bx1qfAgKqsqzofXrrpilOjDj5/LJ38OXc/mnDEax+A2tcpoj4vLf1Id0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2019 08:59:35.5969 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7382fce9-7f70-4628-aec0-08d722280fec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1278
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rzcANORzZTB3GcP0TlZrv0uW5VCyMbo3Km2LdHbMi8=;
 b=VicKLw8ukSRCkdRDV2IDJuaF27cs18JS9dfWjRK2zLTV4sGo71IG/H0N+YCUtWu38e4N8tMXuDh262DhqhF/ER+1vTsmsxgc1bh4Hv5/Yma+5MSW3WzxmpwyefZzZ92pfmI3EjdmhJflUeTes+FbgvKAK/P7H8k9ENVuW9gx/ak=
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
Cc: "Frank.Min" <Frank.Min@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2hhbmdlLUlkOiBJODQyY2MzMWFiMDQwYjE3ZGNjNTc2NWUyNzVlNTQwMmRmNzg1YjM0YQpTaWdu
ZWQtb2ZmLWJ5OiBGcmFuay5NaW4gPEZyYW5rLk1pbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rl
dmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCmluZGV4IDNi
OWZlNjIuLjMyYjFjZmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMK
QEAgLTQ3Miw2ICs0NzIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VpZCBzdXBw
b3J0ZWRfZGV2aWNlc1tdID0gewogCXsgMHg3MzhDLCAmYXJjdHVydXNfZGV2aWNlX2luZm8gfSwJ
LyogQXJjdHVydXMgKi8KIAl7IDB4NzM4OCwgJmFyY3R1cnVzX2RldmljZV9pbmZvIH0sCS8qIEFy
Y3R1cnVzICovCiAJeyAweDczOEUsICZhcmN0dXJ1c19kZXZpY2VfaW5mbyB9LAkvKiBBcmN0dXJ1
cyAqLworCXsgMHg3MzkwLCAmYXJjdHVydXNfZGV2aWNlX2luZm8gfSwJLyogQXJjdHVydXMgdmYg
Ki8KIAl7IDB4NzMxMCwgJm5hdmkxMF9kZXZpY2VfaW5mbyB9LAkvKiBOYXZpMTAgKi8KIAl7IDB4
NzMxMiwgJm5hdmkxMF9kZXZpY2VfaW5mbyB9LAkvKiBOYXZpMTAgKi8KIAl7IDB4NzMxOCwgJm5h
dmkxMF9kZXZpY2VfaW5mbyB9LAkvKiBOYXZpMTAgKi8KLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
