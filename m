Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF44A3C2E
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 18:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815586E36D;
	Fri, 30 Aug 2019 16:39:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720054.outbound.protection.outlook.com [40.107.72.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6302E6E36D
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 16:39:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3VVFEsDfLWTRNEZSITLi01IxuW1IUzNeFcCdDUDS9K9/pAzOivaDe4UuxBtuTJmo31TJSevxQscBvr4EOo7zYRs2Jkz6hi9gJFAERiFglKZXHiXPQOXZKefih7xDsWyCY5VgYG+ZPbjxM7MfkrCDSpYxsavWvttiEFQN6/heNBEaQQZbIPV8+EoecjWMKFz/fWV9eFw0j1Bjkq3sSEE3vyVUf7wplrfX7Wt95AqPlcYLZ8XDNOWMT1WjwyfryDpCsQdIYULylrknGYIN5vKdYlqF3697veLmSr6RyJkH30haNVRaUGX5+5lWhDVGjjTULKeTw+Yzn592aRHjZcB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3O/FMoBMGXm9HnjTYWac5i6PcOsdMsBVlUmG9nc9Dw=;
 b=dtWSJtSkGR1gas9XeKMdIvOOUtCqu8cw8bdXRcv/KWRMv3ctUVYXTCn8Y7R1bqTT1GYgjeq3rzc+0tYjaeWOQP6nFfpkogz1cAbxYQPHx+joTEf9W4PXNBYTnldVvrLs0+B5IE3swOH5x7HpQtgWQPAsGhd4kt4UWv399yJykJP/WOTH6KNveFQx8sogJ6plGmWdRPOirqDvnIwTY8TbIbMhOAYGaPdwT8EGwvPQhneblJo0fLB2Ec0uCg2bq53ffTCQ5du56lisd0rHqGzsJvxgXG5lBrbkToW4NpsDoQuWsY5D5NQVDFZ46tmw732zLCvVbYTyBn4Uvf1gp6bhnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0063.namprd12.prod.outlook.com (2603:10b6:0:56::31) by
 MW2PR12MB2345.namprd12.prod.outlook.com (2603:10b6:907:7::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Fri, 30 Aug 2019 16:39:24 +0000
Received: from DM3NAM03FT037.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM3PR12CA0063.outlook.office365.com
 (2603:10b6:0:56::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.18 via Frontend
 Transport; Fri, 30 Aug 2019 16:39:24 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT037.mail.protection.outlook.com (10.152.83.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 16:39:24 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Fri, 30 Aug 2019 11:39:22 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 1/3] drm/amdgpu: Fix bugs in amdgpu_device_gpu_recover in
 XGMI case.
Date: Fri, 30 Aug 2019 12:39:11 -0400
Message-ID: <1567183153-11014-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(376002)(136003)(396003)(346002)(2980300002)(428003)(189003)(199004)(26005)(7696005)(316002)(16586007)(51416003)(86362001)(53416004)(8676002)(54906003)(5660300002)(2351001)(4326008)(47776003)(44832011)(486006)(70586007)(356004)(6666004)(70206006)(476003)(126002)(2616005)(305945005)(50226002)(81166006)(53936002)(81156014)(478600001)(14444005)(336012)(8936002)(426003)(50466002)(2906002)(48376002)(186003)(36756003)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2345; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b4568b0-c4cf-446d-6cae-08d72d689def
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MW2PR12MB2345; 
X-MS-TrafficTypeDiagnostic: MW2PR12MB2345:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2345BFF86AD88B02F5A8C128EABD0@MW2PR12MB2345.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0145758B1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: HVhDdmBLftO2kYVdCOM0x82HXKaJfav5aiOOxNi2Fw2B/u2xHHOXRqj73/UmCqGt029O+o2aDRPEDclhvEh0vJb/2Osp2DtwVN4FORqkRJ58KqIhnrRpICIsagvyfwC4Lob1yJnZ4hvNEpJWh15IJjHRNnOWrZGxcq4aqzORLD8CjnMYFV4KDjmvHx2nKOjWggK+CUH1nTpjb04QKGO/yOGaLFPdyDlengXGSVR14/szpXk9qqQggrEUECVUwuYK0pMhbYD+rhH8GpvaiZIKODXhb9n/fWpN0svn773nJDRX34Jh3zGRJgq5HCTZ1AKEks9INqLMG6HeZuKGQb+Bq6wJTBhsrlxS1gJQBZe38TYjx0yVZLJBgHMOtFsv8os4uEInOPSQiFsHNCnjvcyqJZmqVNZWRAKvafknWajczYA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 16:39:24.4095 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4568b0-c4cf-446d-6cae-08d72d689def
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2345
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3O/FMoBMGXm9HnjTYWac5i6PcOsdMsBVlUmG9nc9Dw=;
 b=kmVPbf85Tfms2fumLJzlW+ocpPnHQcR71dQhKIco4BvZtDRqM4GzauhHWLuNUKArk/5jIzjw6XNea11N4htgeyaApdX+y7knIWx5sR7ddijGg5dfuqnroaWft1YO5QlMwQxSUc/XjBCxSsLp2Y0ozCb502mwbq2Mw5UUlvN9lis=
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 ckoenig.leichtzumerken@gmail.com, Felix.Kuehling@amd.com, Tao.Zhou1@amd.com,
 alexdeucher@gmail.com, Hawking.Zhang@amd.com
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
ZWFudXAgYW5kIHByaW50IGZpeC4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxh
bmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZXZpY2UuYyB8IDI1ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggYTVkYWNjYy4uMTlmNjYyNCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMzgxNCwxNSAr
MzgxNCwxNiBAQCBpbnQgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcihzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKIAkJZGV2aWNlX2xpc3RfaGFuZGxlID0gJmRldmljZV9saXN0OwogCX0KIAot
CS8qCi0JICogTWFyayB0aGVzZSBBU0lDcyB0byBiZSByZXNldGVkIGFzIHVudHJhY2tlZCBmaXJz
dAotCSAqIEFuZCBhZGQgdGhlbSBiYWNrIGFmdGVyIHJlc2V0IGNvbXBsZXRlZAotCSAqLwotCWxp
c3RfZm9yX2VhY2hfZW50cnkodG1wX2FkZXYsIGRldmljZV9saXN0X2hhbmRsZSwgZ21jLnhnbWku
aGVhZCkKLQkJYW1kZ3B1X3VucmVnaXN0ZXJfZ3B1X2luc3RhbmNlKHRtcF9hZGV2KTsKLQogCS8q
IGJsb2NrIGFsbCBzY2hlZHVsZXJzIGFuZCByZXNldCBnaXZlbiBqb2IncyByaW5nICovCiAJbGlz
dF9mb3JfZWFjaF9lbnRyeSh0bXBfYWRldiwgZGV2aWNlX2xpc3RfaGFuZGxlLCBnbWMueGdtaS5o
ZWFkKSB7CisJCWlmICh0bXBfYWRldiAhPSBhZGV2KQorCQkJYW1kZ3B1X2RldmljZV9sb2NrX2Fk
ZXYodG1wX2FkZXYsIGZhbHNlKTsKKwkJLyoKKwkJICogTWFyayB0aGVzZSBBU0lDcyB0byBiZSBy
ZXNldGVkIGFzIHVudHJhY2tlZCBmaXJzdAorCQkgKiBBbmQgYWRkIHRoZW0gYmFjayBhZnRlciBy
ZXNldCBjb21wbGV0ZWQKKwkJICovCisJCWFtZGdwdV91bnJlZ2lzdGVyX2dwdV9pbnN0YW5jZSh0
bXBfYWRldik7CisKIAkJLyogZGlzYWJsZSByYXMgb24gQUxMIElQcyAqLwogCQlpZiAoYW1kZ3B1
X2RldmljZV9pcF9uZWVkX2Z1bGxfcmVzZXQodG1wX2FkZXYpKQogCQkJYW1kZ3B1X3Jhc19zdXNw
ZW5kKHRtcF9hZGV2KTsKQEAgLTM4NDgsOSArMzg0OSw2IEBAIGludCBhbWRncHVfZGV2aWNlX2dw
dV9yZWNvdmVyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCSAgICBkbWFfZmVuY2VfaXNf
c2lnbmFsZWQoam9iLT5iYXNlLnNfZmVuY2UtPnBhcmVudCkpCiAJCWpvYl9zaWduYWxlZCA9IHRy
dWU7CiAKLQlpZiAoIWFtZGdwdV9kZXZpY2VfaXBfbmVlZF9mdWxsX3Jlc2V0KGFkZXYpKQotCQlk
ZXZpY2VfbGlzdF9oYW5kbGUgPSAmZGV2aWNlX2xpc3Q7Ci0KIAlpZiAoam9iX3NpZ25hbGVkKSB7
CiAJCWRldl9pbmZvKGFkZXYtPmRldiwgIkd1aWx0eSBqb2IgYWxyZWFkeSBzaWduYWxlZCwgc2tp
cHBpbmcgSFcgcmVzZXQiKTsKIAkJZ290byBza2lwX2h3X3Jlc2V0OwpAQCAtMzg2OSwxMCArMzg2
Nyw5IEBAIGludCBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVyKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LAogcmV0cnk6CS8qIFJlc3Qgb2YgYWRldnMgcHJlIGFzaWMgcmVzZXQgZnJvbSBYR01J
IGhpdmUuICovCiAJbGlzdF9mb3JfZWFjaF9lbnRyeSh0bXBfYWRldiwgZGV2aWNlX2xpc3RfaGFu
ZGxlLCBnbWMueGdtaS5oZWFkKSB7CiAKLQkJaWYgKHRtcF9hZGV2ID09IGFkZXYpCisJCWlmKHRt
cF9hZGV2ID09IGFkZXYpCiAJCQljb250aW51ZTsKIAotCQlhbWRncHVfZGV2aWNlX2xvY2tfYWRl
dih0bXBfYWRldiwgZmFsc2UpOwogCQlyID0gYW1kZ3B1X2RldmljZV9wcmVfYXNpY19yZXNldCh0
bXBfYWRldiwKIAkJCQkJCSBOVUxMLAogCQkJCQkJICZuZWVkX2Z1bGxfcmVzZXQpOwpAQCAtMzky
MSwxMCArMzkxOCwxMCBAQCBpbnQgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcihzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKIAogCQlpZiAocikgewogCQkJLyogYmFkIG5ld3MsIGhvdyB0byB0
ZWxsIGl0IHRvIHVzZXJzcGFjZSA/ICovCi0JCQlkZXZfaW5mbyh0bXBfYWRldi0+ZGV2LCAiR1BV
IHJlc2V0KCVkKSBmYWlsZWRcbiIsIGF0b21pY19yZWFkKCZhZGV2LT5ncHVfcmVzZXRfY291bnRl
cikpOworCQkJZGV2X2luZm8odG1wX2FkZXYtPmRldiwgIkdQVSByZXNldCglZCkgZmFpbGVkXG4i
LCBhdG9taWNfcmVhZCgmdG1wX2FkZXYtPmdwdV9yZXNldF9jb3VudGVyKSk7CiAJCQlhbWRncHVf
dmZfZXJyb3JfcHV0KHRtcF9hZGV2LCBBTURHSU1fRVJST1JfVkZfR1BVX1JFU0VUX0ZBSUwsIDAs
IHIpOwogCQl9IGVsc2UgewotCQkJZGV2X2luZm8odG1wX2FkZXYtPmRldiwgIkdQVSByZXNldCgl
ZCkgc3VjY2VlZGVkIVxuIiwgYXRvbWljX3JlYWQoJmFkZXYtPmdwdV9yZXNldF9jb3VudGVyKSk7
CisJCQlkZXZfaW5mbyh0bXBfYWRldi0+ZGV2LCAiR1BVIHJlc2V0KCVkKSBzdWNjZWVkZWQhXG4i
LCBhdG9taWNfcmVhZCgmdG1wX2FkZXYtPmdwdV9yZXNldF9jb3VudGVyKSk7CiAJCX0KIAogCQlh
bWRncHVfZGV2aWNlX3VubG9ja19hZGV2KHRtcF9hZGV2KTsKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
