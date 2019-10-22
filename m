Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26612DFC43
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 05:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE116E3B5;
	Tue, 22 Oct 2019 03:43:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780088.outbound.protection.outlook.com [40.107.78.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8AB6E3B5
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 03:43:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWBJl1fZKfyOhM2aR8HEKlsHIv67EDtEtpx0zYe5qEJuTZNqfOuUsEdfcvS0yEo3mQ1vIu37hAryUKUYTFmK0BcAoJF2SyMDwtlnRhuuD7LV21hYgpWWGmIa0MUumYJMyFumLd7BQSOJtHVmzfG1jBDB3jJoLQCgC5UZYCWQ0j2YSgl5k3DDyu+gUplZDuJXyzag6hXcx6pCXNPXympaXKGBdBY4WW+vT5mE2BM9XrAvXIMUV3ciEHxwWVWS+RaDjiZcjukPhO4HCzSJvEeslmtQwj2rmUzt2QCvLPa/ECO6v+vWs7eU2Lv+wUyj6Ivo0h6tYfZidly32CNhPbsGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/bsyIDCpuPgK44ndAKnxTfwK7+fd7X/jIreoxOIy6M=;
 b=YFyMrcaZ3aEMXQGz3KnOoBxxizC9JP3W1Fus7FQaEIjjWQMfqjo2umKD3prBm2i/4Zw9VzHWPsnmg5uLMXsw7FZkpcprdv/O9A7njd4ntWyM8u5vgsSmxAPNLGWxQebwE+qSFcqQOt7Kbd7gN/O1aZipo4fWNB4NHRkqfaa5qUYmlQMcqcogXCPxjw6wu5XHYfJq9u9+1NEXcE34uek1+kmT/pgrn88EdCm9w3NeAcQ3PEHEsCM5hS4pBbbfaDI946gUlhZOF4Z17Ki4wP0Hms+A963AhhfhglLx3xkPUIPh0AyBBeFf5eUg5nNtvbDxTFiOXWTRpWPInC18qM7SeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB2728.namprd12.prod.outlook.com (20.177.125.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 22 Oct 2019 03:43:17 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::cd:2613:ee29:5acb]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::cd:2613:ee29:5acb%7]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 03:43:17 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Zhou1, Tao"
 <Tao.Zhou1@amd.com>
