Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBDDB896F
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Sep 2019 04:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020DE6F572;
	Fri, 20 Sep 2019 02:38:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690070.outbound.protection.outlook.com [40.107.69.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A796F572
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 02:38:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HT7YecN2MjONi51Zhnwow8sHSef+hjYfAwIXba8hGD1sx2DyX8nW+BwiBZc++ITobPlIuHs2RAr1P+0KDS6tOarDmqXrZVDjCTQsCaUQrC7isj5LTnqrduE7xNIv4RGQzzs4ctseIaZf+1FPfxwfCp2nmdu6cP6SGqMAu/BgNR7QLo9cq6jsI3m4P3KueXU+mLia3dc4rQWGhT/k3V8ec8+NGL1DZPvQPzYSs1Oo454HYiz2xKDLSs9ZlgpxOJrqx7mf02htKqwSmAAA8M/1dVXM+U9MruH4ookZtiNN4mEA98Ndso5Tvu8ZqIKLkt8tfYbRruZwWSxuJex8ZicfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8STWJriC28e8HytahL/xRfRrKstCfThG5XQXEUA6d8=;
 b=ciLomDWh9pCYsGC7ho/CNyGonQtMKq5/JWWmRcZWOK19k2lSGnfN85rGjorxmApeWFoWu81yZMVH//hu9Z496kaMe4i2wpQsQnaGMibfeyTzgWgmymf5Jg/GVuvK/ZTRR5dfi+buBrfdMNfzDrXqBgkJyQEkXMsME8DrAFVfuQUj+IxdhWfdGOAbm4KP4TRWbw6Qc8hb3jbzwdYNfSDXwLM63mkJWRgub1KeMaVgckm9vGqWsQDCACL+JqT290/NHNFbbrrgwZS9H9ZanSncCLFSir86IkqaotDEAO5xJZ2/8qYW5DgFHliHLpn+jVEUeAbAtxkoNrd/atc634ZtfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0022.namprd12.prod.outlook.com
 (2603:10b6:910:16::32) by MN2PR12MB3262.namprd12.prod.outlook.com
 (2603:10b6:208:102::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Fri, 20 Sep
 2019 02:38:35 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by CY4PR1201CA0022.outlook.office365.com
 (2603:10b6:910:16::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Fri, 20 Sep 2019 02:38:35 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Fri, 20 Sep 2019 02:38:34 +0000
Received: from Build-machine.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 19 Sep 2019 21:38:33 -0500
From: Jesse Zhang <zhexi.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v7] drm/amd/amdgpu:Fix compute ring unable to detect hang.
Date: Fri, 20 Sep 2019 10:38:29 +0800
Message-ID: <1568947109-5924-1-git-send-email-zhexi.zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568880041-19830-1-git-send-email-zhexi.zhang@amd.com>
References: <1568880041-19830-1-git-send-email-zhexi.zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(428003)(199004)(189003)(2351001)(6916009)(53416004)(76176011)(51416003)(7696005)(70586007)(70206006)(14444005)(356004)(86362001)(6666004)(48376002)(26005)(186003)(5660300002)(446003)(16586007)(476003)(2906002)(11346002)(4326008)(2616005)(426003)(336012)(126002)(81166006)(47776003)(316002)(81156014)(8936002)(305945005)(50226002)(8676002)(50466002)(36756003)(486006)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3262; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55f7184a-c5ea-4fab-0d21-08d73d73a225
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MN2PR12MB3262; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3262:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3262C1532C6C745A2959E43DEF880@MN2PR12MB3262.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0166B75B74
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: CWFnYn8Yn27r21d/u2Tc79Iny6jXUq8CdryntQSsOQDGn1FXl5OT7cK0J7VvjHsfedk0UE37+LtIKh8tfXNCB4gebfPiZj+Sd2+FGPtKsZPan/QBSQD8K41CEOFVfjeHHIjZ1y7+l57xqnWFLX5lb3Iwljyx/q3EC1asmJ7RksoSYJWKaNkNAsa84YHCJ1ZJK3S1sDSW0kJvngPhR20nZkMCNST26yMZLdQ7qMcGEWGju7EYuAWUIpgZrlnVAX/b/yxLSvKa/ZMXuT2BWVyDpa2QtR5lvYKJiBEmDNYCgsY59bGENXTq4E03EPPbi5mHgaBEkDkJbhGzcqW8/pbauNO5689nfSwYFxhPlXWQPI4o/pDp2+41r3DeN6UunNEWFBpDOjc4tUjdNzNsrbOtuQDHZHwKi6upcVQn50pVDpc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2019 02:38:34.5543 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f7184a-c5ea-4fab-0d21-08d73d73a225
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3262
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8STWJriC28e8HytahL/xRfRrKstCfThG5XQXEUA6d8=;
 b=tQqSxNhjPFwnDnPaMaUx/wMnfq0hNUiW/1wiH9rVhTy24it6ofjwJ4T8q8837FuwZrgv0qNyiwm6mmWxoBI5+IxnlIWgWdE+JvmB+VpnkdJP4j3EfOyQQPNAUAdOHZGtKdtIp733oBN1p10/2Gyh4caMCYKlVZdZd84oUdxA9dI=
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
Cc: Jesse Zhang <zhexi.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hlbiBjb21wdXRlIGZlbmNlIGRpZCBub3Qgc2lnbmFsLCBjb21wdXRlIHJpbmcgY2Fubm90IGRl
dGVjdCBoYXJkd2FyZSBoYW5nCmJlY2F1c2UgaXRzIHRpbWVvdXQgdmFsdWUgaXMgc2V0IHRvIGJl
IGluZmluaXRlIGJ5IGRlZmF1bHQuCgpJbiBTUi1JT1YgYW5kIHBhc3N0aHJvdWdoIG1vZGUsIGlm
IHVzZXIgZG9lcyBub3QgZGVjbGFyZSBjdXN0b21lIHRpbWVvdXQKdmFsdWUgZm9yIGNvbXB1dGUg
cmluZywgdGhlbiB1c2UgZ2Z4IHJpbmcgdGltZW91dCB2YWx1ZSBhcyBkZWZhdWx0LiBTbwp0aGF0
IHdoZW4gdGhlcmUgaXMgYSB0dXJlIGhhcmR3YXJlIGhhbmcsIGNvbXB1dGUgcmluZyBjYW4gZGV0
ZWN0IGl0LgoKQ2hhbmdlLUlkOiBJNzk0ZWMwODY4YzZjMGFhZDQwNzc0OTQ1NzI2MGVjZmVlMDYx
N2MxMApTaWduZWQtb2ZmLWJ5OiBKZXNzZSBaaGFuZyA8emhleGkuemhhbmdAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAxMiArKysrKyst
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyAgICB8ICA0ICsr
Ky0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jICB8IDEzICstLS0t
LS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IDNi
NTI4MmIuLjAzYWM1YTFkYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYwpAQCAtMTAyNCwxMiArMTAyNCw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9j
aGVja19hcmd1bWVudHMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAKIAlhbWRncHVfZGV2
aWNlX2NoZWNrX2Jsb2NrX3NpemUoYWRldik7CiAKLQlyZXQgPSBhbWRncHVfZGV2aWNlX2dldF9q
b2JfdGltZW91dF9zZXR0aW5ncyhhZGV2KTsKLQlpZiAocmV0KSB7Ci0JCWRldl9lcnIoYWRldi0+
ZGV2LCAiaW52YWxpZCBsb2NrdXBfdGltZW91dCBwYXJhbWV0ZXIgc3ludGF4XG4iKTsKLQkJcmV0
dXJuIHJldDsKLQl9Ci0KIAlhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPSBhbWRncHVfdWNvZGVf
Z2V0X2xvYWRfdHlwZShhZGV2LCBhbWRncHVfZndfbG9hZF90eXBlKTsKIAogCXJldHVybiByZXQ7
CkBAIC0yNzMyLDYgKzI3MjYsMTIgQEAgaW50IGFtZGdwdV9kZXZpY2VfaW5pdChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKIAlpZiAocikKIAkJcmV0dXJuIHI7CiAKKwlyID0gYW1kZ3B1X2Rl
dmljZV9nZXRfam9iX3RpbWVvdXRfc2V0dGluZ3MoYWRldik7CisJaWYgKHIpIHsKKwkJZGV2X2Vy
cihhZGV2LT5kZXYsICJpbnZhbGlkIGxvY2t1cF90aW1lb3V0IHBhcmFtZXRlciBzeW50YXhcbiIp
OworCQlyZXR1cm4gcjsKKwl9CisKIAkvKiBkb29yYmVsbCBiYXIgbWFwcGluZyBhbmQgZG9vcmJl
bGwgaW5kZXggaW5pdCovCiAJYW1kZ3B1X2RldmljZV9kb29yYmVsbF9pbml0KGFkZXYpOwogCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5kZXggNDIwODg4ZS4uMTIzNjI0
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwpAQCAtMTM3OCwxMCAr
MTM3OCwxMiBAQCBpbnQgYW1kZ3B1X2RldmljZV9nZXRfam9iX3RpbWVvdXRfc2V0dGluZ3Moc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCX0KIAkJLyoKIAkJICogVGhlcmUgaXMgb25seSBv
bmUgdmFsdWUgc3BlY2lmaWVkIGFuZAotCQkgKiBpdCBzaG91bGQgYXBwbHkgdG8gYWxsIG5vbi1j
b21wdXRlIGpvYnMuCisJCSAqIGl0IHNob3VsZCBhcHBseSB0byBhbGwgam9icy4KIAkJICovCiAJ
CWlmIChpbmRleCA9PSAxKQogCQkJYWRldi0+c2RtYV90aW1lb3V0ID0gYWRldi0+dmlkZW9fdGlt
ZW91dCA9IGFkZXYtPmdmeF90aW1lb3V0OworCQkJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSB8
fCBhbWRncHVfcGFzc3Rocm91Z2goYWRldikpCisJCQkJYWRldi0+Y29tcHV0ZV90aW1lb3V0ID0g
YWRldi0+Z2Z4X3RpbWVvdXQ7CiAJfQogCiAJcmV0dXJuIHJldDsKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMKaW5kZXggY2JjYWE3Yy4uOWVmNTNjYSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMKQEAgLTQ2MCwxOCArNDYwLDcgQEAg
aW50IGFtZGdwdV9mZW5jZV9kcml2ZXJfaW5pdF9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmlu
ZywKIAkJCXRpbWVvdXQgPSBhZGV2LT5nZnhfdGltZW91dDsKIAkJCWJyZWFrOwogCQljYXNlIEFN
REdQVV9SSU5HX1RZUEVfQ09NUFVURToKLQkJCS8qCi0JCQkgKiBGb3Igbm9uLXNyaW92IGNhc2Us
IG5vIHRpbWVvdXQgZW5mb3JjZQotCQkJICogb24gY29tcHV0ZSByaW5nIGJ5IGRlZmF1bHQuIFVu
bGVzcyB1c2VyCi0JCQkgKiBzcGVjaWZpZXMgYSB0aW1lb3V0IGZvciBjb21wdXRlIHJpbmcuCi0J
CQkgKgotCQkJICogRm9yIHNyaW92IGNhc2UsIGFsd2F5cyB1c2UgdGhlIHRpbWVvdXQKLQkJCSAq
IGFzIGdmeCByaW5nCi0JCQkgKi8KLQkJCWlmICghYW1kZ3B1X3NyaW92X3ZmKHJpbmctPmFkZXYp
KQotCQkJCXRpbWVvdXQgPSBhZGV2LT5jb21wdXRlX3RpbWVvdXQ7Ci0JCQllbHNlCi0JCQkJdGlt
ZW91dCA9IGFkZXYtPmdmeF90aW1lb3V0OworCQkJdGltZW91dCA9IGFkZXYtPmNvbXB1dGVfdGlt
ZW91dDsKIAkJCWJyZWFrOwogCQljYXNlIEFNREdQVV9SSU5HX1RZUEVfU0RNQToKIAkJCXRpbWVv
dXQgPSBhZGV2LT5zZG1hX3RpbWVvdXQ7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
