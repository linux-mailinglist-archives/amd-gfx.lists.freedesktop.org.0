Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7407EC04
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 07:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06426E8AD;
	Fri,  2 Aug 2019 05:23:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750083.outbound.protection.outlook.com [40.107.75.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31C86E8C4
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Aug 2019 05:23:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dx/OAMSiSwyq1psXc+nHyU6xT1lWrIO9lp409KUgVBCy4G4lDUIw2fxwblY5Suo5f3jBMpYk+PtvpnV7xcMYWIj0oDT0rFXaeGUwGJ/mzCkGav6+vUbc1iqnWdoZU5yYncL16v+sThSdB2UnIgbnTcJg4k3n4aaP9DLE+XYImhT3yp+vIrG9Viap0Z7BGD91zxLrO+V7H5oeyPETclHK63xwsIPDzj3fBh/H9unlFbNpQHIiBrxPKDg282x2pEKBQMfw0ke+z5TKrRG6b7Ej2SQqtSz6TcWQ1XIGYmUx+lslLc6bhT9uB0GA6u235p1/2loJzTE/mMJxpErwDtPosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zu1ezeHcZ9GezlvXVA5nnehRQ8Vm630f1RlXpIejumM=;
 b=K5459Hw1qk3/aRG2YjUeJFmBlfo860TaVv5CicgPxEO2OG6HDbnfNs3r87KAMR1joDeQx0JeqCgO00FEjzraQ04xRFdRcpS43YFgkB0D6H1e2oOQLS2P6wxpAP+hQrMAN+LGkial7IOrPLOVqQd47uhuqVlcO/h/dJceNHzO3gn19NI5gdgfUr2bk9/EfT0ZVxfrdmzk4/HeadWoo1qRybuIDFijle3OSKFnQnEHEMC8qg1jx7wWQoUW8B9VGpCML3hSDDg+zrn8x8HBLmts80u1XXFoH1xMIAHKDVlEUu6+Esq6dpMhRYW+b7k6hhO3njueW9dDSch4sxn6nmqRQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=yahoo.co.uk
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CH2PR12CA0012.namprd12.prod.outlook.com (2603:10b6:610:57::22)
 by SN1PR12MB2432.namprd12.prod.outlook.com (2603:10b6:802:27::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17; Fri, 2 Aug
 2019 05:23:09 +0000
Received: from CO1NAM03FT064.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by CH2PR12CA0012.outlook.office365.com
 (2603:10b6:610:57::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.13 via Frontend
 Transport; Fri, 2 Aug 2019 05:23:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT064.mail.protection.outlook.com (10.152.81.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Fri, 2 Aug 2019 05:23:07 +0000
Received: from lnx-glk.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 2 Aug 2019
 00:23:06 -0500
From: likun Gao <likun.gao@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: remove unpin clear_state_obj for gfx v8
Date: Fri, 2 Aug 2019 13:22:14 +0800
Message-ID: <1564723334-18375-1-git-send-email-likun.gao@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(396003)(376002)(2980300002)(428003)(189003)(199004)(47776003)(8936002)(70586007)(53936002)(70206006)(81166006)(81156014)(426003)(26005)(2906002)(53416004)(8676002)(50226002)(14444005)(54906003)(5660300002)(316002)(16586007)(48376002)(50466002)(305945005)(486006)(68736007)(356004)(86362001)(478600001)(6666004)(36756003)(476003)(126002)(2616005)(4326008)(6916009)(51416003)(7696005)(186003)(336012)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2432; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eff2108f-8d37-4fef-0501-08d7170980f1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:SN1PR12MB2432; 
X-MS-TrafficTypeDiagnostic: SN1PR12MB2432:
X-Microsoft-Antispam-PRVS: <SN1PR12MB24329FA0232CC5D31BFC0052EFD90@SN1PR12MB2432.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-Forefront-PRVS: 011787B9DD
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: kP9qRk9r7H2a3WNqlxwX1AZ3hR5B5hkiXN7W7mz6BxGPuE21C2K3ufL/P1nMhtwZJBzYnGjjwnKlWuFlLPT0/g3EjWXIq9dL23Gdjldr7y2XBY+mwDMAWLwoPc2N1ZpR7ZwrqdT6OZLLYrDopDo2A5Kdg96/nKE4CW5tvcmuLKLJX/mU3VRLDeTfSOOHNvXak5o+hHiS2Cj3QXsT/OaVc2n6sU/lOm3T5GUR0VRMInPE9h7zwHFAiCC2VfD4Sl18hh+tAa/HisGMZp1QU8siYb/2CK20fG5Vsfrv/kfVlJo3XUH8LIRsriAlbxTsWpP0bzrCeSn/xmT7cLzzgbRTN8XnPRoEVl0UMVG2bF2STkODlX29hUk9q3mFInln43MSBP1Dh5SuNa1mxnjLzjtfscqA/Ib5b0G9nyQYyFG9TVg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2019 05:23:07.9726 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eff2108f-8d37-4fef-0501-08d7170980f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2432
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zu1ezeHcZ9GezlvXVA5nnehRQ8Vm630f1RlXpIejumM=;
 b=IfKQ0OP3k1Dy6eV7Z00kWukOY6LJ+fpPi2SDmYkchBB85jNm8NnYpS8rDEmYa98vgz99VnUyFOk3bFQk3z++gMKicocj2ikFpXm7DgGUdHK5K19GKyn9/fSlToWHlcmMdJ2VY0LXjSt7/3feQolIGRXgnCNVl82RWfhCI3NY0bw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; yahoo.co.uk; dkim=none (message not signed)
 header.d=none;yahoo.co.uk; dmarc=permerror action=none header.from=amd.com;
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Paul Gover <pmw.gover@yahoo.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGlrdW4gR2FvIDxMaWt1bi5HYW9AYW1kLmNvbT4KClJlbW92ZSB1bnBpbiBybGMgY2xl
YXJfc3RhdGVfb2JqIGZvciBnZnggdjggd2hlbiBybGMgaW5pdCwKd2hpY2ggd2lsbCBtYWtlIFN0
b25leSBwbV9zdXNwZW5kIGhhbmcuCgpTaWduZWQtb2ZmLWJ5OiBMaWt1biBHYW8gPExpa3VuLkdh
b0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMgfCAy
MiArKysrKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjhfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYwppbmRl
eCBkMjkwNzE4Li4wYjczYzZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjhfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMK
QEAgLTEyOTIsNiArMTI5Miw4IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y4XzBfY3BfanVtcF90YWJsZV9u
dW0oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAKIHN0YXRpYyBpbnQgZ2Z4X3Y4XzBfcmxj
X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CisJdm9sYXRpbGUgdTMyICpkc3Rf
cHRyOworCXUzMiBkd3M7CiAJY29uc3Qgc3RydWN0IGNzX3NlY3Rpb25fZGVmICpjc19kYXRhOwog
CWludCByOwogCkBAIC0xMzAwLDEwICsxMzAyLDI0IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y4XzBfcmxj
X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJY3NfZGF0YSA9IGFkZXYtPmdmeC5y
bGMuY3NfZGF0YTsKIAogCWlmIChjc19kYXRhKSB7Ci0JCS8qIGluaXQgY2xlYXIgc3RhdGUgYmxv
Y2sgKi8KLQkJciA9IGFtZGdwdV9nZnhfcmxjX2luaXRfY3NiKGFkZXYpOwotCQlpZiAocikKKwkJ
LyogY2xlYXIgc3RhdGUgYmxvY2sgKi8KKwkJYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9zaXpl
ID0gZHdzID0gYWRldi0+Z2Z4LnJsYy5mdW5jcy0+Z2V0X2NzYl9zaXplKGFkZXYpOworCQlyID0g
YW1kZ3B1X2JvX2NyZWF0ZV9yZXNlcnZlZChhZGV2LCBkd3MgKiA0LCBQQUdFX1NJWkUsCisJCQkJ
CSAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sCisJCQkJCSAgICAgICZhZGV2LT5nZngucmxj
LmNsZWFyX3N0YXRlX29iaiwKKwkJCQkJICAgICAgJmFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVf
Z3B1X2FkZHIsCisJCQkJCSAgICAgICh2b2lkICoqKSZhZGV2LT5nZngucmxjLmNzX3B0cik7CisJ
CWlmIChyKSB7CisJCQlkZXZfd2FybihhZGV2LT5kZXYsICIoJWQpIGNyZWF0ZSBSTEMgYyBibyBm
YWlsZWRcbiIsIHIpOworCQkJYW1kZ3B1X2dmeF9ybGNfZmluaShhZGV2KTsKIAkJCXJldHVybiBy
OworCQl9CisKKwkJLyogc2V0IHVwIHRoZSBjcyBidWZmZXIgKi8KKwkJZHN0X3B0ciA9IGFkZXYt
PmdmeC5ybGMuY3NfcHRyOworCQlhZGV2LT5nZngucmxjLmZ1bmNzLT5nZXRfY3NiX2J1ZmZlcihh
ZGV2LCBkc3RfcHRyKTsKKwkJYW1kZ3B1X2JvX2t1bm1hcChhZGV2LT5nZngucmxjLmNsZWFyX3N0
YXRlX29iaik7CisJCWFtZGdwdV9ib191bnJlc2VydmUoYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0
ZV9vYmopOwogCX0KIAogCWlmICgoYWRldi0+YXNpY190eXBlID09IENISVBfQ0FSUklaTykgfHwK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
