Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD8B10C3DC
	for <lists+amd-gfx@lfdr.de>; Thu, 28 Nov 2019 07:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78DD6E045;
	Thu, 28 Nov 2019 06:22:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740075.outbound.protection.outlook.com [40.107.74.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D9E6E045
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 Nov 2019 06:22:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1QnIiz6NX1yboORjWD/GnHN2PMM5ZnAc76oWXZrAwQBsP7v25EjMjmMyYh7B5+biAEDUO6UzCRygSSBsEkjxIz2fapVOEDEjzylpCUcFdg8vBE/gNmRqTmdzbFMdi1zyzv6ZmPO0GrjPxE3mE3HfhNMypv304+IRyeBt1oggAbuwN/od4DlMhpMPl/qlJZKXjMUOTXiK5N+iKR24LxrehQvG8IZPPtBlxwPyQMRFa1ywbQG8hKMPycRNP+fn1cRCglFUdOfYxeeF3y5GG3pimWeTTw7iH8SaX5D29wQb9XRWCk+Z7MOwU+rPnw6k9SN2RIEP4W2RBzueOUowp6nJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NVqMAzJo3fJbcpY3DzQ85FLFFrX3sMS6VVHkNAWdSc=;
 b=VSUkQK5Os66AqtIS8FefQnAQnVTn42JJDMGo9nt2X1Bs/+2dvILWGlKRDQw3f/QdsEeW1KI6dPmriZ0+gMt2mcHtxjd2N9ig8+MMl9fR1tSJ9rlahQAXeNp0CD9ggFebicV7iHnurhmRHnXBFyqFU13XeyuDl8uB225mipx8QfY0mI1Pm0goAw3PuwlUyya5ny3aBh234oBl12JTPpRFRbLO8wjWCmtvvLMrobQqVYhTyBg0xmQ2t0ulLYkQh1Rap8xOax52RNA80MXNI2ZEkzvAHx/hwradw8uSx7HZSkpKPiamayCMliB1oR6ADu02gEhuLkfZK30l94AGEkzXgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0048.namprd12.prod.outlook.com (2603:10b6:301:2::34)
 by MWHPR1201MB0093.namprd12.prod.outlook.com (2603:10b6:301:54::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16; Thu, 28 Nov
 2019 06:22:19 +0000
Received: from BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::201) by MWHPR12CA0048.outlook.office365.com
 (2603:10b6:301:2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18 via Frontend
 Transport; Thu, 28 Nov 2019 06:22:19 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT061.mail.protection.outlook.com (10.13.177.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Thu, 28 Nov 2019 06:22:19 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 28 Nov
 2019 00:22:18 -0600
Received: from monk-build.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 28 Nov 2019 00:22:17 -0600
From: Monk Liu <Monk.Liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: fix calltrace during kmd unload(v2)
Date: Thu, 28 Nov 2019 14:22:14 +0800
Message-ID: <1574922134-12740-1-git-send-email-Monk.Liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(428003)(199004)(189003)(43544003)(2351001)(26005)(7696005)(14444005)(48376002)(51416003)(16586007)(5660300002)(186003)(316002)(2906002)(4326008)(8676002)(6666004)(36756003)(426003)(305945005)(50226002)(336012)(6916009)(81156014)(356004)(70206006)(81166006)(70586007)(2616005)(478600001)(53416004)(86362001)(8936002)(47776003)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0093; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0fc5a58-1701-4d54-a8d5-08d773cb525f
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0093:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0093AFF98C4BAB696F08E42B84470@MWHPR1201MB0093.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Forefront-PRVS: 0235CBE7D0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uqrL7BFjWqfnMAMaFszk3N1ax9ggybRx6lKcuIFyPWZS9sgj+PyvAAijLks8gUWysBU1HSd/kfGW6HdHyJaXU/sJldorLBpRBmQTTJv/on0bkNUISCZjd4KyaYx8V7kdzSgUQTd0REz2T+vDOliPhwcedcbe9IgootSvwjRgWtQ+8lgz0rQXNc/GRQHq/63GyaTjVRiWkj6MogqTg3BdnV81srDkXiF9JkLSqHsOeoEdzsTdt3fJ3mi2PiTnwdlXjqj6ILDIrW+TTLrg9d2V5dREEe4rsTtDAT1/kYNS00KSmvTdNivIQhj/myppr4vwzi9HNUGPAcJ5xh4UgXMLuczxooMflPcFl/TT5TXi61GnHhvfIaNGapbQDsr5Ym263hEFeuKNgQI5h4FIzgkqCfJXFvbDMirQaHhXZK3uoVI0XhAJ5YhOplY203dg65Um
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2019 06:22:19.3350 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0fc5a58-1701-4d54-a8d5-08d773cb525f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0093
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NVqMAzJo3fJbcpY3DzQ85FLFFrX3sMS6VVHkNAWdSc=;
 b=VJzqLPFhx4BGHQ6yKGMnSKkO3ZS/DHg1EvW2H+tfZ5G2Z+OnsLF3S4IghJc38R5XpSRtiFUmnG5dUKrDC7S99zuCM/ZGcApJN7unRmiJ8yqTCtFZaxxtSOVmLMadPnx0mcSNtavBg2oBU6wwPh0Rh1MHtnEyjpip3H/I+uNKJlA=
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

a2VybmVsIHdvdWxkIHJlcG9ydCBhIHdhcm5pbmcgb24gZG91YmxlIHVucGluCm9uIHRoZSBjc2Ig
Qk8gYmVjYXVzZSB3ZSB1bnBpbiBpdCBkdXJpbmcgaHdfZmluaQpidXQgYWN0dWFsbHkgd2UgZG9u
J3QgbmVlZCB0byBwaW4vdW5waW4gaXQgZHVyaW5nCmh3X2luaXQvZmluaSBzaW5jZSBpdCBpcyBj
cmVhdGVkIHdpdGgga2VybmVsIHBpbm5lZAoKdjI6CmdldF9jc2IgaW4gaW5pdF9ybGMgc28gaHdf
aW5pdCgpIHdpbGwgbWFrZSBDU0lCIGNvbnRlbnQKYmFjayBldmVuIGFmdGVyIHJlc2V0IG9yIHMz
Lgp0YWtlIGNhcmUgb2YgZ2Z4Ny84IGFzIHdlbGwKCnJlbW92ZSBhbGwgdGhvc2UgdXNlbGVzcyBj
b2RlIGZvciBnZng5LzEwCgpTaWduZWQtb2ZmLWJ5OiBNb25rIExpdSA8TW9uay5MaXVAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmxjLmMgfCAgOCAtLS0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgIHwgNTggKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djdfMC5jICAgfCAgMiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYyAg
IHwgNDAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92OV8wLmMgICB8IDQwICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiA1IGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTQzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ybGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9ybGMuYwppbmRleCBjODc5M2U2Li5lODMyYjJhIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmxjLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JsYy5jCkBAIC0xMjQsNyArMTI0LDYgQEAgaW50IGFtZGdw
dV9nZnhfcmxjX2luaXRfc3Ioc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUzMiBkd3MpCiAg
Ki8KIGludCBhbWRncHVfZ2Z4X3JsY19pbml0X2NzYihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKIHsKLQl2b2xhdGlsZSB1MzIgKmRzdF9wdHI7CiAJdTMyIGR3czsKIAlpbnQgcjsKIApAQCAt
MTQxLDEzICsxNDAsNiBAQCBpbnQgYW1kZ3B1X2dmeF9ybGNfaW5pdF9jc2Ioc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiAJCXJldHVybiByOwogCX0KIAotCS8qIHNldCB1cCB0aGUgY3MgYnVm
ZmVyICovCi0JZHN0X3B0ciA9IGFkZXYtPmdmeC5ybGMuY3NfcHRyOwotCWFkZXYtPmdmeC5ybGMu
ZnVuY3MtPmdldF9jc2JfYnVmZmVyKGFkZXYsIGRzdF9wdHIpOwotCWFtZGdwdV9ib19rdW5tYXAo
YWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOwotCWFtZGdwdV9ib191bnBpbihhZGV2LT5n
ZngucmxjLmNsZWFyX3N0YXRlX29iaik7Ci0JYW1kZ3B1X2JvX3VucmVzZXJ2ZShhZGV2LT5nZngu
cmxjLmNsZWFyX3N0YXRlX29iaik7Ci0KIAlyZXR1cm4gMDsKIH0KIApkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCA3MzcyOTA0Li43NzAzYjI1IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwpAQCAtOTkxLDM5ICs5OTEsNiBAQCBzdGF0aWMgaW50
IGdmeF92MTBfMF9ybGNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlyZXR1cm4g
MDsKIH0KIAotc3RhdGljIGludCBnZnhfdjEwXzBfY3NiX3ZyYW1fcGluKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQotewotCWludCByOwotCi0JciA9IGFtZGdwdV9ib19yZXNlcnZlKGFkZXYt
PmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqLCBmYWxzZSk7Ci0JaWYgKHVubGlrZWx5KHIgIT0gMCkp
Ci0JCXJldHVybiByOwotCi0JciA9IGFtZGdwdV9ib19waW4oYWRldi0+Z2Z4LnJsYy5jbGVhcl9z
dGF0ZV9vYmosCi0JCQlBTURHUFVfR0VNX0RPTUFJTl9WUkFNKTsKLQlpZiAoIXIpCi0JCWFkZXYt
PmdmeC5ybGMuY2xlYXJfc3RhdGVfZ3B1X2FkZHIgPQotCQkJYW1kZ3B1X2JvX2dwdV9vZmZzZXQo
YWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOwotCi0JYW1kZ3B1X2JvX3VucmVzZXJ2ZShh
ZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaik7Ci0KLQlyZXR1cm4gcjsKLX0KLQotc3RhdGlj
IHZvaWQgZ2Z4X3YxMF8wX2NzYl92cmFtX3VucGluKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQotewotCWludCByOwotCi0JaWYgKCFhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaikKLQkJ
cmV0dXJuOwotCi0JciA9IGFtZGdwdV9ib19yZXNlcnZlKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3Rh
dGVfb2JqLCB0cnVlKTsKLQlpZiAobGlrZWx5KHIgPT0gMCkpIHsKLQkJYW1kZ3B1X2JvX3VucGlu
KGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqKTsKLQkJYW1kZ3B1X2JvX3VucmVzZXJ2ZShh
ZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaik7Ci0JfQotfQotCiBzdGF0aWMgdm9pZCBnZnhf
djEwXzBfbWVjX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJYW1kZ3B1X2Jv
X2ZyZWVfa2VybmVsKCZhZGV2LT5nZngubWVjLmhwZF9lb3Bfb2JqLCBOVUxMLCBOVUxMKTsKQEAg
LTE3ODUsMjUgKzE3NTIsNyBAQCBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfZW5hYmxlX2d1aV9pZGxl
X2ludGVycnVwdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAogc3RhdGljIGludCBnZnhf
djEwXzBfaW5pdF9jc2Ioc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7Ci0JaW50IHI7Ci0K
LQlpZiAoYWRldi0+aW5fZ3B1X3Jlc2V0KSB7Ci0JCXIgPSBhbWRncHVfYm9fcmVzZXJ2ZShhZGV2
LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaiwgZmFsc2UpOwotCQlpZiAocikKLQkJCXJldHVybiBy
OwotCi0JCXIgPSBhbWRncHVfYm9fa21hcChhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaiwK
LQkJCQkgICAodm9pZCAqKikmYWRldi0+Z2Z4LnJsYy5jc19wdHIpOwotCQlpZiAoIXIpIHsKLQkJ
CWFkZXYtPmdmeC5ybGMuZnVuY3MtPmdldF9jc2JfYnVmZmVyKGFkZXYsCi0JCQkJCWFkZXYtPmdm
eC5ybGMuY3NfcHRyKTsKLQkJCWFtZGdwdV9ib19rdW5tYXAoYWRldi0+Z2Z4LnJsYy5jbGVhcl9z
dGF0ZV9vYmopOwotCQl9Ci0KLQkJYW1kZ3B1X2JvX3VucmVzZXJ2ZShhZGV2LT5nZngucmxjLmNs
ZWFyX3N0YXRlX29iaik7Ci0JCWlmIChyKQotCQkJcmV0dXJuIHI7Ci0JfQorCWFkZXYtPmdmeC5y
bGMuZnVuY3MtPmdldF9jc2JfYnVmZmVyKGFkZXYsIGFkZXYtPmdmeC5ybGMuY3NfcHRyKTsKIAog
CS8qIGNzaWIgKi8KIAlXUkVHMzJfU09DMTUoR0MsIDAsIG1tUkxDX0NTSUJfQUREUl9ISSwKQEAg
LTM3NzQsMTAgKzM3MjMsNiBAQCBzdGF0aWMgaW50IGdmeF92MTBfMF9od19pbml0KHZvaWQgKmhh
bmRsZSkKIAlpbnQgcjsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqKWhhbmRsZTsKIAotCXIgPSBnZnhfdjEwXzBfY3NiX3ZyYW1fcGluKGFkZXYp
OwotCWlmIChyKQotCQlyZXR1cm4gcjsKLQogCWlmICghYW1kZ3B1X2VtdV9tb2RlKQogCQlnZnhf
djEwXzBfaW5pdF9nb2xkZW5fcmVnaXN0ZXJzKGFkZXYpOwogCkBAIC0zODY1LDcgKzM4MTAsNiBA
QCBzdGF0aWMgaW50IGdmeF92MTBfMF9od19maW5pKHZvaWQgKmhhbmRsZSkKIAl9CiAJZ2Z4X3Yx
MF8wX2NwX2VuYWJsZShhZGV2LCBmYWxzZSk7CiAJZ2Z4X3YxMF8wX2VuYWJsZV9ndWlfaWRsZV9p
bnRlcnJ1cHQoYWRldiwgZmFsc2UpOwotCWdmeF92MTBfMF9jc2JfdnJhbV91bnBpbihhZGV2KTsK
IAogCXJldHVybiAwOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3Y3XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92N18wLmMKaW5kZXgg
NDNhZThmYy4uNjQ4ZDc2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3Y3XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jCkBA
IC00NTU0LDYgKzQ1NTQsOCBAQCBzdGF0aWMgaW50IGdmeF92N18wX2h3X2luaXQodm9pZCAqaGFu
ZGxlKQogCiAJZ2Z4X3Y3XzBfY29uc3RhbnRzX2luaXQoYWRldik7CiAKKwkvKiBpbml0IENTQiAq
LworCWFkZXYtPmdmeC5ybGMuZnVuY3MtPmdldF9jc2JfYnVmZmVyKGFkZXYsIGFkZXYtPmdmeC5y
bGMuY3NfcHRyKTsKIAkvKiBpbml0IHJsYyAqLwogCXIgPSBhZGV2LT5nZngucmxjLmZ1bmNzLT5y
ZXN1bWUoYWRldik7CiAJaWYgKHIpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjhfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYwpp
bmRleCA4MGI3OTU4Li4zM2M0ZWU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjhfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8w
LmMKQEAgLTEzMjEsMzkgKzEzMjEsNiBAQCBzdGF0aWMgaW50IGdmeF92OF8wX3JsY19pbml0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IGdm
eF92OF8wX2NzYl92cmFtX3BpbihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKLXsKLQlpbnQg
cjsKLQotCXIgPSBhbWRncHVfYm9fcmVzZXJ2ZShhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29i
aiwgZmFsc2UpOwotCWlmICh1bmxpa2VseShyICE9IDApKQotCQlyZXR1cm4gcjsKLQotCXIgPSBh
bWRncHVfYm9fcGluKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqLAotCQkJQU1ER1BVX0dF
TV9ET01BSU5fVlJBTSk7Ci0JaWYgKCFyKQotCQlhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX2dw
dV9hZGRyID0KLQkJCWFtZGdwdV9ib19ncHVfb2Zmc2V0KGFkZXYtPmdmeC5ybGMuY2xlYXJfc3Rh
dGVfb2JqKTsKLQotCWFtZGdwdV9ib191bnJlc2VydmUoYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0
ZV9vYmopOwotCi0JcmV0dXJuIHI7Ci19Ci0KLXN0YXRpYyB2b2lkIGdmeF92OF8wX2NzYl92cmFt
X3VucGluKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQotewotCWludCByOwotCi0JaWYgKCFh
ZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaikKLQkJcmV0dXJuOwotCi0JciA9IGFtZGdwdV9i
b19yZXNlcnZlKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqLCB0cnVlKTsKLQlpZiAobGlr
ZWx5KHIgPT0gMCkpIHsKLQkJYW1kZ3B1X2JvX3VucGluKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3Rh
dGVfb2JqKTsKLQkJYW1kZ3B1X2JvX3VucmVzZXJ2ZShhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRl
X29iaik7Ci0JfQotfQotCiBzdGF0aWMgdm9pZCBnZnhfdjhfMF9tZWNfZmluaShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKIHsKIAlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYtPmdmeC5t
ZWMuaHBkX2VvcF9vYmosIE5VTEwsIE5VTEwpOwpAQCAtMzkxNiw2ICszODgzLDcgQEAgc3RhdGlj
IHZvaWQgZ2Z4X3Y4XzBfZW5hYmxlX2d1aV9pZGxlX2ludGVycnVwdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKIAogc3RhdGljIHZvaWQgZ2Z4X3Y4XzBfaW5pdF9jc2Ioc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiB7CisJYWRldi0+Z2Z4LnJsYy5mdW5jcy0+Z2V0X2NzYl9idWZmZXIo
YWRldiwgYWRldi0+Z2Z4LnJsYy5jc19wdHIpOwogCS8qIGNzaWIgKi8KIAlXUkVHMzIobW1STENf
Q1NJQl9BRERSX0hJLAogCQkJYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9ncHVfYWRkciA+PiAz
Mik7CkBAIC00ODM2LDEwICs0ODA0LDYgQEAgc3RhdGljIGludCBnZnhfdjhfMF9od19pbml0KHZv
aWQgKmhhbmRsZSkKIAlnZnhfdjhfMF9pbml0X2dvbGRlbl9yZWdpc3RlcnMoYWRldik7CiAJZ2Z4
X3Y4XzBfY29uc3RhbnRzX2luaXQoYWRldik7CiAKLQlyID0gZ2Z4X3Y4XzBfY3NiX3ZyYW1fcGlu
KGFkZXYpOwotCWlmIChyKQotCQlyZXR1cm4gcjsKLQogCXIgPSBhZGV2LT5nZngucmxjLmZ1bmNz
LT5yZXN1bWUoYWRldik7CiAJaWYgKHIpCiAJCXJldHVybiByOwpAQCAtNDk1Nyw4ICs0OTIxLDYg
QEAgc3RhdGljIGludCBnZnhfdjhfMF9od19maW5pKHZvaWQgKmhhbmRsZSkKIAkJcHJfZXJyKCJy
bGMgaXMgYnVzeSwgc2tpcCBoYWx0IHJsY1xuIik7CiAJYW1kZ3B1X2dmeF9ybGNfZXhpdF9zYWZl
X21vZGUoYWRldik7CiAKLQlnZnhfdjhfMF9jc2JfdnJhbV91bnBpbihhZGV2KTsKLQogCXJldHVy
biAwOwogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwppbmRleCBlOTA1YWM1
Li42YTI1MWEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAgLTE2ODUs
MzkgKzE2ODUsNiBAQCBzdGF0aWMgaW50IGdmeF92OV8wX3JsY19pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IGdmeF92OV8wX2NzYl92
cmFtX3BpbihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKLXsKLQlpbnQgcjsKLQotCXIgPSBh
bWRncHVfYm9fcmVzZXJ2ZShhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaiwgZmFsc2UpOwot
CWlmICh1bmxpa2VseShyICE9IDApKQotCQlyZXR1cm4gcjsKLQotCXIgPSBhbWRncHVfYm9fcGlu
KGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqLAotCQkJQU1ER1BVX0dFTV9ET01BSU5fVlJB
TSk7Ci0JaWYgKCFyKQotCQlhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX2dwdV9hZGRyID0KLQkJ
CWFtZGdwdV9ib19ncHVfb2Zmc2V0KGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqKTsKLQot
CWFtZGdwdV9ib191bnJlc2VydmUoYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOwotCi0J
cmV0dXJuIHI7Ci19Ci0KLXN0YXRpYyB2b2lkIGdmeF92OV8wX2NzYl92cmFtX3VucGluKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQotewotCWludCByOwotCi0JaWYgKCFhZGV2LT5nZngucmxj
LmNsZWFyX3N0YXRlX29iaikKLQkJcmV0dXJuOwotCi0JciA9IGFtZGdwdV9ib19yZXNlcnZlKGFk
ZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqLCB0cnVlKTsKLQlpZiAobGlrZWx5KHIgPT0gMCkp
IHsKLQkJYW1kZ3B1X2JvX3VucGluKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqKTsKLQkJ
YW1kZ3B1X2JvX3VucmVzZXJ2ZShhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaik7Ci0JfQot
fQotCiBzdGF0aWMgdm9pZCBnZnhfdjlfMF9tZWNfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKIHsKIAlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYtPmdmeC5tZWMuaHBkX2VvcF9v
YmosIE5VTEwsIE5VTEwpOwpAQCAtMjQwNSw2ICsyMzcyLDcgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5
XzBfZW5hYmxlX2d1aV9pZGxlX2ludGVycnVwdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwK
IAogc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfaW5pdF9jc2Ioc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiB7CisJYWRldi0+Z2Z4LnJsYy5mdW5jcy0+Z2V0X2NzYl9idWZmZXIoYWRldiwgYWRldi0+
Z2Z4LnJsYy5jc19wdHIpOwogCS8qIGNzaWIgKi8KIAlXUkVHMzJfUkxDKFNPQzE1X1JFR19PRkZT
RVQoR0MsIDAsIG1tUkxDX0NTSUJfQUREUl9ISSksCiAJCQlhZGV2LT5nZngucmxjLmNsZWFyX3N0
YXRlX2dwdV9hZGRyID4+IDMyKTsKQEAgLTM2OTYsMTAgKzM2NjQsNiBAQCBzdGF0aWMgaW50IGdm
eF92OV8wX2h3X2luaXQodm9pZCAqaGFuZGxlKQogCiAJZ2Z4X3Y5XzBfY29uc3RhbnRzX2luaXQo
YWRldik7CiAKLQlyID0gZ2Z4X3Y5XzBfY3NiX3ZyYW1fcGluKGFkZXYpOwotCWlmIChyKQotCQly
ZXR1cm4gcjsKLQogCXIgPSBhZGV2LT5nZngucmxjLmZ1bmNzLT5yZXN1bWUoYWRldik7CiAJaWYg
KHIpCiAJCXJldHVybiByOwpAQCAtMzc4MSw4ICszNzQ1LDYgQEAgc3RhdGljIGludCBnZnhfdjlf
MF9od19maW5pKHZvaWQgKmhhbmRsZSkKIAlnZnhfdjlfMF9jcF9lbmFibGUoYWRldiwgZmFsc2Up
OwogCWFkZXYtPmdmeC5ybGMuZnVuY3MtPnN0b3AoYWRldik7CiAKLQlnZnhfdjlfMF9jc2JfdnJh
bV91bnBpbihhZGV2KTsKLQogCXJldHVybiAwOwogfQogCi0tIAoyLjcuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
