Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CAC16F34
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 04:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0606E864;
	Wed,  8 May 2019 02:46:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690070.outbound.protection.outlook.com [40.107.69.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBF26E868
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 02:46:17 +0000 (UTC)
Received: from BN8PR12CA0031.namprd12.prod.outlook.com (2603:10b6:408:60::44)
 by DM5PR12MB1147.namprd12.prod.outlook.com (2603:10b6:3:79::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.11; Wed, 8 May
 2019 02:46:15 +0000
Received: from DM3NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by BN8PR12CA0031.outlook.office365.com
 (2603:10b6:408:60::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Wed, 8 May 2019 02:46:15 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT008.mail.protection.outlook.com (10.152.82.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Wed, 8 May 2019 02:46:14 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 7 May 2019
 21:46:12 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 8/9] drm/amdgpu: add basic func for RLC program reg
Date: Wed, 8 May 2019 10:45:40 +0800
Message-ID: <1557283541-7877-9-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557283541-7877-1-git-send-email-Trigger.Huang@amd.com>
References: <1557283541-7877-1-git-send-email-Trigger.Huang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(396003)(39860400002)(376002)(136003)(2980300002)(428003)(199004)(189003)(26005)(77096007)(2616005)(476003)(7696005)(6916009)(70206006)(446003)(426003)(54906003)(11346002)(72206003)(186003)(53936002)(68736007)(16586007)(4326008)(81156014)(81166006)(36756003)(336012)(316002)(8936002)(8676002)(47776003)(478600001)(50226002)(53416004)(14444005)(70586007)(486006)(5660300002)(51416003)(305945005)(2906002)(356004)(86362001)(126002)(2351001)(76176011)(6666004)(50466002)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1147; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8bbaf71-3bb0-4093-12da-08d6d35f56b5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR12MB1147; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1147:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1147F8AC4292E411C82B9D84FE320@DM5PR12MB1147.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: MuyGfB9LbzjuIbHrSDwbUiR2C098NX+3xT8FhTPDEJ4pdTW+yUmH0KYiCOKZx1pPnVxaJRuTowJ1otGmRTeb1U8a4jeuXMw+3QPk5L2A+Uvepazs+tZ/frUjCmLMXieXjjTq6jcC2NjWEto38+HRvubyxeNrwQmveOfR2HnOluD8EIh6IRqXC0p2WqkuHLn3h70nEjTNnCys3ozQa/gf5cN+7tCsx0KJTOH0Y6nFRqcwmZq+i2qu656LdHnUFpvLrFOXV9DeSjjHLE0WDuL3f7k1hvv1HbhO3+1QCDPHwkr/yGFOoxIBrJQSowPwM7Jt9JoP1e3hzD7XfLx+i1hqFkSVsdgtBYD/QC+9mmkf3lDWnZSh4pp4XkXUGWSAzPA0J4Ne4cANO/rzZzviilZpUiH8UnsLKfUUw2HacdSXxic=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 02:46:14.7413 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bbaf71-3bb0-4093-12da-08d6d35f56b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1147
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=At5asJMp1C7CATKfbWV6q+vvPsGqZqSCcquNTu7W3K4=;
 b=XqhQfWnQuulWwElIqn0prOJWf5J/rXDFWSxaSahBhfBtpyKTppOF+GGeMtGh4KvEcUHbPO7F3B+o+TZ6ByJ3MtcqJM3cTShknnSvPEqiSwlvoRzaBNFirJ/c733nuEaeUeJbeW+98iUPrxlkShKNNWX6+VDP2+4hjrVjYCoglmI=
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
Cc: Daniel.Wang2@amd.com, Rashid.Sohail@amd.com, Trigger.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TmV3IGZlYXR1cmUgZm9yIFJMQywgc29tZSByZWdpc3RlcnMgY2FuIGJlIHByb2dyYW1tZWQgYnkK
UkxDIGludGVyZmFjZSB1bmRlciBTUi1JT1YgVkY6CgpXUkVHMzJfU09DMTVfUkxDX1NIQURPVzoK
CTEsIGZvciBHUkJNX0dGWF9DTlRMLCBmaXJzdGx5IHRoZSBuZXcgcmVnaXN0ZXIgdmFsdWUgc2hv
dWxkIGJlIGJlCgkJcHJvZ3JhbW1lZCB0byBTQ1JBVENIX1JFRzIKCTEsIGZvciBHUkJNX0dGWF9J
TkRFWCwgZmlyc3RseSB0aGUgbmV3IHJlZ2lzdGVyIHZhbHVlIHNob3VsZCBiZSBiZQoJCXByb2dy
YW1tZWQgdG8gU0NSQVRDSF9SRUczCgpXUkVHMzJfUkxDOgoJZm9yIHJlZ2lzdGVycyBzdXBwb3J0
ZWQgdG8gYmUgcHJvZ3JhbW1lZCBieSBSTEMgaW50ZXJmYWNlLCB0aGUKCWZvbGxvd2luZyBzZXF1
ZW5jZSBzaG91bGQgYmUgdXNlZDoKCQkxLCB3cml0ZSB0aGUgdmFsdWUgdG8gU0NSQVRDSF9SRUcw
CgkJMiwgd3JpdGUgcmVnIHwgMHg4MDAwMDAwMCB0byBTQ1JBVENIX1JFRzEKCQkzLCB3cml0ZSAw
eDEgdG8gUkxDX1NQQVJFX0lOVCB0byBub3RpZnkgUkxDCgkJNCwgcG9sbGluZyBTQ1JBVENIX1JF
RzEgdG8gY2hlY2sgaWYgZmluaXNoZWQKCkNoYW5nZS1JZDogSTUwMTdkMmNjMTBkNDc1YTJmOGY3
MjA0YjgwNDNiM2U1Zjg3MDM0OGIKU2lnbmVkLW9mZi1ieTogVHJpZ2dlciBIdWFuZyA8VHJpZ2dl
ci5IdWFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1X2Nv
bW1vbi5oIHwgNTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDU2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNV9jb21tb24uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NvYzE1X2NvbW1vbi5oCmluZGV4IDQ5YzI2MjUuLmM2MzQ2MDYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1X2NvbW1vbi5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1X2NvbW1vbi5oCkBAIC04OSw2ICs4OSw2MSBAQAogCQkJ
KHNyYW1fc2VsIDw8IFVWRF9EUEdfTE1BX0NUTF9fU1JBTV9TRUxfX1NISUZUKSk7IFwKIAl9IHdo
aWxlICgwKQogCi0jZW5kaWYKIAorI2RlZmluZSBXUkVHMzJfUkxDKHJlZywgdmFsdWUpIFwKKwlk
byB7CQkJCQkJCVwKKwkJaWYgKGFtZGdwdV92aXJ0X3N1cHBvcnRfcmxjX3ByZ19yZWcoYWRldikp
IHsgICAgXAorCQkJdWludDMyX3QgaSA9IDA7CVwKKwkJCXVpbnQzMl90IHJldHJpZXMgPSA1MDAw
MDsJXAorCQkJdWludDMyX3QgcjAgPSBhZGV2LT5yZWdfb2Zmc2V0W0dDX0hXSVBdWzBdW21tU0NS
QVRDSF9SRUcwX0JBU0VfSURYXSArIG1tU0NSQVRDSF9SRUcwOwlcCisJCQl1aW50MzJfdCByMSA9
IGFkZXYtPnJlZ19vZmZzZXRbR0NfSFdJUF1bMF1bbW1TQ1JBVENIX1JFRzFfQkFTRV9JRFhdICsg
bW1TQ1JBVENIX1JFRzE7CVwKKwkJCXVpbnQzMl90IHNwYXJlX2ludCA9IGFkZXYtPnJlZ19vZmZz
ZXRbR0NfSFdJUF1bMF1bbW1STENfU1BBUkVfSU5UX0JBU0VfSURYXSArIG1tUkxDX1NQQVJFX0lO
VDsJXAorCQkJV1JFRzMyKHIwLCB2YWx1ZSk7CVwKKwkJCVdSRUczMihyMSwgKHJlZyB8IDB4ODAw
MDAwMDApKTsJXAorCQkJV1JFRzMyKHNwYXJlX2ludCwgMHgxKTsJXAorCQkJZm9yIChpID0gMDsg
aSA8IHJldHJpZXM7IGkrKykgewlcCisJCQkJdTMyIHRtcCA9IFJSRUczMihyMSk7CVwKKwkJCQlp
ZiAoISh0bXAgJiAweDgwMDAwMDAwKSkJXAorCQkJCQlicmVhazsJXAorCQkJCXVkZWxheSgxMCk7
CVwKKwkJCX0JXAorCQkJaWYgKGkgPj0gcmV0cmllcykJXAorCQkJCXByX2VycigidGltZW91dDog
cmxjZyBwcm9ncmFtIHJlZzoweCUwNXggZmFpbGVkICFcbiIsIHJlZyk7CVwKKwkJfSBlbHNlIHsJ
XAorCQkJV1JFRzMyKHJlZywgdmFsdWUpOyBcCisJCX0JXAorCX0gd2hpbGUgKDApCisKKyNkZWZp
bmUgV1JFRzMyX1NPQzE1X1JMQ19TSEFET1coaXAsIGluc3QsIHJlZywgdmFsdWUpIFwKKwlkbyB7
CQkJCQkJCVwKKwkJdWludDMyX3QgdGFyZ2V0X3JlZyA9IGFkZXYtPnJlZ19vZmZzZXRbaXAjI19I
V0lQXVtpbnN0XVtyZWcjI19CQVNFX0lEWF0gKyByZWc7XAorCQlpZiAoYW1kZ3B1X3ZpcnRfc3Vw
cG9ydF9ybGNfcHJnX3JlZyhhZGV2KSkgeyAgICBcCisJCQl1aW50MzJfdCByMiA9IGFkZXYtPnJl
Z19vZmZzZXRbR0NfSFdJUF1bMF1bbW1TQ1JBVENIX1JFRzFfQkFTRV9JRFhdICsgbW1TQ1JBVENI
X1JFRzI7CVwKKwkJCXVpbnQzMl90IHIzID0gYWRldi0+cmVnX29mZnNldFtHQ19IV0lQXVswXVtt
bVNDUkFUQ0hfUkVHMV9CQVNFX0lEWF0gKyBtbVNDUkFUQ0hfUkVHMzsJXAorCQkJdWludDMyX3Qg
Z3JibV9jbnRsID0gYWRldi0+cmVnX29mZnNldFtHQ19IV0lQXVswXVttbUdSQk1fR0ZYX0NOVExf
QkFTRV9JRFhdICsgbW1HUkJNX0dGWF9DTlRMOyAgIFwKKwkJCXVpbnQzMl90IGdyYm1faWR4ID0g
YWRldi0+cmVnX29mZnNldFtHQ19IV0lQXVswXVttbUdSQk1fR0ZYX0lOREVYX0JBU0VfSURYXSAr
IG1tR1JCTV9HRlhfSU5ERVg7ICAgXAorCQkJaWYgKHRhcmdldF9yZWcgPT0gZ3JibV9jbnRsKSBc
CisJCQkJV1JFRzMyKHIyLCB2YWx1ZSk7CVwKKwkJCWVsc2UgaWYgKHRhcmdldF9yZWcgPT0gZ3Ji
bV9pZHgpIFwKKwkJCQlXUkVHMzIocjMsIHZhbHVlKTsJXAorCQkJV1JFRzMyKHRhcmdldF9yZWcs
IHZhbHVlKTsJXAorCQl9IGVsc2UgewlcCisJCQlXUkVHMzIodGFyZ2V0X3JlZywgdmFsdWUpOyBc
CisJCX0JXAorCX0gd2hpbGUgKDApCisKKyNkZWZpbmUgV1JFRzMyX1NPQzE1X1JMQyhpcCwgaW5z
dCwgcmVnLCB2YWx1ZSkgXAorCWRvIHsJCQkJCQkJXAorCQkJdWludDMyX3QgdGFyZ2V0X3JlZyA9
IGFkZXYtPnJlZ19vZmZzZXRbR0NfSFdJUF1bMF1bcmVnIyNfQkFTRV9JRFhdICsgcmVnO1wKKwkJ
CVdSRUczMl9STEModGFyZ2V0X3JlZywgdmFsdWUpOyBcCisJfSB3aGlsZSAoMCkKKworI2RlZmlu
ZSBXUkVHMzJfRklFTEQxNV9STEMoaXAsIGlkeCwgcmVnLCBmaWVsZCwgdmFsKSAgIFwKKyAgICBX
UkVHMzJfUkxDKChhZGV2LT5yZWdfb2Zmc2V0W2lwIyNfSFdJUF1baWR4XVttbSMjcmVnIyNfQkFT
RV9JRFhdICsgbW0jI3JlZyksIFwKKyAgICAoUlJFRzMyKGFkZXYtPnJlZ19vZmZzZXRbaXAjI19I
V0lQXVtpZHhdW21tIyNyZWcjI19CQVNFX0lEWF0gKyBtbSMjcmVnKSBcCisgICAgJiB+UkVHX0ZJ
RUxEX01BU0socmVnLCBmaWVsZCkpIHwgKHZhbCkgPDwgUkVHX0ZJRUxEX1NISUZUKHJlZywgZmll
bGQpKQorCisjZGVmaW5lIFdSRUczMl9TT0MxNV9PRkZTRVRfUkxDKGlwLCBpbnN0LCByZWcsIG9m
ZnNldCwgdmFsdWUpIFwKKyAgICBXUkVHMzJfUkxDKCgoYWRldi0+cmVnX29mZnNldFtpcCMjX0hX
SVBdW2luc3RdW3JlZyMjX0JBU0VfSURYXSArIHJlZykgKyBvZmZzZXQpLCB2YWx1ZSkKIAorI2Vu
ZGlmCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
