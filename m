Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23608BEDA5
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 10:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB4C6EDCC;
	Thu, 26 Sep 2019 08:43:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770047.outbound.protection.outlook.com [40.107.77.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD58E6EDCC
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 08:43:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epAW6ccpYs4HS/A6oNVREZknAO1pKofR+/pkY6w8y+PMce847CLBGlcWM0DROUrk0dcNNhq92WAW2Z5TwNeYrwtAUiUYBHyA0/95sIju0qZEj6RwApv4tZVTGO0i0ZpZSuIqc89kEEVel27IFzdPbN+FZ9DAMh5I7cZ7RARyY/NiAin141cMEjVJ0VVvyqSnWF6Mg4gxg8xXADyA+x7ijFOwNFyq1Koj4krEhQcd2PHeXI3pSTOdKC1+KKKDBVyoX+UmU9HPjMd9JlUtVTs2XQ3+ybRVS6JdMeq7GLdAZjLFZ1FGA9Q0/5CdiTub6gDkhcs0IdoRg0FJiDcPCwhQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+O7Qxbh80pY0AB32Xj7B4toN0TPUerCG5v3AbKemw0=;
 b=RcgTJQJNY1YIFSO8DCxPJJ7aoWsEilueeIHTylAOVbHu6jJ6+fKZyuaVRG+FenqlrZlsd5jC5n3MdH7VpGU9s1sLJU4p6RFLfa9xerVV5GoItr23OzxuoSxv3fa1Esq45B/JdEmvDJMAmwGFAxXinva5aYIdiC3IXTNDoNCAIVCNjMZPwg3h/b4KFZjx+VGbT6ie/xov3jVWBxxBO68m2LPNrlaTw80tsdAJnnwqvmb8F3hIb1tI9xb4nlUYmNRKuy8ZGr4IR4gL77tl0cE7AlKLBN1rSemg3jlFfjXjObll338vQs3RZ+658lX/pbBjFxd5EKCIrrQmLWidjkbeYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0055.namprd12.prod.outlook.com (2603:10b6:0:56::23) by
 DM6PR12MB3273.namprd12.prod.outlook.com (2603:10b6:5:188::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Thu, 26 Sep 2019 08:43:37 +0000
Received: from BY2NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by DM3PR12CA0055.outlook.office365.com
 (2603:10b6:0:56::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Thu, 26 Sep 2019 08:43:37 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT017.mail.protection.outlook.com (10.152.84.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 26 Sep 2019 08:43:36 +0000
Received: from lnx-kenneth.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 26 Sep 2019
 03:43:36 -0500
From: Kenneth Feng <kenneth.feng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/amdgpu: disable MMHUB PG for navi10
Date: Thu, 26 Sep 2019 16:43:31 +0800
Message-ID: <1569487411-24923-1-git-send-email-kenneth.feng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(136003)(376002)(346002)(396003)(428003)(189003)(199004)(47776003)(48376002)(36756003)(53416004)(356004)(6666004)(81166006)(316002)(81156014)(2351001)(16586007)(70586007)(70206006)(8676002)(50226002)(4326008)(86362001)(2906002)(8936002)(486006)(5660300002)(6916009)(4744005)(336012)(26005)(305945005)(126002)(476003)(2616005)(44832011)(426003)(7696005)(51416003)(186003)(478600001)(50466002)(14444005)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3273; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efbc7131-fc01-442a-ed96-08d7425d9f5e
X-MS-TrafficTypeDiagnostic: DM6PR12MB3273:
X-Microsoft-Antispam-PRVS: <DM6PR12MB32733C29B4A35902F371BBD28E860@DM6PR12MB3273.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 0172F0EF77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: weyKLnqsXlA1FcfxCipXQkToQhZyiVM+j+sjkQRCi9IOACYsPUH24c3TG5ZpT/K51C7FMfMCph2CrYo0ZFVTBuZwBe0JLx4SHzeJLu3heteZEv14tKBYH5wxWVPioOaBEw3Meaoz8hYg6S+Hm3I5C6FBoxo6Jjg94qwIuuNjoa8Fmvc+oNQNW0F/H9hWWnGSVXvTtW442iLz6jv3ZOxDsVWP4c5oPsrDOZLghQoV+x/2NjCoQf7oY5d0TVp+YYYZi6fQ8H+NTYb2lAKmvgGAEmAJY0xfOj4r+1Bw4pAaWJ34lDRL/qfxIoHH4R/UK+mR6IEiAI/9UFdGw+uRLl84VTsuUZfxepyRsuRceBnXftVD9QhuHnWMk1mVHV/z+rypj5qXNPz5/1KyW+PG+v/ggT0xAMifZKdQ/u9dv0WuOmQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2019 08:43:36.6782 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efbc7131-fc01-442a-ed96-08d7425d9f5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3273
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+O7Qxbh80pY0AB32Xj7B4toN0TPUerCG5v3AbKemw0=;
 b=otbL+xktxI6/SI6658kSNZ+Iw9oyHoZo7EHL0vUCWhnQnKTaNtddIQVDSW3/CxnvaNrNbG6XkNTNYl+AkLgEuCsdCYIpR50dMFANAmvBN9QsOvHIFkkRUEHDVDhSkjppr4UHBgn3vS35UMa7VX/Nvy8Ce5R03IGFuwXtbQnOF7g=
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
Cc: Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RGlzYWJsZSBNTUhVQiBQRyBmb3IgbmF2aTEwIGFjY29yZGluZyB0byB0aGUgcHJvZHVjdGlvbiBy
ZXF1aXJlbWVudC4KClNpZ25lZC1vZmYtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyB8IDEgLQogMSBmaWxl
IGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9udi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwppbmRleCBkNGEy
MDEyLi40NmY0MDJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKQEAgLTYxNiw3ICs2MTYsNiBA
QCBzdGF0aWMgaW50IG52X2NvbW1vbl9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJCUFNRF9D
R19TVVBQT1JUX0JJRl9MUzsKIAkJYWRldi0+cGdfZmxhZ3MgPSBBTURfUEdfU1VQUE9SVF9WQ04g
fAogCQkJQU1EX1BHX1NVUFBPUlRfVkNOX0RQRyB8Ci0JCQlBTURfUEdfU1VQUE9SVF9NTUhVQiB8
CiAJCQlBTURfUEdfU1VQUE9SVF9BVEhVQjsKIAkJYWRldi0+ZXh0ZXJuYWxfcmV2X2lkID0gYWRl
di0+cmV2X2lkICsgMHgxOwogCQlicmVhazsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
