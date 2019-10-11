Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CE4D380B
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 05:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66E16EB98;
	Fri, 11 Oct 2019 03:50:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690058.outbound.protection.outlook.com [40.107.69.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFCB6EB97
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 03:50:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DrQ6hO7IhCNzN9uaZ2RAsRCV72CADp2RdFu62k7x4QHSQZfz1q1UORVEGf0S1vG4hgt/+yKZPl0d4UOuZ1G6HJu8EsiQ8SCwTit+FYw6fBOKn5dp6vC47JWH2zweIrSJmQe9+TZ2Sqz2wkzoCndbpCzUELecnFqL7FmT3WDxLGTh55Ipu4WJsKrdJ8LbSxELKTL8U+aFCNf/zGMjGOkufzvnZaViu4r3+DyMAk5kEmvmyZ5lcQmNdOw8J75xjb+ToxHipBJipi5cr2wXWKSmGouYfEZAwxSeM9fMHLS2RAEIBY4OQRLq3PGjDECU0Tv/N261tKii46ApHRucFsMNQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsyDXFsW16CmUUL+ALmmLxJ9Ff8HAm+Of/3KTHC0BsA=;
 b=ADGTN1caRxc81XFrzGWEOz/5Nej+OPdfJNZ0n5cCO9MrTikLkWIb0RQRG4l6B84f2jrhwAg2juAb2Ddm/XfFBVcHvmYiElqAzq/Cz1bqxcY5oj8fxzUng9Ka5SxeNLdzF8dRLv9au3f8carg9ELRW+XFnbZ6YGfhbxpQIYCg4wrULzpBlCUNzoWbwn5VmG1vZcu2Bg+3UL+f7VCMXFA8DwlGRXBIn4Q8jCXJAYFCRu+eWxXYjNn91W7fpvmqaF0zcwGPNo0ptFU0llDX4ut8s7yoyHmfGycygRqb/DAzLRYfgyiySZQN2QxIoAooLoGXpTBukC8ZPg99Jg3VjFX8zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0059.namprd12.prod.outlook.com (2603:10b6:802:20::30)
 by BY5PR12MB4161.namprd12.prod.outlook.com (2603:10b6:a03:209::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 03:50:56 +0000
Received: from BY2NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by SN1PR12CA0059.outlook.office365.com
 (2603:10b6:802:20::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19 via Frontend
 Transport; Fri, 11 Oct 2019 03:50:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT017.mail.protection.outlook.com (10.152.84.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 11 Oct 2019 03:50:55 +0000
Received: from rico-code.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 10 Oct 2019
 22:50:54 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/8] drm/amdgpu: update atomfirmware header with memory
 training related members
Date: Fri, 11 Oct 2019 11:50:29 +0800
Message-ID: <20191011035033.24935-4-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011035033.24935-1-tianci.yin@amd.com>
References: <20191011035033.24935-1-tianci.yin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(428003)(189003)(199004)(2616005)(47776003)(11346002)(53416004)(316002)(50466002)(48376002)(126002)(476003)(426003)(2351001)(50226002)(5660300002)(478600001)(44832011)(1076003)(70586007)(486006)(446003)(70206006)(6916009)(6666004)(76176011)(51416003)(305945005)(81166006)(81156014)(336012)(8676002)(7696005)(186003)(356004)(4326008)(54906003)(36756003)(2906002)(8936002)(26005)(16586007)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4161; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f2c7d60-063b-426b-7759-08d74dfe3874
X-MS-TrafficTypeDiagnostic: BY5PR12MB4161:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4161DA07E431E55AF734A61B95970@BY5PR12MB4161.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pbg5wjFqw6YCTHGqiQ+T/QZuNqHO9yZLJWBPH4KOdXMpJlOGKhVtNGd29VxDY2L9pRqYyxAoTiW+ZhMhd1ztd1f/mugPI1dI6RODQwRevsKadB9E5Dx8NHftbiL8a37zn7OmYXisRjImKU1Okia5Swx9pZZC9nl3zuN4mYN2E+gbIol4hB5vGr3fjAJYjBC7pOVTk6SCqcAM1QFhzK1URj36na4HB5nuy/PSfuDYZLxZUUYvu07CwfGsXZV3/m9ZVCY+Y1sl7qA7u3ZbtmVP8/YLTd+qSDJKjOEgAhhoqjpFPhLflx1F1CNk5BBJlnmH60Ch8Zpu/cadb+3/AGDf2+J52zPZT72benOhLsnaBtgc4AupPNawkxrKwU3pUyRS9U/VF6K6Bi4utbog3+RHPB7uuyWaTcZ3RjWcWaXrozo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 03:50:55.8842 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2c7d60-063b-426b-7759-08d74dfe3874
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4161
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsyDXFsW16CmUUL+ALmmLxJ9Ff8HAm+Of/3KTHC0BsA=;
 b=diiRHp4qLG0A8RsLDtxQ0EucqMRNTAxh+RtLa7xVhdx3vqFEH6XtPZjBlNhgvzPbFlRy7bO4t7RAJdR8rpO+6jc4vCx0qmemIy5r/HcE8oTH9DZSx27esHAN/e3xg/Q2UXREBfugPUVkaqbTwk6U6AgE/06biRHckblBodx3MFw=
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
Cc: Deucher Alexander <Alexander.Deucher@amd.com>,
 Tuikov Luben <Luben.Tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tianci Yin <tianci.yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgphZGQgbmV3IHZyYW1fcmVz
ZXJ2ZV9ibG9jayBzdHJ1Y3R1cmUgYW5kIGF0b21maXJtd2FyZV9pbnRlcm5hbF9jb25zdGFudHMg
ZW51bWVyYXRpb24KCkNoYW5nZS1JZDogSTZiYTY0MmVjZDdhZDk0MjUwMTYyYWU1YzMyMmVkOGQ4
NWRlOWMzNWEKUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogVGlhbmNpLllpbiA8dGlhbmNpLnlpbkBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hdG9tZmlybXdhcmUuaCB8IDI4ICsrKysrKysr
KysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hdG9tZmly
bXdhcmUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hdG9tZmlybXdhcmUuaAppbmRl
eCBlODg1NDFkNjdhYTAuLjQ2M2MxOGU5OWQ3OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9pbmNsdWRlL2F0b21maXJtd2FyZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5j
bHVkZS9hdG9tZmlybXdhcmUuaApAQCAtNDkyLDEyICs0OTIsMTMgQEAgc3RydWN0IGF0b21fZmly
bXdhcmVfaW5mb192M18xCiAvKiBUb3RhbCAzMmJpdCBjYXAgaW5kaWNhdGlvbiAqLwogZW51bSBh
dG9tYmlvc19maXJtd2FyZV9jYXBhYmlsaXR5CiB7Ci0gIEFUT01fRklSTVdBUkVfQ0FQX0ZJUk1X
QVJFX1BPU1RFRCA9IDB4MDAwMDAwMDEsCi0gIEFUT01fRklSTVdBUkVfQ0FQX0dQVV9WSVJUVUFM
SVpBVElPTiAgPSAweDAwMDAwMDAyLAotICBBVE9NX0ZJUk1XQVJFX0NBUF9XTUlfU1VQUE9SVCAg
PSAweDAwMDAwMDQwLAotICBBVE9NX0ZJUk1XQVJFX0NBUF9IV0VNVV9FTkFCTEUgID0gMHgwMDAw
MDA4MCwKLSAgQVRPTV9GSVJNV0FSRV9DQVBfSFdFTVVfVU1DX0NGRyA9IDB4MDAwMDAxMDAsCi0g
IEFUT01fRklSTVdBUkVfQ0FQX1NSQU1fRUNDICAgICAgPSAweDAwMDAwMjAwLAorCUFUT01fRklS
TVdBUkVfQ0FQX0ZJUk1XQVJFX1BPU1RFRCA9IDB4MDAwMDAwMDEsCisJQVRPTV9GSVJNV0FSRV9D
QVBfR1BVX1ZJUlRVQUxJWkFUSU9OICA9IDB4MDAwMDAwMDIsCisJQVRPTV9GSVJNV0FSRV9DQVBf
V01JX1NVUFBPUlQgID0gMHgwMDAwMDA0MCwKKwlBVE9NX0ZJUk1XQVJFX0NBUF9IV0VNVV9FTkFC
TEUgID0gMHgwMDAwMDA4MCwKKwlBVE9NX0ZJUk1XQVJFX0NBUF9IV0VNVV9VTUNfQ0ZHID0gMHgw
MDAwMDEwMCwKKwlBVE9NX0ZJUk1XQVJFX0NBUF9TUkFNX0VDQyAgICAgID0gMHgwMDAwMDIwMCwK
KwlBVE9NX0ZJUk1XQVJFX0NBUF9FTkFCTEVfMlNUQUdFX0JJU1RfVFJBSU5JTkcgID0gMHgwMDAw
MDQwMCwKIH07CiAKIGVudW0gYXRvbV9jb29saW5nX3NvbHV0aW9uX2lkewpAQCAtNjcxLDYgKzY3
MiwyMSBAQCBzdHJ1Y3QgdnJhbV91c2FnZWJ5ZmlybXdhcmVfdjJfMQogICB1aW50MTZfdCAgdXNl
ZF9ieV9kcml2ZXJfaW5fa2I7IAogfTsKIAorLyogVGhpcyBpcyBwYXJ0IG9mIHZyYW1fdXNhZ2Vi
eWZpcm13YXJlX3YyXzEgKi8KK3N0cnVjdCB2cmFtX3Jlc2VydmVfYmxvY2sKK3sKKwl1aW50MzJf
dCBzdGFydF9hZGRyZXNzX2luX2tiOworCXVpbnQxNl90IHVzZWRfYnlfZmlybXdhcmVfaW5fa2I7
CisJdWludDE2X3QgdXNlZF9ieV9kcml2ZXJfaW5fa2I7Cit9OworCisvKiBEZWZpbml0aW9ucyBm
b3IgY29uc3RhbmNlICovCitlbnVtIGF0b21maXJtd2FyZV9pbnRlcm5hbF9jb25zdGFudHMKK3sK
KwlPTkVfSwk9IDB4NDAwLAorCU9ORV9NRUcJPSAweDEwMDAwMCwKKwlPTkVfRwk9IDB4NDAwMDAw
MDAsCit9OwogCiAvKiAKICAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCi0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
