Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C099710C0A8
	for <lists+amd-gfx@lfdr.de>; Thu, 28 Nov 2019 00:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B983D6E0DA;
	Wed, 27 Nov 2019 23:36:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770078.outbound.protection.outlook.com [40.107.77.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D626E0DA
 for <amd-gfx@lists.freedesktop.org>; Wed, 27 Nov 2019 23:36:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2bllYh4MUqZ2mOPTH7QoW2Fyq43ii/AqVt7BhxSWbFZqGTvpYZf0gxVm+on0wvF/aK0rpBcZLkkdO5FC/QlycYHqwRbxzoQjzt4q/9qtcxQ5twesPyT7XFckOsXwAt6nb27IjpvPGl7g9FpLPNoOexgDRBwL2qrZfWIOmWVreR54zgwTLUAb7hTwqMTvs6h62WeDr7AHozM9IlXm1ft7UvEHlT6T1yEFunN4FZT31oGExMTVoLBb3upRNJp/X0YhYl5M+IXtqhg7ufl/dW+yWvYBVKbGh2u1FAUKHkEWwrvrudHT2jLIWO6rqK2D8eTJQC8SpqotwMyzhdbnI+rEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUGeYGMaNRonbXYKIu/M+sG22HtoKN7wWgvueHbdfQE=;
 b=FuzdSEdTfuqz8V5Cgamv7BLkwyzisOUjKnQSh+uP1nHCcks3a+5AjwvZCZ5b8KC2xk3gqSCZB8/OrJolTNml1bMOvUEuHkzFkQ6N84a79GzdBeeASyIiUtkEV7jvM7aN3DUH8ZkheZnglT0QmQk09kts9bQ7ml6SN819+24ADuXR2IilvR6J52qT0eChh6tphmySheUcf1aTvzUaDy+Yrs4FP+xL0gSXnFfqWh/IJOI+TmmqTtZFHoPY4MXf4YWfAzxwbr+Yg/DgPfq6c0YWmsSQ6ZiovcFpXQ9+xXQSijJ6lRbOiEputEZQ+1j//toN2yeC6IaJVoW06Nc9L8fU/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3355.namprd12.prod.outlook.com (20.178.29.90) by
 DM6PR12MB3564.namprd12.prod.outlook.com (20.178.31.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Wed, 27 Nov 2019 23:36:52 +0000
Received: from DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::71fe:9848:c834:1cd6]) by DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::71fe:9848:c834:1cd6%3]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 23:36:52 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: implement TMZ accessor (v3)
Date: Wed, 27 Nov 2019 18:35:35 -0500
Message-Id: <20191127233535.379773-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.24.0.155.gd9f6f3b619
In-Reply-To: <6394037a-a7d9-b38a-685c-1ab0cb7cec9b@amd.com>
References: <6394037a-a7d9-b38a-685c-1ab0cb7cec9b@amd.com>
X-ClientProxiedBy: YTXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::21) To DM6PR12MB3355.namprd12.prod.outlook.com
 (2603:10b6:5:115::26)
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.0.155.gd9f6f3b619
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bd0edf8b-7345-4a63-62a5-08d77392ae5d
X-MS-TrafficTypeDiagnostic: DM6PR12MB3564:|DM6PR12MB3564:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3564729903E62E8C44FD41DE99440@DM6PR12MB3564.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 023495660C
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(189003)(199004)(66066001)(8936002)(26005)(386003)(316002)(36756003)(25786009)(2361001)(44832011)(50466002)(446003)(2616005)(66476007)(11346002)(99286004)(81156014)(66556008)(2906002)(47776003)(14454004)(6916009)(14444005)(1076003)(3846002)(2351001)(66946007)(81166006)(7736002)(23676004)(52116002)(76176011)(30864003)(4326008)(50226002)(478600001)(86362001)(5660300002)(8676002)(66574012)(305945005)(6116002)(6436002)(6666004)(6512007)(186003)(2870700001)(54906003)(6486002)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3564;
 H:DM6PR12MB3355.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 35A2Xspvhrmi0vI6Ky1yIHf7LkAJm1Tc/xyBWv+ahRQlgOBJO/kbFGD3C2U00vDTPjtauzW/gkiLZLFkSrBx5xwXTnuP6eg3cS+3XvPCZernSC0NUPCcQvMJqIb1SNRt9pQG4A3QuqE3MRNnJGM9DSjqzjdoaoGtWPeLIH7Fy2gyjeSTHp2Yf6znZJbT5ma/dc/y0OsFppXC5NWYyZyrlojmdgMVYT99uDNLVNr72irWjfQpTV8VcGJ90eD89HKIQKXKo0ckIwgDwqzZG5ZmGAW4xwBCrq6dTJIcbZdUoGX7NWs+WUvEHYBPKi3A2UYp+cKEz1v8/2L9YOLmTAB6neN6HBmZlK8MPoddwDiqJ8L61ZMkL8mis2Rh5IaRcurGx7RHT3IHSKxN6q5pXMes1ri7iyHc2gMYfKT5mrPm8v8Ced3VjGepNP4VkElj7D+i
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0edf8b-7345-4a63-62a5-08d77392ae5d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2019 23:36:52.5408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaXAUKmx2y5cmSJuTc0u0bq26Z4ulFabkY2nwHz0+Ati4kOaeHPjQjflTqrfMF+J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3564
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUGeYGMaNRonbXYKIu/M+sG22HtoKN7wWgvueHbdfQE=;
 b=Xbgc9I/ay9zhzW0S/awxO8Myg2xVbp4yCFEQ4Kjxen92Ftu/uxU8kyJIa7XD1NYfTeEcef9acQd0S1R88Nq1fLOgHYgrYoN1Oq/NGJ+VgTc/zq3IXB9PKKkPE+sFPkq+1ySJ7Sf0DYqjfzOjD8D4iP4WcrgFNGeLy0G+uKgNJMs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luben.Tuikov@amd.com; 
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW1wbGVtZW50IGFuIGFjY2Vzc29yIG9mIGFkZXYtPnRtei5lbmFibGVkLiBMZXQgbm90CmNvZGUg
YXJvdW5kIGFjY2VzcyBpdCBhcyAiaWYgKGFkZXYtPnRtei5lbmFibGVkKSIKYXMgdGhlIG9yZ2Fu
aXphdGlvbiBtYXkgY2hhbmdlLiBJbnN0ZWFkLi4uCgpSZWNydWl0ICJib29sIGFtZGdwdV9pc190
bXooYWRldikiIHRvIHJldHVybgpleGFjdGx5IHRoaXMgQm9vbGVhbiB2YWx1ZS4gVGhhdCBpcywg
dGhpcyBmdW5jdGlvbgppcyBub3cgYW4gYWNjZXNzb3Igb2YgYW4gYWxyZWFkeSBpbml0aWFsaXpl
ZCBhbmQKc2V0IGFkZXYgYW5kIGFkZXYtPnRtei4KCkFkZCAidm9pZCBhbWRncHVfZ21jX3Rtel9z
ZXQoYWRldikiIHRvIGNoZWNrIGFuZApzZXQgYWRldi0+Z21jLnRtel9lbmFibGVkIGF0IGluaXRp
YWxpemF0aW9uCnRpbWUuIEFmdGVyIHdoaWNoIG9uZSB1c2VzICJib29sCmFtZGdwdV9pc190bXoo
YWRldikiIHRvIHF1ZXJ5IHdoZXRoZXIgYWRldgpzdXBwb3J0cyBUTVouCgpBbHNvLCByZW1vdmUg
Y2lyY3VsYXIgaGVhZGVyIGZpbGUgaW5jbHVkZS4KCnYyOiBSZW1vdmUgYW1kZ3B1X3Rtei5bY2hd
IGFzIHJlcXVlc3RlZC4KdjM6IE1vdmUgVE1aIGludG8gR01DLgoKU2lnbmVkLW9mZi1ieTogTHVi
ZW4gVHVpa292IDxsdWJlbi50dWlrb3ZAYW1kLmNvbT4KQWNrZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9NYWtlZmlsZSAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1LmggICAgICAgIHwgMTAgKystLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYyB8ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z2VtLmMgICAgfCAgNCArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5j
ICAgIHwgMjUgKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
bWMuaCAgICB8ICA0ICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdG16LmMg
ICAgfCA1MiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdG16LmggICAgfCAzOSAtLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjEwXzAuYyAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3Y5XzAuYyAgICAgIHwgIDIgKy0KIDEwIGZpbGVzIGNoYW5nZWQsIDQwIGluc2Vy
dGlvbnMoKyksIDEwMyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdG16LmMKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdG16LmgKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01h
a2VmaWxlCmluZGV4IDgzZWUxYzY3NmUzYS4uN2FlM2IyMmM1NjI4IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9NYWtlZmlsZQpAQCAtNTUsNyArNTUsNyBAQCBhbWRncHUteSArPSBhbWRncHVfZGV2
aWNlLm8gYW1kZ3B1X2ttcy5vIFwKIAlhbWRncHVfdmZfZXJyb3IubyBhbWRncHVfc2NoZWQubyBh
bWRncHVfZGVidWdmcy5vIGFtZGdwdV9pZHMubyBcCiAJYW1kZ3B1X2dtYy5vIGFtZGdwdV9tbWh1
Yi5vIGFtZGdwdV94Z21pLm8gYW1kZ3B1X2NzYS5vIGFtZGdwdV9yYXMubyBhbWRncHVfdm1fY3B1
Lm8gXAogCWFtZGdwdV92bV9zZG1hLm8gYW1kZ3B1X2Rpc2NvdmVyeS5vIGFtZGdwdV9yYXNfZWVw
cm9tLm8gYW1kZ3B1X25iaW8ubyBcCi0JYW1kZ3B1X3VtYy5vIHNtdV92MTFfMF9pMmMubyBhbWRn
cHVfdG16Lm8KKwlhbWRncHVfdW1jLm8gc211X3YxMV8wX2kyYy5vCiAKIGFtZGdwdS0kKENPTkZJ
R19QRVJGX0VWRU5UUykgKz0gYW1kZ3B1X3BtdS5vCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmgKaW5kZXggZDEyMGZlNThlYmVhLi5jZWUzN2E0ZjgzMjcgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdS5oCkBAIC05MCw3ICs5MCw2IEBACiAjaW5jbHVkZSAiYW1kZ3B1X21lcy5o
IgogI2luY2x1ZGUgImFtZGdwdV91bWMuaCIKICNpbmNsdWRlICJhbWRncHVfbW1odWIuaCIKLSNp
bmNsdWRlICJhbWRncHVfdG16LmgiCiAKICNkZWZpbmUgTUFYX0dQVV9JTlNUQU5DRQkJMTYKIApA
QCAtOTM3LDkgKzkzNiw2IEBAIHN0cnVjdCBhbWRncHVfZGV2aWNlIHsKIAlib29sICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGVuYWJsZV9tZXM7CiAJc3RydWN0IGFtZGdwdV9tZXMgICAgICAg
ICAgICAgICBtZXM7CiAKLQkvKiB0bXogKi8KLQlzdHJ1Y3QgYW1kZ3B1X3RtegkJdG16OwotCiAJ
c3RydWN0IGFtZGdwdV9pcF9ibG9jayAgICAgICAgICBpcF9ibG9ja3NbQU1ER1BVX01BWF9JUF9O
VU1dOwogCWludAkJCQludW1faXBfYmxvY2tzOwogCXN0cnVjdCBtdXRleAltbl9sb2NrOwpAQCAt
MTI2Niw1ICsxMjYyLDkgQEAgX25hbWUjI19zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwJCQkJCVwK
IAkJCQkJCQkJCVwKIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSBwbXVfYXR0cl8jI19u
YW1lID0gX19BVFRSX1JPKF9uYW1lKQogCi0jZW5kaWYKK3N0YXRpYyBpbmxpbmUgYm9vbCBhbWRn
cHVfaXNfdG16KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworICAgICAgIHJldHVybiBh
ZGV2LT5nbWMudG16X2VuYWJsZWQ7Cit9CiAKKyNlbmRpZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IGIxNDA4YzVlNDY0MC4uOGRjOTZhZTlmMWM2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCkBAIC02NCw3ICs2
NCw2IEBACiAjaW5jbHVkZSAiYW1kZ3B1X3hnbWkuaCIKICNpbmNsdWRlICJhbWRncHVfcmFzLmgi
CiAjaW5jbHVkZSAiYW1kZ3B1X3BtdS5oIgotI2luY2x1ZGUgImFtZGdwdV90bXouaCIKIAogI2lu
Y2x1ZGUgPGxpbnV4L3N1c3BlbmQuaD4KIApAQCAtMTA3Myw3ICsxMDcyLDcgQEAgc3RhdGljIGlu
dCBhbWRncHVfZGV2aWNlX2NoZWNrX2FyZ3VtZW50cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKIAogCWFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9IGFtZGdwdV91Y29kZV9nZXRfbG9hZF90
eXBlKGFkZXYsIGFtZGdwdV9md19sb2FkX3R5cGUpOwogCi0JYWRldi0+dG16LmVuYWJsZWQgPSBh
bWRncHVfaXNfdG16KGFkZXYpOworCWFtZGdwdV9nbWNfdG16X3NldChhZGV2KTsKIAogCXJldHVy
biByZXQ7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKaW5kZXggNzE2
NDk2YTg1OGU3Li5mNDFkNDFjMjk0OGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZ2VtLmMKQEAgLTIzNSw4ICsyMzUsOCBAQCBpbnQgYW1kZ3B1X2dlbV9jcmVhdGVfaW9jdGwo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAlpZiAoYXJncy0+aW4uZG9tYWlu
cyAmIH5BTURHUFVfR0VNX0RPTUFJTl9NQVNLKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCWlmICgh
YWRldi0+dG16LmVuYWJsZWQgJiYgKGZsYWdzICYgQU1ER1BVX0dFTV9DUkVBVEVfRU5DUllQVEVE
KSkgewotCQlEUk1fRVJST1IoIkNhbm5vdCBhbGxvY2F0ZSBzZWN1cmUgYnVmZmVyIHdoaWxlIHRt
eiBpcyBkaXNhYmxlZFxuIik7CisJaWYgKGFtZGdwdV9pc190bXooYWRldikgJiYgKGZsYWdzICYg
QU1ER1BVX0dFTV9DUkVBVEVfRU5DUllQVEVEKSkgeworCQlEUk1fRVJST1IoIkNhbm5vdCBhbGxv
Y2F0ZSBzZWN1cmUgYnVmZmVyIHNpbmNlIFRNWiBpcyBkaXNhYmxlZFxuIik7CiAJCXJldHVybiAt
RUlOVkFMOwogCX0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dtYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5jCmluZGV4
IGExMmYzM2MwZjVkZi4uODBkYjRiNzlhZjMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZ21jLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2dtYy5jCkBAIC0zMzMsMyArMzMzLDI4IEBAIHZvaWQgYW1kZ3B1X2dtY19yYXNfZmlu
aShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlhbWRncHVfbW1odWJfcmFzX2ZpbmkoYWRl
dik7CiAJYW1kZ3B1X3hnbWlfcmFzX2ZpbmkoYWRldik7CiB9CisKKy8qKgorICogYW1kZ3B1X3Rt
el9zZXQgLS0gY2hlY2sgYW5kIHNldCBpZiBhIGRldmljZSBzdXBwb3J0cyBUTVoKKyAqIEBhZGV2
OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKKyAqCisgKiBDaGVjayBhbmQgc2V0IGlmIGFuIHRoZSBk
ZXZpY2UgQGFkZXYgc3VwcG9ydHMgVHJ1c3RlZCBNZW1vcnkKKyAqIFpvbmVzIChUTVopLgorICov
Cit2b2lkIGFtZGdwdV9nbWNfdG16X3NldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sK
KwlpZiAoIWFtZGdwdV90bXopCisJCXJldHVybjsKKworCWlmIChhZGV2LT5hc2ljX3R5cGUgPCBD
SElQX1JBVkVOIHx8CisJICAgIGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX0FSQ1RVUlVTKSB7CisJ
CWFkZXYtPmdtYy50bXpfZW5hYmxlZCA9IGZhbHNlOworCQlkZXZfd2FybihhZGV2LT5kZXYsCisJ
CQkgIlRydXN0ZWQgTWVtb3J5IFpvbmUgKFRNWikgZmVhdHVyZSBub3Qgc3VwcG9ydGVkXG4iKTsK
Kwl9IGVsc2UgeworCisJCWFkZXYtPmdtYy50bXpfZW5hYmxlZCA9IHRydWU7CisJCWRldl9pbmZv
KGFkZXYtPmRldiwKKwkJCSAiVHJ1c3RlZCBNZW1vcnkgWm9uZSAoVE1aKSBmZWF0dXJlIHN1cHBv
cnRlZCBhbmQgZW5hYmxlZFxuIik7CisJfQorfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dtYy5oCmluZGV4IDQwNjczNmExYmQzZC4uNTE4NjNiMmI0MmFhIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oCkBAIC0yMDgsNiArMjA4LDggQEAgc3RydWN0IGFt
ZGdwdV9nbWMgewogCX0gZmF1bHRfaGFzaFtBTURHUFVfR01DX0ZBVUxUX0hBU0hfU0laRV07CiAJ
dWludDY0X3QJCWxhc3RfZmF1bHQ6QU1ER1BVX0dNQ19GQVVMVF9SSU5HX09SREVSOwogCisJYm9v
bCB0bXpfZW5hYmxlZDsKKwogCWNvbnN0IHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzCSpnbWNfZnVu
Y3M7CiAKIAlzdHJ1Y3QgYW1kZ3B1X3hnbWkgeGdtaTsKQEAgLTI2Nyw0ICsyNjksNiBAQCBib29s
IGFtZGdwdV9nbWNfZmlsdGVyX2ZhdWx0cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWlu
dDY0X3QgYWRkciwKIGludCBhbWRncHVfZ21jX3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpOwogdm9pZCBhbWRncHVfZ21jX3Jhc19maW5pKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KTsKIAorZXh0ZXJuIHZvaWQgYW1kZ3B1X2dtY190bXpfc2V0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KTsKKwogI2VuZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdG16LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdG16LmMKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDgyMzUyN2EwZmE0Ny4uMDAw
MDAwMDAwMDAwCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90bXouYwor
KysgL2Rldi9udWxsCkBAIC0xLDUyICswLDAgQEAKLS8qCi0gKiBDb3B5cmlnaHQgMjAxOSBBZHZh
bmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuCi0gKgotICogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3Jh
bnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEKLSAqIGNvcHkg
b2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUg
IlNvZnR3YXJlIiksCi0gKiB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0
aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uCi0gKiB0aGUgcmlnaHRzIHRvIHVzZSwg
Y29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwKLSAq
IGFuZC9vciBzZWxsIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29u
cyB0byB3aG9tIHRoZQotICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0
IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKLSAqCi0gKiBUaGUgYWJvdmUgY29weXJpZ2h0
IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbgot
ICogYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCi0g
KgotICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkg
T0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKLSAqIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJ
TUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAotICogRklUTkVTUyBG
T1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gIElOIE5PIEVWRU5U
IFNIQUxMCi0gKiBUSEUgQ09QWVJJR0hUIEhPTERFUihTKSBPUiBBVVRIT1IoUykgQkUgTElBQkxF
IEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IKLSAqIE9USEVSIExJQUJJTElUWSwgV0hFVEhFUiBJ
TiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLAotICogQVJJU0lORyBG
Uk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNF
IE9SCi0gKiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCi0gKi8KLQotI2luY2x1ZGUg
PGxpbnV4L2RldmljZS5oPgotCi0jaW5jbHVkZSA8ZHJtL2FtZF9hc2ljX3R5cGUuaD4KLQotI2lu
Y2x1ZGUgImFtZGdwdS5oIgotI2luY2x1ZGUgImFtZGdwdV90bXouaCIKLQotCi0vKioKLSAqIGFt
ZGdwdV9pc190bXogLSB2YWxpZGF0ZSB0cnVzdCBtZW1vcnkgem9uZQotICoKLSAqIEBhZGV2OiBh
bWRncHVfZGV2aWNlIHBvaW50ZXIKLSAqCi0gKiBSZXR1cm4gdHJ1ZSBpZiBAZGV2IHN1cHBvcnRz
IHRydXN0ZWQgbWVtb3J5IHpvbmVzIChUTVopLCBhbmQgcmV0dXJuIGZhbHNlIGlmCi0gKiBAZGV2
IGRvZXMgbm90IHN1cHBvcnQgVE1aLgotICovCi1ib29sIGFtZGdwdV9pc190bXooc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCi17Ci0JaWYgKCFhbWRncHVfdG16KQotCQlyZXR1cm4gZmFsc2U7
Ci0KLQlpZiAoYWRldi0+YXNpY190eXBlIDwgQ0hJUF9SQVZFTiB8fCBhZGV2LT5hc2ljX3R5cGUg
PT0gQ0hJUF9BUkNUVVJVUykgewotCQlkZXZfd2FybihhZGV2LT5kZXYsICJkb2Vzbid0IHN1cHBv
cnQgdHJ1c3RlZCBtZW1vcnkgem9uZXMgKFRNWilcbiIpOwotCQlyZXR1cm4gZmFsc2U7Ci0JfQot
Ci0JZGV2X2luZm8oYWRldi0+ZGV2LCAiVE1aIGZlYXR1cmUgaXMgZW5hYmxlZFxuIik7Ci0KLQly
ZXR1cm4gdHJ1ZTsKLX0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90bXouaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90bXouaApkZWxl
dGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMjhlMDUxNzdmYjg5Li4wMDAwMDAwMDAwMDAKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Rtei5oCisrKyAvZGV2L251bGwK
QEAgLTEsMzkgKzAsMCBAQAotLyoKLSAqIENvcHlyaWdodCAyMDE5IEFkdmFuY2VkIE1pY3JvIERl
dmljZXMsIEluYy4KLSAqCi0gKiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9m
IGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYQotICogY29weSBvZiB0aGlzIHNvZnR3
YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwK
LSAqIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGlu
ZyB3aXRob3V0IGxpbWl0YXRpb24KLSAqIHRoZSByaWdodHMgdG8gdXNlLCBjb3B5LCBtb2RpZnks
IG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLAotICogYW5kL29yIHNlbGwg
Y29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhl
Ci0gKiBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxv
d2luZyBjb25kaXRpb25zOgotICoKLSAqIFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0
aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGluCi0gKiBhbGwgY29waWVz
IG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KLSAqCi0gKiBUSEUgU09G
VFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwg
RVhQUkVTUyBPUgotICogSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUg
V0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCi0gKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VM
QVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiAgSU4gTk8gRVZFTlQgU0hBTEwKLSAqIFRI
RSBDT1BZUklHSFQgSE9MREVSKFMpIE9SIEFVVEhPUihTKSBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJ
TSwgREFNQUdFUyBPUgotICogT1RIRVIgTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBP
RiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsCi0gKiBBUklTSU5HIEZST00sIE9VVCBPRiBP
UiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IKLSAqIE9USEVS
IERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KLSAqCi0gKi8KLQotI2lmbmRlZiBfX0FNREdQVV9U
TVpfSF9fCi0jZGVmaW5lIF9fQU1ER1BVX1RNWl9IX18KLQotI2luY2x1ZGUgImFtZGdwdS5oIgot
Ci0vKgotICogVHJ1c3QgbWVtb3J5IHpvbmUgc3R1ZmYKLSAqLwotc3RydWN0IGFtZGdwdV90bXog
ewotCWJvb2wJZW5hYmxlZDsKLX07Ci0KLQotZXh0ZXJuIGJvb2wgYW1kZ3B1X2lzX3RteihzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Ci0KLSNlbmRpZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjEwXzAuYwppbmRleCA5ZGUzZTk4MDFmOWEuLjkwNDIwYTA5M2MxZCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTQ3OTYsNyArNDc5Niw3IEBAIHN0YXRp
YyB2b2lkIGdmeF92MTBfMF9yaW5nX2VtaXRfdG16KHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywg
Ym9vbCBzdGFydCwKIAkgKiBjbWQgPSAxOiBmcmFtZSBlbmQKIAkgKi8KIAlhbWRncHVfcmluZ193
cml0ZShyaW5nLAotCQkJICAoKHJpbmctPmFkZXYtPnRtei5lbmFibGVkICYmIHRydXN0ZWQpID8g
RlJBTUVfVE1aIDogMCkKKwkJCSAgKChhbWRncHVfaXNfdG16KHJpbmctPmFkZXYpICYmIHRydXN0
ZWQpID8gRlJBTUVfVE1aIDogMCkKIAkJCSAgfCBGUkFNRV9DTUQoc3RhcnQgPyAwIDogMSkpOwog
fQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwppbmRleCA5ZjkwNDQ4MzQ5MmYu
LjM0NzMwZDJhNTRjYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCkBAIC01
MDc3LDcgKzUwNzcsNyBAQCBzdGF0aWMgdm9pZCBnZnhfdjlfMF9yaW5nX2VtaXRfdG16KHN0cnVj
dCBhbWRncHVfcmluZyAqcmluZywgYm9vbCBzdGFydCwKIAkgKiBjbWQgPSAxOiBmcmFtZSBlbmQK
IAkgKi8KIAlhbWRncHVfcmluZ193cml0ZShyaW5nLAotCQkJICAoKHJpbmctPmFkZXYtPnRtei5l
bmFibGVkICYmIHRydXN0ZWQpID8gRlJBTUVfVE1aIDogMCkKKwkJCSAgKChhbWRncHVfaXNfdG16
KHJpbmctPmFkZXYpICYmIHRydXN0ZWQpID8gRlJBTUVfVE1aIDogMCkKIAkJCSAgfCBGUkFNRV9D
TUQoc3RhcnQgPyAwIDogMSkpOwogfQogCi0tIAoyLjI0LjAuMTU1LmdkOWY2ZjNiNjE5CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
