Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2040FC3D5
	for <lists+amd-gfx@lfdr.de>; Thu, 14 Nov 2019 11:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D136E570;
	Thu, 14 Nov 2019 10:18:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770059.outbound.protection.outlook.com [40.107.77.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D966E570
 for <amd-gfx@lists.freedesktop.org>; Thu, 14 Nov 2019 10:18:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EE3LV+yhvouzGt8USTLVrWbyx6YFd1XHPUn3Hl1GGpA6CC47nwzl9us40Xyfwg57ymfnv/WNr1pMTHLzDg9kXzFFr1z4ZVDOQOodgz054Ozz2Yaw8OQneWB02uzotfZyTqdr+IHpJN+oIrPd73bIYMaay9oYwaCWWCUDjx1iO3lnc0kLdFd4osTeW0c9lT62x9mODRCc6KXzAr6tl5d+XbXCETJMyhKkaER6d8diXHl1B15WQZo8/NeueUni7fa+OMyYiyg1rwUjknXlXIWnyqPLeE+7NHVnzeu44UOsDnhp1ynQNx2rFLYn3mzSeGSvG+RWjwiOIE7CXBHqWN6AcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pz5JCfzm7iGJpwrje1IStgVHWpjtAFo0TiQYRZVZEw4=;
 b=PPq7yw8N6EqxwJHeUg37GKAwmZ4aBd75q1WrqTz/WG052nwfudD6c7oJkvPNQ5vZJzlwu/B7OyAd+X+EMfBWoN//p5al5713QL8t72P5XqXqmQ5SpAoQHYpUcirGMGeYoLyJl9yAtatAXr3hmbE0Fa5fPTMRVrENq6SlawROBssMR4FiGipl+OEUJ3vWyu7LVFm4frekHZLp7aEuJlyeYnqZbG4l3n9wC+US2Y4hEh+bcEikDTCb+vzjwSKBuy1+NfFaHfznvcTJneeROv0QKoqM8VzfcOFjt3f5/NApT6Gv66Xk67CSF3IxEqpIDDCRYhyshHTAyKGw8QMGok8eoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (20.179.80.214) by
 MN2PR12MB3246.namprd12.prod.outlook.com (20.179.81.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Thu, 14 Nov 2019 10:18:31 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::9821:4373:684f:f580]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::9821:4373:684f:f580%6]) with mapi id 15.20.2451.023; Thu, 14 Nov 2019
 10:18:31 +0000
From: "Changfeng.Zhu" <changfeng.zhu@amd.com>
To: amd-gfx@lists.freedesktop.org, Christian.Koenig@amd.com, Ray.Huang@amd.com,
 Xinmei.Huang@amd.com
Subject: [PATCH 1/2] drm/amdgpu: enable mmhub power pate for renoir
Date: Thu, 14 Nov 2019 18:18:05 +0800
Message-Id: <20191114101805.6920-1-changfeng.zhu@amd.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: HK0P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::25) To MN2PR12MB2896.namprd12.prod.outlook.com
 (2603:10b6:208:ab::22)
