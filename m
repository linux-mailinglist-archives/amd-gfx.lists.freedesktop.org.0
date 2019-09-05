Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A48A9890
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 04:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFCA89CB2;
	Thu,  5 Sep 2019 02:50:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820043.outbound.protection.outlook.com [40.107.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230D089CB2
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 02:50:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxG1WHlxw8s8mLZ4odOlzGbG5REe7p21eW/qwwwt8oUmo7rMJsHujY2fOMqVQsLtfUtsPtncuPoK9aDLSNQl6dQQ54/nIMc67vVIxYyobFHmeiwTldaF+wIlAqxHXaWwnK7qUQXtRLmpuU65QEe2iJ35yC46rypJULwQrE1ArBSyWm/3zV774qhtSqXnNxRcQx/k5lDYyAyytNe3YGu19xRtG/IF9vggbPF6Ds7AxykAcCJKisXyRkFGv0NQvrerWBajGEf//IrCHDvMVNUuXZACT81R1TXJgp+jR+Amxt0+7CJ7F3DLxPjSoAP4Zkn5TkRJ7cGFL0R80EEL7Qq39g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucwtjttFs1UJ9abiVTV7aQhr/Nylrd9+9uXghG7VDOQ=;
 b=k8iSui1xWzNdW0BzzAzja0ii3MdhelhyNG/uZCl8ynQ/lF2UDUiWatSAYpuwg39OXJ9expO2K/lgRcUMf+wCUV0lx9sRxOi9hiygpf3VmgPOA42BRjqLlzlcxtcESVGyHrUdA7v8vw8dmE8SRTZ2MvkSyUNsCR3gkPtsTiqB1VTj/l374l5PQuBECAZndxr+WMuLdmgoPZUN4Yf5lMO7ubx5l38MGrd0Wb4xNgf/DNFOAV4EzBDGDhlKeG5kzMpnVoTPUN0AqUERozSNh459z5as5EaKVBgLAqv6rkQKx0Pu61gxl8eEciMcgbmn9weBGiLrdrG29IwmXI0ty70jew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0005.namprd12.prod.outlook.com (20.179.80.18) by
 DM6PR12MB4329.namprd12.prod.outlook.com (10.141.184.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Thu, 5 Sep 2019 02:50:29 +0000
Received: from DM3NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by MN2PR12CA0005.outlook.office365.com
 (2603:10b6:208:a8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.13 via Frontend
 Transport; Thu, 5 Sep 2019 02:50:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT003.mail.protection.outlook.com (10.152.82.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Thu, 5 Sep 2019 02:50:28 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 4 Sep 2019 21:50:26 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdgpu: Add smu lock around in pp_smu_i2c_bus_access
Date: Wed, 4 Sep 2019 22:50:16 -0400
Message-ID: <1567651818-7911-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(70206006)(53936002)(53416004)(70586007)(50226002)(48376002)(50466002)(2351001)(86362001)(4326008)(2906002)(36756003)(16586007)(44832011)(186003)(81166006)(81156014)(8936002)(126002)(305945005)(26005)(6916009)(8676002)(486006)(476003)(2616005)(6666004)(356004)(47776003)(14444005)(426003)(5660300002)(336012)(54906003)(7696005)(51416003)(478600001)(316002)(70780200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4329; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61a4240d-86a2-4d1f-fdb4-08d731abcfb7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB4329; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB4329:
X-Microsoft-Antispam-PRVS: <DM6PR12MB43293FB5C0F4765332A1E8F4EABB0@DM6PR12MB4329.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-Forefront-PRVS: 015114592F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: GO3/UiV/cK3k7+56yBPDC9LchNfbrXD7s5nO3NOMRKv7uDLA+v48WOkXIQwSGq1fU3hHDyZGhJ713EpLZRdLGOcTLaKxF8aZi1jkMswR6QtZMsxnl2xqhvVz9nSdr0oWAzcDp6VZBoa7UcxDwiTD/T1WKB0XBcArdH9KHbcrv8Ey0u7WmgR97v/rZptQbXfgfAsGyJUBoDZepiTQDAKJFhd9Iyt8rdy/JI+1m+mJrTRSX2ogo/4KwGSYuO24PjC93Q7yvFBk7F7O/7UFgHyGU/Dmcd0hRMHWulVqRiv/KijsE8MTYPXkAsRLrZ5EZ46mNd+7iyT0GdTVPdbj4ZC3pLT2O9micmCpo+z4f0M4E5T9rL/DmUeUEXDUocmEdM460aUXIpOZ2D+q4L8Y5QUI889z6zFD3mpcCv4xNT8VFuI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2019 02:50:28.8793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a4240d-86a2-4d1f-fdb4-08d731abcfb7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4329
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucwtjttFs1UJ9abiVTV7aQhr/Nylrd9+9uXghG7VDOQ=;
 b=L/xm/0cpzsEMk7llRHF453PsRtOgr4fEHmi95EMKUpJBqkI9q7MUM7nkfnhvmBo/8nYCDeykrLQB43QZFt0lMZPN7AA6y8j/INyBaIYDn2rIJyaYOWx0D5AYtuxSb9VYv8sXHf22TQwatGt+cTN27SgaqSir6HrQw70/SeebqSM=
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Guchun.Chen@amd.com,
 Cristian.Saceleanu@amd.com, Tao.Zhou1@amd.com, alexdeucher@gmail.com,
 Hawking.Zhang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UHJvdGVjdCBmcm9tIGNvbmN1cnJlbnQgU01VIGFjY2Vzc2VzLgoKU2lnbmVkLW9mZi1ieTogQW5k
cmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kX3Bvd2VycGxheS5jIHwgNyArKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kX3Bvd2VycGxheS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvYW1kX3Bvd2VycGxheS5jCmluZGV4IGZhNjM2Y2IuLmZhOGFkN2Qg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXku
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMKQEAg
LTE1MzEsNiArMTUzMSw3IEBAIHN0YXRpYyBpbnQgcHBfYXNpY19yZXNldF9tb2RlXzIodm9pZCAq
aGFuZGxlKQogc3RhdGljIGludCBwcF9zbXVfaTJjX2J1c19hY2Nlc3Modm9pZCAqaGFuZGxlLCBi
b29sIGFjcXVpcmUpCiB7CiAJc3RydWN0IHBwX2h3bWdyICpod21nciA9IGhhbmRsZTsKKwlpbnQg
cmV0ID0gMDsKIAogCWlmICghaHdtZ3IgfHwgIWh3bWdyLT5wbV9lbikKIAkJcmV0dXJuIC1FSU5W
QUw7CkBAIC0xNTQwLDcgKzE1NDEsMTEgQEAgc3RhdGljIGludCBwcF9zbXVfaTJjX2J1c19hY2Nl
c3Modm9pZCAqaGFuZGxlLCBib29sIGFjcXVpcmUpCiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAot
CXJldHVybiBod21nci0+aHdtZ3JfZnVuYy0+c211X2kyY19idXNfYWNjZXNzKGh3bWdyLCBhY3F1
aXJlKTsKKwltdXRleF9sb2NrKCZod21nci0+c211X2xvY2spOworCXJldCA9IGh3bWdyLT5od21n
cl9mdW5jLT5zbXVfaTJjX2J1c19hY2Nlc3MoaHdtZ3IsIGFjcXVpcmUpOworCW11dGV4X3VubG9j
aygmaHdtZ3ItPnNtdV9sb2NrKTsKKworCXJldHVybiByZXQ7CiB9CiAKIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgYW1kX3BtX2Z1bmNzIHBwX2RwbV9mdW5jcyA9IHsKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
