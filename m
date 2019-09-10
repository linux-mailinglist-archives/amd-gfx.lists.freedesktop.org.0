Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A686CAE1DD
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 03:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A14789C89;
	Tue, 10 Sep 2019 01:18:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710045.outbound.protection.outlook.com [40.107.71.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1383C89C89
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 01:18:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5I60lvNR/MsPizD7pdiU2UqXzj98VFI5OWzp43gbLLl1pN2z4bgxssmLAxSt5mi7nF4mva+2h/NxWXp+IukdkXD7vpYVujY4OraIeNSHjV184VXM5mykf3Qdqm7hsjegwpyMzAjzg5XwAaDpwX3/XOKMmw9p5PUIjNU42hxYoXeECeiNhm/RpUQXrrXMxEz4abvPfC/dUZLwMamWExRCDY4d74U2GPDRpTSdMUkdeuyGnan/agmfs0yE7k2Qt2TwRuHe24gROZTZeZwuApl5b86DtoY8kaoirG9CrvmmPkDbMehkZ39X9DtpduScUJMTQ6kBnOYWp40MoCha5Pr3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pz9QRwQkaRTaYaVYDaGQHURyXHr+B0Rh8ctoQZ6hMic=;
 b=FguxY4x+A074jBnIoSr/vqM9or6Zc8Y0wQPKVN4pKy9C3LBpqcxJB77qu1XsYlueVXsWqTT0ArtyqybMHIr/z3TchrVcO3v8UF2d9StLZxu6ceQmRiKHrTQwiEcwFxtfd/39MASUUuWoFdHqvus6ssyFWjaCgnW+OpexBchNInk7C3kQyLIydTvNCpT2CG+VdBUpdtDH9brJ85KC0bgtmZyVIhc19SXjtEeaYj3ZE6xuZ+8dGPFXnONs4CFiVekbapXe6cyurkjGN/Xb6Lg8lHZyrEEn7ezJgPHVNMncjNTRAGkwMxC25pfkp5T6t/uk2XTeZiug7fATkxZQSZFUwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB2997.namprd12.prod.outlook.com (20.178.53.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Tue, 10 Sep 2019 01:17:56 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2241.014; Tue, 10 Sep 2019
 01:17:56 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amdgpu: Add amdgpu_ras_eeprom_reset_table
Thread-Topic: [PATCH 1/2] drm/amdgpu: Add amdgpu_ras_eeprom_reset_table
Thread-Index: AQHVZ0nRMSY0E7sjFEKhxU2k5R1OFackHHKg
Date: Tue, 10 Sep 2019 01:17:55 +0000
Message-ID: <BYAPR12MB2806CBEE5282285AFD88E4AAF1B60@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <1568059469-29450-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1568059469-29450-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e3c714f-c0b0-4a5f-1565-08d7358cb5f0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2997; 
x-ms-traffictypediagnostic: BYAPR12MB2997:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2997662B2B2A84C91893FF87F1B60@BYAPR12MB2997.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(13464003)(199004)(189003)(110136005)(14444005)(54906003)(53936002)(53546011)(25786009)(6506007)(478600001)(74316002)(3846002)(6116002)(229853002)(102836004)(316002)(7736002)(305945005)(55016002)(76116006)(9686003)(186003)(2501003)(14454004)(33656002)(26005)(6436002)(8676002)(81166006)(81156014)(8936002)(11346002)(446003)(99286004)(2906002)(86362001)(52536014)(4326008)(66476007)(66946007)(64756008)(66066001)(66556008)(476003)(66446008)(5660300002)(486006)(256004)(71200400001)(7696005)(76176011)(6246003)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2997;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5F4TsA8P40N5O5u3vWEEngR5c03GNckAWeAPZdPf/d85HmLdHuIwuU896Tvuz9/2f97Di8/Rc52E84shHA7Gjr0WMfbLAMpYy7tW0Y9FczX1WEzaVpP++pn86iUiahTmEVHCSQcMCdP9EBLsUTDSO9Daq8W25bRRA3igIHp6c/utC+iy77aKPXzEmBxxQbaNcnfZfPLzTbeaqpWCy0HWb0vvTrxwFdSVZKXWoVixDkemBe2/SH6hTXw0bZ4+o3ubb2JUu6HTiMz592Qj0jbHpu5LEY1NwstxtazgBszpl3S+DhZJA5ORcXDgjX6AZyfpMtFRtSNp63PvW5c+v8liA0eT02nS0ttR4axrZeSAH02QSw0ScibrCl+vCMTaX1Zcf9EmiuLkcGQwFxuRw0TLY34DQt/jLN3jljnGHX/R5Mc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3c714f-c0b0-4a5f-1565-08d7358cb5f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 01:17:55.8439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: txIBDRPTXaKAhL5lgByOoQdPbTGZNLAiJ1kW2A3brGyBkPy4kGsgy8rWXabrj8Eu5Sjz1ZBNK7yEUhSDqK8ang==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2997
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pz9QRwQkaRTaYaVYDaGQHURyXHr+B0Rh8ctoQZ6hMic=;
 b=C3vzwjCSh6lUrNKWjrW0QhQYoYIuFskdgrnqTfsgPoXyHhBqWLycv7OGgYYX50YcVrT1Gr/3Gapr2XoS1o63hCfBWyaFYmfaEj+ibMNGykh/qxAcZLJ9deZVj/kdvM1FPgkTZK9CZXPct8qHooSIoERrSfHLAP6XSAfZIC9gcbA=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzOiBSZXZpZXdlZC1ieTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVuQGFtZC5jb20+
CgpSZWdhcmRzLApHdWNodW4KCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCkZyb206IEFuZHJl
eSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPiAKU2VudDogVHVlc2RheSwg
U2VwdGVtYmVyIDEwLCAyMDE5IDQ6MDQgQU0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBaaG91MSwgVGFvIDxU
YW8uWmhvdTFAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJA
YW1kLmNvbT47IEdyb2R6b3Zza3ksIEFuZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT4K
U3ViamVjdDogW1BBVENIIDEvMl0gZHJtL2FtZGdwdTogQWRkIGFtZGdwdV9yYXNfZWVwcm9tX3Jl
c2V0X3RhYmxlCgpUaGlzIHdpbGwgYWxsb3cgdG8gcmVzZXQgdGhlIHRhYmxlIG9uIHRoZSBmbHku
CgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5j
IHwgMjUgKysrKysrKysrKysrKysrKystLS0tLS0tLSAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhc19lZXByb20uaCB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Jhc19lZXByb20uYwppbmRleCA0M2RkNGFiLi4xMWE4NDQ1IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMKQEAgLTEwMiw2ICsxMDIs
MjIgQEAgc3RhdGljIGludCBfX3VwZGF0ZV90YWJsZV9oZWFkZXIoc3RydWN0IGFtZGdwdV9yYXNf
ZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2wsCiAKIHN0YXRpYyB1aW50MzJfdCAgX19jYWxjX2hkcl9i
eXRlX3N1bShzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCk7CiAKK2lu
dCBhbWRncHVfcmFzX2VlcHJvbV9yZXNldF90YWJsZShzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21f
Y29udHJvbCAKKypjb250cm9sKSB7CisJdW5zaWduZWQgY2hhciBidWZmW0VFUFJPTV9BRERSRVNT
X1NJWkUgKyBFRVBST01fVEFCTEVfSEVBREVSX1NJWkVdID0geyAwIH07CisJc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYgPSB0b19hbWRncHVfZGV2aWNlKGNvbnRyb2wpOworCXN0cnVjdCBhbWRn
cHVfcmFzX2VlcHJvbV90YWJsZV9oZWFkZXIgKmhkciA9ICZjb250cm9sLT50YmxfaGRyOworCisJ
aGRyLT5oZWFkZXIgPSBFRVBST01fVEFCTEVfSERSX1ZBTDsKKwloZHItPnZlcnNpb24gPSBFRVBS
T01fVEFCTEVfVkVSOworCWhkci0+Zmlyc3RfcmVjX29mZnNldCA9IEVFUFJPTV9SRUNPUkRfU1RB
UlQ7CisJaGRyLT50Ymxfc2l6ZSA9IEVFUFJPTV9UQUJMRV9IRUFERVJfU0laRTsKKworCWFkZXYt
PnBzcC5yYXMucmFzLT5lZXByb21fY29udHJvbC50YmxfYnl0ZV9zdW0gPQorCQkJX19jYWxjX2hk
cl9ieXRlX3N1bSgmYWRldi0+cHNwLnJhcy5yYXMtPmVlcHJvbV9jb250cm9sKTsKKwlyZXR1cm4g
X191cGRhdGVfdGFibGVfaGVhZGVyKGNvbnRyb2wsIGJ1ZmYpOyB9CisKIGludCBhbWRncHVfcmFz
X2VlcHJvbV9pbml0KHN0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250cm9sICpjb250cm9sKSAg
ewogCWludCByZXQgPSAwOwpAQCAtMTQ5LDE0ICsxNjUsNyBAQCBpbnQgYW1kZ3B1X3Jhc19lZXBy
b21faW5pdChzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCkKIAl9IGVs
c2UgewogCQlEUk1fSU5GTygiQ3JlYXRpbmcgbmV3IEVFUFJPTSB0YWJsZSIpOwogCi0JCWhkci0+
aGVhZGVyID0gRUVQUk9NX1RBQkxFX0hEUl9WQUw7Ci0JCWhkci0+dmVyc2lvbiA9IEVFUFJPTV9U
QUJMRV9WRVI7Ci0JCWhkci0+Zmlyc3RfcmVjX29mZnNldCA9IEVFUFJPTV9SRUNPUkRfU1RBUlQ7
Ci0JCWhkci0+dGJsX3NpemUgPSBFRVBST01fVEFCTEVfSEVBREVSX1NJWkU7Ci0KLQkJYWRldi0+
cHNwLnJhcy5yYXMtPmVlcHJvbV9jb250cm9sLnRibF9ieXRlX3N1bSA9Ci0JCQkJX19jYWxjX2hk
cl9ieXRlX3N1bSgmYWRldi0+cHNwLnJhcy5yYXMtPmVlcHJvbV9jb250cm9sKTsKLQkJcmV0ID0g
X191cGRhdGVfdGFibGVfaGVhZGVyKGNvbnRyb2wsIGJ1ZmYpOworCQlyZXQgPSBhbWRncHVfcmFz
X2VlcHJvbV9yZXNldF90YWJsZShjb250cm9sKTsKIAl9CiAKIAkvKiBTdGFydCBpbnNlcnRpbmcg
cmVjb3JkcyBmcm9tIGhlcmUgKi8gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXNfZWVwcm9tLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzX2VlcHJvbS5oCmluZGV4IDQxZjNmY2IuLjYyMjI2OTkgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uaApAQCAtNzksNiArNzksNyBAQCBz
dHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCB7CiAKIGludCBhbWRncHVfcmFzX2VlcHJvbV9pbml0
KHN0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250cm9sICpjb250cm9sKTsgIHZvaWQgYW1kZ3B1
X3Jhc19lZXByb21fZmluaShzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJv
bCk7CitpbnQgYW1kZ3B1X3Jhc19lZXByb21fcmVzZXRfdGFibGUoc3RydWN0IGFtZGdwdV9yYXNf
ZWVwcm9tX2NvbnRyb2wgCisqY29udHJvbCk7CiAKIGludCBhbWRncHVfcmFzX2VlcHJvbV9wcm9j
ZXNzX3JlY29kcyhzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCwKIAkJ
CQkJICAgIHN0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkICpyZWNvcmRzLAotLQoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
