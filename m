Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8F235031
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 21:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2762B89BA1;
	Tue,  4 Jun 2019 19:21:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810071.outbound.protection.outlook.com [40.107.81.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3594B89BA1
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 19:21:28 +0000 (UTC)
Received: from MWHPR12CA0029.namprd12.prod.outlook.com (2603:10b6:301:2::15)
 by CY4PR1201MB0054.namprd12.prod.outlook.com (2603:10b6:910:1a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Tue, 4 Jun
 2019 19:21:26 +0000
Received: from BY2NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by MWHPR12CA0029.outlook.office365.com
 (2603:10b6:301:2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.17 via Frontend
 Transport; Tue, 4 Jun 2019 19:21:26 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT003.mail.protection.outlook.com (10.152.84.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1943.19 via Frontend Transport; Tue, 4 Jun 2019 19:21:26 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 4 Jun 2019
 14:21:25 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Always allocate initial connector state state
Date: Tue, 4 Jun 2019 15:21:14 -0400
Message-ID: <20190604192114.20995-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39860400002)(396003)(136003)(2980300002)(428003)(189003)(199004)(4326008)(47776003)(2351001)(86362001)(48376002)(72206003)(50466002)(53416004)(70206006)(70586007)(53936002)(356004)(6666004)(5660300002)(478600001)(16586007)(476003)(77096007)(186003)(44832011)(81156014)(8676002)(305945005)(2906002)(50226002)(51416003)(7696005)(68736007)(316002)(54906003)(6916009)(5024004)(36756003)(2616005)(14444005)(1076003)(486006)(126002)(426003)(26005)(8936002)(336012)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0054; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d4c62c6-2224-434b-e624-08d6e921d69c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR1201MB0054; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0054:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0054523F8E7F04CCAFFAEB89EC150@CY4PR1201MB0054.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0058ABBBC7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: D9PkERo+G0aDnAJEWXYmpiP3KhC3Cy9eR8nfzoJyyv4kZWFk2Na4dZW9mY7VvJY+CKOeiuu/FXwp8KCEoI3NpWpqTmSdN4AhxpxqZWdUHDyDvYM4pKLwPKD3bNVy/dZ4c+t7eivnEoPV2plZIzxmB/rdNtuWKzLsRPTUpR94Ek4BxZZlunjh9Y8TcFGDTRnFg4GnEpg7Q5m/VciB6Ed0JwCiwmia9CqD14eXIkRCSwN9r0TR5J4ed5eNcyMW8RZacNJ27Sb4wmyqbCywz6YR6yNyde9BFJEb2RfnT+MpSBrRzrh36s7HPxIk6KLCgAM79WnGUp1nH5sKyHPh7tbc7vXCtvnybk0I9XZmRH/iklIESQX0/sSoBv3o93YohMebkGGSzYKskqUKmI/5ODTYXRE0LhNY6/hmnvRnNBghTN4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2019 19:21:26.1144 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4c62c6-2224-434b-e624-08d6e921d69c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0054
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1hl8Sg2gnz7nFwq1J7pl5vrVOBFlk92JtnftSRJEBI=;
 b=jYktp3jNRJjMfUBrhBtmEOPKbWLX/njoQdScOFARYR4MNk+cqrah8fc6/0Aq3DvkNeqaJ6tZNu/tSmyCbvIUvrY70Uz22v9D5gyCWsg29Zbwlc7i8vlGwRwArQyxdobXfdu65LmOaHW+zYxT2nEyc+qw8FB8gUw0DLBgMMh0CUg=
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
Cc: Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Roman Li <roman.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KVW5saWtlIG91ciByZWd1bGFyIGNvbm5lY3RvcnMsIE1TVCBjb25uZWN0b3JzIGRvbid0
IHN0YXJ0IG9mZiB3aXRoCmFuIGluaXRpYWwgY29ubmVjdG9yIHN0YXRlLiBUaGlzIGNhdXNlcyBh
IE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSB0bwpvY2N1ciB3aGVuIGF0dGFjaGluZyB0aGUgYnBj
IHByb3BlcnR5IHNpbmNlIGl0IHRyaWVzIHRvIG1vZGlmeSB0aGUKY29ubmVjdG9yIHN0YXRlLgoK
V2UgbmVlZCBhbiBpbml0aWFsIGNvbm5lY3RvciBzdGF0ZSBvbiB0aGUgY29ubmVjdG9yIHRvIGF2
b2lkIHRoZSBjcmFzaC4KCltIb3ddClVzZSBvdXIgcmVzZXQgaGVscGVyIHRvIGFsbG9jYXRlIGFu
IGluaXRpYWwgc3RhdGUgYW5kIHJlc2V0IHRoZSB2YWx1ZXMKdG8gdGhlaXIgZGVmYXVsdHMuIFdl
IHdlcmUgYWxyZWFkeSBkb2luZyB0aGlzIGJlZm9yZSwganVzdCBub3QgZm9yCk1TVCBjb25uZWN0
b3JzLgoKQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogUm9tYW4gTGkgPHJvbWFu
LmxpQGFtZC5jb20+CkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0Bh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgfCAxMCArKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jCmluZGV4IGE2OThjOGYyNzJlZC4uNDUyM2FiMTAwYmMzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAg
LTQ3NDMsNiArNDc0MywxMyBAQCB2b2lkIGFtZGdwdV9kbV9jb25uZWN0b3JfaW5pdF9oZWxwZXIo
c3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtLAogewogCXN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2ID0gZG0tPmRkZXYtPmRldl9wcml2YXRlOwogCisJLyoKKwkgKiBTb21lIG9mIHRo
ZSBwcm9wZXJ0aWVzIGJlbG93IHJlcXVpcmUgYWNjZXNzIHRvIHN0YXRlLCBsaWtlIGJwYy4KKwkg
KiBBbGxvY2F0ZSBzb21lIGRlZmF1bHQgaW5pdGlhbCBjb25uZWN0b3Igc3RhdGUgd2l0aCBvdXIg
cmVzZXQgaGVscGVyLgorCSAqLworCWlmIChhY29ubmVjdG9yLT5iYXNlLmZ1bmNzLT5yZXNldCkK
KwkJYWNvbm5lY3Rvci0+YmFzZS5mdW5jcy0+cmVzZXQoJmFjb25uZWN0b3ItPmJhc2UpOworCiAJ
YWNvbm5lY3Rvci0+Y29ubmVjdG9yX2lkID0gbGlua19pbmRleDsKIAlhY29ubmVjdG9yLT5kY19s
aW5rID0gbGluazsKIAlhY29ubmVjdG9yLT5iYXNlLmludGVybGFjZV9hbGxvd2VkID0gZmFsc2U7
CkBAIC00OTMyLDkgKzQ5MzksNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9jb25uZWN0b3JfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0sCiAJCQkmYWNvbm5lY3Rvci0+YmFz
ZSwKIAkJCSZhbWRncHVfZG1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7CiAKLQlpZiAoYWNvbm5l
Y3Rvci0+YmFzZS5mdW5jcy0+cmVzZXQpCi0JCWFjb25uZWN0b3ItPmJhc2UuZnVuY3MtPnJlc2V0
KCZhY29ubmVjdG9yLT5iYXNlKTsKLQogCWFtZGdwdV9kbV9jb25uZWN0b3JfaW5pdF9oZWxwZXIo
CiAJCWRtLAogCQlhY29ubmVjdG9yLAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
