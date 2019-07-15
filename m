Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E3869DC6
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCB289CA4;
	Mon, 15 Jul 2019 21:21:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam01on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe41::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD8C89C68
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1UB0i2iSVrlKMwdpHirg//1LIuLwoDVpLJuC2SMQ2I8VKOXiTlXAz2mqY6MK/akS6qhfuKLojz7iXHzzl8G97TF5qoZXskbp783aQ2QkL4lDDiGEmLYoEsuWr/OwPLkDdSFjYVYaTFHeb/3OB17+1Er6ws2PamqPy0LTe9zzK4WjPaevX76MCE+t3v0Z/6Mr048FST6Lw36H5LFI19A1h2afp7VsTFY0pN1+a2yCwQCdP78c2svFPI5w+6gLyQWUupPIggQGPMLHJDEcWqv0jP9cuiMIyOUbVUIvIgHiyDpZVyZNAig7r6cALjhN6/8ieW5yMW+PKXWcgaGCE7AVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ynSaZ7I8hEZ6k0lizKXcrOv/1nMstrMQYglwie2s6M=;
 b=Le28SBe/3ECh/3Wig7JoMc1oFq8/eE53zKnb9C+4kuMxOYLGthnPjboZ7Q5bF8PFudchgCeF6i+gS7VeJnlAiWtGyKZEBGOnUvd181clwUzmD8ac93GMdAZo3hfJ6oJfIqKP76xIK6LkeMyaMluycYkzaptzEkkT8GeliZtbM6sfhLXYACoFoAMznee4QscAQQoRPFO7egJwJXJDHXncjGpApXtkpYTQV0JSN9TMi0QebjRw2OiwGLvH4oy2FbIGkWj+UONRY71vwdICF9V4cFqatROLBstdmuMICdP76fA+wEVQSuJnRUOhyDfqCOCQwxMG1LBsV77iLSiMWHKjzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=amdcloud.onmicrosoft.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0007.namprd12.prod.outlook.com (2603:10b6:208:a8::20)
 by DM6PR12MB3338.namprd12.prod.outlook.com (2603:10b6:5:11f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:42 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by MN2PR12CA0007.outlook.office365.com
 (2603:10b6:208:a8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:41 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:26 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 45/87] drm/amd/display: Remove second initialization of pp_smu
Date: Mon, 15 Jul 2019 17:20:07 -0400
Message-ID: <20190715212049.4584-46-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(2980300002)(428003)(189003)(199004)(8936002)(76176011)(2870700001)(54906003)(51416003)(478600001)(86362001)(4744005)(81156014)(8676002)(4326008)(81166006)(50226002)(2351001)(6916009)(2906002)(49486002)(70586007)(186003)(356004)(70206006)(47776003)(36756003)(5660300002)(336012)(6666004)(316002)(11346002)(1076003)(426003)(2616005)(48376002)(476003)(50466002)(68736007)(2876002)(305945005)(126002)(53936002)(486006)(446003)(26005)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3338; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a760af0-cf57-44f3-f9b3-08d7096a6e76
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB3338; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3338:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3338BB44EB1AA724EA36A71282CF0@DM6PR12MB3338.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: IzDb1+yqntoVWu9FhJXqNvAl9xMqTJ6A8agJQThLwK4EGuuQV+rhxARtOyUCxMGlOXqY089ddq/eARyp5py2YeNPSDzNWp2otI5gIpv+nJDPtdkSiSpOShOBdPvbBTAMVSk/0UKL/Zod+1g9Y1q6sALi85n0J80vvWI1V4yVvLeWDmmVSgq53aL5D1f3wodJtq4BFZCJd+0x/SuyNMsby3wXX1MtALGW0yutQdr8OzqM70/DtOJR+se+tTWMO6XL6x31qyEpigF2vGgB+4MYqWjDLVrkTu7bFpd0OHStYnf+owCRCCeqOLFunB1lzAQ82qFuOS021OrrDFe5GVOi+xP+uOnvoEhvjBiJkIyeLLzhaUQ1JKlCkmDfMrUHdglE9QE8mm/uNsgV+EBXarM3DWGhq8TFEPgJxkDH4GLvPyA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:41.8767 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a760af0-cf57-44f3-f9b3-08d7096a6e76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3338
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ynSaZ7I8hEZ6k0lizKXcrOv/1nMstrMQYglwie2s6M=;
 b=MGDAXLqDDGjUnCHzm9DMj9AGo1c6PWc2qDCQpl3YnIMSxLRN6r1Paw/t3Gev0wDgmffp0cQEOhZyhERFYLklkyP+J0KpR12n4fIoNmMAE4rmtfvfTcV6SK0o6fydOH5HoRRUkhzffs3A8i7wCa1r+HmqvA/ek+KgpOKXYX3VFAQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; amdcloud.onmicrosoft.com; dkim=none (message not
 signed) header.d=none;amdcloud.onmicrosoft.com; dmarc=permerror action=none
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
Cc: Leo Li <sunpeng.li@amd.com>, Jaehyun Chung <Jaehyun.Chung@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWx2aW4gTGVlIDxhbHZpbi5sZWUyQGFtZC5jb20+Cgpbd2h5XQpXZSBpbml0aWFsaXpl
IHBwX3NtdSB0d2ljZQoKW2hvd10KUmVtb3ZlIHNlY29uZCBpbml0aWFsaXphdGlvbiBvZiBwcF9z
bXUKClNpZ25lZC1vZmYtYnk6IEFsdmluIExlZSA8YWx2aW4ubGVlMkBhbWQuY29tPgpSZXZpZXdl
ZC1ieTogSmFlaHl1biBDaHVuZyA8SmFlaHl1bi5DaHVuZ0BhbWQuY29tPgpBY2tlZC1ieTogTGVv
IExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQs
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jCmluZGV4IDQ4NDJjOTE3NzFk
OC4uZTlhN2E3YWYxMWRmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jCkBAIC0zNDYsOCArMzQ2
LDYgQEAgdm9pZCBkY24yMF9jbGtfbWdyX2NvbnN0cnVjdCgKIAogCWNsa19tZ3ItPmJhc2UuZHBy
ZWZjbGtfa2h6ID0gNzAwMDAwOyAvLyA3MDAgTUh6IHBsYW5uZWQgaWYgVkNPIGlzIDMuODUgR0h6
LCB3aWxsIGJlIHJldHJpZXZlZAogCi0JY2xrX21nci0+cHBfc211ID0gcHBfc211OwotCiAJaWYg
KElTX0ZQR0FfTUFYSU1VU19EQyhjdHgtPmRjZV9lbnZpcm9ubWVudCkpIHsKIAkJZGNuMl9mdW5j
cy51cGRhdGVfY2xvY2tzID0gZGNuMl91cGRhdGVfY2xvY2tzX2ZwZ2E7CiAJCWNsa19tZ3ItPmRl
bnRpc3RfdmNvX2ZyZXFfa2h6ID0gMzg1MDAwMDsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
