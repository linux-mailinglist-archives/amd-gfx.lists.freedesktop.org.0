Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE35433705
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 19:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B195892B7;
	Mon,  3 Jun 2019 17:44:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690040.outbound.protection.outlook.com [40.107.69.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1554892B7
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 17:44:44 +0000 (UTC)
Received: from BN6PR12CA0040.namprd12.prod.outlook.com (2603:10b6:405:70::26)
 by BN6PR1201MB0052.namprd12.prod.outlook.com (2603:10b6:405:53::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.20; Mon, 3 Jun
 2019 17:44:43 +0000
Received: from BY2NAM03FT037.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by BN6PR12CA0040.outlook.office365.com
 (2603:10b6:405:70::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.16 via Frontend
 Transport; Mon, 3 Jun 2019 17:44:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT037.mail.protection.outlook.com (10.152.84.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1943.19 via Frontend Transport; Mon, 3 Jun 2019 17:44:42 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 3 Jun 2019
 12:44:41 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/display: Add connector debugfs for "output_bpc"
Date: Mon, 3 Jun 2019 13:44:37 -0400
Message-ID: <20190603174437.23996-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39860400002)(376002)(346002)(2980300002)(428003)(189003)(199004)(336012)(81166006)(478600001)(4326008)(8936002)(186003)(72206003)(2616005)(2906002)(316002)(86362001)(26005)(14444005)(476003)(81156014)(426003)(16586007)(8676002)(126002)(77096007)(1076003)(54906003)(36756003)(2351001)(68736007)(50226002)(356004)(6666004)(53936002)(6916009)(51416003)(5660300002)(305945005)(53416004)(70586007)(70206006)(48376002)(7696005)(50466002)(47776003)(44832011)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0052; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe611864-1e5e-4555-a1a0-08d6e84b292b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN6PR1201MB0052; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0052:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0052C532680082C43BE48E4CEC140@BN6PR1201MB0052.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 0057EE387C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6iJnXxTNLsEBd5BjahVEUqX+xwd0grJa2KzOgb6aWrKQoekYolCc9hI52bPdRvNGeToeMzDt1hB8ra8HdZ9AuWhJZM32du0GXd7MRRxI3j0F4dEETyr0sJCMYyWKULWEjWr5gqLs0HKE9/49KHLI9tHos+M4RJSp0hZIK+NYt50dTqmQdfwPoesAoPDLHuboHerimV8l6Azszt6TagUImmeOvrPXezN1BvQmonWi5iqoficYXm35a9C9y5KI6WAB9el5xQe1Dy0IJEiHJiOFJc6J4IXvuzMW2q/bO6owU828YC9bP3SYrAyN8ITb4hRXcqMDvk8ejZBwuj1u9piBR6SkKQNicshfPqyuodsi/F+PqZN6SgZ4DwQPKjlw6s63PW35I3N49rMrNtd439134w5PA4A8T6J1EGxp8jSCq4s=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2019 17:44:42.8889 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe611864-1e5e-4555-a1a0-08d6e84b292b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0052
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hA2KHzP+KpIjIT67cZXQ1Ukf1AUdv77Jjd2oZbV4pPc=;
 b=cG1tp8/Fyy/KLXPDuzCZf5iEzXic6TYyncSQ/LSXYqCCLQn8RIFPFn7EzcL/bQm14aM2jdtVfSVzqMxhcZBEjJ6+WDhFew7kl+hN+jyK05PigkmelIPCmPofSqDJbApqc/h7zKxU17g2gtKHbXItGvtwMMMZPW6sTCAmg+vMay8=
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
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KVGhpcyB3aWxsIGJlIHVzZWZ1bCBmb3IgdmVyaWZ5aW5nIHdoZXRoZXIgd2UgZW50ZXIg
dGhlIGNvcnJlY3Qgb3V0cHV0CmNvbG9yIGRlcHRoIGZyb20gSUdULgoKW0hvd10KTG9ja3MgdGhl
IGNvbm5lY3RvciBhbmQgYXNzb2NpYXRlZCBDUlRDIGlmIGF2YWlsYWJsZSBhbmQgb3V0cHV0cwp0
aGUgY3VycmVudCBhbmQgbWF4aW11bSBvdXRwdXQgYnBjIHZhbHVlcy4KCkV4YW1wbGU6CgpjYXQg
L3N5cy9rZXJuZWwvZGVidWcvZHJpLzAvRFAtMS9vdXRwdXRfYnBjCkN1cnJlbnQ6IDgKTWF4aW11
bTogMTAKCnYyOiBEcm9wIHVubmVlZGVkIGNvbm5lY3RvciBzdGF0dXMgY2hlY2sKCkNjOiBMZW8g
TGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFu
ZEBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5r
YXpsYXVza2FzQGFtZC5jb20+Ci0tLQogLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1fZGVidWdmcy5jIHwgNzEgKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDY5
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jCmluZGV4IDFk
NWZjNWFkM2JlZS4uYTNlMzYyZmE2NzQ3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9kZWJ1Z2ZzLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jCkBAIC02NzIsNiAr
NjcyLDcxIEBAIHN0YXRpYyBzc2l6ZV90IGRwX3BoeV90ZXN0X3BhdHRlcm5fZGVidWdmc193cml0
ZShzdHJ1Y3QgZmlsZSAqZiwgY29uc3QgY2hhciBfX3VzCiAJcmV0dXJuIGJ5dGVzX2Zyb21fdXNl
cjsKIH0KIAorLyoKKyAqIFJldHVybnMgdGhlIGN1cnJlbnQgYW5kIG1heGltdW0gb3V0cHV0IGJw
YyBmb3IgdGhlIGNvbm5lY3Rvci4KKyAqIEV4YW1wbGUgdXNhZ2U6IGNhdCAvc3lzL2tlcm5lbC9k
ZWJ1Zy9kcmkvMC9EUC0xL291dHB1dF9icGMKKyAqLworc3RhdGljIGludCBvdXRwdXRfYnBjX3No
b3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRhKQoreworCXN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IgPSBtLT5wcml2YXRlOworCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBj
b25uZWN0b3ItPmRldjsKKwlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSBOVUxMOworCXN0cnVjdCBk
bV9jcnRjX3N0YXRlICpkbV9jcnRjX3N0YXRlID0gTlVMTDsKKwlpbnQgcmVzID0gLUVOT0RFVjsK
Kwl1bnNpZ25lZCBpbnQgYnBjOworCisJbXV0ZXhfbG9jaygmZGV2LT5tb2RlX2NvbmZpZy5tdXRl
eCk7CisJZHJtX21vZGVzZXRfbG9jaygmZGV2LT5tb2RlX2NvbmZpZy5jb25uZWN0aW9uX211dGV4
LCBOVUxMKTsKKworCWlmIChjb25uZWN0b3ItPnN0YXRlID09IE5VTEwpCisJCWdvdG8gdW5sb2Nr
OworCisJY3J0YyA9IGNvbm5lY3Rvci0+c3RhdGUtPmNydGM7CisJaWYgKGNydGMgPT0gTlVMTCkK
KwkJZ290byB1bmxvY2s7CisKKwlkcm1fbW9kZXNldF9sb2NrKCZjcnRjLT5tdXRleCwgTlVMTCk7
CisJaWYgKGNydGMtPnN0YXRlID09IE5VTEwpCisJCWdvdG8gdW5sb2NrOworCisJZG1fY3J0Y19z
dGF0ZSA9IHRvX2RtX2NydGNfc3RhdGUoY3J0Yy0+c3RhdGUpOworCWlmIChkbV9jcnRjX3N0YXRl
LT5zdHJlYW0gPT0gTlVMTCkKKwkJZ290byB1bmxvY2s7CisKKwlzd2l0Y2ggKGRtX2NydGNfc3Rh
dGUtPnN0cmVhbS0+dGltaW5nLmRpc3BsYXlfY29sb3JfZGVwdGgpIHsKKwljYXNlIENPTE9SX0RF
UFRIXzY2NjoKKwkJYnBjID0gNjsKKwkJYnJlYWs7CisJY2FzZSBDT0xPUl9ERVBUSF84ODg6CisJ
CWJwYyA9IDg7CisJCWJyZWFrOworCWNhc2UgQ09MT1JfREVQVEhfMTAxMDEwOgorCQlicGMgPSAx
MDsKKwkJYnJlYWs7CisJY2FzZSBDT0xPUl9ERVBUSF8xMjEyMTI6CisJCWJwYyA9IDEyOworCQli
cmVhazsKKwljYXNlIENPTE9SX0RFUFRIXzE2MTYxNjoKKwkJYnBjID0gMTY7CisJCWJyZWFrOwor
CWRlZmF1bHQ6CisJCWdvdG8gdW5sb2NrOworCX0KKworCXNlcV9wcmludGYobSwgIkN1cnJlbnQ6
ICV1XG4iLCBicGMpOworCXNlcV9wcmludGYobSwgIk1heGltdW06ICV1XG4iLCBjb25uZWN0b3It
PmRpc3BsYXlfaW5mby5icGMpOworCXJlcyA9IDA7CisKK3VubG9jazoKKwlpZiAoY3J0YykKKwkJ
ZHJtX21vZGVzZXRfdW5sb2NrKCZjcnRjLT5tdXRleCk7CisKKwlkcm1fbW9kZXNldF91bmxvY2so
JmRldi0+bW9kZV9jb25maWcuY29ubmVjdGlvbl9tdXRleCk7CisJbXV0ZXhfdW5sb2NrKCZkZXYt
Pm1vZGVfY29uZmlnLm11dGV4KTsKKworCXJldHVybiByZXM7Cit9CisKIC8qCiAgKiBSZXR1cm5z
IHRoZSBtaW4gYW5kIG1heCB2cnIgdmZyZXEgdGhyb3VnaCB0aGUgY29ubmVjdG9yJ3MgZGVidWdm
cyBmaWxlLgogICogRXhhbXBsZSB1c2FnZTogY2F0IC9zeXMva2VybmVsL2RlYnVnL2RyaS8wL0RQ
LTEvdnJyX3JhbmdlCkBAIC03MzAsOCArNzk1LDYgQEAgc3RhdGljIHNzaXplX3QgZHBfc2RwX21l
c3NhZ2VfZGVidWdmc193cml0ZShzdHJ1Y3QgZmlsZSAqZiwgY29uc3QgY2hhciBfX3VzZXIgKmIK
IAlyZXR1cm4gd3JpdGVfc2l6ZTsKIH0KIAotREVGSU5FX1NIT1dfQVRUUklCVVRFKHZycl9yYW5n
ZSk7Ci0KIHN0YXRpYyBzc2l6ZV90IGRwX2RwY2RfYWRkcmVzc193cml0ZShzdHJ1Y3QgZmlsZSAq
ZiwgY29uc3QgY2hhciBfX3VzZXIgKmJ1ZiwKIAkJCQkgc2l6ZV90IHNpemUsIGxvZmZfdCAqcG9z
KQogewpAQCAtODE0LDYgKzg3Nyw5IEBAIHN0YXRpYyBzc2l6ZV90IGRwX2RwY2RfZGF0YV9yZWFk
KHN0cnVjdCBmaWxlICpmLCBjaGFyIF9fdXNlciAqYnVmLAogCXJldHVybiByZWFkX3NpemUgLSBy
OwogfQogCitERUZJTkVfU0hPV19BVFRSSUJVVEUob3V0cHV0X2JwYyk7CitERUZJTkVfU0hPV19B
VFRSSUJVVEUodnJyX3JhbmdlKTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlv
bnMgZHBfbGlua19zZXR0aW5nc19kZWJ1Z2ZzX2ZvcHMgPSB7CiAJLm93bmVyID0gVEhJU19NT0RV
TEUsCiAJLnJlYWQgPSBkcF9saW5rX3NldHRpbmdzX3JlYWQsCkBAIC04NjYsNiArOTMyLDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCB7CiAJCXsibGlua19zZXR0aW5ncyIsICZkcF9saW5rX3NldHRp
bmdzX2RlYnVnZnNfZm9wc30sCiAJCXsicGh5X3NldHRpbmdzIiwgJmRwX3BoeV9zZXR0aW5nc19k
ZWJ1Z2ZzX2ZvcH0sCiAJCXsidGVzdF9wYXR0ZXJuIiwgJmRwX3BoeV90ZXN0X3BhdHRlcm5fZm9w
c30sCisJCXsib3V0cHV0X2JwYyIsICZvdXRwdXRfYnBjX2ZvcHN9LAogCQl7InZycl9yYW5nZSIs
ICZ2cnJfcmFuZ2VfZm9wc30sCiAJCXsic2RwX21lc3NhZ2UiLCAmc2RwX21lc3NhZ2VfZm9wc30s
CiAJCXsiYXV4X2RwY2RfYWRkcmVzcyIsICZkcF9kcGNkX2FkZHJlc3NfZGVidWdmc19mb3BzfSwK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
