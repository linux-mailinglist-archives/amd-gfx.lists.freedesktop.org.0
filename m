Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144E2B5DF6
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 09:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76A96E303;
	Wed, 18 Sep 2019 07:24:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800083.outbound.protection.outlook.com [40.107.80.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C5E6E303
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 07:24:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nS/TKm/wosA90c2x0hWCX1mXK6Mpd3luYt1MZt20RnHg57rvCIS96eO/WVqc393hfaVjFHNG3TlcMCcXN0vzlTupLBmlNIbgnWNLna57NfZiG1BHJEw4r3KidDW1oUItJ86e+70pfSF8/4rej8vOf0A5UpnsGo57X+Osavl8FP0IkIF3qxj2Xoq8mZx2A3NBRkQJehCGluWPLb62PzqGlKmOLH8rISL3/GfQNI/pjF47Nh2yaQXJoQr16Uy7pnpClMcP/NTA+25i8TLEH5h7AiI8A+ZSv6yKvaJAETzE/+Vv/NKMPI5DucCVT3J+MmxLADuoZzDdyRxySg3sKqHxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/6WYLAXEUPR9lcQF2oRZLOCJTMYgC6enAStuSLlE/I=;
 b=SjTfM5hS369FDe3LSMV2DUCDK/hwcwc1HP9TlGvi15Nl4mnpBbV2vxd4yRR4vRxf8rADrH8Aw92zwRsM5q0dAVCiDTPSi6DBRCsVHmo+7Do6b3HtnGkMhYUWblWoVnvLIYGrGo9HUCq+Ho/JEVmmcou5ZMvVZjWLV0CbZKKBqvCS0u5OVkVV/b7TuZIE2WHYpQClO5C3v3oee2IvMkrWPfUd9fFuU4EyZd7f7ov18oyvxxFcwmmilbG7Q7IKN0IVtUZvTDf2D/k4cwRu1S7E6kdlBCA+8L7pHZcc54lnZnBroaNU00HrTf9VCp+oAGlxYdagY/+NiQYXiupaMIoJKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0073.namprd12.prod.outlook.com (2603:10b6:0:57::17) by
 DM6PR12MB2923.namprd12.prod.outlook.com (2603:10b6:5:180::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Wed, 18 Sep 2019 07:24:50 +0000
Received: from DM3NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by DM3PR12CA0073.outlook.office365.com
 (2603:10b6:0:57::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.18 via Frontend
 Transport; Wed, 18 Sep 2019 07:24:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT026.mail.protection.outlook.com (10.152.82.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 07:24:50 +0000
Received: from ubuntu-mi100.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 18 Sep 2019
 02:24:49 -0500
From: Jack Zhang <Jack.Zhang1@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or passthrough
Date: Wed, 18 Sep 2019 15:24:45 +0800
Message-ID: <20190918072445.3559-1-Jack.Zhang1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(428003)(189003)(199004)(6916009)(47776003)(305945005)(4326008)(48376002)(478600001)(2616005)(126002)(426003)(476003)(26005)(81166006)(81156014)(8936002)(5660300002)(50466002)(36756003)(50226002)(2351001)(1076003)(186003)(8676002)(336012)(70586007)(70206006)(2906002)(53416004)(16586007)(486006)(86362001)(316002)(7696005)(51416003)(6666004)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2923; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f35c9a0-4046-4448-1651-08d73c094ad6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB2923; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2923:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2923A9FAADA271E249539D43BB8E0@DM6PR12MB2923.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01644DCF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: TXBVATNUPrM8je9e7jGCzRTXDg/LqzkmNtPuqUMpH0z/PKbo5/CJn3Iyj2K9oG8Au1OZuiJ4bhgnq7YsjcjEp/HuyfbV4WcSe9wmHMBxKdr4GUsXszJTivWZEOYMei8L/aorT9KL0bkDI9GdxSNURIcW2cBAXieGbTZp/+vkLV1VDMQFPTO7pflAdscHZdWGwr3JR+L4BXe8npTnb5tsrS4tvZ3UBRkb372bMyJVLD29+d6SaxftPZYjRa/N4WO5dytQMOjTWfiGnfpCCXrVo1Nv88BSA3ER9G9BuQ2a2B2CxQ+yqbFTDKiYNZFZPMgmhDUYn2oW3JD6sKbwrzGPVP+EoJOv6tcs8TlprcBy/uSkUug3fsC/ddc124sOKcsz05xGEko2XeXsmfYFrYmk2dxQMbIB5Yk0gsyfROBDVhU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 07:24:50.3240 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f35c9a0-4046-4448-1651-08d73c094ad6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2923
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/6WYLAXEUPR9lcQF2oRZLOCJTMYgC6enAStuSLlE/I=;
 b=py7cBZQneMRGdxdUBhMsH4bb9BwQr3JEZ/G7VLHXQbeoo/zi/8Z97eLuGDq/h7x6dHkuklGzZhFCXzPG9eQzXdJrnu2KaHIYHasjw0T0OCELRnjJwWvk6OYyg5J6tCxONNJDIR2hfcadMZYGJyccTsH17aOlK6bbLf9HqKwn/aw=
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gdmlydHVhbCBtYWNoaW5lLCB0aGVyZSB3b3VsZCBiZSBhIHF4bCBvciBjaXJydXMKZ3JhcGhp
Y3MgZGV2aWNlIGFzIHRoZSBkZWZhdWx0IG1hc3RlciBmYmNvbiBkZXZpY2UuCgpTbyBmb3IgUEYo
cGFzc3Rocm91Z2ggbW9kZSkgb3IgU1JJT1YgVkYsIGl0IGlzIHJlYXNvbmFibGUKdG8gdW5sb2Fk
IGFtZGdwdSBkcml2ZXIuIEFtZGdwdSBkb2Vzbid0IGhhdmUgdG8gYmUgdGhlCm9ubHkgZmJjb24g
ZGV2aWNlIHVuZGVyIHRoaXMgY29uZGl0aW9uLgoKU2lnbmVkLW9mZi1ieTogSmFjayBaaGFuZyA8
SmFjay5aaGFuZzFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwppbmRleCA0
MjA4ODhlLi5hZGEyYjI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5j
CkBAIC0xMTAzLDggKzExMDMsOSBAQCBzdGF0aWMgdm9pZAogYW1kZ3B1X3BjaV9yZW1vdmUoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYpCiB7CiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IHBjaV9nZXRf
ZHJ2ZGF0YShwZGV2KTsKLQotCURSTV9FUlJPUigiRGV2aWNlIHJlbW92YWwgaXMgY3VycmVudGx5
IG5vdCBzdXBwb3J0ZWQgb3V0c2lkZSBvZiBmYmNvblxuIik7CisJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSBkZXYtPmRldl9wcml2YXRlOworCWlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYp
ICYmICFhbWRncHVfcGFzc3Rocm91Z2goYWRldikpCisJCURSTV9FUlJPUigiRGV2aWNlIHJlbW92
YWwgaXMgY3VycmVudGx5IG5vdCBzdXBwb3J0ZWQgb3V0c2lkZSBvZiBmYmNvblxuIik7CiAJZHJt
X2Rldl91bnBsdWcoZGV2KTsKIAlkcm1fZGV2X3B1dChkZXYpOwogCXBjaV9kaXNhYmxlX2Rldmlj
ZShwZGV2KTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
