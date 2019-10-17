Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D1EDB73F
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A5B6EACD;
	Thu, 17 Oct 2019 19:15:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690069.outbound.protection.outlook.com [40.107.69.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D7F6EAA5
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbSM15rvGBZZA5s7Gpw1O7YdYCrU2bLLc8VKXcgW+8psBMjitNL0d5S1u3cy9KSBA3nmJdzCFztOrZa1DaosU3WHJ7y13GDgoUGi1N57SlClBaxyhbjsn+xOh1HZJX4TpMwP9QelSFIWBnOKXCqGOalK1VDT/OqClzFMrwAy/L/7wB43A2+VZkmRTJOCCn/pj91wyoHGjNRTMGv7JP7LEmzKaCIazScVtFeVkMRnQvA70aUKG+Z7GI1es7naoM/+oaCGcXTDaVt0ZLApX71sHGCfM6V9rzFZc3j70qc8eb9Sudhl9qPARKFTBjSaYYUNJ22yTvpwJbODeDQIdVvacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8utiEMjl0w/rdCn4P818Vr6SBWbHwcv2Bv8NdM8v0HI=;
 b=d3SeKBgg9hsYrrp6PISpBn+MVj+PJlV9XE0o44e2NokrzHiHF5DAybTCzbARdsrdbc2E6pF5RUNqH5/hToah53LgpMor647hboWb9JM5B8hLpJpb+OKmbiUeLtFeDbtZb1Y2NB47tVmhe7dBKCNKeeIUluiBvVXKkCYwB6w1X/pPc1WkQ0U8AHlCUXaVLssUm/VGMbw9iztsgJUr7/RweSoaZ+jsbon0F32fzrri8xQFVQzFsntO0cjU/EkMCVKQ136ego3uKpbzw1d3dzW1WZgNsLYC5rCwM5SgA5fF2YsewO4pvnMvtuP7MkxIKdmyRES/vrI/vp8b5WiHpu/t7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0022.namprd12.prod.outlook.com
 (2603:10b6:405:4c::32) by CH2PR12MB4008.namprd12.prod.outlook.com
 (2603:10b6:610:26::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Thu, 17 Oct
 2019 19:15:50 +0000
Received: from BY2NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN6PR1201CA0022.outlook.office365.com
 (2603:10b6:405:4c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT046.mail.protection.outlook.com (10.152.85.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:49 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:46 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:46 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 26/37] drm/amd/display: Proper return of result when aux
 engine acquire fails
Date: Thu, 17 Oct 2019 15:13:18 -0400
Message-ID: <20191017191329.11857-27-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(136003)(346002)(428003)(189003)(199004)(6916009)(50226002)(36756003)(6666004)(305945005)(356004)(48376002)(54906003)(478600001)(47776003)(5660300002)(26005)(14444005)(1076003)(2351001)(316002)(336012)(70206006)(476003)(76176011)(51416003)(86362001)(11346002)(186003)(50466002)(70586007)(426003)(446003)(8936002)(2906002)(2870700001)(2616005)(2876002)(4326008)(126002)(486006)(81166006)(81156014)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4008; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6916fd5b-af8d-4226-70ab-08d753366bd3
X-MS-TrafficTypeDiagnostic: CH2PR12MB4008:
X-Microsoft-Antispam-PRVS: <CH2PR12MB40089AA52CC866BA7ABE101D826D0@CH2PR12MB4008.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jrfH3AYrTegEmD3sC7Wpi8X5ccNwgGv9JGcftvr9MVrcp9lxy0IZLTgQsknHf5/VV1qjA0bKSGAUeT5NCmCZTI5DnU22ZN1z7OLzISMQM6tOqAFaP9EGegokBzf50wKa3cLGvnJoHaLUepsI/WwfYzph4ujW5UCOfki9SkJLTuvLYswWMnIxXndNI639IQSfqya4+Zxo42nZ/fc9WT5qgbM+FQOBU7QaY8n0YOSvZreNs6BDVyf4XS21Yhel8gYQ+GlnOA2mCFiwCkLP4pdTsMPhlQ6JurJyxw+KXcl5TWndOeo8ccHB07RZJ47mgark/DEspEAtpCB0CZxBGKEr91uYFGl/5l5g3SOXFZJKR6UpgM1uX0Fo2zNtaVmgo0I1SLdGlR1TdcanCMvN8DQe7Cz/8EHI7/4m4O3vRsqU8S8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:49.6901 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6916fd5b-af8d-4226-70ab-08d753366bd3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4008
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8utiEMjl0w/rdCn4P818Vr6SBWbHwcv2Bv8NdM8v0HI=;
 b=V/U7XM7RaffNarPF6ygcNoZOKFDjUFKUjsPyP1urBFPMR9n4LV9DUJbQhziWgzwWiuAsnfgeJUF8ZRwMBXhfvHIU+X0K9nQJm0h14PyYjfa8a3Iy/4DJW43Yt8dMF0PzqjEtXAC5u+uTcSqs9HCqMksPK3SIXUXhEKDAQVqJXqA=
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
Cc: Leo Li <sunpeng.li@amd.com>, Aric Cyr <Aric.Cyr@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CgpbV2h5XQpXaGVuIGF1eCBl
bmdpbmUgYWNxdWlyZSBmYWlscywgd2UgbWlzc2VkIHBvcHVsYXRpbmcgdGhlIG9wZXJhdGlvbl9y
ZXN1bHQKdGhhdCBkZXNjcmliZXMgdGhlIGZhaWx1cmUgcmVhc29uLgoKW0hvd10KU2V0IG9wZXJh
dGlvbl9yZXN1bHQgdG8gbmV3IHR5cGU6CkFVWF9DSEFOTkVMX09QRVJBVElPTl9GQUlMRURfRU5H
SU5FX0FDUVVJUkUKaW4gdGhlIGNhc2UgYXV4IGVuZ2luZSBhY3F1aXJlIGhhcyBmYWlsZWQuCgpT
aWduZWQtb2ZmLWJ5OiBBbnRob255IEtvbyA8QW50aG9ueS5Lb29AYW1kLmNvbT4KUmV2aWV3ZWQt
Ynk6IEFyaWMgQ3lyIDxBcmljLkN5ckBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5n
LmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1fbXN0X3R5cGVzLmMgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY19kZGNfdHlwZXMuaCAgICAgICAgICAgICAgIHwgMyArKy0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jICAgICAgICAgICAgICAgIHwgNSArKysrLQogMyBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5
cGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9t
c3RfdHlwZXMuYwppbmRleCAzYWYyYjQyOWZmMWIuLjc3OWQwYjYwY2FjOSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVz
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1f
bXN0X3R5cGVzLmMKQEAgLTExMyw2ICsxMTMsNyBAQCBzdGF0aWMgc3NpemVfdCBkbV9kcF9hdXhf
dHJhbnNmZXIoc3RydWN0IGRybV9kcF9hdXggKmF1eCwKIAkJCXJlc3VsdCA9IC1FSU87CiAJCQli
cmVhazsKIAkJY2FzZSBBVVhfQ0hBTk5FTF9PUEVSQVRJT05fRkFJTEVEX0lOVkFMSURfUkVQTFk6
CisJCWNhc2UgQVVYX0NIQU5ORUxfT1BFUkFUSU9OX0ZBSUxFRF9FTkdJTkVfQUNRVUlSRToKIAkJ
CXJlc3VsdCA9IC1FQlVTWTsKIAkJCWJyZWFrOwogCQljYXNlIEFVWF9DSEFOTkVMX09QRVJBVElP
Tl9GQUlMRURfVElNRU9VVDoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY19kZGNfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY19k
ZGNfdHlwZXMuaAppbmRleCA0ZWY5N2Y2NWU1NWQuLjRmOGY1NzZkNWZjZiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2RkY190eXBlcy5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY19kZGNfdHlwZXMuaApAQCAtNDksNyArNDksOCBA
QCBlbnVtIGF1eF9jaGFubmVsX29wZXJhdGlvbl9yZXN1bHQgewogCUFVWF9DSEFOTkVMX09QRVJB
VElPTl9GQUlMRURfUkVBU09OX1VOS05PV04sCiAJQVVYX0NIQU5ORUxfT1BFUkFUSU9OX0ZBSUxF
RF9JTlZBTElEX1JFUExZLAogCUFVWF9DSEFOTkVMX09QRVJBVElPTl9GQUlMRURfVElNRU9VVCwK
LQlBVVhfQ0hBTk5FTF9PUEVSQVRJT05fRkFJTEVEX0hQRF9ESVNDT04KKwlBVVhfQ0hBTk5FTF9P
UEVSQVRJT05fRkFJTEVEX0hQRF9ESVNDT04sCisJQVVYX0NIQU5ORUxfT1BFUkFUSU9OX0ZBSUxF
RF9FTkdJTkVfQUNRVUlSRQogfTsKIAogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UvZGNlX2F1eC5jCmluZGV4IDk3NmJkNDk4N2EyOC4uMjJhYmIzNDVkZGMxIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguYwpAQCAtNTM4LDggKzUz
OCwxMCBAQCBpbnQgZGNlX2F1eF90cmFuc2Zlcl9yYXcoc3RydWN0IGRkY19zZXJ2aWNlICpkZGMs
CiAJbWVtc2V0KCZhdXhfcmVwLCAwLCBzaXplb2YoYXV4X3JlcCkpOwogCiAJYXV4X2VuZ2luZSA9
IGRkYy0+Y3R4LT5kYy0+cmVzX3Bvb2wtPmVuZ2luZXNbZGRjX3Bpbi0+cGluX2RhdGEtPmVuXTsK
LQlpZiAoIWFjcXVpcmUoYXV4X2VuZ2luZSwgZGRjX3BpbikpCisJaWYgKCFhY3F1aXJlKGF1eF9l
bmdpbmUsIGRkY19waW4pKSB7CisJCSpvcGVyYXRpb25fcmVzdWx0ID0gQVVYX0NIQU5ORUxfT1BF
UkFUSU9OX0ZBSUxFRF9FTkdJTkVfQUNRVUlSRTsKIAkJcmV0dXJuIC0xOworCX0KIAogCWlmIChw
YXlsb2FkLT5pMmNfb3Zlcl9hdXgpCiAJCWF1eF9yZXEudHlwZSA9IEFVWF9UUkFOU0FDVElPTl9U
WVBFX0kyQzsKQEAgLTY2Myw2ICs2NjUsNyBAQCBib29sIGRjZV9hdXhfdHJhbnNmZXJfd2l0aF9y
ZXRyaWVzKHN0cnVjdCBkZGNfc2VydmljZSAqZGRjLAogCQkJYnJlYWs7CiAKIAkJY2FzZSBBVVhf
Q0hBTk5FTF9PUEVSQVRJT05fRkFJTEVEX0hQRF9ESVNDT046CisJCWNhc2UgQVVYX0NIQU5ORUxf
T1BFUkFUSU9OX0ZBSUxFRF9FTkdJTkVfQUNRVUlSRToKIAkJY2FzZSBBVVhfQ0hBTk5FTF9PUEVS
QVRJT05fRkFJTEVEX1JFQVNPTl9VTktOT1dOOgogCQlkZWZhdWx0OgogCQkJZ290byBmYWlsOwot
LSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
