Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B073A70D4
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 18:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B0689686;
	Tue,  3 Sep 2019 16:44:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690056.outbound.protection.outlook.com [40.107.69.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A0C89686
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 16:44:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNQDK5yDrjqzKcBa97MDvdaSqaiAhTOplvwkpwbWn0W69Bw+S2E4R+aEgpaDlFjTkc5krSKTwhdHr5pfq3NmuY83F12m+6vom+75Yz1r/sI8PoVjvI00KvKaLGxaCAqRB1d2HcLNr9J6DKMp/4JBA/1aXlPXMQDV1Z/WH1Mo2ZIp0VpfqcKq6SLe5j+X3HF/j3st0w/ZRxz1hNOMW+y5SPSrHc4yOsVpex2Rw8iFjhJvvuPsDFmnu9PUdN8YCmc0vZiDIPOSrbQHhKQV0Cwwo+xO66NXaa4tb8FHOH9DHcPsPE9TyD0jZfqLyiP0ku/PUQm8Cl5KaJIqmFLO1sRc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RE5ui0cxibtKe2mDXr3T7Xy9fUvCnih+iO8DgMX50n4=;
 b=NvJ6bUmpHkfEjL2Om9bKQFRuL9Fi3SIAqdzBdUL1JK2VjyCc/74GMp0DItM50Eiy+gQCjlgaUR5geyTT3N++tiRG89ASD7i3ejTU8WUSFBFDeBmNjmqdNbVPjEpppDLBoz+Y3DXNlgn9IJQgvyrxQYPy/uyC0kph1EqW+/NnhGlQOLaAV/SnwMrQD4qmL7CFPA9qum0fTT3kkKszVORYexFQYiezizT17JWLFTSl1j95RAjf0WIQsDPwd32HVky4JACQ9qTSoOFEvajiUXXQSkURczB5F4DCO/Jelci6o73ZjD0mfouRfVM7+6uxw+Eh2nXGZ8r8Zsy5TWyFxpVyDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0031.namprd12.prod.outlook.com (2603:10b6:301:2::17)
 by BYAPR12MB3510.namprd12.prod.outlook.com (2603:10b6:a03:13a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.19; Tue, 3 Sep
 2019 16:44:07 +0000
Received: from DM3NAM03FT010.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by MWHPR12CA0031.outlook.office365.com
 (2603:10b6:301:2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.13 via Frontend
 Transport; Tue, 3 Sep 2019 16:44:07 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT010.mail.protection.outlook.com (10.152.82.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Tue, 3 Sep 2019 16:44:06 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 3 Sep 2019 11:44:06 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 1/3] drm/amdgpu: Fix bugs in amdgpu_device_gpu_recover in
 XGMI case.
Date: Tue, 3 Sep 2019 12:44:02 -0400
Message-ID: <1567529044-5918-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(2980300002)(428003)(189003)(199004)(2351001)(186003)(486006)(356004)(8676002)(6666004)(81166006)(426003)(36756003)(54906003)(53936002)(86362001)(305945005)(16586007)(7696005)(48376002)(316002)(81156014)(53416004)(336012)(26005)(50226002)(51416003)(2906002)(47776003)(44832011)(4326008)(70206006)(70586007)(478600001)(50466002)(8936002)(476003)(5660300002)(126002)(2616005)(14444005)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3510; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a181a9d6-9b31-41b5-d597-08d7308defe0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BYAPR12MB3510; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB3510:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3510C91B3DE92FCCCD2F8C5BEAB90@BYAPR12MB3510.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 01494FA7F7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 5zksM/Cu5DNk1Az86ev1HEItcMQDDI0qKz9fS6Dl+zL0GIBeGmtsHD13VXRXIFXUB4q2lJ5abBSCEqLvqRdthfLhP0Rt6ipN7lB3hlr8zEyRqsrR+bieMSTUaeTQfaS27F3PW1bld+sRHQAC3gbsv9M9kW8axm4BXIYt8sGbKtq5xuCv2fb9zqPNrpKjqw01D2TEVGoMucHDtJHeux7ueT5j6WJsUckLqzd5TT6JxPx3TucbwrJvvX0V8oVs5Zn3Re5KfAS8JUPUjGPem8rcoKhU/hM5DA3wTxUJL/yptfB/bph6R51iG7eC3ueXHM56AytOmbj29oH7EzLGswYcBtnKGlH6C5Zv+Xe6xPkxWhaXq7Dvcyn0VBT7BJ137FbI2LrmiC3lBscj7yNxgkuy7p6pfqr5iAz1WSrGHYHGjkM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2019 16:44:06.7004 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a181a9d6-9b31-41b5-d597-08d7308defe0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3510
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RE5ui0cxibtKe2mDXr3T7Xy9fUvCnih+iO8DgMX50n4=;
 b=3VL65eOlWY8FB+fVcWErf/wIlt0Nm61DONW8lrH1ZwhWeBlhdSMiCjZOcjxmeMYINwCk/UY7eKYR3X//ARLXzf0o6dn1a6XrT0OluYYe9X8vkJFXuXWhV8jCJLLw/3ehuEiAfzklfrY8lsyLJJM4KG7bCf5O7GmFeosgBYUfmRQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: alexdeucher@gmail.com, ckoenig.leichtzumerken@gmail.com, Tao.Zhou1@amd.com,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Hawking.Zhang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXNzdWUgMToKSW4gIFhHTUkgY2FzZSBhbWRncHVfZGV2aWNlX2xvY2tfYWRldiBmb3Igb3RoZXIg
ZGV2aWNlcyBpbiBoaXZlCndhcyBjYWxsZWQgdG8gbGF0ZSwgYWZ0ZXIgYWNjZXNzIHRvIHRoZWly
IHJlcHNlY3RpdmUgc2NoZWR1bGVycy4KU28gcmVsb2NhdGUgdGhlIGxvY2sgdG8gdGhlIGJlZ2lu
aW5nIG9mIGFjY2Vzc2luZyB0aGUgb3RoZXIgZGV2cy4KCklzc3VlIDI6ClVzaW5nIGFtZGdwdV9k
ZXZpY2VfaXBfbmVlZF9mdWxsX3Jlc2V0IHRvIHN3aXRjaCB0aGUgZGV2aWNlIGxpc3QgZnJvbQph
bGwgZGV2aWNlcyBpbiBoaXZlIHRvIHRoZSBzaW5nbGUgJ21hc3RlcicgZGV2aWNlIHdobyBvd25z
IHRoaXMgcmVzZXQKY2FsbCBpcyB3cm9uZyBiZWNhdXNlIHdoZW4gc3RvcHBpbmcgc2NoZWR1bGVy
cyB3ZSBpdGVyYXRlIGFsbCB0aGUgZGV2aWNlcwppbiBoaXZlIGJ1dCB3aGVuIHJlc3RhcnRpbmcg
d2Ugd2lsbCBvbmx5IHJlYWN0aXZhdGUgdGhlICdtYXN0ZXInIGRldmljZS4KQWxzbywgaW4gY2Fz
ZSBhbWRncHVfZGV2aWNlX3ByZV9hc2ljX3Jlc2V0IGNvbmxjdWRlcyB0aGF0IGZ1bGwgcmVzZXQg
SVMKbmVlZGVkIHdlIHRoZW4gaGF2ZSB0byBzdG9wIHNjaGVkdWxlcnMgZm9yIGFsbCBkZXZpY2Vz
IGluIGhpdmUgYW5kIG5vdApvbmx5IHRoZSAnbWFzdGVyJyBidXQgd2l0aCBhbWRncHVfZGV2aWNl
X2lwX25lZWRfZnVsbF9yZXNldCAgd2UKYWxyZWFkeSBtaXNzZWQgdGhlIG9wcHJvdHVuaXR5IGRv
IHRvIHNvLiBTbyBqdXN0IHJlbW92ZSB0aGlzIGxvZ2ljIGFuZAphbHdheXMgc3RvcCBhbmQgc3Rh
cnQgYWxsIHNjaGVkdWxlcnMgZm9yIGFsbCBkZXZpY2VzIGluIGhpdmUuCgpBbHNvIG1pbm9yIGNs
ZWFudXAgYW5kIHByaW50IGZpeC4KCnY0OiBNaW5vciBjb2Rpbmcgc3R5bGUgZml4LgoKU2lnbmVk
LW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+CkFj
a2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAyMyArKysrKysrKysrLS0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCBh
NWRhY2NjLi42ZjA3ZTZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jCkBAIC0zODE0LDE1ICszODE0LDE2IEBAIGludCBhbWRncHVfZGV2aWNlX2dwdV9yZWNv
dmVyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQlkZXZpY2VfbGlzdF9oYW5kbGUgPSAm
ZGV2aWNlX2xpc3Q7CiAJfQogCi0JLyoKLQkgKiBNYXJrIHRoZXNlIEFTSUNzIHRvIGJlIHJlc2V0
ZWQgYXMgdW50cmFja2VkIGZpcnN0Ci0JICogQW5kIGFkZCB0aGVtIGJhY2sgYWZ0ZXIgcmVzZXQg
Y29tcGxldGVkCi0JICovCi0JbGlzdF9mb3JfZWFjaF9lbnRyeSh0bXBfYWRldiwgZGV2aWNlX2xp
c3RfaGFuZGxlLCBnbWMueGdtaS5oZWFkKQotCQlhbWRncHVfdW5yZWdpc3Rlcl9ncHVfaW5zdGFu
Y2UodG1wX2FkZXYpOwotCiAJLyogYmxvY2sgYWxsIHNjaGVkdWxlcnMgYW5kIHJlc2V0IGdpdmVu
IGpvYidzIHJpbmcgKi8KIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KHRtcF9hZGV2LCBkZXZpY2VfbGlz
dF9oYW5kbGUsIGdtYy54Z21pLmhlYWQpIHsKKwkJaWYgKHRtcF9hZGV2ICE9IGFkZXYpCisJCQlh
bWRncHVfZGV2aWNlX2xvY2tfYWRldih0bXBfYWRldiwgZmFsc2UpOworCQkvKgorCQkgKiBNYXJr
IHRoZXNlIEFTSUNzIHRvIGJlIHJlc2V0ZWQgYXMgdW50cmFja2VkIGZpcnN0CisJCSAqIEFuZCBh
ZGQgdGhlbSBiYWNrIGFmdGVyIHJlc2V0IGNvbXBsZXRlZAorCQkgKi8KKwkJYW1kZ3B1X3VucmVn
aXN0ZXJfZ3B1X2luc3RhbmNlKHRtcF9hZGV2KTsKKwogCQkvKiBkaXNhYmxlIHJhcyBvbiBBTEwg
SVBzICovCiAJCWlmIChhbWRncHVfZGV2aWNlX2lwX25lZWRfZnVsbF9yZXNldCh0bXBfYWRldikp
CiAJCQlhbWRncHVfcmFzX3N1c3BlbmQodG1wX2FkZXYpOwpAQCAtMzg0OCw5ICszODQ5LDYgQEAg
aW50IGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
CiAJICAgIGRtYV9mZW5jZV9pc19zaWduYWxlZChqb2ItPmJhc2Uuc19mZW5jZS0+cGFyZW50KSkK
IAkJam9iX3NpZ25hbGVkID0gdHJ1ZTsKIAotCWlmICghYW1kZ3B1X2RldmljZV9pcF9uZWVkX2Z1
bGxfcmVzZXQoYWRldikpCi0JCWRldmljZV9saXN0X2hhbmRsZSA9ICZkZXZpY2VfbGlzdDsKLQog
CWlmIChqb2Jfc2lnbmFsZWQpIHsKIAkJZGV2X2luZm8oYWRldi0+ZGV2LCAiR3VpbHR5IGpvYiBh
bHJlYWR5IHNpZ25hbGVkLCBza2lwcGluZyBIVyByZXNldCIpOwogCQlnb3RvIHNraXBfaHdfcmVz
ZXQ7CkBAIC0zODcyLDcgKzM4NzAsNiBAQCBpbnQgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3Zlcihz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJaWYgKHRtcF9hZGV2ID09IGFkZXYpCiAJCQlj
b250aW51ZTsKIAotCQlhbWRncHVfZGV2aWNlX2xvY2tfYWRldih0bXBfYWRldiwgZmFsc2UpOwog
CQlyID0gYW1kZ3B1X2RldmljZV9wcmVfYXNpY19yZXNldCh0bXBfYWRldiwKIAkJCQkJCSBOVUxM
LAogCQkJCQkJICZuZWVkX2Z1bGxfcmVzZXQpOwpAQCAtMzkyMSwxMCArMzkxOCwxMCBAQCBpbnQg
YW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAog
CQlpZiAocikgewogCQkJLyogYmFkIG5ld3MsIGhvdyB0byB0ZWxsIGl0IHRvIHVzZXJzcGFjZSA/
ICovCi0JCQlkZXZfaW5mbyh0bXBfYWRldi0+ZGV2LCAiR1BVIHJlc2V0KCVkKSBmYWlsZWRcbiIs
IGF0b21pY19yZWFkKCZhZGV2LT5ncHVfcmVzZXRfY291bnRlcikpOworCQkJZGV2X2luZm8odG1w
X2FkZXYtPmRldiwgIkdQVSByZXNldCglZCkgZmFpbGVkXG4iLCBhdG9taWNfcmVhZCgmdG1wX2Fk
ZXYtPmdwdV9yZXNldF9jb3VudGVyKSk7CiAJCQlhbWRncHVfdmZfZXJyb3JfcHV0KHRtcF9hZGV2
LCBBTURHSU1fRVJST1JfVkZfR1BVX1JFU0VUX0ZBSUwsIDAsIHIpOwogCQl9IGVsc2UgewotCQkJ
ZGV2X2luZm8odG1wX2FkZXYtPmRldiwgIkdQVSByZXNldCglZCkgc3VjY2VlZGVkIVxuIiwgYXRv
bWljX3JlYWQoJmFkZXYtPmdwdV9yZXNldF9jb3VudGVyKSk7CisJCQlkZXZfaW5mbyh0bXBfYWRl
di0+ZGV2LCAiR1BVIHJlc2V0KCVkKSBzdWNjZWVkZWQhXG4iLCBhdG9taWNfcmVhZCgmdG1wX2Fk
ZXYtPmdwdV9yZXNldF9jb3VudGVyKSk7CiAJCX0KIAogCQlhbWRncHVfZGV2aWNlX3VubG9ja19h
ZGV2KHRtcF9hZGV2KTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
