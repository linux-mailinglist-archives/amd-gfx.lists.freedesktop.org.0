Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAF96AD77
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 19:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D26A6E15C;
	Tue, 16 Jul 2019 17:12:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750073.outbound.protection.outlook.com [40.107.75.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544686E15C
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 17:12:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqrOOPQSvUGm9nb2szVLswGtG2QubNB3nI2J+DiLAqwWWAk+TP5QIQH1flPR6PPtR8ClvjfmQxTboF3Rnkd0ofSDaER5f4NHkCZjGGvywYbQph7BP1f0TrxqBFTDrn1IVEEnBiLswSWsQDY6wMQDnCXv3GifMVygSYnkXrEaysEbzl0PMdH1LAJMZp7aFKfGVhoOP4R01AI1x4P3XrPJx9D8cZfbVCKdE4lTOTzs9qGQv5Qgn7twCDuHb0lQ0QeMqqUJL9bC6l4hI72RAC1ROVg0Mcpd6KJKLgqlbClXykhas157bSvQqm0JdoIgVAXwnDAHZVoxfj5qYdy1yGWzuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZYJCuXc2pBzEhVpIOfO1zJwp3c13fVCvG9iUakQKzA=;
 b=MTHgoBQNrcUGxi1Epw5w1WRjfj8SNuLr9mLBenLqvlSbnERlnGz8nIlqAf7TUeBfvxFMQKJalZO+DXAcV4fk8WcvInCkI9miOSsmNHQNfzRZdDfbkHrl+lKNiV/SIhBhb5W7/mshEf2vVuR7fesgXyqDsxKg3eCpGioaeEnTQLS8a5SThaf3tq8aWScn2pNqFD5ioZheogK9zZ2LGvOiJfCwmCWi3bYFgfKR9phdP+b3NJnzCHZxWbLSasgG+nmlhO9D87T6b+fAgqgA6bcd58OnjxbP64NV1rtF0pLOjN2BYsGzgNv8oI4xylKNmP6BfC1qBa0Ol0CcZ18Iomtyvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB3782.namprd12.prod.outlook.com (52.132.245.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 17:12:05 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::6c10:a243:58ee:29e2]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::6c10:a243:58ee:29e2%4]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 17:12:05 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] drm/amdgpu: adding xgmi error monitoring
Thread-Topic: [PATCH 3/3] drm/amdgpu: adding xgmi error monitoring
Thread-Index: AQHVO/kflRXBCjvvDUequEiOzw6+56bNezIQ
Date: Tue, 16 Jul 2019 17:12:04 +0000
Message-ID: <CH2PR12MB3831ACCA7B895EB9A604F99385CE0@CH2PR12MB3831.namprd12.prod.outlook.com>
References: <20190716170825.97385-1-jonathan.kim@amd.com>
 <20190716170825.97385-2-jonathan.kim@amd.com>
