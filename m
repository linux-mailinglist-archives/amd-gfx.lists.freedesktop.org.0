Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB7E9C815
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 05:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D976E174;
	Mon, 26 Aug 2019 03:55:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710059.outbound.protection.outlook.com [40.107.71.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0896E175
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 03:55:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTOBa6CMnqk9Xx2+nxADwBGT4oAIbfdaxsEq+kJBYC5BXbjGvQs5kuHV5Nti6rRYkMfanS+OT+c63UeXnyy6g0ULZzlIQEYHs+dA2Up6EFoY2K1IEaLFVQgLErM18uI3JTX0li/CU+JW4Hc0YjHpMCHOGYLQnlVqSMPB+GPKncv4Wr+2Wnm/ClS+O0BK566LVAOGIj0AvDirbVnbN6gybt+JnQh8EbwRPRnwPZKd7vCM1jG589j6anN7qUDQPJX9Byy8lVDytWFo5R6QDl3w8xjQgw8Ooc5iAXAD65mhbwUlco8mip3ezFzRXj34E8iNHCx+enN/vF6yS7DnuQ26ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/rgnKpTc1JhhM1aVYM/FPDJaC03JXr8kyOJ45TI4Gk=;
 b=e8I+DlEE+uv0qdQFPzIjevmi1w+gAocvZm3FC+bNiRAC43Mrw9l19yCqkBfUNoho2JV7rDwP4DvkFGyERiqWSgbTsqgeTSfK8ltJz+jK/PCyWV32yLPZpoJw8KAog/eJyzMEh33AhfopqnsuqNJjasaBoLAKBQLaUQFiy2mqc8n114as7ETlwV0Kh0WxyUHeOsjfZ9WjBPiQqHhOIUuKJM85Uut8bUHFkGKJwdqFDY84+GTnoI9en2VxSTV/9Hb9j5lqFximNuhC4QO2r+xQyLdqnV0L9C5g44jVxP772nc9AtrzcBno/H8LD6z14UcT1of3BoyVjJjvEo3PdOO92g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0061.namprd12.prod.outlook.com (2603:10b6:3:103::23)
 by MWHPR12MB1279.namprd12.prod.outlook.com (2603:10b6:300:d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Mon, 26 Aug
 2019 03:55:37 +0000
Received: from DM3NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by DM5PR12CA0061.outlook.office365.com
 (2603:10b6:3:103::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Mon, 26 Aug 2019 03:55:37 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT030.mail.protection.outlook.com (10.152.82.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 03:55:36 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Sun, 25 Aug 2019 22:55:35 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 7/8] drm/amdgpu: enable/disable ras_controller_irq and
 err_event_athub_irq
Date: Mon, 26 Aug 2019 11:54:59 +0800
Message-ID: <1566791700-1912-8-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
References: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(2980300002)(428003)(199004)(189003)(70206006)(53416004)(2616005)(476003)(11346002)(126002)(426003)(5660300002)(316002)(486006)(50226002)(70586007)(446003)(16586007)(8936002)(48376002)(110136005)(50466002)(7696005)(51416003)(36756003)(53936002)(8676002)(305945005)(6636002)(86362001)(76176011)(336012)(81166006)(356004)(6666004)(2906002)(26005)(478600001)(81156014)(47776003)(4326008)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1279; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bb18afe-ac86-4028-1a36-08d729d940fc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MWHPR12MB1279; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1279:
X-Microsoft-Antispam-PRVS: <MWHPR12MB127925D447D929B13064A8D1FCA10@MWHPR12MB1279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: QxNohgAUn2vkxoUs8LAwfVLpfLlS80qNYHv7sE2BKugavKPY6Pnc1nvLTyl75Lf/Po9urOBuRhUXMbA3jMApdbNnK7t9Ub37ebxeMAesdjBJ49PJxtCLWvGXoqY5UIQDKiPnfLtNq4Fpbf2Ab7UuctZx4/p0cG2mijPNfIORYK8aSgaQJe9HLRBluX5SbWOwt7/WkKG2a3Q1+f8aKDDLoWfXe0tx1ZKgrFMDVE6cFC4DyiM9M9qyLHfX9rVf0JaX+fCqv5wk7eorCKVJ05Mr6PvbePzjnzOwQW3LIwBqGGXRol0WTAQ1Wgszu93RhoNI07Up8/dvo8QMAAyRg9asH02bTu0dSDZDjQyh9W9VqWz/8lcbQBH2PhIzuKd2UkmgjV8h/xl/B4UzAaY9gTs5Vgb6tiBBCtrL+TI0HJzY/20=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 03:55:36.9650 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb18afe-ac86-4028-1a36-08d729d940fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1279
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/rgnKpTc1JhhM1aVYM/FPDJaC03JXr8kyOJ45TI4Gk=;
 b=ku1PBTuI9MhWTJJMp8K2H7QXaZwev/yGV4IxfzxcND57Wg1+oG97iMEsAPItmebwz/enqUsNMjA9ek1UPYdBhGxlMMQFKo+Bw/+CEldNnghxRYyDbsd5KLCrm+R/luPrxSvqOXyBjLootkg72YOl4lOSfXskFTaqeN+kQKA14oc=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZp
ZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgfCAxNiArKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjlfMC5jCmluZGV4IDU1ZGE2ZjUuLjhiNGE1NjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYwpAQCAtODIyLDYgKzgyMiwxOCBAQCBzdGF0aWMgaW50IGdtY192OV8w
X2VjY19yYXNfYmxvY2tfbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSwKIAkJCWdvdG8gaXJxOwogCX0K
IAorCWlmIChhZGV2LT5uYmlvLmZ1bmNzLT5pbml0X3Jhc19jb250cm9sbGVyX2ludGVycnVwdCkg
eworCQlyID0gYW1kZ3B1X2lycV9nZXQoYWRldiwgJmFkZXYtPm5iaW8ucmFzX2NvbnRyb2xsZXJf
aXJxLCAwKTsKKwkJaWYgKHIpCisJCQlnb3RvIGlycTsKKwl9CisKKwlpZiAoYWRldi0+bmJpby5m
dW5jcy0+aW5pdF9yYXNfZXJyX2V2ZW50X2F0aHViX2ludGVycnVwdCkgeworCQlyID0gYW1kZ3B1
X2lycV9nZXQoYWRldiwgJmFkZXYtPm5iaW8ucmFzX2Vycl9ldmVudF9hdGh1Yl9pcnEsIDApOwor
CQlpZiAocikKKwkJCWdvdG8gaXJxOworCX0KKwogCXJldHVybiAwOwogaXJxOgogCWFtZGdwdV9y
YXNfc3lzZnNfcmVtb3ZlKGFkZXYsICpyYXNfaWYpOwpAQCAtMTQyNyw2ICsxNDM5LDEwIEBAIHN0
YXRpYyBpbnQgZ21jX3Y5XzBfaHdfZmluaSh2b2lkICpoYW5kbGUpCiAKIAlhbWRncHVfaXJxX3B1
dChhZGV2LCAmYWRldi0+Z21jLmVjY19pcnEsIDApOwogCWFtZGdwdV9pcnFfcHV0KGFkZXYsICZh
ZGV2LT5nbWMudm1fZmF1bHQsIDApOworCWlmIChhZGV2LT5uYmlvLmZ1bmNzLT5pbml0X3Jhc19j
b250cm9sbGVyX2ludGVycnVwdCkKKwkJYW1kZ3B1X2lycV9wdXQoYWRldiwgJmFkZXYtPm5iaW8u
cmFzX2NvbnRyb2xsZXJfaXJxLCAwKTsKKwlpZiAoYWRldi0+bmJpby5mdW5jcy0+aW5pdF9yYXNf
ZXJyX2V2ZW50X2F0aHViX2ludGVycnVwdCkKKwkJYW1kZ3B1X2lycV9wdXQoYWRldiwgJmFkZXYt
Pm5iaW8ucmFzX2Vycl9ldmVudF9hdGh1Yl9pcnEsIDApOwogCWdtY192OV8wX2dhcnRfZGlzYWJs
ZShhZGV2KTsKIAogCXJldHVybiAwOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
