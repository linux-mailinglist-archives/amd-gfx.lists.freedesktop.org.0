Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABEB9C80D
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 05:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C2B8987A;
	Mon, 26 Aug 2019 03:55:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780081.outbound.protection.outlook.com [40.107.78.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B8E8987A
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 03:55:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYRv8+W0PHv5ZcqH/i+408IDg7Poqm0XnRyFqDoAjXBnOUmwwx3bPcr9IaIGwqqFE0FQF2fSBPeRlFNiLffiI6SyS/X+a1RHdwQPc7agknCVtCwMJdq8oeW0XpmaEM2j3TW5W4+m9EKa50itXlrqVmSl0r2AUUektzNiO2KaInJNtDFG05lGIyQUydbFogWH7c7DZ4TyXRiiSL/2YtSR2INcoMyJJXGC0MndZHTNdwyzI1ntgoMN3/0RF2YI+BKs28+8G0qkC7N/miWHClnS9BJR+4F0vXsw5SopKW4T4la66bjBfwxroHTTvAP3iRjJZmoaoufzL/1ijMPV+TxM7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Y3mgB65mZgp2u74KYPLGrSbd6kpzKwW49aFuuGoSZM=;
 b=CwBDzuUsXMzdCV81tXSNOlkmYJBBp37VJlBR58wm5wGyLRffnSuNfLvobCLebrfZzdgZTI5hY2qxM6I/Dxu7eKbrOXpTdrQqEmAlaJOKGyXQ1FNsUiYHkXbcjNcSGV9p1gySTbMjnoMR986x7wiDsX194Rs4EIsnK2Y9NBPnU9jUT8QjGGhWAHt3uK6a34/mzpMxGatOs6NIXHgAX9D2cK+2VIEXnV/f5pWVoVM0R32Je48egqZ1JvWTtPLIaqLfZBA8Fok6RzFSXNE8SNJqIhw9GNsPzyUBZ+sQYwjBfL2WH6lSteY2OO99iKuW+1W6FYZNif7m9ifLvuUojBDLrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0017.namprd12.prod.outlook.com (2603:10b6:408:60::30)
 by DM5PR12MB1276.namprd12.prod.outlook.com (2603:10b6:3:79::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19; Mon, 26 Aug
 2019 03:55:11 +0000
Received: from DM3NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by BN8PR12CA0017.outlook.office365.com
 (2603:10b6:408:60::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.15 via Frontend
 Transport; Mon, 26 Aug 2019 03:55:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT061.mail.protection.outlook.com (10.152.83.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 03:55:10 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Sun, 25 Aug 2019 22:55:08 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 0/8] drm/amdgpu: enable dedicated ras controller interrupt
Date: Mon, 26 Aug 2019 11:54:52 +0800
Message-ID: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(2980300002)(428003)(199004)(189003)(305945005)(70206006)(70586007)(316002)(426003)(110136005)(16586007)(14444005)(36756003)(26005)(48376002)(50466002)(186003)(336012)(356004)(6666004)(8676002)(8936002)(81166006)(81156014)(486006)(2616005)(47776003)(4326008)(53416004)(126002)(2906002)(7696005)(476003)(51416003)(6636002)(53936002)(5660300002)(50226002)(478600001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15a71a3c-7ac8-41fe-9973-08d729d9311e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR12MB1276; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12760CEDB6B80D6EE7429A1BFCA10@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: M1edzh4UQTgAV4wuJ4lgHoDSryTCg2TmFkghJsKHhcD43W4pMbXJms+zlhRg9RTWsZaDqKj9aJb80VOb6nNXJn/pDqDyTnqJ75fRA2ZTCF5s9h6XjjZaNGu3OPrVOQ5lND2fNfxr4YGMDcQvf1h5cMtmqSKeChm26h02GDsHgkGVYuU3EKD6cxYYLscH+FI1SBhxD3rW5M1VFHUM86+t1Aap1bN82t4oMrLrV6HKKPBniFelfWlOSjcYNryQumSUpH5KXqpu/0Blf/hT79nYIHpqxhoX0cVcPXx1zy4JKuKSMy/xEriGAvg9unjqGzdr1aDzCNhZtYXgxmVnrlkOiGDjyZWm+vOfXZpBtH8v8/RQ412cWRYK9xUiKYK9OR3NPArjZyxf2pIOCYiUrd2vQC7Jvn3ekIz0thslQ7UlkLQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 03:55:10.3904 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a71a3c-7ac8-41fe-9973-08d729d9311e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Y3mgB65mZgp2u74KYPLGrSbd6kpzKwW49aFuuGoSZM=;
 b=u+J9X5XaDZe9rvkQEEtKn+Z0bqrKQVEUS/bK9UuBCQV7QsO/clU2M6gxkZyXveByT52ymRW6IyM+0ZoulKfVUfwaJvC5s7TQBh6RKyaUtV2SzEbpPu9pnAOpj+0Bd/+W3vm1YGz6I+MWszDgcSAgz3L3tTUidiky/i9xMsy+VSQ=
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

cmFzX2NvbnRyb2xsZXJfaW50ZXJydXB0IGFuZCBTRFAgZXJyX2V2ZW50X2F0aHViX2ludGVycnVw
dCBhcmUgdHdvIGRlZGljYXRlZCBpbnRlcnJ1cHQgZm9yIFZHMjAgUkFTIGNvbnRyb2xsZXIKCnJh
c19jb250cm9sbGVyIGludGVycnVwdCB3aWxsIGJlIHRyaWdnZXJlZCB3aGVuIHRoZXJlIGlzIE5C
SUYgZXJyb3IuIERyaXZlciBjYW4gbGV2ZXJhZ2UgdGhpcyBpbnRlcnJ1cHQgdG8gcXVlcnkgYW5k
IGxvZyBuZWNlc3NhcnkgZXJyb3IgY291bnQgYW5kIG90aGVyIGluZm9ybWF0aW9uLgoKZXJyX2V2
ZW50X2F0aHViIGludGVycnVwdCB3aWxsIGJlIHRyaWdnZXJlZCB3aGVuIHNkcCBlcnJfZXZlbnQg
cmVjZWl2ZWQgZnJvbSBBVEhVQi4gVGhpcyBpcyBhbiB2ZXJ5IGltcG9ydGFudCByYXMgaW50ZXJy
dXB0IGZvciBhbGwgaHcgYmxvY2sgKGV4Y2VwdCBCSUYgYW5kIFNETUEpIHdoZW4gdW5jb3JyZWN0
YWJsZSBlcnJvciBoYXBwZW5zIGFuZCBodyBwcm9iYWJseSBmcmVlemUuIERyaXZlciBjYW4gbGV2
ZXJhZ2UgdGhpcyBpbnRlcnJ1cHQgdG8gcXVlcnkgYW5kIGxvZyBuZWNlc3NhcnkgZXJyb3IgY291
bnQgYmVmb3JlIHJlc2V0IEdQVS4KCkJJRiByaW5nIHdhcyBkZXNpZ25lZCBhbmQgZGVkaWNhdGVk
IGZvciBib3RoIGludGVycnVwdHMuIEhvd2V2ZXIsIGl0IGNhbid0IGJlIGVuYWJsZWQgZHVlIHRv
IGtub3duIEhXIGJ1Zy4gRHJpdmVyIGhhcyB0byBwb2xsIEJJRl9ET09SQkVMTF9JTlRfQ05UTCBy
ZWdpc3RlciB0byBjaGVjayB3aGV0aGVyIHRoZSBpbnRlcnJ1cHQgaXMgdHJpZ2dlcmVkIG9yIG5v
dC4KCkhhd2tpbmcgWmhhbmcgKDgpOgogIGRybS9hbWRncHU6IGFkZCBuZXcgYW1kZ3B1IG5iaW8g
aGVhZGVyIGZpbGUKICBkcm0vYW1kZ3B1OiBzd2l0Y2ggdG8gbmV3IGFtZGdwdV9uYmlvIHN0cnVj
dHVyZQogIGRybS9hbWRncHUvbmJpbzogYWRkIGZ1bmN0aW9ucyB0byBxdWVyeSByYXMgc3BlY2lm
aWMgaW50ZXJydXB0IHN0YXR1cwogIGRybS9hbWRncHU6IGFkZCBuYmlmIHY3XzQgaXJxIHNvdXJj
ZSBoZWFkZXIgZm9yIHZlZ2EyMAogIGRybS9hbWRncHU6IHVwZGF0ZSBuYmlvIHY3XzQgaXAgaGVh
ZGVyIGZpbGVzCiAgZHJtL2FtZGdwdTogYWRkIHJhc19jb250cm9sbGVyIGFuZCBlcnJfZXZlbnRf
YXRodWIgaW50ZXJydXB0IHN1cHBvcnQKICBkcm0vYW1kZ3B1OiBlbmFibGUvZGlzYWJsZSByYXNf
Y29udHJvbGxlcl9pcnEgYW5kIGVycl9ldmVudF9hdGh1Yl9pcnEKICBkcm0vYW1kZ3B1OiBwb2xs
IHJhc19jb250cm9sbGVyX2lycSBhbmQgZXJyX2V2ZW50X2F0aHViX2lycSBzdGF0dXMKCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCAgICAgICAgICAgICAgICB8ICA2MyArLS0t
LS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lycS5jICAgICAgICAgICAg
fCAgMTIgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmggICAgICAg
ICAgIHwgIDkzICsrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Jhcy5jICAgICAgICAgICAgfCAgMTQgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Rm
X3YzXzYuYyAgICAgICAgICAgICAgIHwgIDE2ICstLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3YxMF8wLmMgICAgICAgICAgICAgfCAgMTQgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92OV8wLmMgICAgICAgICAgICAgIHwgICA2ICstCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjEwXzAuYyAgICAgICAgICAgICB8ICAgNiArLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAgICAgICAgICAgICAgfCAgMjAgKystCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9uYXZpMTBfaWguYyAgICAgICAgICAgICB8ICAgNCArLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192Ml8zLmMgICAgICAgICAgICAgfCAgIDEgLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192Ml8zLmggICAgICAgICAgICAgfCAgIDEg
KwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192Nl8xLmMgICAgICAgICAgICAgfCAg
IDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjZfMS5oICAgICAgICAgICAg
IHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfMC5jICAgICAgICAg
ICAgIHwgICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfMC5oICAgICAg
ICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5jICAg
ICAgICAgICAgIHwgMTYwICsrKysrKysrKysrKysrKysrKysrLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvbmJpb192N180LmggICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbnYuYyAgICAgICAgICAgICAgICAgICAgfCAgMzQgKystLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jICAgICAgICAgICAgIHwgICA2ICstCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYyAgICAgICAgICAgICB8ICAgOCArLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyAgICAgICAgICAgICAgICAgfCAgNzEg
KysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jICAgICAgICAg
ICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYyAgICAg
ICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2ExMF9paC5j
ICAgICAgICAgICAgIHwgICAyICstCiAuLi4vYW1kL2luY2x1ZGUvYXNpY19yZWcvbmJpby9uYmlv
XzdfNF9vZmZzZXQuaCAgICB8ICAgNCArLQogLi4uL2FtZC9pbmNsdWRlL2FzaWNfcmVnL25iaW8v
bmJpb183XzRfc2hfbWFzay5oICAgfCAgIDYgKy0KIC4uLi9hbWQvaW5jbHVkZS9pdnNyY2lkL25i
aW8vaXJxc3Jjc19uYmlmXzdfNC5oICAgIHwgIDQyICsrKysrKwogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jICAgICAgICAgfCAgIDIgKy0KIC4uLi9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211bWdyL3NtdTEwX3NtdW1nci5jICAgIHwgICAyICstCiAuLi4vZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3NtdW1nci92ZWdhMTBfc211bWdyLmMgICB8ICAgMiArLQogLi4uL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYTEyX3NtdW1nci5jICAgfCAgIDIgKy0KIC4u
Li9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3ZlZ2EyMF9zbXVtZ3IuYyAgIHwgICA0ICst
CiAzMyBmaWxlcyBjaGFuZ2VkLCA0NDcgaW5zZXJ0aW9ucygrKSwgMTU5IGRlbGV0aW9ucygtKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlv
LmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvaXZzcmNp
ZC9uYmlvL2lycXNyY3NfbmJpZl83XzQuaAoKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
