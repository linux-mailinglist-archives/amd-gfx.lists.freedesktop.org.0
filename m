Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5C08FA9A
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 08:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC3A6EACD;
	Fri, 16 Aug 2019 06:08:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750083.outbound.protection.outlook.com [40.107.75.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CC56EACD
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 06:08:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmbCiGSk1kfoMc6PEFXNWUz5izpyhWh2UfqhWIkxnCd4q8yCIu9WfOWH6ABHDvZC9wGdDwb8ImvMD3IiOcZ+JEzM9xmRNqgh+WVv2KnZthFH8T1j+NeqKUYb8lWz+znk6cJRKNjRxAH1LhIspoN832JLA/eAOQ8rulO4jy8LV1klgMtCd3nuwETiIWcjLTK7+1rnu2aYGsQjIbduoCzNJ9yvS5oqc2rGCthAaoFswGDME5l7yD55gegBRYPfQ7cMHoRfvgy97P44DTk6hWuZGkIydp3x3wC/9a0xMZfIzM7CfCONlyhxobDE70OuWZqIcqOfYjTsYLR7GeHBtckFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+sbLOXn5yWnOGHluTwfYCh8OafdfinwxgBMxqPv09E=;
 b=leAAOefzmRzWShRPFO8KeMfpH1qtI+/AwBqN+cvgRbRUb502Q5/WHsYwk2JWmY9zXOsxDRdRNM85OZ1DV0NXL+CPgAoFPydhyVV+VoglHf6N6qRQ3j/+pCfc46BPgng5UYYvjIr08iZjxyq+KNB3kGOdJ+rEci3ukAi9sfHOW9TJJfbKfA6EoUZzZ/rjE/rr4jRyQjirm3KwZyMzxtylq+HaWw1JYwe8wPRPLj+VORpTFkic7+5gJFCfwRsEoY2hTQ71gK1SaWIVUHMisknRXeMWzznKaonQWU06vWV4Rg6jTffwb6YkSH8DUzKePOi3YLW43zVWvexb3+U+2s5VJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0044.namprd12.prod.outlook.com (2603:10b6:405:70::30)
 by CY4PR12MB1272.namprd12.prod.outlook.com (2603:10b6:903:3e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Fri, 16 Aug
 2019 06:08:23 +0000
Received: from BY2NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by BN6PR12CA0044.outlook.office365.com
 (2603:10b6:405:70::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Fri, 16 Aug 2019 06:08:22 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT046.mail.protection.outlook.com (10.152.85.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Fri, 16 Aug 2019 06:08:22 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 16 Aug 2019
 01:08:20 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/amd/powerplay: expose supported clock domains only
 through sysfs
Date: Fri, 16 Aug 2019 14:08:05 +0800
Message-ID: <20190816060807.11922-2-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190816060807.11922-1-evan.quan@amd.com>
References: <20190816060807.11922-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(2980300002)(428003)(189003)(199004)(2870700001)(70586007)(5660300002)(70206006)(186003)(426003)(4326008)(53416004)(2906002)(356004)(6666004)(478600001)(126002)(476003)(446003)(2616005)(11346002)(486006)(1076003)(44832011)(316002)(26005)(336012)(36756003)(305945005)(51416003)(48376002)(50466002)(8676002)(8936002)(81166006)(81156014)(7696005)(76176011)(6916009)(2351001)(47776003)(50226002)(53936002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1272; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b695452e-ae5f-4fec-9d3a-08d72210248f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1272; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1272:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1272390085478823BCB07E7EE4AF0@CY4PR12MB1272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-Forefront-PRVS: 0131D22242
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bp+t1Tw1V+uk4R6AFDRmxm6Bwjl8v/Zsgo7yTBUZM98dTgIbMiwu+1WQABTzj7kh6LTcFX/gDDvyanjAFKwbFxlJPg0dg2Nn8jCnbPyCyIfxwuaqqPMMfGtQqzzli2UKSeX/27PY75e3YFZgjzrMXgHcmhgAWNEvR8j4jgRTRnvR6T0qymAAofCgO7/8li/c4DuZlJK3TsZZ/LN9yBG+7fGAqrewWVOl++uOgBdqe4fAYeQORdF2Ui2YnSMw1aYLjNAQONoKHsBns/fyyXtZPwtKpjnzbHJm9UBMEDWxHCZa0pCKNz90n5GnRaWNC/QdrxMuU7Gts7dWG5+U3b0g2zhA0KGRxQRMJFx/f6MN0XY6dcSeWeFqx1/UvP10+ygVu+l8+YYktm6Jn/4+bje1VQKVOzMX8k5DzLN88gLK7Mo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2019 06:08:22.2886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b695452e-ae5f-4fec-9d3a-08d72210248f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+sbLOXn5yWnOGHluTwfYCh8OafdfinwxgBMxqPv09E=;
 b=Y9W6krbp18iabUIpuZon9FfeJ2K4ps9yjmUCfNCcT9Yw16DMalxMjl1WZfLEeqNRdo6E8tRwn0bYxmmVBM3RX8pKxmI51cEpQBKH54uRt7ul6vuUav/Ve1RNUsR1D6323C1qoqIA9F/G6jSW9aGKqEqF5+W8OjpVSFSs5lNLzvw=
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

RG8gbm90IGV4cG9zZSB0aG9zZSB1bnN1cHBvcnRlZCBjbG9jayBkb21haW5zIHRocm91Z2ggc3lz
ZnMgb24KQXJjdHVydXMuCgpDaGFuZ2UtSWQ6IEk1MjZlN2JkNDU3ZmRjZDhjNzlkNDU4MWJiOWI3
N2U1Y2I1N2Y1ODQ0ClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgfCAyNiArKysrKysr
KysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMKaW5kZXgg
YzU2NDJiZTliNDRiLi43YWNjZjJjN2Y4Y2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9wbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wbS5jCkBAIC0yODc5LDEwICsyODc5LDEyIEBAIGludCBhbWRncHVfcG1fc3lzZnNfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJCURSTV9FUlJPUigiZmFpbGVkIHRvIGNy
ZWF0ZSBkZXZpY2UgZmlsZSBwcF9kcG1fc29jY2xrXG4iKTsKIAkJCXJldHVybiByZXQ7CiAJCX0K
LQkJcmV0ID0gZGV2aWNlX2NyZWF0ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX3BwX2RwbV9k
Y2VmY2xrKTsKLQkJaWYgKHJldCkgewotCQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gY3JlYXRlIGRl
dmljZSBmaWxlIHBwX2RwbV9kY2VmY2xrXG4iKTsKLQkJCXJldHVybiByZXQ7CisJCWlmIChhZGV2
LT5hc2ljX3R5cGUgIT0gQ0hJUF9BUkNUVVJVUykgeworCQkJcmV0ID0gZGV2aWNlX2NyZWF0ZV9m
aWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX3BwX2RwbV9kY2VmY2xrKTsKKwkJCWlmIChyZXQpIHsK
KwkJCQlEUk1fRVJST1IoImZhaWxlZCB0byBjcmVhdGUgZGV2aWNlIGZpbGUgcHBfZHBtX2RjZWZj
bGtcbiIpOworCQkJCXJldHVybiByZXQ7CisJCQl9CiAJCX0KIAl9CiAJaWYgKGFkZXYtPmFzaWNf
dHlwZSA+PSBDSElQX1ZFR0EyMCkgewpAQCAtMjg5MiwxMCArMjg5NCwxMiBAQCBpbnQgYW1kZ3B1
X3BtX3N5c2ZzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCQlyZXR1cm4gcmV0
OwogCQl9CiAJfQotCXJldCA9IGRldmljZV9jcmVhdGVfZmlsZShhZGV2LT5kZXYsICZkZXZfYXR0
cl9wcF9kcG1fcGNpZSk7Ci0JaWYgKHJldCkgewotCQlEUk1fRVJST1IoImZhaWxlZCB0byBjcmVh
dGUgZGV2aWNlIGZpbGUgcHBfZHBtX3BjaWVcbiIpOwotCQlyZXR1cm4gcmV0OworCWlmIChhZGV2
LT5hc2ljX3R5cGUgIT0gQ0hJUF9BUkNUVVJVUykgeworCQlyZXQgPSBkZXZpY2VfY3JlYXRlX2Zp
bGUoYWRldi0+ZGV2LCAmZGV2X2F0dHJfcHBfZHBtX3BjaWUpOworCQlpZiAocmV0KSB7CisJCQlE
Uk1fRVJST1IoImZhaWxlZCB0byBjcmVhdGUgZGV2aWNlIGZpbGUgcHBfZHBtX3BjaWVcbiIpOwor
CQkJcmV0dXJuIHJldDsKKwkJfQogCX0KIAlyZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoYWRldi0+
ZGV2LCAmZGV2X2F0dHJfcHBfc2Nsa19vZCk7CiAJaWYgKHJldCkgewpAQCAtMjk5OSw5ICszMDAz
LDExIEBAIHZvaWQgYW1kZ3B1X3BtX3N5c2ZzX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAJZGV2aWNlX3JlbW92ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX3BwX2RwbV9tY2xr
KTsKIAlpZiAoYWRldi0+YXNpY190eXBlID49IENISVBfVkVHQTEwKSB7CiAJCWRldmljZV9yZW1v
dmVfZmlsZShhZGV2LT5kZXYsICZkZXZfYXR0cl9wcF9kcG1fc29jY2xrKTsKLQkJZGV2aWNlX3Jl
bW92ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX3BwX2RwbV9kY2VmY2xrKTsKKwkJaWYgKGFk
ZXYtPmFzaWNfdHlwZSAhPSBDSElQX0FSQ1RVUlVTKQorCQkJZGV2aWNlX3JlbW92ZV9maWxlKGFk
ZXYtPmRldiwgJmRldl9hdHRyX3BwX2RwbV9kY2VmY2xrKTsKIAl9Ci0JZGV2aWNlX3JlbW92ZV9m
aWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX3BwX2RwbV9wY2llKTsKKwlpZiAoYWRldi0+YXNpY190
eXBlICE9IENISVBfQVJDVFVSVVMpCisJCWRldmljZV9yZW1vdmVfZmlsZShhZGV2LT5kZXYsICZk
ZXZfYXR0cl9wcF9kcG1fcGNpZSk7CiAJaWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX1ZFR0Ey
MCkKIAkJZGV2aWNlX3JlbW92ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX3BwX2RwbV9mY2xr
KTsKIAlkZXZpY2VfcmVtb3ZlX2ZpbGUoYWRldi0+ZGV2LCAmZGV2X2F0dHJfcHBfc2Nsa19vZCk7
Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
