Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6345BA1B73
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 15:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD43A6E0C3;
	Thu, 29 Aug 2019 13:30:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810048.outbound.protection.outlook.com [40.107.81.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284536E0C3
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 13:30:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0Zt5EPmNElCk2SFv3HSEjg8/OJwK5VeyHcRUN+GZKY1RmVEKuIfFwkz6uXLURLO1GDe39yCu4k/tyj3ldx+OcnJ+v/z9ZKHXySQad0QeqY3GIyr7TM/5Y+0yzDNMsfNnCyp5t8ZjpHlz10cWqsvjxV4Oyn/t2F+jMxLF9oliQiKj9Qyl79p9kwxbQ6+uIj8lL+vmXDCiaQOPN0DR8LQEA9x+8eKvMlQQSykEs8+KbFzW8hbxHDbZ0W1cID9lLCCYnMci04pUu+tZM2kaSypoh3/kkFPdojXrWz5wgGJEGnYi7cCapN4Z06+6U/ZtY5QJEArRiIzfBWM/b7VMFkecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUpKqUAo9sF5aoOBK4fj251ZqT2pYwfH2AIo3R8/dbw=;
 b=cm963o0vJZfLt3XX8HCN3MGxdat9ZvX2dLNWuyA9YqAHXXmMPGmk1KukSDcMtJ6U39AoLnAzNyvY5woqMg7yy67x+TXjsp5DBc++iItvymVdYOc1kxnZYMaIeOxfrXT+A/vr9fW7Bcazh0n5MRI6hZqeP6094O7Z9vdCTqzK92uiuTPDQVgJ5nTgNXMNblMN90er55kITwzKGqIhsgGAibOlu4qf1xdKU4virMONUzNMxJe7fOFVxsHlRs3c2GU0mgGyp1iNTNN8HyXhk5+6BjRQwDrimstqKwzP4B976XO1TPNPcQEAMjrJ5t1x+NzjtK4tTmmdvTneC30p9oAhLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0102.namprd12.prod.outlook.com (2603:10b6:802:21::37)
 by DM5PR12MB1276.namprd12.prod.outlook.com (2603:10b6:3:79::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18; Thu, 29 Aug
 2019 13:30:42 +0000
Received: from BY2NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by SN1PR12CA0102.outlook.office365.com
 (2603:10b6:802:21::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16 via Frontend
 Transport; Thu, 29 Aug 2019 13:30:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT052.mail.protection.outlook.com (10.152.85.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 13:30:41 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 29 Aug 2019 08:30:41 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Tao Zhou <tao.zhou1@amd.com>, Guchun Chen <guchun.chen@amd.com>
Subject: [PATCH 1/7] drm/amdgpu: add helper function to do common
 ras_late_init/fini (v3)
Date: Thu, 29 Aug 2019 21:30:26 +0800
Message-ID: <1567085432-27452-1-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(70206006)(70586007)(36756003)(2906002)(8936002)(110136005)(16586007)(53416004)(51416003)(7696005)(53936002)(86362001)(316002)(4326008)(478600001)(8676002)(81156014)(81166006)(50226002)(47776003)(356004)(48376002)(5660300002)(305945005)(186003)(476003)(6636002)(26005)(126002)(50466002)(2616005)(14444005)(486006)(6666004)(426003)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5735cc8-b253-4681-9900-08d72c8516c0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR12MB1276; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:
X-Microsoft-Antispam-PRVS: <DM5PR12MB127625E1FBB626A2D373240CFCA20@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: hcJC1HqF4zT+/qk9Neb1kkVKPZjjeYtSsrNdQNDrEtaY+WDoGpJWUqQEsn18s6lMkLomyJznI69XsN2zxmT8Aghu7rZdnKvZxjQ3+tcUNis/hyTvin3VwtF6eb/9OnouY7GtYgv5Tbukwx8xtmnvlT9St4nPtj9N6fX0wP2TO1j9YRLes0xapH77e1wByE3n7VIGDIBwQ+E96KOlAgAy7c/fi9vvJza1UnhKsGH9e6uE+CRk9DX3g17nhH5qISnqGjZX38fayujIH1lflBKnFCdGuSJbz1Z9hf7ySoNMVTHszjyErBycN/FPvDZtTHlarw5b7IBzmKYgcFS95vOafVsGvdWQ1Bmzcs2+OwpGDUo98xEHEoH0KU8YdANPNHOl/SZFLrJfrmc1sUamsRuYGTbLKD6mTkoLhIZEXxT1RjU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 13:30:41.8706 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5735cc8-b253-4681-9900-08d72c8516c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUpKqUAo9sF5aoOBK4fj251ZqT2pYwfH2AIo3R8/dbw=;
 b=mdamCVJKETSg/dobG9KSCQ+KxG536ypFW4VJTxAOMB8wBHckKzle/InuLWfjfRZ2AjNnma+WngXtDqCYibLq6QTpud3211j6i50+sW9jnVI1nYVFHs5o2Arx7slTBtvw4AWqcW/xb07JFbbvW8FThBF0Ih5J1qs1fpDG8ESXeqo=
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

SW4gbGF0ZV9pbml0IGZvciByYXMsIHRoZSBoZWxwZXIgZnVuY3Rpb24gd2lsbCBiZSB1c2VkIHRv
CjEpLiBkaXNhYmxlIHJhcyBmZWF0dXJlIGlmIHRoZSBJUCBibG9jayBpcyBtYXNrZWQgYXMgZGlz
YWJsZWQKMikuIHNlbmQgZW5hYmxlIGZlYXR1cmUgY29tbWFuZCBpZiB0aGUgaXAgYmxvY2sgd2Fz
IG1hc2tlZCBhcyBlbmFibGVkCjMpLiBjcmVhdGUgZGVidWdmcy9zeXNmcyBub2RlIHBlciBJUCBi
bG9jawo0KS4gcmVnaXN0ZXIgaW50ZXJydXB0IGhhbmRsZXIKCnYyOiBjaGVjayBpaF9pbmZvLmNi
IHRvIGRlY2lkZSBhZGQgaW50ZXJydXB0IGhhbmRsZXIgb3Igbm90Cgp2MzogYWRkIHJhc19sYXRl
X2ZpbmkgZm9yIGNsZWFudXAgYWxsIHRoZSByYXMgZnMgbm9kZSBhbmQgcmVtb3ZlCmludGVycnVw
dCBoYW5kbGVyCgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgNzIg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcmFzLmggfCAgNyArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDc5IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKaW5kZXggMjMwZjdl
Ni4uMmI5MzBmYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Jhcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwpAQCAt
MTU2NCw2ICsxNTY0LDc4IEBAIGludCBhbWRncHVfcmFzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCiAJcmV0dXJuIC1FSU5WQUw7CiB9CiAKKy8qIGhlbHBlciBmdW5jdGlvbiB0byBo
YW5kbGUgY29tbW9uIHN0dWZmIGluIGlwIGxhdGUgaW5pdCBwaGFzZSAqLworaW50IGFtZGdwdV9y
YXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJIHN0cnVjdCByYXNf
Y29tbW9uX2lmICpyYXNfYmxvY2ssCisJCQkgc3RydWN0IHJhc19mc19pZiAqZnNfaW5mbywKKwkJ
CSBzdHJ1Y3QgcmFzX2loX2lmICppaF9pbmZvKQoreworCWludCByOworCisJLyogZGlzYWJsZSBS
QVMgZmVhdHVyZSBwZXIgSVAgYmxvY2sgaWYgaXQgaXMgbm90IHN1cHBvcnRlZCAqLworCWlmICgh
YW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgcmFzX2Jsb2NrLT5ibG9jaykpIHsKKwkJYW1k
Z3B1X3Jhc19mZWF0dXJlX2VuYWJsZV9vbl9ib290KGFkZXYsIHJhc19ibG9jaywgMCk7CisJCXJl
dHVybiAwOworCX0KKworCXIgPSBhbWRncHVfcmFzX2ZlYXR1cmVfZW5hYmxlX29uX2Jvb3QoYWRl
diwgcmFzX2Jsb2NrLCAxKTsKKwlpZiAocikgeworCQlpZiAociA9PSAtRUFHQUlOKSB7CisJCQkv
KiByZXF1ZXN0IGdwdSByZXNldC4gd2lsbCBydW4gYWdhaW4gKi8KKwkJCWFtZGdwdV9yYXNfcmVx
dWVzdF9yZXNldF9vbl9ib290KGFkZXYsCisJCQkJCXJhc19ibG9jay0+YmxvY2spOworCQkJcmV0
dXJuIDA7CisJCX0gZWxzZSBpZiAoYWRldi0+aW5fc3VzcGVuZCB8fCBhZGV2LT5pbl9ncHVfcmVz
ZXQpIHsKKwkJCS8qIGluIHJlc3VtZSBwaGFzZSwgaWYgZmFpbCB0byBlbmFibGUgcmFzLAorCQkJ
ICogY2xlYW4gdXAgYWxsIHJhcyBmcyBub2RlcywgYW5kIGRpc2FibGUgcmFzICovCisJCQlnb3Rv
IGNsZWFudXA7CisJCX0gZWxzZQorCQkJcmV0dXJuIHI7CisJfQorCisJLyogaW4gcmVzdW1lIHBo
YXNlLCBubyBuZWVkIHRvIGNyZWF0ZSByYXMgZnMgbm9kZSAqLworCWlmIChhZGV2LT5pbl9zdXNw
ZW5kIHx8IGFkZXYtPmluX2dwdV9yZXNldCkKKwkJcmV0dXJuIDA7CisKKwlpZihpaF9pbmZvLT5j
YikgeworCQlyID0gYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfYWRkX2hhbmRsZXIoYWRldiwgaWhfaW5m
byk7CisJCWlmIChyKQorCQkJZ290byBpbnRlcnJ1cHQ7CisJfQorCisJYW1kZ3B1X3Jhc19kZWJ1
Z2ZzX2NyZWF0ZShhZGV2LCBmc19pbmZvKTsKKworCXIgPSBhbWRncHVfcmFzX3N5c2ZzX2NyZWF0
ZShhZGV2LCBmc19pbmZvKTsKKwlpZiAocikKKwkJZ290byBzeXNmczsKKworCXJldHVybiAwOwor
Y2xlYW51cDoKKwlhbWRncHVfcmFzX3N5c2ZzX3JlbW92ZShhZGV2LCByYXNfYmxvY2spOworc3lz
ZnM6CisJYW1kZ3B1X3Jhc19kZWJ1Z2ZzX3JlbW92ZShhZGV2LCByYXNfYmxvY2spOworCWlmIChp
aF9pbmZvLT5jYikKKwkJYW1kZ3B1X3Jhc19pbnRlcnJ1cHRfcmVtb3ZlX2hhbmRsZXIoYWRldiwg
aWhfaW5mbyk7CitpbnRlcnJ1cHQ6CisJYW1kZ3B1X3Jhc19mZWF0dXJlX2VuYWJsZShhZGV2LCBy
YXNfYmxvY2ssIDApOworCXJldHVybiByOworfQorCisvKiBoZWxwZXIgZnVuY3Rpb24gdG8gcmVt
b3ZlIHJhcyBmcyBub2RlIGFuZCBpbnRlcnJ1cHQgaGFuZGxlciAqLwordm9pZCBhbWRncHVfcmFz
X2xhdGVfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCSAgc3RydWN0IHJhc19j
b21tb25faWYgKnJhc19ibG9jaywKKwkJCSAgc3RydWN0IHJhc19paF9pZiAqaWhfaW5mbykKK3sK
KwlpZiAoIXJhc19ibG9jayB8fCAhaWhfaW5mbykKKwkJcmV0dXJuOworCisJYW1kZ3B1X3Jhc19z
eXNmc19yZW1vdmUoYWRldiwgcmFzX2Jsb2NrKTsKKwlhbWRncHVfcmFzX2RlYnVnZnNfcmVtb3Zl
KGFkZXYsIHJhc19ibG9jayk7CisJaWYgKGloX2luZm8tPmNiKQorICAgICAgICAgICAgICAgIGFt
ZGdwdV9yYXNfaW50ZXJydXB0X3JlbW92ZV9oYW5kbGVyKGFkZXYsIGloX2luZm8pOworCWFtZGdw
dV9yYXNfZmVhdHVyZV9lbmFibGUoYWRldiwgcmFzX2Jsb2NrLCAwKTsKK30KKwogLyogZG8gc29t
ZSBpbml0IHdvcmsgYWZ0ZXIgSVAgbGF0ZSBpbml0IGFzIGRlcGVuZGVuY2UuCiAgKiBhbmQgaXQg
cnVucyBpbiByZXN1bWUvZ3B1IHJlc2V0L2Jvb3RpbmcgdXAgY2FzZXMuCiAgKi8KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAppbmRleCA2Yzc2YmIyLi42NmI3MTUyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCkBAIC01NjYsNiArNTY2LDEzIEBA
IGFtZGdwdV9yYXNfZXJyb3JfdG9fdGEoZW51bSBhbWRncHVfcmFzX2Vycm9yX3R5cGUgZXJyb3Ip
IHsKIGludCBhbWRncHVfcmFzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogaW50
IGFtZGdwdV9yYXNfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiBpbnQgYW1kZ3B1
X3Jhc19wcmVfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CitpbnQgYW1kZ3B1X3Jh
c19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCisJCQkgc3RydWN0IHJhc19j
b21tb25faWYgKnJhc19ibG9jaywKKwkJCSBzdHJ1Y3QgcmFzX2ZzX2lmICpmc19pbmZvLAorCQkJ
IHN0cnVjdCByYXNfaWhfaWYgKmloX2luZm8pOwordm9pZCBhbWRncHVfcmFzX2xhdGVfZmluaShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCSAgc3RydWN0IHJhc19jb21tb25faWYgKnJh
c19ibG9jaywKKwkJCSAgc3RydWN0IHJhc19paF9pZiAqaWhfaW5mbyk7CiAKIGludCBhbWRncHVf
cmFzX2ZlYXR1cmVfZW5hYmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQlzdHJ1Y3Qg
cmFzX2NvbW1vbl9pZiAqaGVhZCwgYm9vbCBlbmFibGUpOwotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
