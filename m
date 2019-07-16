Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3DC6A0B9
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 05:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F2C6E086;
	Tue, 16 Jul 2019 03:08:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780040.outbound.protection.outlook.com [40.107.78.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422C96E086
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 03:08:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFTAWzkmPCytJXDdfBYsUHXBABdmj9psFgY2z/Y6EYTCP8hh7a9HS/4gScHiuJAoyNWmjzNvJXlyYwgi55SwYPai+nGF5W9TxxmuOoCSjEWba/xXXQs+FSkW+hWOE4o4PEbF/1c0xvLhGOq1fs0+AMkQ21vr/7X9JxROfvLLjfFHWdNwOnyQ5ltMwKKjVF1R0G58+s53OApjYMoxr1ZI7G5QlvQhi8/0kU68R2oo9HLIJBZu5s14pGVWyuZhsq83IEgp49SjaPSs5RdRu77XxTYyLD6tnhZgPujn0d3lo/JjwJgJ46gfI2SGdWL513g4VXCnWzQMKfdEejPC6lokWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0uLV+gTXy1p6Ih5FIGA7cesOf7H8i6XxrdVgbcyBsY=;
 b=ZWdNde0MtnmNnNRQ13JQx75sdEdH/AOb1WZoh00FxQRnVQdk4jlAu7rZf9BhZR0635TWBhUzd10r/IkLmAXNk1pMRA+KSiopfpq4AEUc7hyHdliZbRD6x/0okaqei0mQN2d0RriBlCU/SJuPJpoXvO1kwRA2EU8pIDeza1sXkIS5+yP9W+9wivn7kR6KDNEsJni9Ko4b3xKLOa4xA0vGveE3AqKdgelQkq47Zr6Dv1QZGLnrnA8RQ1hDdT3lROXi2KOmcBz3hY2G5rOFJxbmYmue5kxvvtjwW/h2aN0pFjJNOtaLmPW/B1cKUZsbWR2bI2tOdVMrGb6LUeM8evakow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from SN1PR12CA0067.namprd12.prod.outlook.com (2603:10b6:802:20::38)
 by BYAPR12MB3094.namprd12.prod.outlook.com (2603:10b6:a03:dc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.11; Tue, 16 Jul
 2019 03:08:53 +0000
Received: from CO1NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by SN1PR12CA0067.outlook.office365.com
 (2603:10b6:802:20::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Tue, 16 Jul 2019 03:08:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT045.mail.protection.outlook.com (10.152.81.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 16 Jul 2019 03:08:52 +0000
Received: from monk-build.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 15 Jul 2019
 22:08:50 -0500
From: Monk Liu <Monk.Liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] SWDEV-196010 Calltrace caught in amdgpu_vm_sdma.c file
Date: Tue, 16 Jul 2019 11:08:46 +0800
Message-ID: <1563246526-22988-1-git-send-email-Monk.Liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(346002)(2980300002)(428003)(189003)(199004)(336012)(316002)(4326008)(6916009)(8936002)(16586007)(5660300002)(478600001)(2906002)(70586007)(2616005)(26005)(81166006)(81156014)(426003)(476003)(8676002)(126002)(4744005)(50226002)(36756003)(53416004)(14444005)(305945005)(7696005)(48376002)(486006)(53936002)(51416003)(356004)(6666004)(47776003)(70206006)(86362001)(186003)(50466002)(68736007)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3094; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43bfca0d-1f83-42f8-f585-08d7099aee9b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB3094; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB3094:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3094C62394FCB8B4C98726B184CE0@BYAPR12MB3094.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:124;
X-Forefront-PRVS: 0100732B76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /84Bgz1OEEpcd0fMVKrZf6HKAr5I9xG/rY5K0JbFaT5nqPfsIdiT37ghOXFPwh8PO90hbBJr4XnocpMXvzeeHU8wizrzM0EoxtwOHOtlP5MxmRmhb3NgzkM7fFr7MLFk1CM9atBP/m5vbxSoLUsMLp5flxjoYeL21YcZKpHiqSkkV1fNvrz+FpT/VNcYtiy9HTJvlmZF/MlIwjHUS/hnHdA4ny1hveMf8hrpcsseNgfRLuiCallQEJKHlBES1JP4VLFPgZX/Bk7EQp01UYWfkFggY/j4FGN4cNfk4szilKE9xgOcnpevF1MEp0Ze2M9dWq9qAU1OQWBHAncWDZe/gpUgzrtyGzQ3tsaQUrUP1MFd6uRLr9xjVrWfqCsZRRXdzJ7+axxEK03irjSiPC0z3JAc1NEEd1gMBplC9TqDX6c=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2019 03:08:52.7114 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43bfca0d-1f83-42f8-f585-08d7099aee9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3094
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0uLV+gTXy1p6Ih5FIGA7cesOf7H8i6XxrdVgbcyBsY=;
 b=jLNZFgPgW71O2w0K9QX0NVNFnLhMprpCNYfbqyMZsbKb1Yk3h331+zv85wjkdRjxubvVwYvV+WTVfq0KTno2clekn5DrPu2TCAKBE2+BZiGWuXYib6ft692Spv9kRRcP6h7CebPzPRPn45j/cckfo8XYcv3rTUTZnmA7f90fLmQ=
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
Cc: Monk Liu <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZG9uJ3QgY29tbWl0IHNkbWEgdm0gam9iIGlmIG5vIHVwZGF0ZXMgbmVlZGVkIGFuZCBmcmVlCnRo
ZSBpYgoKU2lnbmVkLW9mZi1ieTogTW9uayBMaXUgPE1vbmsuTGl1QGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgfCAxMiArKysrKysrKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwppbmRleCBhZWJhOWU2Li5mZjZkMzdlIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwpAQCAtMTMwNCw5ICsxMzA0LDE1IEBAIGlu
dCBhbWRncHVfdm1fdXBkYXRlX2RpcmVjdG9yaWVzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LAogCQkJZ290byBlcnJvcjsKIAl9CiAKLQlyID0gdm0tPnVwZGF0ZV9mdW5jcy0+Y29tbWl0KCZw
YXJhbXMsICZ2bS0+bGFzdF91cGRhdGUpOwotCWlmIChyKQotCQlnb3RvIGVycm9yOworCisJaWYg
KHBhcmFtcy5pYi0+bGVuZ3RoX2R3ID4gMCkgeworCQlyID0gdm0tPnVwZGF0ZV9mdW5jcy0+Y29t
bWl0KCZwYXJhbXMsICZ2bS0+bGFzdF91cGRhdGUpOworCQlpZiAocikKKwkJCWdvdG8gZXJyb3I7
CisJfSBlbHNlIHsKKwkJYW1kZ3B1X3NhX2JvX2ZyZWUoYWRldiwgJnBhcmFtcy5pYi0+c2FfYm8s
IE5VTEwpOworCX0KKwogCXJldHVybiAwOwogCiBlcnJvcjoKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
