Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7C9BADCC
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 08:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E86F6E0E0;
	Mon, 23 Sep 2019 06:28:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720055.outbound.protection.outlook.com [40.107.72.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618C76E0E0
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 06:28:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9DEj9fjZMBoo7gwNmNVKpGeYHsQZpX3GqVdR/k8YO0WYOA10wFDAGvePlYdusZObXfOIThiJJXTbgfO7WaWm7h+N3hJuitEMv6xbFkeRyborBmP9DVAO+TJb4+rc0inp8U05C8N5Zfe6C86j6lFVDSvi0LQTkyzGRBZh7RPD6vOIclERPaxiw53ooV6bxMt3CnFqjgahLzM46l8H9sKPuGK9PxsSQi41GZF16rQ6MiIvt1NTnFeP6woOKuatb/9fxynp4RTadr/t4NcoKHpUHGfIEbVEYK78HfrZjQ15D6jpk4jYIg2cGVBnS8qzjHjl2MboaVYZTjvUUDIue/tag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3hXtutfwkSLX8kOgh0IH/DbkJexLTv4oNKQqVvk064=;
 b=oXPr+rch7LqWnRtri2UWSSbzNS7trj+xkADXP1x6AbI2ZQGMTyo9qDemB4JDXk5dJB32GATyeSQDXR+xxAUYn55CWb+lBJKVOh7/EkSwOUfLb/h/mEkavCfMvLAX26qo72+myQ2qupmZ73edDgk+Tg1QRYxHm+YEW9ulyZuN2CF7ZMnwuhQftpoJsePcM/aZQWgeEN0CQauqtVaYJwb83T9VKmXb/ZH5qImnihQK2wDKSVuW6RuDXkr8kWnluYNFdxjd+pyIv1srP382MCcwUaeTzfxIyVFbkx1U2YEVasq1sSa72rC2TMgh3oV1/pjmv5UW8sixijmlxpNocoZBqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0001.namprd12.prod.outlook.com (2603:10b6:610:57::11)
 by CY4PR1201MB2503.namprd12.prod.outlook.com (2603:10b6:903:d1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Mon, 23 Sep
 2019 06:28:55 +0000
Received: from CO1NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by CH2PR12CA0001.outlook.office365.com
 (2603:10b6:610:57::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18 via Frontend
 Transport; Mon, 23 Sep 2019 06:28:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT030.mail.protection.outlook.com (10.152.80.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.25 via Frontend Transport; Mon, 23 Sep 2019 06:28:54 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 23 Sep 2019 01:28:54 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdgpu: enable psp front door loading by default on
 Arcturus
Date: Mon, 23 Sep 2019 14:28:46 +0800
Message-ID: <1569220126-4033-3-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569220126-4033-1-git-send-email-le.ma@amd.com>
References: <1569220126-4033-1-git-send-email-le.ma@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(428003)(199004)(189003)(8936002)(81166006)(81156014)(8676002)(305945005)(50466002)(47776003)(36756003)(50226002)(486006)(44832011)(5660300002)(316002)(2616005)(476003)(6916009)(11346002)(446003)(426003)(16586007)(70586007)(76176011)(26005)(70206006)(336012)(126002)(2906002)(186003)(2351001)(51416003)(4744005)(478600001)(6666004)(356004)(86362001)(48376002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2503; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65a56e22-f806-4024-dd69-08d73fef4efa
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CY4PR1201MB2503; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2503:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2503A13FA591EDE0E73EA5B2F6850@CY4PR1201MB2503.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0169092318
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: oo0nNsNZ/RsFB1PgV4lbMT+22wJ7Yit7nLDBPZJGrZ+xpGf0NcqurqAdnu+N9ro7Y7eKGtSKQbjCBh39GepYmdBj/pZ7Zv3zEl5ULpsI116X44/RXLP6pN2c3zDViNA9ucdIXLNzbNWCTVz0VJIo7QDXGO8oH7AfreDfhZOgoVtsMFl0wlvPVnyNWE9sROz4a6jo608MRz0JKrqQMxMHOfgHBtXd11X+dVLW01fHbyKLPv1OpZoGHM0WzqDoxgzoG0OhtlF+9S+dKgGxY1uQzs2IiqpzBkHBsG3+I4ATdJrqYICYcVRoKhz33mu4fjmDuG02wplNq7Q0IdGFUjmeLRVHztxqy3risd2eRQidc1yUKMmgzZjg7QhtrRtcshF2YHR74hBiia+xWATvm2AQdgN0Q9/bZ7kKchQcITawmr4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 06:28:54.9020 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a56e22-f806-4024-dd69-08d73fef4efa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2503
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3hXtutfwkSLX8kOgh0IH/DbkJexLTv4oNKQqVvk064=;
 b=hpKQcXPdI9+E+mTcT0SaQu0n+mbyoaB+HwD20BU9H/hlSV+yMjnwSSdKN9vibI3KoGLLzR6FPFpuSqRtaE/wAnQZIm7tQLzNTc44uaAyZZoH5ZGhupdZeVB22SS86Ok6KVuQ4n7gOl3aZaOILUEasXQOs3SrXhANq6Q5usu1Sv8=
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
Cc: Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2hhbmdlLUlkOiBJMTNhNWY1OTBkNWE0OTY1NTk2NWExM2ViN2NlNzczZDFlZmZmY2JkMApTaWdu
ZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdWNvZGUuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Vjb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dWNvZGUuYwppbmRleCA4MmY2YjQxLi5mY2UxZjcxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdWNvZGUuYwpAQCAtMzYwLDYgKzM2MCw3IEBAIGFtZGdwdV91Y29kZV9nZXRf
bG9hZF90eXBlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgbG9hZF90eXBlKQogCWNh
c2UgQ0hJUF9SQVZFTjoKIAljYXNlIENISVBfVkVHQTEyOgogCWNhc2UgQ0hJUF9WRUdBMjA6CisJ
Y2FzZSBDSElQX0FSQ1RVUlVTOgogCWNhc2UgQ0hJUF9SRU5PSVI6CiAJY2FzZSBDSElQX05BVkkx
MDoKIAljYXNlIENISVBfTkFWSTE0OgpAQCAtMzY4LDggKzM2OSw2IEBAIGFtZGdwdV91Y29kZV9n
ZXRfbG9hZF90eXBlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgbG9hZF90eXBlKQog
CQkJcmV0dXJuIEFNREdQVV9GV19MT0FEX0RJUkVDVDsKIAkJZWxzZQogCQkJcmV0dXJuIEFNREdQ
VV9GV19MT0FEX1BTUDsKLQljYXNlIENISVBfQVJDVFVSVVM6Ci0JCXJldHVybiBBTURHUFVfRldf
TE9BRF9ESVJFQ1Q7CiAKIAlkZWZhdWx0OgogCQlEUk1fRVJST1IoIlVua25vd24gZmlybXdhcmUg
bG9hZCB0eXBlXG4iKTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
