Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 694756FB49
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 10:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF4E89A83;
	Mon, 22 Jul 2019 08:28:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800075.outbound.protection.outlook.com [40.107.80.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE1489A83
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 08:28:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9+rbKptIxlNPrPEVXQr7x95OtVhDnAd8mrpNt06GQk4YujY05ys3YONDbxAKYd4kn2ypNitHKu7jIu3HAVQ/gq9Hthmtkt7zCtwvK8DRGU1IvR6/1UPfYtAUCodAoEJL1zYYsSs//XhA8ws6uYWrlxBXRJo6QL/OIwu3XufcIDUSRuHuvF949KNHpbP8q88G4krpV+eKUmNOtSQtrC/zMdnTDOi9MJY4eZ1cd3H4aoLwf7Q+Fr2Iitzmzct70gA6xQhRnhz27pAoqjZsN+9EOPmrW08pj6CEEUjitJcNcTezicHwYspkz1s9akdhX6343FJMA+l8Li9Ss8xrDcxRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQCiAlhMpQQdQR1jpW5VDKkngIULTKR5lSoK3kT5/eM=;
 b=TWw/P2GoUzcNRVJ2NmmPIHi4OuLF6nqxBSgLqIO5jW9tgcc7pPjSD+iK7Picv7TGJGFgbAcFLWaow1t2C7MTDkgeo+dY4weivBHVkLL1UhxLWTt4C/nS2NDgPQUce8UYWr46Tr5ddoZ/Y6Db01CKaCIRfgyTIfaqHKaVLYIPWLrnLrvgNau9hJg3T1g8nC9jecA26BYSvqKkv4ZEkRkN09/TeW5070DmGo1WbpWgWySxc/ccWno00JJaoq0OoNjIudJpqd3WEYi82mS/PNMbJMSgNhFutdWKykz4n/dW3NuOjEsWIfdptWTBQ59KMS2B+Fc7cCJIew+65VzIwokwxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0072.namprd12.prod.outlook.com (2603:10b6:3:103::34)
 by MWHPR1201MB2494.namprd12.prod.outlook.com (2603:10b6:300:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Mon, 22 Jul
 2019 08:27:59 +0000
Received: from DM3NAM03FT054.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by DM5PR12CA0072.outlook.office365.com
 (2603:10b6:3:103::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16 via Frontend
 Transport; Mon, 22 Jul 2019 08:27:59 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT054.mail.protection.outlook.com (10.152.83.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 22 Jul 2019 08:27:58 +0000
Received: from localhost.localdomain (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 22 Jul 2019
 03:27:56 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH libdrm 1/1 v2] tests/amdgpu: divide dispatch test into compute
 and gfx
Date: Mon, 22 Jul 2019 16:27:51 +0800
Message-ID: <1563784071-764-1-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39850400004)(2980300002)(428003)(199004)(189003)(486006)(44832011)(51416003)(6916009)(36756003)(336012)(70206006)(70586007)(478600001)(6666004)(356004)(47776003)(68736007)(86362001)(26005)(50226002)(2351001)(4326008)(305945005)(53936002)(81156014)(81166006)(2906002)(50466002)(54906003)(316002)(16586007)(126002)(476003)(2616005)(186003)(8676002)(49486002)(8936002)(48376002)(426003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB2494; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73c608fa-46e6-4642-d8ee-08d70e7e80f7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR1201MB2494; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2494:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB249485725EFB45A0E84169F7F6C40@MWHPR1201MB2494.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 01068D0A20
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Rc/bkqaHDayHT41WohRKtqKzxb9uyYmiKYUvFAxIA9wXRb3wyJTDmSsDr+PLjaf85HPONohydFcPjtYVvlAmc59X6a92gZixnmu+YsYqydZUQB3LdI32tGOGCHIays/PwPUq3mGWyLdas97NxvNvpmC1XSx2uapTbL+4tzSBVGwAFJ3kwAKI711RDHbQsrAF3kg0Ql/Ji7E/6BE2enfhHlr/HrnnUYHN1eyPHFC1iG/KJ6TB3nF5N3hICtwtm52whftv3BQYdKN1fVJ/cDtDtSRHbOvNDn9KpKqu7RkxdtrNCErZ/Tz7B3O6RbI+IHU4w4qj7movmyZqRIEduacRogr7vfZVSp/1lkqNBp+5Ykn8PzMMIvpApa9R11x4gp7ZPvSMj5ozipqGigWAQm+rBYYTQy0OYCgxonrK0DM7pts=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2019 08:27:58.4639 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c608fa-46e6-4642-d8ee-08d70e7e80f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2494
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQCiAlhMpQQdQR1jpW5VDKkngIULTKR5lSoK3kT5/eM=;
 b=Byc7YXLxKMofja84PVldnx1GKQ41+5nqaaH2LRFQu34+J2qh2/UxylsV1V6kqthjxTim06fNGqCPQxbJW27bPUMdM500dlKC6HcF4tJOKft/eawsQXIDbAHRVPD93SPehmQI/rEmkqG3SuUBeFKjyg6qCWVFIuMW/OByslB0geU=
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
Cc: Le Ma <le.ma@amd.com>, flora.cui@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Zm9yIGJldHRlciBjbGFyaWZpY2F0aW9uCgp2MjogYWNjb3JkaW5nbHkgY2hhbmdlIGRpc3BhdGNo
X3Rlc3QgY2FsbGVyIGluIGdwdV9yZXNldCB0ZXN0CgpDaGFuZ2UtSWQ6IEkyNDVkNzYwZDVmOWQ2
NGViMTBiMTM3ZDVjZTM3NWVmNTJhNGQ4NzNhClNpZ25lZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBh
bWQuY29tPgpSZXZpZXdlZC1ieTogRmxvcmEgQ3VpIDxmbG9yYS5jdWlAYW1kLmNvbT4KLS0tCiB0
ZXN0cy9hbWRncHUvYmFzaWNfdGVzdHMuYyB8IDE5ICsrKysrKysrKysrKysrKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3Rlc3RzL2FtZGdwdS9iYXNpY190ZXN0cy5jIGIvdGVzdHMvYW1kZ3B1L2Jhc2ljX3Rlc3RzLmMK
aW5kZXggOTM4MTA2ZS4uYWIyYTY3MiAxMDA2NDQKLS0tIGEvdGVzdHMvYW1kZ3B1L2Jhc2ljX3Rl
c3RzLmMKKysrIGIvdGVzdHMvYW1kZ3B1L2Jhc2ljX3Rlc3RzLmMKQEAgLTU1LDcgKzU1LDggQEAg
c3RhdGljIHZvaWQgYW1kZ3B1X3VzZXJwdHJfdGVzdCh2b2lkKTsKIHN0YXRpYyB2b2lkIGFtZGdw
dV9zZW1hcGhvcmVfdGVzdCh2b2lkKTsKIHN0YXRpYyB2b2lkIGFtZGdwdV9zeW5jX2RlcGVuZGVu
Y3lfdGVzdCh2b2lkKTsKIHN0YXRpYyB2b2lkIGFtZGdwdV9ib19ldmljdGlvbl90ZXN0KHZvaWQp
Owotc3RhdGljIHZvaWQgYW1kZ3B1X2Rpc3BhdGNoX3Rlc3Qodm9pZCk7CitzdGF0aWMgdm9pZCBh
bWRncHVfY29tcHV0ZV9kaXNwYXRjaF90ZXN0KHZvaWQpOworc3RhdGljIHZvaWQgYW1kZ3B1X2dm
eF9kaXNwYXRjaF90ZXN0KHZvaWQpOwogc3RhdGljIHZvaWQgYW1kZ3B1X2RyYXdfdGVzdCh2b2lk
KTsKIHN0YXRpYyB2b2lkIGFtZGdwdV9ncHVfcmVzZXRfdGVzdCh2b2lkKTsKIApAQCAtNzksNyAr
ODAsOCBAQCBDVV9UZXN0SW5mbyBiYXNpY190ZXN0c1tdID0gewogCXsgIkNvbW1hbmQgc3VibWlz
c2lvbiBUZXN0IChTRE1BKSIsIGFtZGdwdV9jb21tYW5kX3N1Ym1pc3Npb25fc2RtYSB9LAogCXsg
IlNXIHNlbWFwaG9yZSBUZXN0IiwgIGFtZGdwdV9zZW1hcGhvcmVfdGVzdCB9LAogCXsgIlN5bmMg
ZGVwZW5kZW5jeSBUZXN0IiwgIGFtZGdwdV9zeW5jX2RlcGVuZGVuY3lfdGVzdCB9LAotCXsgIkRp
c3BhdGNoIFRlc3QiLCAgYW1kZ3B1X2Rpc3BhdGNoX3Rlc3QgfSwKKwl7ICJEaXNwYXRjaCBUZXN0
IChDb21wdXRlKSIsICBhbWRncHVfY29tcHV0ZV9kaXNwYXRjaF90ZXN0IH0sCisJeyAiRGlzcGF0
Y2ggVGVzdCAoR0ZYKSIsICBhbWRncHVfZ2Z4X2Rpc3BhdGNoX3Rlc3QgfSwKIAl7ICJEcmF3IFRl
c3QiLCAgYW1kZ3B1X2RyYXdfdGVzdCB9LAogCXsgIkdQVSByZXNldCBUZXN0IiwgYW1kZ3B1X2dw
dV9yZXNldF90ZXN0IH0sCiAJQ1VfVEVTVF9JTkZPX05VTEwsCkBAIC0yNDQ4LDcgKzI0NTAsOCBA
QCBzdGF0aWMgdm9pZCBhbWRncHVfbWVtY3B5X2Rpc3BhdGNoX3Rlc3QoYW1kZ3B1X2RldmljZV9o
YW5kbGUgZGV2aWNlX2hhbmRsZSwKIAlyID0gYW1kZ3B1X2NzX2N0eF9mcmVlKGNvbnRleHRfaGFu
ZGxlKTsKIAlDVV9BU1NFUlRfRVFVQUwociwgMCk7CiB9Ci1zdGF0aWMgdm9pZCBhbWRncHVfZGlz
cGF0Y2hfdGVzdCh2b2lkKQorCitzdGF0aWMgdm9pZCBhbWRncHVfY29tcHV0ZV9kaXNwYXRjaF90
ZXN0KHZvaWQpCiB7CiAJaW50IHI7CiAJc3RydWN0IGRybV9hbWRncHVfaW5mb19od19pcCBpbmZv
OwpAQCAtMjQ2Myw2ICsyNDY2LDEzIEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kaXNwYXRjaF90ZXN0
KHZvaWQpCiAJCWFtZGdwdV9tZW1zZXRfZGlzcGF0Y2hfdGVzdChkZXZpY2VfaGFuZGxlLCBBTURH
UFVfSFdfSVBfQ09NUFVURSwgcmluZ19pZCk7CiAJCWFtZGdwdV9tZW1jcHlfZGlzcGF0Y2hfdGVz
dChkZXZpY2VfaGFuZGxlLCBBTURHUFVfSFdfSVBfQ09NUFVURSwgcmluZ19pZCk7CiAJfQorfQor
CitzdGF0aWMgdm9pZCBhbWRncHVfZ2Z4X2Rpc3BhdGNoX3Rlc3Qodm9pZCkKK3sKKwlpbnQgcjsK
KwlzdHJ1Y3QgZHJtX2FtZGdwdV9pbmZvX2h3X2lwIGluZm87CisJdWludDMyX3QgcmluZ19pZDsK
IAogCXIgPSBhbWRncHVfcXVlcnlfaHdfaXBfaW5mbyhkZXZpY2VfaGFuZGxlLCBBTURHUFVfSFdf
SVBfR0ZYLCAwLCAmaW5mbyk7CiAJQ1VfQVNTRVJUX0VRVUFMKHIsIDApOwpAQCAtMzE3MCw1ICsz
MTgwLDYgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2dwdV9yZXNldF90ZXN0KHZvaWQpCiAJciA9IGFt
ZGdwdV9jc19jdHhfZnJlZShjb250ZXh0X2hhbmRsZSk7CiAJQ1VfQVNTRVJUX0VRVUFMKHIsIDAp
OwogCi0JYW1kZ3B1X2Rpc3BhdGNoX3Rlc3QoKTsKKwlhbWRncHVfY29tcHV0ZV9kaXNwYXRjaF90
ZXN0KCk7CisJYW1kZ3B1X2dmeF9kaXNwYXRjaF90ZXN0KCk7CiB9Ci0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
