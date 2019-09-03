Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B66DA70D6
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 18:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D512089830;
	Tue,  3 Sep 2019 16:44:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790047.outbound.protection.outlook.com [40.107.79.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7026F89830
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 16:44:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3s+FYLqsrDPHthyw3zC+5u3I/OwDaYMJ1W8+NUnOEQ5Qy89EbMyJL1cp12X5za2be9c1xNIgICIkeqvKFrtd4dt8Db/7eJxHizy2fmFxGBbRyu7I07y7uZt2prIQDmcY2IrZwPGD/pDbKUNHGU/5LltHoHln3rp5Rhv+jiwyA+h6neWcUFX4f5D/eIP35wcMcM+QVT1z/stWEVwZ0649TIFkMiu2XHHe9QjWBAyiTQm0PnJaU/zsbS1ebbDpEdGz8Y8MTE/+mHPKV+6mopboDfSMXd4/s/oiiKHvICas1yQNb5ddL+JjyDv3caCLRiHKcRTYG/AwIA8LQdpJnD3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oX/s04wIyjW+7w6dPcakOv344sOBUvfxoVg9Pzk24wM=;
 b=OoI7rPmb+tMBH0reLWL2eJDnZLog9DNVdaYr+oKTD2d/rJKNPIIAnFsfqqN3Fnfx+pkslVcLvk7QAQQq33bCEJGp4uaD8zWpydEY5cwpYYTXDB76j5RDFLfxVNC1xA4fUZX+qFsCMkRmbnrpNpcWRrrq4oZqhUJXhB4hnt9SaKpJ/3EAiHuxzv1Bqgvl62AzgMLAEesahWj1HdX0Bti5m+A0eANDOtqx9081uEHhJBG5HkfsWByua4S+omzLDegjeWbWqbc2yN/Wc4g784DGO1FSx9Bh5tF0PYjoqY4vgEMvvLUNzcKWBZKOeR8BeJ/sNvxo1o58DM+BgdmDqiyFAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0045.namprd12.prod.outlook.com (2603:10b6:405:70::31)
 by CY4PR1201MB0023.namprd12.prod.outlook.com (2603:10b6:910:1f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18; Tue, 3 Sep
 2019 16:44:13 +0000
Received: from DM3NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by BN6PR12CA0045.outlook.office365.com
 (2603:10b6:405:70::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.19 via Frontend
 Transport; Tue, 3 Sep 2019 16:44:13 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT025.mail.protection.outlook.com (10.152.82.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Tue, 3 Sep 2019 16:44:12 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 3 Sep 2019 11:44:09 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 3/3] dmr/amdgpu: Add system auto reboot to RAS.
Date: Tue, 3 Sep 2019 12:44:04 -0400
Message-ID: <1567529044-5918-3-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567529044-5918-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1567529044-5918-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(5660300002)(8676002)(16586007)(47776003)(26005)(53936002)(4326008)(86362001)(186003)(76176011)(478600001)(6916009)(356004)(6666004)(48376002)(486006)(54906003)(14444005)(336012)(316002)(53416004)(2616005)(2906002)(44832011)(446003)(11346002)(51416003)(476003)(2351001)(126002)(50226002)(8936002)(50466002)(70586007)(426003)(7696005)(305945005)(70206006)(81156014)(36756003)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0023; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fad525e5-a8a3-49fe-2742-08d7308df378
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CY4PR1201MB0023; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0023:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB002328C8869C5E80249034A2EAB90@CY4PR1201MB0023.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 01494FA7F7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 5It66OJVLG0A/wEEu8Cm4tbv8VKaNfU2EeSIrxB6IC+DCJ6MOTptEvmZxwFx9cYMjE5h5qE3QvpoDj1RjGVhyS1DmwkKdSd4L/P+X6WGxKxQ1QwGzKdzugDLzzEkoZj23ZcjyUoc1d4XiRHzTgaGo+BGmRCdGtJMMbThiWRwYC4KWh2qrwIvhf9/erUHxm0MI6aJN46i6rjb8NUhsT+LiGZOMCqDVdllnANudViwvg3Tp2AL0tbIVjwkN0sK3sx7+nE5qNGDllldQOYMWJjGLXkI+GaPPgKKaqAlFYRuBK7MWmSuUudCM/kvyILL8whHzS77GgQzT3tbyNqbHJQyUIIoC+wsx30Uvp+ifB8xEJSvv1vTXhSW7F5knuSqT1FVaGnaLn8CFiXZ909lGV4zaUWwzv941tp5yazm++tt6kY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2019 16:44:12.7222 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fad525e5-a8a3-49fe-2742-08d7308df378
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0023
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oX/s04wIyjW+7w6dPcakOv344sOBUvfxoVg9Pzk24wM=;
 b=JE1KlvhNvlTAhbfEmU/gXT+69Ixwh18a3E3rZpaiEO9j0681oROlQ+5R34XlH6lWNKhb8GbfNSVsmapxIgdhUQ0O2h5bz37w5w/dEStD7LLeJqJOHv3Juyl8ye8jTokl5ibB4yHLl8ytw9IfvuaCH7TLWEYaC80VSVd9d5PbiVQ=
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
Cc: alexdeucher@gmail.com, ckoenig.leichtzumerken@gmail.com, Tao.Zhou1@amd.com,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Hawking.Zhang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gY2FzZSBvZiBSQVMgZXJyb3IgYWxsb3cgdXNlciBjb25maWd1cmUgYXV0byBzeXN0ZW0KcmVi
b290IHRocm91Z2ggcmFzX2N0cmwuClRoaXMgaXMgYWxzbyBwYXJ0IG9mIHRoZSB0ZW1wcm9yYXkg
d29yayBhcm91bmQgZm9yIHRoZSBSQVMKaGFuZyBwcm9ibGVtLgoKdjQ6IFVzZSBsYXRlc3Qga2Vy
bmVsIEFQSSBmb3IgZGlzayBzeW5jLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kg
PGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jIHwgMTQgKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyAgICB8ICA5ICsrKysrKysrLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oICAgIHwgIDEgKwogMyBmaWxlcyBjaGFuZ2VkLCAyMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jCmluZGV4IGJlNTIzMTguLjY5ZTA4MjAgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTY0LDYgKzY0LDggQEAKICNpbmNsdWRl
ICJhbWRncHVfcmFzLmgiCiAjaW5jbHVkZSAiYW1kZ3B1X3BtdS5oIgogCisjaW5jbHVkZSA8bGlu
dXgvc3VzcGVuZC5oPgorCiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS92ZWdhMTBfZ3B1X2luZm8u
YmluIik7CiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS92ZWdhMTJfZ3B1X2luZm8uYmluIik7CiBN
T0RVTEVfRklSTVdBUkUoImFtZGdwdS9yYXZlbl9ncHVfaW5mby5iaW4iKTsKQEAgLTM3NjAsNiAr
Mzc2MiwxOCBAQCBpbnQgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcihzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKIAlpbnQgaSwgciA9IDA7CiAJYm9vbCBpbl9yYXNfaW50ciA9IGFtZGdwdV9y
YXNfaW50cl90cmlnZ2VyZWQoKTsKIAorCS8qCisJICogRmx1c2ggUkFNIHRvIGRpc2sgc28gdGhh
dCBhZnRlciByZWJvb3QKKwkgKiB0aGUgdXNlciBjYW4gcmVhZCBsb2cgYW5kIHNlZSB3aHkgdGhl
IHN5c3RlbSByZWJvb3RlZC4KKwkgKi8KKwlpZiAoaW5fcmFzX2ludHIgJiYgYW1kZ3B1X3Jhc19n
ZXRfY29udGV4dChhZGV2KS0+cmVib290KSB7CisKKwkJRFJNX1dBUk4oIkVtZXJnZW5jeSByZWJv
b3QuIik7CisKKwkJa3N5c19zeW5jX2hlbHBlcigpOworCQllbWVyZ2VuY3lfcmVzdGFydCgpOwor
CX0KKwogCW5lZWRfZnVsbF9yZXNldCA9IGpvYl9zaWduYWxlZCA9IGZhbHNlOwogCUlOSVRfTElT
VF9IRUFEKCZkZXZpY2VfbGlzdCk7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuYwppbmRleCAxY2MzNGRlLi5hOGVlY2I4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Jhcy5jCkBAIC0xNTQsNiArMTU0LDggQEAgc3RhdGljIGludCBhbWRncHVfcmFzX2Rl
YnVnZnNfY3RybF9wYXJzZV9kYXRhKHN0cnVjdCBmaWxlICpmLAogCQlvcCA9IDE7CiAJZWxzZSBp
ZiAoc3NjYW5mKHN0ciwgImluamVjdCAlMzJzICU4cyIsIGJsb2NrX25hbWUsIGVycikgPT0gMikK
IAkJb3AgPSAyOworCWVsc2UgaWYgKHNzY2FuZihzdHIsICJyZWJvb3QgJTMycyIsIGJsb2NrX25h
bWUpID09IDEpCisJCW9wID0gMzsKIAllbHNlIGlmIChzdHJbMF0gJiYgc3RyWzFdICYmIHN0clsy
XSAmJiBzdHJbM10pCiAJCS8qIGFzY2lpIHN0cmluZywgYnV0IGNvbW1hbmRzIGFyZSBub3QgbWF0
Y2hlZC4gKi8KIAkJcmV0dXJuIC1FSU5WQUw7CkBAIC0yODcsNiArMjg5LDkgQEAgc3RhdGljIHNz
aXplX3QgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfd3JpdGUoc3RydWN0IGZpbGUgKmYsIGNvbnN0
IGNoYXIgX191c2VyICoKIAkJLyogZGF0YS5pbmplY3QuYWRkcmVzcyBpcyBvZmZzZXQgaW5zdGVh
ZCBvZiBhYnNvbHV0ZSBncHUgYWRkcmVzcyAqLwogCQlyZXQgPSBhbWRncHVfcmFzX2Vycm9yX2lu
amVjdChhZGV2LCAmZGF0YS5pbmplY3QpOwogCQlicmVhazsKKwljYXNlIDM6CisJCWFtZGdwdV9y
YXNfZ2V0X2NvbnRleHQoYWRldiktPnJlYm9vdCA9IHRydWU7CisJCWJyZWFrOwogCWRlZmF1bHQ6
CiAJCXJldCA9IC1FSU5WQUw7CiAJCWJyZWFrOwpAQCAtMTczMyw2ICsxNzM4LDggQEAgaW50IGFt
ZGdwdV9yYXNfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHZvaWQgYW1kZ3B1X3Jh
c19nbG9iYWxfcmFzX2lzcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAlpZiAoYXRv
bWljX2NtcHhjaGcoJmFtZGdwdV9yYXNfaW5faW50ciwgMCwgMSkgPT0gMCkgewotCQlEUk1fV0FS
TigiUkFTIGV2ZW50IG9mIHR5cGUgRVJSRVZFTlRfQVRIVUJfSU5URVJSVVBUIGRldGVjdGVkISBT
dG9wcGluZyBhbGwgR1BVIGpvYnMuXG4iKTsKKwkJRFJNX1dBUk4oIlJBUyBldmVudCBvZiB0eXBl
IEVSUkVWRU5UX0FUSFVCX0lOVEVSUlVQVCBkZXRlY3RlZCFcbiIpOworCisJCWFtZGdwdV9yYXNf
cmVzZXRfZ3B1KGFkZXYsIGZhbHNlKTsKIAl9CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmgKaW5kZXggM2VjMmE4Ny4uYTgzZWM5OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuaApAQCAtMzMzLDYgKzMzMyw3IEBAIHN0cnVjdCBhbWRncHVfcmFz
IHsKIAlzdHJ1Y3QgbXV0ZXggcmVjb3ZlcnlfbG9jazsKIAogCXVpbnQzMl90IGZsYWdzOworCWJv
b2wgcmVib290OwogfTsKIAogc3RydWN0IHJhc19mc19kYXRhIHsKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