In-Reply-To: <20190716170825.97385-2-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8096c0eb-352a-45ed-5f02-08d70a10b9de
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3782; 
x-ms-traffictypediagnostic: CH2PR12MB3782:
x-microsoft-antispam-prvs: <CH2PR12MB3782EC102756A84D89D199E585CE0@CH2PR12MB3782.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(199004)(13464003)(189003)(316002)(66446008)(99286004)(71200400001)(71190400001)(86362001)(8936002)(81166006)(81156014)(55016002)(5660300002)(478600001)(52536014)(53936002)(25786009)(305945005)(64756008)(68736007)(9686003)(7736002)(6246003)(66066001)(446003)(229853002)(2906002)(14454004)(486006)(5640700003)(2351001)(2501003)(476003)(6916009)(11346002)(33656002)(8676002)(66556008)(66476007)(76116006)(26005)(186003)(66946007)(3846002)(6116002)(74316002)(6436002)(102836004)(53546011)(6506007)(76176011)(256004)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3782;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: r29GgDgSmhk26bxm7Lbja/kSLwiHgvbyXWVPB8uBwwdqSbwaIHgMvg3oMjFFfkv0J1SH28f3ZI4UPj3vrVRIiCY2rP+3o0MBhWiLbtH4c8ZRZquh0GBml+1g5g3wUFGarlwMYY9VtzdRuw2pHtUniRaWGYIFqry/DIPlnrBxcXR3h4R9qbEVAOLzO5Q2LnnvAPDaY0XewP250SRTaqhOwZiyCA/nWi3tUOo0V9ILbDQevliCUVkemdR3FIMAqttS8eVod9p2QbnuBSRyqqIhO6TL03rQEn8JdTjvd98A3yP2XrVVV2aMLt/hM4WszAi/2p2EY5MSf2/Vh844liaMZb7zFEV4y8evLXIQbCf19poc4UPnZsCZum6htXanxShPslEnfy3T+bEM+06vyIOy/FkFkJGeQlVjgvZLWOyQ7Pg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8096c0eb-352a-45ed-5f02-08d70a10b9de
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 17:12:04.9008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jokim@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3782
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZYJCuXc2pBzEhVpIOfO1zJwp3c13fVCvG9iUakQKzA=;
 b=t2sX170abCe3xX71uwIXIUqG05yh+/BiFAeuBiJgBrqE5/FTLY0CNymRV8Qsed6xLdjm6Kc8/bKodYME5Lu1l+hjLF7iCQWd7/Id1fmzY2ArMMowAv6gGr3CFo7q0jjhCbTS+JBNnAxhwpEXH2xzRDpL8/UaSjv7vQkqMIwurf4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jonathan.Kim@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Tm90ZSBwYXRjaCAxIHNlbnQgdG8gaW50ZXJuYWwgYW1kIG1haWxpbmcgbGlzdCBmb3IgcmV2aWV3
LgoKLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogS2ltLCBKb25hdGhhbiA8Sm9uYXRo
YW4uS2ltQGFtZC5jb20+IApTZW50OiBUdWVzZGF5LCBKdWx5IDE2LCAyMDE5IDE6MDkgUE0KVG86
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBLaW0sIEpvbmF0aGFuIDxKb25hdGhh
bi5LaW1AYW1kLmNvbT47IEtpbSwgSm9uYXRoYW4gPEpvbmF0aGFuLktpbUBhbWQuY29tPgpTdWJq
ZWN0OiBbUEFUQ0ggMy8zXSBkcm0vYW1kZ3B1OiBhZGRpbmcgeGdtaSBlcnJvciBtb25pdG9yaW5n
Cgptb25pdG9yIHhnbWkgZXJyb3JzIHZpYSBtYyBwaWUgc3RhdHVzIHRocm91Z2ggZmljYSByZWdp
c3RlcnMuCgpDaGFuZ2UtSWQ6IElkODBiNmMyZjYzNWEyOTRhZmUzNDNjZjU1YTAzOTAyZTlhMTc4
N2E1ClNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIEtpbSA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYyB8IDM4ICsrKysrKysr
KysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3hnbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMKaW5kZXgg
ZDExZWJhMDllYWRkLi40Yjg3ZmRhMTVhYzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3hnbWkuYwpAQCAtMjUsNyArMjUsNyBAQAogI2luY2x1ZGUgImFtZGdwdS5oIgogI2lu
Y2x1ZGUgImFtZGdwdV94Z21pLmgiCiAjaW5jbHVkZSAiYW1kZ3B1X3NtdS5oIgotCisjaW5jbHVk
ZSAiZGYvZGZfM182X29mZnNldC5oIgogCiBzdGF0aWMgREVGSU5FX01VVEVYKHhnbWlfbXV0ZXgp
OwogCkBAIC0xMzEsOSArMTMxLDM3IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV94Z21pX3Nob3df
ZGV2aWNlX2lkKHN0cnVjdCBkZXZpY2UgKmRldiwKIAogfQogCisjZGVmaW5lIEFNREdQVV9YR01J
X1NFVF9GSUNBQShvKQkoKG8pIHwgMHg0NTY4MDEpCitzdGF0aWMgc3NpemVfdCBhbWRncHVfeGdt
aV9zaG93X2Vycm9yKHN0cnVjdCBkZXZpY2UgKmRldiwKKwkJCQkgICAgICBzdHJ1Y3QgZGV2aWNl
X2F0dHJpYnV0ZSAqYXR0ciwKKwkJCQkgICAgICBjaGFyICpidWYpCit7CisJc3RydWN0IGRybV9k
ZXZpY2UgKmRkZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKKwlzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiA9IGRkZXYtPmRldl9wcml2YXRlOworCXVpbnQzMl90IGZpY2FhX3BpZV9jdGxfaW4s
IGZpY2FhX3BpZV9zdGF0dXNfaW47CisJdWludDY0X3QgZmljYV9vdXQ7CisJdW5zaWduZWQgaW50
IGVycm9yX2NvdW50ID0gMDsKKworCWZpY2FhX3BpZV9jdGxfaW4gPSBBTURHUFVfWEdNSV9TRVRf
RklDQUEoMHgyMDApOworCWZpY2FhX3BpZV9zdGF0dXNfaW4gPSBBTURHUFVfWEdNSV9TRVRfRklD
QUEoMHgyMDgpOwogCi1zdGF0aWMgREVWSUNFX0FUVFIoeGdtaV9kZXZpY2VfaWQsIFNfSVJVR08s
IGFtZGdwdV94Z21pX3Nob3dfZGV2aWNlX2lkLCBOVUxMKTsKKwlmaWNhX291dCA9IGFkZXYtPmRm
X2Z1bmNzLT5nZXRfZmljYShhZGV2LCBmaWNhYV9waWVfY3RsX2luKTsKKwlpZiAoZmljYV9vdXQg
IT0gMHgxZikKKwkJcHJfZXJyKCJ4R01JIGVycm9yIGNvdW50ZXJzIG5vdCBlbmFibGVkIVxuIik7
CisKKwlmaWNhX291dCA9IGFkZXYtPmRmX2Z1bmNzLT5nZXRfZmljYShhZGV2LCBmaWNhYV9waWVf
c3RhdHVzX2luKTsKKworCWlmICgoZmljYV9vdXQgJiAweGZmZmYpID09IDIpCisJCWVycm9yX2Nv
dW50ID0gKChmaWNhX291dCA+PiA2MikgJiAweDEpICsgKGZpY2Ffb3V0ID4+IDYzKTsKIAorCWFk
ZXYtPmRmX2Z1bmNzLT5zZXRfZmljYShhZGV2LCBmaWNhYV9waWVfc3RhdHVzX2luLCAwLCAwKTsK
KworCXJldHVybiBzbnByaW50ZihidWYsIFBBR0VfU0laRSwgIiVkXG4iLCBlcnJvcl9jb3VudCk7
IH0KKworCitzdGF0aWMgREVWSUNFX0FUVFIoeGdtaV9kZXZpY2VfaWQsIFNfSVJVR08sIGFtZGdw
dV94Z21pX3Nob3dfZGV2aWNlX2lkLCAKK05VTEwpOyBzdGF0aWMgREVWSUNFX0FUVFIoeGdtaV9l
cnJvciwgU19JUlVHTywgYW1kZ3B1X3hnbWlfc2hvd19lcnJvciwgCitOVUxMKTsKIAogc3RhdGlj
IGludCBhbWRncHVfeGdtaV9zeXNmc19hZGRfZGV2X2luZm8oc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCiAJCQkJCSBzdHJ1Y3QgYW1kZ3B1X2hpdmVfaW5mbyAqaGl2ZSkKQEAgLTE0OCw2ICsx
NzYsMTIgQEAgc3RhdGljIGludCBhbWRncHVfeGdtaV9zeXNmc19hZGRfZGV2X2luZm8oc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCXJldHVybiByZXQ7CiAJfQogCisJLyogQ3JlYXRlIHhn
bWkgZXJyb3IgZmlsZSAqLworCXJldCA9IGRldmljZV9jcmVhdGVfZmlsZShhZGV2LT5kZXYsICZk
ZXZfYXR0cl94Z21pX2Vycm9yKTsKKwlpZiAocmV0KQorCQlwcl9lcnIoImZhaWxlZCB0byBjcmVh
dGUgeGdtaV9lcnJvclxuIik7CisKKwogCS8qIENyZWF0ZSBzeXNmcyBsaW5rIHRvIGhpdmUgaW5m
byBmb2xkZXIgb24gdGhlIGZpcnN0IGRldmljZSAqLwogCWlmIChhZGV2ICE9IGhpdmUtPmFkZXYp
IHsKIAkJcmV0ID0gc3lzZnNfY3JlYXRlX2xpbmsoJmFkZXYtPmRldi0+a29iaiwgaGl2ZS0+a29i
aiwKLS0KMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
