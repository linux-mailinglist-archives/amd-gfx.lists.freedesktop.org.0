Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2353EA20CB
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 18:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEF76E152;
	Thu, 29 Aug 2019 16:24:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720070.outbound.protection.outlook.com [40.107.72.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E446E141
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 16:24:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVoL1EZth8NguU1r7FApE8PoSw+2JlsqB5X3Po49YdAyABKKds28Mu88QeS95jxsX/HMKn3gLv7z2LKBi624xCgjxpEVUkiqfCxnHwVeq7qprcLXcqsHgJDr4Ha1tg6slXQfi7q+ZC6dmMIGMozWR6iTZj6jpB969EW2EOpBYO0VFvRZZYMsXTI6IlJdVNjifsdguXapIkLWDrERLRLGG71YipDTT4hn1c//PjLMMFxJPcjpJPxnxWiZcVkZif+4B0aY6snxeNdCrNRASCMk5rgnfQudxRqhI7JXbA3/DKBD1BVU5B9EBS+YmYcMe1axOCb8Wka5EkzpL2a5BaxQhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/SUzMhClnil9kHl372O2yKg2R6vyo17xGfLkqc0+Z4=;
 b=KZ7ZnNnTA5/BYOOn3WNHC5Ytv49IIgouXRSdiQC9iFdp7ibuAvfQjuLVusKWFnS+8HMBGmwgWneMTe8MubtTHzUut83le9jflCUpdapU2VM/UU/gj2k4xHWWfz+y2dRviIiACsnUp2iQ1lrc5tjPbZLqMDWtS3j0epe1Qmajo1qIpIXo34nkAfam6EgrOlVN5/dmI/wfcNxGbJKelSKh+zYs/0EGuN8F3BOYKx3dK69w7fWN3k+W0GSJ3LS/NW2bXozFUa57QIhxwysbZ8Pd1LByo+FocD40vKKQS1oGJ5l6odDH+Ebr3pfzsSwCehDWMa9OeRx91AQoC/udKlWvNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0008.namprd12.prod.outlook.com
 (2603:10b6:910:16::18) by BN6PR12MB1266.namprd12.prod.outlook.com
 (2603:10b6:404:14::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Thu, 29 Aug
 2019 16:24:10 +0000
Received: from BY2NAM03FT037.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by CY4PR1201CA0008.outlook.office365.com
 (2603:10b6:910:16::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.18 via Frontend
 Transport; Thu, 29 Aug 2019 16:24:09 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT037.mail.protection.outlook.com (10.152.84.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 16:24:09 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 11:23:49 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 18/20] drm/amd/display: Update CP property based on HW query
Date: Thu, 29 Aug 2019 12:22:51 -0400
Message-ID: <20190829162253.10195-19-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(316002)(486006)(305945005)(2616005)(86362001)(476003)(126002)(186003)(8676002)(53936002)(336012)(11346002)(2906002)(26005)(36756003)(14444005)(446003)(50466002)(6916009)(81166006)(81156014)(426003)(48376002)(6666004)(356004)(53416004)(8936002)(1076003)(50226002)(15650500001)(16586007)(478600001)(47776003)(70586007)(70206006)(76176011)(51416003)(5660300002)(4326008)(2351001)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1266; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a74c621-99e7-4026-301c-08d72c9d5227
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1266; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1266:
X-Microsoft-Antispam-PRVS: <BN6PR12MB12664CB8483E4F4E9ABE8E13F9A20@BN6PR12MB1266.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:339;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Rfmhy11o5dhzlsgoZ7hVpC1EDkl6oCck8+Eby5i7BgbxpcV6jOsCCFAToKKhV1oNVOlmeLxiXwi9BkVJeN0Ti07sEo5vC89cny4poZ7MiCjFb7SIJZVeKqZnT0AMe+Q5xIq6hc20dESO7lDoWH4eKzk/VtqD/Lq/C1vBj7QeJiygecODseNAAZeXQgzFsd53BO7vKmclBGfVJSWG1mEV/4dnx4w7P3xDu+lvO0j0uabiQNJEavFf4QrBt7xoWABGffeLv6s/7lvR7P/5iJyumTITb+Zpkisz5qoHQzddyc2pJaHqtlUM6rkMhszJDRoWGfiFm+KLdUWg/WfjoLWBBH2AczIHX9eAmqVotZPXKUy7q0t6g1+qUJcwrp7zkVp2jXv9QX1eFJxTkCp2H1/PBLvk1ijoJHi1qhWjaY3Yexo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 16:24:09.4470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a74c621-99e7-4026-301c-08d72c9d5227
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1266
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/SUzMhClnil9kHl372O2yKg2R6vyo17xGfLkqc0+Z4=;
 b=fQB7OiWjVMj3r2HDOiVbC5DYfTaWr4hDVQYIwATp9LgoRZKGx3V/zf/De3gJFX8BxXSVz2XD2s4XKErZiU20JTBlYWzmZQK57DlfPXgQMV/wa4hjklvV62KV5t3MTczdkiHFGJe2wTmceXwyTKe7mrx76iFxqu+4loI8MPslS/Y=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KV2UgbmVlZCB0byB1c2UgSFcgc3RhdGUgdG8gc2V0IGNvbnRlbnQgcHJvdGVjdGlvbiB0
byBFTkFCTEVELgpUaGlzIHdheSB3ZSBrbm93IHRoYXQgdGhlIGxpbmsgaXMgZW5jcnlwdGVkIGZy
b20gdGhlIEhXIHNpZGUKCltIb3ddCkNyZWF0ZSBhIHdvcmtxdWV1ZSB0aGF0IHF1ZXJpZXMgdGhl
IEhXIGV2ZXJ5IH4yc2Vjb25kcywgYW5kIHNldHMgaXQgdG8KRU5BQkxFRCBvciBERVNJUkVEIGJh
c2VkIG9uIHRoZSByZXN1bHQgZnJvbSB0aGUgaGFyZHdhcmUKCkNoYW5nZS1JZDogSWRlOGRiYmI1
ODc3YzgzYzRhYWM1NzZiYjRiZDNlMGI5Y2JkOWY2M2UKU2lnbmVkLW9mZi1ieTogQmhhd2FucHJl
ZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMTYgKy0tLS0KIC4uLi9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hkY3AuYyAgICB8IDY1ICsrKysrKysrKysrKysrKysrKy0K
IC4uLi9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hkY3AuaCAgICB8ICA3ICstCiAz
IGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4
IDhjYjQ4Y2YyNTdhNi4uZTNmNTQ3NDkwYjBlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTUzNzAsMTkgKzUzNzAsOSBAQCBz
dGF0aWMgdm9pZCB1cGRhdGVfY29udGVudF9wcm90ZWN0aW9uKHN0cnVjdCBkcm1fY29ubmVjdG9y
X3N0YXRlICpzdGF0ZSwgY29uc3QgcwogewogCXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICph
Y29ubmVjdG9yID0gdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rvcihjb25uZWN0b3IpOwogCi0JaWYgKHN0
YXRlLT5jb250ZW50X3Byb3RlY3Rpb24gPT0gRFJNX01PREVfQ09OVEVOVF9QUk9URUNUSU9OX0RF
U0lSRUQpIHsKLQkJaGRjcF9hZGRfZGlzcGxheShoZGNwX3csIGFjb25uZWN0b3ItPmRjX2xpbmst
PmxpbmtfaW5kZXgpOwotCi0JCS8qCi0JCSAqIFRPRE86IEVOQUJMRUQgc2hvdWxkIGJlIHZlcmlm
aWVkIHVzaW5nIHBzcCwgaXQgaXMgcGxhbm5lZCBsYXRlci4KLQkJICogSnVzdCBzZXQgdGhpcyB0
byBFTkFCTEVEIGZvciBub3cKLQkJICovCi0JCXN0YXRlLT5jb250ZW50X3Byb3RlY3Rpb24gPSBE
Uk1fTU9ERV9DT05URU5UX1BST1RFQ1RJT05fRU5BQkxFRDsKLQotCQlyZXR1cm47Ci0JfQotCi0J
aWYgKHN0YXRlLT5jb250ZW50X3Byb3RlY3Rpb24gPT0gRFJNX01PREVfQ09OVEVOVF9QUk9URUNU
SU9OX1VOREVTSVJFRCkKKwlpZiAoc3RhdGUtPmNvbnRlbnRfcHJvdGVjdGlvbiA9PSBEUk1fTU9E
RV9DT05URU5UX1BST1RFQ1RJT05fREVTSVJFRCkKKwkJaGRjcF9hZGRfZGlzcGxheShoZGNwX3cs
IGFjb25uZWN0b3ItPmRjX2xpbmstPmxpbmtfaW5kZXgsIGFjb25uZWN0b3IpOworCWVsc2UgaWYg
KHN0YXRlLT5jb250ZW50X3Byb3RlY3Rpb24gPT0gRFJNX01PREVfQ09OVEVOVF9QUk9URUNUSU9O
X1VOREVTSVJFRCkKIAkJaGRjcF9yZW1vdmVfZGlzcGxheShoZGNwX3csIGFjb25uZWN0b3ItPmRj
X2xpbmstPmxpbmtfaW5kZXgsIGFjb25uZWN0b3ItPmJhc2UuaW5kZXgpOwogCiB9CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNw
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNw
LmMKaW5kZXggOWQxMWQ3Njk1NTA4Li4yNDQzYzIzOGMxODggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hkY3AuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmMKQEAgLTI3
LDYgKzI3LDcgQEAKICNpbmNsdWRlICJhbWRncHUuaCIKICNpbmNsdWRlICJhbWRncHVfZG0uaCIK
ICNpbmNsdWRlICJkbV9oZWxwZXJzLmgiCisjaW5jbHVkZSA8ZHJtL2RybV9oZGNwLmg+CiAKIGJv
b2wgbHBfd3JpdGVfaTJjKHZvaWQgKmhhbmRsZSwgdWludDMyX3QgYWRkcmVzcywgY29uc3QgdWlu
dDhfdCAqZGF0YSwgdWludDMyX3Qgc2l6ZSkKIHsKQEAgLTgyLDE2ICs4MywxOSBAQCBzdGF0aWMg
dm9pZCBwcm9jZXNzX291dHB1dChzdHJ1Y3QgaGRjcF93b3JrcXVldWUgKmhkY3Bfd29yaykKIAog
fQogCi12b2lkIGhkY3BfYWRkX2Rpc3BsYXkoc3RydWN0IGhkY3Bfd29ya3F1ZXVlICpoZGNwX3dv
cmssIHVuc2lnbmVkIGludCBsaW5rX2luZGV4KQordm9pZCBoZGNwX2FkZF9kaXNwbGF5KHN0cnVj
dCBoZGNwX3dvcmtxdWV1ZSAqaGRjcF93b3JrLCB1bnNpZ25lZCBpbnQgbGlua19pbmRleCwgc3Ry
dWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IpCiB7CiAJc3RydWN0IGhkY3Bfd29y
a3F1ZXVlICpoZGNwX3cgPSAmaGRjcF93b3JrW2xpbmtfaW5kZXhdOwogCXN0cnVjdCBtb2RfaGRj
cF9kaXNwbGF5ICpkaXNwbGF5ID0gJmhkY3Bfd29ya1tsaW5rX2luZGV4XS5kaXNwbGF5OwogCXN0
cnVjdCBtb2RfaGRjcF9saW5rICpsaW5rID0gJmhkY3Bfd29ya1tsaW5rX2luZGV4XS5saW5rOwog
CiAJbXV0ZXhfbG9jaygmaGRjcF93LT5tdXRleCk7CisJaGRjcF93LT5hY29ubmVjdG9yID0gYWNv
bm5lY3RvcjsKIAogCW1vZF9oZGNwX2FkZF9kaXNwbGF5KCZoZGNwX3ctPmhkY3AsIGxpbmssIGRp
c3BsYXksICZoZGNwX3ctPm91dHB1dCk7CiAKKwlzY2hlZHVsZV9kZWxheWVkX3dvcmsoJmhkY3Bf
dy0+cHJvcGVydHlfdmFsaWRhdGVfZHdvcmssIG1zZWNzX3RvX2ppZmZpZXMoRFJNX0hEQ1BfQ0hF
Q0tfUEVSSU9EX01TKSk7CisKIAlwcm9jZXNzX291dHB1dChoZGNwX3cpOwogCiAJbXV0ZXhfdW5s
b2NrKCZoZGNwX3ctPm11dGV4KTsKQEAgLTEwNiw2ICsxMTAsOSBAQCB2b2lkIGhkY3BfcmVtb3Zl
X2Rpc3BsYXkoc3RydWN0IGhkY3Bfd29ya3F1ZXVlICpoZGNwX3dvcmssIHVuc2lnbmVkIGludCBs
aW5rX2luZAogCiAJbW9kX2hkY3BfcmVtb3ZlX2Rpc3BsYXkoJmhkY3Bfdy0+aGRjcCwgZGlzcGxh
eV9pbmRleCwgJmhkY3Bfdy0+b3V0cHV0KTsKIAorCWNhbmNlbF9kZWxheWVkX3dvcmsoJmhkY3Bf
dy0+cHJvcGVydHlfdmFsaWRhdGVfZHdvcmspOworCWhkY3Bfdy0+ZW5jcnlwdGlvbl9zdGF0dXMg
PSBNT0RfSERDUF9FTkNSWVBUSU9OX1NUQVRVU19IRENQX09GRjsKKwogCXByb2Nlc3Nfb3V0cHV0
KGhkY3Bfdyk7CiAKIAltdXRleF91bmxvY2soJmhkY3Bfdy0+bXV0ZXgpOwpAQCAtMTIwLDYgKzEy
Nyw5IEBAIHZvaWQgaGRjcF9yZXNldF9kaXNwbGF5KHN0cnVjdCBoZGNwX3dvcmtxdWV1ZSAqaGRj
cF93b3JrLCB1bnNpZ25lZCBpbnQgbGlua19pbmRlCiAKIAltb2RfaGRjcF9yZXNldF9jb25uZWN0
aW9uKCZoZGNwX3ctPmhkY3AsICAmaGRjcF93LT5vdXRwdXQpOwogCisJY2FuY2VsX2RlbGF5ZWRf
d29yaygmaGRjcF93LT5wcm9wZXJ0eV92YWxpZGF0ZV9kd29yayk7CisJaGRjcF93LT5lbmNyeXB0
aW9uX3N0YXR1cyA9IE1PRF9IRENQX0VOQ1JZUFRJT05fU1RBVFVTX0hEQ1BfT0ZGOworCiAJcHJv
Y2Vzc19vdXRwdXQoaGRjcF93KTsKIAogCW11dGV4X3VubG9jaygmaGRjcF93LT5tdXRleCk7CkBA
IC0xNTUsNyArMTY1LDU4IEBAIHN0YXRpYyB2b2lkIGV2ZW50X2NhbGxiYWNrKHN0cnVjdCB3b3Jr
X3N0cnVjdCAqd29yaykKIAogCiB9CitzdGF0aWMgdm9pZCBldmVudF9wcm9wZXJ0eV91cGRhdGUo
c3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQoreworCisJc3RydWN0IGhkY3Bfd29ya3F1ZXVlICpo
ZGNwX3dvcmsgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IGhkY3Bfd29ya3F1ZXVlLCBwcm9w
ZXJ0eV91cGRhdGVfd29yayk7CisJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0
b3IgPSBoZGNwX3dvcmstPmFjb25uZWN0b3I7CisJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGhk
Y3Bfd29yay0+YWNvbm5lY3Rvci0+YmFzZS5kZXY7CisJbG9uZyByZXQ7CisKKwlkcm1fbW9kZXNl
dF9sb2NrKCZkZXYtPm1vZGVfY29uZmlnLmNvbm5lY3Rpb25fbXV0ZXgsIE5VTEwpOworCW11dGV4
X2xvY2soJmhkY3Bfd29yay0+bXV0ZXgpOworCisKKwlpZiAoYWNvbm5lY3Rvci0+YmFzZS5zdGF0
ZS0+Y29tbWl0KSB7CisJCXJldCA9IHdhaXRfZm9yX2NvbXBsZXRpb25faW50ZXJydXB0aWJsZV90
aW1lb3V0KCZhY29ubmVjdG9yLT5iYXNlLnN0YXRlLT5jb21taXQtPmh3X2RvbmUsIDEwICogSFop
OworCisJCWlmIChyZXQgPT0gMCkgeworCQkJRFJNX0VSUk9SKCJIRENQIHN0YXRlIHVua25vd24h
IFNldHRpbmcgaXQgdG8gREVTSVJFRCIpOworCQkJaGRjcF93b3JrLT5lbmNyeXB0aW9uX3N0YXR1
cyA9IE1PRF9IRENQX0VOQ1JZUFRJT05fU1RBVFVTX0hEQ1BfT0ZGOworCQl9CisJfQorCisJaWYg
KGhkY3Bfd29yay0+ZW5jcnlwdGlvbl9zdGF0dXMgPT0gTU9EX0hEQ1BfRU5DUllQVElPTl9TVEFU
VVNfSERDUDFfT04pCisJCWRybV9oZGNwX3VwZGF0ZV9jb250ZW50X3Byb3RlY3Rpb24oJmFjb25u
ZWN0b3ItPmJhc2UsIERSTV9NT0RFX0NPTlRFTlRfUFJPVEVDVElPTl9FTkFCTEVEKTsKKwllbHNl
CisJCWRybV9oZGNwX3VwZGF0ZV9jb250ZW50X3Byb3RlY3Rpb24oJmFjb25uZWN0b3ItPmJhc2Us
IERSTV9NT0RFX0NPTlRFTlRfUFJPVEVDVElPTl9ERVNJUkVEKTsKKworCisJbXV0ZXhfdW5sb2Nr
KCZoZGNwX3dvcmstPm11dGV4KTsKKwlkcm1fbW9kZXNldF91bmxvY2soJmRldi0+bW9kZV9jb25m
aWcuY29ubmVjdGlvbl9tdXRleCk7Cit9CisKK3N0YXRpYyB2b2lkIGV2ZW50X3Byb3BlcnR5X3Zh
bGlkYXRlKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKK3sKKwlzdHJ1Y3QgaGRjcF93b3JrcXVl
dWUgKmhkY3Bfd29yayA9CisJCWNvbnRhaW5lcl9vZih0b19kZWxheWVkX3dvcmsod29yayksIHN0
cnVjdCBoZGNwX3dvcmtxdWV1ZSwgcHJvcGVydHlfdmFsaWRhdGVfZHdvcmspOworCXN0cnVjdCBt
b2RfaGRjcF9kaXNwbGF5X3F1ZXJ5IHF1ZXJ5OworCXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9y
ICphY29ubmVjdG9yID0gaGRjcF93b3JrLT5hY29ubmVjdG9yOworCisJbXV0ZXhfbG9jaygmaGRj
cF93b3JrLT5tdXRleCk7CiAKKwlxdWVyeS5lbmNyeXB0aW9uX3N0YXR1cyA9IE1PRF9IRENQX0VO
Q1JZUFRJT05fU1RBVFVTX0hEQ1BfT0ZGOworCW1vZF9oZGNwX3F1ZXJ5X2Rpc3BsYXkoJmhkY3Bf
d29yay0+aGRjcCwgYWNvbm5lY3Rvci0+YmFzZS5pbmRleCwgJnF1ZXJ5KTsKKworCWlmIChxdWVy
eS5lbmNyeXB0aW9uX3N0YXR1cyAhPSBoZGNwX3dvcmstPmVuY3J5cHRpb25fc3RhdHVzKSB7CisJ
CWhkY3Bfd29yay0+ZW5jcnlwdGlvbl9zdGF0dXMgPSBxdWVyeS5lbmNyeXB0aW9uX3N0YXR1czsK
KwkJc2NoZWR1bGVfd29yaygmaGRjcF93b3JrLT5wcm9wZXJ0eV91cGRhdGVfd29yayk7CisJfQor
CisJc2NoZWR1bGVfZGVsYXllZF93b3JrKCZoZGNwX3dvcmstPnByb3BlcnR5X3ZhbGlkYXRlX2R3
b3JrLCBtc2Vjc190b19qaWZmaWVzKERSTV9IRENQX0NIRUNLX1BFUklPRF9NUykpOworCisJbXV0
ZXhfdW5sb2NrKCZoZGNwX3dvcmstPm11dGV4KTsKK30KIAogc3RhdGljIHZvaWQgZXZlbnRfd2F0
Y2hkb2dfdGltZXIoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogewpAQCAtMjUwLDggKzMxMSwx
MCBAQCBzdHJ1Y3QgaGRjcF93b3JrcXVldWUgKmhkY3BfY3JlYXRlX3dvcmtxdWV1ZSh2b2lkICpw
c3BfY29udGV4dCwgc3RydWN0IGNwX3BzcCAqYwogCQltdXRleF9pbml0KCZoZGNwX3dvcmtbaV0u
bXV0ZXgpOwogCiAJCUlOSVRfV09SSygmaGRjcF93b3JrW2ldLmNwaXJxX3dvcmssIGV2ZW50X2Nw
aXJxKTsKKwkJSU5JVF9XT1JLKCZoZGNwX3dvcmtbaV0ucHJvcGVydHlfdXBkYXRlX3dvcmssIGV2
ZW50X3Byb3BlcnR5X3VwZGF0ZSk7CiAJCUlOSVRfREVMQVlFRF9XT1JLKCZoZGNwX3dvcmtbaV0u
Y2FsbGJhY2tfZHdvcmssIGV2ZW50X2NhbGxiYWNrKTsKIAkJSU5JVF9ERUxBWUVEX1dPUksoJmhk
Y3Bfd29ya1tpXS53YXRjaGRvZ190aW1lcl9kd29yaywgZXZlbnRfd2F0Y2hkb2dfdGltZXIpOwor
CQlJTklUX0RFTEFZRURfV09SSygmaGRjcF93b3JrW2ldLnByb3BlcnR5X3ZhbGlkYXRlX2R3b3Jr
LCBldmVudF9wcm9wZXJ0eV92YWxpZGF0ZSk7CiAKIAkJaGRjcF93b3JrW2ldLmhkY3AuY29uZmln
LnBzcC5oYW5kbGUgPSAgcHNwX2NvbnRleHQ7CiAJCWhkY3Bfd29ya1tpXS5oZGNwLmNvbmZpZy5k
ZGMuaGFuZGxlID0gZGNfZ2V0X2xpbmtfYXRfaW5kZXgoZGMsIGkpOwpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGRjcC5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGRjcC5oCmluZGV4
IGNiNmM2ZmJkNzRmNi4uZDNiYTUwNWQwNjk2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGRjcC5oCkBAIC0zOCw4ICszOCwx
MSBAQCBzdHJ1Y3QgY3BfcHNwOwogCiBzdHJ1Y3QgaGRjcF93b3JrcXVldWUgewogCXN0cnVjdCB3
b3JrX3N0cnVjdCBjcGlycV93b3JrOworCXN0cnVjdCB3b3JrX3N0cnVjdCBwcm9wZXJ0eV91cGRh
dGVfd29yazsKIAlzdHJ1Y3QgZGVsYXllZF93b3JrIGNhbGxiYWNrX2R3b3JrOwogCXN0cnVjdCBk
ZWxheWVkX3dvcmsgd2F0Y2hkb2dfdGltZXJfZHdvcms7CisJc3RydWN0IGRlbGF5ZWRfd29yayBw
cm9wZXJ0eV92YWxpZGF0ZV9kd29yazsKKwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNv
bm5lY3RvcjsKIAlzdHJ1Y3QgbXV0ZXggbXV0ZXg7CiAKIAlzdHJ1Y3QgbW9kX2hkY3AgaGRjcDsK
QEAgLTQ3LDEwICs1MCwxMiBAQCBzdHJ1Y3QgaGRjcF93b3JrcXVldWUgewogCXN0cnVjdCBtb2Rf
aGRjcF9kaXNwbGF5IGRpc3BsYXk7CiAJc3RydWN0IG1vZF9oZGNwX2xpbmsgbGluazsKIAorCWVu
dW0gbW9kX2hkY3BfZW5jcnlwdGlvbl9zdGF0dXMgZW5jcnlwdGlvbl9zdGF0dXM7CiAJdWludDhf
dCBtYXhfbGluazsKIH07CiAKLXZvaWQgaGRjcF9hZGRfZGlzcGxheShzdHJ1Y3QgaGRjcF93b3Jr
cXVldWUgKmhkY3Bfd29yaywgdW5zaWduZWQgaW50IGxpbmtfaW5kZXgpOwordm9pZCBoZGNwX2Fk
ZF9kaXNwbGF5KHN0cnVjdCBoZGNwX3dvcmtxdWV1ZSAqaGRjcF93b3JrLCB1bnNpZ25lZCBpbnQg
bGlua19pbmRleCwKKwkJICAgICAgc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0
b3IpOwogdm9pZCBoZGNwX3JlbW92ZV9kaXNwbGF5KHN0cnVjdCBoZGNwX3dvcmtxdWV1ZSAqd29y
aywgdW5zaWduZWQgaW50IGxpbmtfaW5kZXgsIHVuc2lnbmVkIGludCBkaXNwbGF5X2luZGV4KTsK
IHZvaWQgaGRjcF9yZXNldF9kaXNwbGF5KHN0cnVjdCBoZGNwX3dvcmtxdWV1ZSAqd29yaywgdW5z
aWduZWQgaW50IGxpbmtfaW5kZXgpOwogdm9pZCBoZGNwX2hhbmRsZV9jcGlycShzdHJ1Y3QgaGRj
cF93b3JrcXVldWUgKndvcmssIHVuc2lnbmVkIGludCBsaW5rX2luZGV4KTsKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