Subject: [PATCH] drm/amdgpu: define macros for retire page reservation
Thread-Topic: [PATCH] drm/amdgpu: define macros for retire page reservation
Thread-Index: AQHViIrX0lOx6dcy6EyYgsJ+qBQV6g==
Date: Tue, 22 Oct 2019 03:43:17 +0000
Message-ID: <20191022034256.30266-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0172.apcprd02.prod.outlook.com
 (2603:1096:201:1f::32) To BYAPR12MB2806.namprd12.prod.outlook.com
 (2603:10b6:a03:70::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d86a1e4a-8b19-400e-418e-08d756a1f981
x-ms-traffictypediagnostic: BYAPR12MB2728:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB27281F6C7AE1BB7D4A7B828FF1680@BYAPR12MB2728.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:741;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(199004)(189003)(6512007)(6636002)(1076003)(6436002)(25786009)(2906002)(6486002)(102836004)(66066001)(486006)(26005)(4326008)(476003)(5660300002)(2616005)(186003)(36756003)(2501003)(256004)(66446008)(64756008)(66556008)(66476007)(14444005)(8676002)(71200400001)(71190400001)(99286004)(50226002)(52116002)(66946007)(3846002)(6116002)(86362001)(316002)(305945005)(81156014)(110136005)(8936002)(81166006)(7736002)(6506007)(478600001)(14454004)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2728;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2nn1uEOod6DPmJijOoauUfBA5pB2qHd9n8X2sk7MnFT7ogrbDU8trzM5IUpGzUxFbCdcxPrq+EvBGOtHp5rdz5GByDT+RlmXHpnuEyMaiRIs4/DxyzocPWjN7y7XNr+JrN9e/qAlqYxIC9vcsennWAEwfaI61QqoZHs3zannsaZKZ9Ep/1YP/7aZzgGodNd9VPsHwcnu7CAajRxgCD/py8jmV5iEAyuHinxjvHada3Pf6SN7BngR5RaXhUTvgbrTwvKelCPDKVbhaynzR0uSn849OuqiVmVUR4A3b4+wF8gPh3r9GsxRfH8iOjcw1bQzECS2iryOXeWB4jApjsomhx7kw7Uat5IIK9OjHlEMf2whzNyRoln4KxpJGPbWisyHxOadmHvRBxyk64dprTQU5VtX+2xUbepDNyUkWAaRtK0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d86a1e4a-8b19-400e-418e-08d756a1f981
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 03:43:17.3614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G0WRHqFxIvw81WDGloTDdOdvUUc8qQ5vDerKiOiJ5IdluJBhYQzvxxpRWxyKsBrtUnhiGk0xWhEbfrp2uc5BSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2728
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/bsyIDCpuPgK44ndAKnxTfwK7+fd7X/jIreoxOIy6M=;
 b=god+Zkhx+eBn7J5NBA06fSLJxDaytHESIvlrQk1R4K/N2BpcL8SYCXjadlsbIlZUExQhQIbFFQwWyqefozP/vPo02jmq3ojTZwsarZCrdTj4RsiwEx8dGGa5dSb399p3hLDrpYX18+w+d7W5Di8K+McdU7DB5JFADXWe36wMFLI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RWFzeSBmb3IgbWFpbnRhaW5hbmNlLgoKU2lnbmVkLW9mZi1ieTogR3VjaHVuIENoZW4gPGd1Y2h1
bi5jaGVuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5jIHwgMTcgKysrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
YwppbmRleCAyZDllMTNkMmE3MWEuLjc5NjMyNmIzNmUwMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuYwpAQCAtNjgsNiArNjgsMTEgQEAgY29uc3QgY2hhciAqcmFzX2Js
b2NrX3N0cmluZ1tdID0gewogLyogaW5qZWN0IGFkZHJlc3MgaXMgNTIgYml0cyAqLwogI2RlZmlu
ZQlSQVNfVU1DX0lOSkVDVF9BRERSX0xJTUlUCSgweDFVTEwgPDwgNTIpCiAKK2VudW0gYW1kZ3B1
X3Jhc19yZXRpcmVfcGFnZV9yZXNlcnZhdGlvbiB7CisJQU1ER1BVX1JBU19SRVRJUkVfUEFHRV9S
RVNFUlZFRCwKKwlBTURHUFVfUkFTX1JFVElSRV9QQUdFX1BFTkRJTkcsCisJQU1ER1BVX1JBU19S
RVRJUkVfUEFHRV9GQVVMVCwKK307CiAKIGF0b21pY190IGFtZGdwdV9yYXNfaW5faW50ciA9IEFU
T01JQ19JTklUKDApOwogCkBAIC04MDksMTEgKzgxNCwxMSBAQCBzdGF0aWMgaW50IGFtZGdwdV9y
YXNfYmFkcGFnZXNfcmVhZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIHN0YXRpYyBjaGFy
ICphbWRncHVfcmFzX2JhZHBhZ2VfZmxhZ3Nfc3RyKHVuc2lnbmVkIGludCBmbGFncykKIHsKIAlz
d2l0Y2ggKGZsYWdzKSB7Ci0JY2FzZSAwOgorCWNhc2UgQU1ER1BVX1JBU19SRVRJUkVfUEFHRV9S
RVNFUlZFRDoKIAkJcmV0dXJuICJSIjsKLQljYXNlIDE6CisJY2FzZSBBTURHUFVfUkFTX1JFVElS
RV9QQUdFX1BFTkRJTkc6CiAJCXJldHVybiAiUCI7Ci0JY2FzZSAyOgorCWNhc2UgQU1ER1BVX1JB
U19SRVRJUkVfUEFHRV9GQVVMVDoKIAlkZWZhdWx0OgogCQlyZXR1cm4gIkYiOwogCX07CkBAIC0x
Mjk0LDEzICsxMjk5LDEzIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19iYWRwYWdlc19yZWFkKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkoKmJwcylbaV0gPSAoc3RydWN0IHJhc19iYWRw
YWdlKXsKIAkJCS5icCA9IGRhdGEtPmJwc1tpXS5yZXRpcmVkX3BhZ2UsCiAJCQkuc2l6ZSA9IEFN
REdQVV9HUFVfUEFHRV9TSVpFLAotCQkJLmZsYWdzID0gMCwKKwkJCS5mbGFncyA9IEFNREdQVV9S
QVNfUkVUSVJFX1BBR0VfUkVTRVJWRUQsCiAJCX07CiAKIAkJaWYgKGRhdGEtPmxhc3RfcmVzZXJ2
ZWQgPD0gaSkKLQkJCSgqYnBzKVtpXS5mbGFncyA9IDE7CisJCQkoKmJwcylbaV0uZmxhZ3MgPSBB
TURHUFVfUkFTX1JFVElSRV9QQUdFX1BFTkRJTkc7CiAJCWVsc2UgaWYgKGRhdGEtPmJwc19ib1tp
XSA9PSBOVUxMKQotCQkJKCpicHMpW2ldLmZsYWdzID0gMjsKKwkJCSgqYnBzKVtpXS5mbGFncyA9
IEFNREdQVV9SQVNfUkVUSVJFX1BBR0VfRkFVTFQ7CiAJfQogCiAJKmNvdW50ID0gZGF0YS0+Y291
bnQ7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