MIME-Version: 1.0
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [180.167.199.189]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 775b7d46-ddb6-434e-bdea-08d768ebffbd
X-MS-TrafficTypeDiagnostic: MN2PR12MB3246:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB32467ACED3916A9395D8FBC3FD710@MN2PR12MB3246.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:170;
X-Forefront-PRVS: 02213C82F8
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(189003)(199004)(86362001)(26005)(6636002)(25786009)(6116002)(50226002)(6436002)(316002)(14444005)(99286004)(3846002)(8936002)(6666004)(305945005)(4326008)(486006)(81166006)(81156014)(16586007)(36756003)(14454004)(8676002)(7736002)(2906002)(386003)(6486002)(478600001)(1076003)(2616005)(476003)(66946007)(51416003)(5660300002)(52116002)(48376002)(66066001)(6506007)(50466002)(66476007)(66556008)(186003)(47776003)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3246;
 H:MN2PR12MB2896.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n6mcR5tPS1T3rjFXFXt5cQHOZEUg6TeBtmxOnQmqzTNa8p7BwplWCgoe6kviOXnagtLc4NLB1YvN55K2hLDMjNQB7dJv5FPycL7uoOD4+Vfkl/andSMrVSMvUgtRQSHzjKEZDOstA/EMvhsUO5Ib2r/8iAEm/yuSFWlubxnsZwxph5sGna8y0/Cv36AgIly9LovALJLXic1+BTRXClACmUt0UMHT3J7BGFafr/ntLowPoWXp6ssjjQCNNhvSAEOU0Ro0bm04NrDcM5LLpXmznCiJQbIJpCYqcYhf33YhENjlZo2b+7Na868Y02RXjFNop3qYP0wi6js/yBLsba2mFV041Ap638MgwCFFZfskwpChU7+7QqOB3BcwNu1iyb3Q1M3pev8QNUq7lwaP01vTO/Hz5BOzGjd90TahNmLKPGJZ29UkfjK0Trrj3lhO8VML
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 775b7d46-ddb6-434e-bdea-08d768ebffbd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 10:18:31.6451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3a6ntqJfEjjXQyE1qW69VSGfKhxE8BPCoiaIYfCSEa+iQQ/9cFvFkla8W5mgMLKuRL1Y/0CBZlFwGMhAJhORvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3246
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pz5JCfzm7iGJpwrje1IStgVHWpjtAFo0TiQYRZVZEw4=;
 b=elaOdESOTbKI3il7BwJuLD6MyIwfRz1QuUHWnqCD1qT49dkx+TTvX4o9+seaKXHbyN9IspLzT5LTwlRHPohdMpoKfagmTiP4XrrcfoBZg7q6TBGWC13YhYDquTp7IaapyezIF8xyabKezLhhcZg8DadGMiE4LqgWCgKBEw+C3/M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Changfeng.Zhu@amd.com; 
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
Cc: changzhu <Changfeng.Zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogY2hhbmd6aHUgPENoYW5nZmVuZy5aaHVAYW1kLmNvbT4KCm1taHViIHBvd2VyIGdhdGUg
c3RydWN0dXJlIGlzIGNoYW5nZWQgaW4gcmVub2lyIGNvbXBhcmVkIHdpdGggcmF2ZW4uIEl0Cmdv
ZXMgdGhyb3VnaCBzbXVfZHBtX3NldF9wb3dlcl9nYXRlIG90aGVyIHRoYW4KYWRldi0+cG93ZXJw
bGF5LnBwX2Z1bmNzLT5zZXRfcG93ZXJnYXRpbmdfYnlfc211IGluIHJlbm9pci4KClNvIHdlIGNh
biByZWFsaXplIG1taHViIHBvd2VyIGdhdGUgaW4Kc211X2RwbV9zZXRfcG93ZXJfZ2F0ZSAtPgpz
bXVfcG93ZXJnYXRlX21taHViIC0+CnBvd2VyZ2F0ZV9tbWh1YiAtPgpzbXVfdjEyXzBfcG93ZXJn
YXRlX21taHViCgpDaGFuZ2UtSWQ6IEkzZTFiNWFiOTZmNzgyNGFiYjgyYjE2MjMyZGJhMGEyNjNj
YWVhYWE4ClNpZ25lZC1vZmYtYnk6IGNoYW5nemh1IDxDaGFuZ2ZlbmcuWmh1QGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RwbS5jICAgICAgICB8IDEwICsr
KysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICAgICAgICAg
fCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMgICAgICAgIHwg
IDMgKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jICAgICAgICAgICAgIHwg
IDMgKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgICAgIHwg
IDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIHwg
IDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTJfMC5oICB8ICAy
ICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMgICAgIHwgIDEg
KwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X2ludGVybmFsLmggICB8ICAyICsr
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjEyXzAuYyAgICAgIHwgIDYgKysr
KysrCiAxMCBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcG0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcG0uYwppbmRleCAyOGQzMjcyNTI4NWIu
LjNjMjA2NjhiOGQ0MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RwbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcG0uYwpA
QCAtOTU0LDE1ICs5NTQsMTcgQEAgaW50IGFtZGdwdV9kcG1fc2V0X3Bvd2VyZ2F0aW5nX2J5X3Nt
dShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgYmxvY2sKIAljYXNlIEFNRF9J
UF9CTE9DS19UWVBFX1ZDTjoKIAljYXNlIEFNRF9JUF9CTE9DS19UWVBFX1ZDRToKIAljYXNlIEFN
RF9JUF9CTE9DS19UWVBFX1NETUE6CisJY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9HTUM6CiAJCWlm
IChzd3NtdSkKIAkJCXJldCA9IHNtdV9kcG1fc2V0X3Bvd2VyX2dhdGUoJmFkZXYtPnNtdSwgYmxv
Y2tfdHlwZSwgZ2F0ZSk7CiAJCWVsc2UKLQkJCXJldCA9ICgoYWRldiktPnBvd2VycGxheS5wcF9m
dW5jcy0+c2V0X3Bvd2VyZ2F0aW5nX2J5X3NtdSgKLQkJCQkoYWRldiktPnBvd2VycGxheS5wcF9o
YW5kbGUsIGJsb2NrX3R5cGUsIGdhdGUpKTsKKwkJCWlmIChhZGV2LT5wb3dlcnBsYXkucHBfZnVu
Y3MgJiYgYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5zZXRfcG93ZXJnYXRpbmdfYnlfc211KQor
CQkJCXJldCA9ICgoYWRldiktPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X3Bvd2VyZ2F0aW5nX2J5
X3NtdSgKKwkJCQkJKGFkZXYpLT5wb3dlcnBsYXkucHBfaGFuZGxlLCBibG9ja190eXBlLCBnYXRl
KSk7CiAJCWJyZWFrOwotCWNhc2UgQU1EX0lQX0JMT0NLX1RZUEVfR01DOgogCWNhc2UgQU1EX0lQ
X0JMT0NLX1RZUEVfQUNQOgotCQlyZXQgPSAoKGFkZXYpLT5wb3dlcnBsYXkucHBfZnVuY3MtPnNl
dF9wb3dlcmdhdGluZ19ieV9zbXUoCisJCWlmIChhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MgJiYg
YWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5zZXRfcG93ZXJnYXRpbmdfYnlfc211KQorCQkJcmV0
ID0gKChhZGV2KS0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5zZXRfcG93ZXJnYXRpbmdfYnlfc211KAog
CQkJCShhZGV2KS0+cG93ZXJwbGF5LnBwX2hhbmRsZSwgYmxvY2tfdHlwZSwgZ2F0ZSkpOwogCQli
cmVhazsKIAlkZWZhdWx0OgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKaW5kZXgg
NDY3NDFiMzA0N2M1Li5lOGUxZTZlODZlNzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3Y5XzAuYwpAQCAtMTIwMiw2ICsxMjAyLDcgQEAgc3RhdGljIGludCBnbWNfdjlfMF9od19pbml0
KHZvaWQgKmhhbmRsZSkKIAogCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CiAJY2FzZSBDSElQ
X1JBVkVOOgorCWNhc2UgQ0hJUF9SRU5PSVI6CiAJCS8qIFRPRE8gZm9yIHJlbm9pciAqLwogCQlt
bWh1Yl92MV8wX3VwZGF0ZV9wb3dlcl9nYXRpbmcoYWRldiwgdHJ1ZSk7CiAJCWJyZWFrOwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jCmluZGV4IDY5NjVlMWU2ZmE5ZS4uMmMx
NWM1ZTkyYzM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92
MV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jCkBAIC0z
MDEsOCArMzAxLDcgQEAgdm9pZCBtbWh1Yl92MV8wX3VwZGF0ZV9wb3dlcl9nYXRpbmcoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCXJldHVybjsKIAogCWlmIChlbmFibGUgJiYgYWRldi0+
cGdfZmxhZ3MgJiBBTURfUEdfU1VQUE9SVF9NTUhVQikgewotCQlpZiAoYWRldi0+cG93ZXJwbGF5
LnBwX2Z1bmNzICYmIGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X3Bvd2VyZ2F0aW5nX2J5
X3NtdSkKLQkJCWFtZGdwdV9kcG1fc2V0X3Bvd2VyZ2F0aW5nX2J5X3NtdShhZGV2LCBBTURfSVBf
QkxPQ0tfVFlQRV9HTUMsIHRydWUpOworCQlhbWRncHVfZHBtX3NldF9wb3dlcmdhdGluZ19ieV9z
bXUoYWRldiwgQU1EX0lQX0JMT0NLX1RZUEVfR01DLCB0cnVlKTsKIAogCX0KIH0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IDM0ZTBiNDI3ODcxMC4uNmUxMzJmMzY4MTMwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTEyMzQsNyArMTIzNCw4IEBAIHN0YXRpYyBp
bnQgc29jMTVfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogCQkJCSBBTURfQ0dfU1VQ
UE9SVF9ERl9NR0NHOwogCQlhZGV2LT5wZ19mbGFncyA9IEFNRF9QR19TVVBQT1JUX1NETUEgfAog
CQkJCSBBTURfUEdfU1VQUE9SVF9WQ04gfAotCQkJCSBBTURfUEdfU1VQUE9SVF9WQ05fRFBHOwor
CQkJCSBBTURfUEdfU1VQUE9SVF9WQ05fRFBHIHwKKwkJCQkgQU1EX1BHX1NVUFBPUlRfTU1IVUI7
CiAJCWFkZXYtPmV4dGVybmFsX3Jldl9pZCA9IGFkZXYtPnJldl9pZCArIDB4OTE7CiAJCWJyZWFr
OwogCWRlZmF1bHQ6CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9h
bWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMK
aW5kZXggYzIxZmU3YWM1ZGY4Li4wMzBmYmUxOWI3YTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hbWRncHVfc211LmMKQEAgLTQxNSw2ICs0MTUsOSBAQCBpbnQgc211X2RwbV9z
ZXRfcG93ZXJfZ2F0ZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3QgYmxvY2tfdHlw
ZSwKIAljYXNlIEFNRF9JUF9CTE9DS19UWVBFX1NETUE6CiAJCXJldCA9IHNtdV9wb3dlcmdhdGVf
c2RtYShzbXUsIGdhdGUpOwogCQlicmVhazsKKwljYXNlIEFNRF9JUF9CTE9DS19UWVBFX0dNQzoK
KwkJcmV0ID0gc211X3Bvd2VyZ2F0ZV9tbWh1YihzbXUpOworCQlicmVhazsKIAlkZWZhdWx0Ogog
CQlicmVhazsKIAl9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9p
bmMvYW1kZ3B1X3NtdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdw
dV9zbXUuaAppbmRleCA4MTIwZTc1ODc1ODUuLjQ4ZWE3MDY4MjFmZCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCkBAIC01MzcsNiArNTM3LDcg
QEAgc3RydWN0IHBwdGFibGVfZnVuY3MgewogCWludCAoKnNldF9mYW5fc3BlZWRfcnBtKShzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3Qgc3BlZWQpOwogCWludCAoKnNldF94Z21pX3Bz
dGF0ZSkoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90IHBzdGF0ZSk7CiAJaW50ICgq
Z2Z4X29mZl9jb250cm9sKShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgYm9vbCBlbmFibGUpOwor
CWludCAoKnBvd2VyZ2F0ZV9tbWh1Yikoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOwogCWludCAo
KnJlZ2lzdGVyX2lycV9oYW5kbGVyKShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7CiAJaW50ICgq
c2V0X2F6YWxpYV9kM19wbWUpKHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsKIAlpbnQgKCpnZXRf
bWF4X3N1c3RhaW5hYmxlX2Nsb2Nrc19ieV9kYykoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHN0
cnVjdCBwcF9zbXVfbnZfY2xvY2tfdGFibGUgKm1heF9jbG9ja3MpOwpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTJfMC5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTJfMC5oCmluZGV4IDliOWY1ZGYwOTExYy4uNzM3
YTMxNTgzOThjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
c211X3YxMl8wLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92
MTJfMC5oCkBAIC02Niw2ICs2Niw4IEBAIGludCBzbXVfdjEyXzBfZ2Z4X29mZl9jb250cm9sKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LCBib29sIGVuYWJsZSk7CiAKIGludCBzbXVfdjEyXzBfaW5p
dF9zbWNfdGFibGVzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsKIAoraW50IHNtdV92MTJfMF9w
b3dlcmdhdGVfbW1odWIoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOworCiBpbnQgc211X3YxMl8w
X2Zpbmlfc21jX3RhYmxlcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7CiAKIGludCBzbXVfdjEy
XzBfcG9wdWxhdGVfc21jX3RhYmxlcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMKaW5kZXggMDRkYWY3ZTlmZTA1Li42
Nzc3NTliY2E5NTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jl
bm9pcl9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0
LmMKQEAgLTcwMiw2ICs3MDIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3Mg
cmVub2lyX3BwdF9mdW5jcyA9IHsKIAkucmVhZF9zbWNfYXJnID0gc211X3YxMl8wX3JlYWRfYXJn
LAogCS5zZXRfZ2Z4X2NncGcgPSBzbXVfdjEyXzBfc2V0X2dmeF9jZ3BnLAogCS5nZnhfb2ZmX2Nv
bnRyb2wgPSBzbXVfdjEyXzBfZ2Z4X29mZl9jb250cm9sLAorCS5wb3dlcmdhdGVfbW1odWIgPSBz
bXVfdjEyXzBfcG93ZXJnYXRlX21taHViLAogCS5pbml0X3NtY190YWJsZXMgPSBzbXVfdjEyXzBf
aW5pdF9zbWNfdGFibGVzLAogCS5maW5pX3NtY190YWJsZXMgPSBzbXVfdjEyXzBfZmluaV9zbWNf
dGFibGVzLAogCS5wb3B1bGF0ZV9zbWNfdGFibGVzID0gc211X3YxMl8wX3BvcHVsYXRlX3NtY190
YWJsZXMsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfaW50
ZXJuYWwuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV9pbnRlcm5hbC5oCmlu
ZGV4IDhiY2RhNzg3MTMwOS4uYjA2NzZmZmE4YmFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9zbXVfaW50ZXJuYWwuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9zbXVfaW50ZXJuYWwuaApAQCAtNjUsNiArNjUsOCBAQAogCSgoc211KS0+cHB0
X2Z1bmNzLT5ub3RpZnlfbWVtb3J5X3Bvb2xfbG9jYXRpb24gPyAoc211KS0+cHB0X2Z1bmNzLT5u
b3RpZnlfbWVtb3J5X3Bvb2xfbG9jYXRpb24oKHNtdSkpIDogMCkKICNkZWZpbmUgc211X2dmeF9v
ZmZfY29udHJvbChzbXUsIGVuYWJsZSkgXAogCSgoc211KS0+cHB0X2Z1bmNzLT5nZnhfb2ZmX2Nv
bnRyb2wgPyAoc211KS0+cHB0X2Z1bmNzLT5nZnhfb2ZmX2NvbnRyb2woKHNtdSksIChlbmFibGUp
KSA6IDApCisjZGVmaW5lIHNtdV9wb3dlcmdhdGVfbW1odWIoc211KSBcCisJKChzbXUpLT5wcHRf
ZnVuY3MtPnBvd2VyZ2F0ZV9tbWh1YiA/IChzbXUpLT5wcHRfZnVuY3MtPnBvd2VyZ2F0ZV9tbWh1
Yigoc211KSkgOiAwKQogCiAjZGVmaW5lIHNtdV9zZXRfbGFzdF9kY2VmX21pbl9kZWVwX3NsZWVw
X2NsayhzbXUpIFwKIAkoKHNtdSktPnBwdF9mdW5jcy0+c2V0X2xhc3RfZGNlZl9taW5fZGVlcF9z
bGVlcF9jbGsgPyAoc211KS0+cHB0X2Z1bmNzLT5zZXRfbGFzdF9kY2VmX21pbl9kZWVwX3NsZWVw
X2Nsaygoc211KSkgOiAwKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvc211X3YxMl8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjEyXzAu
YwppbmRleCAxMzlkZDczN2VhYTUuLjNjNjI4NmY5ZTJmMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMl8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211X3YxMl8wLmMKQEAgLTI4LDYgKzI4LDcgQEAKICNpbmNsdWRlICJhdG9t
ZmlybXdhcmUuaCIKICNpbmNsdWRlICJhbWRncHVfYXRvbWZpcm13YXJlLmgiCiAjaW5jbHVkZSAi
c211X3YxMl8wLmgiCisjaW5jbHVkZSAic211X3YxMl8wX3Bwc21jLmgiCiAjaW5jbHVkZSAic29j
MTVfY29tbW9uLmgiCiAjaW5jbHVkZSAiYXRvbS5oIgogCkBAIC0yNjEsNiArMjYyLDExIEBAIGlu
dCBzbXVfdjEyXzBfZ2Z4X29mZl9jb250cm9sKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBib29s
IGVuYWJsZSkKIAlyZXR1cm4gcmV0OwogfQogCitpbnQgc211X3YxMl8wX3Bvd2VyZ2F0ZV9tbWh1
YihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKK3sKKwlyZXR1cm4gc211X3NlbmRfc21jX21zZyhz
bXUsIFBQU01DX01TR19Qb3dlckdhdGVNbUh1Yik7Cit9CisKIGludCBzbXVfdjEyXzBfaW5pdF9z
bWNfdGFibGVzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogewogCXN0cnVjdCBzbXVfdGFibGVf
Y29udGV4dCAqc211X3RhYmxlID0gJnNtdS0+c211X3RhYmxlOwotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
